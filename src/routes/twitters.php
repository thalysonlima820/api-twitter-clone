<?php

use App\Models\Tweet;
use Slim\Http\Request;
use Slim\Http\Response;
use App\Models\Twitter;

// Rotas para twitter
$app->group('/api/v1', function(){
	
	// LISTA DE POST

    $this->get('/tweets/{id_logado}', function($request, $response, $args) {
        
        $idUsuario = $args['id_logado'];
        $db = $this->get('db');
        
        $tweets = $db->table('tweets as t')
            ->select('t.id', 't.id_usuario', 'u.nome', 't.tweet')
            ->selectRaw("DATE_FORMAT(t.data, '%d/%m/%y %h:%i') as data") // Use selectRaw para a expressão SQL bruta
            ->leftJoin('usuarios as u', 't.id_usuario', '=', 'u.id')
            ->where(function($query) use ($idUsuario) {
                $query->where('t.id_usuario', $idUsuario)
                    ->orWhereIn('t.id_usuario', function($subquery) use ($idUsuario) {
                        $subquery->select('id_usuario_segindo')
                            ->from('usuarios_seguidores')
                            ->where('id_usuario', $idUsuario);
                    });
            })
            ->orderBy('data', 'DESC')
            ->get();
    
        $tl = [];
        foreach ($tweets as $tweet) {
            $tl[] = [
                'id' => $tweet->id,
                'id_usuario' => $tweet->id_usuario,
                'nome' => $tweet->nome,
                'tweet' => $tweet->tweet,
                'data' => $tweet->data,
            ];
        }
    
        return $response->withJson(['tweets' => $tl]);
    });
    
    //METODO DE POSTAGEM USANDO API GET

    $this->get('/tweets/adiciona/{id_usuario}/{tweet}', function($request, $response){


        $db = $this->get('db');

        $id_usuario = $request->getAttribute('id_usuario');
        $tweet = $request->getAttribute('tweet');
    
         /* INSERIR */
        $db->table('tweets')->insert([
            'id_usuario' => $id_usuario,
            'tweet' => $tweet
        ]);

        return $response->withJson( $tweet );

	});

        //METODO DE POSTAGEM USANDO API POST

    $this->post('/tweets/adiciona', function($request, $response){
		
		$dados = $request->getParsedBody();

		// Validar

		$Tweet = Tweet::create( $dados );
		return $response->withJson( $Tweet );

    });    

});
