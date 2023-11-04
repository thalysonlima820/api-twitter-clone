<?php

use App\Models\Tweet;
use Slim\Http\Request;
use Slim\Http\Response;
use App\Models\Twitter;

// Rotas para twitter
$app->group('/api/v1', function(){
	
	// Lista twitter
	$this->get('/twitter/lista', function($request, $response){

    $db = $this->get('db');
    $todos_tweets = $db->table('tweets')->get();

    $tl = [];
    foreach ($todos_tweets as $tl_tweet){
        $tl[] = $tl_tweet->tweet . '<br>';
    }
    return $response->withjson(['tweet' => $tl]);

	});

    $this->get('/tweets/teste', function($request, $response){

        $twitter = Tweet::get();

        return $response->withjson( $twitter );
    });


    $this->get('/tweets/adiciona/{id_usuario}/{tweet}', function($request, $response){
		
		$dados = $request->getParsedBody();

		// Validar

		$Tweet = Tweet::create( $dados );
		return $response->withJson( $Tweet );


        $db = $this->get('db');

        $id_usuario = $request->getAttribute('id_usuario');
        $tweet = $request->getAttribute('tweet');
    
         /* INSERIR */
        $db->table('tweets')->insert([
            'id_usuario' => $id_usuario,
            'tweet' => $tweet
        ]);

	});

    
});
