<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dynamic DropDown Example</title>

<link rel='stylesheet' href='css/style.css'>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

<script>
		$(function() {
				
			$("#dynamic-one").change(function() {
				$.get("list?firstChoice=" + $(this).val(), function(responseJson) {                 // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
			        var $select = $("#dynamic-two");                           // Locate HTML DOM element with ID "someselect".
			        $select.find("option").remove();                          // Find all child elements with tag name "option" and remove them (just to prevent duplicate options when button is pressed again).
			        $.each(responseJson, function(key, value) {               // Iterate over the JSON object.
			            $("<option>").val(key).text(value).appendTo($select); // Create HTML <option> element, set its value with currently iterated key and its text content with currently iterated item and finally append it to the <select>.
			        });
			    });
			}).trigger("change");
		
			
			$("#text-one").change(function() {
				$("#text-two").load("textdata/" + $(this).val() + ".txt");
			}).trigger("change");
			
			$("#json-one").change(function() {
			
				var $dropdown = $(this);
			
				$.getJSON("jsondata/data.json", function(data) {
				
					var key = $dropdown.val();
					var vals = [];
										
					switch(key) {
						case 'beverages':
							vals = data.beverages.split(",");
							break;
						case 'snacks':
							vals = data.snacks.split(",");
							break;
						case 'base':
							vals = ['Please choose from above'];
					}
					
					var $jsontwo = $("#json-two");
					$jsontwo.empty();
					$.each(vals, function(index, value) {
						$jsontwo.append("<option>" + value + "</option>");
					});
			
				});
			}).trigger("change");

		});
		
	</script>
</head>
<body>

	<div id="page-wrap">

		<h1>Pulls from Server</h1>

		<select id="dynamic-one">
			<option selected value="base">Please Select</option>
			<option value="beverages">Beverages</option>
			<option value="snacks">Snacks</option>
		</select> 
		<br /> 
		<select id="dynamic-two">
			<option>Please choose from above</option>
		</select>
		
		<h1>Pulls from text files</h1>
		
		<select id="text-one">
			<option selected value="base">Please Select</option>
			<option value="beverages">Beverages</option>
			<option value="snacks">Snacks</option>
		</select> 
		<br /> 
		<select id="text-two">
			<option>Please choose from above</option>
		</select>

		<h1>Pulls from JSON</h1>

		<select id="json-one">
			<option selected value="base">Please Select</option>
			<option value="beverages">Beverages</option>
			<option value="snacks">Snacks</option>
		</select> 
		<br /> 
		<select id="json-two">
			<option>Please choose from above</option>
		</select>

	</div>

</body>
</html>