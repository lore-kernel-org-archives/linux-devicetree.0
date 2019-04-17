From: Frederic Chen <frederic.chen@mediatek.com>
Subject: [RFC PATCH V1 0/6] media: platform: Add support for Digital Image
 Processing (DIP) on mt8183 SoC
Date: Wed, 17 Apr 2019 18:45:05 +0800
Message-ID: <20190417104511.21514-1-frederic.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com, tfiga@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org
Cc: shik@chromium.org, devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com, holmes.chiou@mediatek.com, suleiman@chromium.org, Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, zwisler@chromium.org, christie.yu@mediatek.com, frederic.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

This RFC patch series adding Digital Image Processing (DIP) driver on
Mediatek mt8183 SoC. It belongs to the Mediatek's ISP driver series based
on V4L2 and media controller framework. I posted the main part of the DIP
driver as RFC to discuss first and would like some review comments.

==============
 Introduction
==============

Digital Image Processing (DIP) unit can accept the tuning parameters and
adjust the image content in Mediatek ISP system. Furthermore, it performs
demosaicing and noise reduction on the image to support the advanced camera
features of the application. The DIP driver also support image format
conversion, resizing and rotation with its hardware path.

The driver is implemented with V4L2 and media controller framework. We
have the following entities describing the DIP path. Since a DIP frame has
multiple buffers, the driver uses Request API to control the multiple
buffer's enqueue flow.

1. Meta (output video device): connects to DIP sub device. It accepts the
input tuning buffer from userspace. The metadata interface used currently
is only a temporary solution to kick off driver development and is not
ready for reviewed yet.

2. RAW (output video device): connects to DIP sub device. It accepts input
image buffer from userspace.

3. DIP (sub device): connects to MDP-0 and MDP-1. When processing an image,
DIP hardware support multiple output images with different size and format
so it needs two capture video devices to return the streaming data to the
user.

4. MDP-0 (capture video device): return the processed image data.

5. MDP-1 (capture video device): return the processed image data, the
image size and format can be different from the ones of MDP-0.

The overall file structure of the DIP driver is as following:

* mtk_dip-v4l2.c: implements DIP V4L2 and vb2 operations.

* mtk_dip-dev.c: implements dip driver software flow. DIP driver supports
3 software pipes (preview, capture and reprocessing) at the same time. All
the pipes share the same DIP hardware to process the images.

* mtk_dip-sys.c: implements the hardware driving part.

* mtk_dip-ctrl.c: handles the HW ctrl requested from userspace.

* mtk_dip-smem.c: provides the shared memory management required operation.
We reserve a memory region for the co-processor and DIP to exchange the
tuning and hardware configuration data.

==================
 Changes in v1
==================

RFC v1 includes the following modification:
1. Uses Request API instead of DIP's buffer collection design

2. removed unnecessary abstraction structurally, including mtk_dip_ctx and
related ops

3. removed the dip_smem node from device tree

4. improved the dip_work list's management flow

5. Fixed the common issues Tomasz commented on Mediatek ISP Pass 1's RFC v0
patch series

==================
 Dependent patch
==================

DIP driver depends on MDP 3 driver and SCP driver. The patches are as
following:

[1]. support mdp3 on mt8183 platform
https://patchwork.kernel.org/cover/10844219/

[2]. Add support for mt8183 SCP
https://patchwork.kernel.org/cover/10872547/

==================
 Compliance test
==================

* Test command: v4l2-compliance -m /dev/media0
* test output:

v4l2-compliance SHA: not available, 32 bits 
 
Compliance test for camera-dip device /dev/media0: 
 
Media Driver Info: 
	Driver name      : camera-dip 
	Model            : MTK-ISP-DIP-V4L2 
	Serial           :  
	Bus info         : platform:15022000.dip 
	Media version    : 4.19.29 
	Hardware revision: 0x00000000 (0) 
	Driver version   : 4.19.29 
 
Required ioctls: 
	test MEDIA_IOC_DEVICE_INFO: OK 
 
Allow for multiple opens: 
	test second /dev/media0 open: OK 
	test MEDIA_IOC_DEVICE_INFO: OK 
	test for unlimited opens: OK 
 
Media Controller ioctls: 
	test MEDIA_IOC_G_TOPOLOGY: OK 
	Entities: 15 Interfaces: 15 Pads: 24 Links: 27 
	test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK 
	test MEDIA_IOC_SETUP_LINK: OK 
 
Total for camera-dip device /dev/media0: 7, Succeeded: 7, Failed: 0, Warnings: 0 
-------------------------------------------------------------------------------- 
Compliance test for camera-dip device /dev/v4l-subdev0: 
 
Media Driver Info: 
	Driver name      : camera-dip 
	Model            : MTK-ISP-DIP-V4L2 
	Serial           :  
	Bus info         : platform:15022000.dip 
	Media version    : 4.19.29 
	Hardware revision: 0x00000000 (0) 
	Driver version   : 4.19.29 
Interface Info: 
	ID               : 0x03000006 
	Type             : V4L Sub-Device 
Entity Info: 
	ID               : 0x00000001 (1) 
	Name             : MTK-ISP-DIP-V4L2 
	Function         : Video Pixel Formatter 
	Pad 0x01000002   : 0: Sink 
	  Link 0x0200000c: from remote pad 0x1000009 of entity 'MTK-ISP-DIP-V4L2 Raw Input': Data, Enabled 
	Pad 0x01000003   : 1: Sink 
	  Link 0x02000012: from remote pad 0x100000f of entity 'MTK-ISP-DIP-V4L2 Tuning': Data 
	Pad 0x01000004   : 2: Source 
	  Link 0x02000018: to remote pad 0x1000015 of entity 'MTK-ISP-DIP-V4L2 MDP0': Data, Enabled, Dynamic 
	Pad 0x01000005   : 3: Source 
	  Link 0x0200001e: to remote pad 0x100001b of entity 'MTK-ISP-DIP-V4L2 MDP1': Data, Enabled, Dynamic 
 
Required ioctls: 
	test MC information (see 'Media Driver Info' above): OK 
 
Allow for multiple opens: 
	test second /dev/v4l-subdev0 open: OK 
	test for unlimited opens: OK 
 
Debug ioctls: 
	test VIDIOC_LOG_STATUS: OK (Not Supported) 
 
Input ioctls: 
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported) 
	test VIDIOC_ENUMAUDIO: OK (Not Supported) 
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDIO: OK (Not Supported) 
	Inputs: 0 Audio Inputs: 0 Tuners: 0 
 
Output ioctls: 
	test VIDIOC_G/S_MODULATOR: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_ENUMAUDOUT: OK (Not Supported) 
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDOUT: OK (Not Supported) 
	Outputs: 0 Audio Outputs: 0 Modulators: 0 
 
Input/Output configuration ioctls: 
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported) 
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported) 
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported) 
	test VIDIOC_G/S_EDID: OK (Not Supported) 
 
Sub-Device ioctls (Sink Pad 0): 
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported) 
 
Sub-Device ioctls (Sink Pad 1): 
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported) 
 
Sub-Device ioctls (Source Pad 2): 
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported) 
 
Sub-Device ioctls (Source Pad 3): 
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported) 
 
Control ioctls: 
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK 
	test VIDIOC_QUERYCTRL: OK 
	test VIDIOC_G/S_CTRL: OK 
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK 
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK 
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported) 
	Standard Controls: 2 Private Controls: 0 
 
Format ioctls: 
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported) 
	test VIDIOC_G/S_PARM: OK (Not Supported) 
	test VIDIOC_G_FBUF: OK (Not Supported) 
	test VIDIOC_G_FMT: OK (Not Supported) 
	test VIDIOC_TRY_FMT: OK (Not Supported) 
	test VIDIOC_S_FMT: OK (Not Supported) 
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported) 
	test Cropping: OK (Not Supported) 
	test Composing: OK (Not Supported) 
	test Scaling: OK (Not Supported) 
 
Codec ioctls: 
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported) 
	test VIDIOC_G_ENC_INDEX: OK (Not Supported) 
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported) 
 
Buffer ioctls: 
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported) 
	test VIDIOC_EXPBUF: OK (Not Supported) 
	test Requests: OK (Not Supported) 
 
Total for camera-dip device /dev/v4l-subdev0: 69, Succeeded: 69, Failed: 0, Warnings: 0 
-------------------------------------------------------------------------------- 
Compliance test for MTK-ISP-DIP-V4L device /dev/video0: 
 
Driver Info: 
	Driver name      : MTK-ISP-DIP-V4L 
	Card type        : MTK-ISP-DIP-V4L2 
	Bus info         : platform:15022000.dip 
	Driver version   : 4.19.29 
	Capabilities     : 0x84202000 
		Video Output Multiplanar 
		Streaming 
		Extended Pix Format 
		Device Capabilities 
	Device Caps      : 0x04202000 
		Video Output Multiplanar 
		Streaming 
		Extended Pix Format 
Media Driver Info: 
	Driver name      : camera-dip 
	Model            : MTK-ISP-DIP-V4L2 
	Serial           :  
	Bus info         : platform:15022000.dip 
	Media version    : 4.19.29 
	Hardware revision: 0x00000000 (0) 
	Driver version   : 4.19.29 
Interface Info: 
	ID               : 0x0300000a 
	Type             : V4L Video 
Entity Info: 
	ID               : 0x00000008 (8) 
	Name             : MTK-ISP-DIP-V4L2 Raw Input 
	Function         : V4L2 I/O 
	Pad 0x01000009   : 0: Source 
	  Link 0x0200000c: to remote pad 0x1000002 of entity 'MTK-ISP-DIP-V4L2': Data, Enabled 
 
Required ioctls: 
	test MC information (see 'Media Driver Info' above): OK 
	test VIDIOC_QUERYCAP: OK 
 
Allow for multiple opens: 
	test second /dev/video0 open: OK 
	test VIDIOC_QUERYCAP: OK 
	test VIDIOC_G/S_PRIORITY: OK 
	test for unlimited opens: OK 
 
Debug ioctls: 
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported) 
	test VIDIOC_LOG_STATUS: OK (Not Supported) 
 
Input ioctls: 
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported) 
	test VIDIOC_ENUMAUDIO: OK (Not Supported) 
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDIO: OK (Not Supported) 
	Inputs: 0 Audio Inputs: 0 Tuners: 0 
 
Output ioctls: 
	test VIDIOC_G/S_MODULATOR: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_ENUMAUDOUT: OK (Not Supported) 
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDOUT: OK (Not Supported) 
	Outputs: 0 Audio Outputs: 0 Modulators: 0 
 
Input/Output configuration ioctls: 
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported) 
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported) 
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported) 
	test VIDIOC_G/S_EDID: OK (Not Supported) 
 
Control ioctls: 
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK 
	test VIDIOC_QUERYCTRL: OK 
	test VIDIOC_G/S_CTRL: OK 
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK 
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK 
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported) 
	Standard Controls: 1 Private Controls: 1 
 
Format ioctls: 
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK 
	test VIDIOC_G/S_PARM: OK (Not Supported) 
	test VIDIOC_G_FBUF: OK (Not Supported) 
	test VIDIOC_G_FMT: OK 
	test VIDIOC_TRY_FMT: OK 
	test VIDIOC_S_FMT: OK 
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported) 
	test Cropping: OK (Not Supported) 
	test Composing: OK (Not Supported) 
	test Scaling: OK 
 
Codec ioctls: 
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported) 
	test VIDIOC_G_ENC_INDEX: OK (Not Supported) 
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported) 
 
Buffer ioctls: 
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK 
	test VIDIOC_EXPBUF: OK 
	test Requests: OK 
 
Total for MTK-ISP-DIP-V4L device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 0 
-------------------------------------------------------------------------------- 
Compliance test for MTK-ISP-DIP-V4L device /dev/video1: 
 
Driver Info: 
	Driver name      : MTK-ISP-DIP-V4L 
	Card type        : MTK-ISP-DIP-V4L2 
	Bus info         : platform:15022000.dip 
	Driver version   : 4.19.29 
	Capabilities     : 0x8c200000 
		Streaming 
		Extended Pix Format 
		Device Capabilities 
	Device Caps      : 0x0c200000 
		Streaming 
		Extended Pix Format 
Media Driver Info: 
	Driver name      : camera-dip 
	Model            : MTK-ISP-DIP-V4L2 
	Serial           :  
	Bus info         : platform:15022000.dip 
	Media version    : 4.19.29 
	Hardware revision: 0x00000000 (0) 
	Driver version   : 4.19.29 
Interface Info: 
	ID               : 0x03000010 
	Type             : V4L Video 
Entity Info: 
	ID               : 0x0000000e (14) 
	Name             : MTK-ISP-DIP-V4L2 Tuning 
	Function         : V4L2 I/O 
	Pad 0x0100000f   : 0: Source 
	  Link 0x02000012: to remote pad 0x1000003 of entity 'MTK-ISP-DIP-V4L2': Data 
 
Required ioctls: 
	test MC information (see 'Media Driver Info' above): OK 
	test VIDIOC_QUERYCAP: OK 
 
Allow for multiple opens: 
	test second /dev/video1 open: OK 
	test VIDIOC_QUERYCAP: OK 
	test VIDIOC_G/S_PRIORITY: OK 
	test for unlimited opens: OK 
 
Debug ioctls: 
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported) 
	test VIDIOC_LOG_STATUS: OK (Not Supported) 
 
Input ioctls: 
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported) 
	test VIDIOC_ENUMAUDIO: OK (Not Supported) 
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDIO: OK (Not Supported) 
	Inputs: 0 Audio Inputs: 0 Tuners: 0 
 
Output ioctls: 
	test VIDIOC_G/S_MODULATOR: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_ENUMAUDOUT: OK (Not Supported) 
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDOUT: OK (Not Supported) 
	Outputs: 0 Audio Outputs: 0 Modulators: 0 
 
Input/Output configuration ioctls: 
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported) 
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported) 
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported) 
	test VIDIOC_G/S_EDID: OK (Not Supported) 
 
Control ioctls: 
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK 
	test VIDIOC_QUERYCTRL: OK 
	test VIDIOC_G/S_CTRL: OK 
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK 
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported) 
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported) 
	Standard Controls: 0 Private Controls: 0 
 
Format ioctls: 
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK 
	test VIDIOC_G/S_PARM: OK (Not Supported) 
	test VIDIOC_G_FBUF: OK (Not Supported) 
	test VIDIOC_G_FMT: OK 
	test VIDIOC_TRY_FMT: OK 
	test VIDIOC_S_FMT: OK 
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported) 
	test Cropping: OK (Not Supported) 
	test Composing: OK (Not Supported) 
	test Scaling: OK (Not Supported) 
 
Codec ioctls: 
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported) 
	test VIDIOC_G_ENC_INDEX: OK (Not Supported) 
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported) 
 
Buffer ioctls: 
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK 
	test VIDIOC_EXPBUF: OK 
	test Requests: OK 
 
Total for MTK-ISP-DIP-V4L device /dev/video1: 45, Succeeded: 45, Failed: 0, Warnings: 0 
-------------------------------------------------------------------------------- 
Compliance test for MTK-ISP-DIP-V4L device /dev/video2: 
 
Driver Info: 
	Driver name      : MTK-ISP-DIP-V4L 
	Card type        : MTK-ISP-DIP-V4L2 
	Bus info         : platform:15022000.dip 
	Driver version   : 4.19.29 
	Capabilities     : 0x84201000 
		Video Capture Multiplanar 
		Streaming 
		Extended Pix Format 
		Device Capabilities 
	Device Caps      : 0x04201000 
		Video Capture Multiplanar 
		Streaming 
		Extended Pix Format 
Media Driver Info: 
	Driver name      : camera-dip 
	Model            : MTK-ISP-DIP-V4L2 
	Serial           :  
	Bus info         : platform:15022000.dip 
	Media version    : 4.19.29 
	Hardware revision: 0x00000000 (0) 
	Driver version   : 4.19.29 
Interface Info: 
	ID               : 0x03000016 
	Type             : V4L Video 
Entity Info: 
	ID               : 0x00000014 (20) 
	Name             : MTK-ISP-DIP-V4L2 MDP0 
	Function         : V4L2 I/O 
	Pad 0x01000015   : 0: Sink 
	  Link 0x02000018: from remote pad 0x1000004 of entity 'MTK-ISP-DIP-V4L2': Data, Enabled, Dynamic 
 
Required ioctls: 
	test MC information (see 'Media Driver Info' above): OK 
	test VIDIOC_QUERYCAP: OK 
 
Allow for multiple opens: 
	test second /dev/video2 open: OK 
	test VIDIOC_QUERYCAP: OK 
	test VIDIOC_G/S_PRIORITY: OK 
	test for unlimited opens: OK 
 
Debug ioctls: 
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported) 
	test VIDIOC_LOG_STATUS: OK (Not Supported) 
 
Input ioctls: 
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported) 
	test VIDIOC_ENUMAUDIO: OK (Not Supported) 
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDIO: OK (Not Supported) 
	Inputs: 0 Audio Inputs: 0 Tuners: 0 
 
Output ioctls: 
	test VIDIOC_G/S_MODULATOR: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_ENUMAUDOUT: OK (Not Supported) 
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDOUT: OK (Not Supported) 
	Outputs: 0 Audio Outputs: 0 Modulators: 0 
 
Input/Output configuration ioctls: 
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported) 
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported) 
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported) 
	test VIDIOC_G/S_EDID: OK (Not Supported) 
 
Control ioctls: 
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK 
	test VIDIOC_QUERYCTRL: OK 
	test VIDIOC_G/S_CTRL: OK 
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK 
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK 
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported) 
	Standard Controls: 1 Private Controls: 1 
 
Format ioctls: 
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK 
	test VIDIOC_G/S_PARM: OK (Not Supported) 
	test VIDIOC_G_FBUF: OK (Not Supported) 
	test VIDIOC_G_FMT: OK 
	test VIDIOC_TRY_FMT: OK 
	test VIDIOC_S_FMT: OK 
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported) 
	test Cropping: OK (Not Supported) 
	test Composing: OK (Not Supported) 
	test Scaling: OK 
 
Codec ioctls: 
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported) 
	test VIDIOC_G_ENC_INDEX: OK (Not Supported) 
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported) 
 
Buffer ioctls: 
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK 
	test VIDIOC_EXPBUF: OK 
	test Requests: OK 
 
Total for MTK-ISP-DIP-V4L device /dev/video2: 45, Succeeded: 45, Failed: 0, Warnings: 0 
-------------------------------------------------------------------------------- 
Compliance test for MTK-ISP-DIP-V4L device /dev/video3: 
 
Driver Info: 
	Driver name      : MTK-ISP-DIP-V4L 
	Card type        : MTK-ISP-DIP-V4L2 
	Bus info         : platform:15022000.dip 
	Driver version   : 4.19.29 
	Capabilities     : 0x84201000 
		Video Capture Multiplanar 
		Streaming 
		Extended Pix Format 
		Device Capabilities 
	Device Caps      : 0x04201000 
		Video Capture Multiplanar 
		Streaming 
		Extended Pix Format 
Media Driver Info: 
	Driver name      : camera-dip 
	Model            : MTK-ISP-DIP-V4L2 
	Serial           :  
	Bus info         : platform:15022000.dip 
	Media version    : 4.19.29 
	Hardware revision: 0x00000000 (0) 
	Driver version   : 4.19.29 
Interface Info: 
	ID               : 0x0300001c 
	Type             : V4L Video 
Entity Info: 
	ID               : 0x0000001a (26) 
	Name             : MTK-ISP-DIP-V4L2 MDP1 
	Function         : V4L2 I/O 
	Pad 0x0100001b   : 0: Sink 
	  Link 0x0200001e: from remote pad 0x1000005 of entity 'MTK-ISP-DIP-V4L2': Data, Enabled, Dynamic 
 
Required ioctls: 
	test MC information (see 'Media Driver Info' above): OK 
	test VIDIOC_QUERYCAP: OK 
 
Allow for multiple opens: 
	test second /dev/video3 open: OK 
	test VIDIOC_QUERYCAP: OK 
	test VIDIOC_G/S_PRIORITY: OK 
	test for unlimited opens: OK 
 
Debug ioctls: 
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported) 
	test VIDIOC_LOG_STATUS: OK (Not Supported) 
 
Input ioctls: 
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported) 
	test VIDIOC_ENUMAUDIO: OK (Not Supported) 
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDIO: OK (Not Supported) 
	Inputs: 0 Audio Inputs: 0 Tuners: 0 
 
Output ioctls: 
	test VIDIOC_G/S_MODULATOR: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_ENUMAUDOUT: OK (Not Supported) 
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDOUT: OK (Not Supported) 
	Outputs: 0 Audio Outputs: 0 Modulators: 0 
 
Input/Output configuration ioctls: 
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported) 
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported) 
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported) 
	test VIDIOC_G/S_EDID: OK (Not Supported) 
 
Control ioctls: 
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK 
	test VIDIOC_QUERYCTRL: OK 
	test VIDIOC_G/S_CTRL: OK 
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK 
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK 
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported) 
	Standard Controls: 1 Private Controls: 1 
 
Format ioctls: 
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK 
	test VIDIOC_G/S_PARM: OK (Not Supported) 
	test VIDIOC_G_FBUF: OK (Not Supported) 
	test VIDIOC_G_FMT: OK 
	test VIDIOC_TRY_FMT: OK 
	test VIDIOC_S_FMT: OK 
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported) 
	test Cropping: OK (Not Supported) 
	test Composing: OK (Not Supported) 
	test Scaling: OK 
 
Codec ioctls: 
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported) 
	test VIDIOC_G_ENC_INDEX: OK (Not Supported) 
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported) 
 
Buffer ioctls: 
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK 
	test VIDIOC_EXPBUF: OK 
	test Requests: OK 
 
Total for MTK-ISP-DIP-V4L device /dev/video3: 45, Succeeded: 45, Failed: 0, Warnings: 0 
-------------------------------------------------------------------------------- 
Compliance test for camera-dip device /dev/v4l-subdev1: 
 
Media Driver Info: 
	Driver name      : camera-dip 
	Model            : MTK-ISP-DIP-V4L2 
	Serial           :  
	Bus info         : platform:15022000.dip 
	Media version    : 4.19.29 
	Hardware revision: 0x00000000 (0) 
	Driver version   : 4.19.29 
Interface Info: 
	ID               : 0x03000025 
	Type             : V4L Sub-Device 
Entity Info: 
	ID               : 0x00000020 (32) 
	Name             : MTK-ISP-DIP-CAP-V4L2 
	Function         : Video Pixel Formatter 
	Pad 0x01000021   : 0: Sink 
	  Link 0x0200002b: from remote pad 0x1000028 of entity 'MTK-ISP-DIP-CAP-V4L2 Raw Input': Data, Enabled 
	Pad 0x01000022   : 1: Sink 
	  Link 0x02000031: from remote pad 0x100002e of entity 'MTK-ISP-DIP-CAP-V4L2 Tuning': Data 
	Pad 0x01000023   : 2: Source 
	  Link 0x02000037: to remote pad 0x1000034 of entity 'MTK-ISP-DIP-CAP-V4L2 MDP0': Data, Enabled, Dynamic 
	Pad 0x01000024   : 3: Source 
	  Link 0x0200003d: to remote pad 0x100003a of entity 'MTK-ISP-DIP-CAP-V4L2 MDP1': Data, Enabled, Dynamic 
 
Required ioctls: 
	test MC information (see 'Media Driver Info' above): OK 
 
Allow for multiple opens: 
	test second /dev/v4l-subdev1 open: OK 
	test for unlimited opens: OK 
 
Debug ioctls: 
	test VIDIOC_LOG_STATUS: OK (Not Supported) 
 
Input ioctls: 
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported) 
	test VIDIOC_ENUMAUDIO: OK (Not Supported) 
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDIO: OK (Not Supported) 
	Inputs: 0 Audio Inputs: 0 Tuners: 0 
 
Output ioctls: 
	test VIDIOC_G/S_MODULATOR: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_ENUMAUDOUT: OK (Not Supported) 
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDOUT: OK (Not Supported) 
	Outputs: 0 Audio Outputs: 0 Modulators: 0 
 
Input/Output configuration ioctls: 
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported) 
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported) 
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported) 
	test VIDIOC_G/S_EDID: OK (Not Supported) 
 
Sub-Device ioctls (Sink Pad 0): 
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported) 
 
Sub-Device ioctls (Sink Pad 1): 
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported) 
 
Sub-Device ioctls (Source Pad 2): 
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported) 
 
Sub-Device ioctls (Source Pad 3): 
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported) 
 
Control ioctls: 
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK 
	test VIDIOC_QUERYCTRL: OK 
	test VIDIOC_G/S_CTRL: OK 
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK 
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK 
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported) 
	Standard Controls: 2 Private Controls: 0 
 
Format ioctls: 
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported) 
	test VIDIOC_G/S_PARM: OK (Not Supported) 
	test VIDIOC_G_FBUF: OK (Not Supported) 
	test VIDIOC_G_FMT: OK (Not Supported) 
	test VIDIOC_TRY_FMT: OK (Not Supported) 
	test VIDIOC_S_FMT: OK (Not Supported) 
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported) 
	test Cropping: OK (Not Supported) 
	test Composing: OK (Not Supported) 
	test Scaling: OK (Not Supported) 
 
Codec ioctls: 
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported) 
	test VIDIOC_G_ENC_INDEX: OK (Not Supported) 
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported) 
 
Buffer ioctls: 
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported) 
	test VIDIOC_EXPBUF: OK (Not Supported) 
	test Requests: OK (Not Supported) 
 
Total for camera-dip device /dev/v4l-subdev1: 69, Succeeded: 69, Failed: 0, Warnings: 0 
-------------------------------------------------------------------------------- 
Compliance test for MTK-ISP-DIP-CAP device /dev/video4: 
 
Driver Info: 
	Driver name      : MTK-ISP-DIP-CAP 
	Card type        : MTK-ISP-DIP-CAP-V4L2 
	Bus info         : platform:15022000.dip 
	Driver version   : 4.19.29 
	Capabilities     : 0x84202000 
		Video Output Multiplanar 
		Streaming 
		Extended Pix Format 
		Device Capabilities 
	Device Caps      : 0x04202000 
		Video Output Multiplanar 
		Streaming 
		Extended Pix Format 
Media Driver Info: 
	Driver name      : camera-dip 
	Model            : MTK-ISP-DIP-V4L2 
	Serial           :  
	Bus info         : platform:15022000.dip 
	Media version    : 4.19.29 
	Hardware revision: 0x00000000 (0) 
	Driver version   : 4.19.29 
Interface Info: 
	ID               : 0x03000029 
	Type             : V4L Video 
Entity Info: 
	ID               : 0x00000027 (39) 
	Name             : MTK-ISP-DIP-CAP-V4L2 Raw Input 
	Function         : V4L2 I/O 
	Pad 0x01000028   : 0: Source 
	  Link 0x0200002b: to remote pad 0x1000021 of entity 'MTK-ISP-DIP-CAP-V4L2': Data, Enabled 
 
Required ioctls: 
	test MC information (see 'Media Driver Info' above): OK 
	test VIDIOC_QUERYCAP: OK 
 
Allow for multiple opens: 
	test second /dev/video4 open: OK 
	test VIDIOC_QUERYCAP: OK 
	test VIDIOC_G/S_PRIORITY: OK 
	test for unlimited opens: OK 
 
Debug ioctls: 
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported) 
	test VIDIOC_LOG_STATUS: OK (Not Supported) 
 
Input ioctls: 
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported) 
	test VIDIOC_ENUMAUDIO: OK (Not Supported) 
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDIO: OK (Not Supported) 
	Inputs: 0 Audio Inputs: 0 Tuners: 0 
 
Output ioctls: 
	test VIDIOC_G/S_MODULATOR: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_ENUMAUDOUT: OK (Not Supported) 
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDOUT: OK (Not Supported) 
	Outputs: 0 Audio Outputs: 0 Modulators: 0 
 
Input/Output configuration ioctls: 
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported) 
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported) 
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported) 
	test VIDIOC_G/S_EDID: OK (Not Supported) 
 
Control ioctls: 
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK 
	test VIDIOC_QUERYCTRL: OK 
	test VIDIOC_G/S_CTRL: OK 
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK 
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK 
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported) 
	Standard Controls: 1 Private Controls: 1 
 
Format ioctls: 
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK 
	test VIDIOC_G/S_PARM: OK (Not Supported) 
	test VIDIOC_G_FBUF: OK (Not Supported) 
	test VIDIOC_G_FMT: OK 
	test VIDIOC_TRY_FMT: OK 
	test VIDIOC_S_FMT: OK 
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported) 
	test Cropping: OK (Not Supported) 
	test Composing: OK (Not Supported) 
	test Scaling: OK 
 
Codec ioctls: 
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported) 
	test VIDIOC_G_ENC_INDEX: OK (Not Supported) 
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported) 
 
Buffer ioctls: 
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK 
	test VIDIOC_EXPBUF: OK 
	test Requests: OK 
 
Total for MTK-ISP-DIP-CAP device /dev/video4: 45, Succeeded: 45, Failed: 0, Warnings: 0 
-------------------------------------------------------------------------------- 
Compliance test for MTK-ISP-DIP-CAP device /dev/video5: 
 
Driver Info: 
	Driver name      : MTK-ISP-DIP-CAP 
	Card type        : MTK-ISP-DIP-CAP-V4L2 
	Bus info         : platform:15022000.dip 
	Driver version   : 4.19.29 
	Capabilities     : 0x8c200000 
		Streaming 
		Extended Pix Format 
		Device Capabilities 
	Device Caps      : 0x0c200000 
		Streaming 
		Extended Pix Format 
Media Driver Info: 
	Driver name      : camera-dip 
	Model            : MTK-ISP-DIP-V4L2 
	Serial           :  
	Bus info         : platform:15022000.dip 
	Media version    : 4.19.29 
	Hardware revision: 0x00000000 (0) 
	Driver version   : 4.19.29 
Interface Info: 
	ID               : 0x0300002f 
	Type             : V4L Video 
Entity Info: 
	ID               : 0x0000002d (45) 
	Name             : MTK-ISP-DIP-CAP-V4L2 Tuning 
	Function         : V4L2 I/O 
	Pad 0x0100002e   : 0: Source 
	  Link 0x02000031: to remote pad 0x1000022 of entity 'MTK-ISP-DIP-CAP-V4L2': Data 
 
Required ioctls: 
	test MC information (see 'Media Driver Info' above): OK 
	test VIDIOC_QUERYCAP: OK 
 
Allow for multiple opens: 
	test second /dev/video5 open: OK 
	test VIDIOC_QUERYCAP: OK 
	test VIDIOC_G/S_PRIORITY: OK 
	test for unlimited opens: OK 
 
Debug ioctls: 
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported) 
	test VIDIOC_LOG_STATUS: OK (Not Supported) 
 
Input ioctls: 
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported) 
	test VIDIOC_ENUMAUDIO: OK (Not Supported) 
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDIO: OK (Not Supported) 
	Inputs: 0 Audio Inputs: 0 Tuners: 0 
 
Output ioctls: 
	test VIDIOC_G/S_MODULATOR: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_ENUMAUDOUT: OK (Not Supported) 
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDOUT: OK (Not Supported) 
	Outputs: 0 Audio Outputs: 0 Modulators: 0 
 
Input/Output configuration ioctls: 
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported) 
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported) 
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported) 
	test VIDIOC_G/S_EDID: OK (Not Supported) 
 
Control ioctls: 
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK 
	test VIDIOC_QUERYCTRL: OK 
	test VIDIOC_G/S_CTRL: OK 
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK 
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported) 
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported) 
	Standard Controls: 0 Private Controls: 0 
 
Format ioctls: 
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK 
	test VIDIOC_G/S_PARM: OK (Not Supported) 
	test VIDIOC_G_FBUF: OK (Not Supported) 
	test VIDIOC_G_FMT: OK 
	test VIDIOC_TRY_FMT: OK 
	test VIDIOC_S_FMT: OK 
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported) 
	test Cropping: OK (Not Supported) 
	test Composing: OK (Not Supported) 
	test Scaling: OK (Not Supported) 
 
Codec ioctls: 
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported) 
	test VIDIOC_G_ENC_INDEX: OK (Not Supported) 
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported) 
 
Buffer ioctls: 
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK 
	test VIDIOC_EXPBUF: OK 
	test Requests: OK 
 
Total for MTK-ISP-DIP-CAP device /dev/video5: 45, Succeeded: 45, Failed: 0, Warnings: 0 
-------------------------------------------------------------------------------- 
Compliance test for MTK-ISP-DIP-CAP device /dev/video6: 
 
Driver Info: 
	Driver name      : MTK-ISP-DIP-CAP 
	Card type        : MTK-ISP-DIP-CAP-V4L2 
	Bus info         : platform:15022000.dip 
	Driver version   : 4.19.29 
	Capabilities     : 0x84201000 
		Video Capture Multiplanar 
		Streaming 
		Extended Pix Format 
		Device Capabilities 
	Device Caps      : 0x04201000 
		Video Capture Multiplanar 
		Streaming 
		Extended Pix Format 
Media Driver Info: 
	Driver name      : camera-dip 
	Model            : MTK-ISP-DIP-V4L2 
	Serial           :  
	Bus info         : platform:15022000.dip 
	Media version    : 4.19.29 
	Hardware revision: 0x00000000 (0) 
	Driver version   : 4.19.29 
Interface Info: 
	ID               : 0x03000035 
	Type             : V4L Video 
Entity Info: 
	ID               : 0x00000033 (51) 
	Name             : MTK-ISP-DIP-CAP-V4L2 MDP0 
	Function         : V4L2 I/O 
	Pad 0x01000034   : 0: Sink 
	  Link 0x02000037: from remote pad 0x1000023 of entity 'MTK-ISP-DIP-CAP-V4L2': Data, Enabled, Dynamic 
 
Required ioctls: 
	test MC information (see 'Media Driver Info' above): OK 
	test VIDIOC_QUERYCAP: OK 
 
Allow for multiple opens: 
	test second /dev/video6 open: OK 
	test VIDIOC_QUERYCAP: OK 
	test VIDIOC_G/S_PRIORITY: OK 
	test for unlimited opens: OK 
 
Debug ioctls: 
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported) 
	test VIDIOC_LOG_STATUS: OK (Not Supported) 
 
Input ioctls: 
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported) 
	test VIDIOC_ENUMAUDIO: OK (Not Supported) 
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDIO: OK (Not Supported) 
	Inputs: 0 Audio Inputs: 0 Tuners: 0 
 
Output ioctls: 
	test VIDIOC_G/S_MODULATOR: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_ENUMAUDOUT: OK (Not Supported) 
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDOUT: OK (Not Supported) 
	Outputs: 0 Audio Outputs: 0 Modulators: 0 
 
Input/Output configuration ioctls: 
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported) 
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported) 
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported) 
	test VIDIOC_G/S_EDID: OK (Not Supported) 
 
Control ioctls: 
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK 
	test VIDIOC_QUERYCTRL: OK 
	test VIDIOC_G/S_CTRL: OK 
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK 
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK 
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported) 
	Standard Controls: 1 Private Controls: 1 
 
Format ioctls: 
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK 
	test VIDIOC_G/S_PARM: OK (Not Supported) 
	test VIDIOC_G_FBUF: OK (Not Supported) 
	test VIDIOC_G_FMT: OK 
	test VIDIOC_TRY_FMT: OK 
	test VIDIOC_S_FMT: OK 
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported) 
	test Cropping: OK (Not Supported) 
	test Composing: OK (Not Supported) 
	test Scaling: OK 
 
Codec ioctls: 
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported) 
	test VIDIOC_G_ENC_INDEX: OK (Not Supported) 
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported) 
 
Buffer ioctls: 
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK 
	test VIDIOC_EXPBUF: OK 
	test Requests: OK 
 
Total for MTK-ISP-DIP-CAP device /dev/video6: 45, Succeeded: 45, Failed: 0, Warnings: 0 
-------------------------------------------------------------------------------- 
Compliance test for MTK-ISP-DIP-CAP device /dev/video7: 
 
Driver Info: 
	Driver name      : MTK-ISP-DIP-CAP 
	Card type        : MTK-ISP-DIP-CAP-V4L2 
	Bus info         : platform:15022000.dip 
	Driver version   : 4.19.29 
	Capabilities     : 0x84201000 
		Video Capture Multiplanar 
		Streaming 
		Extended Pix Format 
		Device Capabilities 
	Device Caps      : 0x04201000 
		Video Capture Multiplanar 
		Streaming 
		Extended Pix Format 
Media Driver Info: 
	Driver name      : camera-dip 
	Model            : MTK-ISP-DIP-V4L2 
	Serial           :  
	Bus info         : platform:15022000.dip 
	Media version    : 4.19.29 
	Hardware revision: 0x00000000 (0) 
	Driver version   : 4.19.29 
Interface Info: 
	ID               : 0x0300003b 
	Type             : V4L Video 
Entity Info: 
	ID               : 0x00000039 (57) 
	Name             : MTK-ISP-DIP-CAP-V4L2 MDP1 
	Function         : V4L2 I/O 
	Pad 0x0100003a   : 0: Sink 
	  Link 0x0200003d: from remote pad 0x1000024 of entity 'MTK-ISP-DIP-CAP-V4L2': Data, Enabled, Dynamic 
 
Required ioctls: 
	test MC information (see 'Media Driver Info' above): OK 
	test VIDIOC_QUERYCAP: OK 
 
Allow for multiple opens: 
	test second /dev/video7 open: OK 
	test VIDIOC_QUERYCAP: OK 
	test VIDIOC_G/S_PRIORITY: OK 
	test for unlimited opens: OK 
 
Debug ioctls: 
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported) 
	test VIDIOC_LOG_STATUS: OK (Not Supported) 
 
Input ioctls: 
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported) 
	test VIDIOC_ENUMAUDIO: OK (Not Supported) 
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDIO: OK (Not Supported) 
	Inputs: 0 Audio Inputs: 0 Tuners: 0 
 
Output ioctls: 
	test VIDIOC_G/S_MODULATOR: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_ENUMAUDOUT: OK (Not Supported) 
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDOUT: OK (Not Supported) 
	Outputs: 0 Audio Outputs: 0 Modulators: 0 
 
Input/Output configuration ioctls: 
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported) 
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported) 
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported) 
	test VIDIOC_G/S_EDID: OK (Not Supported) 
 
Control ioctls: 
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK 
	test VIDIOC_QUERYCTRL: OK 
	test VIDIOC_G/S_CTRL: OK 
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK 
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK 
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported) 
	Standard Controls: 1 Private Controls: 1 
 
Format ioctls: 
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK 
	test VIDIOC_G/S_PARM: OK (Not Supported) 
	test VIDIOC_G_FBUF: OK (Not Supported) 
	test VIDIOC_G_FMT: OK 
	test VIDIOC_TRY_FMT: OK 
	test VIDIOC_S_FMT: OK 
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported) 
	test Cropping: OK (Not Supported) 
	test Composing: OK (Not Supported) 
	test Scaling: OK 
 
Codec ioctls: 
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported) 
	test VIDIOC_G_ENC_INDEX: OK (Not Supported) 
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported) 
 
Buffer ioctls: 
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK 
	test VIDIOC_EXPBUF: OK 
	test Requests: OK 
 
Total for MTK-ISP-DIP-CAP device /dev/video7: 45, Succeeded: 45, Failed: 0, Warnings: 0 
-------------------------------------------------------------------------------- 
Compliance test for camera-dip device /dev/v4l-subdev2: 
 
Media Driver Info: 
	Driver name      : camera-dip 
	Model            : MTK-ISP-DIP-V4L2 
	Serial           :  
	Bus info         : platform:15022000.dip 
	Media version    : 4.19.29 
	Hardware revision: 0x00000000 (0) 
	Driver version   : 4.19.29 
Interface Info: 
	ID               : 0x03000044 
	Type             : V4L Sub-Device 
Entity Info: 
	ID               : 0x0000003f (63) 
	Name             : MTK-ISP-DIP-REP-V4L2 
	Function         : Video Pixel Formatter 
	Pad 0x01000040   : 0: Sink 
	  Link 0x0200004a: from remote pad 0x1000047 of entity 'MTK-ISP-DIP-REP-V4L2 Raw Input': Data, Enabled 
	Pad 0x01000041   : 1: Sink 
	  Link 0x02000050: from remote pad 0x100004d of entity 'MTK-ISP-DIP-REP-V4L2 Tuning': Data 
	Pad 0x01000042   : 2: Source 
	  Link 0x02000056: to remote pad 0x1000053 of entity 'MTK-ISP-DIP-REP-V4L2 MDP0': Data, Enabled, Dynamic 
	Pad 0x01000043   : 3: Source 
	  Link 0x0200005c: to remote pad 0x1000059 of entity 'MTK-ISP-DIP-REP-V4L2 MDP1': Data, Enabled, Dynamic 
 
Required ioctls: 
	test MC information (see 'Media Driver Info' above): OK 
 
Allow for multiple opens: 
	test second /dev/v4l-subdev2 open: OK 
	test for unlimited opens: OK 
 
Debug ioctls: 
	test VIDIOC_LOG_STATUS: OK (Not Supported) 
 
Input ioctls: 
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported) 
	test VIDIOC_ENUMAUDIO: OK (Not Supported) 
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDIO: OK (Not Supported) 
	Inputs: 0 Audio Inputs: 0 Tuners: 0 
 
Output ioctls: 
	test VIDIOC_G/S_MODULATOR: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_ENUMAUDOUT: OK (Not Supported) 
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDOUT: OK (Not Supported) 
	Outputs: 0 Audio Outputs: 0 Modulators: 0 
 
Input/Output configuration ioctls: 
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported) 
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported) 
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported) 
	test VIDIOC_G/S_EDID: OK (Not Supported) 
 
Sub-Device ioctls (Sink Pad 0): 
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported) 
 
Sub-Device ioctls (Sink Pad 1): 
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported) 
 
Sub-Device ioctls (Source Pad 2): 
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported) 
 
Sub-Device ioctls (Source Pad 3): 
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported) 
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported) 
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported) 
 
Control ioctls: 
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK 
	test VIDIOC_QUERYCTRL: OK 
	test VIDIOC_G/S_CTRL: OK 
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK 
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK 
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported) 
	Standard Controls: 2 Private Controls: 0 
 
Format ioctls: 
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported) 
	test VIDIOC_G/S_PARM: OK (Not Supported) 
	test VIDIOC_G_FBUF: OK (Not Supported) 
	test VIDIOC_G_FMT: OK (Not Supported) 
	test VIDIOC_TRY_FMT: OK (Not Supported) 
	test VIDIOC_S_FMT: OK (Not Supported) 
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported) 
	test Cropping: OK (Not Supported) 
	test Composing: OK (Not Supported) 
	test Scaling: OK (Not Supported) 
 
Codec ioctls: 
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported) 
	test VIDIOC_G_ENC_INDEX: OK (Not Supported) 
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported) 
 
Buffer ioctls: 
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported) 
	test VIDIOC_EXPBUF: OK (Not Supported) 
	test Requests: OK (Not Supported) 
 
Total for camera-dip device /dev/v4l-subdev2: 69, Succeeded: 69, Failed: 0, Warnings: 0 
-------------------------------------------------------------------------------- 
Compliance test for MTK-ISP-DIP-REP device /dev/video8: 
 
Driver Info: 
	Driver name      : MTK-ISP-DIP-REP 
	Card type        : MTK-ISP-DIP-REP-V4L2 
	Bus info         : platform:15022000.dip 
	Driver version   : 4.19.29 
	Capabilities     : 0x84202000 
		Video Output Multiplanar 
		Streaming 
		Extended Pix Format 
		Device Capabilities 
	Device Caps      : 0x04202000 
		Video Output Multiplanar 
		Streaming 
		Extended Pix Format 
Media Driver Info: 
	Driver name      : camera-dip 
	Model            : MTK-ISP-DIP-V4L2 
	Serial           :  
	Bus info         : platform:15022000.dip 
	Media version    : 4.19.29 
	Hardware revision: 0x00000000 (0) 
	Driver version   : 4.19.29 
Interface Info: 
	ID               : 0x03000048 
	Type             : V4L Video 
Entity Info: 
	ID               : 0x00000046 (70) 
	Name             : MTK-ISP-DIP-REP-V4L2 Raw Input 
	Function         : V4L2 I/O 
	Pad 0x01000047   : 0: Source 
	  Link 0x0200004a: to remote pad 0x1000040 of entity 'MTK-ISP-DIP-REP-V4L2': Data, Enabled 
 
Required ioctls: 
	test MC information (see 'Media Driver Info' above): OK 
	test VIDIOC_QUERYCAP: OK 
 
Allow for multiple opens: 
	test second /dev/video8 open: OK 
	test VIDIOC_QUERYCAP: OK 
	test VIDIOC_G/S_PRIORITY: OK 
	test for unlimited opens: OK 
 
Debug ioctls: 
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported) 
	test VIDIOC_LOG_STATUS: OK (Not Supported) 
 
Input ioctls: 
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported) 
	test VIDIOC_ENUMAUDIO: OK (Not Supported) 
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDIO: OK (Not Supported) 
	Inputs: 0 Audio Inputs: 0 Tuners: 0 
 
Output ioctls: 
	test VIDIOC_G/S_MODULATOR: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_ENUMAUDOUT: OK (Not Supported) 
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDOUT: OK (Not Supported) 
	Outputs: 0 Audio Outputs: 0 Modulators: 0 
 
Input/Output configuration ioctls: 
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported) 
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported) 
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported) 
	test VIDIOC_G/S_EDID: OK (Not Supported) 
 
Control ioctls: 
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK 
	test VIDIOC_QUERYCTRL: OK 
	test VIDIOC_G/S_CTRL: OK 
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK 
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK 
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported) 
	Standard Controls: 1 Private Controls: 1 
 
Format ioctls: 
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK 
	test VIDIOC_G/S_PARM: OK (Not Supported) 
	test VIDIOC_G_FBUF: OK (Not Supported) 
	test VIDIOC_G_FMT: OK 
	test VIDIOC_TRY_FMT: OK 
	test VIDIOC_S_FMT: OK 
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported) 
	test Cropping: OK (Not Supported) 
	test Composing: OK (Not Supported) 
	test Scaling: OK 
 
Codec ioctls: 
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported) 
	test VIDIOC_G_ENC_INDEX: OK (Not Supported) 
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported) 
 
Buffer ioctls: 
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK 
	test VIDIOC_EXPBUF: OK 
	test Requests: OK 
 
Total for MTK-ISP-DIP-REP device /dev/video8: 45, Succeeded: 45, Failed: 0, Warnings: 0 
-------------------------------------------------------------------------------- 
Compliance test for MTK-ISP-DIP-REP device /dev/video9: 
 
Driver Info: 
	Driver name      : MTK-ISP-DIP-REP 
	Card type        : MTK-ISP-DIP-REP-V4L2 
	Bus info         : platform:15022000.dip 
	Driver version   : 4.19.29 
	Capabilities     : 0x8c200000 
		Streaming 
		Extended Pix Format 
		Device Capabilities 
	Device Caps      : 0x0c200000 
		Streaming 
		Extended Pix Format 
Media Driver Info: 
	Driver name      : camera-dip 
	Model            : MTK-ISP-DIP-V4L2 
	Serial           :  
	Bus info         : platform:15022000.dip 
	Media version    : 4.19.29 
	Hardware revision: 0x00000000 (0) 
	Driver version   : 4.19.29 
Interface Info: 
	ID               : 0x0300004e 
	Type             : V4L Video 
Entity Info: 
	ID               : 0x0000004c (76) 
	Name             : MTK-ISP-DIP-REP-V4L2 Tuning 
	Function         : V4L2 I/O 
	Pad 0x0100004d   : 0: Source 
	  Link 0x02000050: to remote pad 0x1000041 of entity 'MTK-ISP-DIP-REP-V4L2': Data 
 
Required ioctls: 
	test MC information (see 'Media Driver Info' above): OK 
	test VIDIOC_QUERYCAP: OK 
 
Allow for multiple opens: 
	test second /dev/video9 open: OK 
	test VIDIOC_QUERYCAP: OK 
	test VIDIOC_G/S_PRIORITY: OK 
	test for unlimited opens: OK 
 
Debug ioctls: 
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported) 
	test VIDIOC_LOG_STATUS: OK (Not Supported) 
 
Input ioctls: 
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported) 
	test VIDIOC_ENUMAUDIO: OK (Not Supported) 
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDIO: OK (Not Supported) 
	Inputs: 0 Audio Inputs: 0 Tuners: 0 
 
Output ioctls: 
	test VIDIOC_G/S_MODULATOR: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_ENUMAUDOUT: OK (Not Supported) 
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDOUT: OK (Not Supported) 
	Outputs: 0 Audio Outputs: 0 Modulators: 0 
 
Input/Output configuration ioctls: 
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported) 
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported) 
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported) 
	test VIDIOC_G/S_EDID: OK (Not Supported) 
 
Control ioctls: 
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK 
	test VIDIOC_QUERYCTRL: OK 
	test VIDIOC_G/S_CTRL: OK 
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK 
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported) 
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported) 
	Standard Controls: 0 Private Controls: 0 
 
Format ioctls: 
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK 
	test VIDIOC_G/S_PARM: OK (Not Supported) 
	test VIDIOC_G_FBUF: OK (Not Supported) 
	test VIDIOC_G_FMT: OK 
	test VIDIOC_TRY_FMT: OK 
	test VIDIOC_S_FMT: OK 
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported) 
	test Cropping: OK (Not Supported) 
	test Composing: OK (Not Supported) 
	test Scaling: OK (Not Supported) 
 
Codec ioctls: 
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported) 
	test VIDIOC_G_ENC_INDEX: OK (Not Supported) 
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported) 
 
Buffer ioctls: 
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK 
	test VIDIOC_EXPBUF: OK 
	test Requests: OK 
 
Total for MTK-ISP-DIP-REP device /dev/video9: 45, Succeeded: 45, Failed: 0, Warnings: 0 
-------------------------------------------------------------------------------- 
Compliance test for MTK-ISP-DIP-REP device /dev/video10: 
 
Driver Info: 
	Driver name      : MTK-ISP-DIP-REP 
	Card type        : MTK-ISP-DIP-REP-V4L2 
	Bus info         : platform:15022000.dip 
	Driver version   : 4.19.29 
	Capabilities     : 0x84201000 
		Video Capture Multiplanar 
		Streaming 
		Extended Pix Format 
		Device Capabilities 
	Device Caps      : 0x04201000 
		Video Capture Multiplanar 
		Streaming 
		Extended Pix Format 
Media Driver Info: 
	Driver name      : camera-dip 
	Model            : MTK-ISP-DIP-V4L2 
	Serial           :  
	Bus info         : platform:15022000.dip 
	Media version    : 4.19.29 
	Hardware revision: 0x00000000 (0) 
	Driver version   : 4.19.29 
Interface Info: 
	ID               : 0x03000054 
	Type             : V4L Video 
Entity Info: 
	ID               : 0x00000052 (82) 
	Name             : MTK-ISP-DIP-REP-V4L2 MDP0 
	Function         : V4L2 I/O 
	Pad 0x01000053   : 0: Sink 
	  Link 0x02000056: from remote pad 0x1000042 of entity 'MTK-ISP-DIP-REP-V4L2': Data, Enabled, Dynamic 
 
Required ioctls: 
	test MC information (see 'Media Driver Info' above): OK 
	test VIDIOC_QUERYCAP: OK 
 
Allow for multiple opens: 
	test second /dev/video10 open: OK 
	test VIDIOC_QUERYCAP: OK 
	test VIDIOC_G/S_PRIORITY: OK 
	test for unlimited opens: OK 
 
Debug ioctls: 
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported) 
	test VIDIOC_LOG_STATUS: OK (Not Supported) 
 
Input ioctls: 
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported) 
	test VIDIOC_ENUMAUDIO: OK (Not Supported) 
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDIO: OK (Not Supported) 
	Inputs: 0 Audio Inputs: 0 Tuners: 0 
 
Output ioctls: 
	test VIDIOC_G/S_MODULATOR: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_ENUMAUDOUT: OK (Not Supported) 
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDOUT: OK (Not Supported) 
	Outputs: 0 Audio Outputs: 0 Modulators: 0 
 
Input/Output configuration ioctls: 
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported) 
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported) 
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported) 
	test VIDIOC_G/S_EDID: OK (Not Supported) 
 
Control ioctls: 
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK 
	test VIDIOC_QUERYCTRL: OK 
	test VIDIOC_G/S_CTRL: OK 
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK 
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK 
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported) 
	Standard Controls: 1 Private Controls: 1 
 
Format ioctls: 
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK 
	test VIDIOC_G/S_PARM: OK (Not Supported) 
	test VIDIOC_G_FBUF: OK (Not Supported) 
	test VIDIOC_G_FMT: OK 
	test VIDIOC_TRY_FMT: OK 
	test VIDIOC_S_FMT: OK 
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported) 
	test Cropping: OK (Not Supported) 
	test Composing: OK (Not Supported) 
	test Scaling: OK 
 
Codec ioctls: 
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported) 
	test VIDIOC_G_ENC_INDEX: OK (Not Supported) 
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported) 
 
Buffer ioctls: 
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK 
	test VIDIOC_EXPBUF: OK 
	test Requests: OK 
 
Total for MTK-ISP-DIP-REP device /dev/video10: 45, Succeeded: 45, Failed: 0, Warnings: 0 
-------------------------------------------------------------------------------- 
Compliance test for MTK-ISP-DIP-REP device /dev/video11: 
 
Driver Info: 
	Driver name      : MTK-ISP-DIP-REP 
	Card type        : MTK-ISP-DIP-REP-V4L2 
	Bus info         : platform:15022000.dip 
	Driver version   : 4.19.29 
	Capabilities     : 0x84201000 
		Video Capture Multiplanar 
		Streaming 
		Extended Pix Format 
		Device Capabilities 
	Device Caps      : 0x04201000 
		Video Capture Multiplanar 
		Streaming 
		Extended Pix Format 
Media Driver Info: 
	Driver name      : camera-dip 
	Model            : MTK-ISP-DIP-V4L2 
	Serial           :  
	Bus info         : platform:15022000.dip 
	Media version    : 4.19.29 
	Hardware revision: 0x00000000 (0) 
	Driver version   : 4.19.29 
Interface Info: 
	ID               : 0x0300005a 
	Type             : V4L Video 
Entity Info: 
	ID               : 0x00000058 (88) 
	Name             : MTK-ISP-DIP-REP-V4L2 MDP1 
	Function         : V4L2 I/O 
	Pad 0x01000059   : 0: Sink 
	  Link 0x0200005c: from remote pad 0x1000043 of entity 'MTK-ISP-DIP-REP-V4L2': Data, Enabled, Dynamic 
 
Required ioctls: 
	test MC information (see 'Media Driver Info' above): OK 
	test VIDIOC_QUERYCAP: OK 
 
Allow for multiple opens: 
	test second /dev/video11 open: OK 
	test VIDIOC_QUERYCAP: OK 
	test VIDIOC_G/S_PRIORITY: OK 
	test for unlimited opens: OK 
 
Debug ioctls: 
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported) 
	test VIDIOC_LOG_STATUS: OK (Not Supported) 
 
Input ioctls: 
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported) 
	test VIDIOC_ENUMAUDIO: OK (Not Supported) 
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDIO: OK (Not Supported) 
	Inputs: 0 Audio Inputs: 0 Tuners: 0 
 
Output ioctls: 
	test VIDIOC_G/S_MODULATOR: OK (Not Supported) 
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported) 
	test VIDIOC_ENUMAUDOUT: OK (Not Supported) 
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported) 
	test VIDIOC_G/S_AUDOUT: OK (Not Supported) 
	Outputs: 0 Audio Outputs: 0 Modulators: 0 
 
Input/Output configuration ioctls: 
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported) 
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported) 
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported) 
	test VIDIOC_G/S_EDID: OK (Not Supported) 
 
Control ioctls: 
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK 
	test VIDIOC_QUERYCTRL: OK 
	test VIDIOC_G/S_CTRL: OK 
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK 
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK 
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported) 
	Standard Controls: 1 Private Controls: 1 
 
Format ioctls: 
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK 
	test VIDIOC_G/S_PARM: OK (Not Supported) 
	test VIDIOC_G_FBUF: OK (Not Supported) 
	test VIDIOC_G_FMT: OK 
	test VIDIOC_TRY_FMT: OK 
	test VIDIOC_S_FMT: OK 
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported) 
	test Cropping: OK (Not Supported) 
	test Composing: OK (Not Supported) 
	test Scaling: OK 
 
Codec ioctls: 
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported) 
	test VIDIOC_G_ENC_INDEX: OK (Not Supported) 
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported) 
 
Buffer ioctls: 
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK 
	test VIDIOC_EXPBUF: OK 
	test Requests: OK 
 
Total for MTK-ISP-DIP-REP device /dev/video11: 45, Succeeded: 45, Failed: 0, Warnings: 0 
 
Grand Total for camera-dip device /dev/media0: 754, Succeeded: 754, Failed: 0, Warnings: 0 


Frederic Chen (6):
  dt-bindings: mt8183: Add binding for DIP shared memory
  dts: arm64: mt8183: Add DIP shared memory node
  dt-bindings: mt8183: Added DIP dt-bindings
  dts: arm64: mt8183: Add DIP nodes
  media: platform: Add Mediatek DIP driver KConfig
  platform: mtk-isp: Add Mediatek DIP driver

 .../bindings/media/mediatek,mt8183-dip.txt    |   35 +
 .../mediatek,reserve-memory-dip_smem.txt      |   45 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   29 +
 drivers/media/platform/Kconfig                |    2 +
 drivers/media/platform/mtk-isp/Kconfig        |   21 +
 drivers/media/platform/mtk-isp/Makefile       |   18 +
 .../media/platform/mtk-isp/isp_50/Makefile    |   17 +
 .../platform/mtk-isp/isp_50/dip/Makefile      |   32 +
 .../mtk-isp/isp_50/dip/mtk_dip-ctrl.c         |  124 ++
 .../platform/mtk-isp/isp_50/dip/mtk_dip-dev.c | 1116 +++++++++++++
 .../platform/mtk-isp/isp_50/dip/mtk_dip-dev.h |  321 ++++
 .../platform/mtk-isp/isp_50/dip/mtk_dip-hw.h  |  167 ++
 .../mtk-isp/isp_50/dip/mtk_dip-smem.c         |  322 ++++
 .../mtk-isp/isp_50/dip/mtk_dip-smem.h         |   39 +
 .../platform/mtk-isp/isp_50/dip/mtk_dip-sys.c | 1384 +++++++++++++++++
 .../mtk-isp/isp_50/dip/mtk_dip-v4l2.c         | 1310 ++++++++++++++++
 16 files changed, 4982 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-dip.txt
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
 create mode 100644 drivers/media/platform/mtk-isp/Kconfig
 create mode 100644 drivers/media/platform/mtk-isp/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-ctrl.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-smem.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-smem.h
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-v4l2.c

-- 
2.18.0
