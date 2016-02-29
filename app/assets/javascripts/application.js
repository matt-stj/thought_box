// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require materialize-sprockets
//= require jquery_ujs
//= require turbolinks
//= require angular
//= require_tree .

var app = angular.module('Links', []);

var apiURL = "/api/v1/links.json";

function Link(id, link_url, title, read){
  this.id = id
  this.link_url = link_url
  this.title = title
  this.read = read
}

app.controller('LinksCtrl', function($scope, $http) {

  $http.get(apiURL).success(function(response) {
      $scope.links = response.map(function(link) {
        return new Link(link.id, link.link_url, link.title, link.read)
      });;
    });

    $scope.markUnread = function(link) {
      console.log("hi")

  };

});
