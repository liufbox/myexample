SRS入门介绍
=================


## 搭建演示
1. 参考1中步骤搭建。
2. 播放flv视频流，html代码示例
```html
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>

	<script src="https://cdn.bootcss.com/flv.js/1.4.0/flv.min.js"></script>
	<video id="videoElement" style="width: 80%;" controls="controls"></video>
	<script>
	    if (flvjs.isSupported()) {
	        var videoElement = document.getElementById('videoElement');
	        var flvPlayer = flvjs.createPlayer({
	            type: 'flv',
				url:'http://172.24.63.139:8080/live/livestream.flv'
	        });
	        flvPlayer.attachMediaElement(videoElement);
	        flvPlayer.load();
	        flvPlayer.play();
	    }
	</script>
</body>
</html>
```







## 参考
1. https://www.jianshu.com/p/2662df9fe078