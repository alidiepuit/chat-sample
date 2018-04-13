<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Categories</title>
<style>
div.general-chat-rooms table {
	width: 100%;
	height: 50%;
	text-align: center;
	font-size: 25px;
	color: black;
	margin-top: 5%;
	border-spacing: 70px;
	border-collapse: separate;
}
div.general-chat-rooms table td {
    height: 10%;
	padding: 2%;
	width: 10%;
	border-radius: 5px;
}
div.general-chat-rooms table td {
background-color: #cccccc;  
}	
div.general-chat-rooms table td:hover {
background-color: #ff9933;	
}
div.general-chat-rooms table td img {
	left: 10%;
	top: 28%;
	height:100px;
	width:100px;
}
</style>
</head>
<body>
<div class="row">
                  <div class="col-md-12 col-xs-12">
                      <div class="panel panel-default">
                          <div class="panel-body" style="min-height:700px;">
                          	
							<div class="general-chat-rooms">
							
								<div style="overflow-x:auto;">
							
									<table>
								
											<tbody>
										
											<tr>
												<td><a href="javascript:void(0);" onclick="opnwind(1)"><img src="/static/image/simpleimg.png"> Category 1</a></td>
												<td><a href="javascript:void(0);" onclick="opnwind(2)"><img src="/static/image/simpleimg.png"> Category 2</a></td>
												<td><a href="javascript:void(0);" onclick="opnwind(3)"><img src="/static/image/simpleimg.png"> Category 3</a></td>
												<td><a href="javascript:void(0);" onclick="opnwind(4)"><img src="/static/image/simpleimg.png"> Category 4</a></td>
											</tr>
                      
                      <tr>
												<td><a href="javascript:void(0);" onclick="opnwind(5)"><img src="/static/image/simpleimg.png"> Category 5</a></td>
												<td><a href="javascript:void(0);" onclick="opnwind(6)"><img src="/static/image/simpleimg.png"> Category 6</a></td>
												<td><a href="javascript:void(0);" onclick="opnwind(7)"><img src="/static/image/simpleimg.png"> Category 7</a></td>
												<td><a href="javascript:void(0);" onclick="opnwind(8)"><img src="/static/image/simpleimg.png"> Category 8</a></td>
											</tr>
										
										</tbody>
										</table>
								</div>
								
								

							</div>
                            
                            
                          </div>
                      </div>
                 </div>
              </div> 
<script>
function opnwind(id){
PopupCenter("page2.php?id="+id,'page 2','900','600');
}
function PopupCenter(url, title, w, h) {
    // Fixes dual-screen position                         Most browsers      Firefox
    var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : window.screenX;
    var dualScreenTop = window.screenTop != undefined ? window.screenTop : window.screenY;

    var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
    var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

    var left = ((width / 2) - (w / 2)) + dualScreenLeft;
    var top = ((height / 2) - (h / 2)) + dualScreenTop;
    var newWindow = window.open(url, title, 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);

    // Puts focus on the newWindow
    if (window.focus) {
        newWindow.focus();
    }
}
</script>
</body>
</html>