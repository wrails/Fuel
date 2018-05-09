
// Checking change on radio buttons. 
// Depending on radio button selected do the changes on table heather and the distance values
 
$(document).ready(function() {
  // Check what radio button has been selected 
  
  $('input:radio[name=distance]').change(function() {
        if (this.value == 'm') {
        	$(function(){
  				$('table tr:first th:nth-child(3)').text('Distance(miles)');
 			});
 			// Dividing by constant all second td to get distance values
 			$('table tr td:nth-child(3)').each(function() {
			    var d = $(this).html()
			    var e = 1.60934
			    var m = (d/e).toFixed(2)
			    $(this).text(m)
		    });
        }
        else if (this.value == 'km') {
        	$(function(){
  				$('table tr:first th:nth-child(3)').text('Distance(km)');				
  			});
        	// Multiply by constant all second td to get distance values
  			$('table tr td:nth-child(3)').each(function() {
			    var d = $(this).html()
			    var e = 1.60934
			    var m = (d*e).toFixed(2)
			    $(this).text(m)
		    });
		}
    });
})(jQuery);

