<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="en">
<body>
	<table>
		<tr>
			<td>Name</td>
			<td><input type="text" id="name"></td>
		</tr>
		<tr>
			<td>Gender</td>
			<td><input type="text" id="gender"></td>
		</tr>
		<tr>
			<td>Email Address</td>
			<td><input type="text" id="emailAddress"></td>
		</tr>
		<tr>
			<td>Mobile No</td>
			<td><input type="number" id="mobileNo"></td>
		</tr>
		<tr>
			<td>Address Line 1</td>
			<td><input type="text" id="addressLine1"></td>
		</tr>
		<tr>
			<td>Address Line 2</td>
			<td><input type="text" id="addressLine2"></td>
		</tr>
		<tr>
			<td>State</td>
			<td><input type="text" id="state"></td>
		</tr>
		<tr>
			<td>City</td>
			<td><input type="text" id="city"></td>
		</tr>
		<tr>
			<td>Zip Code</td>
			<td><input type="number" id="zipCode"></td>
		</tr>
		<tr>
			<td>Country</td>
			<td><input type="text" id="country"></td>
		</tr>
		<tr>
			<td><input type="button" id="submit" value="Submit" /></td>
			<td><input type="button" id="update" value="Update" /></td>
			<td><input type="button" value="getData" id="getData" /></td>
		</tr>
	</table>
	<br>
	<div id="displayDiv" style="dispay: none">
		<h3>CustomerData</h3>
		<table align="center" id="table" border="1">
		</table>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
    jQuery(document).ready(function($) {
    	 var selector = '#table';
		$("#submit").click(function(){
			var customerData = {};
			customerData ["name"] = $("#name").val();
			customerData ["gender"] = $("#gender").val();
			customerData ["emailAddress"] = $("#emailAddress").val();
			customerData ["mobileNo"] = $("#mobileNo").val();
			customerData ["addressLine1"] = $("#addressLine1").val();
			customerData ["addressLine2"] = $("#addressLine2").val();
			customerData ["state"] = $("#state").val();
			customerData ["city"] = $("#city").val();
			customerData ["zipCode"] = $("#zipCode").val();
			customerData ["country"] = $("#country").val();
			
			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "customer",
				data : JSON.stringify(customerData),
				success : function(data){
				}
			});
		});
		
		$("#update").click(function(){
			var customerData = {};
			customerData ["name"] = $("#name").val();
			customerData ["gender"] = $("#gender").val();
			customerData ["emailAddress"] = $("#emailAddress").val();
			customerData ["mobileNo"] = $("#mobileNo").val();
			customerData ["addressLine1"] = $("#addressLine1").val();
			customerData ["addressLine2"] = $("#addressLine2").val();
			customerData ["state"] = $("#state").val();
			customerData ["city"] = $("#city").val();
			customerData ["zipCode"] = $("#zipCode").val();
			customerData ["country"] = $("#country").val();
			
			$.ajax({
				type : "PUT",
				contentType : "application/json",
				url : "customer/"+$("#name").val() + "/"+$("#mobileNo").val(),
				data : JSON.stringify(customerData),
				success : function(data){
				}
			});
		});
		
		$("#getData").click(function(){
			
			$.ajax({
				type : "GET",
				contentType : "application/json",
				url : "customers",
				success : function(data){
					$("#table tr").remove();
					constructTable(data);
					$('#displayDiv').show();
				}
			});
		});
		
		function constructTable(data){
			var list = {"name":"", "gender":"", "emailAddress":"", "mobileNo":"", "addressLine1":"", "addressLine2":"", "state":"", "city":"", "zipCode":"", "country":""};
			var cols = headersCol(list,selector);
			
			for(var i = 0; i < data.length; i++){
				var row = $('<tr/>');
				for(var colIndex = 0; colIndex < cols.length; colIndex++){
					var val = 	data[i][cols[colIndex]]
					if(val == null)
						val ="";
					row.append($('<td/>').html(val));
				}
				$(selector).append(row);
			}
			
			
			
		}

		
		function headersCol(list, selector){
			
			var columns= [];
			var header = $('<tr/>');
			
				for(var k in list) {
					if ($.inArray(k, columns) == -1) {
						columns.push(k);
						
						header.append($('<th/>').html(k));
					}
				}
			$(selector).append(header);
			return columns;
		}
    });
    
    </script>
</body>
</html>