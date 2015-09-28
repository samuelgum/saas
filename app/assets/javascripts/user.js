$(document).ready(function() {
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
  // Watch for a form submission:
  $("#form-submit-btn").click(function(event) {
    event.preventDefault();
    //Disables the button next
    $('input[type=submit]').prop('disabled', true);
    
    //Set up var for if error occurs (TBD later)
    var error = false;
    
    //Set up card variables for grabbed CC values
    var ccNum = $('#card_number').val(),
        cvcNum = $('#card_code').val(),
        expMonth = $('#card_month').val(),
        expYear = $('#card_year').val();
    if (!error) {
      // Get the Stripe token:
      Stripe.createToken({
        number: ccNum,
        cvc: cvcNum,
        exp_month: expMonth,
        exp_year: expYear
      }, stripeResponseHandler);
    }
    return false;
  }); // form submission
  function stripeResponseHandler(status, response) {
    // Get a reference to the form:
    var form = $("#new_user");
    // Get the token from the response:
    var token = response.id;
    // Add the token to the form:
    form.append('<input type="hidden" name="user[stripe_card_token]" value="' + token + '" />');
    // Submit the form:
    form.get(0).submit(); 
  }
});