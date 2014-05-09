(function($) {
  $(document).ready(function() {
    $('.handle').closest('.ui-sortable').activeAdminRanked();
  });

  $.fn.activeAdminRanked = function() {
    this.sortable({
      appendTo: $(this),
      axis: "y",
      cancel: "a, button",
      handle: ".handle",
      revert: true,
      update: function(event, ui) {
        var item  = ui.item.find('[data-rank-url]');
        var url   = item.data('rank-url');
        var attr  = item.data('rank-attribute');
        var data  = {};

        data[ attr ] = ui.item.index();

        $.ajax({
          url: url,
          type: 'post',
          data: data,
          success: function() {
            // window.location.reload();
          }
        });
      }
    });

    this.disableSelection();
  };
})(jQuery);
