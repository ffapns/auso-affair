<%-- 
    Document   : login
    Created on : Mar 1, 2017, 10:25:01 AM
    Author     : fifap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="customcss/customlogin.css">
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <meta name="google-signin-client_id" content="249477171699-pmcs97vah5ab4dvohpu4cc9k8f6vbcaf.apps.googleusercontent.com">
        <title>LOGIN - AUSO.JSP</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <img style="width: 100%;" class="img-responsive" src="http://samis.au.edu/club/image/index-club1_01.jpg">
                </div>
            </div>

            <form class="form-signin" action="Login" method="post">

                <label for="inputUserame" class="sr-only">Username</label>
                <input name="uname" type="text" id="inputUsername" class="form-control text-center" placeholder="Username" required autofocus>
                <label for="inputPassword" class="sr-only">Password</label>
                <input name="upass" type="password" id="inputPassword" class="form-control text-center" placeholder="Password" required>

                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                <br/>
                <p class="text-center">OR</p>
                <div id="my-signin2"></div>

            </form>

        </div> <!-- /container -->
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="bootstrap/js/bootstrap.min.js"></script>

        <script>
            function onSuccess(googleUser) {
                var profile = googleUser.getBasicProfile();
                console.log("ID: " + profile.getId()); // Don't send this directly to your server!
                console.log('Full Name: ' + profile.getName());
                console.log('Given Name: ' + profile.getGivenName());
                console.log('Family Name: ' + profile.getFamilyName());
                console.log("Image URL: " + profile.getImageUrl());
                console.log("Email: " + profile.getEmail());

                // The ID token you need to pass to your backend:
                var id_token = googleUser.getAuthResponse().id_token;
                console.log("ID Token: " + id_token);
            }
            function onFailure(error) {
                console.log(error);
            }
            function renderButton() {
                gapi.signin2.render('my-signin2', {
                    'scope': 'profile email',
                    'width': 300,
                    'height': 50,
                    'longtitle': true,
                    'theme': 'dark',
                    'onsuccess': onSuccess,
                    'onfailure': onFailure
                });
            }

        </script>
        <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
    </body>


</html>
