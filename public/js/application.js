$(document).ready(function() {
	console.log("jQuery Ready");
	var form = $('#form-id');
	form.on("submit",function(formSubmission){
		formSubmission.preventDefault();

		$.ajax({
			url: '/urls',
			method: 'POST',
			data: $(this).serialize(),
			dataType: 'json',
			success: function(data){
				$('.form-control').val('');
				$('tbody').append('\
					<tr>\
						<td>' + data.id + '</td>\
						<td> <a href=' + data.ori_url + '> ' + data.ori_url + '</a></td>\
						<td> <a href="/' + data.short_url + '"">localhost:9393/' + data.short_url + '</a></td>\
						<td>' + data.click_count + '</td>\
					</tr>'
				)
			}
		});
	});
});