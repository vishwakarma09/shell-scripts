<!doctype html>
<html lang="en">
<head>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-alpha1/jquery.min.js"></script>
	
	<meta charset="UTF-8">
	<title>Document</title>
</head>

<script>
var DataTableGrid;	

$(document).ready(function(){
	$('#doAction').click(function(){
		DoAction();	
	});
});

function DoAction(){
	$.post('controller.php', {cservice : "ListRegions"}, function(raw){
		alert(raw);
	});
}

</script>

<body>
<center>AWS admin</center>
	
<select id="selOperation">
	<option value="0">List Regions</option>	
</select>

<button id="doAction">Do Action</button>
	
</body>
</html>
