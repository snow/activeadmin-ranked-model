(function($) {
  $(document).ready(function() {
    $('.handle').parents('tbody').activeAdminRanked();
  });

  $.fn.activeAdminRanked = function() {
    this.sortable({
      appendTo: $(this),
      axis: "y",
      cancel: "a, button",
      handle: ".handle",
      revert: true,
      helper: function(e, element) {
        element.children().each(function() {
          $(this).width($(this).width());
        });
        return element;
      },
      update: function(event, ui) {
        var item  = ui.item.find('[data-rank-url]');
        var url   = item.data('rank-url');
        var attr  = item.data('rank-attribute');
        var data  = {};

        data[ attr ] = ui.item.index();
        console.log(data)

        $.ajax({
          url: url,
          type: 'post',
          data: data,
          success: function() {
//            window.location.reload();
          }
        });
      }
    });

    this.disableSelection();
  };
})(jQuery);

