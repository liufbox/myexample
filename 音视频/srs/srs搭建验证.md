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

1. RTMP  

   Real Time Messaging Protocol(实时消息传输协议)，该协议基于TCP，是一个协议族，包括RTMP基本协议及RTMPT/RTMPS/RTMPE等多种变种。RTMP是一种设计用来进行实时数据通信的网络协议，主要用来在Flash/AIR平台和支持RTMP协议的流媒体/交互服务器之间进行音视频和数据通信。支持该协议的软件包括Adobe Media Server/Ultrant Media Server/red5等。

   RTMP（Real Time Messaging Protocol）有三种变种：

   （1）工作在TCP之上的明文协议，使用端口1935；

   （2）RTMPT封装在HTTP请求之中，可穿越防火墙；

   （3）RTMPS类似RTMPT，但使用的是HTTPS连接。

   RTMP视频播放的特点：

   （1）RTMP协议是采用实时的流式传输，所以不会缓存文件到客户端，这种特性说明用户想下载RTMP协议下的视频是比较难的；

   （2）视频流可以随便拖动，既可以从任意时间点向服务器发送请求进行播放，并不需要视频有关键帧。相比而言，HTTP协议下视频需要有关键帧才可以随意拖动。

   （3）RTMP协议支持点播/回放（通俗点将就是支持把flv,f4v,mp4文件放在RTMP服务器，客户端可以直接播放），直播（边录制视频边播放）。

   

2. RTSP协议

   **实时流协议**（Real Time Streaming Protocol，**RTSP**）。RTSP由RealNetworks公司，[Netscape](https://zh.wikipedia.org/wiki/Netscape)公司 [[1\]](https://zh.wikipedia.org/wiki/即時串流協定#cite_note-Inc.1998-1) 和[哥伦比亚大学](https://zh.wikipedia.org/wiki/哥伦比亚大学)开发，第一稿于1996年提交给IETF[[2\]](https://zh.wikipedia.org/wiki/即時串流協定#cite_note-Osso1999-2)。由[互联网工程任务组](https://zh.wikipedia.org/wiki/互联网工程任务组)（IETF）的多方多媒体会话控制工作组（MMUSIC WG）进行了标准化，并于1998年发布为RFC 2326。[[3\]](https://zh.wikipedia.org/wiki/即時串流協定#cite_note-:0-3) RTSP 2.0 于2016年发布为RFC 7826，作为RTSP 1.0的替代品。RTSP 2.0基于RTSP 1.0，但除了基本的版本协商机制之外不向后兼容。

   **实时流协议**（Real Time Streaming Protocol，**RTSP**）是一种网络应用协议，专为娱乐和通信系统的使用，以控制[流媒体](https://zh.wikipedia.org/wiki/流媒体)服务器。该协议用于创建和控制终端之间的媒体会话。媒体服务器的客户端发布VCR命令，例如播放，录制和暂停，以便于实时控制从服务器到客户端（视频点播）或从客户端到服务器（语音录音）的媒体流。

   流数据本身的传输不是RTSP的任务。大多数RTSP服务器使用[实时传输协议](https://zh.wikipedia.org/wiki/实时传输协议)（RTP）和[实时传输控制协议](https://zh.wikipedia.org/wiki/实时传输控制协议)（RTCP）结合媒体流传输。然而，一些供应商实现专有传输协议。例如，[RealNetworks](https://zh.wikipedia.org/wiki/RealNetworks)公司的RTSP服务器软件也使用RealNetworks的专有实时数据传输（RDT）。

   与HTTP异同点如下。相似点，语法和运作与HTTP1.1类似，但并不特别强调时间同步，所以比较能容忍网络延迟；代理服务器〈Proxy〉的快取功能〈Cache〉也同样适用于RTSP。不同的，HTTP1.1只能客户端发起请求，RTSP是双向的。

3. SIP协议

   SIP(Session Initiation Protocol)是一个应用层的信令控制协议。用于创建、修改和释放一个或多个参与者的会话。这些会话可以是Internet多媒体会议、IP电话或多媒体分发。会话的参与者可以通过组播（multicast）、网状单播（unicast）或两者的混合体进行通信。
   
4. RTP(Real-time Transport Protocol)实时传输协议

   RTP是用于Internet上针对多媒体数据流的一种传输协议。RTP由两个紧密链接部分组成:RTP----传送具有实时属性的数据；RTCP控制协议（RTCP）----监控服务质量并传送正在进行的会话参与者的相关信息。

   

5. RTCP(Real-time Transport Control Protocol)实时传输控制协议

   RTCP控制协议需要与RTP数据协议一起配合使用，当应用程序启动一个RTP会话时将同时占用两个端口，分别供RTP和RTCP使用。RTP本身并不能为按序传输数据包提供可靠的保证，也不提供流量控制和拥塞控制，这些都由RTCP来负责完成。

   通常RTCP会采用与RTP相同的分发机制，向会话中的所有成员周期性地发送控制信息，应用程序通过接收这些数据，从中获取会话参与者的相关资料，以及网络状况、分组丢失概率等反馈信息，从而能够对服务质量进行控制或者对网络状况进行诊断。

   

6. HLS (HTTP Live Streaming)

   HTTP Live Streaming(HLS)是苹果公司实现的基于HTTP的流媒体传输协议，可实现流媒体的直播和点播，主要应用于iOS系统。HLS点播是分段HTTP点播，不同在于它的分段非常小。要实现HLS点播，重点在于对媒体文件分段，目前有不少开源工具可以使用。

   相对于常见的流媒体直播协议，HLS直播最大的不同在于，直播客户端获取到的并不是一个完整的数据流，HLS协议在服务器端将直播数据流存储为连续的、很短时长的媒体文件（MPEG-TS格式），而客户端则不断的下载并播放这些小文件，因为服务器总是会将最新的直播数据生成新的小文件，这样客户端只要不停的按顺序播放从服务器获取到的文件，就实现了直播。由此可见，基本上可以认为，HLS是以点播的技术方式实现直播。由于数据通过HTTP协议传输，所以完全不用考虑防火墙或者代理的问题，而且分段文件的时长很短，客户端可以很快的选择和切换码率，以适应不同带宽条件下的播放。不过HLS的这种技术特点，决定了它的延迟一般总是会高于普通的流媒体直播协议。

   
   
7. H.264和H.265

   H.264 是由 ITU-T 视频编码专家组和 ISO/IEC 动态图像专家组联合提出的高度压缩数字视频编解码器标准，使用优势如下：

   - 可利用低于1Mbps的速度实现标清（分辨率在1280*720以下）数字图像传送。

   - 与其它视频编码标准相比，在相同的带宽下提供更优秀的图像质量。
   
     
   
   H.265 标准在现有的 H.264 视频编码标准基础上保留部分技术，并进行了优化。使用优势如下：
   
   - 可利用1Mbps - 2Mbps的传输速度传送720P（分辨率1280*720）普通高清音视频传送。
   
   - 改善码流、编码质量、延时和算法复杂度之间的关系，达到最优化设置。
   
     
   
8. FLV

   **Flash Video**（简称**FLV**），是一种[网络](https://zh.wikipedia.org/wiki/网络)[视频](https://zh.wikipedia.org/wiki/视频)格式，用作流媒体格式，它的出现有效地解决了视频文件导入[Flash](https://zh.wikipedia.org/wiki/Adobe_Flash)后，使导出的SWF文件体积庞大，不能在网络上有效使用等缺点。

   

   

   

   

   





## 一些各个场景用到的通用能力







## 参考
1. https://www.jianshu.com/p/2662df9fe078
2. https://github.com/ossrs/srs/wiki/v4_CN_Home#effective-srs
3. https://github.com/ossrs/srs/wiki/v4_CN_Sample  应用场景
4. https://www.processon.com/view/link/5e3f5581e4b0a3daae80ecef SRS架构图
5. https://blog.csdn.net/fanyun_01/article/details/109409334
6. https://zh.wikipedia.org/wiki/%E5%AE%9E%E6%97%B6%E6%B6%88%E6%81%AF%E5%8D%8F%E8%AE%AE
7. https://zhuanlan.zhihu.com/p/68653720