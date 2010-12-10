// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
  $("input[name*='search']").each(function() {
     $(this).focus(function() {
        $(this).attr("value", "");
        $(this).removeClass('greyed');
      });
      $(this).blur(function() {
        if ($(this).attr("value") == "") {
          $(this).attr("value",$(this).attr("name").split("_")[1]);
          $(this).addClass('greyed');
        }
      });
  });
 });

