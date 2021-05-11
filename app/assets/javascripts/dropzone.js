var $fileInput = $('.file_input');
var $droparea = $('.file_droparea');

$fileInput.on('dragenter focus click', function () {
  $droparea.addClass('is-active');
});

$fileInput.on('dragleave blur drop', function () {
  $droparea.removeClass('is-active');
});

$fileInput.on('change', function () {
  var filesCount = $(this)[0].files.length;
  var $textContainer = $(this).prev('.js-set-number');
  if (filesCount === 1) {
    $textContainer.text($(this).val().split('\\').pop());
  } else {
    $textContainer.text(filesCount + ' uploaded files');
  }
});