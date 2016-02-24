From: tiffany lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 5/8] [Media] vcodec: mediatek: Add Mediatek V4L2
 Video Encoder Driver
Date: Wed, 24 Feb 2016 16:26:44 +0800
Message-ID: <1456302404.15077.10.camel@mtksdaap41>
References: <1454585703-42428-1-git-send-email-tiffany.lin@mediatek.com>
	 <1454585703-42428-2-git-send-email-tiffany.lin@mediatek.com>
	 <1454585703-42428-3-git-send-email-tiffany.lin@mediatek.com>
	 <1454585703-42428-4-git-send-email-tiffany.lin@mediatek.com>
	 <1454585703-42428-5-git-send-email-tiffany.lin@mediatek.com>
	 <1454585703-42428-6-git-send-email-tiffany.lin@mediatek.com>
	 <CAOMLVLhX7XapATikjwTcjyH-dPQSaPNM6gvDJTZSQ0fPMqQm4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMLVLhX7XapATikjwTcjyH-dPQSaPNM6gvDJTZSQ0fPMqQm4g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wu-Cheng Li =?UTF-8?Q?=28=E6=9D=8E=E5=8B=99=E8=AA=A0=29?= <wuchengli-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lin PoChun <PoChun.Lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Wucheng,

On Tue, 2016-02-23 at 13:46 +0800, Wu-Cheng Li (=E6=9D=8E=E5=8B=99=E8=AA=
=A0) wrote:
> On Thu, Feb 4, 2016 at 7:35 PM, Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org=
> wrote:
> > From: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >
> > Add v4l2 layer encoder driver for MT8173
> >
> > Signed-off-by: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  drivers/media/platform/Kconfig                     |   11 +
> >  drivers/media/platform/Makefile                    |    2 +
> >  drivers/media/platform/mtk-vcodec/Makefile         |    8 +
> >  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |  388 ++++++
> >  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 1380 ++++++++=
++++++++++++
> >  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h |   46 +
> >  .../media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c |  476 +++++++
> >  .../media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c  |  132 ++
> >  .../media/platform/mtk-vcodec/mtk_vcodec_intr.c    |  102 ++
> >  .../media/platform/mtk-vcodec/mtk_vcodec_intr.h    |   29 +
> >  drivers/media/platform/mtk-vcodec/mtk_vcodec_pm.h  |   26 +
> >  .../media/platform/mtk-vcodec/mtk_vcodec_util.c    |  106 ++
> >  .../media/platform/mtk-vcodec/mtk_vcodec_util.h    |   85 ++
> >  drivers/media/platform/mtk-vcodec/venc_drv_base.h  |   62 +
> >  drivers/media/platform/mtk-vcodec/venc_drv_if.c    |  100 ++
> >  drivers/media/platform/mtk-vcodec/venc_drv_if.h    |  175 +++
> >  drivers/media/platform/mtk-vcodec/venc_ipi_msg.h   |  212 +++
> >  include/uapi/linux/v4l2-controls.h                 |    4 +
> >  18 files changed, 3344 insertions(+)
> >  create mode 100644 drivers/media/platform/mtk-vcodec/Makefile
> >  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dr=
v.h
> >  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_en=
c.c
> >  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_en=
c.h
> >  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_en=
c_drv.c
> >  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_en=
c_pm.c
> >  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_in=
tr.c
> >  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_in=
tr.h
> >  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_pm=
=2Eh
> >  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_ut=
il.c
> >  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_ut=
il.h
> >  create mode 100644 drivers/media/platform/mtk-vcodec/venc_drv_base=
=2Eh
> >  create mode 100644 drivers/media/platform/mtk-vcodec/venc_drv_if.c
> >  create mode 100644 drivers/media/platform/mtk-vcodec/venc_drv_if.h
> >  create mode 100644 drivers/media/platform/mtk-vcodec/venc_ipi_msg.=
h
> >  mode change 100644 =3D> 100755 include/uapi/linux/v4l2-controls.h
> >
> > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platfor=
m/Kconfig
> > index ba812d6..3e831c5 100644
> > --- a/drivers/media/platform/Kconfig
> > +++ b/drivers/media/platform/Kconfig
> > @@ -157,6 +157,17 @@ config VIDEO_MEDIATEK_VPU
> >             codec embedded in new Mediatek's SOCs. It is able
> >             to handle video decoding/encoding in a range of formats=
=2E
> >
> > +config VIDEO_MEDIATEK_VCODEC
> > +        tristate "Mediatek Video Codec driver"
> > +        depends on VIDEO_DEV && VIDEO_V4L2
> > +        depends on ARCH_MEDIATEK || COMPILE_TEST
> > +        select VIDEOBUF2_DMA_CONTIG
> > +        select V4L2_MEM2MEM_DEV
> > +        select MEDIATEK_VPU
> > +        default n
> > +        ---help---
> > +            Mediatek video codec driver for V4L2
> > +
> >  config VIDEO_MEM2MEM_DEINTERLACE
> >         tristate "Deinterlace support"
> >         depends on VIDEO_DEV && VIDEO_V4L2 && DMA_ENGINE
> > diff --git a/drivers/media/platform/Makefile b/drivers/media/platfo=
rm/Makefile
> > index e5b19c6..510e06b 100644
> > --- a/drivers/media/platform/Makefile
> > +++ b/drivers/media/platform/Makefile
> > @@ -57,3 +57,5 @@ obj-$(CONFIG_VIDEO_XILINX)            +=3D xilinx=
/
> >  ccflags-y +=3D -I$(srctree)/drivers/media/i2c
> >
> >  obj-$(CONFIG_VIDEO_MEDIATEK_VPU)       +=3D mtk-vpu/
> > +
> > +obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC)    +=3D mtk-vcodec/
> > diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/m=
edia/platform/mtk-vcodec/Makefile
> > new file mode 100644
> > index 0000000..ce38689
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/Makefile
> > @@ -0,0 +1,8 @@
> > +obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) +=3D mtk_vcodec_intr.o \
> > +                                      mtk_vcodec_util.o \
> > +                                      mtk_vcodec_enc_drv.o \
> > +                                      mtk_vcodec_enc.o \
> > +                                      mtk_vcodec_enc_pm.o \
> > +                                      venc_drv_if.o
> > +
> > +ccflags-y +=3D -I$(srctree)/drivers/media/platform/mtk-vpu
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/d=
rivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > new file mode 100644
> > index 0000000..9da2818
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > @@ -0,0 +1,388 @@
> > +/*
> > +* Copyright (c) 2015 MediaTek Inc.
> > +* Author: PC Chen <pc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > +*         Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > +*
> > +* This program is free software; you can redistribute it and/or mo=
dify
> > +* it under the terms of the GNU General Public License version 2 a=
s
> > +* published by the Free Software Foundation.
> > +*
> > +* This program is distributed in the hope that it will be useful,
> > +* but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > +* GNU General Public License for more details.
> > +*/
> > +
> > +#ifndef _MTK_VCODEC_DRV_H_
> > +#define _MTK_VCODEC_DRV_H_
> > +
> > +#include <linux/platform_device.h>
> > +#include <linux/videodev2.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-ioctl.h>
> > +#include <media/videobuf2-core.h>
> > +
> > +#include "mtk_vcodec_util.h"
> > +
> > +#define MTK_VCODEC_MAX_INSTANCES               10
> > +#define MTK_VCODEC_MAX_ENCODER_INSTANCES       3
> > +
> > +#define MTK_VCODEC_MAX_FRAME_SIZE      0x800000
> > +#define MTK_VIDEO_MAX_FRAME            32
> > +#define MTK_MAX_CTRLS                  20
> > +
> > +#define MTK_VCODEC_DRV_NAME            "mtk_vcodec_drv"
> > +#define MTK_VCODEC_ENC_NAME            "mtk-vcodec-enc"
> > +#define MTK_PLATFORM_STR               "platform:mt8173"
> > +
> > +#define MTK_VENC_IRQ_STATUS_SPS          0x1
> > +#define MTK_VENC_IRQ_STATUS_PPS          0x2
> > +#define MTK_VENC_IRQ_STATUS_FRM          0x4
> > +#define MTK_VENC_IRQ_STATUS_DRAM         0x8
> > +#define MTK_VENC_IRQ_STATUS_PAUSE        0x10
> > +#define MTK_VENC_IRQ_STATUS_SWITCH       0x20
> > +
> > +#define MTK_VENC_IRQ_STATUS_OFFSET       0x05C
> > +#define MTK_VENC_IRQ_ACK_OFFSET          0x060
> > +
> > +#define MTK_VCODEC_MAX_PLANES          3
> > +
> > +#define VDEC_HW_ACTIVE 0x10
> > +#define VDEC_IRQ_CFG    0x11
> > +#define VDEC_IRQ_CLR    0x10
> > +
> > +#define VDEC_IRQ_CFG_REG       0xa4
> > +#define WAIT_INTR_TIMEOUT      1000
> > +
> > +/**
> > + * enum mtk_hw_reg_idx - MTK hw register base index
> > + */
> > +enum mtk_hw_reg_idx {
> > +       VDEC_SYS,
> > +       VDEC_MISC,
> > +       VDEC_LD,
> > +       VDEC_TOP,
> > +       VDEC_CM,
> > +       VDEC_AD,
> > +       VDEC_AV,
> > +       VDEC_PP,
> > +       VDEC_HWD,
> > +       VDEC_HWQ,
> > +       VDEC_HWB,
> > +       VDEC_HWG,
> > +       NUM_MAX_VDEC_REG_BASE,
> > +       VENC_SYS =3D NUM_MAX_VDEC_REG_BASE,
> > +       VENC_LT_SYS,
> > +       NUM_MAX_VCODEC_REG_BASE
> > +};
> > +
> > +/**
> > + * enum mtk_instance_type - The type of an MTK Vcodec instance.
> > + */
> > +enum mtk_instance_type {
> > +       MTK_INST_DECODER                =3D 0,
> > +       MTK_INST_ENCODER                =3D 1,
> > +};
> > +
> > +/**
> > + * enum mtk_instance_state - The state of an MTK Vcodec instance.
> > + * @MTK_STATE_FREE - default state when instance is created
> > + * @MTK_STATE_INIT - vcodec instance is initialized
> > + * @MTK_STATE_HEADER - vdec had sps/pps header parsed or venc
> > + *                     had sps/pps header encoded
> > + * @MTK_STATE_FLUSH - vdec is flushing. Only used by decoder
> > + * @MTK_STATE_RES_CHANGE - vdec detect resolution change.
> > + *                     Only used by decoder
> > + * @MTK_STATE_ABORT - vcodec should be aborted
> > + */
> > +enum mtk_instance_state {
> > +       MTK_STATE_FREE =3D 0,
> > +       MTK_STATE_INIT =3D 1,
> > +       MTK_STATE_HEADER =3D 2,
> > +       MTK_STATE_FLUSH =3D 3,
> > +       MTK_STATE_RES_CHANGE =3D 4,
> > +       MTK_STATE_ABORT =3D 5,
> > +};
> > +
> > +/**
> > + * struct mtk_param_change - General encoding parameters type
> > + */
> > +enum mtk_encode_param {
> > +       MTK_ENCODE_PARAM_NONE =3D 0,
> > +       MTK_ENCODE_PARAM_BITRATE =3D (1 << 0),
> > +       MTK_ENCODE_PARAM_FRAMERATE =3D (1 << 1),
> > +       MTK_ENCODE_PARAM_INTRA_PERIOD =3D (1 << 2),
> > +       MTK_ENCODE_PARAM_FRAME_TYPE =3D (1 << 3),
> > +};
> > +
> > +/**
> > + * enum mtk_fmt_type - Type of the pixelformat
> > + * @MTK_FMT_FRAME - mtk vcodec raw frame
> > + */
> > +enum mtk_fmt_type {
> > +       MTK_FMT_DEC             =3D 0,
> > +       MTK_FMT_ENC             =3D 1,
> > +       MTK_FMT_FRAME           =3D 2,
> > +};
> > +
> > +/**
> > + * struct mtk_video_fmt - Structure used to store information abou=
t pixelformats
> > + */
> > +struct mtk_video_fmt {
> > +       u32 fourcc;
> > +       enum mtk_fmt_type type;
> > +       u32 num_planes;
> > +};
> > +
> > +/**
> > + * struct mtk_codec_framesizes - Structure used to store informati=
on about framesizes
> > + */
> > +struct mtk_codec_framesizes {
> > +       u32 fourcc;
> > +       struct  v4l2_frmsize_stepwise   stepwise;
> > +};
> > +
> > +/**
> > + * struct mtk_q_type - Type of queue
> > + */
> > +enum mtk_q_type {
> > +       MTK_Q_DATA_SRC          =3D 0,
> > +       MTK_Q_DATA_DST          =3D 1,
> > +};
> > +
> > +/**
> > + * struct mtk_q_data - Structure used to store information about q=
ueue
> > + * @colorspace reserved for encoder
> > + * @field              reserved for encoder
> > + */
> > +struct mtk_q_data {
> > +       unsigned int            width;
> > +       unsigned int            height;
> > +       enum v4l2_field         field;
> > +       enum v4l2_colorspace    colorspace;
> > +       unsigned int            bytesperline[MTK_VCODEC_MAX_PLANES]=
;
> > +       unsigned int            sizeimage[MTK_VCODEC_MAX_PLANES];
> > +       struct mtk_video_fmt    *fmt;
> > +};
> > +
> > +/**
> > + * struct mtk_enc_params - General encoding parameters
> > + * @bitrate - target bitrate
> > + * @num_b_frame - number of b frames between p-frame
> > + * @rc_frame - frame based rate control
> > + * @rc_mb - macroblock based rate control
> > + * @seq_hdr_mode - H.264 sequence header is encoded separately or =
joined with the first frame
> > + * @gop_size - group of picture size, it's used as the intra frame=
 period
> > + * @framerate_num - frame rate numerator
> > + * @framerate_denom - frame rate denominator
> > + * @h264_max_qp - Max value for H.264 quantization parameter
> > + * @h264_profile - V4L2 defined H.264 profile
> > + * @h264_level - V4L2 defined H.264 level
> > + * @force_intra - force/insert intra frame
> > + * @skip_frame - encode in skip frame mode that use minimum number=
 of bits
> > + */
> > +struct mtk_enc_params {
> > +       unsigned int    bitrate;
> > +       unsigned int    num_b_frame;
> > +       unsigned int    rc_frame;
> > +       unsigned int    rc_mb;
> > +       unsigned int    seq_hdr_mode;
> > +       unsigned int    gop_size;
> > +       unsigned int    framerate_num;
> > +       unsigned int    framerate_denom;
> > +       unsigned int    h264_max_qp;
> > +       unsigned int    h264_profile;
> > +       unsigned int    h264_level;
> > +       unsigned int    force_intra;
> > +};
> > +
> > +/**
> > + * struct mtk_vcodec_pm - Power management data structure
> > + */
> > +struct mtk_vcodec_pm {
> > +       struct clk      *vcodecpll;
> > +       struct clk      *univpll_d2;
> > +       struct clk      *clk_cci400_sel;
> > +       struct clk      *vdecpll;
> > +       struct clk      *vdec_sel;
> > +       struct clk      *vencpll_d2;
> > +       struct clk      *venc_sel;
> > +       struct clk      *univpll1_d2;
> > +       struct clk      *venc_lt_sel;
> > +       struct device   *larbvdec;
> > +       struct device   *larbvenc;
> > +       struct device   *larbvenclt;
> > +       struct device   *dev;
> > +       struct mtk_vcodec_dev *mtkdev;
> > +};
> > +
> > +
> > +/**
> > + * struct mtk_vcodec_ctx - Context (instance) private data.
> > + *
> > + * @type:              type of the instance - decoder or encoder
> > + * @dev:               pointer to the mtk_vcodec_dev of the device
> > + * @fh:                        struct v4l2_fh
> > + * @m2m_ctx:           pointer to the v4l2_m2m_ctx of the context
> > + * @q_data:            store information of input and output queue
> > + *                     of the context
> > + * @idx:               index of the context that this structure de=
scribes
> > + * @state:             state of the context
> > + * @param_change:      encode parameters
> > + * @enc_params:                encoding parameters
> > + * @colorspace:
> > + * @enc_if:            hoooked encoder driver interface
> > + * @drv_handle:                driver handle for specific decode/e=
ncode instance
> > + *
> > + * @picinfo:           store width/height of image and buffer and =
planes' size for decoder
> > + *                     and encoder
> > + * @dpb_count:         count of the DPB buffers required by MTK Vc=
odec hw
> > + *
> > + * @int_cond:          variable used by the waitqueue
> > + * @int_type:          type of the last interrupt
> > + * @queue:             waitqueue that can be used to wait for this=
 context to
> > + *                     finish
> > + * @irq_status:                irq status
> > + *
> > + * @ctrl_hdl:          handler for v4l2 framework
> > + * @ctrls:             array of controls, used when adding control=
s to the
> > + *                     v4l2 control framework
> > + *
> > + * @encode_work:       worker for the encoding
> > + */
> > +struct mtk_vcodec_ctx {
> > +       enum mtk_instance_type type;
> > +       struct mtk_vcodec_dev *dev;
> > +       struct v4l2_fh fh;
> > +       struct v4l2_m2m_ctx *m2m_ctx;
> > +       struct mtk_q_data q_data[2];
> > +       int idx;
> > +       enum mtk_instance_state state;
> > +       enum mtk_encode_param param_change;
> > +       struct mtk_enc_params enc_params;
> > +
> > +       struct venc_common_if *enc_if;
> > +       unsigned long drv_handle;
> > +
> > +
> > +       int int_cond;
> > +       int int_type;
> > +       wait_queue_head_t queue;
> > +       unsigned int irq_status;
> > +
> > +       struct v4l2_ctrl_handler ctrl_hdl;
> > +       struct v4l2_ctrl *ctrls[MTK_MAX_CTRLS];
> > +
> > +       struct work_struct encode_work;
> > +
> > +};
> > +
> > +/**
> > + * struct mtk_vcodec_dev - driver data
> > + * @v4l2_dev:          V4L2 device to register video devices for.
> > + * @vfd_enc:           Video device for encoder.
> > + *
> > + * @m2m_dev_enc:       m2m device for encoder.
> > + * @plat_dev:          platform device
> > + * @alloc_ctx:         VB2 allocator context
> > + *                     (for allocations without kernel mapping).
> > + * @ctx:               array of driver contexts
> > + *
> > + * @curr_ctx:          The context that is waiting for codec hardw=
are
> > + *
> > + * @reg_base:          Mapped address of MTK Vcodec registers.
> > + *
> > + * @instance_mask:     used to mark which contexts are opened
> > + * @num_instances:     counter of active MTK Vcodec instances
> > + *
> > + * @encode_workqueue:  encode work queue
> > + *
> > + * @int_cond:          used to identify interrupt condition happen
> > + * @int_type:          used to identify what kind of interrupt con=
dition happen
> > + * @dev_mutex:         video_device lock
> > + * @queue:             waitqueue for waiting for completion of dev=
ice commands
> > + *
> > + * @enc_irq:           h264 encoder irq resource
> > + * @enc_lt_irq:                vp8 encoder irq resource
> > + *
> > + * @enc_mutex:         encoder hardware lock.
> > + *
> > + * @pm:                        power management control
> > + * @dec_capability:    used to identify decode capability, ex: 4k
> > + * @enc_capability:     used to identify encode capability
> > + */
> > +struct mtk_vcodec_dev {
> > +       struct v4l2_device      v4l2_dev;
> > +       struct video_device     *vfd_enc;
> > +
> > +       struct v4l2_m2m_dev     *m2m_dev_enc;
> > +       struct platform_device  *plat_dev;
> > +       struct platform_device  *vpu_plat_dev;
> > +       struct vb2_alloc_ctx    *alloc_ctx;
> > +       struct mtk_vcodec_ctx   *ctx[MTK_VCODEC_MAX_INSTANCES];
> > +       int curr_ctx;
> > +       void __iomem            *reg_base[NUM_MAX_VCODEC_REG_BASE];
> > +
> > +       unsigned long   instance_mask[BITS_TO_LONGS(MTK_VCODEC_MAX_=
INSTANCES)];
> > +       int                     num_instances;
> > +
> > +       struct workqueue_struct *encode_workqueue;
> > +
> > +       int                     int_cond;
> > +       int                     int_type;
> > +       struct mutex            dev_mutex;
> > +       wait_queue_head_t       queue;
> > +
> > +       int                     enc_irq;
> > +       int                     enc_lt_irq;
> > +
> > +       struct mutex            enc_mutex;
> > +
> > +       struct mtk_vcodec_pm    pm;
> > +       unsigned int            dec_capability;
> > +       unsigned int            enc_capability;
> > +};
> > +
> > +/**
> > + * struct mtk_vcodec_ctrl - information about controls to be regis=
tered.
> > + * @id:                        Control ID.
> > + * @type:              Type of the control.
> > + * @name:              Human readable name of the control.
> > + * @minimum:           Minimum value of the control.
> > + * @maximum:           Maximum value of the control.
> > + * @step:              Control value increase step.
> > + * @menu_skip_mask:    Mask of invalid menu positions.
> > + * @default_value:     Initial value of the control.
> > + * @is_volatile:       Control is volatile.
> > + *
> > + * See also struct v4l2_ctrl_config.
> > + */
> > +struct mtk_vcodec_ctrl {
> > +       u32                     id;
> > +       enum v4l2_ctrl_type     type;
> > +       u8                      name[32];
> > +       s32                     minimum;
> > +       s32                     maximum;
> > +       s32                     step;
> > +       u32                     menu_skip_mask;
> > +       s32                     default_value;
> > +       u8                      is_volatile;
> > +};
> > +
> > +static inline struct mtk_vcodec_ctx *fh_to_ctx(struct v4l2_fh *fh)
> > +{
> > +       return container_of(fh, struct mtk_vcodec_ctx, fh);
> > +}
> > +
> > +static inline struct mtk_vcodec_ctx *ctrl_to_ctx(struct v4l2_ctrl =
*ctrl)
> > +{
> > +       return container_of(ctrl->handler, struct mtk_vcodec_ctx, c=
trl_hdl);
> > +}
> > +
> > +extern const struct v4l2_ioctl_ops mtk_vdec_ioctl_ops;
> > +extern const struct v4l2_m2m_ops mtk_vdec_m2m_ops;
> > +extern const struct v4l2_ioctl_ops mtk_venc_ioctl_ops;
> > +extern const struct v4l2_m2m_ops mtk_venc_m2m_ops;
> > +
> > +#endif /* _MTK_VCODEC_DRV_H_ */
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/d=
rivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > new file mode 100644
> > index 0000000..ee602fe
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > @@ -0,0 +1,1380 @@
> > +/*
> > +* Copyright (c) 2015 MediaTek Inc.
> > +* Author: PC Chen <pc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > +*         Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > +*
> > +* This program is free software; you can redistribute it and/or mo=
dify
> > +* it under the terms of the GNU General Public License version 2 a=
s
> > +* published by the Free Software Foundation.
> > +*
> > +* This program is distributed in the hope that it will be useful,
> > +* but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > +* GNU General Public License for more details.
> > +*/
> > +
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-mem2mem.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +
> > +#include "mtk_vcodec_drv.h"
> > +#include "mtk_vcodec_enc.h"
> > +#include "mtk_vcodec_intr.h"
> > +#include "mtk_vcodec_util.h"
> > +#include "venc_drv_if.h"
> > +
> > +#define MTK_VENC_MIN_W 32
> > +#define MTK_VENC_MIN_H 32
> > +#define MTK_VENC_MAX_W 1920
> > +#define MTK_VENC_MAX_H 1080
> > +#define DFT_CFG_WIDTH  MTK_VENC_MIN_W
> > +#define DFT_CFG_HEIGHT MTK_VENC_MIN_H
> > +
> > +static void mtk_venc_worker(struct work_struct *work);
> > +
> > +static struct mtk_video_fmt mtk_video_formats[] =3D {
> > +       {
> > +               .fourcc         =3D V4L2_PIX_FMT_YUV420,
> > +               .type           =3D MTK_FMT_FRAME,
> > +               .num_planes     =3D 3,
> This is not right. V4L2_PIX_FMT_YUV420 only has one physical plane.
> Same for V4L2_PIX_FMT_YVU420, V4L2_PIX_FMT_NV12, and
> V4L2_PIX_FMT_NV21.
We will fix this in next version.

best regards,
Tiffany

> > +       },
> > +       {
> > +               .fourcc         =3D V4L2_PIX_FMT_YVU420,
> > +               .type           =3D MTK_FMT_FRAME,
> > +               .num_planes     =3D 3,
> > +       },
> > +       {
> > +               .fourcc         =3D V4L2_PIX_FMT_NV12,
> > +               .type           =3D MTK_FMT_FRAME,
> > +               .num_planes     =3D 2,
> > +       },
> > +       {
> > +               .fourcc         =3D V4L2_PIX_FMT_NV21,
> > +               .type           =3D MTK_FMT_FRAME,
> > +               .num_planes     =3D 2,
> > +       },
> > +       {
> > +               .fourcc         =3D V4L2_PIX_FMT_YUV420M,
> > +               .type           =3D MTK_FMT_FRAME,
> > +               .num_planes     =3D 3,
> > +       },
> > +       {
> > +               .fourcc         =3D V4L2_PIX_FMT_YVU420M,
> > +               .type           =3D MTK_FMT_FRAME,
> > +               .num_planes     =3D 3,
> > +       },
> > +       {
> > +               .fourcc         =3D V4L2_PIX_FMT_NV12M,
> > +               .type           =3D MTK_FMT_FRAME,
> > +               .num_planes     =3D 2,
> > +       },
> > +       {
> > +               .fourcc         =3D V4L2_PIX_FMT_NV21M,
> > +               .type           =3D MTK_FMT_FRAME,
> > +               .num_planes     =3D 2,
> > +       },
> > +       {
> > +               .fourcc         =3D V4L2_PIX_FMT_H264,
> > +               .type           =3D MTK_FMT_ENC,
> > +               .num_planes     =3D 1,
> > +       },
> > +       {
> > +               .fourcc         =3D V4L2_PIX_FMT_VP8,
> > +               .type           =3D MTK_FMT_ENC,
> > +               .num_planes     =3D 1,
> > +       },
> > +};
> > +
> > +#define NUM_FORMATS ARRAY_SIZE(mtk_video_formats)
> > +
> > +static const struct mtk_codec_framesizes mtk_venc_framesizes[] =3D=
 {
> > +       {
> > +               .fourcc =3D V4L2_PIX_FMT_H264,
> > +               .stepwise =3D {  160, 1920, 16, 128, 1088, 16 },
> > +       },
> > +       {
> > +               .fourcc =3D V4L2_PIX_FMT_VP8,
> > +               .stepwise =3D {  160, 1920, 16, 128, 1088, 16 },
> > +       },
> > +};
> > +
> > +#define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_venc_framesizes)
> > +
> > +static int vidioc_venc_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +       struct mtk_vcodec_ctx *ctx =3D ctrl_to_ctx(ctrl);
> > +       struct mtk_enc_params *p =3D &ctx->enc_params;
> > +       int ret =3D 0;
> > +
> > +       switch (ctrl->id) {
> > +       case V4L2_CID_MPEG_VIDEO_BITRATE:
> > +               mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_BITRATE val =
=3D %d",
> > +                       ctrl->val);
> > +               p->bitrate =3D ctrl->val;
> > +               ctx->param_change |=3D MTK_ENCODE_PARAM_BITRATE;
> > +               break;
> > +       case V4L2_CID_MPEG_VIDEO_B_FRAMES:
> > +               mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_B_FRAMES val=
 =3D %d",
> > +                       ctrl->val);
> > +               p->num_b_frame =3D ctrl->val;
> > +               break;
> > +       case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
> > +               mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_FRAME_RC_ENA=
BLE val =3D %d",
> > +                       ctrl->val);
> > +               p->rc_frame =3D ctrl->val;
> > +               break;
> > +       case V4L2_CID_MPEG_VIDEO_H264_MAX_QP:
> > +               mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_H264_MAX_QP =
val =3D %d",
> > +                       ctrl->val);
> > +               p->h264_max_qp =3D ctrl->val;
> > +               break;
> > +       case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
> > +               mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_HEADER_MODE =
val =3D %d",
> > +                       ctrl->val);
> > +               p->seq_hdr_mode =3D ctrl->val;
> > +               break;
> > +       case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:
> > +               mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE=
 val =3D %d",
> > +                       ctrl->val);
> > +               p->rc_mb =3D ctrl->val;
> > +               break;
> > +       case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
> > +               mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_H264_PROFILE=
 val =3D %d",
> > +                       ctrl->val);
> > +               p->h264_profile =3D ctrl->val;
> > +               break;
> > +       case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
> > +               mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_H264_LEVEL v=
al =3D %d",
> > +                       ctrl->val);
> > +               p->h264_level =3D ctrl->val;
> > +               break;
> > +       case V4L2_CID_MPEG_VIDEO_H264_I_PERIOD:
> > +               mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_H264_I_PERIO=
D val =3D %d",
> > +                       ctrl->val);
> > +       case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
> > +               mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_GOP_SIZE val=
 =3D %d",
> > +                       ctrl->val);
> > +               p->gop_size =3D ctrl->val;
> > +               ctx->param_change |=3D MTK_ENCODE_PARAM_INTRA_PERIO=
D;
> > +               break;
> > +       case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
> > +               mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_FORCE_KEY_FR=
AME");
> > +               p->force_intra =3D 1;
> > +               ctx->param_change |=3D MTK_ENCODE_PARAM_FRAME_TYPE;
> > +               break;
> > +       default:
> > +               ret =3D -EINVAL;
> > +               break;
> > +       }
> > +
> > +       return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops mtk_vcodec_enc_ctrl_ops =3D {
> > +       .s_ctrl =3D vidioc_venc_s_ctrl,
> > +};
> > +
> > +static int vidioc_enum_fmt(struct file *file, struct v4l2_fmtdesc =
*f,
> > +                          bool out)
> > +{
> > +       struct mtk_video_fmt *fmt;
> > +       int i, j =3D 0;
> > +
> > +       for (i =3D 0; i < NUM_FORMATS; ++i) {
> > +               if (out && mtk_video_formats[i].type !=3D MTK_FMT_F=
RAME)
> > +                       continue;
> > +               else if (!out && mtk_video_formats[i].type !=3D MTK=
_FMT_ENC)
> > +                       continue;
> > +
> > +               if (j =3D=3D f->index) {
> > +                       fmt =3D &mtk_video_formats[i];
> > +                       f->pixelformat =3D fmt->fourcc;
> > +                       return 0;
> > +               }
> > +               ++j;
> > +       }
> > +
> > +       return -EINVAL;
> > +}
> > +
> > +static int vidioc_enum_framesizes(struct file *file, void *fh,
> > +                                 struct v4l2_frmsizeenum *fsize)
> > +{
> > +       int i =3D 0;
> > +
> > +       for (i =3D 0; i < NUM_SUPPORTED_FRAMESIZE; ++i) {
> > +               if (fsize->pixel_format !=3D mtk_venc_framesizes[i]=
=2Efourcc)
> > +                       continue;
> > +
> > +               if (!fsize->index) {
> > +                       fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> > +                       fsize->stepwise =3D mtk_venc_framesizes[i].=
stepwise;
> > +                       return 0;
> > +               }
> > +       }
> > +
> > +       return -EINVAL;
> > +}
> > +
> > +static int vidioc_enum_fmt_vid_cap_mplane(struct file *file, void =
*pirv,
> > +                                         struct v4l2_fmtdesc *f)
> > +{
> > +       return vidioc_enum_fmt(file, f, false);
> > +}
> > +
> > +static int vidioc_enum_fmt_vid_out_mplane(struct file *file, void =
*prov,
> > +                                         struct v4l2_fmtdesc *f)
> > +{
> > +       return vidioc_enum_fmt(file, f, true);
> > +}
> > +
> > +static int vidioc_venc_querycap(struct file *file, void *priv,
> > +                               struct v4l2_capability *cap)
> > +{
> > +        strlcpy(cap->driver, MTK_VCODEC_ENC_NAME, strlen(MTK_VCODE=
C_ENC_NAME));
> > +        cap->driver[strlen(MTK_VCODEC_ENC_NAME)]=3D0;
> > +        strlcpy(cap->bus_info, MTK_PLATFORM_STR, strlen(MTK_PLATFO=
RM_STR));
> > +        cap->bus_info[strlen(MTK_PLATFORM_STR)]=3D0;
> > +        strlcpy(cap->card, MTK_PLATFORM_STR, strlen(MTK_PLATFORM_S=
TR));
> > +        cap->card[strlen(MTK_PLATFORM_STR)]=3D0;
> > +
> > +       /*
> > +        * This is only a mem-to-mem video device. The capture and =
output
> > +        * device capability flags are left only for backward compa=
tibility
> > +        * and are scheduled for removal.
> > +        */
> > +       cap->device_caps  =3D V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_=
STREAMING;
> > +       cap->capabilities =3D cap->device_caps | V4L2_CAP_DEVICE_CA=
PS;
> > +
> > +       return 0;
> > +}
> > +static int vidioc_venc_s_parm(struct file *file, void *priv,
> > +                             struct v4l2_streamparm *a)
> > +{
> > +       struct mtk_vcodec_ctx *ctx =3D fh_to_ctx(priv);
> > +
> > +       if (a->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> > +               ctx->enc_params.framerate_num =3D
> > +                       a->parm.output.timeperframe.denominator;
> > +               ctx->enc_params.framerate_denom =3D
> > +                       a->parm.output.timeperframe.numerator;
> > +               ctx->param_change |=3D MTK_ENCODE_PARAM_FRAMERATE;
> > +       } else {
> > +               return -EINVAL;
> > +       }
> > +       return 0;
> > +}
> > +
> > +static struct mtk_q_data *mtk_venc_get_q_data(struct mtk_vcodec_ct=
x *ctx,
> > +                                             enum v4l2_buf_type ty=
pe)
> > +{
> > +       if (V4L2_TYPE_IS_OUTPUT(type))
> > +               return &ctx->q_data[MTK_Q_DATA_SRC];
> > +
> > +       return &ctx->q_data[MTK_Q_DATA_DST];
> > +}
> > +
> > +static struct mtk_video_fmt *mtk_venc_find_format(struct v4l2_form=
at *f)
> > +{
> > +       struct mtk_video_fmt *fmt;
> > +       unsigned int k;
> > +
> > +       for (k =3D 0; k < NUM_FORMATS; k++) {
> > +               fmt =3D &mtk_video_formats[k];
> > +               if (fmt->fourcc =3D=3D f->fmt.pix.pixelformat)
> > +                       return fmt;
> > +       }
> > +
> > +       return NULL;
> > +}
> > +
> > +static void mtk_vcodec_enc_calc_src_size(
> > +       unsigned int num_planes, unsigned int pic_width,
> > +       unsigned int pic_height, unsigned int sizeimage[],
> > +       unsigned int bytesperline[])
> > +{
> > +       unsigned int y_pitch_w_div16;
> > +       unsigned int c_pitch_w_div16;
> > +
> > +       y_pitch_w_div16 =3D ALIGN(pic_width, 16) >> 4;
> > +       c_pitch_w_div16 =3D ALIGN(pic_width, 16) >> 4;
> > +
> > +       if (num_planes =3D=3D 2) {
> > +               sizeimage[0] =3D
> > +                       (y_pitch_w_div16) * (((pic_height + 31) / 3=
2) * 2) * 256 +
> > +                       ((y_pitch_w_div16 % 8 =3D=3D 0) ? 0 : ((ALI=
GN(pic_width, 16) * 2) * 16));
> > +
> > +               sizeimage[1] =3D
> > +                       (c_pitch_w_div16) * (((pic_height + 31) / 3=
2) * 2) * 128 +
> > +                       ((c_pitch_w_div16 % 8 =3D=3D 0) ? 0 : (ALIG=
N(pic_width, 16) * 16));
> > +
> > +               sizeimage[2] =3D 0;
> > +
> > +               bytesperline[0] =3D ALIGN(pic_width, 16);
> > +               bytesperline[1] =3D ALIGN(pic_width, 16);
> > +               bytesperline[2] =3D 0;
> > +
> > +       } else {
> > +               sizeimage[0] =3D
> > +                       (y_pitch_w_div16) * (((pic_height + 31) / 3=
2) * 2) * 256 +
> > +                       ((y_pitch_w_div16 % 8 =3D=3D 0) ? 0 : ((ALI=
GN(pic_width, 16) * 2) * 16));
> > +
> > +               sizeimage[1] =3D
> > +                       (c_pitch_w_div16) * (((pic_height + 31) / 3=
2) * 2) * 64 +
> > +                       ((c_pitch_w_div16 % 8 =3D=3D 0) ? 0 : ((ALI=
GN(pic_width, 16) / 2) * 16));
> > +
> > +               sizeimage[2] =3D
> > +                       (c_pitch_w_div16) * (((pic_height + 31) / 3=
2) * 2) * 64 +
> > +                       ((c_pitch_w_div16 % 8 =3D=3D 0) ? 0 : ((ALI=
GN(pic_width, 16) / 2) * 16));
> > +
> > +               bytesperline[0] =3D ALIGN(pic_width, 16);
> > +               bytesperline[1] =3D ALIGN(pic_width, 16) / 2;
> > +               bytesperline[2] =3D ALIGN(pic_width, 16) / 2;
> > +       }
> > +}
> > +
> > +static int vidioc_try_fmt(struct v4l2_format *f, struct mtk_video_=
fmt *fmt)
> > +{
> > +       struct v4l2_pix_format_mplane *pix_fmt_mp =3D &f->fmt.pix_m=
p;
> > +
> > +       /* V4L2 specification suggests the driver corrects the form=
at struct
> > +         * if any of the dimensions is unsupported */
> > +        if (pix_fmt_mp->height < MTK_VENC_MIN_H)
> > +                pix_fmt_mp->height =3D MTK_VENC_MIN_H;
> > +        else if (pix_fmt_mp->height > MTK_VENC_MAX_H)
> > +                pix_fmt_mp->height =3D MTK_VENC_MAX_H;
> > +
> > +        if (pix_fmt_mp->width < MTK_VENC_MIN_W)
> > +                pix_fmt_mp->width =3D MTK_VENC_MIN_W;
> > +        else if (pix_fmt_mp->width > MTK_VENC_MAX_W)
> > +                pix_fmt_mp->width =3D MTK_VENC_MAX_W;
> > +
> > +        pix_fmt_mp->field =3D V4L2_FIELD_NONE;
> > +
> > +       if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> > +               int size =3D pix_fmt_mp->height * pix_fmt_mp->width=
;
> > +               if (fmt->num_planes !=3D pix_fmt_mp->num_planes)
> > +                       pix_fmt_mp->num_planes =3D fmt->num_planes;
> > +
> > +               if(pix_fmt_mp->plane_fmt[0].sizeimage !=3D size)
> > +                       pix_fmt_mp->plane_fmt[0].sizeimage =3D size=
;
> > +               pix_fmt_mp->plane_fmt[0].bytesperline =3D 0;
> > +               memset(&(pix_fmt_mp->plane_fmt[0].reserved[0]), 0x0=
,
> > +                       sizeof(pix_fmt_mp->plane_fmt[0].reserved));
> > +       } else if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE=
) {
> > +               int i;
> > +               unsigned int sizeimage[VIDEO_MAX_PLANES];
> > +               unsigned int bytesperline[VIDEO_MAX_PLANES];
> > +
> > +               v4l_bound_align_image(&pix_fmt_mp->width, 8, 1920, =
1,
> > +                                     &pix_fmt_mp->height, 4, 1080,=
 1, 0);
> > +
> > +               if (fmt->num_planes !=3D pix_fmt_mp->num_planes)
> > +                       pix_fmt_mp->num_planes =3D fmt->num_planes;
> > +
> > +               mtk_vcodec_enc_calc_src_size(pix_fmt_mp->num_planes=
,
> > +                                       pix_fmt_mp->width,
> > +                                       pix_fmt_mp->height,
> > +                                       sizeimage, bytesperline);
> > +
> > +               for (i=3D0; i < pix_fmt_mp->num_planes; i++) {
> > +                       pix_fmt_mp->plane_fmt[i].sizeimage =3D size=
image[i];
> > +                       pix_fmt_mp->plane_fmt[i].bytesperline =3D b=
ytesperline[i];
> > +                       memset(&(pix_fmt_mp->plane_fmt[i].reserved[=
0]), 0x0,
> > +                               sizeof(pix_fmt_mp->plane_fmt[0].res=
erved));
> > +               }
> > +       } else {
> > +               return -EINVAL;
> > +       }
> > +
> > +       pix_fmt_mp->flags =3D 0;
> > +       pix_fmt_mp->ycbcr_enc =3D 0;
> > +       pix_fmt_mp->quantization =3D 0;
> > +       pix_fmt_mp->xfer_func =3D 0;
> > +       memset(&pix_fmt_mp->reserved[0], 0x0, sizeof(pix_fmt_mp->re=
served));
> > +
> > +       return 0;
> > +}
> > +
> > +static void mtk_venc_set_param(struct mtk_vcodec_ctx *ctx, void *p=
aram)
> > +{
> > +       struct venc_enc_prm *p =3D (struct venc_enc_prm *)param;
> > +       struct mtk_q_data *q_data_src =3D &ctx->q_data[MTK_Q_DATA_S=
RC];
> > +       struct mtk_enc_params *enc_params =3D &ctx->enc_params;
> > +       unsigned int frame_rate;
> > +
> > +       frame_rate =3D enc_params->framerate_num / enc_params->fram=
erate_denom;
> > +
> > +       switch (q_data_src->fmt->fourcc) {
> > +       case V4L2_PIX_FMT_YUV420:
> > +       case V4L2_PIX_FMT_YUV420M:
> > +               p->input_fourcc =3D VENC_YUV_FORMAT_420;
> > +               break;
> > +       case V4L2_PIX_FMT_YVU420:
> > +       case V4L2_PIX_FMT_YVU420M:
> > +               p->input_fourcc =3D VENC_YUV_FORMAT_YV12;
> > +               break;
> > +       case V4L2_PIX_FMT_NV12:
> > +       case V4L2_PIX_FMT_NV12M:
> > +               p->input_fourcc =3D VENC_YUV_FORMAT_NV12;
> > +               break;
> > +       case V4L2_PIX_FMT_NV21:
> > +       case V4L2_PIX_FMT_NV21M:
> > +               p->input_fourcc =3D VENC_YUV_FORMAT_NV21;
> > +               break;
> > +       }
> > +       p->h264_profile =3D enc_params->h264_profile;
> > +       p->h264_level =3D enc_params->h264_level;
> > +       p->width =3D q_data_src->width;
> > +       p->height =3D q_data_src->height;
> > +       p->buf_width =3D q_data_src->bytesperline[0];
> > +       p->buf_height =3D ((q_data_src->height + 0xf) & (~0xf));
> > +       p->frm_rate =3D frame_rate;
> > +       p->intra_period =3D enc_params->gop_size;
> > +       p->bitrate =3D enc_params->bitrate;
> > +
> > +       ctx->param_change =3D MTK_ENCODE_PARAM_NONE;
> > +
> > +       mtk_v4l2_debug(1, "fmt 0x%x, P/L %d/%d, w/h %d/%d, buf %d/%=
d, fps/bps %d/%d, gop %d",
> > +                      p->input_fourcc, p->h264_profile, p->h264_le=
vel,
> > +                      p->width, p->height, p->buf_width, p->buf_he=
ight,
> > +                      p->frm_rate, p->bitrate, p->intra_period);
> > +}
> > +
> > +static int vidioc_venc_s_fmt(struct file *file, void *priv,
> > +                            struct v4l2_format *f)
> > +{
> > +       struct mtk_vcodec_ctx *ctx =3D fh_to_ctx(priv);
> > +       struct v4l2_pix_format_mplane *pix_fmt_mp =3D &f->fmt.pix_m=
p;
> > +       struct vb2_queue *vq;
> > +       struct mtk_q_data *q_data;
> > +       struct venc_enc_prm param;
> > +       int i, ret;
> > +       struct mtk_video_fmt *fmt;
> > +
> > +       vq =3D v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
> > +       if (!vq) {
> > +               mtk_v4l2_err("fail to get vq\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       if (vb2_is_busy(vq)) {
> > +               mtk_v4l2_err("queue busy\n");
> > +               return -EBUSY;
> > +       }
> > +
> > +       q_data =3D mtk_venc_get_q_data(ctx, f->type);
> > +       if (!q_data) {
> > +               mtk_v4l2_err("fail to get q data\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       fmt =3D mtk_venc_find_format(f);
> > +       if (!fmt) {
> > +               if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLAN=
E) {
> > +                       f->fmt.pix.pixelformat =3D mtk_video_format=
s[0].fourcc;
> > +                       fmt =3D mtk_venc_find_format(f);
> > +               } else {
> > +                       f->fmt.pix.pixelformat =3D mtk_video_format=
s[8].fourcc;
> > +                       fmt =3D mtk_venc_find_format(f);
> > +               }
> > +       }
> > +
> > +       q_data->fmt =3D fmt;
> > +       ret =3D vidioc_try_fmt(f, q_data->fmt);
> > +       if (ret)
> > +               return ret;
> > +
> > +       q_data->width           =3D f->fmt.pix_mp.width;
> > +       q_data->height          =3D f->fmt.pix_mp.height;
> > +       q_data->field           =3D f->fmt.pix_mp.field;
> > +
> > +       if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> > +               q_data->colorspace =3D f->fmt.pix_mp.colorspace;
> > +               ctx->q_data[MTK_Q_DATA_SRC].bytesperline[0] =3D
> > +                       ALIGN(q_data->width, 16);
> > +
> > +               if (q_data->fmt->num_planes =3D=3D 2) {
> > +                       ctx->q_data[MTK_Q_DATA_SRC].bytesperline[1]=
 =3D
> > +                               ALIGN(q_data->width, 16);
> > +                       ctx->q_data[MTK_Q_DATA_SRC].bytesperline[2]=
 =3D 0;
> > +               } else {
> > +                       ctx->q_data[MTK_Q_DATA_SRC].bytesperline[1]=
 =3D
> > +                               ALIGN(q_data->width, 16) / 2;
> > +                       ctx->q_data[MTK_Q_DATA_SRC].bytesperline[2]=
 =3D
> > +                               ALIGN(q_data->width, 16) / 2;
> > +               }
> > +
> > +               memset(&param, 0, sizeof(param));
> > +               mtk_venc_set_param(ctx, &param);
> > +               if (ctx->state =3D=3D MTK_STATE_INIT) {
> > +                       ret =3D venc_if_set_param(ctx,
> > +                                               VENC_SET_PARAM_ENC,
> > +                                               &param);
> > +                       if (ret)
> > +                               mtk_v4l2_err("venc_if_set_param fai=
led=3D%d\n",
> > +                                               ret);
> > +
> > +                       /* Get codec driver advice sizeimage from v=
pu */
> > +                       for (i =3D 0; i < MTK_VCODEC_MAX_PLANES; i+=
+) {
> > +                               q_data->sizeimage[i] =3D param.size=
image[i];
> > +                               pix_fmt_mp->plane_fmt[i].sizeimage =
=3D
> > +                                       param.sizeimage[i];
> > +                       }
> > +                       q_data->bytesperline[0] =3D
> > +                               pix_fmt_mp->plane_fmt[0].bytesperli=
ne;
> > +                       q_data->bytesperline[1] =3D
> > +                               pix_fmt_mp->plane_fmt[1].bytesperli=
ne;
> > +                       q_data->bytesperline[2] =3D
> > +                               pix_fmt_mp->plane_fmt[2].bytesperli=
ne;
> > +               } else {
> > +                       for (i =3D 0; i < MTK_VCODEC_MAX_PLANES; i+=
+) {
> > +                               q_data->sizeimage[i] =3D
> > +                                       pix_fmt_mp->plane_fmt[i].si=
zeimage;
> > +                               q_data->bytesperline[i] =3D
> > +                                       pix_fmt_mp->plane_fmt[i].by=
tesperline;
> > +                       }
> > +               }
> > +       } else if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLAN=
E){
> > +               for (i =3D 0; i < f->fmt.pix_mp.num_planes; i++) {
> > +                       struct v4l2_plane_pix_format    *plane_fmt;
> > +
> > +                       plane_fmt =3D &f->fmt.pix_mp.plane_fmt[i];
> > +                       q_data->bytesperline[i] =3D plane_fmt->byte=
sperline;
> > +                       q_data->sizeimage[i]    =3D plane_fmt->size=
image;
> > +               }
> > +
> > +               if (ctx->state =3D=3D MTK_STATE_FREE) {
> > +                       ret =3D venc_if_create(ctx, q_data->fmt->fo=
urcc);
> > +                       if (ret) {
> > +                               mtk_v4l2_err("venc_if_create failed=
=3D%d, codec type=3D%x\n",
> > +                                       ret, q_data->fmt->fourcc);
> > +                               return 0;
> > +                       }
> > +
> > +                       ctx->state =3D MTK_STATE_INIT;
> > +               }
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int vidioc_venc_g_fmt(struct file *file, void *priv,
> > +                            struct v4l2_format *f)
> > +{
> > +       struct v4l2_pix_format_mplane *pix =3D &f->fmt.pix_mp;
> > +       struct mtk_vcodec_ctx *ctx =3D fh_to_ctx(priv);
> > +       struct vb2_queue *vq;
> > +       struct mtk_q_data *q_data;
> > +       int i;
> > +
> > +       vq =3D v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
> > +       if (!vq)
> > +               return -EINVAL;
> > +
> > +       q_data =3D mtk_venc_get_q_data(ctx, f->type);
> > +
> > +       pix->width =3D q_data->width;
> > +       pix->height =3D q_data->height;
> > +       pix->pixelformat =3D q_data->fmt->fourcc;
> > +       pix->field =3D q_data->field;
> > +       pix->colorspace =3D q_data->colorspace;
> > +       pix->num_planes =3D q_data->fmt->num_planes;
> > +       for (i =3D 0; i < pix->num_planes; i++) {
> > +               pix->plane_fmt[i].bytesperline =3D q_data->bytesper=
line[i];
> > +               pix->plane_fmt[i].sizeimage =3D q_data->sizeimage[i=
];
> > +               memset(&(pix->plane_fmt[i].reserved[0]), 0x0,
> > +                       sizeof(pix->plane_fmt[i].reserved));
> > +       }
> > +       pix->flags =3D 0;
> > +       pix->ycbcr_enc =3D 0;
> > +       pix->quantization =3D 0;
> > +       pix->xfer_func =3D 0;
> > +       memset(&pix->reserved[0], 0x0, sizeof(pix->reserved));
> > +
> > +       return 0;
> > +}
> > +
> > +static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *=
priv,
> > +                                  struct v4l2_format *f)
> > +{
> > +        struct mtk_video_fmt *fmt;
> > +       struct mtk_vcodec_ctx *ctx =3D fh_to_ctx(priv);
> > +
> > +        fmt =3D mtk_venc_find_format(f);
> > +        if (!fmt) {
> > +                f->fmt.pix.pixelformat =3D mtk_video_formats[8].fo=
urcc;
> > +                fmt =3D mtk_venc_find_format(f);
> > +        }
> > +        if (fmt->type !=3D MTK_FMT_ENC) {
> > +               mtk_v4l2_err("Fourcc format (0x%08x) invalid.\n",
> > +                            f->fmt.pix.pixelformat);
> > +               return -EINVAL;
> > +        }
> > +        f->fmt.pix_mp.colorspace =3D ctx->q_data[MTK_Q_DATA_SRC].c=
olorspace;
> > +
> > +        return vidioc_try_fmt(f, fmt);
> > +}
> > +
> > +static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *=
priv,
> > +                                  struct v4l2_format *f)
> > +{
> > +        struct mtk_video_fmt *fmt;
> > +
> > +        fmt =3D mtk_venc_find_format(f);
> > +        if (!fmt) {
> > +                f->fmt.pix.pixelformat =3D mtk_video_formats[0].fo=
urcc;
> > +                fmt =3D mtk_venc_find_format(f);
> > +        }
> > +        if (!(fmt->type & MTK_FMT_FRAME)) {
> > +               mtk_v4l2_err("Fourcc format (0x%08x) invalid.\n",
> > +                            f->fmt.pix.pixelformat);
> > +               return -EINVAL;
> > +        }
> > +        if (!f->fmt.pix_mp.colorspace)
> > +                f->fmt.pix_mp.colorspace =3D V4L2_COLORSPACE_REC70=
9;
> > +
> > +        return vidioc_try_fmt(f, fmt);
> > +}
> > +
> > +static int vidioc_venc_g_s_selection(struct file *file, void *priv=
,
> > +                                struct v4l2_selection *s)
> > +{
> > +       struct mtk_vcodec_ctx *ctx =3D fh_to_ctx(priv);
> > +       struct mtk_q_data *q_data;
> > +
> > +       if (V4L2_TYPE_IS_OUTPUT(s->type)) {
> > +               if (s->target !=3D  V4L2_SEL_TGT_COMPOSE)
> > +                       return -EINVAL;
> > +       } else {
> > +               if (s->target !=3D V4L2_SEL_TGT_CROP)
> > +                       return -EINVAL;
> > +       }
> > +
> > +       if (s->r.left || s->r.top)
> > +               return -EINVAL;
> > +
> > +       q_data =3D mtk_venc_get_q_data(ctx, s->type);
> > +       if (!q_data)
> > +               return -EINVAL;
> > +
> > +       s->r.width =3D q_data->width;
> > +       s->r.height =3D q_data->height;
> > +
> > +       return 0;
> > +}
> > +
> > +
> > +static int vidioc_venc_qbuf(struct file *file, void *priv,
> > +                           struct v4l2_buffer *buf)
> > +{
> > +
> > +       struct mtk_vcodec_ctx *ctx =3D fh_to_ctx(priv);
> > +
> > +       if (ctx->state =3D=3D MTK_STATE_ABORT) {
> > +               mtk_v4l2_err("[%d] Call on QBUF after unrecoverable=
 error\n", ctx->idx);
> > +               return -EIO;
> > +       }
> > +
> > +       return v4l2_m2m_qbuf(file, ctx->m2m_ctx, buf);
> > +}
> > +
> > +static int vidioc_venc_dqbuf(struct file *file, void *priv,
> > +                            struct v4l2_buffer *buf)
> > +{
> > +       struct mtk_vcodec_ctx *ctx =3D fh_to_ctx(priv);
> > +       if (ctx->state =3D=3D MTK_STATE_ABORT) {
> > +               mtk_v4l2_err("[%d] Call on QBUF after unrecoverable=
 error\n", ctx->idx);
> > +               return -EIO;
> > +       }
> > +
> > +       return v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
> > +}
> > +
> > +
> > +const struct v4l2_ioctl_ops mtk_venc_ioctl_ops =3D {
> > +       .vidioc_streamon                =3D v4l2_m2m_ioctl_streamon=
,
> > +       .vidioc_streamoff               =3D v4l2_m2m_ioctl_streamof=
f,
> > +
> > +       .vidioc_reqbufs                 =3D v4l2_m2m_ioctl_reqbufs,
> > +       .vidioc_querybuf                =3D v4l2_m2m_ioctl_querybuf=
,
> > +       .vidioc_qbuf                    =3D vidioc_venc_qbuf,
> > +       .vidioc_dqbuf                   =3D vidioc_venc_dqbuf,
> > +
> > +       .vidioc_querycap                =3D vidioc_venc_querycap,
> > +       .vidioc_enum_fmt_vid_cap_mplane =3D vidioc_enum_fmt_vid_cap=
_mplane,
> > +       .vidioc_enum_fmt_vid_out_mplane =3D vidioc_enum_fmt_vid_out=
_mplane,
> > +       .vidioc_enum_framesizes         =3D vidioc_enum_framesizes,
> > +
> > +       .vidioc_try_fmt_vid_cap_mplane  =3D vidioc_try_fmt_vid_cap_=
mplane,
> > +       .vidioc_try_fmt_vid_out_mplane  =3D vidioc_try_fmt_vid_out_=
mplane,
> > +       .vidioc_expbuf                  =3D v4l2_m2m_ioctl_expbuf,
> > +       .vidioc_subscribe_event         =3D v4l2_ctrl_subscribe_eve=
nt,
> > +       .vidioc_unsubscribe_event       =3D v4l2_event_unsubscribe,
> > +
> > +       .vidioc_s_parm                  =3D vidioc_venc_s_parm,
> > +
> > +       .vidioc_s_fmt_vid_cap_mplane    =3D vidioc_venc_s_fmt,
> > +       .vidioc_s_fmt_vid_out_mplane    =3D vidioc_venc_s_fmt,
> > +
> > +       .vidioc_g_fmt_vid_cap_mplane    =3D vidioc_venc_g_fmt,
> > +       .vidioc_g_fmt_vid_out_mplane    =3D vidioc_venc_g_fmt,
> > +
> > +       .vidioc_g_selection             =3D vidioc_venc_g_s_selecti=
on,
> > +       .vidioc_s_selection             =3D vidioc_venc_g_s_selecti=
on,
> > +};
> > +
> > +static int vb2ops_venc_queue_setup(struct vb2_queue *vq,
> > +                                  const void *parg,
> > +                                  unsigned int *nbuffers,
> > +                                  unsigned int *nplanes,
> > +                                  unsigned int sizes[], void *allo=
c_ctxs[])
> > +{
> > +       struct mtk_vcodec_ctx *ctx =3D vb2_get_drv_priv(vq);
> > +       struct mtk_q_data *q_data;
> > +
> > +       q_data =3D mtk_venc_get_q_data(ctx, vq->type);
> > +
> > +       if (*nbuffers < 1)
> > +               *nbuffers =3D 1;
> > +       if (*nbuffers > MTK_VIDEO_MAX_FRAME)
> > +               *nbuffers =3D MTK_VIDEO_MAX_FRAME;
> > +
> > +       *nplanes =3D q_data->fmt->num_planes;
> > +
> > +       if (vq->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> > +               unsigned int i;
> > +
> > +               for (i =3D 0; i < *nplanes; i++) {
> > +                       sizes[i] =3D q_data->sizeimage[i];
> > +                       alloc_ctxs[i] =3D ctx->dev->alloc_ctx;
> > +               }
> > +       } else if (vq->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLA=
NE) {
> > +               sizes[0] =3D q_data->sizeimage[0];
> > +               alloc_ctxs[0] =3D ctx->dev->alloc_ctx;
> > +       } else {
> > +               return -EINVAL;
> > +       }
> > +
> > +       mtk_v4l2_debug(2, "[%d]get %d buffer(s) of size 0x%x each, =
vq->memory=3D%d",
> > +                      ctx->idx, *nbuffers, sizes[0], vq->memory);
> > +
> > +       return 0;
> > +}
> > +
> > +static int vb2ops_venc_buf_prepare(struct vb2_buffer *vb)
> > +{
> > +       struct mtk_vcodec_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_que=
ue);
> > +       struct mtk_q_data *q_data;
> > +       int i;
> > +
> > +       q_data =3D mtk_venc_get_q_data(ctx, vb->vb2_queue->type);
> > +
> > +       for (i =3D 0; i < q_data->fmt->num_planes; i++) {
> > +               if (vb2_plane_size(vb, i) < q_data->sizeimage[i]) {
> > +                       mtk_v4l2_debug(2, "data will not fit into p=
lane %d (%lu < %d)",
> > +                                      i, vb2_plane_size(vb, i),
> > +                                      q_data->sizeimage[i]);
> > +                       return -EINVAL;
> > +               }
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static void vb2ops_venc_buf_queue(struct vb2_buffer *vb)
> > +{
> > +       struct mtk_vcodec_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_que=
ue);
> > +       struct vb2_v4l2_buffer *vb2_v4l2 =3D
> > +                       container_of(vb, struct vb2_v4l2_buffer, vb=
2_buf);
> > +       struct mtk_video_enc_buf *mtk_buf =3D
> > +                       container_of(vb2_v4l2, struct mtk_video_enc=
_buf, vb);
> > +
> > +       if ((vb->vb2_queue->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_=
MPLANE) &&
> > +               (ctx->param_change !=3D MTK_ENCODE_PARAM_NONE)) {
> > +               mtk_v4l2_debug(1,
> > +                               "[%d] Before id=3D%d encode paramet=
er change %x",
> > +                               ctx->idx, vb->index,
> > +                               ctx->param_change);
> > +               mtk_buf->param_change =3D ctx->param_change;
> > +               if (mtk_buf->param_change & MTK_ENCODE_PARAM_BITRAT=
E) {
> > +                       mtk_buf->enc_params.bitrate =3D ctx->enc_pa=
rams.bitrate;
> > +                       mtk_v4l2_debug(1, "[%d] idx=3D%d change par=
am br=3D%d",
> > +                               ctx->idx,
> > +                               mtk_buf->vb.vb2_buf.index,
> > +                               mtk_buf->enc_params.bitrate);
> > +               }
> > +               if (ctx->param_change & MTK_ENCODE_PARAM_FRAMERATE)=
 {
> > +                       mtk_buf->enc_params.framerate_num =3D
> > +                               ctx->enc_params.framerate_num;
> > +                       mtk_buf->enc_params.framerate_denom =3D
> > +                               ctx->enc_params.framerate_denom;
> > +                       mtk_v4l2_debug(1, "[%d] idx=3D%d, change pa=
ram fr=3D%d/%d",
> > +                                       ctx->idx,
> > +                                       mtk_buf->vb.vb2_buf.index,
> > +                                       mtk_buf->enc_params.framera=
te_num,
> > +                                       mtk_buf->enc_params.framera=
te_denom);
> > +               }
> > +               if (ctx->param_change & MTK_ENCODE_PARAM_INTRA_PERI=
OD) {
> > +                       mtk_buf->enc_params.gop_size =3D ctx->enc_p=
arams.gop_size;
> > +                       mtk_v4l2_debug(1, "[%d] idx=3D%d, change pa=
ram intra period=3D%d",
> > +                                       ctx->idx,
> > +                                       mtk_buf->vb.vb2_buf.index,
> > +                                       mtk_buf->enc_params.gop_siz=
e);
> > +               }
> > +               if (ctx->param_change & MTK_ENCODE_PARAM_FRAME_TYPE=
) {
> > +                       mtk_buf->enc_params.force_intra =3D
> > +                               ctx->enc_params.force_intra;
> > +                       mtk_v4l2_debug(1, "[%d] idx=3D%d, change pa=
ram force I=3D%d",
> > +                                       ctx->idx,
> > +                                       mtk_buf->vb.vb2_buf.index,
> > +                                       mtk_buf->enc_params.force_i=
ntra);
> > +               }
> > +               ctx->param_change =3D MTK_ENCODE_PARAM_NONE;
> > +       }
> > +
> > +       v4l2_m2m_buf_queue(ctx->m2m_ctx, to_vb2_v4l2_buffer(vb));
> > +}
> > +
> > +static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsign=
ed int count)
> > +{
> > +       struct mtk_vcodec_ctx *ctx =3D vb2_get_drv_priv(q);
> > +       struct venc_enc_prm param;
> > +       int ret;
> > +       int i;
> > +
> > +       /* Once state turn into MTK_STATE_ABORT, we need stop_strea=
ming to clear it */
> > +       if ((ctx->state =3D=3D MTK_STATE_ABORT) || (ctx->state =3D=3D=
 MTK_STATE_FREE))
> > +               goto err_set_param;
> > +
> > +       if (!(vb2_start_streaming_called(&ctx->m2m_ctx->out_q_ctx.q=
) &
> > +             vb2_start_streaming_called(&ctx->m2m_ctx->cap_q_ctx.q=
))) {
> > +               mtk_v4l2_debug(1, "[%d]-> out=3D%d cap=3D%d",
> > +                ctx->idx,
> > +                vb2_start_streaming_called(&ctx->m2m_ctx->out_q_ct=
x.q),
> > +                vb2_start_streaming_called(&ctx->m2m_ctx->cap_q_ct=
x.q));
> > +               return 0;
> > +       }
> > +
> > +       mtk_venc_set_param(ctx, &param);
> > +       ret =3D venc_if_set_param(ctx,
> > +                               VENC_SET_PARAM_ENC,
> > +                               &param);
> > +       if (ret) {
> > +               mtk_v4l2_err("venc_if_set_param failed=3D%d\n", ret=
);
> > +               ctx->state =3D MTK_STATE_ABORT;
> > +               goto err_set_param;
> > +       }
> > +
> > +       if ((ctx->q_data[MTK_Q_DATA_DST].fmt->fourcc =3D=3D V4L2_PI=
X_FMT_H264) &&
> > +           (ctx->enc_params.seq_hdr_mode !=3D V4L2_MPEG_VIDEO_HEAD=
ER_MODE_SEPARATE)) {
> > +               ret =3D venc_if_set_param(ctx,
> > +                                       VENC_SET_PARAM_PREPEND_HEAD=
ER,
> > +                                       0);
> > +               if (ret) {
> > +                       mtk_v4l2_err("venc_if_set_param failed=3D%d=
\n", ret);
> > +                       ctx->state =3D MTK_STATE_ABORT;
> > +                       goto err_set_param;
> > +               }
> > +               ctx->state =3D MTK_STATE_HEADER;
> > +       }
> > +
> > +       return 0;
> > +
> > +err_set_param:
> > +       for (i =3D 0; i < q->num_buffers; ++i) {
> > +               if (q->bufs[i]->state =3D=3D VB2_BUF_STATE_ACTIVE) =
{
> > +                       mtk_v4l2_debug(0, "[%d] idx=3D%d, type=3D%d=
, %d -> VB2_BUF_STATE_QUEUED",
> > +                                       ctx->idx, i, q->type,
> > +                                       (int)q->bufs[i]->state );
> > +                       v4l2_m2m_buf_done(to_vb2_v4l2_buffer(q->buf=
s[i]), VB2_BUF_STATE_QUEUED);
> > +               }
> > +       }
> > +
> > +       return -EINVAL;
> > +}
> > +
> > +static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
> > +{
> > +       struct mtk_vcodec_ctx *ctx =3D vb2_get_drv_priv(q);
> > +       struct vb2_buffer *src_buf, *dst_buf;
> > +       int ret;
> > +
> > +       mtk_v4l2_debug(2, "[%d]-> type=3D%d", ctx->idx, q->type);
> > +
> > +       if (q->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> > +               while ((dst_buf =3D v4l2_m2m_dst_buf_remove(ctx->m2=
m_ctx))) {
> > +                       dst_buf->planes[0].bytesused =3D 0;
> > +                       v4l2_m2m_buf_done(to_vb2_v4l2_buffer(dst_bu=
f),
> > +                                               VB2_BUF_STATE_ERROR=
);
> > +               }
> > +       } else {
> > +               while ((src_buf =3D v4l2_m2m_src_buf_remove(ctx->m2=
m_ctx)))
> > +                       v4l2_m2m_buf_done(to_vb2_v4l2_buffer(src_bu=
f),
> > +                                               VB2_BUF_STATE_ERROR=
);
> > +       }
> > +
> > +       if ((q->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
> > +            vb2_is_streaming(&ctx->m2m_ctx->out_q_ctx.q)) ||
> > +           (q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
> > +            vb2_is_streaming(&ctx->m2m_ctx->cap_q_ctx.q))) {
> > +               mtk_v4l2_debug(1, "[%d]-> q type %d out=3D%d cap=3D=
%d",
> > +                              ctx->idx, q->type,
> > +                              vb2_is_streaming(&ctx->m2m_ctx->out_=
q_ctx.q),
> > +                              vb2_is_streaming(&ctx->m2m_ctx->cap_=
q_ctx.q));
> > +               return;
> > +       }
> > +
> > +       ret =3D venc_if_release(ctx);
> > +       if (ret)
> > +               mtk_v4l2_err("venc_if_release failed=3D%d\n", ret);
> > +
> > +       ctx->state =3D MTK_STATE_FREE;
> > +}
> > +
> > +static struct vb2_ops mtk_venc_vb2_ops =3D {
> > +       .queue_setup                    =3D vb2ops_venc_queue_setup=
,
> > +       .buf_prepare                    =3D vb2ops_venc_buf_prepare=
,
> > +       .buf_queue                      =3D vb2ops_venc_buf_queue,
> > +       .wait_prepare                   =3D vb2_ops_wait_prepare,
> > +       .wait_finish                    =3D vb2_ops_wait_finish,
> > +       .start_streaming                =3D vb2ops_venc_start_strea=
ming,
> > +       .stop_streaming                 =3D vb2ops_venc_stop_stream=
ing,
> > +};
> > +
> > +static int mtk_venc_encode_header(void *priv)
> > +{
> > +       struct mtk_vcodec_ctx *ctx =3D priv;
> > +       int ret;
> > +       struct vb2_buffer *dst_buf;
> > +       struct mtk_vcodec_mem bs_buf;
> > +       struct venc_done_result enc_result;
> > +
> > +       dst_buf =3D v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
> > +       if (!dst_buf) {
> > +               mtk_v4l2_debug(1, "No dst buffer");
> > +               return -EINVAL;
> > +       }
> > +
> > +       bs_buf.va =3D vb2_plane_vaddr(dst_buf, 0);
> > +       bs_buf.dma_addr =3D vb2_dma_contig_plane_dma_addr(dst_buf, =
0);
> > +       bs_buf.size =3D (unsigned int)dst_buf->planes[0].length;
> > +
> > +       mtk_v4l2_debug(1,
> > +                       "[%d] buf idx=3D%d va=3D0x%p dma_addr=3D0x%=
llx size=3D0x%lx",
> > +                       ctx->idx,
> > +                       dst_buf->index, bs_buf.va,
> > +                       (u64)bs_buf.dma_addr,
> > +                       bs_buf.size);
> > +
> > +       ret =3D venc_if_encode(ctx,
> > +                       VENC_START_OPT_ENCODE_SEQUENCE_HEADER,
> > +                       0, &bs_buf, &enc_result);
> > +
> > +       if (ret) {
> > +               dst_buf->planes[0].bytesused =3D 0;
> > +               ctx->state =3D MTK_STATE_ABORT;
> > +               v4l2_m2m_buf_done(to_vb2_v4l2_buffer(dst_buf), VB2_=
BUF_STATE_ERROR);
> > +               mtk_v4l2_err("venc_if_encode failed=3D%d", ret);
> > +               return -EINVAL;
> > +       }
> > +
> > +       ctx->state =3D MTK_STATE_HEADER;
> > +       dst_buf->planes[0].bytesused =3D enc_result.bs_size;
> > +
> > +#if defined(DEBUG)
> > +{
> > +       int i;
> > +       mtk_v4l2_debug(1, "[%d] venc_if_encode header len=3D%d",
> > +                       ctx->idx,
> > +                       enc_result.bs_size);
> > +       for (i =3D 0; i < enc_result.bs_size; i++) {
> > +               unsigned char *p =3D (unsigned char *)bs_buf.va;
> > +
> > +               mtk_v4l2_debug(1, "[%d] buf[%d]=3D0x%2x", ctx->idx,=
 i, p[i]);
> > +       }
> > +}
> > +#endif
> > +       v4l2_m2m_buf_done(to_vb2_v4l2_buffer(dst_buf), VB2_BUF_STAT=
E_DONE);
> > +
> > +       return 0;
> > +}
> > +
> > +static int mtk_venc_param_change(struct mtk_vcodec_ctx *ctx, void =
*priv)
> > +{
> > +       struct vb2_buffer *vb =3D priv;
> > +       struct vb2_v4l2_buffer *vb2_v4l2 =3D
> > +                       container_of(vb, struct vb2_v4l2_buffer, vb=
2_buf);
> > +       struct mtk_video_enc_buf *mtk_buf =3D
> > +                       container_of(vb2_v4l2, struct mtk_video_enc=
_buf, vb);
> > +       int ret =3D 0;
> > +
> > +       if (mtk_buf->param_change =3D=3D MTK_ENCODE_PARAM_NONE)
> > +               return 0;
> > +
> > +       mtk_v4l2_debug(1, "encode parameters change id=3D%d", vb->i=
ndex);
> > +       if (mtk_buf->param_change & MTK_ENCODE_PARAM_BITRATE) {
> > +               struct venc_enc_prm enc_prm;
> > +
> > +               enc_prm.bitrate =3D mtk_buf->enc_params.bitrate;
> > +               mtk_v4l2_debug(1, "[%d] idx=3D%d, change param br=3D=
%d",
> > +                               ctx->idx,
> > +                               mtk_buf->vb.vb2_buf.index,
> > +                               enc_prm.bitrate);
> > +               ret |=3D venc_if_set_param(ctx,
> > +                                        VENC_SET_PARAM_ADJUST_BITR=
ATE,
> > +                                        &enc_prm);
> > +       }
> > +       if (mtk_buf->param_change & MTK_ENCODE_PARAM_FRAMERATE) {
> > +               struct venc_enc_prm enc_prm;
> > +
> > +               enc_prm.frm_rate =3D mtk_buf->enc_params.framerate_=
num /
> > +                                  mtk_buf->enc_params.framerate_de=
nom;
> > +               mtk_v4l2_debug(1, "[%d] idx=3D%d, change param fr=3D=
%d",
> > +                              ctx->idx,
> > +                              mtk_buf->vb.vb2_buf.index,
> > +                              enc_prm.frm_rate);
> > +               ret |=3D venc_if_set_param(ctx,
> > +                                        VENC_SET_PARAM_ADJUST_FRAM=
ERATE,
> > +                                        &enc_prm);
> > +       }
> > +       if (mtk_buf->param_change & MTK_ENCODE_PARAM_INTRA_PERIOD) =
{
> > +               mtk_v4l2_debug(1, "change param intra period=3D%d",
> > +                                mtk_buf->enc_params.gop_size);
> > +               ret |=3D venc_if_set_param(ctx,
> > +                                        VENC_SET_PARAM_I_FRAME_INT=
ERVAL,
> > +                                        &mtk_buf->enc_params.gop_s=
ize);
> > +       }
> > +       if (mtk_buf->param_change & MTK_ENCODE_PARAM_FRAME_TYPE) {
> > +               mtk_v4l2_debug(1, "[%d] idx=3D%d, change param forc=
e I=3D%d",
> > +                               ctx->idx,
> > +                               mtk_buf->vb.vb2_buf.index,
> > +                               mtk_buf->enc_params.force_intra);
> > +               if (mtk_buf->enc_params.force_intra)
> > +                       ret |=3D venc_if_set_param(ctx,
> > +                                                VENC_SET_PARAM_FOR=
CE_INTRA,
> > +                                                0);
> > +       }
> > +
> > +       mtk_buf->param_change =3D MTK_ENCODE_PARAM_NONE;
> > +
> > +       if (ret) {
> > +               ctx->state =3D MTK_STATE_ABORT;
> > +               mtk_v4l2_err("venc_if_set_param %d failed=3D%d\n",
> > +                       MTK_ENCODE_PARAM_FRAME_TYPE, ret);
> > +               return -1;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static void mtk_venc_worker(struct work_struct *work)
> > +{
> > +       struct mtk_vcodec_ctx *ctx =3D container_of(work, struct mt=
k_vcodec_ctx,
> > +                                   encode_work);
> > +       struct vb2_buffer *src_buf, *dst_buf;
> > +       struct venc_frm_buf frm_buf;
> > +       struct mtk_vcodec_mem bs_buf;
> > +       struct venc_done_result enc_result;
> > +       int ret;
> > +       struct vb2_v4l2_buffer *v4l2_vb;
> > +
> > +       if ((ctx->q_data[MTK_Q_DATA_DST].fmt->fourcc =3D=3D V4L2_PI=
X_FMT_H264) &&
> > +           (ctx->state !=3D MTK_STATE_HEADER)) {
> > +               /* encode h264 sps/pps header */
> > +               mtk_venc_encode_header(ctx);
> > +               v4l2_m2m_job_finish(ctx->dev->m2m_dev_enc, ctx->m2m=
_ctx);
> > +               return;
> > +       }
> > +
> > +       src_buf =3D v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> > +       if (!src_buf) {
> > +               v4l2_m2m_job_finish(ctx->dev->m2m_dev_enc, ctx->m2m=
_ctx);
> > +               return;
> > +       }
> > +
> > +       dst_buf =3D v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
> > +       if (!dst_buf) {
> > +               v4l2_m2m_job_finish(ctx->dev->m2m_dev_enc, ctx->m2m=
_ctx);
> > +               return;
> > +       }
> > +
> > +       mtk_venc_param_change(ctx, src_buf);
> > +
> > +       frm_buf.fb_addr.va =3D vb2_plane_vaddr(src_buf, 0);
> > +       frm_buf.fb_addr.dma_addr =3D vb2_dma_contig_plane_dma_addr(=
src_buf, 0);
> > +       frm_buf.fb_addr.size =3D (unsigned int)src_buf->planes[0].l=
ength;
> > +       frm_buf.fb_addr1.va =3D vb2_plane_vaddr(src_buf, 1);
> > +       frm_buf.fb_addr1.dma_addr =3D vb2_dma_contig_plane_dma_addr=
(src_buf, 1);
> > +       frm_buf.fb_addr1.size =3D (unsigned int)src_buf->planes[1].=
length;
> > +       if (src_buf->num_planes =3D=3D 3) {
> > +               frm_buf.fb_addr2.va =3D vb2_plane_vaddr(src_buf, 2)=
;
> > +               frm_buf.fb_addr2.dma_addr =3D
> > +                       vb2_dma_contig_plane_dma_addr(src_buf, 2);
> > +               frm_buf.fb_addr2.size =3D
> > +                       (unsigned int)src_buf->planes[2].length;
> > +       } else {
> > +               frm_buf.fb_addr2.va =3D NULL;
> > +               frm_buf.fb_addr2.dma_addr =3D 0;
> > +               frm_buf.fb_addr2.size =3D 0;
> > +       }
> > +       bs_buf.va =3D vb2_plane_vaddr(dst_buf, 0);
> > +       bs_buf.dma_addr =3D vb2_dma_contig_plane_dma_addr(dst_buf, =
0);
> > +       bs_buf.size =3D (unsigned int)dst_buf->planes[0].length;
> > +
> > +       mtk_v4l2_debug(2,
> > +                       "Framebuf VA=3D%p PA=3D%llx Size=3D0x%lx;VA=
=3D%p PA=3D0x%llx Size=3D0x%lx;VA=3D%p PA=3D0x%llx Size=3D0x%lx",
> > +                       frm_buf.fb_addr.va,
> > +                       (u64)frm_buf.fb_addr.dma_addr,
> > +                       frm_buf.fb_addr.size,
> > +                       frm_buf.fb_addr1.va,
> > +                       (u64)frm_buf.fb_addr1.dma_addr,
> > +                       frm_buf.fb_addr1.size,
> > +                       frm_buf.fb_addr2.va,
> > +                       (u64)frm_buf.fb_addr2.dma_addr,
> > +                       frm_buf.fb_addr2.size);
> > +
> > +       ret =3D venc_if_encode(ctx, VENC_START_OPT_ENCODE_FRAME,
> > +                            &frm_buf, &bs_buf, &enc_result);
> > +
> > +       src_buf =3D v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> > +       if (enc_result.msg =3D=3D VENC_MESSAGE_OK)
> > +               v4l2_m2m_buf_done(to_vb2_v4l2_buffer(src_buf), VB2_=
BUF_STATE_DONE);
> > +       else
> > +               v4l2_m2m_buf_done(to_vb2_v4l2_buffer(src_buf), VB2_=
BUF_STATE_ERROR);
> > +
> > +       if (enc_result.is_key_frm) {
> > +               v4l2_vb =3D to_vb2_v4l2_buffer(dst_buf);
> > +               v4l2_vb->flags |=3D V4L2_BUF_FLAG_KEYFRAME;
> > +       }
> > +
> > +       if (ret) {
> > +               dst_buf->planes[0].bytesused =3D 0;
> > +               v4l2_m2m_buf_done(to_vb2_v4l2_buffer(dst_buf), VB2_=
BUF_STATE_ERROR);
> > +               mtk_v4l2_err("venc_if_encode failed=3D%d", ret);
> > +       } else {
> > +               dst_buf->planes[0].bytesused =3D enc_result.bs_size=
;
> > +               v4l2_m2m_buf_done(to_vb2_v4l2_buffer(dst_buf), VB2_=
BUF_STATE_DONE);
> > +               mtk_v4l2_debug(2, "venc_if_encode bs size=3D%d",
> > +                                enc_result.bs_size);
> > +       }
> > +
> > +       v4l2_m2m_job_finish(ctx->dev->m2m_dev_enc, ctx->m2m_ctx);
> > +
> > +       mtk_v4l2_debug(1, "<=3D=3D=3D src_buf[%d] dst_buf[%d] venc_=
if_encode ret=3D%d Size=3D%u=3D=3D=3D>",
> > +                       src_buf->index, dst_buf->index, ret,
> > +                       enc_result.bs_size);
> > +}
> > +
> > +static void m2mops_venc_device_run(void *priv)
> > +{
> > +       struct mtk_vcodec_ctx *ctx =3D priv;
> > +       queue_work(ctx->dev->encode_workqueue, &ctx->encode_work);
> > +}
> > +
> > +static int m2mops_venc_job_ready(void *m2m_priv)
> > +{
> > +       struct mtk_vcodec_ctx *ctx =3D m2m_priv;
> > +
> > +       if (!v4l2_m2m_num_dst_bufs_ready(ctx->m2m_ctx)) {
> > +               mtk_v4l2_debug(3, "[%d]Not ready: not enough video =
dst buffers.",
> > +                              ctx->idx);
> > +               return 0;
> > +       }
> > +
> > +       if (!v4l2_m2m_num_src_bufs_ready(ctx->m2m_ctx)) {
> > +               mtk_v4l2_debug(3, "[%d]Not ready: not enough video =
src buffers.",
> > +                              ctx->idx);
> > +                       return 0;
> > +               }
> > +
> > +       if (ctx->state =3D=3D MTK_STATE_ABORT) {
> > +               mtk_v4l2_debug(3, "[%d]Not ready: state=3D0x%x.",
> > +                              ctx->idx, ctx->state);
> > +               return 0;
> > +       }
> > +
> > +       if (ctx->state =3D=3D MTK_STATE_FREE) {
> > +               mtk_v4l2_debug(3, "[%d]Not ready: state=3D0x%x.",
> > +                              ctx->idx, ctx->state);
> > +               return 0;
> > +       }
> > +
> > +       return 1;
> > +}
> > +
> > +static void m2mops_venc_job_abort(void *priv)
> > +{
> > +       struct mtk_vcodec_ctx *ctx =3D priv;
> > +
> > +       ctx->state =3D MTK_STATE_ABORT;
> > +}
> > +
> > +static void m2mops_venc_lock(void *m2m_priv)
> > +{
> > +       struct mtk_vcodec_ctx *ctx =3D m2m_priv;
> > +
> > +       mutex_lock(&ctx->dev->dev_mutex);
> > +}
> > +
> > +static void m2mops_venc_unlock(void *m2m_priv)
> > +{
> > +       struct mtk_vcodec_ctx *ctx =3D m2m_priv;
> > +
> > +       mutex_unlock(&ctx->dev->dev_mutex);
> > +}
> > +
> > +const struct v4l2_m2m_ops mtk_venc_m2m_ops =3D {
> > +       .device_run                     =3D m2mops_venc_device_run,
> > +       .job_ready                      =3D m2mops_venc_job_ready,
> > +       .job_abort                      =3D m2mops_venc_job_abort,
> > +       .lock                           =3D m2mops_venc_lock,
> > +       .unlock                         =3D m2mops_venc_unlock,
> > +};
> > +
> > +#define IS_MTK_VENC_PRIV(x) ((V4L2_CTRL_ID2CLASS(x) =3D=3D V4L2_CT=
RL_CLASS_MPEG) &&\
> > +                            V4L2_CTRL_DRIVER_PRIV(x))
> > +
> > +void mtk_vcodec_enc_ctx_params_setup(struct mtk_vcodec_ctx *ctx)
> > +{
> > +       struct mtk_q_data *q_data;
> > +       struct mtk_video_fmt *fmt;
> > +
> > +       ctx->m2m_ctx->q_lock =3D &ctx->dev->dev_mutex;
> > +       ctx->fh.m2m_ctx =3D ctx->m2m_ctx;
> > +       ctx->fh.ctrl_handler =3D &ctx->ctrl_hdl;
> > +       INIT_WORK(&ctx->encode_work, mtk_venc_worker);
> > +
> > +       ctx->q_data[MTK_Q_DATA_SRC].width =3D DFT_CFG_WIDTH;
> > +       ctx->q_data[MTK_Q_DATA_SRC].height =3D DFT_CFG_HEIGHT;
> > +       ctx->q_data[MTK_Q_DATA_SRC].fmt =3D &mtk_video_formats[0];
> > +       ctx->q_data[MTK_Q_DATA_SRC].colorspace =3D V4L2_COLORSPACE_=
REC709;
> > +       ctx->q_data[MTK_Q_DATA_SRC].field =3D V4L2_FIELD_NONE;
> > +
> > +       q_data =3D &ctx->q_data[MTK_Q_DATA_SRC];
> > +       fmt =3D ctx->q_data[MTK_Q_DATA_SRC].fmt;
> > +       mtk_vcodec_enc_calc_src_size(fmt->num_planes, q_data->width=
,
> > +                       q_data->height,
> > +                       ctx->q_data[MTK_Q_DATA_SRC].sizeimage,
> > +                       ctx->q_data[MTK_Q_DATA_SRC].bytesperline);
> > +
> > +       ctx->q_data[MTK_Q_DATA_DST].width =3D DFT_CFG_WIDTH;
> > +       ctx->q_data[MTK_Q_DATA_DST].height =3D DFT_CFG_HEIGHT;
> > +       ctx->q_data[MTK_Q_DATA_DST].fmt =3D &mtk_video_formats[9];
> > +       ctx->q_data[MTK_Q_DATA_DST].colorspace =3D V4L2_COLORSPACE_=
REC709;
> > +       ctx->q_data[MTK_Q_DATA_DST].field =3D V4L2_FIELD_NONE;
> > +
> > +       q_data =3D &ctx->q_data[MTK_Q_DATA_DST];
> > +       fmt =3D ctx->q_data[MTK_Q_DATA_DST].fmt;
> > +       ctx->q_data[MTK_Q_DATA_DST].sizeimage[0] =3D q_data->width =
* q_data->height;
> > +       ctx->q_data[MTK_Q_DATA_DST].bytesperline[0] =3D 0;
> > +
> > +}
> > +
> > +int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
> > +{
> > +       const struct v4l2_ctrl_ops *ops =3D &mtk_vcodec_enc_ctrl_op=
s;
> > +       struct v4l2_ctrl_handler *handler =3D &ctx->ctrl_hdl;
> > +       struct v4l2_ctrl_config cfg;
> > +
> > +       v4l2_ctrl_handler_init(handler, MTK_MAX_CTRLS);
> > +       if (handler->error) {
> > +               mtk_v4l2_err("Init control handler fail %d\n",
> > +                               handler->error);
> > +               return handler->error;
> > +       }
> > +
> > +       ctx->ctrls[0] =3D v4l2_ctrl_new_std(handler, ops,
> > +                                       V4L2_CID_MPEG_VIDEO_BITRATE=
,
> > +                                       1, 4000000, 1, 4000000);
> > +       ctx->ctrls[1] =3D v4l2_ctrl_new_std(handler, ops,
> > +                                       V4L2_CID_MPEG_VIDEO_B_FRAME=
S,
> > +                                       0, 2, 1, 0);
> > +       ctx->ctrls[2] =3D v4l2_ctrl_new_std(handler, ops,
> > +                                       V4L2_CID_MPEG_VIDEO_FRAME_R=
C_ENABLE,
> > +                                       0, 1, 1, 1);
> > +       ctx->ctrls[3] =3D v4l2_ctrl_new_std(handler, ops,
> > +                                       V4L2_CID_MPEG_VIDEO_H264_MA=
X_QP,
> > +                                       0, 51, 1, 51);
> > +       ctx->ctrls[4] =3D v4l2_ctrl_new_std(handler, ops,
> > +                                       V4L2_CID_MPEG_VIDEO_H264_I_=
PERIOD,
> > +                                       0, 65535, 1, 30);
> > +       ctx->ctrls[5] =3D v4l2_ctrl_new_std(handler, ops,
> > +                                       V4L2_CID_MPEG_VIDEO_GOP_SIZ=
E,
> > +                                       0, 65535, 1, 30);
> > +       ctx->ctrls[6] =3D v4l2_ctrl_new_std(handler, ops,
> > +                                       V4L2_CID_MPEG_VIDEO_MB_RC_E=
NABLE,
> > +                                       0, 1, 1, 0);
> > +       ctx->ctrls[7] =3D v4l2_ctrl_new_std_menu(handler, ops,
> > +                                       V4L2_CID_MPEG_VIDEO_HEADER_=
MODE,
> > +                                       V4L2_MPEG_VIDEO_HEADER_MODE=
_JOINED_WITH_1ST_FRAME,
> > +                                       0, V4L2_MPEG_VIDEO_HEADER_M=
ODE_SEPARATE);
> > +       ctx->ctrls[8] =3D v4l2_ctrl_new_std_menu(handler, ops,
> > +                                       V4L2_CID_MPEG_VIDEO_H264_PR=
OFILE,
> > +                                       V4L2_MPEG_VIDEO_H264_PROFIL=
E_HIGH,
> > +                                       0, V4L2_MPEG_VIDEO_H264_PRO=
=46ILE_MAIN);
> > +       ctx->ctrls[9] =3D v4l2_ctrl_new_std_menu(handler, ops,
> > +                                       V4L2_CID_MPEG_VIDEO_H264_LE=
VEL,
> > +                                       V4L2_MPEG_VIDEO_H264_LEVEL_=
4_2,
> > +                                       0, V4L2_MPEG_VIDEO_H264_LEV=
EL_4_0);
> > +       ctx->ctrls[6] =3D v4l2_ctrl_new_std(handler, ops,
> > +                                       V4L2_CID_MPEG_VIDEO_FORCE_K=
EY_FRAME,
> > +                                       0, 0, 0, 0);
> > +
> > +       v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
> > +
> > +       return 0;
> > +}
> > +
> > +int mtk_vcodec_enc_queue_init(void *priv, struct vb2_queue *src_vq=
,
> > +                          struct vb2_queue *dst_vq)
> > +{
> > +       struct mtk_vcodec_ctx *ctx =3D priv;
> > +       int ret;
> > +
> > +       src_vq->type            =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLA=
NE;
> > +       src_vq->io_modes        =3D VB2_DMABUF | VB2_MMAP | VB2_USE=
RPTR;
> > +       src_vq->drv_priv        =3D ctx;
> > +       src_vq->buf_struct_size =3D sizeof(struct mtk_video_enc_buf=
);
> > +       src_vq->ops             =3D &mtk_venc_vb2_ops;
> > +       src_vq->mem_ops         =3D &vb2_dma_contig_memops;
> > +       src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > +       src_vq->lock =3D &ctx->dev->dev_mutex;
> > +
> > +       ret =3D vb2_queue_init(src_vq);
> > +       if (ret)
> > +               return ret;
> > +
> > +       dst_vq->type            =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPL=
ANE;
> > +       dst_vq->io_modes        =3D VB2_DMABUF | VB2_MMAP | VB2_USE=
RPTR;
> > +       dst_vq->drv_priv        =3D ctx;
> > +       dst_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> > +       dst_vq->ops             =3D &mtk_venc_vb2_ops;
> > +       dst_vq->mem_ops         =3D &vb2_dma_contig_memops;
> > +       dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > +       dst_vq->lock =3D &ctx->dev->dev_mutex;
> > +
> > +       return vb2_queue_init(dst_vq);
> > +}
> > +
> > +int mtk_venc_unlock(struct mtk_vcodec_ctx *ctx)
> > +{
> > +       struct mtk_vcodec_dev *dev =3D ctx->dev;
> > +       dev->curr_ctx =3D -1;
> > +       mutex_unlock(&dev->enc_mutex);
> > +       return 0;
> > +}
> > +
> > +int mtk_venc_lock(struct mtk_vcodec_ctx *ctx)
> > +{
> > +       struct mtk_vcodec_dev *dev =3D ctx->dev;
> > +
> > +       mutex_lock(&dev->enc_mutex);
> > +       dev->curr_ctx =3D ctx->idx;
> > +       return 0;
> > +}
> > +
> > +void mtk_vcodec_enc_release(struct mtk_vcodec_ctx *ctx)
> > +{
> > +       venc_if_release(ctx);
> > +}
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h b/d=
rivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h
> > new file mode 100644
> > index 0000000..e09524b
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h
> > @@ -0,0 +1,46 @@
> > +/*
> > +* Copyright (c) 2015 MediaTek Inc.
> > +* Author: PC Chen <pc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > +*         Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > +*
> > +* This program is free software; you can redistribute it and/or mo=
dify
> > +* it under the terms of the GNU General Public License version 2 a=
s
> > +* published by the Free Software Foundation.
> > +*
> > +* This program is distributed in the hope that it will be useful,
> > +* but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > +* GNU General Public License for more details.
> > +*/
> > +
> > +
> > +#ifndef _MTK_VCODEC_ENC_H_
> > +#define _MTK_VCODEC_ENC_H_
> > +
> > +#include <media/videobuf2-core.h>
> > +#include <media/videobuf2-v4l2.h>
> > +
> > +/**
> > + * struct mtk_video_enc_buf - Private data related to each VB2 buf=
fer.
> > + * @b:                 Pointer to related VB2 buffer.
> > + * @param_change:      Types of encode parameter change before enc=
ode this
> > + *                     buffer
> > + * @enc_params         Encode parameters changed before encode thi=
s buffer
> > + */
> > +struct mtk_video_enc_buf {
> > +       struct vb2_v4l2_buffer  vb;
> > +       struct list_head        list;
> > +
> > +       enum mtk_encode_param param_change;
> > +       struct mtk_enc_params enc_params;
> > +};
> > +
> > +int mtk_venc_unlock(struct mtk_vcodec_ctx *ctx);
> > +int mtk_venc_lock(struct mtk_vcodec_ctx *ctx);
> > +int mtk_vcodec_enc_queue_init(void *priv, struct vb2_queue *src_vq=
,
> > +                                       struct vb2_queue *dst_vq);
> > +void mtk_vcodec_enc_release(struct mtk_vcodec_ctx *ctx);
> > +int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx);
> > +void mtk_vcodec_enc_ctx_params_setup(struct mtk_vcodec_ctx *ctx);
> > +
> > +#endif /* _MTK_VCODEC_ENC_H_ */
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c=
 b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > new file mode 100644
> > index 0000000..e7ab14a
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > @@ -0,0 +1,476 @@
> > +/*
> > +* Copyright (c) 2015 MediaTek Inc.
> > +* Author: PC Chen <pc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > +*         Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > +*
> > +* This program is free software; you can redistribute it and/or mo=
dify
> > +* it under the terms of the GNU General Public License version 2 a=
s
> > +* published by the Free Software Foundation.
> > +*
> > +* This program is distributed in the hope that it will be useful,
> > +* but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > +* GNU General Public License for more details.
> > +*/
> > +
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-mem2mem.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +#include <linux/pm_runtime.h>
> > +
> > +#include "mtk_vcodec_drv.h"
> > +#include "mtk_vcodec_enc.h"
> > +#include "mtk_vcodec_pm.h"
> > +#include "mtk_vcodec_intr.h"
> > +#include "mtk_vcodec_util.h"
> > +#include "mtk_vpu.h"
> > +
> > +
> > +/* Wake up context wait_queue */
> > +static void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int r=
eason)
> > +{
> > +       ctx->int_cond =3D 1;
> > +       ctx->int_type =3D reason;
> > +       wake_up_interruptible(&ctx->queue);
> > +}
> > +
> > +static irqreturn_t mtk_vcodec_enc_irq_handler(int irq, void *priv)
> > +{
> > +       struct mtk_vcodec_dev *dev =3D priv;
> > +       struct mtk_vcodec_ctx *ctx;
> > +       unsigned int irq_status;
> > +
> > +       if (dev->curr_ctx =3D=3D -1) {
> > +               mtk_v4l2_err("curr_ctx =3D -1");
> > +               return IRQ_HANDLED;
> > +       }
> > +
> > +       ctx =3D dev->ctx[dev->curr_ctx];
> > +       if (ctx =3D=3D NULL) {
> > +               mtk_v4l2_err("curr_ctx=3D=3DNULL");
> > +               return IRQ_HANDLED;
> > +       }
> > +       mtk_v4l2_debug(1, "idx=3D%d", ctx->idx);
> > +       irq_status =3D readl(dev->reg_base[VENC_SYS] +
> > +                               (MTK_VENC_IRQ_STATUS_OFFSET));
> > +       if (irq_status & MTK_VENC_IRQ_STATUS_PAUSE)
> > +               writel((MTK_VENC_IRQ_STATUS_PAUSE),
> > +                      dev->reg_base[VENC_SYS] + (MTK_VENC_IRQ_ACK_=
OFFSET));
> > +
> > +       if (irq_status & MTK_VENC_IRQ_STATUS_SWITCH)
> > +               writel((MTK_VENC_IRQ_STATUS_SWITCH),
> > +                      dev->reg_base[VENC_SYS] + (MTK_VENC_IRQ_ACK_=
OFFSET));
> > +
> > +       if (irq_status & MTK_VENC_IRQ_STATUS_DRAM)
> > +               writel((MTK_VENC_IRQ_STATUS_DRAM),
> > +                      dev->reg_base[VENC_SYS] + (MTK_VENC_IRQ_ACK_=
OFFSET));
> > +
> > +       if (irq_status & MTK_VENC_IRQ_STATUS_SPS)
> > +               writel((MTK_VENC_IRQ_STATUS_SPS),
> > +                      dev->reg_base[VENC_SYS] + (MTK_VENC_IRQ_ACK_=
OFFSET));
> > +
> > +       if (irq_status & MTK_VENC_IRQ_STATUS_PPS)
> > +               writel((MTK_VENC_IRQ_STATUS_PPS),
> > +                      dev->reg_base[VENC_SYS] + (MTK_VENC_IRQ_ACK_=
OFFSET));
> > +
> > +       if (irq_status & MTK_VENC_IRQ_STATUS_FRM)
> > +               writel((MTK_VENC_IRQ_STATUS_FRM),
> > +                      dev->reg_base[VENC_SYS] + (MTK_VENC_IRQ_ACK_=
OFFSET));
> > +
> > +       ctx->irq_status =3D irq_status;
> > +       wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
> > +       return IRQ_HANDLED;
> > +}
> > +
> > +#if 1 /* VENC_LT */
> > +static irqreturn_t mtk_vcodec_enc_irq_handler2(int irq, void *priv=
)
> > +{
> > +       struct mtk_vcodec_dev *dev =3D priv;
> > +       struct mtk_vcodec_ctx *ctx;
> > +       unsigned int irq_status;
> > +
> > +       ctx =3D dev->ctx[dev->curr_ctx];
> > +       if (ctx =3D=3D NULL) {
> > +               mtk_v4l2_err("ctx=3D=3DNULL");
> > +               return IRQ_HANDLED;
> > +       }
> > +       mtk_v4l2_debug(1, "idx=3D%d", ctx->idx);
> > +       irq_status =3D readl(dev->reg_base[VENC_LT_SYS] +
> > +                               (MTK_VENC_IRQ_STATUS_OFFSET));
> > +       if (irq_status & MTK_VENC_IRQ_STATUS_PAUSE)
> > +               writel((MTK_VENC_IRQ_STATUS_PAUSE),
> > +                      dev->reg_base[VENC_LT_SYS] + (MTK_VENC_IRQ_A=
CK_OFFSET));
> > +
> > +       if (irq_status & MTK_VENC_IRQ_STATUS_SWITCH)
> > +               writel((MTK_VENC_IRQ_STATUS_SWITCH),
> > +                      dev->reg_base[VENC_LT_SYS] + (MTK_VENC_IRQ_A=
CK_OFFSET));
> > +
> > +       if (irq_status & MTK_VENC_IRQ_STATUS_DRAM)
> > +               writel((MTK_VENC_IRQ_STATUS_DRAM),
> > +                      dev->reg_base[VENC_LT_SYS] + (MTK_VENC_IRQ_A=
CK_OFFSET));
> > +
> > +       if (irq_status & MTK_VENC_IRQ_STATUS_SPS)
> > +               writel((MTK_VENC_IRQ_STATUS_SPS),
> > +                      dev->reg_base[VENC_LT_SYS] + (MTK_VENC_IRQ_A=
CK_OFFSET));
> > +
> > +       if (irq_status & MTK_VENC_IRQ_STATUS_PPS)
> > +               writel((MTK_VENC_IRQ_STATUS_PPS),
> > +                      dev->reg_base[VENC_LT_SYS] + (MTK_VENC_IRQ_A=
CK_OFFSET));
> > +
> > +       if (irq_status & MTK_VENC_IRQ_STATUS_FRM)
> > +               writel((MTK_VENC_IRQ_STATUS_FRM),
> > +                      dev->reg_base[VENC_LT_SYS] + (MTK_VENC_IRQ_A=
CK_OFFSET));
> > +
> > +       ctx->irq_status =3D irq_status;
> > +       wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
> > +       return IRQ_HANDLED;
> > +}
> > +#endif
> > +
> > +static void mtk_vcodec_enc_reset_handler(void *priv)
> > +{
> > +       int i;
> > +       struct mtk_vcodec_dev *dev =3D priv;
> > +       struct mtk_vcodec_ctx *ctx;
> > +
> > +       mtk_v4l2_debug(0, "Watchdog timeout!!");
> > +
> > +       mutex_lock(&dev->dev_mutex);
> > +       for(i =3D 0; i < MTK_VCODEC_MAX_ENCODER_INSTANCES; i++) {
> > +               ctx =3D dev->ctx[i];
> > +               if (ctx) {
> > +                       ctx->state =3D MTK_STATE_ABORT;
> > +                       mtk_v4l2_debug(0, "[%d] Change to state MTK=
_STATE_ERROR", ctx->idx);
> > +               }
> > +
> > +       }
> > +       mutex_unlock(&dev->dev_mutex);
> > +}
> > +
> > +static int fops_vcodec_open(struct file *file)
> > +{
> > +       struct video_device *vfd =3D video_devdata(file);
> > +       struct mtk_vcodec_dev *dev =3D video_drvdata(file);
> > +       struct mtk_vcodec_ctx *ctx =3D NULL;
> > +       int ret =3D 0;
> > +
> > +       mutex_lock(&dev->dev_mutex);
> > +
> > +       ctx =3D devm_kzalloc(&dev->plat_dev->dev, sizeof(*ctx), GFP=
_KERNEL);
> > +       if (!ctx) {
> > +               ret =3D -ENOMEM;
> > +               goto err_alloc;
> > +       }
> > +
> > +       if (dev->num_instances >=3D MTK_VCODEC_MAX_ENCODER_INSTANCE=
S) {
> > +               mtk_v4l2_err("Too many open contexts\n");
> > +               ret =3D -EBUSY;
> > +               goto err_no_ctx;
> > +       }
> > +
> > +       ctx->idx =3D ffz(dev->instance_mask[0]);
> > +       v4l2_fh_init(&ctx->fh, video_devdata(file));
> > +       file->private_data =3D &ctx->fh;
> > +       v4l2_fh_add(&ctx->fh);
> > +       ctx->dev =3D dev;
> > +
> > +       if (vfd =3D=3D dev->vfd_enc) {
> > +               ctx->type =3D MTK_INST_ENCODER;
> > +
> > +               ret =3D mtk_vcodec_enc_ctrls_setup(ctx);
> > +               if (ret) {
> > +                       mtk_v4l2_err("Failed to setup controls() (%=
d)\n",
> > +                                      ret);
> > +                       goto err_ctrls_setup;
> > +               }
> > +               ctx->m2m_ctx =3D v4l2_m2m_ctx_init(dev->m2m_dev_enc=
, ctx,
> > +                                                &mtk_vcodec_enc_qu=
eue_init);
> > +               if (IS_ERR(ctx->m2m_ctx)) {
> > +                       ret =3D PTR_ERR(ctx->m2m_ctx);
> > +                       mtk_v4l2_err("Failed to v4l2_m2m_ctx_init()=
 (%d)\n",
> > +                                      ret);
> > +                       goto err_ctx_init;
> > +               }
> > +               mtk_vcodec_enc_ctx_params_setup(ctx);
> > +       } else {
> > +               mtk_v4l2_err("Invalid vfd !\n");
> > +               ret =3D -ENOENT;
> > +               goto err_ctx_init;
> > +       }
> > +
> > +       init_waitqueue_head(&ctx->queue);
> > +       dev->num_instances++;
> > +
> > +       if (dev->num_instances =3D=3D 1) {
> > +               ret =3D vpu_load_firmware(dev->vpu_plat_dev);
> > +               if (ret < 0) {
> > +                               mtk_v4l2_err("vpu_load_firmware fai=
led!\n");
> > +                       goto err_load_fw;
> > +               }
> > +
> > +               dev->enc_capability =3D
> > +                       vpu_get_venc_hw_capa(dev->vpu_plat_dev);
> > +               mtk_v4l2_debug(0, "encoder capability %x", dev->enc=
_capability);
> > +       }
> > +
> > +       mtk_v4l2_debug(2, "Create instance [%d]@%p m2m_ctx=3D%p typ=
e=3D%d\n",
> > +                        ctx->idx, ctx, ctx->m2m_ctx, ctx->type);
> > +       set_bit(ctx->idx, &dev->instance_mask[0]);
> > +       dev->ctx[ctx->idx] =3D ctx;
> > +
> > +       mutex_unlock(&dev->dev_mutex);
> > +       mtk_v4l2_debug(0, "%s encoder [%d]", dev_name(&dev->plat_de=
v->dev), ctx->idx);
> > +       return ret;
> > +
> > +       /* Deinit when failure occurred */
> > +err_load_fw:
> > +       v4l2_m2m_ctx_release(ctx->m2m_ctx);
> > +       v4l2_fh_del(&ctx->fh);
> > +       v4l2_fh_exit(&ctx->fh);
> > +       dev->num_instances--;
> > +err_ctx_init:
> > +err_ctrls_setup:
> > +       v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> > +err_no_ctx:
> > +       devm_kfree(&dev->plat_dev->dev, ctx);
> > +err_alloc:
> > +       mutex_unlock(&dev->dev_mutex);
> > +       return ret;
> > +}
> > +
> > +static int fops_vcodec_release(struct file *file)
> > +{
> > +       struct mtk_vcodec_dev *dev =3D video_drvdata(file);
> > +       struct mtk_vcodec_ctx *ctx =3D fh_to_ctx(file->private_data=
);
> > +
> > +       mtk_v4l2_debug(0, "[%d] encoder\n", ctx->idx);
> > +       mutex_lock(&dev->dev_mutex);
> > +
> > +       mtk_vcodec_enc_release(ctx);
> > +       v4l2_fh_del(&ctx->fh);
> > +       v4l2_fh_exit(&ctx->fh);
> > +       v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> > +       v4l2_m2m_ctx_release(ctx->m2m_ctx);
> > +
> > +       dev->ctx[ctx->idx] =3D NULL;
> > +       dev->num_instances--;
> > +       clear_bit(ctx->idx, &dev->instance_mask[0]);
> > +       devm_kfree(&dev->plat_dev->dev, ctx);
> > +       mutex_unlock(&dev->dev_mutex);
> > +       return 0;
> > +}
> > +
> > +static const struct v4l2_file_operations mtk_vcodec_fops =3D {
> > +       .owner                          =3D THIS_MODULE,
> > +       .open                           =3D fops_vcodec_open,
> > +       .release                        =3D fops_vcodec_release,
> > +       .poll                           =3D v4l2_m2m_fop_poll,
> > +       .unlocked_ioctl                 =3D video_ioctl2,
> > +       .mmap                           =3D v4l2_m2m_fop_mmap,
> > +};
> > +
> > +static int mtk_vcodec_probe(struct platform_device *pdev)
> > +{
> > +       struct mtk_vcodec_dev *dev;
> > +       struct video_device *vfd_enc;
> > +       struct resource *res;
> > +       int i, j, ret;
> > +
> > +       dev =3D devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> > +       if (!dev)
> > +               return -ENOMEM;
> > +
> > +       dev->plat_dev =3D pdev;
> > +
> > +       dev->vpu_plat_dev =3D vpu_get_plat_device(dev->plat_dev);
> > +       if (dev->vpu_plat_dev =3D=3D NULL) {
> > +               mtk_v4l2_err("[VPU] vpu device in not ready\n");
> > +               return -EPROBE_DEFER;
> > +       }
> > +
> > +       vpu_wdt_reg_handler(dev->vpu_plat_dev, mtk_vcodec_enc_reset=
_handler, dev,
> > +                           VPU_RST_ENC);
> > +
> > +       ret =3D mtk_vcodec_init_enc_pm(dev);
> > +       if (ret < 0) {
> > +               dev_err(&pdev->dev, "Failed to get mt vcodec clock =
source!\n");
> > +               return ret;
> > +       }
> > +
> > +       for (i =3D VENC_SYS, j =3D 0; i < NUM_MAX_VCODEC_REG_BASE; =
i++, j++) {
> > +               res =3D platform_get_resource(pdev, IORESOURCE_MEM,=
 j);
> > +               if (res =3D=3D NULL) {
> > +                       dev_err(&pdev->dev, "get memory resource fa=
iled.\n");
> > +                       ret =3D -ENXIO;
> > +                       goto err_res;
> > +               }
> > +               dev->reg_base[i] =3D devm_ioremap_resource(&pdev->d=
ev, res);
> > +               if (IS_ERR(dev->reg_base[i])) {
> > +                       dev_err(&pdev->dev,
> > +                               "devm_ioremap_resource %d failed.\n=
", i);
> > +                       ret =3D PTR_ERR(dev->reg_base);
> > +                       goto err_res;
> > +               }
> > +               mtk_v4l2_debug(2, "reg[%d] base=3D0x%p\n", i, dev->=
reg_base[i]);
> > +       }
> > +
> > +       res =3D platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> > +       if (res =3D=3D NULL) {
> > +               dev_err(&pdev->dev, "failed to get irq resource\n")=
;
> > +               ret =3D -ENOENT;
> > +               goto err_res;
> > +       }
> > +
> > +       dev->enc_irq =3D platform_get_irq(pdev, 0);
> > +       ret =3D devm_request_irq(&pdev->dev, dev->enc_irq,
> > +                              mtk_vcodec_enc_irq_handler,
> > +                              0, pdev->name, dev);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "Failed to install dev->enc_irq=
 %d (%d)\n",
> > +                       dev->enc_irq,
> > +                       ret);
> > +               ret =3D -EINVAL;
> > +               goto err_res;
> > +       }
> > +
> > +       dev->enc_lt_irq =3D platform_get_irq(pdev, 1);
> > +       ret =3D devm_request_irq(&pdev->dev,
> > +                              dev->enc_lt_irq, mtk_vcodec_enc_irq_=
handler2,
> > +                              0, pdev->name, dev);
> > +       if (ret) {
> > +               dev_err(&pdev->dev,
> > +                       "Failed to install dev->enc_lt_irq %d (%d)\=
n",
> > +                       dev->enc_lt_irq, ret);
> > +               ret =3D -EINVAL;
> > +               goto err_res;
> > +       }
> > +
> > +       disable_irq(dev->enc_irq);
> > +       disable_irq(dev->enc_lt_irq); /* VENC_LT */
> > +       mutex_init(&dev->enc_mutex);
> > +       mutex_init(&dev->dev_mutex);
> > +
> > +       snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name), "%=
s",
> > +                "[MTK_V4L2_VENC]");
> > +
> > +       ret =3D v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
> > +       if (ret) {
> > +               mtk_v4l2_err("v4l2_device_register err=3D%d\n", ret=
);
> > +               return ret;
> > +       }
> > +
> > +       init_waitqueue_head(&dev->queue);
> > +
> > +       /* allocate video device for encoder and register it */
> > +       vfd_enc =3D video_device_alloc();
> > +       if (!vfd_enc) {
> > +               mtk_v4l2_err("Failed to allocate video device\n");
> > +               ret =3D -ENOMEM;
> > +               goto err_enc_alloc;
> > +       }
> > +       vfd_enc->fops           =3D &mtk_vcodec_fops;
> > +       vfd_enc->ioctl_ops      =3D &mtk_venc_ioctl_ops;
> > +       vfd_enc->release        =3D video_device_release;
> > +       vfd_enc->lock           =3D &dev->dev_mutex;
> > +       vfd_enc->v4l2_dev       =3D &dev->v4l2_dev;
> > +       vfd_enc->vfl_dir        =3D VFL_DIR_M2M;
> > +
> > +       snprintf(vfd_enc->name, sizeof(vfd_enc->name), "%s",
> > +                MTK_VCODEC_ENC_NAME);
> > +       video_set_drvdata(vfd_enc, dev);
> > +       dev->vfd_enc =3D vfd_enc;
> > +       platform_set_drvdata(pdev, dev);
> > +       ret =3D video_register_device(vfd_enc, VFL_TYPE_GRABBER, 1)=
;
> > +       if (ret) {
> > +               mtk_v4l2_err("Failed to register video device\n");
> > +               goto err_enc_reg;
> > +       }
> > +       mtk_v4l2_debug(0, "encoder registered as /dev/video%d\n",
> > +                        vfd_enc->num);
> > +
> > +       dev->alloc_ctx =3D vb2_dma_contig_init_ctx(&pdev->dev);
> > +       if (IS_ERR(dev->alloc_ctx)) {
> > +               mtk_v4l2_err("Failed to alloc vb2 dma context 0\n")=
;
> > +               ret =3D PTR_ERR(dev->alloc_ctx);
> > +               goto err_vb2_ctx_init;
> > +       }
> > +
> > +       dev->m2m_dev_enc =3D v4l2_m2m_init(&mtk_venc_m2m_ops);
> > +       if (IS_ERR(dev->m2m_dev_enc)) {
> > +               mtk_v4l2_err("Failed to init mem2mem enc device\n")=
;
> > +               ret =3D PTR_ERR(dev->m2m_dev_enc);
> > +               goto err_enc_mem_init;
> > +       }
> > +
> > +       dev->encode_workqueue =3D
> > +                       alloc_ordered_workqueue(MTK_VCODEC_ENC_NAME=
, WQ_MEM_RECLAIM | WQ_FREEZABLE);
> > +       if (!dev->encode_workqueue) {
> > +               mtk_v4l2_err("Failed to create encode workqueue\n")=
;
> > +               ret =3D -EINVAL;
> > +               goto err_event_workq;
> > +       }
> > +
> > +       return 0;
> > +
> > +err_event_workq:
> > +       v4l2_m2m_release(dev->m2m_dev_enc);
> > +err_enc_mem_init:
> > +       vb2_dma_contig_cleanup_ctx(dev->alloc_ctx);
> > +err_vb2_ctx_init:
> > +       video_unregister_device(vfd_enc);
> > +err_enc_reg:
> > +       video_device_release(vfd_enc);
> > +err_enc_alloc:
> > +       v4l2_device_unregister(&dev->v4l2_dev);
> > +err_res:
> > +       mtk_vcodec_release_enc_pm(dev);
> > +       return ret;
> > +}
> > +
> > +static const struct of_device_id mtk_vcodec_match[] =3D {
> > +       {.compatible =3D "mediatek,mt8173-vcodec-enc",},
> > +       {},
> > +};
> > +MODULE_DEVICE_TABLE(of, mtk_vcodec_match);
> > +
> > +static int mtk_vcodec_remove(struct platform_device *pdev)
> > +{
> > +       struct mtk_vcodec_dev *dev =3D platform_get_drvdata(pdev);
> > +
> > +       mtk_v4l2_debug_enter();
> > +       flush_workqueue(dev->encode_workqueue);
> > +       destroy_workqueue(dev->encode_workqueue);
> > +       if (dev->m2m_dev_enc)
> > +               v4l2_m2m_release(dev->m2m_dev_enc);
> > +       if (dev->alloc_ctx)
> > +               vb2_dma_contig_cleanup_ctx(dev->alloc_ctx);
> > +
> > +       if (dev->vfd_enc) {
> > +               video_unregister_device(dev->vfd_enc);
> > +               video_device_release(dev->vfd_enc);
> > +       }
> > +       v4l2_device_unregister(&dev->v4l2_dev);
> > +       mtk_vcodec_release_enc_pm(dev);
> > +       return 0;
> > +}
> > +
> > +static struct platform_driver mtk_vcodec_driver =3D {
> > +       .probe  =3D mtk_vcodec_probe,
> > +       .remove =3D mtk_vcodec_remove,
> > +       .driver =3D {
> > +               .name   =3D MTK_VCODEC_ENC_NAME,
> > +               .owner  =3D THIS_MODULE,
> > +               .of_match_table =3D mtk_vcodec_match,
> > +       },
> > +};
> > +
> > +module_platform_driver(mtk_vcodec_driver);
> > +
> > +
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_DESCRIPTION("Mediatek video codec V4L2 driver");
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c =
b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> > new file mode 100644
> > index 0000000..518fba7
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> > @@ -0,0 +1,132 @@
> > +/*
> > +* Copyright (c) 2015 MediaTek Inc.
> > +* Author: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > +*
> > +* This program is free software; you can redistribute it and/or mo=
dify
> > +* it under the terms of the GNU General Public License version 2 a=
s
> > +* published by the Free Software Foundation.
> > +*
> > +* This program is distributed in the hope that it will be useful,
> > +* but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > +* GNU General Public License for more details.
> > +*/
> > +
> > +#include <linux/clk.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/pm_runtime.h>
> > +#include <soc/mediatek/smi.h>
> > +
> > +#include "mtk_vcodec_pm.h"
> > +#include "mtk_vcodec_util.h"
> > +#include "mtk_vpu.h"
> > +
> > +
> > +int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
> > +{
> > +       struct device_node *node;
> > +       struct platform_device *pdev;
> > +       struct device *dev;
> > +       struct mtk_vcodec_pm *pm;
> > +       int ret =3D 0;
> > +
> > +       pdev =3D mtkdev->plat_dev;
> > +       pm =3D &mtkdev->pm;
> > +       memset(pm, 0, sizeof(struct mtk_vcodec_pm));
> > +       pm->mtkdev =3D mtkdev;
> > +       dev =3D &pdev->dev;
> > +
> > +       node =3D of_parse_phandle(dev->of_node, "mediatek,larb", 0)=
;
> > +       if (!node)
> > +               return -1;
> > +       pdev =3D of_find_device_by_node(node);
> > +       if (WARN_ON(!pdev)) {
> > +               of_node_put(node);
> > +               return -1;
> > +       }
> > +       pm->larbvenc =3D &pdev->dev;
> > +
> > +       node =3D of_parse_phandle(dev->of_node, "mediatek,larb", 1)=
;
> > +       if (!node)
> > +               return -1;
> > +
> > +       pdev =3D of_find_device_by_node(node);
> > +       if (WARN_ON(!pdev)) {
> > +               of_node_put(node);
> > +               return -EINVAL;
> > +       }
> > +       pm->larbvenclt =3D &pdev->dev;
> > +
> > +       pdev =3D mtkdev->plat_dev;
> > +       pm->dev =3D &pdev->dev;
> > +
> > +       pm->vencpll_d2 =3D devm_clk_get(&pdev->dev, "vencpll_d2");
> > +       if (pm->vencpll_d2 =3D=3D NULL) {
> > +               mtk_v4l2_err("devm_clk_get vencpll_d2 fail");
> > +               ret =3D -1;
> > +       }
> > +
> > +       pm->venc_sel =3D devm_clk_get(&pdev->dev, "venc_sel");
> > +       if (pm->venc_sel =3D=3D NULL) {
> > +               mtk_v4l2_err("devm_clk_get venc_sel fail");
> > +               ret =3D -1;
> > +       }
> > +
> > +       pm->univpll1_d2 =3D devm_clk_get(&pdev->dev, "univpll1_d2")=
;
> > +       if (pm->univpll1_d2 =3D=3D NULL) {
> > +               mtk_v4l2_err("devm_clk_get univpll1_d2 fail");
> > +               ret =3D -1;
> > +       }
> > +
> > +       pm->venc_lt_sel =3D devm_clk_get(&pdev->dev, "venc_lt_sel")=
;
> > +       if (pm->venc_lt_sel =3D=3D NULL) {
> > +               mtk_v4l2_err("devm_clk_get venc_lt_sel fail");
> > +               ret =3D -1;
> > +       }
> > +
> > +       return ret;
> > +}
> > +
> > +void mtk_vcodec_release_enc_pm(struct mtk_vcodec_dev *mtkdev)
> > +{
> > +}
> > +
> > +
> > +void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
> > +{
> > +       int ret;
> > +
> > +       ret =3D clk_prepare_enable(pm->venc_sel);
> > +       if (ret)
> > +               mtk_v4l2_err("venc_sel fail %d", ret);
> > +
> > +       ret =3D clk_set_parent(pm->venc_sel, pm->vencpll_d2);
> > +       if (ret)
> > +               mtk_v4l2_err("clk_set_parent fail %d", ret);
> > +
> > +       ret =3D clk_prepare_enable(pm->venc_lt_sel);
> > +       if (ret)
> > +               mtk_v4l2_err("venc_lt_sel fail %d", ret);
> > +
> > +       ret =3D clk_set_parent(pm->venc_lt_sel, pm->univpll1_d2);
> > +       if (ret)
> > +               mtk_v4l2_err("clk_set_parent fail %d", ret);
> > +
> > +       ret =3D mtk_smi_larb_get(pm->larbvenc);
> > +       if (ret)
> > +               mtk_v4l2_err("mtk_smi_larb_get larb3 fail %d\n", re=
t);
> > +
> > +       ret =3D mtk_smi_larb_get(pm->larbvenclt);
> > +       if (ret)
> > +               mtk_v4l2_err("mtk_smi_larb_get larb4 fail %d\n", re=
t);
> > +
> > +}
> > +
> > +void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm)
> > +{
> > +       mtk_smi_larb_put(pm->larbvenc);
> > +       mtk_smi_larb_put(pm->larbvenclt);
> > +       clk_disable_unprepare(pm->venc_lt_sel);
> > +       clk_disable_unprepare(pm->venc_sel);
> > +}
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c b/=
drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
> > new file mode 100644
> > index 0000000..919b949
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
> > @@ -0,0 +1,102 @@
> > +/*
> > +* Copyright (c) 2015 MediaTek Inc.
> > +* Author: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > +*
> > +* This program is free software; you can redistribute it and/or mo=
dify
> > +* it under the terms of the GNU General Public License version 2 a=
s
> > +* published by the Free Software Foundation.
> > +*
> > +* This program is distributed in the hope that it will be useful,
> > +* but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > +* GNU General Public License for more details.
> > +*/
> > +
> > +#include <linux/errno.h>
> > +#include <linux/wait.h>
> > +
> > +#include "mtk_vcodec_drv.h"
> > +#include "mtk_vcodec_intr.h"
> > +#include "mtk_vcodec_util.h"
> > +
> > +void mtk_vcodec_clean_dev_int_flags(void *data)
> > +{
> > +       struct mtk_vcodec_dev *dev =3D (struct mtk_vcodec_dev *)dat=
a;
> > +
> > +       dev->int_cond =3D 0;
> > +       dev->int_type =3D 0;
> > +}
> > +
> > +int mtk_vcodec_wait_for_done_ctx(void *data, int command,
> > +                                unsigned int timeout_ms, int inter=
rupt)
> > +{
> > +       wait_queue_head_t *waitqueue;
> > +       long timeout_jiff, ret;
> > +       int status =3D 0;
> > +       struct mtk_vcodec_ctx *ctx =3D (struct mtk_vcodec_ctx *)dat=
a;
> > +
> > +       waitqueue =3D (wait_queue_head_t *)&ctx->queue;
> > +       timeout_jiff =3D msecs_to_jiffies(timeout_ms);
> > +       if (interrupt) {
> > +               ret =3D wait_event_interruptible_timeout(*waitqueue=
,
> > +                               (ctx->int_cond &&
> > +                               (ctx->int_type =3D=3D command)),
> > +                               timeout_jiff);
> > +       } else {
> > +               ret =3D wait_event_timeout(*waitqueue,
> > +                               (ctx->int_cond &&
> > +                               (ctx->int_type =3D=3D command)),
> > +                                timeout_jiff);
> > +       }
> > +       if (0 =3D=3D ret) {
> > +               status =3D -1;    /* timeout */
> > +               mtk_v4l2_err("[%d] cmd=3D%d, ctx->type=3D%d, wait_e=
vent_interruptible_timeout time=3D%ums out %d %d!",
> > +                               ctx->idx, ctx->type, command, timeo=
ut_ms,
> > +                               ctx->int_cond, ctx->int_type);
> > +       } else if (-ERESTARTSYS =3D=3D ret) {
> > +               mtk_v4l2_err("[%d] cmd=3D%d, ctx->type=3D%d, wait_e=
vent_interruptible_timeout interrupted by a signal %d %d",
> > +                               ctx->idx, ctx->type, command, ctx->=
int_cond,
> > +                               ctx->int_type);
> > +               status =3D -1;
> > +       }
> > +
> > +       ctx->int_cond =3D 0;
> > +       ctx->int_type =3D 0;
> > +
> > +       return status;
> > +}
> > +
> > +int mtk_vcodec_wait_for_done_dev(void *data, int command,
> > +                                unsigned int timeout, int interrup=
t)
> > +{
> > +       wait_queue_head_t *waitqueue;
> > +       long timeout_jiff, ret;
> > +       int status =3D 0;
> > +       struct mtk_vcodec_dev *dev =3D (struct mtk_vcodec_dev *)dat=
a;
> > +
> > +       waitqueue =3D (wait_queue_head_t *)&dev->queue;
> > +       timeout_jiff =3D msecs_to_jiffies(timeout);
> > +       if (interrupt) {
> > +               ret =3D wait_event_interruptible_timeout(*waitqueue=
,
> > +                               (dev->int_cond &&
> > +                               (dev->int_type =3D=3D command)),
> > +                               timeout_jiff);
> > +       } else {
> > +               ret =3D wait_event_timeout(*waitqueue,
> > +                               (dev->int_cond &&
> > +                               (dev->int_type =3D=3D command)),
> > +                               timeout_jiff);
> > +       }
> > +       if (0 =3D=3D ret) {
> > +               status =3D -1;    /* timeout */
> > +               mtk_v4l2_err("wait_event_interruptible_timeout time=
=3D%lu out %d %d!",
> > +                               timeout_jiff, dev->int_cond, dev->i=
nt_type);
> > +       } else if (-ERESTARTSYS =3D=3D ret) {
> > +               mtk_v4l2_err("wait_event_interruptible_timeout inte=
rrupted by a signal %d %d",
> > +                               dev->int_cond, dev->int_type);
> > +               status =3D -1;
> > +       }
> > +       dev->int_cond =3D 0;
> > +       dev->int_type =3D 0;
> > +       return status;
> > +}
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h b/=
drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
> > new file mode 100644
> > index 0000000..e9b7f94
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
> > @@ -0,0 +1,29 @@
> > +/*
> > +* Copyright (c) 2015 MediaTek Inc.
> > +* Author: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > +*
> > +* This program is free software; you can redistribute it and/or mo=
dify
> > +* it under the terms of the GNU General Public License version 2 a=
s
> > +* published by the Free Software Foundation.
> > +*
> > +* This program is distributed in the hope that it will be useful,
> > +* but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > +* GNU General Public License for more details.
> > +*/
> > +
> > +#ifndef _MTK_VCODEC_INTR_H_
> > +#define _MTK_VCODEC_INTR_H_
> > +
> > +#define MTK_INST_IRQ_RECEIVED          0x1
> > +#define MTK_INST_WORK_THREAD_ABORT_DONE        0x2
> > +
> > +/* timeout is ms */
> > +int mtk_vcodec_wait_for_done_ctx(void *data, int command, unsigned=
 int timeout,
> > +                                int interrupt);
> > +int mtk_vcodec_wait_for_done_dev(void *data, int command, unsigned=
 int timeout,
> > +                                int interrupt);
> > +
> > +void mtk_vcodec_clean_dev_int_flags(void *data);
> > +
> > +#endif /* _MTK_VCODEC_INTR_H_ */
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_pm.h b/dr=
ivers/media/platform/mtk-vcodec/mtk_vcodec_pm.h
> > new file mode 100644
> > index 0000000..fdadec9
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_pm.h
> > @@ -0,0 +1,26 @@
> > +/*
> > +* Copyright (c) 2015 MediaTek Inc.
> > +* Author: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > +*
> > +* This program is free software; you can redistribute it and/or mo=
dify
> > +* it under the terms of the GNU General Public License version 2 a=
s
> > +* published by the Free Software Foundation.
> > +*
> > +* This program is distributed in the hope that it will be useful,
> > +* but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > +* GNU General Public License for more details.
> > +*/
> > +
> > +#ifndef _MTK_VCODEC_PM_H_
> > +#define _MTK_VCODEC_PM_H_
> > +
> > +#include "mtk_vcodec_drv.h"
> > +
> > +int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *dev);
> > +void mtk_vcodec_release_enc_pm(struct mtk_vcodec_dev *dev);
> > +
> > +void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm);
> > +void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm);
> > +
> > +#endif /* _MTK_VCODEC_PM_H_ */
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c b/=
drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
> > new file mode 100644
> > index 0000000..3fede8d
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
> > @@ -0,0 +1,106 @@
> > +/*
> > +* Copyright (c) 2015 MediaTek Inc.
> > +* Author: PC Chen <pc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > +*         Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > +*
> > +* This program is free software; you can redistribute it and/or mo=
dify
> > +* it under the terms of the GNU General Public License version 2 a=
s
> > +* published by the Free Software Foundation.
> > +*
> > +* This program is distributed in the hope that it will be useful,
> > +* but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > +* GNU General Public License for more details.
> > +*/
> > +
> > +#include <linux/module.h>
> > +
> > +#include "mtk_vcodec_drv.h"
> > +#include "mtk_vcodec_util.h"
> > +#include "mtk_vpu.h"
> > +
> > +bool mtk_vcodec_dbg =3D false;
> > +int mtk_v4l2_dbg_level =3D 0;
> > +
> > +module_param(mtk_v4l2_dbg_level, int, S_IRUGO | S_IWUSR);
> > +module_param(mtk_vcodec_dbg, bool, S_IRUGO | S_IWUSR);
> > +
> > +void __iomem *mtk_vcodec_get_reg_addr(void *data, unsigned int reg=
_idx)
> > +{
> > +       struct mtk_vcodec_ctx *ctx =3D (struct mtk_vcodec_ctx *)dat=
a;
> > +
> > +       if (!data || reg_idx >=3D NUM_MAX_VCODEC_REG_BASE) {
> > +               mtk_v4l2_err("Invalid arguments");
> > +               return NULL;
> > +       }
> > +       return ctx->dev->reg_base[reg_idx];
> > +}
> > +
> > +int mtk_vcodec_mem_alloc(void *data, struct mtk_vcodec_mem *mem)
> > +{
> > +       unsigned long size =3D mem->size;
> > +       struct mtk_vcodec_ctx *ctx =3D (struct mtk_vcodec_ctx *)dat=
a;
> > +       struct device *dev =3D &ctx->dev->plat_dev->dev;
> > +
> > +       mem->va =3D dma_alloc_coherent(dev, size, &mem->dma_addr, G=
=46P_KERNEL);
> > +
> > +       if (!mem->va) {
> > +               mtk_v4l2_err("%s dma_alloc size=3D%ld failed!", dev=
_name(dev),
> > +                              size);
> > +               return -ENOMEM;
> > +       }
> > +
> > +       memset(mem->va, 0, size);
> > +
> > +       mtk_v4l2_debug(3, "[%d]  - va      =3D %p", ctx->idx, mem->=
va);
> > +       mtk_v4l2_debug(3, "[%d]  - dma     =3D 0x%lx", ctx->idx,
> > +                        (unsigned long)mem->dma_addr);
> > +       mtk_v4l2_debug(3, "[%d]    size =3D 0x%lx", ctx->idx, size)=
;
> > +
> > +       return 0;
> > +}
> > +
> > +void mtk_vcodec_mem_free(void *data, struct mtk_vcodec_mem *mem)
> > +{
> > +       unsigned long size =3D mem->size;
> > +       struct mtk_vcodec_ctx *ctx =3D (struct mtk_vcodec_ctx *)dat=
a;
> > +       struct device *dev =3D &ctx->dev->plat_dev->dev;
> > +
> > +       dma_free_coherent(dev, size, mem->va, mem->dma_addr);
> > +       mem->va =3D NULL;
> > +
> > +       mtk_v4l2_debug(3, "[%d]  - va      =3D %p", ctx->idx, mem->=
va);
> > +       mtk_v4l2_debug(3, "[%d]  - dma     =3D 0x%lx", ctx->idx,
> > +                        (unsigned long)mem->dma_addr);
> > +       mtk_v4l2_debug(3, "[%d]    size =3D 0x%lx", ctx->idx, size)=
;
> > +}
> > +
> > +int mtk_vcodec_get_ctx_id(void *data)
> > +{
> > +       struct mtk_vcodec_ctx *ctx =3D (struct mtk_vcodec_ctx *)dat=
a;
> > +
> > +       if (!ctx)
> > +               return -1;
> > +
> > +       return ctx->idx;
> > +}
> > +
> > +struct platform_device *mtk_vcodec_get_plat_dev(void *data)
> > +{
> > +       struct mtk_vcodec_ctx *ctx =3D (struct mtk_vcodec_ctx *)dat=
a;
> > +
> > +       if (!ctx)
> > +               return NULL;
> > +
> > +       return vpu_get_plat_device(ctx->dev->plat_dev);
> > +}
> > +
> > +void mtk_vcodec_fmt2str(u32 fmt, char *str)
> > +{
> > +       char a =3D fmt & 0xFF;
> > +       char b =3D (fmt >> 8) & 0xFF;
> > +       char c =3D (fmt >> 16) & 0xFF;
> > +       char d =3D (fmt >> 24) & 0xFF;
> > +
> > +       sprintf(str, "%c%c%c%c", a, b, c, d);
> > +}
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h b/=
drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
> > new file mode 100644
> > index 0000000..47016ae
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
> > @@ -0,0 +1,85 @@
> > +/*
> > +* Copyright (c) 2015 MediaTek Inc.
> > +* Author: PC Chen <pc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > +*         Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > +*
> > +* This program is free software; you can redistribute it and/or mo=
dify
> > +* it under the terms of the GNU General Public License version 2 a=
s
> > +* published by the Free Software Foundation.
> > +*
> > +* This program is distributed in the hope that it will be useful,
> > +* but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > +* GNU General Public License for more details.
> > +*/
> > +
> > +#ifndef _MTK_VCODEC_UTIL_H_
> > +#define _MTK_VCODEC_UTIL_H_
> > +
> > +#include <linux/types.h>
> > +#include <linux/dma-direction.h>
> > +
> > +struct mtk_vcodec_mem {
> > +       size_t size;
> > +       void *va;
> > +       dma_addr_t dma_addr;
> > +};
> > +
> > +extern int mtk_v4l2_dbg_level;
> > +extern bool mtk_vcodec_dbg;
> > +
> > +#define DEBUG  1
> > +
> > +#if defined(DEBUG)
> > +
> > +#define mtk_v4l2_debug(level, fmt, args...)                       =
      \
> > +       do {                                                       =
      \
> > +               if (mtk_v4l2_dbg_level >=3D level)                 =
        \
> > +                       pr_info("[MTK_V4L2] level=3D%d %s(),%d: " f=
mt "\n",\
> > +                               level, __func__, __LINE__, ##args);=
      \
> > +       } while (0)
> > +
> > +#define mtk_v4l2_err(fmt, args...)                \
> > +       pr_err("[MTK_V4L2][ERROR] %s:%d: " fmt "\n", __func__, __LI=
NE__, \
> > +              ##args)
> > +
> > +
> > +#define mtk_v4l2_debug_enter()  mtk_v4l2_debug(3, "+\n")
> > +#define mtk_v4l2_debug_leave()  mtk_v4l2_debug(3, "-\n")
> > +
> > +#define mtk_vcodec_debug(h, fmt, args...)                         =
     \
> > +       do {                                                       =
     \
> > +               if (mtk_vcodec_dbg)                                =
     \
> > +                       pr_info("[MTK_VCODEC][%d]: %s() " fmt "\n",=
     \
> > +                               ((struct mtk_vcodec_ctx *)h->ctx)->=
idx, \
> > +                               __func__, ##args);                 =
     \
> > +       } while (0)
> > +
> > +#define mtk_vcodec_err(h, fmt, args...)                           =
             \
> > +       pr_err("[MTK_VCODEC][ERROR][%d]: %s() " fmt "\n",          =
     \
> > +              ((struct mtk_vcodec_ctx *)h->ctx)->idx, __func__, ##=
args)
> > +
> > +#define mtk_vcodec_debug_enter(h)  mtk_vcodec_debug(h, "+\n")
> > +#define mtk_vcodec_debug_leave(h)  mtk_vcodec_debug(h, "-\n")
> > +
> > +#else
> > +
> > +#define mtk_v4l2_debug(level, fmt, args...)
> > +#define mtk_v4l2_err(fmt, args...)
> > +#define mtk_v4l2_debug_enter()
> > +#define mtk_v4l2_debug_leave()
> > +
> > +#define mtk_vcodec_debug(h, fmt, args...)
> > +#define mtk_vcodec_err(h, fmt, args...)
> > +#define mtk_vcodec_debug_enter(h)
> > +#define mtk_vcodec_debug_leave(h)
> > +
> > +#endif
> > +
> > +void __iomem *mtk_vcodec_get_reg_addr(void *data, unsigned int reg=
_idx);
> > +int mtk_vcodec_mem_alloc(void *data, struct mtk_vcodec_mem *mem);
> > +void mtk_vcodec_mem_free(void *data, struct mtk_vcodec_mem *mem);
> > +int mtk_vcodec_get_ctx_id(void *data);
> > +struct platform_device *mtk_vcodec_get_plat_dev(void *data);
> > +void mtk_vcodec_fmt2str(u32 fmt, char *str);
> > +#endif /* _MTK_VCODEC_UTIL_H_ */
> > diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_base.h b/dr=
ivers/media/platform/mtk-vcodec/venc_drv_base.h
> > new file mode 100644
> > index 0000000..ed9cbf0
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/venc_drv_base.h
> > @@ -0,0 +1,62 @@
> > +/*
> > + * Copyright (c) 2015 MediaTek Inc.
> > + * Author: Daniel Hsiao <daniel.hsiao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > + *         Jungchang Tsao <jungchang.tsao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#ifndef _VENC_DRV_BASE_
> > +#define _VENC_DRV_BASE_
> > +
> > +#include "mtk_vcodec_drv.h"
> > +
> > +#include "venc_drv_if.h"
> > +
> > +struct venc_common_if {
> > +       /**
> > +        * (*init)() - initialize driver
> > +        * @ctx:        [in] mtk v4l2 context
> > +        * @handle: [out] driver handle
> > +        */
> > +       int (*init)(struct mtk_vcodec_ctx *ctx, unsigned long *hand=
le);
> > +
> > +       /**
> > +        * (*encode)() - trigger encode
> > +        * @handle: [in] driver handle
> > +        * @opt: [in] encode option
> > +        * @frm_buf: [in] frame buffer to store input frame
> > +        * @bs_buf: [in] bitstream buffer to store output bitstream
> > +        * @result: [out] encode result
> > +        */
> > +       int (*encode)(unsigned long handle, enum venc_start_opt opt=
,
> > +                     struct venc_frm_buf *frm_buf,
> > +                     struct mtk_vcodec_mem *bs_buf,
> > +                     struct venc_done_result *result);
> > +
> > +       /**
> > +        * (*set_param)() - set driver's parameter
> > +        * @handle: [in] driver handle
> > +        * @type: [in] parameter type
> > +        * @in: [in] buffer to store the parameter
> > +        */
> > +       int (*set_param)(unsigned long handle, enum venc_set_param_=
type type,
> > +                        void *in);
> > +
> > +       /**
> > +        * (*deinit)() - deinitialize driver.
> > +        * @handle: [in] driver handle
> > +        */
> > +       int (*deinit)(unsigned long handle);
> > +};
> > +
> > +
> > +#endif
> > diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.c b/driv=
ers/media/platform/mtk-vcodec/venc_drv_if.c
> > new file mode 100644
> > index 0000000..daa8e93
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
> > @@ -0,0 +1,100 @@
> > +/*
> > + * Copyright (c) 2015 MediaTek Inc.
> > + * Author: Daniel Hsiao <daniel.hsiao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > + *         Jungchang Tsao <jungchang.tsao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/interrupt.h>
> > +#include <linux/kernel.h>
> > +#include <linux/slab.h>
> > +
> > +#include "venc_drv_if.h"
> > +#include "mtk_vcodec_enc.h"
> > +#include "mtk_vcodec_pm.h"
> > +#include "mtk_vpu.h"
> > +
> > +#include "venc_drv_base.h"
> > +
> > +int venc_if_create(struct mtk_vcodec_ctx *ctx, unsigned int fourcc=
)
> > +{
> > +       char str[10];
> > +       int ret =3D 0;
> > +
> > +       mtk_vcodec_fmt2str(fourcc, str);
> > +
> > +       switch (fourcc) {
> > +       case V4L2_PIX_FMT_VP8:
> > +       case V4L2_PIX_FMT_H264:
> > +       default:
> > +               return -EINVAL;
> > +       }
> > +
> > +       mtk_venc_lock(ctx);
> > +       mtk_vcodec_enc_clock_on(&ctx->dev->pm);
> > +       ret =3D ctx->enc_if->init(ctx, (unsigned long *)&ctx->drv_h=
andle);
> > +       mtk_vcodec_enc_clock_off(&ctx->dev->pm);
> > +       mtk_venc_unlock(ctx);
> > +
> > +       return ret;
> > +
> > +}
> > +
> > +
> > +int venc_if_set_param(struct mtk_vcodec_ctx *ctx,
> > +                     enum venc_set_param_type type, void *in)
> > +{
> > +       int ret =3D 0;
> > +
> > +       mtk_venc_lock(ctx);
> > +       mtk_vcodec_enc_clock_on(&ctx->dev->pm);
> > +       ret =3D ctx->enc_if->set_param(ctx->drv_handle, type, in);
> > +       mtk_vcodec_enc_clock_off(&ctx->dev->pm);
> > +       mtk_venc_unlock(ctx);
> > +
> > +       return ret;
> > +}
> > +
> > +int venc_if_encode(struct mtk_vcodec_ctx *ctx,
> > +                  enum venc_start_opt opt, struct venc_frm_buf *fr=
m_buf,
> > +                  struct mtk_vcodec_mem *bs_buf,
> > +                  struct venc_done_result *result)
> > +{
> > +       int ret =3D 0;
> > +
> > +       mtk_venc_lock(ctx);
> > +       mtk_vcodec_enc_clock_on(&ctx->dev->pm);
> > +       ret =3D ctx->enc_if->encode(ctx->drv_handle, opt, frm_buf, =
bs_buf, result);
> > +       mtk_vcodec_enc_clock_off(&ctx->dev->pm);
> > +       mtk_venc_unlock(ctx);
> > +
> > +       return ret;
> > +}
> > +
> > +int venc_if_release(struct mtk_vcodec_ctx *ctx)
> > +{
> > +       int ret =3D 0;
> > +
> > +       if(ctx->drv_handle =3D=3D 0)
> > +               return 0;
> > +
> > +       mtk_venc_lock(ctx);
> > +       mtk_vcodec_enc_clock_on(&ctx->dev->pm);
> > +       ret =3D ctx->enc_if->deinit(ctx->drv_handle);
> > +       mtk_vcodec_enc_clock_off(&ctx->dev->pm);
> > +       mtk_venc_unlock(ctx);
> > +
> > +       ctx->drv_handle =3D 0;
> > +
> > +       return ret;
> > +}
> > +
> > diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.h b/driv=
ers/media/platform/mtk-vcodec/venc_drv_if.h
> > new file mode 100644
> > index 0000000..a387011
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.h
> > @@ -0,0 +1,175 @@
> > +/*
> > + * Copyright (c) 2015 MediaTek Inc.
> > + * Author: Daniel Hsiao <daniel.hsiao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > + *         Jungchang Tsao <jungchang.tsao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#ifndef _VENC_DRV_IF_H_
> > +#define _VENC_DRV_IF_H_
> > +
> > +#include "mtk_vcodec_drv.h"
> > +#include "mtk_vcodec_util.h"
> > +
> > +/*
> > + * enum venc_yuv_fmt - The type of input yuv format
> > + * (VPU related: If you change the order, you must also update the=
 VPU codes.)
> > + * @VENC_YUV_FORMAT_420: 420 YUV format
> > + * @VENC_YUV_FORMAT_YV12: YV12 YUV format
> > + * @VENC_YUV_FORMAT_NV12: NV12 YUV format
> > + * @VENC_YUV_FORMAT_NV21: NV21 YUV format
> > + */
> > +enum venc_yuv_fmt {
> > +       VENC_YUV_FORMAT_420 =3D 3,
> > +       VENC_YUV_FORMAT_YV12 =3D 5,
> > +       VENC_YUV_FORMAT_NV12 =3D 6,
> > +       VENC_YUV_FORMAT_NV21 =3D 7,
> > +};
> > +
> > +/*
> > + * enum venc_start_opt - encode frame option used in venc_if_encod=
e()
> > + * @VENC_START_OPT_ENCODE_SEQUENCE_HEADER: encode SPS/PPS for H264
> > + * @VENC_START_OPT_ENCODE_FRAME: encode normal frame
> > + */
> > +enum venc_start_opt {
> > +       VENC_START_OPT_ENCODE_SEQUENCE_HEADER,
> > +       VENC_START_OPT_ENCODE_FRAME,
> > +};
> > +
> > +/*
> > + * enum venc_drv_msg - The type of encode frame status used in ven=
c_if_encode()
> > + * @VENC_MESSAGE_OK: encode ok
> > + * @VENC_MESSAGE_ERR: encode error
> > + */
> > +enum venc_drv_msg {
> > +       VENC_MESSAGE_OK,
> > +       VENC_MESSAGE_ERR,
> > +};
> > +
> > +/*
> > + * enum venc_set_param_type - The type of set parameter used in ve=
nc_if_set_param()
> > + * (VPU related: If you change the order, you must also update the=
 VPU codes.)
> > + * @VENC_SET_PARAM_ENC: set encoder parameters
> > + * @VENC_SET_PARAM_FORCE_INTRA: set force intra frame
> > + * @VENC_SET_PARAM_ADJUST_BITRATE: set to adjust bitrate (in bps)
> > + * @VENC_SET_PARAM_ADJUST_FRAMERATE: set frame rate
> > + * @VENC_SET_PARAM_I_FRAME_INTERVAL: set I frame interval
> > + * @VENC_SET_PARAM_SKIP_FRAME: set H264 skip one frame
> > + * @VENC_SET_PARAM_PREPEND_HEADER: set H264 prepend SPS/PPS before=
 IDR
> > + * @VENC_SET_PARAM_TS_MODE: set VP8 temporal scalability mode
> > + */
> > +enum venc_set_param_type {
> > +       VENC_SET_PARAM_ENC,
> > +       VENC_SET_PARAM_FORCE_INTRA,
> > +       VENC_SET_PARAM_ADJUST_BITRATE,
> > +       VENC_SET_PARAM_ADJUST_FRAMERATE,
> > +       VENC_SET_PARAM_I_FRAME_INTERVAL,
> > +       VENC_SET_PARAM_SKIP_FRAME,
> > +       VENC_SET_PARAM_PREPEND_HEADER,
> > +       VENC_SET_PARAM_TS_MODE,
> > +};
> > +
> > +/*
> > + * struct venc_enc_prm - encoder settings for VENC_SET_PARAM_ENC u=
sed in venc_if_set_param()
> > + * @input_fourcc: input fourcc
> > + * @h264_profile: V4L2 defined H.264 profile
> > + * @h264_level: V4L2 defined H.264 level
> > + * @width: image width
> > + * @height: image height
> > + * @buf_width: buffer width
> > + * @buf_height: buffer height
> > + * @frm_rate: frame rate
> > + * @intra_period: intra frame period
> > + * @bitrate: target bitrate in kbps
> > + */
> > +struct venc_enc_prm {
> > +       enum venc_yuv_fmt input_fourcc;
> > +       unsigned int h264_profile;
> > +       unsigned int h264_level;
> > +       unsigned int width;
> > +       unsigned int height;
> > +       unsigned int buf_width;
> > +       unsigned int buf_height;
> > +       unsigned int frm_rate;
> > +       unsigned int intra_period;
> > +       unsigned int bitrate;
> > +       unsigned int sizeimage[MTK_VCODEC_MAX_PLANES];
> > +};
> > +
> > +/*
> > + * struct venc_frm_buf - frame buffer information used in venc_if_=
encode()
> > + * @fb_addr: plane 0 frame buffer address
> > + * @fb_addr1: plane 1 frame buffer address
> > + * @fb_addr2: plane 2 frame buffer address
> > + */
> > +struct venc_frm_buf {
> > +       struct mtk_vcodec_mem fb_addr;
> > +       struct mtk_vcodec_mem fb_addr1;
> > +       struct mtk_vcodec_mem fb_addr2;
> > +};
> > +
> > +/*
> > + * struct venc_done_result - This is return information used in ve=
nc_if_encode()
> > + * @msg: message, such as success or error code
> > + * @bs_size: output bitstream size
> > + * @is_key_frm: output is key frame or not
> > + */
> > +struct venc_done_result {
> > +       enum venc_drv_msg msg;
> > +       unsigned int bs_size;
> > +       bool is_key_frm;
> > +};
> > +
> > +/*
> > + * venc_if_create - Create the driver handle
> > + * @ctx: device context
> > + * @fourcc: encoder output format
> > + * @handle: driver handle
> > + * Return: 0 if creating handle successfully, otherwise it is fail=
ed.
> > + */
> > +int venc_if_create(struct mtk_vcodec_ctx *ctx, unsigned int fourcc=
);
> > +
> > +/*
> > + * venc_if_release - Release the driver handle
> > + * @handle: driver handle
> > + * Return: 0 if releasing handle successfully, otherwise it is fai=
led.
> > + */
> > +int venc_if_release(struct mtk_vcodec_ctx *ctx);
> > +
> > +/*
> > + * venc_if_set_param - Set parameter to driver
> > + * @handle: driver handle
> > + * @type: set type
> > + * @in: input parameter
> > + * @out: output parameter
> > + * Return: 0 if setting param successfully, otherwise it is failed=
=2E
> > + */
> > +int venc_if_set_param(struct mtk_vcodec_ctx *ctx,
> > +                     enum venc_set_param_type type,
> > +                     void *in);
> > +
> > +/*
> > + * venc_if_encode - Encode frame
> > + * @handle: driver handle
> > + * @opt: encode frame option
> > + * @frm_buf: input frame buffer information
> > + * @bs_buf: output bitstream buffer infomraiton
> > + * @result: encode result
> > + * Return: 0 if encoding frame successfully, otherwise it is faile=
d.
> > + */
> > +int venc_if_encode(struct mtk_vcodec_ctx *ctx,
> > +                  enum venc_start_opt opt,
> > +                  struct venc_frm_buf *frm_buf,
> > +                  struct mtk_vcodec_mem *bs_buf,
> > +                  struct venc_done_result *result);
> > +
> > +#endif /* _VENC_DRV_IF_H_ */
> > diff --git a/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h b/dri=
vers/media/platform/mtk-vcodec/venc_ipi_msg.h
> > new file mode 100644
> > index 0000000..a345b98
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
> > @@ -0,0 +1,212 @@
> > +/*
> > + * Copyright (c) 2015 MediaTek Inc.
> > + * Author: Jungchang Tsao <jungchang.tsao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > + *         Daniel Hsiao <daniel.hsiao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#ifndef _VENC_IPI_MSG_H_
> > +#define _VENC_IPI_MSG_H_
> > +
> > +#define IPIMSG_H264_ENC_ID 0x100
> > +#define IPIMSG_VP8_ENC_ID 0x200
> > +
> > +#define AP_IPIMSG_VENC_BASE 0x20000
> > +#define VPU_IPIMSG_VENC_BASE 0x30000
> > +
> > +/**
> > + * enum venc_ipi_msg_id - message id between AP and VPU
> > + * (ipi stands for inter-processor interrupt)
> > + * @AP_IPIMSG_XXX:             AP to VPU cmd message id
> > + * @VPU_IPIMSG_XXX_DONE:       VPU ack AP cmd message id
> > + */
> > +enum venc_ipi_msg_id {
> > +       AP_IPIMSG_H264_ENC_INIT =3D AP_IPIMSG_VENC_BASE +
> > +                                 IPIMSG_H264_ENC_ID,
> > +       AP_IPIMSG_H264_ENC_SET_PARAM,
> > +       AP_IPIMSG_H264_ENC_ENCODE,
> > +       AP_IPIMSG_H264_ENC_DEINIT,
> > +
> > +       AP_IPIMSG_VP8_ENC_INIT =3D AP_IPIMSG_VENC_BASE +
> > +                                IPIMSG_VP8_ENC_ID,
> > +       AP_IPIMSG_VP8_ENC_SET_PARAM,
> > +       AP_IPIMSG_VP8_ENC_ENCODE,
> > +       AP_IPIMSG_VP8_ENC_DEINIT,
> > +
> > +       VPU_IPIMSG_H264_ENC_INIT_DONE =3D VPU_IPIMSG_VENC_BASE +
> > +                                       IPIMSG_H264_ENC_ID,
> > +       VPU_IPIMSG_H264_ENC_SET_PARAM_DONE,
> > +       VPU_IPIMSG_H264_ENC_ENCODE_DONE,
> > +       VPU_IPIMSG_H264_ENC_DEINIT_DONE,
> > +
> > +       VPU_IPIMSG_VP8_ENC_INIT_DONE =3D VPU_IPIMSG_VENC_BASE +
> > +                                      IPIMSG_VP8_ENC_ID,
> > +       VPU_IPIMSG_VP8_ENC_SET_PARAM_DONE,
> > +       VPU_IPIMSG_VP8_ENC_ENCODE_DONE,
> > +       VPU_IPIMSG_VP8_ENC_DEINIT_DONE,
> > +};
> > +
> > +/**
> > + * struct venc_ap_ipi_msg_init - AP to VPU init cmd structure
> > + * @msg_id:    message id (AP_IPIMSG_XXX_ENC_INIT)
> > + * @venc_inst: AP encoder instance (struct venc_vp8_handle/venc_h2=
64_handle *)
> > + */
> > +struct venc_ap_ipi_msg_init {
> > +       uint32_t msg_id;
> > +       uint32_t reserved;
> > +       uint64_t venc_inst;
> > +};
> > +
> > +/**
> > + * struct venc_ap_ipi_msg_set_param - AP to VPU set_param cmd stru=
cture
> > + * @msg_id:    message id (AP_IPIMSG_XXX_ENC_SET_PARAM)
> > + * @inst_id:   VPU encoder instance id (struct venc_vp8_vpu_drv/ve=
nc_h264_vpu_drv *)
> > + * @param_id:  parameter id (venc_set_param_type)
> > + * @data_item: number of items in the data array
> > + * @data[8]:   data array to store the set parameters
> > + */
> > +struct venc_ap_ipi_msg_set_param {
> > +       uint32_t msg_id;
> > +       uint32_t inst_id;
> > +       uint32_t param_id;
> > +       uint32_t data_item;
> > +       uint32_t data[8];
> > +};
> > +
> > +/**
> > + * struct venc_ap_ipi_msg_enc - AP to VPU enc cmd structure
> > + * @msg_id:    message id (AP_IPIMSG_XXX_ENC_ENCODE)
> > + * @inst_id:   VPU encoder instance id (struct venc_vp8_vpu_drv/ve=
nc_h264_vpu_drv *)
> > + * @bs_mode:   bitstream mode for h264
> > + *             (H264_BS_MODE_SPS/H264_BS_MODE_PPS/H264_BS_MODE_FRA=
ME)
> > + * @input_addr:        pointer to input image buffer plane
> > + * @bs_addr:   pointer to output bit stream buffer
> > + * @bs_size:   bit stream buffer size
> > + */
> > +struct venc_ap_ipi_msg_enc {
> > +       uint32_t msg_id;
> > +       uint32_t inst_id;
> > +       uint32_t bs_mode;
> > +       uint32_t input_addr[3];
> > +       uint32_t bs_addr;
> > +       uint32_t bs_size;
> > +};
> > +
> > +/**
> > + * struct venc_ap_ipi_msg_deinit - AP to VPU deinit cmd structure
> > + * @msg_id:    message id (AP_IPIMSG_XXX_ENC_DEINIT)
> > + * @inst_id:   VPU encoder instance id (struct venc_vp8_vpu_drv/ve=
nc_h264_vpu_drv *)
> > + */
> > +struct venc_ap_ipi_msg_deinit {
> > +       uint32_t msg_id;
> > +       uint32_t inst_id;
> > +};
> > +
> > +/**
> > + * enum venc_ipi_msg_status - VPU ack AP cmd status
> > + */
> > +enum venc_ipi_msg_status {
> > +       VENC_IPI_MSG_STATUS_OK,
> > +       VENC_IPI_MSG_STATUS_FAIL,
> > +};
> > +
> > +/**
> > + * struct venc_vpu_ipi_msg_common - VPU ack AP cmd common structur=
e
> > + * @msg_id:    message id (VPU_IPIMSG_XXX_DONE)
> > + * @status:    cmd status (venc_ipi_msg_status)
> > + * @venc_inst: AP encoder instance (struct venc_vp8_handle/venc_h2=
64_handle *)
> > + */
> > +struct venc_vpu_ipi_msg_common {
> > +       uint32_t msg_id;
> > +       uint32_t status;
> > +       uint64_t venc_inst;
> > +};
> > +
> > +/**
> > + * struct venc_vpu_ipi_msg_init - VPU ack AP init cmd structure
> > + * @msg_id:    message id (VPU_IPIMSG_XXX_ENC_SET_PARAM_DONE)
> > + * @status:    cmd status (venc_ipi_msg_status)
> > + * @venc_inst: AP encoder instance (struct venc_vp8_handle/venc_h2=
64_handle *)
> > + * @inst_id:   VPU encoder instance id (struct venc_vp8_vpu_drv/ve=
nc_h264_vpu_drv *)
> > + */
> > +struct venc_vpu_ipi_msg_init {
> > +       uint32_t msg_id;
> > +       uint32_t status;
> > +       uint64_t venc_inst;
> > +       uint32_t inst_id;
> > +       uint32_t reserved;
> > +};
> > +
> > +/**
> > + * struct venc_vpu_ipi_msg_set_param - VPU ack AP set_param cmd st=
ructure
> > + * @msg_id:    message id (VPU_IPIMSG_XXX_ENC_SET_PARAM_DONE)
> > + * @status:    cmd status (venc_ipi_msg_status)
> > + * @venc_inst: AP encoder instance (struct venc_vp8_handle/venc_h2=
64_handle *)
> > + * @param_id:  parameter id (venc_set_param_type)
> > + * @data_item: number of items in the data array
> > + * @data[6]:   data array to store the return result
> > + */
> > +struct venc_vpu_ipi_msg_set_param {
> > +       uint32_t msg_id;
> > +       uint32_t status;
> > +       uint64_t venc_inst;
> > +       uint32_t param_id;
> > +       uint32_t data_item;
> > +       uint32_t data[6];
> > +};
> > +
> > +/**
> > + * enum venc_ipi_msg_enc_state - Type of encode state
> > + * VEN_IPI_MSG_ENC_STATE_FRAME:        one frame being encoded
> > + * VEN_IPI_MSG_ENC_STATE_PART: bit stream buffer full
> > + * VEN_IPI_MSG_ENC_STATE_SKIP: encoded skip frame
> > + * VEN_IPI_MSG_ENC_STATE_ERROR:        encounter error
> > + */
> > +enum venc_ipi_msg_enc_state {
> > +       VEN_IPI_MSG_ENC_STATE_FRAME,
> > +       VEN_IPI_MSG_ENC_STATE_PART,
> > +       VEN_IPI_MSG_ENC_STATE_SKIP,
> > +       VEN_IPI_MSG_ENC_STATE_ERROR,
> > +};
> > +
> > +/**
> > + * struct venc_vpu_ipi_msg_enc - VPU ack AP enc cmd structure
> > + * @msg_id:    message id (VPU_IPIMSG_XXX_ENC_ENCODE_DONE)
> > + * @status:    cmd status (venc_ipi_msg_status)
> > + * @venc_inst: AP encoder instance (struct venc_vp8_handle/venc_h2=
64_handle *)
> > + * @state:     encode state (venc_ipi_msg_enc_state)
> > + * @key_frame: whether the encoded frame is key frame
> > + * @bs_size:   encoded bitstream size
> > + */
> > +struct venc_vpu_ipi_msg_enc {
> > +       uint32_t msg_id;
> > +       uint32_t status;
> > +       uint64_t venc_inst;
> > +       uint32_t state;
> > +       uint32_t key_frame;
> > +       uint32_t bs_size;
> > +       uint32_t reserved;
> > +};
> > +
> > +/**
> > + * struct venc_vpu_ipi_msg_deinit - VPU ack AP deinit cmd structur=
e
> > + * @msg_id:   message id (VPU_IPIMSG_XXX_ENC_DEINIT_DONE)
> > + * @status:   cmd status (venc_ipi_msg_status)
> > + * @venc_inst: AP encoder instance (struct venc_vp8_handle/venc_h2=
64_handle *)
> > + */
> > +struct venc_vpu_ipi_msg_deinit {
> > +       uint32_t msg_id;
> > +       uint32_t status;
> > +       uint64_t venc_inst;
> > +};
> > +
> > +#endif /* _VENC_IPI_MSG_H_ */
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linu=
x/v4l2-controls.h
> > old mode 100644
> > new mode 100755
> > index ee9d530..3ac35c4
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -646,6 +646,10 @@ enum v4l2_mpeg_mfc51_video_force_frame_type {
> >  #define V4L2_CID_MPEG_MFC51_VIDEO_H264_NUM_REF_PIC_FOR_P          =
     (V4L2_CID_MPEG_MFC51_BASE+54)
> >
> >
> > +#define V4L2_CID_MPEG_MTK_BASE                                 (V4=
L2_CTRL_CLASS_MPEG | 0x5500)
> > +#define V4L2_CID_MPEG_MTK_VIDEO_FRAME_SKIP_ENABLE              (V4=
L2_CID_MPEG_MTK_BASE+0)
> > +#define V4L2_CID_MPEG_MTK_VIDEO_FORCE_FRAME_TYPE_I_FRAME       (V4=
L2_CID_MPEG_MTK_BASE+1)
> > +
> >  /*  Camera class control IDs */
> >
> >  #define V4L2_CID_CAMERA_CLASS_BASE     (V4L2_CTRL_CLASS_CAMERA | 0=
x900)
> > --
> > 1.7.9.5
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-med=
ia" in
> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
