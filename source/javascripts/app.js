//= require mbp_helper
//= require jquery
//= require underscore
//= require moment
//= require angular
//= require angular-route
//= require angular-sanitize
//= require angular-moment
//= require_self
//= require_tree './services/'
//= require_tree './controllers/'
//= require_tree './directives/'

(function(){
    var SPA = angular.module('SPA', ['ngRoute', 'ngSanitize', 'angularMoment']);

    SPA.config(['$routeProvider', '$compileProvider', function($routeProvider, $compileProvider) {
        // templates should go in /source/javascripts/templates
        $routeProvider
            .when('/something_else', {
                templateUrl: 'videos.html'
            }).otherwise({
                templateUrl: 'index.html'
            });

        // white list stuff here. Don't make yourself crazy!
        $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|file|tel):/);
    }]);

    angular.element(document).ready(function() {
        angular.bootstrap(document, ['SPA']);
    });
})();
