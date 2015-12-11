From: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/8] Add MT8173 Video Encoder Driver and VPU Driver
Date: Fri, 11 Dec 2015 17:55:35 +0800
Message-ID: <1449827743-22895-1-git-send-email-tiffany.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Mikhail Ulyanov <mikhail.ulyanov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Darren Etheridge <detheridge-l0cyMroinI0@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
Cc: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Daniel Hsiao <daniel.hsiao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, PoChun.Lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

==============
 Introduction
==============

The purpose of this RFC is to discuss the driver for a hw video codec
embedded in the Mediatek's MT8173 SoCs. Mediatek Video Codec is able to
handle video encoding of in a range of formats.

This RFC also include VPU driver. Mediatek Video Codec driver rely on
VPU driver to load, communicate with VPU.

Internally the driver uses videobuf2 framework and MTK IOMMU and MTK SMI.
MTK IOMMU and MTK SMI have not yet been merged, but we wanted to start
discussion about the driver earlier so it could be merged sooner. The
driver posted here is the initial version, so I suppose it will require
more work.

[1]http://lists.infradead.org/pipermail/linux-mediatek/2015-October/002525.html

==================
 Device interface
==================

In principle the driver bases on memory-to-memory framework:
it provides a single video node and each opened file handle gets its own
private context with separate buffer queues. Each context consist of 2
buffer queues: OUTPUT (for source buffers, i.e. raw video frames)
and CAPTURE (for destination buffers, i.e. encoded video frames).

The process of encoding video data from stream is a bit more complicated
than typical memory-to-memory processing. We base on memory-to-memory
framework and add the complicated part in our vb2 and v4l2 callback 
functionss. So we can base on well done m2m memory-to-memory framework, 
reduce duplicate code and make our driver code simple.

==============================
 VPU (Video Processor Unit)
==============================
The VPU driver for hw video codec embedded in Mediatek's MT8173 SOCs.
It is able to handle video decoding/encoding of in a range of formats.
The driver provides with VPU firmware download, memory management and
the communication interface between CPU and VPU.
For VPU initialization, it will create virtual memory for CPU access and
IOMMU address for vcodec hw device access. When a decode/encode instance
opens a device node, vpu driver will download vpu firmware to the device.
A decode/encode instant will decode/encode a frame using VPU 
interface to interrupt vpu to handle decoding/encoding jobs.

Please have a look at the code and comments will be very much appreciated.

Change in v2:
Vcodec Part
1.Remove common and include directory in mtk-vcodec
2.Refine vb2ops_venc_start_streaming and vb2ops_venc_stop_streaming and state machine
3.Remove venc_if_init and venc_if_deinit
4.Refine debug message
5.Refine lab and vpu decription in mediatek-vcodec.txt

VPU Part
1. Modify VPU Kconfig
2. Move encoder header files to other patch sets
3. Remove marcos for extended virtual/iova address
4. Change register and variable names
5. Add a reference counter for VPU watchdog
6. Remove one busy waiting in function vpu_ipi_send
7. Operate VPU clock in VPU driver (not called by encoder drivers)
8. Refine memory mapping, firmware download and extended memory allocation/free functions
9. Release more allocated resources in driver remove function

Andrew-CT Chen (2):
  dt-bindings: Add a binding for Mediatek Video Processor
  [Media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver

Tiffany Lin (6):
  arm64: dts: mediatek: Add node for Mediatek Video Processor Unit
  [media] VPU: mediatek: support Mediatek VPU
  dt-bindings: Add a binding for Mediatek Video Encoder
  arm64: dts: mediatek: Add Video Encoder for MT8173
  [media] vcodec: mediatek: Add Mediatek VP8 Video Encoder Driver
  [media] vcodec: mediatek: Add Mediatek H264 Video Encoder Driver

 .../devicetree/bindings/media/mediatek-vcodec.txt  |   58 +
 .../devicetree/bindings/media/mediatek-vpu.txt     |   27 +
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |   58 +
 drivers/media/platform/Kconfig                     |   21 +
 drivers/media/platform/Makefile                    |    4 +
 drivers/media/platform/mtk-vcodec/Makefile         |   11 +
 .../media/platform/mtk-vcodec/h264_enc/Makefile    |    8 +
 .../platform/mtk-vcodec/h264_enc/venc_h264_if.c    |  495 ++++++
 .../platform/mtk-vcodec/h264_enc/venc_h264_if.h    |  161 ++
 .../platform/mtk-vcodec/h264_enc/venc_h264_vpu.c   |  316 ++++
 .../platform/mtk-vcodec/h264_enc/venc_h264_vpu.h   |   30 +
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |  412 +++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 1670 ++++++++++++++++++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h |   45 +
 .../media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c |  469 ++++++
 .../media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c  |  122 ++
 .../media/platform/mtk-vcodec/mtk_vcodec_intr.c    |  102 ++
 .../media/platform/mtk-vcodec/mtk_vcodec_intr.h    |   29 +
 drivers/media/platform/mtk-vcodec/mtk_vcodec_pm.h  |   26 +
 .../media/platform/mtk-vcodec/mtk_vcodec_util.c    |  106 ++
 .../media/platform/mtk-vcodec/mtk_vcodec_util.h    |   85 +
 drivers/media/platform/mtk-vcodec/venc_drv_base.h  |   62 +
 drivers/media/platform/mtk-vcodec/venc_drv_if.c    |  108 ++
 drivers/media/platform/mtk-vcodec/venc_drv_if.h    |  174 ++
 drivers/media/platform/mtk-vcodec/venc_ipi_msg.h   |  212 +++
 drivers/media/platform/mtk-vcodec/vp8_enc/Makefile |    8 +
 .../platform/mtk-vcodec/vp8_enc/venc_vp8_if.c      |  384 +++++
 .../platform/mtk-vcodec/vp8_enc/venc_vp8_if.h      |  141 ++
 .../platform/mtk-vcodec/vp8_enc/venc_vp8_vpu.c     |  221 +++
 .../platform/mtk-vcodec/vp8_enc/venc_vp8_vpu.h     |   28 +
 drivers/media/platform/mtk-vpu/Makefile            |    1 +
 drivers/media/platform/mtk-vpu/mtk_vpu.c           |  859 ++++++++++
 drivers/media/platform/mtk-vpu/mtk_vpu.h           |  149 ++
 33 files changed, 6602 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-vpu.txt
 create mode 100644 drivers/media/platform/mtk-vcodec/Makefile
 create mode 100644 drivers/media/platform/mtk-vcodec/h264_enc/Makefile
 create mode 100644 drivers/media/platform/mtk-vcodec/h264_enc/venc_h264_if.c
 create mode 100644 drivers/media/platform/mtk-vcodec/h264_enc/venc_h264_if.h
 create mode 100644 drivers/media/platform/mtk-vcodec/h264_enc/venc_h264_vpu.c
 create mode 100644 drivers/media/platform/mtk-vcodec/h264_enc/venc_h264_vpu.h
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_pm.h
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
 create mode 100644 drivers/media/platform/mtk-vcodec/venc_drv_base.h
 create mode 100644 drivers/media/platform/mtk-vcodec/venc_drv_if.c
 create mode 100644 drivers/media/platform/mtk-vcodec/venc_drv_if.h
 create mode 100644 drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
 create mode 100644 drivers/media/platform/mtk-vcodec/vp8_enc/Makefile
 create mode 100644 drivers/media/platform/mtk-vcodec/vp8_enc/venc_vp8_if.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vp8_enc/venc_vp8_if.h
 create mode 100644 drivers/media/platform/mtk-vcodec/vp8_enc/venc_vp8_vpu.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vp8_enc/venc_vp8_vpu.h
 create mode 100644 drivers/media/platform/mtk-vpu/Makefile
 create mode 100644 drivers/media/platform/mtk-vpu/mtk_vpu.c
 create mode 100644 drivers/media/platform/mtk-vpu/mtk_vpu.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
