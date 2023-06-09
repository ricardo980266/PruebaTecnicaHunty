function fn () {
    karate.configure('connectTimeout',10000);
     karate.configure('connectTimeout',10000);

        var Url    = "https://restful-booker.herokuapp.com/"

        var baseUrl = karate.properties ["baseUrl"] || "https://restful-booker.herokuapp.com/"

return {
    api: {
    baseUrl: baseUrl
},
    user : {
    name 'karate'
    };

}
}