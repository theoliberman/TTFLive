//= require rails-ujs
//= require activestorage
//= require jquery3
//= require popper
//= require bootstrap
//= require turbolinks
//= require_tree .

$(document).ready(function () {
    $('#search').on('keyup', function () {
        refresh();
    });
});

function refresh() {
    'use strict';
    let search = $('#search').val();
    if (search !== undefined) {
        $.ajax({
            url: '/players/refresh/' + search.trim(),
            method: 'POST'
        });
    }
}