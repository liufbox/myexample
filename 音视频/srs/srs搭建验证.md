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



## SRS典型应用场景

1. 搭建大规模CDN集群，可以在CDN内部的源站和边缘部署SRS。

2. 小型业务快速搭建几台流媒体集群，譬如学校、企业等，需要分发的流不多，同时CDN覆盖不如自己部署几个节点，可以用SRS搭建自己的小集群。

3. SRS作为源站，CDN作为加速边缘集群。比如推流到CDN后CDN转推到源站，播放时CDN会从源站取流。这样可以同时使用多个CDN。同时还可以在源站做DRM和DVR，输出HLS，更重要的是如果直接推CDN一般CDN之间不是互通的，当一个CDN出现故障无法快速切换到其他CDN。

4. 编码器可以集成SRS支持拉流。一般编码器支持推RTMP/UDP流，如果集成SRS后，可以支持拉多种流。

5. 协议转换网关，比如可以推送FLV到SRS转成RTMP协议，或者拉RTSP转RTMP，还有拉HLS转RTMP。SRS只要能接入流，就能输出能输出的协议。

   



## 音视频相关协议







## 一些各个场景用到的通用能力







## 参考
1. https://www.jianshu.com/p/2662df9fe078
2. https://github.com/ossrs/srs/wiki/v4_CN_Home#effective-srs
3. https://github.com/ossrs/srs/wiki/v4_CN_Sample  应用场景
4. https://www.processon.com/view/link/5e3f5581e4b0a3daae80ecef SRS架构图