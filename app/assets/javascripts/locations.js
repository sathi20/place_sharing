// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('change', '#location_is_public', function() {
  var parent = $(this).closest('.form-group').next();
  if ($(this).prop('checked'))
    parent.addClass('hidden');
  else
    parent.removeClass('hidden');
});