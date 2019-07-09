From: Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
Subject: [RFC PATCH V2 0/4] media: platform: Add support for Face Detection
 (FD) on mt8183 SoC
Date: Tue, 9 Jul 2019 16:41:08 +0800
Message-ID: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
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
Cc: shik@chromium.org, devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com, po-yang.huang@mediatek.com, suleiman@chromium.org, Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, zwisler@chromium.org, christie.yu@mediatek.com, frederic.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

This RFC patch series is adding Face Detection (FD) driver on Mediatek
mt8183 SoC. It belongs to the first Mediatek's camera driver series based
on V4L2 and media controller framework. I posted the main part of the FD
driver as RFC to discuss first and would like some review comments.

==============
Introduction
==============

Face Detection (FD) unit provides hardware accelerated face detection
feature. It can detect different sizes of faces in a given image.

The driver is implemented as a normal V4L2 memory-to-memory device and
supports V4L2 controls for detection settings. It has two buffer queues.

1. Video output buffer: RAW image for face detection.

2. Meta capture buffer: Result of the detected faces.

==================
Changes in v2
==================

RFC v2 includes the following modification:
1. Implement FD as a V4L2 mem2mem driver

2. Replace meta input with V4L2 controls

==================
Changes in v1
==================

RFC v1 includes the following modification:
1. Uses Request API instead of FD's buffer collection design

2. removed unnecessary abstraction structurally, including mtk_fd_ctx and
related ops

3. removed the fd_smem node from device tree

4. Fixed the common issues Tomasz commented on Mediatek ISP Pass 1's RFC v0
patch series

==================
Dependent patch
==================

FD driver depends on SCP driver. The patches are as following:

[1]. Add support for mt8183 SCP
https://patchwork.kernel.org/cover/10991065/

==================
Compliance test
==================

* Version: https://git.linuxtv.org/v4l-utils.git/commit/?id=b16f9e945d74aa5
* Note: Those 4 failures are caused by the implementation of FD driver,
        whic is a m2m device with VIDEO_OUT and META_CAPTURE queues,
        therefore we can't set V4L2_CAP_VIDEO_M2M in device capability, and
        fail in some non-m2m v4l2 test cases.
* Test command: v4l2-compliance -m 2
* test output:

v4l2-compliance SHA: not available, 32 bits

Compliance test for mtk-fd-4.0 device /dev/media2:

Media Driver Info:
        Driver name      : mtk-fd-4.0
        Model            : MTK-FD-V4L2
        Serial           :
        Bus info         : platform:1502b000.fd
        Media version    : 4.19.56
        Hardware revision: 0x00000000 (0)
        Driver version   : 4.19.56

Required ioctls:
        test MEDIA_IOC_DEVICE_INFO: OK

Allow for multiple opens:
        test second /dev/media2 open: OK
        test MEDIA_IOC_DEVICE_INFO: OK
        test for unlimited opens: OK

Media Controller ioctls:
        test MEDIA_IOC_G_TOPOLOGY: OK
        Entities: 3 Interfaces: 1 Pads: 4 Links: 4
        test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
        test MEDIA_IOC_SETUP_LINK: OK

Total for mtk-fd-4.0 device /dev/media2: 7, Succeeded: 7, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-fd-4.0 device /dev/video31:

Driver Info:
        Driver name      : mtk-fd-4.0
        Card type        : MTK-FD-V4L2
        Bus info         : platform:1502b000.fd
        Driver version   : 4.19.56
        Capabilities     : 0x84a02000
                Video Output Multiplanar
                Metadata Capture
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04a02000
                Video Output Multiplanar
                Metadata Capture
                Streaming
                Extended Pix Format
Media Driver Info:
        Driver name      : mtk-fd-4.0
        Model            : MTK-FD-V4L2
        Serial           :
        Bus info         : platform:1502b000.fd
        Media version    : 4.19.56
        Hardware revision: 0x00000000 (0)
        Driver version   : 4.19.56
Interface Info:
        ID               : 0x0300000c
        Type             : V4L Video
Entity Info:
        ID               : 0x00000001 (1)
        Name             : MTK-FD-V4L2-source
        Function         : V4L2 I/O
        Pad 0x01000002   : 0: Source
          Link 0x02000008: to remote pad 0x1000005 of entity 'MTK-FD-V4L2-proc': Data, Enabled, Immutable

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
                fail: v4l2-compliance.cpp(668): dcaps & output_caps
        test VIDIOC_QUERYCAP: FAIL

Allow for multiple opens:
        test second /dev/video31 open: OK
                fail: v4l2-compliance.cpp(668): dcaps & output_caps
        test VIDIOC_QUERYCAP: FAIL
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
        Standard Controls: 1 Private Controls: 6

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
                fail: v4l2-test-formats.cpp(1014): Global format mismatch: 59555956(VYUY)/26x26 vs 56595559(YUYV)/26x26
        test VIDIOC_S_FMT: FAIL
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
                fail: v4l2-test-buffers.cpp(667): q2.reqbufs(node->node2, 1) != EBUSY
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
        test VIDIOC_EXPBUF: OK
        test Requests: OK

Total for mtk-fd-4.0 device /dev/video31: 45, Succeeded: 41, Failed: 4, Warnings: 0

Grand Total for mtk-fd-4.0 device /dev/media2: 52, Succeeded: 48, Failed: 4, Warnings: 0

Jerry-ch Chen (4):
  dt-bindings: mt8183: Added FD dt-bindings
  dts: arm64: mt8183: Add FD nodes
  media: platform: Add Mediatek FD driver KConfig
  platform: mtk-isp: Add Mediatek FD driver

 .../bindings/media/mediatek,mt8183-fd.txt     |   33 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   12 +
 drivers/media/platform/Kconfig                |    2 +
 drivers/media/platform/Makefile               |    2 +
 drivers/media/platform/mtk-isp/fd/Kconfig     |   17 +
 drivers/media/platform/mtk-isp/fd/Makefile    |    5 +
 drivers/media/platform/mtk-isp/fd/mtk_fd.h    |  157 ++
 drivers/media/platform/mtk-isp/fd/mtk_fd_40.c | 1259 +++++++++++++++++
 include/uapi/linux/v4l2-controls.h            |    4 +
 9 files changed, 1491 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt
 create mode 100644 drivers/media/platform/mtk-isp/fd/Kconfig
 create mode 100644 drivers/media/platform/mtk-isp/fd/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd.h
 create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd_40.c

-- 
2.18.0
