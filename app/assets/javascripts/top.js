document.addEventListener("turbolinks:load"
    , function () {
        $(function () {
            // jQueryの処理
    
            // ----------　モ　ー　ダ　ル　-----------
            $("#btn-signup").click(function () {
                $("#signup-modal").fadeIn();
                console.log("a");
            });

            $("#btn-login").click(function () {
                $("#login-modal").fadeIn();
                console.log("b");
            });
    
            $("#btn-search").click(function () {
                $("#search-modal").fadeIn();
                console.log("a");
            });

            $("#btn-post").click(function () {
                $("#post-modal").fadeIn();
                console.log("b");
            });

            $(".close-modal").click(function () {
                $("#signup-modal").fadeOut();
                $("#login-modal").fadeOut();
                $("#search-modal").fadeOut();
                $("#post-modal").fadeOut();
                console.log("c");
            });

        });
    });