From: Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/4] media: platform: dwc: Support for DW CSI-2 Host
Date: Tue, 16 May 2017 19:18:46 +0100
Message-ID: <49e4c275-c660-60fd-cb32-e09a5add91a5@synopsys.com>
References: <cover.1488885081.git.roliveir@synopsys.com>
 <6a45f8d24993bc6ab02f8bd76ef1db421ab32d9c.1488885081.git.roliveir@synopsys.com>
 <24d1c826-8c02-d625-efb7-705d3ad9ce3d@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <24d1c826-8c02-d625-efb7-705d3ad9ce3d-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Jean-Christophe Trotin <jean-christophe.trotin-qxv4g6HH51o@public.gmane.org>, Kieran Bingham <kieran+renesas-7hKh/agyDeatmTQ+vhA3Yw@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Pet
List-Id: devicetree@vger.kernel.org

Hi Hans,

Thank you very much for your feedback.

On 5/8/2017 11:38 AM, Hans Verkuil wrote:
> Hi Ramiro,
> 
> My sincere apologies for the long delay in reviewing this. The good news is that
> I should have more time for reviews going forward, so I hope I'll be a lot quicker
> in the future.
> 
> On 03/07/2017 03:37 PM, Ramiro Oliveira wrote:
>> Add support for the Synopsys DesignWare CSI-2 Host
>>
>> Signed-off-by: Ramiro Oliveira <roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>> ---
>>  MAINTAINERS                              |   7 +
>>  drivers/media/platform/Kconfig           |   1 +
>>  drivers/media/platform/Makefile          |   2 +
>>  drivers/media/platform/dwc/Kconfig       |   5 +
>>  drivers/media/platform/dwc/Makefile      |   1 +
>>  drivers/media/platform/dwc/dw_mipi_csi.c | 653 +++++++++++++++++++++++++++++++
>>  drivers/media/platform/dwc/dw_mipi_csi.h | 181 +++++++++
>>  include/media/dwc/csi_host_platform.h    |  97 +++++
>>  8 files changed, 947 insertions(+)
>>  create mode 100644 drivers/media/platform/dwc/Kconfig
>>  create mode 100644 drivers/media/platform/dwc/Makefile
>>  create mode 100644 drivers/media/platform/dwc/dw_mipi_csi.c
>>  create mode 100644 drivers/media/platform/dwc/dw_mipi_csi.h
>>  create mode 100644 include/media/dwc/csi_host_platform.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5badfd33e51f..19673dad43b4 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -11061,6 +11061,13 @@ S:	Maintained
>>  F:	drivers/staging/media/st-cec/
>>  F:	Documentation/devicetree/bindings/media/stih-cec.txt
>>  
>> +SYNOPSYS DESIGNWARE CSI-2 HOST VIDEO PLATFORM
>> +M:	Ramiro Oliveira <roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>> +L:	linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> +T:	git git://linuxtv.org/media_tree.git
>> +S:	Maintained
>> +F:	drivers/media/platform/dwc/
>> +
>>  SHARED MEMORY COMMUNICATIONS (SMC) SOCKETS
>>  M:	Ursula Braun <ubraun-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
>>  L:	linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
>> index 53f6f12bff0d..4b6e00da763f 100644
>> --- a/drivers/media/platform/Kconfig
>> +++ b/drivers/media/platform/Kconfig
>> @@ -120,6 +120,7 @@ source "drivers/media/platform/am437x/Kconfig"
>>  source "drivers/media/platform/xilinx/Kconfig"
>>  source "drivers/media/platform/rcar-vin/Kconfig"
>>  source "drivers/media/platform/atmel/Kconfig"
>> +source "drivers/media/platform/dwc/Kconfig"
>>  
>>  config VIDEO_TI_CAL
>>  	tristate "TI CAL (Camera Adaptation Layer) driver"
>> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
>> index 8959f6e6692a..95eae2772c1f 100644
>> --- a/drivers/media/platform/Makefile
>> +++ b/drivers/media/platform/Makefile
>> @@ -64,6 +64,8 @@ obj-$(CONFIG_VIDEO_RCAR_VIN)		+= rcar-vin/
>>  
>>  obj-$(CONFIG_VIDEO_ATMEL_ISC)		+= atmel/
>>  
>> +obj-$(CONFIG_CSI_VIDEO_PLATFORM)	+= dwc/
>> +
>>  ccflags-y += -I$(srctree)/drivers/media/i2c
>>  
>>  obj-$(CONFIG_VIDEO_MEDIATEK_VPU)	+= mtk-vpu/
>> diff --git a/drivers/media/platform/dwc/Kconfig b/drivers/media/platform/dwc/Kconfig
>> new file mode 100644
>> index 000000000000..2cd13d23f897
>> --- /dev/null
>> +++ b/drivers/media/platform/dwc/Kconfig
>> @@ -0,0 +1,5 @@
>> +config DWC_MIPI_CSI2_HOST
>> +	tristate "SNPS DWC MIPI CSI2 Host"
>> +	select GENERIC_PHY
>> +	help
>> +	  This is a V4L2 driver for Synopsys Designware MIPI CSI-2 Host.
>> diff --git a/drivers/media/platform/dwc/Makefile b/drivers/media/platform/dwc/Makefile
>> new file mode 100644
>> index 000000000000..5eb076a55123
>> --- /dev/null
>> +++ b/drivers/media/platform/dwc/Makefile
>> @@ -0,0 +1 @@
>> +obj-$(CONFIG_DWC_MIPI_CSI2_HOST)	+= dw_mipi_csi.o
>> diff --git a/drivers/media/platform/dwc/dw_mipi_csi.c b/drivers/media/platform/dwc/dw_mipi_csi.c
>> new file mode 100644
>> index 000000000000..6905def40a07
>> --- /dev/null
>> +++ b/drivers/media/platform/dwc/dw_mipi_csi.c
>> @@ -0,0 +1,653 @@
>> +/*
>> + * DWC MIPI CSI-2 Host device driver
>> + *
>> + * Copyright (C) 2016 Synopsys, Inc. All rights reserved.
>> + * Author: Ramiro Oliveira <ramiro.oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published
>> + * by the Free Software Foundation, either version 2 of the License,
>> + * or (at your option) any later version.
>> + */
>> +
>> +#include "dw_mipi_csi.h"
>> +
>> +/**
>> + * @short Video formats supported by the MIPI CSI-2
>> + */
>> +static const struct mipi_fmt dw_mipi_csi_formats[] = {
>> +	{
>> +		/* RAW 8 */
>> +		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
>> +		.depth = 8,
>> +	},
>> +	{
>> +		/* RAW 10 */
>> +		.code = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE,
>> +		.depth = 10,
>> +	},
>> +	{
>> +		/* RGB 565 */
>> +		.code = MEDIA_BUS_FMT_RGB565_2X8_BE,
>> +		.depth = 16,
>> +	},
>> +	{
>> +		/* BGR 565 */
>> +		.code = MEDIA_BUS_FMT_RGB565_2X8_LE,
>> +		.depth = 16,
>> +	},
>> +	{
>> +		/* RGB 888 */
>> +		.code = MEDIA_BUS_FMT_RGB888_2X12_LE,
>> +		.depth = 24,
>> +	},
>> +	{
>> +		/* BGR 888 */
>> +		.code = MEDIA_BUS_FMT_RGB888_2X12_BE,
>> +		.depth = 24,
>> +	},
>> +};
>> +
>> +static struct mipi_csi_dev *sd_to_mipi_csi_dev(struct v4l2_subdev *sdev)
>> +{
>> +	return container_of(sdev, struct mipi_csi_dev, sd);
>> +}
>> +
>> +static void dw_mipi_csi_write(struct mipi_csi_dev *dev,
>> +		  unsigned int address, unsigned int data)
>> +{
>> +	iowrite32(data, dev->base_address + address);
>> +}
>> +
>> +static u32 dw_mipi_csi_read(struct mipi_csi_dev *dev, unsigned long address)
>> +{
>> +	return ioread32(dev->base_address + address);
>> +}
>> +
>> +static void dw_mipi_csi_write_part(struct mipi_csi_dev *dev,
>> +		       unsigned long address, unsigned long data,
>> +		       unsigned char shift, unsigned char width)
>> +{
>> +	u32 mask = (1 << width) - 1;
>> +	u32 temp = dw_mipi_csi_read(dev, address);
>> +
>> +	temp &= ~(mask << shift);
>> +	temp |= (data & mask) << shift;
>> +	dw_mipi_csi_write(dev, address, temp);
>> +}
>> +
>> +static const struct mipi_fmt *
>> +find_dw_mipi_csi_format(struct v4l2_mbus_framefmt *mf)
>> +{
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(dw_mipi_csi_formats); i++)
>> +		if (mf->code == dw_mipi_csi_formats[i].code)
>> +			return &dw_mipi_csi_formats[i];
>> +	return NULL;
>> +}
>> +
>> +static void dw_mipi_csi_reset(struct mipi_csi_dev *dev)
>> +{
>> +	dw_mipi_csi_write(dev, R_CSI2_CTRL_RESETN, 0);
>> +	dw_mipi_csi_write(dev, R_CSI2_CTRL_RESETN, 1);
>> +}
>> +
>> +static int dw_mipi_csi_mask_irq_power_off(struct mipi_csi_dev *dev)
>> +{
>> +	/* set only one lane (lane 0) as active (ON) */
>> +	dw_mipi_csi_write(dev, R_CSI2_N_LANES, 0);
>> +
>> +	dw_mipi_csi_write(dev, R_CSI2_MASK_INT_PHY_FATAL, 0);
>> +	dw_mipi_csi_write(dev, R_CSI2_MASK_INT_PKT_FATAL, 0);
>> +	dw_mipi_csi_write(dev, R_CSI2_MASK_INT_FRAME_FATAL, 0);
>> +	dw_mipi_csi_write(dev, R_CSI2_MASK_INT_PHY, 0);
>> +	dw_mipi_csi_write(dev, R_CSI2_MASK_INT_PKT, 0);
>> +	dw_mipi_csi_write(dev, R_CSI2_MASK_INT_LINE, 0);
>> +	dw_mipi_csi_write(dev, R_CSI2_MASK_INT_IPI, 0);
>> +
>> +	dw_mipi_csi_write(dev, R_CSI2_CTRL_RESETN, 0);
>> +
>> +	return 0;
>> +
> 
> Spurious empty line.
> 

I'll remove it.

>> +}
>> +
>> +static int dw_mipi_csi_hw_stdby(struct mipi_csi_dev *dev)
>> +{
>> +	/* set only one lane (lane 0) as active (ON) */
>> +	dw_mipi_csi_reset(dev);
>> +
>> +	dw_mipi_csi_write(dev, R_CSI2_N_LANES, 0);
>> +
>> +	phy_init(dev->phy);
>> +
>> +	dw_mipi_csi_write(dev, R_CSI2_MASK_INT_PHY_FATAL, 0xFFFFFFFF);
>> +	dw_mipi_csi_write(dev, R_CSI2_MASK_INT_PKT_FATAL, 0xFFFFFFFF);
>> +	dw_mipi_csi_write(dev, R_CSI2_MASK_INT_FRAME_FATAL, 0xFFFFFFFF);
>> +	dw_mipi_csi_write(dev, R_CSI2_MASK_INT_PHY, 0xFFFFFFFF);
>> +	dw_mipi_csi_write(dev, R_CSI2_MASK_INT_PKT, 0xFFFFFFFF);
>> +	dw_mipi_csi_write(dev, R_CSI2_MASK_INT_LINE, 0xFFFFFFFF);
>> +	dw_mipi_csi_write(dev, R_CSI2_MASK_INT_IPI, 0xFFFFFFFF);
>> +
>> +	return 0;
>> +
> 
> Ditto.
> 

I'll remove it also.

>> +}
>> +
>> +static void dw_mipi_csi_set_ipi_fmt(struct mipi_csi_dev *csi_dev)
>> +{
>> +	struct device *dev = &csi_dev->pdev->dev;
>> +
>> +	switch (csi_dev->fmt->code) {
>> +	case MEDIA_BUS_FMT_RGB565_2X8_BE:
>> +	case MEDIA_BUS_FMT_RGB565_2X8_LE:
>> +		dw_mipi_csi_write(csi_dev, R_CSI2_IPI_DATA_TYPE, CSI_2_RGB565);
>> +		dev_dbg(dev, "DT: RGB 565");
>> +		break;
>> +
>> +	case MEDIA_BUS_FMT_RGB888_2X12_LE:
>> +	case MEDIA_BUS_FMT_RGB888_2X12_BE:
>> +		dw_mipi_csi_write(csi_dev, R_CSI2_IPI_DATA_TYPE, CSI_2_RGB888);
>> +		dev_dbg(dev, "DT: RGB 888");
>> +		break;
>> +	case MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE:
>> +		dw_mipi_csi_write(csi_dev, R_CSI2_IPI_DATA_TYPE, CSI_2_RAW10);
>> +		dev_dbg(dev, "DT: RAW 10");
>> +		break;
>> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
>> +		dw_mipi_csi_write(csi_dev, R_CSI2_IPI_DATA_TYPE, CSI_2_RAW8);
>> +		dev_dbg(dev, "DT: RAW 8");
>> +		break;
>> +	default:
>> +		dw_mipi_csi_write(csi_dev, R_CSI2_IPI_DATA_TYPE, CSI_2_RGB565);
>> +		dev_dbg(dev, "Error");
>> +		break;
>> +	}
>> +}
>> +
>> +static void __dw_mipi_csi_fill_timings(struct mipi_csi_dev *dev,
>> +			   const struct v4l2_bt_timings *bt)
>> +{
>> +
>> +	if (bt == NULL)
>> +		return;
>> +
>> +	dev->hw.hsa = bt->hsync;
>> +	dev->hw.hbp = bt->hbackporch;
>> +	dev->hw.hsd = bt->hsync;
>> +	dev->hw.htotal = bt->height + bt->vfrontporch +
>> +	    bt->vsync + bt->vbackporch;
> 
> Use V4L2_DV_BT_FRAME_HEIGHT define.
> 

I'll use it now.

>> +	dev->hw.vsa = bt->vsync;
>> +	dev->hw.vbp = bt->vbackporch;
>> +	dev->hw.vfp = bt->vfrontporch;
>> +	dev->hw.vactive = bt->height;
>> +}
>> +
>> +static void dw_mipi_csi_start(struct mipi_csi_dev *csi_dev)
>> +{
>> +	const struct v4l2_bt_timings *bt = &v4l2_dv_timings_presets[0].bt;
>> +	struct device *dev = &csi_dev->pdev->dev;
>> +
>> +	__dw_mipi_csi_fill_timings(csi_dev, bt);
>> +
>> +	dw_mipi_csi_write(csi_dev, R_CSI2_N_LANES, (csi_dev->hw.num_lanes - 1));
>> +	dev_dbg(dev, "N Lanes: %d\n", csi_dev->hw.num_lanes);
>> +
>> +	/*IPI Related Configuration */
>> +	if ((csi_dev->hw.output_type == IPI_OUT)
>> +	    || (csi_dev->hw.output_type == BOTH_OUT)) {
>> +
>> +		dw_mipi_csi_write_part(csi_dev, R_CSI2_IPI_MODE,
>> +					csi_dev->hw.ipi_mode, 0, 1);
>> +		dev_dbg(dev, "IPI MODE: %d\n", csi_dev->hw.ipi_mode);
>> +
>> +		dw_mipi_csi_write_part(csi_dev, R_CSI2_IPI_MODE,
>> +				       csi_dev->hw.ipi_color_mode, 8, 1);
>> +		dev_dbg(dev, "Color Mode: %d\n", csi_dev->hw.ipi_color_mode);
>> +
>> +		dw_mipi_csi_write(csi_dev, R_CSI2_IPI_VCID,
>> +					csi_dev->hw.virtual_ch);
>> +		dev_dbg(dev, "Virtual Channel: %d\n", csi_dev->hw.virtual_ch);
>> +
>> +		dw_mipi_csi_write_part(csi_dev, R_CSI2_IPI_MEM_FLUSH,
>> +				       csi_dev->hw.ipi_auto_flush, 8, 1);
>> +		dev_dbg(dev, "Auto-flush: %d\n", csi_dev->hw.ipi_auto_flush);
>> +
>> +		dw_mipi_csi_write(csi_dev, R_CSI2_IPI_HSA_TIME,
>> +					csi_dev->hw.hsa);
>> +		dev_dbg(dev, "HSA: %d\n", csi_dev->hw.hsa);
>> +
>> +		dw_mipi_csi_write(csi_dev, R_CSI2_IPI_HBP_TIME,
>> +					csi_dev->hw.hbp);
>> +		dev_dbg(dev, "HBP: %d\n", csi_dev->hw.hbp);
>> +
>> +		dw_mipi_csi_write(csi_dev, R_CSI2_IPI_HSD_TIME,
>> +					csi_dev->hw.hsd);
>> +		dev_dbg(dev, "HSD: %d\n", csi_dev->hw.hsd);
>> +
>> +		if (csi_dev->hw.ipi_mode == AUTO_TIMING) {
>> +			dw_mipi_csi_write(csi_dev, R_CSI2_IPI_HLINE_TIME,
>> +					  csi_dev->hw.htotal);
>> +			dev_dbg(dev, "H total: %d\n", csi_dev->hw.htotal);
>> +
>> +			dw_mipi_csi_write(csi_dev, R_CSI2_IPI_VSA_LINES,
>> +					  csi_dev->hw.vsa);
>> +			dev_dbg(dev, "VSA: %d\n", csi_dev->hw.vsa);
>> +
>> +			dw_mipi_csi_write(csi_dev, R_CSI2_IPI_VBP_LINES,
>> +					  csi_dev->hw.vbp);
>> +			dev_dbg(dev, "VBP: %d\n", csi_dev->hw.vbp);
>> +
>> +			dw_mipi_csi_write(csi_dev, R_CSI2_IPI_VFP_LINES,
>> +					  csi_dev->hw.vfp);
>> +			dev_dbg(dev, "VFP: %d\n", csi_dev->hw.vfp);
>> +
>> +			dw_mipi_csi_write(csi_dev, R_CSI2_IPI_VACTIVE_LINES,
>> +					  csi_dev->hw.vactive);
>> +			dev_dbg(dev, "V Active: %d\n", csi_dev->hw.vactive);
>> +		}
>> +	}
>> +
>> +	phy_power_on(csi_dev->phy);
>> +}
>> +
>> +static int dw_mipi_csi_enum_mbus_code(struct v4l2_subdev *sd,
>> +					struct v4l2_subdev_pad_config *cfg,
>> +					struct v4l2_subdev_mbus_code_enum *code)
>> +{
>> +	if (code->index >= ARRAY_SIZE(dw_mipi_csi_formats))
>> +		return -EINVAL;
>> +
>> +	code->code = dw_mipi_csi_formats[code->index].code;
>> +	return 0;
>> +}
>> +
>> +static struct mipi_fmt const *
>> +dw_mipi_csi_try_format(struct v4l2_mbus_framefmt *mf)
>> +{
>> +	struct mipi_fmt const *fmt;
>> +
>> +	fmt = find_dw_mipi_csi_format(mf);
>> +	if (fmt == NULL)
>> +		fmt = &dw_mipi_csi_formats[0];
>> +
>> +	mf->code = fmt->code;
>> +	return fmt;
>> +}
>> +
>> +static struct v4l2_mbus_framefmt *
>> +__dw_mipi_csi_get_format(struct mipi_csi_dev *dev,
>> +			 struct v4l2_subdev_pad_config *cfg,
>> +			 enum v4l2_subdev_format_whence which)
>> +{
>> +	if (which == V4L2_SUBDEV_FORMAT_TRY)
>> +		return cfg ? v4l2_subdev_get_try_format(&dev->sd, cfg,
>> +							0) : NULL;
>> +
>> +	return &dev->format;
>> +}
>> +
>> +static int
>> +dw_mipi_csi_set_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
>> +		    struct v4l2_subdev_format *fmt)
>> +{
>> +	struct mipi_csi_dev *dev = sd_to_mipi_csi_dev(sd);
>> +	struct mipi_fmt const *dev_fmt;
>> +	struct v4l2_mbus_framefmt *mf;
>> +	unsigned int i = 0;
>> +	const struct v4l2_bt_timings *bt_r = &v4l2_dv_timings_presets[0].bt;
>> +
>> +	mf = __dw_mipi_csi_get_format(dev, cfg, fmt->which);
>> +
>> +	dev_fmt = dw_mipi_csi_try_format(&fmt->format);
>> +	if (dev_fmt) {
>> +		*mf = fmt->format;
>> +		if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
>> +			dev->fmt = dev_fmt;
>> +		dw_mipi_csi_set_ipi_fmt(dev);
>> +	}
>> +	while (v4l2_dv_timings_presets[i].bt.width) {
>> +		const struct v4l2_bt_timings *bt =
>> +		    &v4l2_dv_timings_presets[i].bt;
> 
> Add empty line here.
> 

Sure.

>> +		if (mf->width == bt->width && mf->height == bt->width) {
> 
> This is way too generic. There are many preset timings that have the same
> width and height but different blanking periods.
> 
> I am really not sure how this is supposed to work. If you want to support
> HDMI here, then I would expect to see support for the s_dv_timings op and friends
> in this driver. And I don't see support for that in the host driver either.
> 
> Is this a generic csi driver, or specific for hdmi? Or supposed to handle both?

This is a generic CSI driver.

> 
> Can you give some background and clarification of this?

This piece of code might seem strange but I'm just using it fill our controller
timing configuration.

I don't have any specific requirements, but they should match, more or less, the
sensor configurations, so I decided to re-use the HDMI blanking values, since,
usually, they match with the sensor configurations

So, my intention is to check if there is any HDMI preset that matches the
required width and height, and then use the blanking values to configure our
controller. I know this might not be very common, and I'm open to use different
approaches, but from my perspective it seems to work fine.


> 
> Before I do any more code review I need to have a clearer understanding of this.
> 
> Regards,
> 
> 	Hans
> 
>> +			__dw_mipi_csi_fill_timings(dev, bt);
>> +			return 0;
>> +		}
>> +		i++;
>> +	}
>> +
>> +	__dw_mipi_csi_fill_timings(dev, bt_r);
>> +	return 0;
>> +
>> +}

-- 
Best Regards

Ramiro Oliveira
Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
