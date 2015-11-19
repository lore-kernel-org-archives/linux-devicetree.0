From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [RESEND RFC/PATCH 0/8] Add MT8173 Video Encoder Driver and VPU
 Driver
Date: Thu, 19 Nov 2015 08:40:37 +0100
Message-ID: <564D7CF5.6040504@xs4all.nl>
References: <1447764885-23100-1-git-send-email-tiffany.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447764885-23100-1-git-send-email-tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Mikhail Ulyanov <mikhail.ulyanov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Darren Etheridge <detheridge-l0cyMroinI0@public.gmane.org>, Peter Griffin <peter.gr>
Cc: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Daniel Hsiao <daniel.hsiao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/17/2015 01:54 PM, Tiffany Lin wrote:
> ==============
>  Introduction
> ==============
> 
> The purpose of this RFC is to discuss the driver for a hw video codec
> embedded in the Mediatek's MT8173 SoCs. Mediatek Video Codec is able to
> handle video encoding of in a range of formats.
> 
> This RFC also include VPU driver. Mediatek Video Codec driver rely on
> VPU driver to load, communicate with VPU.
> 
> Internally the driver uses videobuf2 framework and MTK IOMMU and MTK SMI.
> MTK IOMMU and MTK SMI have not yet been merged, but we wanted to start
> discussion about the driver earlier so it could be merged sooner. The
> driver posted here is the initial version, so I suppose it will require
> more work.

I plan on reviewing this patch series (at least the non-dt parts). It's busy,
though, and I don't know exactly when I get the chance. But just so you know
that someone will be reviewing it.

Regards,

	Hans

> 
> [1]http://lists.infradead.org/pipermail/linux-mediatek/2015-October/002525.html
> 
> ==================
>  Device interface
> ==================
> 
> In principle the driver bases on memory-to-memory framework:
> it provides a single video node and each opened file handle gets its own
> private context with separate buffer queues. Each context consist of 2
> buffer queues: OUTPUT (for source buffers, i.e. raw video frames)
> and CAPTURE (for destination buffers, i.e. encoded video frames).
> 
> The process of encoding video data from stream is a bit more complicated
> than typical memory-to-memory processing. We base on memory-to-memory
> framework and add the complicated part in our vb2 and v4l2 callback 
> functionss. So we can base on well done m2m memory-to-memory framework, 
> reduce duplicate code and make our driver code simple.
> 
> ==============================
>  VPU (Video Processor Unit)
> ==============================
> The VPU driver for hw video codec embedded in Mediatek's MT8173 SOCs.
> It is able to handle video decoding/encoding of in a range of formats.
> The driver provides with VPU firmware download, memory management and
> the communication interface between CPU and VPU.
> For VPU initialization, it will create virtual memory for CPU access and
> IOMMU address for vcodec hw device access. When a decode/encode instance
> opens a device node, vpu driver will download vpu firmware to the device.
> A decode/encode instant will decode/encode a frame using VPU 
> interface to interrupt vpu to handle decoding/encoding jobs.
> 
> Please have a look at the code and comments will be very much appreciated.
> 
> Andrew-CT Chen (3):
>   dt-bindings: Add a binding for Mediatek Video Processor Unit
>   arm64: dts: mediatek: Add node for Mediatek Video Processor Unit
>   media: platform: mtk-vpu: Support Mediatek VPU
> 
> Daniel Hsiao (1):
>   media: platform: mtk-vcodec: Add Mediatek VP8 Video Encoder Driver
> 
> Tiffany Lin (4):
>   dt-bindings: Add a binding for Mediatek Video Encoder
>   arm64: dts: mediatek: Add Video Encoder for MT8173
>   media: platform: mtk-vcodec: Add Mediatek V4L2 Video Encoder Driver
>   media: platform: mtk-vcodec: Add Mediatek H264 Video Encoder Driver
> 
>  .../devicetree/bindings/media/mediatek-vcodec.txt  |   58 +
>  .../devicetree/bindings/media/mediatek-vpu.txt     |   27 +
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi           |   58 +
>  drivers/media/platform/Kconfig                     |   19 +
>  drivers/media/platform/Makefile                    |    5 +
>  drivers/media/platform/mtk-vcodec/Kconfig          |    5 +
>  drivers/media/platform/mtk-vcodec/Makefile         |   12 +
>  drivers/media/platform/mtk-vcodec/common/Makefile  |   12 +
>  .../media/platform/mtk-vcodec/common/venc_drv_if.c |  159 ++
>  .../media/platform/mtk-vcodec/h264_enc/Makefile    |    9 +
>  .../platform/mtk-vcodec/h264_enc/venc_h264_if.c    |  529 ++++++
>  .../platform/mtk-vcodec/h264_enc/venc_h264_if.h    |   53 +
>  .../platform/mtk-vcodec/h264_enc/venc_h264_vpu.c   |  341 ++++
>  .../platform/mtk-vcodec/include/venc_drv_base.h    |   68 +
>  .../platform/mtk-vcodec/include/venc_drv_if.h      |  187 +++
>  .../platform/mtk-vcodec/include/venc_ipi_msg.h     |  212 +++
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |  441 +++++
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 1773 ++++++++++++++++++++
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h |   28 +
>  .../media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c |  535 ++++++
>  .../media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c  |  122 ++
>  .../media/platform/mtk-vcodec/mtk_vcodec_intr.c    |  110 ++
>  .../media/platform/mtk-vcodec/mtk_vcodec_intr.h    |   30 +
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_pm.h  |   26 +
>  .../media/platform/mtk-vcodec/mtk_vcodec_util.c    |  106 ++
>  .../media/platform/mtk-vcodec/mtk_vcodec_util.h    |   66 +
>  drivers/media/platform/mtk-vcodec/vp8_enc/Makefile |    9 +
>  .../platform/mtk-vcodec/vp8_enc/venc_vp8_if.c      |  371 ++++
>  .../platform/mtk-vcodec/vp8_enc/venc_vp8_if.h      |   48 +
>  .../platform/mtk-vcodec/vp8_enc/venc_vp8_vpu.c     |  245 +++
>  drivers/media/platform/mtk-vpu/Makefile            |    1 +
>  .../platform/mtk-vpu/h264_enc/venc_h264_vpu.h      |  127 ++
>  .../media/platform/mtk-vpu/include/venc_ipi_msg.h  |  212 +++
>  drivers/media/platform/mtk-vpu/mtk_vpu_core.c      |  823 +++++++++
>  drivers/media/platform/mtk-vpu/mtk_vpu_core.h      |  161 ++
>  .../media/platform/mtk-vpu/vp8_enc/venc_vp8_vpu.h  |  119 ++
>  36 files changed, 7107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec.txt
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-vpu.txt
>  create mode 100644 drivers/media/platform/mtk-vcodec/Kconfig
>  create mode 100644 drivers/media/platform/mtk-vcodec/Makefile
>  create mode 100644 drivers/media/platform/mtk-vcodec/common/Makefile
>  create mode 100644 drivers/media/platform/mtk-vcodec/common/venc_drv_if.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/h264_enc/Makefile
>  create mode 100644 drivers/media/platform/mtk-vcodec/h264_enc/venc_h264_if.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/h264_enc/venc_h264_if.h
>  create mode 100644 drivers/media/platform/mtk-vcodec/h264_enc/venc_h264_vpu.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/include/venc_drv_base.h
>  create mode 100644 drivers/media/platform/mtk-vcodec/include/venc_drv_if.h
>  create mode 100644 drivers/media/platform/mtk-vcodec/include/venc_ipi_msg.h
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_pm.h
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
>  create mode 100644 drivers/media/platform/mtk-vcodec/vp8_enc/Makefile
>  create mode 100644 drivers/media/platform/mtk-vcodec/vp8_enc/venc_vp8_if.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/vp8_enc/venc_vp8_if.h
>  create mode 100644 drivers/media/platform/mtk-vcodec/vp8_enc/venc_vp8_vpu.c
>  create mode 100644 drivers/media/platform/mtk-vpu/Makefile
>  create mode 100644 drivers/media/platform/mtk-vpu/h264_enc/venc_h264_vpu.h
>  create mode 100644 drivers/media/platform/mtk-vpu/include/venc_ipi_msg.h
>  create mode 100644 drivers/media/platform/mtk-vpu/mtk_vpu_core.c
>  create mode 100644 drivers/media/platform/mtk-vpu/mtk_vpu_core.h
>  create mode 100644 drivers/media/platform/mtk-vpu/vp8_enc/venc_vp8_vpu.h
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
