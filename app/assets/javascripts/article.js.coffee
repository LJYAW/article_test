$('.controller-admin_articles.action-index').ready ->
  $('.select2').select2()
  filter_form = $("#plansFilterForm")
  $('#plansFilterForm .select2, .user-select2').change ->
    filter_form.submit()


