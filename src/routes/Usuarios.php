<?php
use App\Models\Tweet;
use Slim\Http\Request;
use Slim\Http\Response;
use App\Models\Usuario;

$app->group('/api/v1', function(){

    $this->get('/usuarios/lista/{id_logado}/{nome}', function( Request $request, Response $response, $args){
        $idUsuario = $args['id_logado'];
        $nome = $args['nome'];
    
        $db = $this->get('db');
        $usuarios = $db->table('usuarios as u')
            ->select('u.id', 'u.nome', 'u.email')
            ->selectRaw('(
                SELECT COUNT(*)
                FROM usuarios_seguidores as us
                WHERE us.id_usuario = ? AND us.id_usuario_segindo = u.id
            ) as seguindo_sn', [$idUsuario])
            ->where('u.nome', 'like', "%$nome%")
            ->where('u.id', '!=', $idUsuario)
            ->get();
    
        $listaUsuarios = [];
        foreach ($usuarios as $usuario) {
            $listaUsuarios[] = [
                'id' => $usuario->id,
                'nome' => $usuario->nome,
                'email' => $usuario->email,
                'seguindo_sn' => $usuario->seguindo_sn,
            ];
        }
    
        return $response->withJson(['usuarios' => $listaUsuarios]);
    });
    

     $this->get('/usuarios/lista', function( Request $request, Response $response, $args){

            $usuario = Usuario::get();

            return $response->withJson( $usuario );
    });
});




