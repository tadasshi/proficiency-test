// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_self
//= require_tree .

$(document).ready(function () {

    $.validator.setDefaults({
        errorElement: "em",
        errorPlacement: function (error, element) {
            // Add the `help-block` class to the error element
            error.addClass("help-block");

            if (element.prop("type") === "checkbox") {
                error.insertAfter(element.parent("label"));
            } else {
                error.insertAfter(element);
            }
        },
        highlight: function (element, errorClass, validClass) {
            $(element).parents(".form-group").addClass("has-error").removeClass("has-success");
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).parents(".form-group").addClass("has-success").removeClass("has-error");
        }
    });

    $("#form-course").validate({
        rules: {
            "course[name]": "required",
            "course[description]": "required"
        }, messages: {
            "course[name]": "Required Field!",
            "course[description]": "Required Field!"
        }
    });

    $("#form-student").validate({
        rules: {
            "student[name]": "required",
            "student[register_number]": "required"
        }, messages: {
            "student[name]": "Required Field!e",
            "student[register_number]": "Required Field!"
        }
    });

    $('.register_number').mask('000.000-00');
});