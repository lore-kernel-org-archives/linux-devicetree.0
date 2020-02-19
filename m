Return-Path: <SRS0=2Ix+=4H=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AFAC34022
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 21:18:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C11E521D56
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 21:18:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbgBSVSD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Feb 2020 16:18:03 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39010 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbgBSVSC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Feb 2020 16:18:02 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 5A84128FB6F
Subject: Re: [RFC PATCH V5 1/3] media: platform: mtk-isp: Add Mediatek sensor
 interface driver
To:     Louis Kuo <louis.kuo@mediatek.com>, hans.verkuil@cisco.com,
        laurent.pinchart+renesas@ideasonboard.com, tfiga@chromium.org,
        keiichiw@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org
Cc:     devicetree@vger.kernel.org, Sean.Cheng@mediatek.com,
        Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com,
        Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com,
        sj.huang@mediatek.com, yuzhao@chromium.org,
        linux-mediatek@lists.infradead.org, zwisler@chromium.org,
        christie.yu@mediatek.com, frederic.chen@mediatek.com,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        "kernel@collabora.com" <kernel@collabora.com>
References: <20200129081650.8027-1-louis.kuo@mediatek.com>
 <20200129081650.8027-2-louis.kuo@mediatek.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <d5442fc8-c2c7-b025-a300-a29153df31ec@collabora.com>
Date:   Wed, 19 Feb 2020 18:17:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200129081650.8027-2-louis.kuo@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Louis,

As I mentioned in the cover letter, looks like this patch didn't reach linux-media
mailing list due to its size and you might need to break it in smaller patches.

Please see my comments below.

On 1/29/20 6:16 AM, Louis Kuo wrote:
> This patch adds Mediatek's sensor interface driver. Sensor interface driver is
> a MIPI-CSI2 host driver, namely, a HW camera interface controller. It support a
> widely adopted, simple, high-speed protocol primarily intended for
> point-to-point image and video transmission between cameras and host devices.
> The mtk-isp directory will contain drivers for multiple IP blocks found in
> Mediatek ISP system. It will include ISP Pass 1 driver, sensor interface driver
> , DIP driver and face detection driver.
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> ---
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/mtk-isp/Kconfig        |   17 +
>  .../media/platform/mtk-isp/isp_50/Makefile    |    3 +
>  .../platform/mtk-isp/isp_50/seninf/Makefile   |    6 +
>  .../mtk-isp/isp_50/seninf/mtk_seninf.c        | 1112 +++
>  .../mtk-isp/isp_50/seninf/mtk_seninf_def.h    |   72 +
>  .../mtk-isp/isp_50/seninf/mtk_seninf_reg.h    | 7747 +++++++++++++++++
>  7 files changed, 8958 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-isp/Kconfig
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_def.h
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_reg.h

Any special reason for having 3 directories? mtk-isp/isp_50/seninf ?
I was wondering if only mtk-isp/seninf would be good enough.
Or maybe just mtk-isp-seninf while it's still in staging and we don't have
the other IP blocs drivers.

Also, if the driver is going to staging, it should have a TODO file as well as
mentioned on https://www.kernel.org/doc/html/v4.15/process/2.Process.html#staging-trees


> 
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 7cbbd925124c..cff3f655774c 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -92,6 +92,7 @@ obj-$(CONFIG_VIDEO_MEDIATEK_MDP)	+= mtk-mdp/
>  
>  obj-$(CONFIG_VIDEO_MEDIATEK_JPEG)	+= mtk-jpeg/
>  
> +obj-$(CONFIG_MTK_SENINF)		+= mtk-isp/isp_50/
>  obj-$(CONFIG_VIDEO_QCOM_CAMSS)		+= qcom/camss/
>  
>  obj-$(CONFIG_VIDEO_QCOM_VENUS)		+= qcom/venus/
> diff --git a/drivers/media/platform/mtk-isp/Kconfig b/drivers/media/platform/mtk-isp/Kconfig
> new file mode 100644
> index 000000000000..c469f6a82a1d
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/Kconfig
> @@ -0,0 +1,17 @@
> +config MTK_SENINF
> +	tristate "MediaTek mipi csi2 driver"
> +	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API> +	depends on MEDIA_CAMERA_SUPPORT

depends on ARCH_MEDIATEK || COMPILE_TEST

> +	select V4L2_FWNODE
> +
> +	default n
> +	help
> +	    This driver provides a mipi-csi2 host driver used as a
> +	    interface to connect camera with MediaTek's
> +	    MT8183 SOCs. It is able to handle multiple cameras
> +	    at the same time.
> +
> +	    Choose y if you want to use MediaTek SoCs to create image
> +	    capture application such as video recording and still image
> +	    capture.

identation is usually two spaces after "help"

> +
> diff --git a/drivers/media/platform/mtk-isp/isp_50/Makefile b/drivers/media/platform/mtk-isp/isp_50/Makefile
> new file mode 100644
> index 000000000000..2e7d731d42b7
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_MTK_SENINF) += seninf/
> diff --git a/drivers/media/platform/mtk-isp/isp_50/seninf/Makefile b/drivers/media/platform/mtk-isp/isp_50/seninf/Makefile
> new file mode 100644
> index 000000000000..bf193feb0ce9
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/seninf/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +MODULE		= mtk_seninf
> +LIB_FILES	= mtk_seninf

This is not common.
you can list the files with:

mtk_seninf_objs += file1.o file2.o

Please check how vivid driver does it.

> +
> +obj-$(CONFIG_MTK_SENINF) += mtk_seninf.o
> diff --git a/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c
> new file mode 100644
> index 000000000000..8edaa791cd7b
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c
> @@ -0,0 +1,1112 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <linux/module.h>
> +#include <linux/delay.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_irq.h>
> +#ifdef CONFIG_COMPAT
> +#include <linux/compat.h>
> +#endif

this is unusual to me, is it indeed required?
I only found drivers/staging/pi433/pi433_if.c doing this

> +#include <linux/videodev2.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-async.h>

new line

> +#include "mtk_seninf_reg.h"
> +#include "mtk_seninf_def.h"

Please, sort all headers alphabetically

> +
> +#define SENINF_BITS(base, reg, field, val) do { \
> +		u32 __iomem *__p = (base) + (reg); \
> +		u32 __v = *__p; \
> +		__v &= ~reg##_##field##_MASK; \
> +		__v |= ((val) << reg##_##field##_SHIFT); \
> +		*__p = __v; \
> +	} while (0)
> +
> +#define SENINF_READ_BITS(base, reg, field) \
> +	({ \
> +		u32 __iomem *__p = (base) + (reg); \
> +		u32 __v = *__p; \
> +		__v &= reg##_##field##_MASK; \
> +		__v >>= reg##_##field##_SHIFT; \
> +		__v; \
> +	})

It looks like this macro is not used, please remove it.

> +
> +struct sensor_cfg {

It would be nice if all structs and functions started with
the same prefix mtk_seninf_

> +	unsigned char clock_lane;
> +	unsigned short num_data_lanes;
> +};
> +
> +struct mtk_seninf {
> +	struct v4l2_subdev subdev;
> +	struct v4l2_async_notifier notifier;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct v4l2_subdev_format fmt[NUM_PADS];
> +	struct device *dev;
> +	struct media_pad pads[NUM_PADS];
> +	struct sensor_cfg sensor[NUM_SENSORS];
> +	unsigned int num_clks;
> +	struct clk_bulk_data *clks;
> +	void __iomem *base;
> +	void __iomem *rx;
> +	unsigned char __iomem *csi2_rx[CFG_CSI_PORT_MAX_NUM];
> +	unsigned int port;
> +	unsigned int mux_sel;
> +};
> +
> +static inline int is_4d1c(unsigned int port)
> +{
> +	return port < CFG_CSI_PORT_0A;
> +}
> +
> +static inline int is_cdphy_combo(unsigned int port)
> +{
> +	return port == CFG_CSI_PORT_0A ||
> +		port == CFG_CSI_PORT_0B ||
> +		port == CFG_CSI_PORT_0;
> +}
> +
> +inline struct mtk_seninf *sd_to_mtk_seninf(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct mtk_seninf, subdev);
> +}
> +
> +static unsigned int mtk_seninf_get_dpcm(struct mtk_seninf *priv)
> +{
> +	unsigned int dpcm;
> +
> +	switch (priv->fmt[priv->port].format.code) {
> +	case MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8:
> +		dpcm = 0x2a;
> +		break;
> +	default:
> +		dpcm = 0;
> +		break;
> +	}
> +
> +	return dpcm;
> +}
> +
> +static unsigned int mtk_seninf_map_fmt(struct mtk_seninf *priv)
> +{
> +	int fmtidx = RAW_10BIT_FMT;
> +
> +	switch (priv->fmt[priv->port].format.code) {
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +		fmtidx = RAW_8BIT_FMT;
> +		break;
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +		fmtidx = RAW_10BIT_FMT;
> +		break;
> +	case MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8:
> +		fmtidx = RAW_8BIT_FMT;
> +		break;
> +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +		fmtidx = RAW_12BIT_FMT;
> +		break;
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +	case MEDIA_BUS_FMT_VYUY8_1X16:
> +	case MEDIA_BUS_FMT_YUYV8_1X16:
> +	case MEDIA_BUS_FMT_YVYU8_1X16:
> +		fmtidx = YUV422_FMT;
> +		break;
> +	case MEDIA_BUS_FMT_JPEG_1X8:
> +	case MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8:
> +		fmtidx = JPEG_FMT;
> +		break;
> +	}
> +
> +	return fmtidx;
> +}
> +
> +static u32 mtk_seninf_csi_port_to_seninf(u32 port)
> +{
> +	static const u32 port_to_seninf[] = {
> +		[CFG_CSI_PORT_0] = SENINF_1,
> +		[CFG_CSI_PORT_1] = SENINF_3,
> +		[CFG_CSI_PORT_2] = SENINF_5,
> +		[CFG_CSI_PORT_0A] = SENINF_1,
> +		[CFG_CSI_PORT_0B] = SENINF_2,
> +	};
> +	if (WARN_ON(port >= ARRAY_SIZE(port_to_seninf)))
> +		return -EINVAL;
> +
> +	return port_to_seninf[port];
> +}
> +
> +static void mtk_seninf_set_mux(struct mtk_seninf *priv,
> +			       int seninf)
> +{
> +	unsigned int mux = priv->mux_sel;
> +	void __iomem *pseninf_top = priv->base;
> +	void __iomem *pseninf = priv->base + 0x1000 * mux;
> +	unsigned int val;
> +	unsigned int pix_sel_ext;
> +	unsigned int pix_sel;
> +	unsigned int hs_pol = 0;
> +	unsigned int vs_pol = 0;
> +	unsigned int pixel_mode = ONE_PIXEL_MODE;
> +	unsigned int input_data_type;
> +
> +	/* Enable mux */
> +	SENINF_BITS(pseninf, SENINF1_MUX_CTRL, SENINF_MUX_EN, 1);
> +	SENINF_BITS(pseninf, SENINF1_MUX_CTRL, SENINF_SRC_SEL, MIPI_SENSOR);
> +	SENINF_BITS(pseninf, SENINF1_MUX_CTRL_EXT, SENINF_SRC_SEL_EXT,
> +		    NORMAL_MODEL);
> +	input_data_type = mtk_seninf_map_fmt(priv);
> +
> +	switch (pixel_mode) {
> +	case 1: /* 2 Pixel */
> +		pix_sel_ext = 0;
> +		pix_sel = 1;
> +		break;
> +	case 2: /* 4 Pixel */
> +		pix_sel_ext = 1;
> +		pix_sel = 0;
> +		break;
> +	default: /* 1 Pixel */
> +		pix_sel_ext = 0;
> +		pix_sel = 0;
> +		break;
> +	}
> +
> +	SENINF_BITS(pseninf, SENINF1_MUX_CTRL_EXT, SENINF_PIX_SEL_EXT,
> +		    pix_sel_ext);
> +	SENINF_BITS(pseninf, SENINF1_MUX_CTRL, SENINF_PIX_SEL, pix_sel);
> +
> +	if (input_data_type != JPEG_FMT) {
> +		SENINF_BITS(pseninf, SENINF1_MUX_CTRL, FIFO_FULL_WR_EN, 2);
> +		SENINF_BITS(pseninf, SENINF1_MUX_CTRL, FIFO_FLUSH_EN, 0x1B);
> +		SENINF_BITS(pseninf, SENINF1_MUX_CTRL, FIFO_PUSH_EN, 0x1F);
> +	} else {
> +		SENINF_BITS(pseninf, SENINF1_MUX_CTRL, FIFO_FULL_WR_EN, 0);
> +		SENINF_BITS(pseninf, SENINF1_MUX_CTRL, FIFO_FLUSH_EN, 0x18);
> +		SENINF_BITS(pseninf, SENINF1_MUX_CTRL, FIFO_PUSH_EN, 0x1E);
> +	}
> +
> +	SENINF_BITS(pseninf, SENINF1_MUX_CTRL, SENINF_HSYNC_POL, hs_pol);
> +	SENINF_BITS(pseninf, SENINF1_MUX_CTRL, SENINF_VSYNC_POL, vs_pol);
> +
> +	val = (readl(pseninf + SENINF1_MUX_CTRL) | 0x3) & 0xFFFFFFFC;
> +	writel(val, pseninf + SENINF1_MUX_CTRL);
> +
> +	/* Set top mux */
> +	val = (readl(pseninf_top + SENINF_TOP_MUX_CTRL) &
> +		(~(0xF << (mux * 4))))	| ((seninf & 0xF) << (mux * 4));
> +	writel(val, pseninf + SENINF_TOP_MUX_CTRL);
> +}
> +
> +static void mtk_seninf_set_dphy(struct mtk_seninf *priv, unsigned int seninf)
> +{
> +	void __iomem *pmipi_rx_base = priv->csi2_rx[CFG_CSI_PORT_0];
> +	unsigned int port = priv->port;
> +	void __iomem *pmipi_rx = priv->csi2_rx[port];
> +	void __iomem *pmipi_rx_conf = priv->base + 0x1000 * seninf;
> +
> +	/* Set analog phy mode to DPHY */
> +	if (is_cdphy_combo(port))
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A, RG_CSI0A_CPHY_EN, 0);
> +	/* 4D1C: MIPIRX_ANALOG_A_BASE = 0x00001A42 */
> +	if (is_4d1c(port)) {
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			    RG_CSI0A_DPHY_L0_CKMODE_EN, 0);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			    RG_CSI0A_DPHY_L0_CKSEL, 1);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			    RG_CSI0A_DPHY_L1_CKMODE_EN, 0);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			    RG_CSI0A_DPHY_L1_CKSEL, 1);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			    RG_CSI0A_DPHY_L2_CKMODE_EN, 1);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			    RG_CSI0A_DPHY_L2_CKSEL, 1);
> +	} else {/* MIPIRX_ANALOG_BASE = 0x102 */
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			    RG_CSI0A_DPHY_L0_CKMODE_EN, 0);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			    RG_CSI0A_DPHY_L0_CKSEL, 0);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			    RG_CSI0A_DPHY_L1_CKMODE_EN, 1);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			    RG_CSI0A_DPHY_L1_CKSEL, 0);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			    RG_CSI0A_DPHY_L2_CKMODE_EN, 0);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			    RG_CSI0A_DPHY_L2_CKSEL, 0);
> +	}
> +	if (is_cdphy_combo(port))
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B, RG_CSI0B_CPHY_EN, 0);
> +
> +	/* Only 4d1c need set CSIB: MIPIRX_ANALOG_B_BASE = 0x00001242 */
> +	if (is_4d1c(port)) {
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			    RG_CSI0B_DPHY_L0_CKMODE_EN, 0);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			    RG_CSI0B_DPHY_L0_CKSEL, 1);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			    RG_CSI0B_DPHY_L1_CKMODE_EN, 0);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			    RG_CSI0B_DPHY_L1_CKSEL, 1);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			    RG_CSI0B_DPHY_L2_CKMODE_EN, 0);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			    RG_CSI0B_DPHY_L2_CKSEL, 1);
> +	} else {/* MIPIRX_ANALOG_BASE = 0x102 */
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			    RG_CSI0B_DPHY_L0_CKSEL, 0);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			    RG_CSI0B_DPHY_L1_CKMODE_EN, 1);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			    RG_CSI0B_DPHY_L1_CKSEL, 0);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			    RG_CSI0B_DPHY_L2_CKMODE_EN, 0);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			    RG_CSI0B_DPHY_L2_CKSEL, 0);
> +	}
> +	/* Byte clock invert */
> +	SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0A,
> +		    RG_CSI0A_CDPHY_L0_T0_BYTECK_INVERT, 1);
> +	SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0A,
> +		    RG_CSI0A_DPHY_L1_BYTECK_INVERT, 1);
> +	SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0A,
> +		    RG_CSI0A_CDPHY_L2_T1_BYTECK_INVERT, 1);
> +
> +	if (is_4d1c(port)) {
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0B,
> +			    RG_CSI0B_CDPHY_L0_T0_BYTECK_INVERT, 1);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0B,
> +			    RG_CSI0B_DPHY_L1_BYTECK_INVERT, 1);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0B,
> +			    RG_CSI0B_CDPHY_L2_T1_BYTECK_INVERT, 1);
> +	}
> +
> +	/* Start ANA EQ tuning */
> +	if (is_cdphy_combo(port)) {
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI0A,
> +			    RG_CSI0A_L0_T0AB_EQ_IS, 1);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI0A,
> +			    RG_CSI0A_L0_T0AB_EQ_BW, 1);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI0A,
> +			    RG_CSI0A_L1_T1AB_EQ_IS, 1);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI0A,
> +			    RG_CSI0A_L1_T1AB_EQ_BW, 1);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA20_CSI0A,
> +			    RG_CSI0A_L2_T1BC_EQ_IS, 1);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA20_CSI0A,
> +			    RG_CSI0A_L2_T1BC_EQ_BW, 1);
> +
> +		if (is_4d1c(port)) { /* 4d1c */
> +			SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI0B,
> +				    RG_CSI0B_L0_T0AB_EQ_IS, 1);
> +			SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI0B,
> +				    RG_CSI0B_L0_T0AB_EQ_BW, 1);
> +			SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI0B,
> +				    RG_CSI0B_L1_T1AB_EQ_IS, 1);
> +			SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI0B,
> +				    RG_CSI0B_L1_T1AB_EQ_BW, 1);
> +			SENINF_BITS(pmipi_rx, MIPI_RX_ANA20_CSI0B,
> +				    RG_CSI0B_L2_T1BC_EQ_IS, 1);
> +			SENINF_BITS(pmipi_rx, MIPI_RX_ANA20_CSI0B,
> +				    RG_CSI0B_L2_T1BC_EQ_BW, 1);
> +		}
> +	} else {
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1A,
> +			    RG_CSI1A_L0_EQ_IS, 1);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1A,
> +			    RG_CSI1A_L0_EQ_BW, 1);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1A,
> +			    RG_CSI1A_L1_EQ_IS, 1);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1A,
> +			    RG_CSI1A_L1_EQ_BW, 1);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI1A,
> +			    RG_CSI1A_L2_EQ_IS, 1);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI1A,
> +			    RG_CSI1A_L2_EQ_BW, 1);
> +
> +		if (is_4d1c(port)) { /* 4d1c */
> +			SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1B,
> +				    RG_CSI1B_L0_EQ_IS, 1);
> +			SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1B,
> +				    RG_CSI1B_L0_EQ_BW, 1);
> +			SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1B,
> +				    RG_CSI1B_L1_EQ_IS, 1);
> +			SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1B,
> +				    RG_CSI1B_L1_EQ_BW, 1);
> +			SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI1B,
> +				    RG_CSI1B_L2_EQ_IS, 1);
> +			SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI1B,
> +				    RG_CSI1B_L2_EQ_BW, 1);
> +		}
> +	}
> +
> +	/* End ANA EQ tuning */
> +	writel(0x90, pmipi_rx_base + MIPI_RX_ANA40_CSI0A);
> +	SENINF_BITS(pmipi_rx, MIPI_RX_ANA24_CSI0A,
> +		    RG_CSI0A_RESERVE, 0x40);
> +	if (is_4d1c(port))
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA24_CSI0B,
> +			    RG_CSI0B_RESERVE, 0x40);
> +	SENINF_BITS(pmipi_rx, MIPI_RX_WRAPPER80_CSI0A,
> +		    CSR_CSI_RST_MODE, 0);
> +	if (is_4d1c(port))
> +		SENINF_BITS(pmipi_rx, MIPI_RX_WRAPPER80_CSI0B,
> +			    CSR_CSI_RST_MODE, 0);
> +	/* ANA power on */
> +	SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +		    RG_CSI0A_BG_CORE_EN, 1);
> +	if (is_4d1c(port))
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			    RG_CSI0B_BG_CORE_EN, 1);
> +	usleep_range(20, 40);
> +	SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +		    RG_CSI0A_BG_LPF_EN, 1);
> +	if (is_4d1c(port))
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			    RG_CSI0B_BG_LPF_EN, 1);
> +
> +	udelay(1);
> +	/* 4d1c: MIPIRX_CONFIG_CSI_BASE = 0xC9000000; */
> +	if (is_4d1c(port)) {
> +		SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> +			    CSI0_BIST_LN0_MUX, 1);
> +		SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> +			    CSI0_BIST_LN1_MUX, 2);
> +		SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> +			    CSI0_BIST_LN2_MUX, 0);
> +		SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> +			    CSI0_BIST_LN3_MUX, 3);
> +	} else { /* 2d1c: MIPIRX_CONFIG_CSI_BASE = 0xE4000000; */
> +		SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> +			    CSI0_BIST_LN0_MUX, 0);
> +		SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> +			    CSI0_BIST_LN1_MUX, 1);
> +		SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> +			    CSI0_BIST_LN2_MUX, 2);
> +		SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> +			    CSI0_BIST_LN3_MUX, 3);
> +	}
> +}
> +
> +static void mtk_seninf_set_csi_mipi(struct mtk_seninf *priv,
> +				    unsigned int seninf)
> +{
> +	void __iomem *seninf_base = priv->base;
> +	void __iomem *pseninf = priv->base + 0x1000 * seninf;
> +	unsigned int dpcm = mtk_seninf_get_dpcm(priv);
> +	unsigned int data_lane_num = priv->sensor[priv->port].num_data_lanes;
> +	unsigned int cal_sel;
> +	unsigned int data_header_order = 1;
> +	unsigned int val = 0;
> +
> +	dev_dbg(priv->dev, "IS_4D1C %d port %d\n",
> +		is_4d1c(priv->port), priv->port);
> +
> +	switch (priv->port) {
> +	case CFG_CSI_PORT_1:
> +		cal_sel = 1;
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI1,
> +			    DPHY_MODE, 0);
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI1,
> +			    CK_SEL_1, 2);
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI1,
> +			    PHY_SENINF_LANE_MUX_CSI1_EN, 1);
> +		break;
> +	case CFG_CSI_PORT_2:
> +		cal_sel = 2;
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI2,
> +			    DPHY_MODE, 0);
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI2,
> +			    CK_SEL_1, 2);
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI2,
> +			    PHY_SENINF_LANE_MUX_CSI2_EN, 1);
> +		break;
> +	case CFG_CSI_PORT_0:
> +		cal_sel = 0;
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> +			    DPHY_MODE, 0);
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> +			    CK_SEL_1, 2);
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> +			    PHY_SENINF_LANE_MUX_CSI0_EN, 1);
> +		break;
> +	case CFG_CSI_PORT_0A:
> +	case CFG_CSI_PORT_0B:
> +		cal_sel = 0;
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> +			    DPHY_MODE, 1);
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> +			    CK_SEL_1, 1);
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> +			    CK_SEL_2, 1);
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> +			    PHY_SENINF_LANE_MUX_CSI0_EN, 1);
> +		break;
> +	}
> +
> +	/* First Enable Sensor interface and select pad (0x1a04_0200) */
> +	SENINF_BITS(pseninf, SENINF1_CTRL, SENINF_EN, 1);
> +	SENINF_BITS(pseninf, SENINF1_CTRL, PAD2CAM_DATA_SEL, PAD_10BIT);
> +	SENINF_BITS(pseninf, SENINF1_CTRL, SENINF_SRC_SEL, 0);
> +	SENINF_BITS(pseninf, SENINF1_CTRL_EXT, SENINF_CSI2_IP_EN, 1);
> +	SENINF_BITS(pseninf, SENINF1_CTRL_EXT, SENINF_NCSI2_IP_EN, 0);
> +
> +	mtk_seninf_set_dphy(priv, seninf);
> +
> +	/* DPCM Enable */
> +	val = 1 << ((dpcm == 0x2a) ? 15 : ((dpcm & 0xF) + 7));
> +	writel(val, pseninf + SENINF1_CSI2_DPCM);
> +
> +	/* Settle delay */
> +	SENINF_BITS(pseninf, SENINF1_CSI2_LNRD_TIMING,
> +		    DATA_SETTLE_PARAMETER, SENINF_SETTLE_DELAY);
> +	/* CSI2 control */
> +	val = readl(pseninf + SENINF1_CSI2_CTL) | (data_header_order << 16) |
> +		0x10 | ((1 << data_lane_num) - 1);
> +	writel(val, pseninf + SENINF1_CSI2_CTL);
> +
> +	SENINF_BITS(pseninf, SENINF1_CSI2_RESYNC_MERGE_CTL,
> +		    BYPASS_LANE_RESYNC, 0);
> +	SENINF_BITS(pseninf, SENINF1_CSI2_RESYNC_MERGE_CTL, CDPHY_SEL, 0);
> +	SENINF_BITS(pseninf, SENINF1_CSI2_RESYNC_MERGE_CTL,
> +		    CPHY_LANE_RESYNC_CNT, 3);
> +	SENINF_BITS(pseninf, SENINF1_CSI2_MODE, CSR_CSI2_MODE, 0);
> +	SENINF_BITS(pseninf, SENINF1_CSI2_MODE, CSR_CSI2_HEADER_LEN, 0);
> +	SENINF_BITS(pseninf, SENINF1_CSI2_DPHY_SYNC, SYNC_SEQ_MASK_0, 0xff00);
> +	SENINF_BITS(pseninf, SENINF1_CSI2_DPHY_SYNC, SYNC_SEQ_PAT_0, 0x001d);
> +
> +	SENINF_BITS(pseninf, SENINF1_CSI2_CTL, CLOCK_HS_OPTION, 0);
> +	SENINF_BITS(pseninf, SENINF1_CSI2_CTL, HSRX_DET_EN, 0);
> +	SENINF_BITS(pseninf, SENINF1_CSI2_CTL, HS_TRAIL_EN, 1);
> +	SENINF_BITS(pseninf, SENINF1_CSI2_HS_TRAIL, HS_TRAIL_PARAMETER,
> +		    SENINF_HS_TRAIL_PARAMETER);
> +
> +	/* Set debug port to output packet number */
> +	writel(0x8000001A, pseninf + SENINF1_CSI2_DGB_SEL);

A define for 0x8000001A would be better

> +	/* Enable CSI2 IRQ mask */
> +	/* Turn on all interrupt */
> +	writel(0xffffffff, pseninf + SENINF1_CSI2_INT_EN);
> +	/* Write clear CSI2 IRQ */
> +	writel(0xffffffff, pseninf + SENINF1_CSI2_INT_STATUS);
> +	/* Enable CSI2 Extend IRQ mask */
> +	/* Turn on all interrupt */
> +	SENINF_BITS(pseninf, SENINF1_CTRL, CSI2_SW_RST, 1);
> +	udelay(1);
> +	SENINF_BITS(pseninf, SENINF1_CTRL, CSI2_SW_RST, 0);
> +}
> +
> +static int mtk_seninf_power_on(struct mtk_seninf *priv)
> +{
> +	void __iomem *pseninf = priv->base;
> +	struct device *dev = priv->dev;
> +	int seninf;
> +	int ret;
> +
> +	seninf = mtk_seninf_csi_port_to_seninf(priv->port);
> +	if (seninf < 0) {
> +		dev_err(dev, "seninf port mapping fail\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = pm_runtime_get_sync(priv->dev);
> +	if (ret < 0) {
> +		dev_err(priv->dev, "Failed to pm_runtime_get_sync: %d\n", ret);
> +		pm_runtime_put_noidle(priv->dev);
> +		return ret;
> +	}
> +
> +	/* Configure timestamp */
> +	SENINF_BITS(pseninf, SENINF1_CTRL, SENINF_EN, 1);
> +	SENINF_BITS(pseninf, SENINF1_CTRL_EXT, SENINF_CSI2_IP_EN, 1);
> +	writel(SENINF_TIMESTAMP_STEP, pseninf + SENINF_TG1_TM_STP);
> +
> +	mtk_seninf_set_csi_mipi(priv, (unsigned int)seninf);
> +
> +	mtk_seninf_set_mux(priv, (unsigned int)seninf);
> +
> +	writel(0x0, pseninf + SENINF_TOP_CAM_MUX_CTRL);
> +
> +	return 0;
> +}
> +
> +static void mtk_seninf_power_off(struct mtk_seninf *priv)
> +{
> +	void __iomem *pmipi_rx = priv->csi2_rx[priv->port];
> +	unsigned int seninf = mtk_seninf_csi_port_to_seninf(priv->port);
> +	void __iomem *pseninf = priv->base + 0x1000 * seninf;
> +
> +	/* Disable CSI2(2.5G) first */
> +	writel(readl(pseninf + SENINF1_CSI2_CTL) & 0xFFFFFFE0,
> +		pseninf + SENINF1_CSI2_CTL);
> +	/* Disable mipi BG */
> +	switch (priv->port) {
> +	case CFG_CSI_PORT_0A:
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			    RG_CSI0A_BG_CORE_EN, 0);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			    RG_CSI0A_BG_LPF_EN, 0);
> +		break;
> +	case CFG_CSI_PORT_0B:
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			    RG_CSI0B_BG_CORE_EN, 0);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			    RG_CSI0B_BG_LPF_EN, 0);
> +		break;
> +	default:
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			    RG_CSI0A_BG_CORE_EN, 0);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			    RG_CSI0A_BG_LPF_EN, 0);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			    RG_CSI0B_BG_CORE_EN, 0);
> +		SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			    RG_CSI0B_BG_LPF_EN, 0);
> +		break;
> +	}
> +
> +	pm_runtime_put(priv->dev);
> +}
> +
> +static const struct v4l2_mbus_framefmt mtk_seninf_default_fmt = {
> +	.code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +	.width = DEFAULT_WIDTH,
> +	.height = DEFAULT_HEIGHT,
> +	.field = V4L2_FIELD_NONE,
> +	.colorspace = V4L2_COLORSPACE_SRGB,
> +	.xfer_func = V4L2_XFER_FUNC_DEFAULT,
> +	.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
> +	.quantization = V4L2_QUANTIZATION_DEFAULT,
> +};
> +
> +static void init_fmt(struct mtk_seninf *priv)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < NUM_PADS; i++)
> +		priv->fmt[i].format = mtk_seninf_default_fmt;
> +}
> +
> +static int seninf_init_cfg(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_pad_config *cfg)
> +{
> +	struct v4l2_mbus_framefmt *mf;
> +	unsigned int i;
> +
> +	for (i = 0; i < sd->entity.num_pads; i++) {
> +		mf = v4l2_subdev_get_try_format(sd, cfg, i);
> +		*mf = mtk_seninf_default_fmt;
> +	}
> +
> +	return 0;
> +}
> +
> +static int seninf_set_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_pad_config *cfg,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	struct mtk_seninf *priv = sd_to_mtk_seninf(sd);
> +
> +	if (fmt->format.code == ~0U || fmt->format.code == 0)
> +		fmt->format.code = MEDIA_BUS_FMT_SBGGR10_1X10;

Shouldn't you check if the other formats are valid as well?

> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
> +	} else {
> +		priv->fmt[fmt->pad].pad = fmt->pad;
> +		priv->fmt[fmt->pad].format.code = fmt->format.code;
> +		priv->fmt[fmt->pad].format.width = fmt->format.width;
> +		priv->fmt[fmt->pad].format.height = fmt->format.height;
> +	}

I think you should do a *fmt = fmt[fmt->pad] (also for the try part), otherwise
userspace will think it can modify the other fields (quantization, colorspace, etc).

> +
> +	return 0;
> +}
> +
> +static int seninf_get_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_pad_config *cfg,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	struct mtk_seninf *priv = sd_to_mtk_seninf(sd);
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> +		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> +	else
> +		fmt->format = priv->fmt[fmt->pad].format;
> +
> +	return 0;
> +}
> +
> +static int seninf_enum_mbus_code(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_pad_config *cfg,
> +				 struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct mtk_seninf *priv = sd_to_mtk_seninf(sd);
> +
> +	code->code = priv->fmt[code->index].format.code;

You should check if index is valid, and return -EINVAL if it is not.

> +
> +	return 0;
> +}
> +
> +static int seninf_s_stream(struct v4l2_subdev *sd, int on)
> +{
> +	struct mtk_seninf *priv = sd_to_mtk_seninf(sd);
> +
> +	if (on)
> +		return mtk_seninf_power_on(priv);
> +	mtk_seninf_power_off(priv);
> +
> +	return 0;
> +};
> +
> +static const struct v4l2_subdev_pad_ops seninf_subdev_pad_ops = {
> +	.link_validate = v4l2_subdev_link_validate_default,
> +	.init_cfg = seninf_init_cfg,
> +	.set_fmt = seninf_set_fmt,
> +	.get_fmt = seninf_get_fmt,
> +	.enum_mbus_code = seninf_enum_mbus_code,
> +};
> +
> +static const struct v4l2_subdev_video_ops seninf_subdev_video_ops = {
> +	.s_stream = seninf_s_stream,
> +};
> +
> +static struct v4l2_subdev_core_ops seninf_subdev_core_ops = {
> +	.subscribe_event    = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event	= v4l2_event_subdev_unsubscribe,
> +};
> +
> +static struct v4l2_subdev_ops seninf_subdev_ops = {
> +	.core	= &seninf_subdev_core_ops,
> +	.video	= &seninf_subdev_video_ops,
> +	.pad	= &seninf_subdev_pad_ops,
> +};
> +
> +static int seninf_link_setup(struct media_entity *entity,
> +			     const struct media_pad *local,
> +			     const struct media_pad *remote, u32 flags)
> +{
> +	struct v4l2_subdev *sd;
> +	struct mtk_seninf *priv;
> +	struct device *dev;
> +
> +	sd = media_entity_to_v4l2_subdev(entity);
> +	priv = v4l2_get_subdevdata(sd);
> +	dev = priv->dev;
> +

You can simplify the checks below adding here:
if (!(flags & MEDIA_LNK_FL_ENABLED))
    return 0;

> +	if ((local->flags & MEDIA_PAD_FL_SOURCE) &&
> +	    (flags & MEDIA_LNK_FL_ENABLED))
> +		priv->mux_sel = local->index - CAM_MUX_IDX_MIN;
> +
> +	if ((local->flags & MEDIA_PAD_FL_SINK) &&
> +	    (flags & MEDIA_LNK_FL_ENABLED)) {

If a pad is sink, then it is not a source (afaik), then you can use an if/else condition.

> +		/* Select port */
> +		priv->port = local->index;
> +		if (priv->port >= NUM_SENSORS) {
> +			dev_err(dev, "port index is over number of ports\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;

Shouldn't you check if there is already a link enabled?

If I understand correct only a link from the source pads and a link to the sink pads
can be enabled at a time, no?

> +}
> +
> +static const struct media_entity_operations seninf_media_ops = {
> +	.link_setup = seninf_link_setup,
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
> +struct sensor_async_subdev {
> +	struct v4l2_async_subdev asd;
> +	u32 port;
> +	u32 lanes;
> +};
> +
> +static int mtk_seninf_notifier_bound(
> +			struct v4l2_async_notifier *notifier,
> +			struct v4l2_subdev *sd,
> +			struct v4l2_async_subdev *asd)
> +{
> +	struct mtk_seninf *priv =
> +		container_of(notifier, struct mtk_seninf, notifier);
> +	struct sensor_async_subdev *s_asd =
> +		container_of(asd, struct sensor_async_subdev, asd);
> +	int ret;
> +
> +	dev_dbg(priv->dev, "%s bound with port:%d lanes: %d\n",
> +		sd->entity.name, s_asd->port, s_asd->lanes);
> +
> +	priv->sensor[s_asd->port].num_data_lanes = s_asd->lanes;
> +
> +	ret = media_create_pad_link(&sd->entity, 0, &priv->subdev.entity,
> +				    s_asd->port, 0);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to create link for %s\n",
> +			sd->entity.name);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_async_notifier_operations mtk_seninf_async_ops = {
> +	.bound = mtk_seninf_notifier_bound,
> +};
> +
> +static int mtk_seninf_fwnode_parse(struct device *dev,
> +				   struct v4l2_fwnode_endpoint *vep,
> +				   struct v4l2_async_subdev *asd)
> +{
> +	struct sensor_async_subdev *s_asd =
> +			container_of(asd, struct sensor_async_subdev, asd);
> +
> +	if (vep->bus_type != V4L2_MBUS_CSI2_DPHY) {
> +		dev_err(dev, "Only CSI2 bus type is currently supported\n");
> +		return -EINVAL;
> +	}
> +
> +	s_asd->port = vep->base.port;
> +	s_asd->lanes = vep->bus.mipi_csi2.num_data_lanes;
> +
> +	return 0;
> +}
> +
> +static int seninf_dump_debug_info(struct mtk_seninf *priv)
> +{
> +	void __iomem *pseninf = priv->base;
> +	struct device *dev = priv->dev;
> +
> +	/* Sensor Interface Control */
> +	dev_dbg(dev,
> +		"SENINF_CSI2_CTL SENINF1:0x%x, 2:0x%x, 3:0x%x, 5:0x%x\n",
> +		readl(pseninf + SENINF1_CSI2_CTL),
> +		readl(pseninf + SENINF2_CSI2_CTL),
> +		readl(pseninf + SENINF3_CSI2_CTL),
> +		readl(pseninf + SENINF5_CSI2_CTL));
> +	/* Read width/height */
> +	/* Read interrupt status */
> +	dev_dbg(dev, "SENINF1_IRQ:0x%x, 2:0x%x, 3:0x%x, 5:0x%x\n",
> +		readl(pseninf + SENINF1_CSI2_INT_STATUS),
> +		readl(pseninf + SENINF2_CSI2_INT_STATUS),
> +		readl(pseninf + SENINF3_CSI2_INT_STATUS),
> +		readl(pseninf + SENINF5_CSI2_INT_STATUS));
> +	/* Mux1 */
> +	dev_dbg(dev, "SENINF1_MUX_CTRL:0x%x, INTSTA:0x%x, DEBUG_2(0x%x)\n",
> +		readl(pseninf + SENINF1_MUX_CTRL),
> +		readl(pseninf + SENINF1_MUX_INTSTA),
> +		readl(pseninf + SENINF1_MUX_DEBUG_2));
> +	if (readl(pseninf + SENINF1_MUX_INTSTA) & 0x1) {
> +		writel(0xffffffff, pseninf + SENINF1_MUX_INTSTA);
> +		usleep_range(1000, 1000 * 2);
> +		dev_warn(dev, "overrun CTRL:%x INTSTA:%x DEBUG_2:%x\n",
> +			    readl(pseninf + SENINF1_MUX_CTRL),
> +			    readl(pseninf + SENINF1_MUX_INTSTA),
> +			    readl(pseninf + SENINF1_MUX_DEBUG_2));
> +	}
> +
> +	return 0;
> +}
> +
> +static int seninf_enable_test_pattern(struct mtk_seninf *priv)
> +{
> +	void __iomem *pseninf = priv->base;
> +	unsigned int val;
> +
> +	SENINF_BITS(pseninf, SENINF_TOP_CTRL, SENINF1_PCLK_EN, 1);
> +	SENINF_BITS(pseninf, SENINF_TOP_CTRL, SENINF2_PCLK_EN, 1);
> +	SENINF_BITS(pseninf, SENINF1_CTRL, SENINF_EN, 1);
> +	SENINF_BITS(pseninf, SENINF1_CTRL, SENINF_SRC_SEL, 1);
> +	SENINF_BITS(pseninf, SENINF1_MUX_CTRL, SENINF_HSYNC_MASK, 1);
> +	SENINF_BITS(pseninf, SENINF1_MUX_CTRL, SENINF_SRC_SEL, 1);
> +	SENINF_BITS(pseninf, SENINF1_MUX_CTRL, FIFO_PUSH_EN, 0x1f);
> +	SENINF_BITS(pseninf, SENINF1_MUX_CTRL, FIFO_FLUSH_EN, 0x1b);
> +	SENINF_BITS(pseninf, SENINF1_MUX_CTRL, FIFO_FULL_WR_EN, 1);
> +	SENINF_BITS(pseninf, SENINF1_MUX_CTRL, SENINF_MUX_EN, 1);
> +	writel(SENINF_IRQ_CLR_SEL|SENINF_ALL_ERR_IRQ_EN,
> +		    pseninf + SENINF1_MUX_INTEN);
> +	writel(0x0, pseninf + SENINF1_MUX_SPARE);
> +	writel(0xE2000, pseninf + SENINF1_MUX_CTRL_EXT);
> +	writel(0x0, pseninf + SENINF1_MUX_CTRL_EXT);
> +	SENINF_BITS(pseninf, SENINF_TG1_TM_CTL, TM_EN, 1);
> +	SENINF_BITS(pseninf, SENINF_TG1_TM_CTL, TM_PAT, 0xC);
> +	SENINF_BITS(pseninf, SENINF_TG1_TM_CTL, TM_VSYNC, 4);
> +	SENINF_BITS(pseninf, SENINF_TG1_TM_CTL, TM_DUMMYPXL, 4);
> +	val = (priv->fmt[priv->port].format.height + 0x100) << 16 |
> +		  (priv->fmt[priv->port].format.width + 0x100);
> +	writel(val, pseninf + SENINF_TG1_TM_SIZE);
> +	writel(0x0, pseninf + SENINF_TG1_TM_CLK);
> +	writel(0x1, pseninf + SENINF_TG1_TM_STP);
> +	writel(readl(pseninf + SENINF1_CTRL_EXT) | 0x02,
> +		pseninf + SENINF1_CTRL_EXT);
> +
> +	return 0;
> +}
> +
> +static int seninf_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct mtk_seninf *priv = container_of(ctrl->handler,
> +					     struct mtk_seninf, ctrl_handler);
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_TEST_PATTERN:
> +		if (ctrl->val == TEST_GEN_PATTERN)
> +			return seninf_enable_test_pattern(priv);
> +		else if (ctrl->val == TEST_DUMP_DEBUG_INFO)
> +			return seninf_dump_debug_info(priv);
> +		else
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops seninf_ctrl_ops = {
> +	.s_ctrl = seninf_set_ctrl,
> +};
> +
> +static const char * const seninf_test_pattern_menu[] = {
> +	"Horizontal bars",
> +	"Monitor status",
> +};
> +
> +static int seninf_initialize_controls(struct mtk_seninf *priv)
> +{
> +	struct v4l2_ctrl_handler *handler;
> +	int ret;
> +
> +	handler = &priv->ctrl_handler;
> +	ret = v4l2_ctrl_handler_init(handler, 2);
> +	if (ret)
> +		return ret;

A new line here would be nice

> +	v4l2_ctrl_new_std_menu_items(handler, &seninf_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(seninf_test_pattern_menu) - 1,
> +				     0, 0, seninf_test_pattern_menu);
> +
> +	if (handler->error) {
> +		ret = handler->error;
> +		dev_err(priv->dev,
> +			"Failed to init controls(%d)\n", ret);
> +		goto err_free_handler;

you could call
v4l2_ctrl_handler_free(handler);
return ret;

here instead of having this label

> +	}
> +
> +	priv->subdev.ctrl_handler = handler;
> +	return 0;
> +
> +err_free_handler:
> +	v4l2_ctrl_handler_free(handler);
> +
> +	return ret;
> +}
> +
> +static int mtk_seninf_media_register(struct mtk_seninf *priv)
> +{
> +	struct v4l2_subdev *sd = &priv->subdev;
> +	struct media_pad *pads = priv->pads;
> +	struct device *dev = priv->dev;
> +	int i;

unsigned

> +	int ret;
> +
> +	v4l2_subdev_init(sd, &seninf_subdev_ops);
> +
> +	init_fmt(priv);
> +	ret = seninf_initialize_controls(priv);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize controls\n");
> +		return -1;

-EINVAL

> +	}
> +
> +	sd->flags |= (V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS);
> +
> +	priv->subdev.dev = dev;
> +	snprintf(sd->name, V4L2_SUBDEV_NAME_SIZE, "%s",
> +		 dev_name(dev));
> +	v4l2_set_subdevdata(sd, priv);
> +
> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	sd->entity.ops = &seninf_media_ops;
> +
> +	for (i = 0; i < NUM_SENSORS; i++)
> +		pads[i].flags = MEDIA_PAD_FL_SINK;
> +
> +	for (i = CAM_MUX_IDX_MIN; i < NUM_PADS; i++)
> +		pads[i].flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&sd->entity, NUM_PADS, pads);
> +	if (ret < 0)
> +		goto err_free_handler;
> +
> +	v4l2_async_notifier_init(&priv->notifier);
> +
> +	for (i = 0; i < NUM_SENSORS; ++i) {
> +		ret = v4l2_async_notifier_parse_fwnode_endpoints_by_port(dev,
> +			&priv->notifier, sizeof(struct sensor_async_subdev),
> +			i, mtk_seninf_fwnode_parse);

I learned recently that v4l2 fwnode wrappers shouldn't be used, please
see the comment just below this function at https://patchwork.kernel.org/patch/11066527/

> +		if (ret < 0)
> +			goto err_clean_entity;
> +	}
> +
> +	priv->subdev.subdev_notifier = &priv->notifier;
> +	priv->notifier.ops = &mtk_seninf_async_ops;
> +	ret = v4l2_async_subdev_notifier_register(sd, &priv->notifier);
> +	if (ret < 0) {
> +		dev_err(dev, "v4l2 async notifier register failed\n");
> +		goto err_clean_notififer;
> +	}
> +
> +	ret = v4l2_async_register_subdev(sd);
> +	if (ret < 0) {
> +		dev_err(dev, "v4l2 async register subdev failed\n");
> +		goto err_clean_notififer;
> +	}
> +	return 0;
> +
> +err_clean_notififer:
> +	v4l2_async_notifier_cleanup(&priv->notifier);
> +err_clean_entity:
> +	media_entity_cleanup(&sd->entity);
> +err_free_handler:
> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
> +
> +	return ret;
> +}
> +
> +static int seninf_probe(struct platform_device *pdev)
> +{
> +	/* List of clocks required by seninf */
> +	static const char * const clk_names[] = {
> +		"CLK_CAM_SENINF", "CLK_TOP_MUX_SENINF"
> +	};
> +	struct resource *res;
> +	struct mtk_seninf *priv;
> +	struct device *dev = &pdev->dev;
> +	int i, ret;

unsigned int i

> +
> +	priv = devm_kzalloc(dev, sizeof(struct mtk_seninf), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, priv);
> +	priv->dev = dev;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	priv->base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	priv->rx = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->rx))
> +		return PTR_ERR(priv->rx);
> +
> +	priv->csi2_rx[CFG_CSI_PORT_0]  = priv->rx;
> +	priv->csi2_rx[CFG_CSI_PORT_0A] = priv->rx + CSI_PORT_0A_ADDR_OFST;
> +	priv->csi2_rx[CFG_CSI_PORT_0B] = priv->rx + CSI_PORT_0B_ADDR_OFST;
> +	priv->csi2_rx[CFG_CSI_PORT_1]  = priv->rx + CSI_PORT_1_ADDR_OFST;
> +	priv->csi2_rx[CFG_CSI_PORT_2]  = priv->rx + CSI_PORT_2_ADDR_OFST;
> +
> +	priv->num_clks = ARRAY_SIZE(clk_names);
> +	priv->clks = devm_kcalloc(dev, priv->num_clks,
> +				  sizeof(*priv->clks), GFP_KERNEL);
> +	if (!priv->clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < priv->num_clks; ++i)
> +		priv->clks[i].id = clk_names[i];
> +
> +	ret = devm_clk_bulk_get(dev, priv->num_clks, priv->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to get seninf clock:%d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mtk_seninf_media_register(priv);
> +	if (!ret) /* register success */
> +		pm_runtime_enable(dev);
> +
> +	return ret;
> +}
> +
> +static int seninf_pm_suspend(struct device *dev)
> +{
> +	struct mtk_seninf *priv = dev_get_drvdata(dev);
> +
> +	dev_dbg(dev, "seninf runtime suspend\n");
> +	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
> +
> +	return 0;
> +}
> +
> +static int seninf_pm_resume(struct device *dev)
> +{
> +	struct mtk_seninf *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	dev_dbg(dev, "seninf runtime resume\n");
> +	ret = clk_bulk_prepare_enable(priv->num_clks, priv->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clock:%d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops runtime_pm_ops = {
> +	SET_RUNTIME_PM_OPS(seninf_pm_suspend, seninf_pm_resume, NULL)
> +};
> +
> +static int seninf_remove(struct platform_device *pdev)
> +{
> +	struct mtk_seninf *priv = dev_get_drvdata(&pdev->dev);
> +	struct v4l2_subdev *subdev = &priv->subdev;
> +
> +	media_entity_cleanup(&subdev->entity);
> +	v4l2_async_unregister_subdev(subdev);
> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
> +
> +	pm_runtime_disable(priv->dev);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id mtk_seninf_of_match[] = {
> +	{.compatible = "mediatek,mt8183-seninf"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_seninf_of_match);
> +#endif
> +
> +static struct platform_driver seninf_pdrv = {
> +	.driver	= {
> +		.name	= "seninf",
> +		.pm  = &runtime_pm_ops,
> +		.of_match_table = of_match_ptr(mtk_seninf_of_match),
> +	},
> +	.probe	= seninf_probe,
> +	.remove	= seninf_remove,
> +};
> +
> +module_platform_driver(seninf_pdrv);
> +
> +MODULE_DESCRIPTION("MTK sensor interface driver");
> +MODULE_AUTHOR("Louis Kuo <louis.kuo@mediatek.com>");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_def.h b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_def.h
> new file mode 100644
> index 000000000000..b59ad5bf2470
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_def.h

Definitions here seems to be used only in mtk_seninf.c right? You can move all this
to mtk_seninf.c file and remove this header.

> @@ -0,0 +1,72 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __SENINF_DRV_DEF_H__
> +#define __SENINF_DRV_DEF_H__
> +
> +#define SENINF_TIMESTAMP_STEP		0x67
> +#define SENINF_SETTLE_DELAY		0x15
> +#define SENINF_HS_TRAIL_PARAMETER	0x8
> +
> +#define NUM_PADS			12
> +#define NUM_SENSORS			4

I was wondering if you could have several sensors per port.

> +#define CAM_MUX_IDX_MIN		NUM_SENSORS
> +#define DEFAULT_WIDTH			1600
> +#define DEFAULT_HEIGHT			1200
> +
> +#define PAD_10BIT			0
> +
> +#define TEST_MODEL          0
> +#define NORMAL_MODEL        1
> +
> +#define CSI_PORT_0A_ADDR_OFST	0
> +#define CSI_PORT_0B_ADDR_OFST	0x1000
> +#define CSI_PORT_1_ADDR_OFST	0x2000
> +#define CSI_PORT_2_ADDR_OFST	0x4000
> +
> +#define SENINF_ALL_ERR_IRQ_EN	0x7F
> +#define SENINF_IRQ_CLR_SEL	0x80000000
> +
> +#define MIPI_SENSOR			0x8
> +
> +enum {
> +	TEST_GEN_PATTERN = 0x0,
> +	TEST_DUMP_DEBUG_INFO,
> +};

it would be better to name enums (better yet with docs).
same comments for the enums below.

> +
> +enum {
> +	CFG_CSI_PORT_0 = 0x0,	/* 4D1C */
> +	CFG_CSI_PORT_1,		/* 4D1C */
> +	CFG_CSI_PORT_2,		/* 4D1C */
> +	CFG_CSI_PORT_0A,	/* 2D1C */
> +	CFG_CSI_PORT_0B,	/* 2D1C */
> +	CFG_CSI_PORT_MAX_NUM,
> +	CFG_CSI_PORT_NONE	/*for non-MIPI sensor */
> +};
> +
> +enum {
> +	ONE_PIXEL_MODE  = 0x0,
> +	TWO_PIXEL_MODE  = 0x1,
> +	FOUR_PIXEL_MODE = 0x2,
> +};
> +
> +enum {
> +	SENINF_1 = 0x0,
> +	SENINF_2 = 0x1,
> +	SENINF_3 = 0x2,
> +	SENINF_4 = 0x3,
> +	SENINF_5 = 0x4,
> +	SENINF_NUM,
> +};
> +
> +enum {
> +	RAW_8BIT_FMT        = 0x0,
> +	RAW_10BIT_FMT       = 0x1,
> +	RAW_12BIT_FMT       = 0x2,
> +	YUV422_FMT          = 0x3,
> +	RAW_14BIT_FMT       = 0x4,
> +	RGB565_MIPI_FMT     = 0x5,
> +	RGB888_MIPI_FMT     = 0x6,
> +	JPEG_FMT            = 0x7
> +};
> +
> +#endif /*__SENINF_DRV_DEF_H__ */
> diff --git a/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_reg.h b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_reg.h
> new file mode 100644
> index 000000000000..ffa28e56143f
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_reg.h
> @@ -0,0 +1,7747 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __SENINF_REG_H__
> +#define __SENINF_REG_H__
> +
> +#define MIPI_RX_ANA00_CSI0A                                    0x0000
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_CPHY_EN_SHIFT 0
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_CPHY_EN_MASK (0x1 << 0)

You can use the BIT(b) macro.
Same comment for the others values below.

I would also add a prefix to all these macros MTK_SENINF_

It would be nice to align the values in the same tabulation.

> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_EQ_PROTECT_EN_SHIFT 1
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_EQ_PROTECT_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_BG_LPF_EN_SHIFT 2
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_BG_LPF_EN_MASK (0x1 << 2)
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_BG_CORE_EN_SHIFT 3
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_BG_CORE_EN_MASK (0x1 << 3)
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L0_CKMODE_EN_SHIFT 5
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L0_CKMODE_EN_MASK (0x1 << 5)
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L0_CKSEL_SHIFT 6
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L0_CKSEL_MASK (0x1 << 6)
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L1_CKMODE_EN_SHIFT 8
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L1_CKMODE_EN_MASK (0x1 << 8)
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L1_CKSEL_SHIFT 9
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L1_CKSEL_MASK (0x1 << 9)
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L2_CKMODE_EN_SHIFT 11
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L2_CKMODE_EN_MASK (0x1 << 11)
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L2_CKSEL_SHIFT 12
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L2_CKSEL_MASK (0x1 << 12)
> +#define MIPI_RX_ANA04_CSI0A                                    0x0004
> +#define MIPI_RX_ANA04_CSI0A_RG_CSI0A_BG_LPRX_VTH_SEL_SHIFT 0
> +#define MIPI_RX_ANA04_CSI0A_RG_CSI0A_BG_LPRX_VTH_SEL_MASK (0x7 << 0)
> +#define MIPI_RX_ANA04_CSI0A_RG_CSI0A_BG_LPRX_VTL_SEL_SHIFT 4
> +#define MIPI_RX_ANA04_CSI0A_RG_CSI0A_BG_LPRX_VTL_SEL_MASK (0x7 << 4)
> +#define MIPI_RX_ANA04_CSI0A_RG_CSI0A_BG_HSDET_VTH_SEL_SHIFT 8
> +#define MIPI_RX_ANA04_CSI0A_RG_CSI0A_BG_HSDET_VTH_SEL_MASK (0x7 << 8)
> +#define MIPI_RX_ANA04_CSI0A_RG_CSI0A_BG_HSDET_VTL_SEL_SHIFT 12
> +#define MIPI_RX_ANA04_CSI0A_RG_CSI0A_BG_HSDET_VTL_SEL_MASK (0x7 << 12)
> +#define MIPI_RX_ANA04_CSI0A_RG_CSI0A_BG_VREF_SEL_SHIFT 16
> +#define MIPI_RX_ANA04_CSI0A_RG_CSI0A_BG_VREF_SEL_MASK (0xf << 16)
> +#define MIPI_RX_ANA04_CSI0A_RG_CSI0A_BG_MON_VREF_SEL_SHIFT 24
> +#define MIPI_RX_ANA04_CSI0A_RG_CSI0A_BG_MON_VREF_SEL_MASK (0xf << 24)
> +#define MIPI_RX_ANA04_CSI0A_RG_CSI0A_FORCE_HSRT_EN_SHIFT 28
> +#define MIPI_RX_ANA04_CSI0A_RG_CSI0A_FORCE_HSRT_EN_MASK (0x1 << 28)
> +#define MIPI_RX_ANA08_CSI0A                                    0x0008
> +#define MIPI_RX_ANA08_CSI0A_RG_CSI0A_L0P_T0A_HSRT_CODE_SHIFT 0
> +#define MIPI_RX_ANA08_CSI0A_RG_CSI0A_L0P_T0A_HSRT_CODE_MASK (0x1f << 0)
> +#define MIPI_RX_ANA08_CSI0A_RG_CSI0A_L0N_T0B_HSRT_CODE_SHIFT 8
> +#define MIPI_RX_ANA08_CSI0A_RG_CSI0A_L0N_T0B_HSRT_CODE_MASK (0x1f << 8)
> +#define MIPI_RX_ANA08_CSI0A_RG_CSI0A_L1P_T0C_HSRT_CODE_SHIFT 16
> +#define MIPI_RX_ANA08_CSI0A_RG_CSI0A_L1P_T0C_HSRT_CODE_MASK (0x1f << 16)
> +#define MIPI_RX_ANA08_CSI0A_RG_CSI0A_L1N_T1A_HSRT_CODE_SHIFT 24
> +#define MIPI_RX_ANA08_CSI0A_RG_CSI0A_L1N_T1A_HSRT_CODE_MASK (0x1f << 24)
> +#define MIPI_RX_ANA0C_CSI0A                                    0x000C
> +#define MIPI_RX_ANA0C_CSI0A_RG_CSI0A_L2P_T1B_HSRT_CODE_SHIFT 0
> +#define MIPI_RX_ANA0C_CSI0A_RG_CSI0A_L2P_T1B_HSRT_CODE_MASK (0x1f << 0)
> +#define MIPI_RX_ANA0C_CSI0A_RG_CSI0A_L2N_T1C_HSRT_CODE_SHIFT 8
> +#define MIPI_RX_ANA0C_CSI0A_RG_CSI0A_L2N_T1C_HSRT_CODE_MASK (0x1f << 8)
> +#define MIPI_RX_ANA10_CSI0A                                    0x0010
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_DPHY_L0_DELAYCAL_EN_SHIFT 0
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_DPHY_L0_DELAYCAL_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_DPHY_L0_DELAYCAL_RSTB_SHIFT 1
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_DPHY_L0_DELAYCAL_RSTB_MASK (0x1 << 1)
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_DPHY_L0_VREF_SEL_SHIFT 2
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_DPHY_L0_VREF_SEL_MASK (0x3f << 2)
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_DPHY_L1_DELAYCAL_EN_SHIFT 8
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_DPHY_L1_DELAYCAL_EN_MASK (0x1 << 8)
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_DPHY_L1_DELAYCAL_RSTB_SHIFT 9
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_DPHY_L1_DELAYCAL_RSTB_MASK (0x1 << 9)
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_DPHY_L1_VREF_SEL_SHIFT 10
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_DPHY_L1_VREF_SEL_MASK (0x3f << 10)
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_DPHY_L2_DELAYCAL_EN_SHIFT 16
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_DPHY_L2_DELAYCAL_EN_MASK (0x1 << 16)
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_DPHY_L2_DELAYCAL_RSTB_SHIFT 17
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_DPHY_L2_DELAYCAL_RSTB_MASK (0x1 << 17)
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_DPHY_L2_VREF_SEL_SHIFT 18
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_DPHY_L2_VREF_SEL_MASK (0x3f << 18)
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_CPHY_T0_CDR_DELAYCAL_EN_SHIFT 24
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_CPHY_T0_CDR_DELAYCAL_EN_MASK (0x1 << 24)
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_CPHY_T0_CDR_DELAYCAL_RSTB_SHIFT 25
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_CPHY_T0_CDR_DELAYCAL_RSTB_MASK (0x1 << 25)
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_CPHY_T0_VREF_SEL_SHIFT 26
> +#define MIPI_RX_ANA10_CSI0A_RG_CSI0A_CPHY_T0_VREF_SEL_MASK (0x3f << 26)
> +#define MIPI_RX_ANA14_CSI0A                                    0x0014
> +#define MIPI_RX_ANA14_CSI0A_RG_CSI0A_CPHY_T1_CDR_DELAYCAL_EN_SHIFT 0
> +#define MIPI_RX_ANA14_CSI0A_RG_CSI0A_CPHY_T1_CDR_DELAYCAL_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA14_CSI0A_RG_CSI0A_CPHY_T1_CDR_DELAYCAL_RSTB_SHIFT 1
> +#define MIPI_RX_ANA14_CSI0A_RG_CSI0A_CPHY_T1_CDR_DELAYCAL_RSTB_MASK (0x1 << 1)
> +#define MIPI_RX_ANA14_CSI0A_RG_CSI0A_CPHY_T1_VREF_SEL_SHIFT 2
> +#define MIPI_RX_ANA14_CSI0A_RG_CSI0A_CPHY_T1_VREF_SEL_MASK (0x3f << 2)
> +#define MIPI_RX_ANA18_CSI0A                                    0x0018
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_L0_T0AB_EQ_OS_CAL_EN_SHIFT 0
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_L0_T0AB_EQ_OS_CAL_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_L0_T0AB_EQ_MON_EN_SHIFT 1
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_L0_T0AB_EQ_MON_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_L0_T0AB_EQ_SCA_SHIFT 2
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_L0_T0AB_EQ_SCA_MASK (0x1 << 2)
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_L0_T0AB_EQ_SCB_SHIFT 3
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_L0_T0AB_EQ_SCB_MASK (0x1 << 3)
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_L0_T0AB_EQ_IS_SHIFT 4
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_L0_T0AB_EQ_IS_MASK (0x3 << 4)
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_L0_T0AB_EQ_BW_SHIFT 6
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_L0_T0AB_EQ_BW_MASK (0x3 << 6)
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_L0_T0AB_EQ_SRA_SHIFT 8
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_L0_T0AB_EQ_SRA_MASK (0xf << 8)
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_L0_T0AB_EQ_SRB_SHIFT 12
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_L0_T0AB_EQ_SRB_MASK (0xf << 12)
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_XX_T0CA_EQ_OS_CAL_EN_SHIFT 16
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_XX_T0CA_EQ_OS_CAL_EN_MASK (0x1 << 16)
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_XX_T0CA_EQ_MON_EN_SHIFT 17
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_XX_T0CA_EQ_MON_EN_MASK (0x1 << 17)
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_XX_T0CA_EQ_SCA_SHIFT 18
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_XX_T0CA_EQ_SCA_MASK (0x1 << 18)
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_XX_T0CA_EQ_SCB_SHIFT 19
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_XX_T0CA_EQ_SCB_MASK (0x1 << 19)
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_XX_T0CA_EQ_IS_SHIFT 20
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_XX_T0CA_EQ_IS_MASK (0x3 << 20)
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_XX_T0CA_EQ_BW_SHIFT 22
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_XX_T0CA_EQ_BW_MASK (0x3 << 22)
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_XX_T0CA_EQ_SRA_SHIFT 24
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_XX_T0CA_EQ_SRA_MASK (0xf << 24)
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_XX_T0CA_EQ_SRB_SHIFT 28
> +#define MIPI_RX_ANA18_CSI0A_RG_CSI0A_XX_T0CA_EQ_SRB_MASK (0xf << 28)
> +#define MIPI_RX_ANA1C_CSI0A                                    0x001C
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_XX_T0BC_EQ_OS_CAL_EN_SHIFT 0
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_XX_T0BC_EQ_OS_CAL_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_XX_T0BC_EQ_MON_EN_SHIFT 1
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_XX_T0BC_EQ_MON_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_XX_T0BC_EQ_SCA_SHIFT 2
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_XX_T0BC_EQ_SCA_MASK (0x1 << 2)
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_XX_T0BC_EQ_SCB_SHIFT 3
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_XX_T0BC_EQ_SCB_MASK (0x1 << 3)
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_XX_T0BC_EQ_IS_SHIFT 4
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_XX_T0BC_EQ_IS_MASK (0x3 << 4)
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_XX_T0BC_EQ_BW_SHIFT 6
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_XX_T0BC_EQ_BW_MASK (0x3 << 6)
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_XX_T0BC_EQ_SRA_SHIFT 8
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_XX_T0BC_EQ_SRA_MASK (0xf << 8)
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_XX_T0BC_EQ_SRB_SHIFT 12
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_XX_T0BC_EQ_SRB_MASK (0xf << 12)
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_L1_T1AB_EQ_OS_CAL_EN_SHIFT 16
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_L1_T1AB_EQ_OS_CAL_EN_MASK (0x1 << 16)
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_L1_T1AB_EQ_MON_EN_SHIFT 17
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_L1_T1AB_EQ_MON_EN_MASK (0x1 << 17)
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_L1_T1AB_EQ_SCA_SHIFT 18
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_L1_T1AB_EQ_SCA_MASK (0x1 << 18)
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_L1_T1AB_EQ_SCB_SHIFT 19
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_L1_T1AB_EQ_SCB_MASK (0x1 << 19)
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_L1_T1AB_EQ_IS_SHIFT 20
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_L1_T1AB_EQ_IS_MASK (0x3 << 20)
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_L1_T1AB_EQ_BW_SHIFT 22
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_L1_T1AB_EQ_BW_MASK (0x3 << 22)
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_L1_T1AB_EQ_SRA_SHIFT 24
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_L1_T1AB_EQ_SRA_MASK (0xf << 24)
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_L1_T1AB_EQ_SRB_SHIFT 28
> +#define MIPI_RX_ANA1C_CSI0A_RG_CSI0A_L1_T1AB_EQ_SRB_MASK (0xf << 28)
> +#define MIPI_RX_ANA20_CSI0A                                    0x0020
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_OS_CAL_EN_SHIFT 0
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_OS_CAL_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_MON_EN_SHIFT 1
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_MON_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_SCA_SHIFT 2
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_SCA_MASK (0x1 << 2)
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_SCB_SHIFT 3
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_SCB_MASK (0x1 << 3)
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_IS_SHIFT 4
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_IS_MASK (0x3 << 4)
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_BW_SHIFT 6
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_BW_MASK (0x3 << 6)
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_SRA_SHIFT 8
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_SRA_MASK (0xf << 8)
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_SRB_SHIFT 12
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_SRB_MASK (0xf << 12)
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_OS_CAL_EN_SHIFT 16
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_OS_CAL_EN_MASK (0x1 << 16)
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_MON_EN_SHIFT 17
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_MON_EN_MASK (0x1 << 17)
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_SCA_SHIFT 18
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_SCA_MASK (0x1 << 18)
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_SCB_SHIFT 19
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_SCB_MASK (0x1 << 19)
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_IS_SHIFT 20
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_IS_MASK (0x3 << 20)
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_BW_SHIFT 22
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_BW_MASK (0x3 << 22)
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_SRA_SHIFT 24
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_SRA_MASK (0xf << 24)
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_SRB_SHIFT 28
> +#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_SRB_MASK (0xf << 28)
> +#define MIPI_RX_ANA24_CSI0A                                    0x0024
> +#define MIPI_RX_ANA24_CSI0A_RG_CSI0A_RESERVE_SHIFT 24
> +#define MIPI_RX_ANA24_CSI0A_RG_CSI0A_RESERVE_MASK (0xff << 24)
> +#define MIPI_RX_ANA28_CSI0A                                    0x0028
> +#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_DIRECT_EN_SHIFT 0
> +#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_DIRECT_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_AUTOLOAD_EN_SHIFT 1
> +#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_AUTOLOAD_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_LPF_CTRL_SHIFT 2
> +#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_LPF_CTRL_MASK (0x3 << 2)
> +#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_AB_WIDTH_SHIFT 4
> +#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_AB_WIDTH_MASK (0xf << 4)
> +#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_BC_WIDTH_SHIFT 8
> +#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_BC_WIDTH_MASK (0xf << 8)
> +#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_CA_WIDTH_SHIFT 12
> +#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_CA_WIDTH_MASK (0xf << 12)
> +#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_CK_DELAY_SHIFT 16
> +#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_CK_DELAY_MASK (0xf << 16)
> +#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_HSDET_SEL_SHIFT 20
> +#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_HSDET_SEL_MASK (0x3 << 20)
> +#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_MANUAL_EN_SHIFT 24
> +#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_MANUAL_EN_MASK (0x1 << 24)
> +#define MIPI_RX_ANA2C_CSI0A                                    0x002C
> +#define MIPI_RX_ANA2C_CSI0A_RG_CSI0A_CPHY_T0_CDR_INIT_CODE_SHIFT 0
> +#define MIPI_RX_ANA2C_CSI0A_RG_CSI0A_CPHY_T0_CDR_INIT_CODE_MASK (0x1f << 0)
> +#define MIPI_RX_ANA2C_CSI0A_RG_CSI0A_CPHY_T0_CDR_EARLY_CODE_SHIFT 8
> +#define MIPI_RX_ANA2C_CSI0A_RG_CSI0A_CPHY_T0_CDR_EARLY_CODE_MASK (0x1f << 8)
> +#define MIPI_RX_ANA2C_CSI0A_RG_CSI0A_CPHY_T0_CDR_LATE_CODE_SHIFT 16
> +#define MIPI_RX_ANA2C_CSI0A_RG_CSI0A_CPHY_T0_CDR_LATE_CODE_MASK (0x1f << 16)
> +#define MIPI_RX_ANA34_CSI0A                                    0x0034
> +#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_DIRECT_EN_SHIFT 0
> +#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_DIRECT_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_AUTOLOAD_EN_SHIFT 1
> +#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_AUTOLOAD_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_LPF_CTRL_SHIFT 2
> +#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_LPF_CTRL_MASK (0x3 << 2)
> +#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_AB_WIDTH_SHIFT 4
> +#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_AB_WIDTH_MASK (0xf << 4)
> +#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_BC_WIDTH_SHIFT 8
> +#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_BC_WIDTH_MASK (0xf << 8)
> +#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_CA_WIDTH_SHIFT 12
> +#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_CA_WIDTH_MASK (0xf << 12)
> +#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_CK_DELAY_SHIFT 16
> +#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_CK_DELAY_MASK (0xf << 16)
> +#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_HSDET_SEL_SHIFT 20
> +#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_HSDET_SEL_MASK (0x3 << 20)
> +#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_MANUAL_EN_SHIFT 24
> +#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_MANUAL_EN_MASK (0x1 << 24)
> +#define MIPI_RX_ANA38_CSI0A                                    0x0038
> +#define MIPI_RX_ANA38_CSI0A_RG_CSI0A_CPHY_T1_CDR_INIT_CODE_SHIFT 0
> +#define MIPI_RX_ANA38_CSI0A_RG_CSI0A_CPHY_T1_CDR_INIT_CODE_MASK (0x1f << 0)
> +#define MIPI_RX_ANA38_CSI0A_RG_CSI0A_CPHY_T1_CDR_EARLY_CODE_SHIFT 8
> +#define MIPI_RX_ANA38_CSI0A_RG_CSI0A_CPHY_T1_CDR_EARLY_CODE_MASK (0x1f << 8)
> +#define MIPI_RX_ANA38_CSI0A_RG_CSI0A_CPHY_T1_CDR_LATE_CODE_SHIFT 16
> +#define MIPI_RX_ANA38_CSI0A_RG_CSI0A_CPHY_T1_CDR_LATE_CODE_MASK (0x1f << 16)
> +#define MIPI_RX_ANA40_CSI0A                                    0x0040
> +#define MIPI_RX_ANA40_CSI0A_RG_CSI0A_CPHY_FMCK_SEL_SHIFT 0
> +#define MIPI_RX_ANA40_CSI0A_RG_CSI0A_CPHY_FMCK_SEL_MASK (0x3 << 0)
> +#define MIPI_RX_ANA40_CSI0A_RG_CSI0A_ASYNC_OPTION_SHIFT 4
> +#define MIPI_RX_ANA40_CSI0A_RG_CSI0A_ASYNC_OPTION_MASK (0xf << 4)
> +#define MIPI_RX_ANA40_CSI0A_RG_CSI0A_CPHY_SPARE_SHIFT 16
> +#define MIPI_RX_ANA40_CSI0A_RG_CSI0A_CPHY_SPARE_MASK (0xffff << 16)
> +#define MIPI_RX_ANA48_CSI0A                                    0x0048
> +#define MIPI_RX_ANA48_CSI0A_RGS_CSI0A_CDPHY_L0_T0AB_OS_CAL_CPLT_SHIFT 0
> +#define MIPI_RX_ANA48_CSI0A_RGS_CSI0A_CDPHY_L0_T0AB_OS_CAL_CPLT_MASK (0x1 << 0)
> +#define MIPI_RX_ANA48_CSI0A_RGS_CSI0A_CPHY_T0CA_OS_CAL_CPLT_SHIFT 1
> +#define MIPI_RX_ANA48_CSI0A_RGS_CSI0A_CPHY_T0CA_OS_CAL_CPLT_MASK (0x1 << 1)
> +#define MIPI_RX_ANA48_CSI0A_RGS_CSI0A_CPHY_T0BC_OS_CAL_CPLT_SHIFT 2
> +#define MIPI_RX_ANA48_CSI0A_RGS_CSI0A_CPHY_T0BC_OS_CAL_CPLT_MASK (0x1 << 2)
> +#define MIPI_RX_ANA48_CSI0A_RGS_CSI0A_CDPHY_L1_T1AB_OS_CAL_CPLT_SHIFT 3
> +#define MIPI_RX_ANA48_CSI0A_RGS_CSI0A_CDPHY_L1_T1AB_OS_CAL_CPLT_MASK (0x1 << 3)
> +#define MIPI_RX_ANA48_CSI0A_RGS_CSI0A_CPHY_T1CA_OS_CAL_CPLT_SHIFT 4
> +#define MIPI_RX_ANA48_CSI0A_RGS_CSI0A_CPHY_T1CA_OS_CAL_CPLT_MASK (0x1 << 4)
> +#define MIPI_RX_ANA48_CSI0A_RGS_CSI0A_CDPHY_L2_T1BC_OS_CAL_CPLT_SHIFT 5
> +#define MIPI_RX_ANA48_CSI0A_RGS_CSI0A_CDPHY_L2_T1BC_OS_CAL_CPLT_MASK (0x1 << 5)
> +#define MIPI_RX_ANA48_CSI0A_RGS_CSI0A_OS_CAL_CODE_SHIFT 8
> +#define MIPI_RX_ANA48_CSI0A_RGS_CSI0A_OS_CAL_CODE_MASK (0xff << 8)
> +#define MIPI_RX_WRAPPER80_CSI0A                                0x0080
> +#define MIPI_RX_WRAPPER80_CSI0A_CSR_CSI_CLK_MON_SHIFT 0
> +#define MIPI_RX_WRAPPER80_CSI0A_CSR_CSI_CLK_MON_MASK (0x1 << 0)
> +#define MIPI_RX_WRAPPER80_CSI0A_CSR_CSI_CLK_EN_SHIFT 1
> +#define MIPI_RX_WRAPPER80_CSI0A_CSR_CSI_CLK_EN_MASK (0x1 << 1)
> +#define MIPI_RX_WRAPPER80_CSI0A_CSR_CSI_MON_MUX_SHIFT 8
> +#define MIPI_RX_WRAPPER80_CSI0A_CSR_CSI_MON_MUX_MASK (0xff << 8)
> +#define MIPI_RX_WRAPPER80_CSI0A_CSR_CSI_RST_MODE_SHIFT 16
> +#define MIPI_RX_WRAPPER80_CSI0A_CSR_CSI_RST_MODE_MASK (0x3 << 16)
> +#define MIPI_RX_WRAPPER80_CSI0A_CSR_SW_RST_SHIFT 24
> +#define MIPI_RX_WRAPPER80_CSI0A_CSR_SW_RST_MASK (0xf << 24)
> +#define MIPI_RX_WRAPPER84_CSI0A                                0x0084
> +#define MIPI_RX_WRAPPER84_CSI0A_CSI_DEBUG_OUT_SHIFT 0
> +#define MIPI_RX_WRAPPER84_CSI0A_CSI_DEBUG_OUT_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER88_CSI0A                                0x0088
> +#define MIPI_RX_WRAPPER88_CSI0A_CSR_SW_MODE_0_SHIFT 0
> +#define MIPI_RX_WRAPPER88_CSI0A_CSR_SW_MODE_0_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER8C_CSI0A                                0x008C
> +#define MIPI_RX_WRAPPER8C_CSI0A_CSR_SW_MODE_1_SHIFT 0
> +#define MIPI_RX_WRAPPER8C_CSI0A_CSR_SW_MODE_1_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER90_CSI0A                                0x0090
> +#define MIPI_RX_WRAPPER90_CSI0A_CSR_SW_MODE_2_SHIFT 0
> +#define MIPI_RX_WRAPPER90_CSI0A_CSR_SW_MODE_2_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER94_CSI0A                                0x0094
> +#define MIPI_RX_WRAPPER94_CSI0A_CSR_SW_VALUE_0_SHIFT 0
> +#define MIPI_RX_WRAPPER94_CSI0A_CSR_SW_VALUE_0_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER98_CSI0A                                0x0098
> +#define MIPI_RX_WRAPPER98_CSI0A_CSR_SW_VALUE_1_SHIFT 0
> +#define MIPI_RX_WRAPPER98_CSI0A_CSR_SW_VALUE_1_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER9C_CSI0A                                0x009C
> +#define MIPI_RX_WRAPPER9C_CSI0A_CSR_SW_VALUE_2_SHIFT 0
> +#define MIPI_RX_WRAPPER9C_CSI0A_CSR_SW_VALUE_2_MASK (0xffffffff << 0)
> +#define MIPI_RX_ANAA4_CSI0A                                    0x00A4
> +#define MIPI_RX_ANAA4_CSI0A_RG_CSI0A_CDPHY_L0_T0_SYNC_INIT_SEL_SHIFT 0
> +#define MIPI_RX_ANAA4_CSI0A_RG_CSI0A_CDPHY_L0_T0_SYNC_INIT_SEL_MASK (0x1 << 0)
> +#define MIPI_RX_ANAA4_CSI0A_RG_CSI0A_CDPHY_L0_T0_FORCE_INIT_SHIFT 1
> +#define MIPI_RX_ANAA4_CSI0A_RG_CSI0A_CDPHY_L0_T0_FORCE_INIT_MASK (0x1 << 1)
> +#define MIPI_RX_ANAA4_CSI0A_RG_CSI0A_DPHY_L1_SYNC_INIT_SEL_SHIFT 2
> +#define MIPI_RX_ANAA4_CSI0A_RG_CSI0A_DPHY_L1_SYNC_INIT_SEL_MASK (0x1 << 2)
> +#define MIPI_RX_ANAA4_CSI0A_RG_CSI0A_DPHY_L1_FORCE_INIT_SHIFT 3
> +#define MIPI_RX_ANAA4_CSI0A_RG_CSI0A_DPHY_L1_FORCE_INIT_MASK (0x1 << 3)
> +#define MIPI_RX_ANAA4_CSI0A_RG_CSI0A_CDPHY_L2_T1_SYNC_INIT_SEL_SHIFT 4
> +#define MIPI_RX_ANAA4_CSI0A_RG_CSI0A_CDPHY_L2_T1_SYNC_INIT_SEL_MASK (0x1 << 4)
> +#define MIPI_RX_ANAA4_CSI0A_RG_CSI0A_CDPHY_L2_T1_FORCE_INIT_SHIFT 5
> +#define MIPI_RX_ANAA4_CSI0A_RG_CSI0A_CDPHY_L2_T1_FORCE_INIT_MASK (0x1 << 5)
> +#define MIPI_RX_ANAA8_CSI0A                                    0x00A8
> +#define MIPI_RX_ANAA8_CSI0A_RG_CSI0A_CDPHY_L0_T0_BYTECK_INVERT_SHIFT 0
> +#define MIPI_RX_ANAA8_CSI0A_RG_CSI0A_CDPHY_L0_T0_BYTECK_INVERT_MASK (0x1 << 0)
> +#define MIPI_RX_ANAA8_CSI0A_RG_CSI0A_DPHY_L1_BYTECK_INVERT_SHIFT 1
> +#define MIPI_RX_ANAA8_CSI0A_RG_CSI0A_DPHY_L1_BYTECK_INVERT_MASK (0x1 << 1)
> +#define MIPI_RX_ANAA8_CSI0A_RG_CSI0A_CDPHY_L2_T1_BYTECK_INVERT_SHIFT 2
> +#define MIPI_RX_ANAA8_CSI0A_RG_CSI0A_CDPHY_L2_T1_BYTECK_INVERT_MASK (0x1 << 2)
> +#define MIPI_RX_ANAA8_CSI0A_RG_CSI0A_DPHY_HSDET_LEVEL_MODE_EN_SHIFT 3
> +#define MIPI_RX_ANAA8_CSI0A_RG_CSI0A_DPHY_HSDET_LEVEL_MODE_EN_MASK (0x1 << 3)
> +#define MIPI_RX_ANAA8_CSI0A_RG_CSI0A_OS_CAL_SEL_SHIFT 4
> +#define MIPI_RX_ANAA8_CSI0A_RG_CSI0A_OS_CAL_SEL_MASK (0x7 << 4)
> +#define MIPI_RX_ANAA8_CSI0A_RG_CSI0A_DPHY_HSDET_DIG_BACK_EN_SHIFT 7
> +#define MIPI_RX_ANAA8_CSI0A_RG_CSI0A_DPHY_HSDET_DIG_BACK_EN_MASK (0x1 << 7)
> +#define MIPI_RX_ANAA8_CSI0A_RG_CSI0A_CDPHY_DELAYCAL_CK_SEL_SHIFT 8
> +#define MIPI_RX_ANAA8_CSI0A_RG_CSI0A_CDPHY_DELAYCAL_CK_SEL_MASK (0x7 << 8)
> +#define MIPI_RX_ANAA8_CSI0A_RG_CSI0A_OS_CAL_DIV_SHIFT 11
> +#define MIPI_RX_ANAA8_CSI0A_RG_CSI0A_OS_CAL_DIV_MASK (0x3 << 11)
> +#define MIPI_RX_ANA00_CSI0B                                    0x1000
> +#define MIPI_RX_ANA00_CSI0B_RG_CSI0B_CPHY_EN_SHIFT 0
> +#define MIPI_RX_ANA00_CSI0B_RG_CSI0B_CPHY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA00_CSI0B_RG_CSI0B_EQ_PROTECT_EN_SHIFT 1
> +#define MIPI_RX_ANA00_CSI0B_RG_CSI0B_EQ_PROTECT_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA00_CSI0B_RG_CSI0B_BG_LPF_EN_SHIFT 2
> +#define MIPI_RX_ANA00_CSI0B_RG_CSI0B_BG_LPF_EN_MASK (0x1 << 2)
> +#define MIPI_RX_ANA00_CSI0B_RG_CSI0B_BG_CORE_EN_SHIFT 3
> +#define MIPI_RX_ANA00_CSI0B_RG_CSI0B_BG_CORE_EN_MASK (0x1 << 3)
> +#define MIPI_RX_ANA00_CSI0B_RG_CSI0B_DPHY_L0_CKMODE_EN_SHIFT 5
> +#define MIPI_RX_ANA00_CSI0B_RG_CSI0B_DPHY_L0_CKMODE_EN_MASK (0x1 << 5)
> +#define MIPI_RX_ANA00_CSI0B_RG_CSI0B_DPHY_L0_CKSEL_SHIFT 6
> +#define MIPI_RX_ANA00_CSI0B_RG_CSI0B_DPHY_L0_CKSEL_MASK (0x1 << 6)
> +#define MIPI_RX_ANA00_CSI0B_RG_CSI0B_DPHY_L1_CKMODE_EN_SHIFT 8
> +#define MIPI_RX_ANA00_CSI0B_RG_CSI0B_DPHY_L1_CKMODE_EN_MASK (0x1 << 8)
> +#define MIPI_RX_ANA00_CSI0B_RG_CSI0B_DPHY_L1_CKSEL_SHIFT 9
> +#define MIPI_RX_ANA00_CSI0B_RG_CSI0B_DPHY_L1_CKSEL_MASK (0x1 << 9)
> +#define MIPI_RX_ANA00_CSI0B_RG_CSI0B_DPHY_L2_CKMODE_EN_SHIFT 11
> +#define MIPI_RX_ANA00_CSI0B_RG_CSI0B_DPHY_L2_CKMODE_EN_MASK (0x1 << 11)
> +#define MIPI_RX_ANA00_CSI0B_RG_CSI0B_DPHY_L2_CKSEL_SHIFT 12
> +#define MIPI_RX_ANA00_CSI0B_RG_CSI0B_DPHY_L2_CKSEL_MASK (0x1 << 12)
> +#define MIPI_RX_ANA04_CSI0B                                    0x1004
> +#define MIPI_RX_ANA04_CSI0B_RG_CSI0B_BG_LPRX_VTH_SEL_SHIFT 0
> +#define MIPI_RX_ANA04_CSI0B_RG_CSI0B_BG_LPRX_VTH_SEL_MASK (0x7 << 0)
> +#define MIPI_RX_ANA04_CSI0B_RG_CSI0B_BG_LPRX_VTL_SEL_SHIFT 4
> +#define MIPI_RX_ANA04_CSI0B_RG_CSI0B_BG_LPRX_VTL_SEL_MASK (0x7 << 4)
> +#define MIPI_RX_ANA04_CSI0B_RG_CSI0B_BG_HSDET_VTH_SEL_SHIFT 8
> +#define MIPI_RX_ANA04_CSI0B_RG_CSI0B_BG_HSDET_VTH_SEL_MASK (0x7 << 8)
> +#define MIPI_RX_ANA04_CSI0B_RG_CSI0B_BG_HSDET_VTL_SEL_SHIFT 12
> +#define MIPI_RX_ANA04_CSI0B_RG_CSI0B_BG_HSDET_VTL_SEL_MASK (0x7 << 12)
> +#define MIPI_RX_ANA04_CSI0B_RG_CSI0B_BG_VREF_SEL_SHIFT 16
> +#define MIPI_RX_ANA04_CSI0B_RG_CSI0B_BG_VREF_SEL_MASK (0xf << 16)
> +#define MIPI_RX_ANA04_CSI0B_RG_CSI0B_BG_MON_VREF_SEL_SHIFT 24
> +#define MIPI_RX_ANA04_CSI0B_RG_CSI0B_BG_MON_VREF_SEL_MASK (0xf << 24)
> +#define MIPI_RX_ANA04_CSI0B_RG_CSI0B_FORCE_HSRT_EN_SHIFT 28
> +#define MIPI_RX_ANA04_CSI0B_RG_CSI0B_FORCE_HSRT_EN_MASK (0x1 << 28)
> +#define MIPI_RX_ANA08_CSI0B                                    0x1008
> +#define MIPI_RX_ANA08_CSI0B_RG_CSI0B_L0P_T0A_HSRT_CODE_SHIFT 0
> +#define MIPI_RX_ANA08_CSI0B_RG_CSI0B_L0P_T0A_HSRT_CODE_MASK (0x1f << 0)
> +#define MIPI_RX_ANA08_CSI0B_RG_CSI0B_L0N_T0B_HSRT_CODE_SHIFT 8
> +#define MIPI_RX_ANA08_CSI0B_RG_CSI0B_L0N_T0B_HSRT_CODE_MASK (0x1f << 8)
> +#define MIPI_RX_ANA08_CSI0B_RG_CSI0B_L1P_T0C_HSRT_CODE_SHIFT 16
> +#define MIPI_RX_ANA08_CSI0B_RG_CSI0B_L1P_T0C_HSRT_CODE_MASK (0x1f << 16)
> +#define MIPI_RX_ANA08_CSI0B_RG_CSI0B_L1N_T1A_HSRT_CODE_SHIFT 24
> +#define MIPI_RX_ANA08_CSI0B_RG_CSI0B_L1N_T1A_HSRT_CODE_MASK (0x1f << 24)
> +#define MIPI_RX_ANA0C_CSI0B                                    0x100C
> +#define MIPI_RX_ANA0C_CSI0B_RG_CSI0B_L2P_T1B_HSRT_CODE_SHIFT 0
> +#define MIPI_RX_ANA0C_CSI0B_RG_CSI0B_L2P_T1B_HSRT_CODE_MASK (0x1f << 0)
> +#define MIPI_RX_ANA0C_CSI0B_RG_CSI0B_L2N_T1C_HSRT_CODE_SHIFT 8
> +#define MIPI_RX_ANA0C_CSI0B_RG_CSI0B_L2N_T1C_HSRT_CODE_MASK (0x1f << 8)
> +#define MIPI_RX_ANA10_CSI0B                                    0x1010
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_DPHY_L0_DELAYCAL_EN_SHIFT 0
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_DPHY_L0_DELAYCAL_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_DPHY_L0_DELAYCAL_RSTB_SHIFT 1
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_DPHY_L0_DELAYCAL_RSTB_MASK (0x1 << 1)
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_DPHY_L0_VREF_SEL_SHIFT 2
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_DPHY_L0_VREF_SEL_MASK (0x3f << 2)
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_DPHY_L1_DELAYCAL_EN_SHIFT 8
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_DPHY_L1_DELAYCAL_EN_MASK (0x1 << 8)
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_DPHY_L1_DELAYCAL_RSTB_SHIFT 9
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_DPHY_L1_DELAYCAL_RSTB_MASK (0x1 << 9)
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_DPHY_L1_VREF_SEL_SHIFT 10
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_DPHY_L1_VREF_SEL_MASK (0x3f << 10)
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_DPHY_L2_DELAYCAL_EN_SHIFT 16
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_DPHY_L2_DELAYCAL_EN_MASK (0x1 << 16)
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_DPHY_L2_DELAYCAL_RSTB_SHIFT 17
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_DPHY_L2_DELAYCAL_RSTB_MASK (0x1 << 17)
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_DPHY_L2_VREF_SEL_SHIFT 18
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_DPHY_L2_VREF_SEL_MASK (0x3f << 18)
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_CPHY_T0_CDR_DELAYCAL_EN_SHIFT 24
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_CPHY_T0_CDR_DELAYCAL_EN_MASK (0x1 << 24)
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_CPHY_T0_CDR_DELAYCAL_RSTB_SHIFT 25
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_CPHY_T0_CDR_DELAYCAL_RSTB_MASK (0x1 << 25)
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_CPHY_T0_VREF_SEL_SHIFT 26
> +#define MIPI_RX_ANA10_CSI0B_RG_CSI0B_CPHY_T0_VREF_SEL_MASK (0x3f << 26)
> +#define MIPI_RX_ANA14_CSI0B                                    0x1014
> +#define MIPI_RX_ANA14_CSI0B_RG_CSI0B_CPHY_T1_CDR_DELAYCAL_EN_SHIFT 0
> +#define MIPI_RX_ANA14_CSI0B_RG_CSI0B_CPHY_T1_CDR_DELAYCAL_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA14_CSI0B_RG_CSI0B_CPHY_T1_CDR_DELAYCAL_RSTB_SHIFT 1
> +#define MIPI_RX_ANA14_CSI0B_RG_CSI0B_CPHY_T1_CDR_DELAYCAL_RSTB_MASK (0x1 << 1)
> +#define MIPI_RX_ANA14_CSI0B_RG_CSI0B_CPHY_T1_VREF_SEL_SHIFT 2
> +#define MIPI_RX_ANA14_CSI0B_RG_CSI0B_CPHY_T1_VREF_SEL_MASK (0x3f << 2)
> +#define MIPI_RX_ANA18_CSI0B                                    0x1018
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_L0_T0AB_EQ_OS_CAL_EN_SHIFT 0
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_L0_T0AB_EQ_OS_CAL_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_L0_T0AB_EQ_MON_EN_SHIFT 1
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_L0_T0AB_EQ_MON_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_L0_T0AB_EQ_SCA_SHIFT 2
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_L0_T0AB_EQ_SCA_MASK (0x1 << 2)
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_L0_T0AB_EQ_SCB_SHIFT 3
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_L0_T0AB_EQ_SCB_MASK (0x1 << 3)
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_L0_T0AB_EQ_IS_SHIFT 4
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_L0_T0AB_EQ_IS_MASK (0x3 << 4)
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_L0_T0AB_EQ_BW_SHIFT 6
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_L0_T0AB_EQ_BW_MASK (0x3 << 6)
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_L0_T0AB_EQ_SRA_SHIFT 8
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_L0_T0AB_EQ_SRA_MASK (0xf << 8)
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_L0_T0AB_EQ_SRB_SHIFT 12
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_L0_T0AB_EQ_SRB_MASK (0xf << 12)
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_XX_T0CA_EQ_OS_CAL_EN_SHIFT 16
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_XX_T0CA_EQ_OS_CAL_EN_MASK (0x1 << 16)
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_XX_T0CA_EQ_MON_EN_SHIFT 17
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_XX_T0CA_EQ_MON_EN_MASK (0x1 << 17)
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_XX_T0CA_EQ_SCA_SHIFT 18
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_XX_T0CA_EQ_SCA_MASK (0x1 << 18)
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_XX_T0CA_EQ_SCB_SHIFT 19
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_XX_T0CA_EQ_SCB_MASK (0x1 << 19)
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_XX_T0CA_EQ_IS_SHIFT 20
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_XX_T0CA_EQ_IS_MASK (0x3 << 20)
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_XX_T0CA_EQ_BW_SHIFT 22
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_XX_T0CA_EQ_BW_MASK (0x3 << 22)
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_XX_T0CA_EQ_SRA_SHIFT 24
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_XX_T0CA_EQ_SRA_MASK (0xf << 24)
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_XX_T0CA_EQ_SRB_SHIFT 28
> +#define MIPI_RX_ANA18_CSI0B_RG_CSI0B_XX_T0CA_EQ_SRB_MASK (0xf << 28)
> +#define MIPI_RX_ANA1C_CSI0B                                    0x101C
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_XX_T0BC_EQ_OS_CAL_EN_SHIFT 0
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_XX_T0BC_EQ_OS_CAL_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_XX_T0BC_EQ_MON_EN_SHIFT 1
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_XX_T0BC_EQ_MON_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_XX_T0BC_EQ_SCA_SHIFT 2
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_XX_T0BC_EQ_SCA_MASK (0x1 << 2)
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_XX_T0BC_EQ_SCB_SHIFT 3
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_XX_T0BC_EQ_SCB_MASK (0x1 << 3)
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_XX_T0BC_EQ_IS_SHIFT 4
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_XX_T0BC_EQ_IS_MASK (0x3 << 4)
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_XX_T0BC_EQ_BW_SHIFT 6
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_XX_T0BC_EQ_BW_MASK (0x3 << 6)
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_XX_T0BC_EQ_SRA_SHIFT 8
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_XX_T0BC_EQ_SRA_MASK (0xf << 8)
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_XX_T0BC_EQ_SRB_SHIFT 12
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_XX_T0BC_EQ_SRB_MASK (0xf << 12)
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_L1_T1AB_EQ_OS_CAL_EN_SHIFT 16
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_L1_T1AB_EQ_OS_CAL_EN_MASK (0x1 << 16)
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_L1_T1AB_EQ_MON_EN_SHIFT 17
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_L1_T1AB_EQ_MON_EN_MASK (0x1 << 17)
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_L1_T1AB_EQ_SCA_SHIFT 18
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_L1_T1AB_EQ_SCA_MASK (0x1 << 18)
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_L1_T1AB_EQ_SCB_SHIFT 19
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_L1_T1AB_EQ_SCB_MASK (0x1 << 19)
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_L1_T1AB_EQ_IS_SHIFT 20
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_L1_T1AB_EQ_IS_MASK (0x3 << 20)
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_L1_T1AB_EQ_BW_SHIFT 22
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_L1_T1AB_EQ_BW_MASK (0x3 << 22)
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_L1_T1AB_EQ_SRA_SHIFT 24
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_L1_T1AB_EQ_SRA_MASK (0xf << 24)
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_L1_T1AB_EQ_SRB_SHIFT 28
> +#define MIPI_RX_ANA1C_CSI0B_RG_CSI0B_L1_T1AB_EQ_SRB_MASK (0xf << 28)
> +#define MIPI_RX_ANA20_CSI0B                                    0x1020
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_XX_T1CA_EQ_OS_CAL_EN_SHIFT 0
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_XX_T1CA_EQ_OS_CAL_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_XX_T1CA_EQ_MON_EN_SHIFT 1
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_XX_T1CA_EQ_MON_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_XX_T1CA_EQ_SCA_SHIFT 2
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_XX_T1CA_EQ_SCA_MASK (0x1 << 2)
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_XX_T1CA_EQ_SCB_SHIFT 3
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_XX_T1CA_EQ_SCB_MASK (0x1 << 3)
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_XX_T1CA_EQ_IS_SHIFT 4
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_XX_T1CA_EQ_IS_MASK (0x3 << 4)
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_XX_T1CA_EQ_BW_SHIFT 6
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_XX_T1CA_EQ_BW_MASK (0x3 << 6)
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_XX_T1CA_EQ_SRA_SHIFT 8
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_XX_T1CA_EQ_SRA_MASK (0xf << 8)
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_XX_T1CA_EQ_SRB_SHIFT 12
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_XX_T1CA_EQ_SRB_MASK (0xf << 12)
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_L2_T1BC_EQ_OS_CAL_EN_SHIFT 16
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_L2_T1BC_EQ_OS_CAL_EN_MASK (0x1 << 16)
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_L2_T1BC_EQ_MON_EN_SHIFT 17
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_L2_T1BC_EQ_MON_EN_MASK (0x1 << 17)
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_L2_T1BC_EQ_SCA_SHIFT 18
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_L2_T1BC_EQ_SCA_MASK (0x1 << 18)
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_L2_T1BC_EQ_SCB_SHIFT 19
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_L2_T1BC_EQ_SCB_MASK (0x1 << 19)
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_L2_T1BC_EQ_IS_SHIFT 20
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_L2_T1BC_EQ_IS_MASK (0x3 << 20)
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_L2_T1BC_EQ_BW_SHIFT 22
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_L2_T1BC_EQ_BW_MASK (0x3 << 22)
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_L2_T1BC_EQ_SRA_SHIFT 24
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_L2_T1BC_EQ_SRA_MASK (0xf << 24)
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_L2_T1BC_EQ_SRB_SHIFT 28
> +#define MIPI_RX_ANA20_CSI0B_RG_CSI0B_L2_T1BC_EQ_SRB_MASK (0xf << 28)
> +#define MIPI_RX_ANA24_CSI0B                                    0x1024
> +#define MIPI_RX_ANA24_CSI0B_RG_CSI0B_RESERVE_SHIFT 24
> +#define MIPI_RX_ANA24_CSI0B_RG_CSI0B_RESERVE_MASK (0xff << 24)
> +#define MIPI_RX_ANA28_CSI0B                                    0x1028
> +#define MIPI_RX_ANA28_CSI0B_RG_CSI0B_CPHY_T0_CDR_DIRECT_EN_SHIFT 0
> +#define MIPI_RX_ANA28_CSI0B_RG_CSI0B_CPHY_T0_CDR_DIRECT_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA28_CSI0B_RG_CSI0B_CPHY_T0_CDR_AUTOLOAD_EN_SHIFT 1
> +#define MIPI_RX_ANA28_CSI0B_RG_CSI0B_CPHY_T0_CDR_AUTOLOAD_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA28_CSI0B_RG_CSI0B_CPHY_T0_CDR_LPF_CTRL_SHIFT 2
> +#define MIPI_RX_ANA28_CSI0B_RG_CSI0B_CPHY_T0_CDR_LPF_CTRL_MASK (0x3 << 2)
> +#define MIPI_RX_ANA28_CSI0B_RG_CSI0B_CPHY_T0_CDR_AB_WIDTH_SHIFT 4
> +#define MIPI_RX_ANA28_CSI0B_RG_CSI0B_CPHY_T0_CDR_AB_WIDTH_MASK (0xf << 4)
> +#define MIPI_RX_ANA28_CSI0B_RG_CSI0B_CPHY_T0_CDR_BC_WIDTH_SHIFT 8
> +#define MIPI_RX_ANA28_CSI0B_RG_CSI0B_CPHY_T0_CDR_BC_WIDTH_MASK (0xf << 8)
> +#define MIPI_RX_ANA28_CSI0B_RG_CSI0B_CPHY_T0_CDR_CA_WIDTH_SHIFT 12
> +#define MIPI_RX_ANA28_CSI0B_RG_CSI0B_CPHY_T0_CDR_CA_WIDTH_MASK (0xf << 12)
> +#define MIPI_RX_ANA28_CSI0B_RG_CSI0B_CPHY_T0_CDR_CK_DELAY_SHIFT 16
> +#define MIPI_RX_ANA28_CSI0B_RG_CSI0B_CPHY_T0_CDR_CK_DELAY_MASK (0xf << 16)
> +#define MIPI_RX_ANA28_CSI0B_RG_CSI0B_CPHY_T0_HSDET_SEL_SHIFT 20
> +#define MIPI_RX_ANA28_CSI0B_RG_CSI0B_CPHY_T0_HSDET_SEL_MASK (0x3 << 20)
> +#define MIPI_RX_ANA28_CSI0B_RG_CSI0B_CPHY_T0_CDR_MANUAL_EN_SHIFT 24
> +#define MIPI_RX_ANA28_CSI0B_RG_CSI0B_CPHY_T0_CDR_MANUAL_EN_MASK (0x1 << 24)
> +#define MIPI_RX_ANA2C_CSI0B                                    0x102C
> +#define MIPI_RX_ANA2C_CSI0B_RG_CSI0B_CPHY_T0_CDR_INIT_CODE_SHIFT 0
> +#define MIPI_RX_ANA2C_CSI0B_RG_CSI0B_CPHY_T0_CDR_INIT_CODE_MASK (0x1f << 0)
> +#define MIPI_RX_ANA2C_CSI0B_RG_CSI0B_CPHY_T0_CDR_EARLY_CODE_SHIFT 8
> +#define MIPI_RX_ANA2C_CSI0B_RG_CSI0B_CPHY_T0_CDR_EARLY_CODE_MASK (0x1f << 8)
> +#define MIPI_RX_ANA2C_CSI0B_RG_CSI0B_CPHY_T0_CDR_LATE_CODE_SHIFT 16
> +#define MIPI_RX_ANA2C_CSI0B_RG_CSI0B_CPHY_T0_CDR_LATE_CODE_MASK (0x1f << 16)
> +#define MIPI_RX_ANA34_CSI0B                                    0x1034
> +#define MIPI_RX_ANA34_CSI0B_RG_CSI0B_CPHY_T1_CDR_DIRECT_EN_SHIFT 0
> +#define MIPI_RX_ANA34_CSI0B_RG_CSI0B_CPHY_T1_CDR_DIRECT_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA34_CSI0B_RG_CSI0B_CPHY_T1_CDR_AUTOLOAD_EN_SHIFT 1
> +#define MIPI_RX_ANA34_CSI0B_RG_CSI0B_CPHY_T1_CDR_AUTOLOAD_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA34_CSI0B_RG_CSI0B_CPHY_T1_CDR_LPF_CTRL_SHIFT 2
> +#define MIPI_RX_ANA34_CSI0B_RG_CSI0B_CPHY_T1_CDR_LPF_CTRL_MASK (0x3 << 2)
> +#define MIPI_RX_ANA34_CSI0B_RG_CSI0B_CPHY_T1_CDR_AB_WIDTH_SHIFT 4
> +#define MIPI_RX_ANA34_CSI0B_RG_CSI0B_CPHY_T1_CDR_AB_WIDTH_MASK (0xf << 4)
> +#define MIPI_RX_ANA34_CSI0B_RG_CSI0B_CPHY_T1_CDR_BC_WIDTH_SHIFT 8
> +#define MIPI_RX_ANA34_CSI0B_RG_CSI0B_CPHY_T1_CDR_BC_WIDTH_MASK (0xf << 8)
> +#define MIPI_RX_ANA34_CSI0B_RG_CSI0B_CPHY_T1_CDR_CA_WIDTH_SHIFT 12
> +#define MIPI_RX_ANA34_CSI0B_RG_CSI0B_CPHY_T1_CDR_CA_WIDTH_MASK (0xf << 12)
> +#define MIPI_RX_ANA34_CSI0B_RG_CSI0B_CPHY_T1_CDR_CK_DELAY_SHIFT 16
> +#define MIPI_RX_ANA34_CSI0B_RG_CSI0B_CPHY_T1_CDR_CK_DELAY_MASK (0xf << 16)
> +#define MIPI_RX_ANA34_CSI0B_RG_CSI0B_CPHY_T1_HSDET_SEL_SHIFT 20
> +#define MIPI_RX_ANA34_CSI0B_RG_CSI0B_CPHY_T1_HSDET_SEL_MASK (0x3 << 20)
> +#define MIPI_RX_ANA34_CSI0B_RG_CSI0B_CPHY_T1_CDR_MANUAL_EN_SHIFT 24
> +#define MIPI_RX_ANA34_CSI0B_RG_CSI0B_CPHY_T1_CDR_MANUAL_EN_MASK (0x1 << 24)
> +#define MIPI_RX_ANA38_CSI0B                                    0x1038
> +#define MIPI_RX_ANA38_CSI0B_RG_CSI0B_CPHY_T1_CDR_INIT_CODE_SHIFT 0
> +#define MIPI_RX_ANA38_CSI0B_RG_CSI0B_CPHY_T1_CDR_INIT_CODE_MASK (0x1f << 0)
> +#define MIPI_RX_ANA38_CSI0B_RG_CSI0B_CPHY_T1_CDR_EARLY_CODE_SHIFT 8
> +#define MIPI_RX_ANA38_CSI0B_RG_CSI0B_CPHY_T1_CDR_EARLY_CODE_MASK (0x1f << 8)
> +#define MIPI_RX_ANA38_CSI0B_RG_CSI0B_CPHY_T1_CDR_LATE_CODE_SHIFT 16
> +#define MIPI_RX_ANA38_CSI0B_RG_CSI0B_CPHY_T1_CDR_LATE_CODE_MASK (0x1f << 16)
> +#define MIPI_RX_ANA48_CSI0B                                    0x1048
> +#define MIPI_RX_ANA48_CSI0B_RGS_CSI0B_CDPHY_L0_T0AB_OS_CAL_CPLT_SHIFT 0
> +#define MIPI_RX_ANA48_CSI0B_RGS_CSI0B_CDPHY_L0_T0AB_OS_CAL_CPLT_MASK (0x1 << 0)
> +#define MIPI_RX_ANA48_CSI0B_RGS_CSI0B_CPHY_T0CA_OS_CAL_CPLT_SHIFT 1
> +#define MIPI_RX_ANA48_CSI0B_RGS_CSI0B_CPHY_T0CA_OS_CAL_CPLT_MASK (0x1 << 1)
> +#define MIPI_RX_ANA48_CSI0B_RGS_CSI0B_CPHY_T0BC_OS_CAL_CPLT_SHIFT 2
> +#define MIPI_RX_ANA48_CSI0B_RGS_CSI0B_CPHY_T0BC_OS_CAL_CPLT_MASK (0x1 << 2)
> +#define MIPI_RX_ANA48_CSI0B_RGS_CSI0B_CDPHY_L1_T1AB_OS_CAL_CPLT_SHIFT 3
> +#define MIPI_RX_ANA48_CSI0B_RGS_CSI0B_CDPHY_L1_T1AB_OS_CAL_CPLT_MASK (0x1 << 3)
> +#define MIPI_RX_ANA48_CSI0B_RGS_CSI0B_CPHY_T1CA_OS_CAL_CPLT_SHIFT 4
> +#define MIPI_RX_ANA48_CSI0B_RGS_CSI0B_CPHY_T1CA_OS_CAL_CPLT_MASK (0x1 << 4)
> +#define MIPI_RX_ANA48_CSI0B_RGS_CSI0B_CDPHY_L2_T1BC_OS_CAL_CPLT_SHIFT 5
> +#define MIPI_RX_ANA48_CSI0B_RGS_CSI0B_CDPHY_L2_T1BC_OS_CAL_CPLT_MASK (0x1 << 5)
> +#define MIPI_RX_ANA48_CSI0B_RGS_CSI0B_OS_CAL_CODE_SHIFT 8
> +#define MIPI_RX_ANA48_CSI0B_RGS_CSI0B_OS_CAL_CODE_MASK (0xff << 8)
> +#define MIPI_RX_WRAPPER80_CSI0B                                0x1080
> +#define MIPI_RX_WRAPPER80_CSI0B_CSR_CSI_CLK_MON_SHIFT 0
> +#define MIPI_RX_WRAPPER80_CSI0B_CSR_CSI_CLK_MON_MASK (0x1 << 0)
> +#define MIPI_RX_WRAPPER80_CSI0B_CSR_CSI_CLK_EN_SHIFT 1
> +#define MIPI_RX_WRAPPER80_CSI0B_CSR_CSI_CLK_EN_MASK (0x1 << 1)
> +#define MIPI_RX_WRAPPER80_CSI0B_CSR_CSI_MON_MUX_SHIFT 8
> +#define MIPI_RX_WRAPPER80_CSI0B_CSR_CSI_MON_MUX_MASK (0xff << 8)
> +#define MIPI_RX_WRAPPER80_CSI0B_CSR_CSI_RST_MODE_SHIFT 16
> +#define MIPI_RX_WRAPPER80_CSI0B_CSR_CSI_RST_MODE_MASK (0x3 << 16)
> +#define MIPI_RX_WRAPPER80_CSI0B_CSR_SW_RST_SHIFT 24
> +#define MIPI_RX_WRAPPER80_CSI0B_CSR_SW_RST_MASK (0xf << 24)
> +#define MIPI_RX_WRAPPER84_CSI0B                                0x1084
> +#define MIPI_RX_WRAPPER84_CSI0B_CSI_DEBUG_OUT_SHIFT 0
> +#define MIPI_RX_WRAPPER84_CSI0B_CSI_DEBUG_OUT_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER88_CSI0B                                0x1088
> +#define MIPI_RX_WRAPPER88_CSI0B_CSR_SW_MODE_0_SHIFT 0
> +#define MIPI_RX_WRAPPER88_CSI0B_CSR_SW_MODE_0_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER8C_CSI0B                                0x108C
> +#define MIPI_RX_WRAPPER8C_CSI0B_CSR_SW_MODE_1_SHIFT 0
> +#define MIPI_RX_WRAPPER8C_CSI0B_CSR_SW_MODE_1_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER90_CSI0B                                0x1090
> +#define MIPI_RX_WRAPPER90_CSI0B_CSR_SW_MODE_2_SHIFT 0
> +#define MIPI_RX_WRAPPER90_CSI0B_CSR_SW_MODE_2_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER94_CSI0B                                0x1094
> +#define MIPI_RX_WRAPPER94_CSI0B_CSR_SW_VALUE_0_SHIFT 0
> +#define MIPI_RX_WRAPPER94_CSI0B_CSR_SW_VALUE_0_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER98_CSI0B                                0x1098
> +#define MIPI_RX_WRAPPER98_CSI0B_CSR_SW_VALUE_1_SHIFT 0
> +#define MIPI_RX_WRAPPER98_CSI0B_CSR_SW_VALUE_1_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER9C_CSI0B                                0x109C
> +#define MIPI_RX_WRAPPER9C_CSI0B_CSR_SW_VALUE_2_SHIFT 0
> +#define MIPI_RX_WRAPPER9C_CSI0B_CSR_SW_VALUE_2_MASK (0xffffffff << 0)
> +#define MIPI_RX_ANAA4_CSI0B                                    0x10A4
> +#define MIPI_RX_ANAA4_CSI0B_RG_CSI0B_CDPHY_L0_T0_SYNC_INIT_SEL_SHIFT 0
> +#define MIPI_RX_ANAA4_CSI0B_RG_CSI0B_CDPHY_L0_T0_SYNC_INIT_SEL_MASK (0x1 << 0)
> +#define MIPI_RX_ANAA4_CSI0B_RG_CSI0B_CDPHY_L0_T0_FORCE_INIT_SHIFT 1
> +#define MIPI_RX_ANAA4_CSI0B_RG_CSI0B_CDPHY_L0_T0_FORCE_INIT_MASK (0x1 << 1)
> +#define MIPI_RX_ANAA4_CSI0B_RG_CSI0B_DPHY_L1_SYNC_INIT_SEL_SHIFT 2
> +#define MIPI_RX_ANAA4_CSI0B_RG_CSI0B_DPHY_L1_SYNC_INIT_SEL_MASK (0x1 << 2)
> +#define MIPI_RX_ANAA4_CSI0B_RG_CSI0B_DPHY_L1_FORCE_INIT_SHIFT 3
> +#define MIPI_RX_ANAA4_CSI0B_RG_CSI0B_DPHY_L1_FORCE_INIT_MASK (0x1 << 3)
> +#define MIPI_RX_ANAA4_CSI0B_RG_CSI0B_CDPHY_L2_T1_SYNC_INIT_SEL_SHIFT 4
> +#define MIPI_RX_ANAA4_CSI0B_RG_CSI0B_CDPHY_L2_T1_SYNC_INIT_SEL_MASK (0x1 << 4)
> +#define MIPI_RX_ANAA4_CSI0B_RG_CSI0B_CDPHY_L2_T1_FORCE_INIT_SHIFT 5
> +#define MIPI_RX_ANAA4_CSI0B_RG_CSI0B_CDPHY_L2_T1_FORCE_INIT_MASK (0x1 << 5)
> +#define MIPI_RX_ANAA8_CSI0B                                    0x10A8
> +#define MIPI_RX_ANAA8_CSI0B_RG_CSI0B_CDPHY_L0_T0_BYTECK_INVERT_SHIFT 0
> +#define MIPI_RX_ANAA8_CSI0B_RG_CSI0B_CDPHY_L0_T0_BYTECK_INVERT_MASK (0x1 << 0)
> +#define MIPI_RX_ANAA8_CSI0B_RG_CSI0B_DPHY_L1_BYTECK_INVERT_SHIFT 1
> +#define MIPI_RX_ANAA8_CSI0B_RG_CSI0B_DPHY_L1_BYTECK_INVERT_MASK (0x1 << 1)
> +#define MIPI_RX_ANAA8_CSI0B_RG_CSI0B_CDPHY_L2_T1_BYTECK_INVERT_SHIFT 2
> +#define MIPI_RX_ANAA8_CSI0B_RG_CSI0B_CDPHY_L2_T1_BYTECK_INVERT_MASK (0x1 << 2)
> +#define MIPI_RX_ANAA8_CSI0B_RG_CSI0B_DPHY_HSDET_LEVEL_MODE_EN_SHIFT 3
> +#define MIPI_RX_ANAA8_CSI0B_RG_CSI0B_DPHY_HSDET_LEVEL_MODE_EN_MASK (0x1 << 3)
> +#define MIPI_RX_ANAA8_CSI0B_RG_CSI0B_OS_CAL_SEL_SHIFT 4
> +#define MIPI_RX_ANAA8_CSI0B_RG_CSI0B_OS_CAL_SEL_MASK (0x7 << 4)
> +#define MIPI_RX_ANAA8_CSI0B_RG_CSI0B_DPHY_HSDET_DIG_BACK_EN_SHIFT 7
> +#define MIPI_RX_ANAA8_CSI0B_RG_CSI0B_DPHY_HSDET_DIG_BACK_EN_MASK (0x1 << 7)
> +#define MIPI_RX_ANAA8_CSI0B_RG_CSI0B_CDPHY_DELAYCAL_CK_SEL_SHIFT 8
> +#define MIPI_RX_ANAA8_CSI0B_RG_CSI0B_CDPHY_DELAYCAL_CK_SEL_MASK (0x7 << 8)
> +#define MIPI_RX_ANAA8_CSI0B_RG_CSI0B_OS_CAL_DIV_SHIFT 11
> +#define MIPI_RX_ANAA8_CSI0B_RG_CSI0B_OS_CAL_DIV_MASK (0x3 << 11)
> +#define MIPI_RX_ANA00_CSI1A                                    0x2000
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_EQ_PROTECT_EN_SHIFT 1
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_EQ_PROTECT_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_BG_LPF_EN_SHIFT 2
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_BG_LPF_EN_MASK (0x1 << 2)
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_BG_CORE_EN_SHIFT 3
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_BG_CORE_EN_MASK (0x1 << 3)
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L0_CKMODE_EN_SHIFT 5
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L0_CKMODE_EN_MASK (0x1 << 5)
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L0_CKSEL_SHIFT 6
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L0_CKSEL_MASK (0x1 << 6)
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L1_CKMODE_EN_SHIFT 8
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L1_CKMODE_EN_MASK (0x1 << 8)
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L1_CKSEL_SHIFT 9
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L1_CKSEL_MASK (0x1 << 9)
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L2_CKMODE_EN_SHIFT 11
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L2_CKMODE_EN_MASK (0x1 << 11)
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L2_CKSEL_SHIFT 12
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L2_CKSEL_MASK (0x1 << 12)
> +#define MIPI_RX_ANA04_CSI1A                                    0x2004
> +#define MIPI_RX_ANA04_CSI1A_RG_CSI1A_BG_LPRX_VTH_SEL_SHIFT 0
> +#define MIPI_RX_ANA04_CSI1A_RG_CSI1A_BG_LPRX_VTH_SEL_MASK (0x7 << 0)
> +#define MIPI_RX_ANA04_CSI1A_RG_CSI1A_BG_LPRX_VTL_SEL_SHIFT 4
> +#define MIPI_RX_ANA04_CSI1A_RG_CSI1A_BG_LPRX_VTL_SEL_MASK (0x7 << 4)
> +#define MIPI_RX_ANA04_CSI1A_RG_CSI1A_BG_HSDET_VTH_SEL_SHIFT 8
> +#define MIPI_RX_ANA04_CSI1A_RG_CSI1A_BG_HSDET_VTH_SEL_MASK (0x7 << 8)
> +#define MIPI_RX_ANA04_CSI1A_RG_CSI1A_BG_HSDET_VTL_SEL_SHIFT 12
> +#define MIPI_RX_ANA04_CSI1A_RG_CSI1A_BG_HSDET_VTL_SEL_MASK (0x7 << 12)
> +#define MIPI_RX_ANA04_CSI1A_RG_CSI1A_BG_VREF_SEL_SHIFT 16
> +#define MIPI_RX_ANA04_CSI1A_RG_CSI1A_BG_VREF_SEL_MASK (0xf << 16)
> +#define MIPI_RX_ANA04_CSI1A_RG_CSI1A_BG_MON_VREF_SEL_SHIFT 24
> +#define MIPI_RX_ANA04_CSI1A_RG_CSI1A_BG_MON_VREF_SEL_MASK (0xf << 24)
> +#define MIPI_RX_ANA04_CSI1A_RG_CSI1A_FORCE_HSRT_EN_SHIFT 28
> +#define MIPI_RX_ANA04_CSI1A_RG_CSI1A_FORCE_HSRT_EN_MASK (0x1 << 28)
> +#define MIPI_RX_ANA08_CSI1A                                    0x2008
> +#define MIPI_RX_ANA08_CSI1A_RG_CSI1A_L0P_HSRT_CODE_SHIFT 0
> +#define MIPI_RX_ANA08_CSI1A_RG_CSI1A_L0P_HSRT_CODE_MASK (0x1f << 0)
> +#define MIPI_RX_ANA08_CSI1A_RG_CSI1A_L0N_HSRT_CODE_SHIFT 8
> +#define MIPI_RX_ANA08_CSI1A_RG_CSI1A_L0N_HSRT_CODE_MASK (0x1f << 8)
> +#define MIPI_RX_ANA08_CSI1A_RG_CSI1A_L1P_HSRT_CODE_SHIFT 16
> +#define MIPI_RX_ANA08_CSI1A_RG_CSI1A_L1P_HSRT_CODE_MASK (0x1f << 16)
> +#define MIPI_RX_ANA08_CSI1A_RG_CSI1A_L1N_HSRT_CODE_SHIFT 24
> +#define MIPI_RX_ANA08_CSI1A_RG_CSI1A_L1N_HSRT_CODE_MASK (0x1f << 24)
> +#define MIPI_RX_ANA0C_CSI1A                                    0x200C
> +#define MIPI_RX_ANA0C_CSI1A_RG_CSI1A_L2P_HSRT_CODE_SHIFT 0
> +#define MIPI_RX_ANA0C_CSI1A_RG_CSI1A_L2P_HSRT_CODE_MASK (0x1f << 0)
> +#define MIPI_RX_ANA0C_CSI1A_RG_CSI1A_L2N_HSRT_CODE_SHIFT 8
> +#define MIPI_RX_ANA0C_CSI1A_RG_CSI1A_L2N_HSRT_CODE_MASK (0x1f << 8)
> +#define MIPI_RX_ANA10_CSI1A                                    0x2010
> +#define MIPI_RX_ANA10_CSI1A_RG_CSI1A_DPHY_L0_DELAYCAL_EN_SHIFT 0
> +#define MIPI_RX_ANA10_CSI1A_RG_CSI1A_DPHY_L0_DELAYCAL_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA10_CSI1A_RG_CSI1A_DPHY_L0_DELAYCAL_RSTB_SHIFT 1
> +#define MIPI_RX_ANA10_CSI1A_RG_CSI1A_DPHY_L0_DELAYCAL_RSTB_MASK (0x1 << 1)
> +#define MIPI_RX_ANA10_CSI1A_RG_CSI1A_DPHY_L0_VREF_SEL_SHIFT 2
> +#define MIPI_RX_ANA10_CSI1A_RG_CSI1A_DPHY_L0_VREF_SEL_MASK (0x3f << 2)
> +#define MIPI_RX_ANA10_CSI1A_RG_CSI1A_DPHY_L1_DELAYCAL_EN_SHIFT 8
> +#define MIPI_RX_ANA10_CSI1A_RG_CSI1A_DPHY_L1_DELAYCAL_EN_MASK (0x1 << 8)
> +#define MIPI_RX_ANA10_CSI1A_RG_CSI1A_DPHY_L1_DELAYCAL_RSTB_SHIFT 9
> +#define MIPI_RX_ANA10_CSI1A_RG_CSI1A_DPHY_L1_DELAYCAL_RSTB_MASK (0x1 << 9)
> +#define MIPI_RX_ANA10_CSI1A_RG_CSI1A_DPHY_L1_VREF_SEL_SHIFT 10
> +#define MIPI_RX_ANA10_CSI1A_RG_CSI1A_DPHY_L1_VREF_SEL_MASK (0x3f << 10)
> +#define MIPI_RX_ANA10_CSI1A_RG_CSI1A_DPHY_L2_DELAYCAL_EN_SHIFT 16
> +#define MIPI_RX_ANA10_CSI1A_RG_CSI1A_DPHY_L2_DELAYCAL_EN_MASK (0x1 << 16)
> +#define MIPI_RX_ANA10_CSI1A_RG_CSI1A_DPHY_L2_DELAYCAL_RSTB_SHIFT 17
> +#define MIPI_RX_ANA10_CSI1A_RG_CSI1A_DPHY_L2_DELAYCAL_RSTB_MASK (0x1 << 17)
> +#define MIPI_RX_ANA10_CSI1A_RG_CSI1A_DPHY_L2_VREF_SEL_SHIFT 18
> +#define MIPI_RX_ANA10_CSI1A_RG_CSI1A_DPHY_L2_VREF_SEL_MASK (0x3f << 18)
> +#define MIPI_RX_ANA18_CSI1A                                    0x2018
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L0_EQ_OS_CAL_EN_SHIFT 0
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L0_EQ_OS_CAL_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L0_EQ_MON_EN_SHIFT 1
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L0_EQ_MON_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L0_EQ_SCA_SHIFT 2
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L0_EQ_SCA_MASK (0x1 << 2)
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L0_EQ_SCB_SHIFT 3
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L0_EQ_SCB_MASK (0x1 << 3)
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L0_EQ_IS_SHIFT 4
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L0_EQ_IS_MASK (0x3 << 4)
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L0_EQ_BW_SHIFT 6
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L0_EQ_BW_MASK (0x3 << 6)
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L0_EQ_SRA_SHIFT 8
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L0_EQ_SRA_MASK (0xf << 8)
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L0_EQ_SRB_SHIFT 12
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L0_EQ_SRB_MASK (0xf << 12)
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L1_EQ_OS_CAL_EN_SHIFT 16
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L1_EQ_OS_CAL_EN_MASK (0x1 << 16)
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L1_EQ_MON_EN_SHIFT 17
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L1_EQ_MON_EN_MASK (0x1 << 17)
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L1_EQ_SCA_SHIFT 18
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L1_EQ_SCA_MASK (0x1 << 18)
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L1_EQ_SCB_SHIFT 19
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L1_EQ_SCB_MASK (0x1 << 19)
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L1_EQ_IS_SHIFT 20
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L1_EQ_IS_MASK (0x3 << 20)
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L1_EQ_BW_SHIFT 22
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L1_EQ_BW_MASK (0x3 << 22)
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L1_EQ_SRA_SHIFT 24
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L1_EQ_SRA_MASK (0xf << 24)
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L1_EQ_SRB_SHIFT 28
> +#define MIPI_RX_ANA18_CSI1A_RG_CSI1A_L1_EQ_SRB_MASK (0xf << 28)
> +#define MIPI_RX_ANA1C_CSI1A                                    0x201C
> +#define MIPI_RX_ANA1C_CSI1A_RG_CSI1A_L2_EQ_OS_CAL_EN_SHIFT 0
> +#define MIPI_RX_ANA1C_CSI1A_RG_CSI1A_L2_EQ_OS_CAL_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA1C_CSI1A_RG_CSI1A_L2_EQ_MON_EN_SHIFT 1
> +#define MIPI_RX_ANA1C_CSI1A_RG_CSI1A_L2_EQ_MON_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA1C_CSI1A_RG_CSI1A_L2_EQ_SCA_SHIFT 2
> +#define MIPI_RX_ANA1C_CSI1A_RG_CSI1A_L2_EQ_SCA_MASK (0x1 << 2)
> +#define MIPI_RX_ANA1C_CSI1A_RG_CSI1A_L2_EQ_SCB_SHIFT 3
> +#define MIPI_RX_ANA1C_CSI1A_RG_CSI1A_L2_EQ_SCB_MASK (0x1 << 3)
> +#define MIPI_RX_ANA1C_CSI1A_RG_CSI1A_L2_EQ_IS_SHIFT 4
> +#define MIPI_RX_ANA1C_CSI1A_RG_CSI1A_L2_EQ_IS_MASK (0x3 << 4)
> +#define MIPI_RX_ANA1C_CSI1A_RG_CSI1A_L2_EQ_BW_SHIFT 6
> +#define MIPI_RX_ANA1C_CSI1A_RG_CSI1A_L2_EQ_BW_MASK (0x3 << 6)
> +#define MIPI_RX_ANA1C_CSI1A_RG_CSI1A_L2_EQ_SRA_SHIFT 8
> +#define MIPI_RX_ANA1C_CSI1A_RG_CSI1A_L2_EQ_SRA_MASK (0xf << 8)
> +#define MIPI_RX_ANA1C_CSI1A_RG_CSI1A_L2_EQ_SRB_SHIFT 12
> +#define MIPI_RX_ANA1C_CSI1A_RG_CSI1A_L2_EQ_SRB_MASK (0xf << 12)
> +#define MIPI_RX_ANA24_CSI1A                                    0x2024
> +#define MIPI_RX_ANA24_CSI1A_RG_CSI1A_RESERVE_SHIFT 24
> +#define MIPI_RX_ANA24_CSI1A_RG_CSI1A_RESERVE_MASK (0xff << 24)
> +#define MIPI_RX_ANA48_CSI1A                                    0x2048
> +#define MIPI_RX_ANA48_CSI1A_RGS_CSI1A_DPHY_L0_OS_CAL_CPLT_SHIFT 3
> +#define MIPI_RX_ANA48_CSI1A_RGS_CSI1A_DPHY_L0_OS_CAL_CPLT_MASK (0x1 << 3)
> +#define MIPI_RX_ANA48_CSI1A_RGS_CSI1A_DPHY_L1_OS_CAL_CPLT_SHIFT 4
> +#define MIPI_RX_ANA48_CSI1A_RGS_CSI1A_DPHY_L1_OS_CAL_CPLT_MASK (0x1 << 4)
> +#define MIPI_RX_ANA48_CSI1A_RGS_CSI1A_DPHY_L2_OS_CAL_CPLT_SHIFT 5
> +#define MIPI_RX_ANA48_CSI1A_RGS_CSI1A_DPHY_L2_OS_CAL_CPLT_MASK (0x1 << 5)
> +#define MIPI_RX_ANA48_CSI1A_RGS_CSI1A_OS_CAL_CODE_SHIFT 8
> +#define MIPI_RX_ANA48_CSI1A_RGS_CSI1A_OS_CAL_CODE_MASK (0xff << 8)
> +#define MIPI_RX_WRAPPER80_CSI1A                                0x2080
> +#define MIPI_RX_WRAPPER80_CSI1A_CSR_CSI_CLK_MON_SHIFT 0
> +#define MIPI_RX_WRAPPER80_CSI1A_CSR_CSI_CLK_MON_MASK (0x1 << 0)
> +#define MIPI_RX_WRAPPER80_CSI1A_CSR_CSI_MON_MUX_SHIFT 8
> +#define MIPI_RX_WRAPPER80_CSI1A_CSR_CSI_MON_MUX_MASK (0xff << 8)
> +#define MIPI_RX_WRAPPER80_CSI1A_CSR_CSI_RST_MODE_SHIFT 16
> +#define MIPI_RX_WRAPPER80_CSI1A_CSR_CSI_RST_MODE_MASK (0x3 << 16)
> +#define MIPI_RX_WRAPPER80_CSI1A_CSR_SW_RST_SHIFT 24
> +#define MIPI_RX_WRAPPER80_CSI1A_CSR_SW_RST_MASK (0xf << 24)
> +#define MIPI_RX_WRAPPER84_CSI1A                                0x2084
> +#define MIPI_RX_WRAPPER84_CSI1A_CSI_DEBUG_OUT_SHIFT 0
> +#define MIPI_RX_WRAPPER84_CSI1A_CSI_DEBUG_OUT_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER88_CSI1A                                0x2088
> +#define MIPI_RX_WRAPPER88_CSI1A_CSR_SW_MODE_0_SHIFT 0
> +#define MIPI_RX_WRAPPER88_CSI1A_CSR_SW_MODE_0_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER8C_CSI1A                                0x208C
> +#define MIPI_RX_WRAPPER8C_CSI1A_CSR_SW_MODE_1_SHIFT 0
> +#define MIPI_RX_WRAPPER8C_CSI1A_CSR_SW_MODE_1_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER90_CSI1A                                0x2090
> +#define MIPI_RX_WRAPPER90_CSI1A_CSR_SW_MODE_2_SHIFT 0
> +#define MIPI_RX_WRAPPER90_CSI1A_CSR_SW_MODE_2_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER94_CSI1A                                0x2094
> +#define MIPI_RX_WRAPPER94_CSI1A_CSR_SW_VALUE_0_SHIFT 0
> +#define MIPI_RX_WRAPPER94_CSI1A_CSR_SW_VALUE_0_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER98_CSI1A                                0x2098
> +#define MIPI_RX_WRAPPER98_CSI1A_CSR_SW_VALUE_1_SHIFT 0
> +#define MIPI_RX_WRAPPER98_CSI1A_CSR_SW_VALUE_1_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER9C_CSI1A                                0x209C
> +#define MIPI_RX_WRAPPER9C_CSI1A_CSR_SW_VALUE_2_SHIFT 0
> +#define MIPI_RX_WRAPPER9C_CSI1A_CSR_SW_VALUE_2_MASK (0xffffffff << 0)
> +#define MIPI_RX_ANAA4_CSI1A                                    0x20A4
> +#define MIPI_RX_ANAA4_CSI1A_RG_CSI1A_DPHY_L0_SYNC_INIT_SEL_SHIFT 0
> +#define MIPI_RX_ANAA4_CSI1A_RG_CSI1A_DPHY_L0_SYNC_INIT_SEL_MASK (0x1 << 0)
> +#define MIPI_RX_ANAA4_CSI1A_RG_CSI1A_DPHY_L0_FORCE_INIT_SHIFT 1
> +#define MIPI_RX_ANAA4_CSI1A_RG_CSI1A_DPHY_L0_FORCE_INIT_MASK (0x1 << 1)
> +#define MIPI_RX_ANAA4_CSI1A_RG_CSI1A_DPHY_L1_SYNC_INIT_SEL_SHIFT 2
> +#define MIPI_RX_ANAA4_CSI1A_RG_CSI1A_DPHY_L1_SYNC_INIT_SEL_MASK (0x1 << 2)
> +#define MIPI_RX_ANAA4_CSI1A_RG_CSI1A_DPHY_L1_FORCE_INIT_SHIFT 3
> +#define MIPI_RX_ANAA4_CSI1A_RG_CSI1A_DPHY_L1_FORCE_INIT_MASK (0x1 << 3)
> +#define MIPI_RX_ANAA4_CSI1A_RG_CSI1A_DPHY_L2_SYNC_INIT_SEL_SHIFT 4
> +#define MIPI_RX_ANAA4_CSI1A_RG_CSI1A_DPHY_L2_SYNC_INIT_SEL_MASK (0x1 << 4)
> +#define MIPI_RX_ANAA4_CSI1A_RG_CSI1A_DPHY_L2_FORCE_INIT_SHIFT 5
> +#define MIPI_RX_ANAA4_CSI1A_RG_CSI1A_DPHY_L2_FORCE_INIT_MASK (0x1 << 5)
> +#define MIPI_RX_ANAA8_CSI1A                                    0x20A8
> +#define MIPI_RX_ANAA8_CSI1A_RG_CSI1A_DPHY_L0_BYTECK_INVERT_SHIFT 0
> +#define MIPI_RX_ANAA8_CSI1A_RG_CSI1A_DPHY_L0_BYTECK_INVERT_MASK (0x1 << 0)
> +#define MIPI_RX_ANAA8_CSI1A_RG_CSI1A_DPHY_L1_BYTECK_INVERT_SHIFT 1
> +#define MIPI_RX_ANAA8_CSI1A_RG_CSI1A_DPHY_L1_BYTECK_INVERT_MASK (0x1 << 1)
> +#define MIPI_RX_ANAA8_CSI1A_RG_CSI1A_DPHY_L2_BYTECK_INVERT_SHIFT 2
> +#define MIPI_RX_ANAA8_CSI1A_RG_CSI1A_DPHY_L2_BYTECK_INVERT_MASK (0x1 << 2)
> +#define MIPI_RX_ANAA8_CSI1A_RG_CSI1A_DPHY_HSDET_LEVEL_MODE_EN_SHIFT 3
> +#define MIPI_RX_ANAA8_CSI1A_RG_CSI1A_DPHY_HSDET_LEVEL_MODE_EN_MASK (0x1 << 3)
> +#define MIPI_RX_ANAA8_CSI1A_RG_CSI1A_OS_CAL_SEL_SHIFT 4
> +#define MIPI_RX_ANAA8_CSI1A_RG_CSI1A_OS_CAL_SEL_MASK (0x7 << 4)
> +#define MIPI_RX_ANAA8_CSI1A_RG_CSI1A_DPHY_HSDET_DIG_BACK_EN_SHIFT 7
> +#define MIPI_RX_ANAA8_CSI1A_RG_CSI1A_DPHY_HSDET_DIG_BACK_EN_MASK (0x1 << 7)
> +#define MIPI_RX_ANAA8_CSI1A_RG_CSI1A_DPHY_DELAYCAL_CK_SEL_SHIFT 8
> +#define MIPI_RX_ANAA8_CSI1A_RG_CSI1A_DPHY_DELAYCAL_CK_SEL_MASK (0x7 << 8)
> +#define MIPI_RX_ANAA8_CSI1A_RG_CSI1A_OS_CAL_DIV_SHIFT 11
> +#define MIPI_RX_ANAA8_CSI1A_RG_CSI1A_OS_CAL_DIV_MASK (0x3 << 11)
> +#define MIPI_RX_ANA00_CSI1B                                    0x3000
> +#define MIPI_RX_ANA00_CSI1B_RG_CSI1B_EQ_PROTECT_EN_SHIFT 1
> +#define MIPI_RX_ANA00_CSI1B_RG_CSI1B_EQ_PROTECT_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA00_CSI1B_RG_CSI1B_BG_LPF_EN_SHIFT 2
> +#define MIPI_RX_ANA00_CSI1B_RG_CSI1B_BG_LPF_EN_MASK (0x1 << 2)
> +#define MIPI_RX_ANA00_CSI1B_RG_CSI1B_BG_CORE_EN_SHIFT 3
> +#define MIPI_RX_ANA00_CSI1B_RG_CSI1B_BG_CORE_EN_MASK (0x1 << 3)
> +#define MIPI_RX_ANA00_CSI1B_RG_CSI1B_DPHY_L0_CKMODE_EN_SHIFT 5
> +#define MIPI_RX_ANA00_CSI1B_RG_CSI1B_DPHY_L0_CKMODE_EN_MASK (0x1 << 5)
> +#define MIPI_RX_ANA00_CSI1B_RG_CSI1B_DPHY_L0_CKSEL_SHIFT 6
> +#define MIPI_RX_ANA00_CSI1B_RG_CSI1B_DPHY_L0_CKSEL_MASK (0x1 << 6)
> +#define MIPI_RX_ANA00_CSI1B_RG_CSI1B_DPHY_L1_CKMODE_EN_SHIFT 8
> +#define MIPI_RX_ANA00_CSI1B_RG_CSI1B_DPHY_L1_CKMODE_EN_MASK (0x1 << 8)
> +#define MIPI_RX_ANA00_CSI1B_RG_CSI1B_DPHY_L1_CKSEL_SHIFT 9
> +#define MIPI_RX_ANA00_CSI1B_RG_CSI1B_DPHY_L1_CKSEL_MASK (0x1 << 9)
> +#define MIPI_RX_ANA00_CSI1B_RG_CSI1B_DPHY_L2_CKMODE_EN_SHIFT 11
> +#define MIPI_RX_ANA00_CSI1B_RG_CSI1B_DPHY_L2_CKMODE_EN_MASK (0x1 << 11)
> +#define MIPI_RX_ANA00_CSI1B_RG_CSI1B_DPHY_L2_CKSEL_SHIFT 12
> +#define MIPI_RX_ANA00_CSI1B_RG_CSI1B_DPHY_L2_CKSEL_MASK (0x1 << 12)
> +#define MIPI_RX_ANA04_CSI1B                                    0x3004
> +#define MIPI_RX_ANA04_CSI1B_RG_CSI1B_BG_LPRX_VTH_SEL_SHIFT 0
> +#define MIPI_RX_ANA04_CSI1B_RG_CSI1B_BG_LPRX_VTH_SEL_MASK (0x7 << 0)
> +#define MIPI_RX_ANA04_CSI1B_RG_CSI1B_BG_LPRX_VTL_SEL_SHIFT 4
> +#define MIPI_RX_ANA04_CSI1B_RG_CSI1B_BG_LPRX_VTL_SEL_MASK (0x7 << 4)
> +#define MIPI_RX_ANA04_CSI1B_RG_CSI1B_BG_HSDET_VTH_SEL_SHIFT 8
> +#define MIPI_RX_ANA04_CSI1B_RG_CSI1B_BG_HSDET_VTH_SEL_MASK (0x7 << 8)
> +#define MIPI_RX_ANA04_CSI1B_RG_CSI1B_BG_HSDET_VTL_SEL_SHIFT 12
> +#define MIPI_RX_ANA04_CSI1B_RG_CSI1B_BG_HSDET_VTL_SEL_MASK (0x7 << 12)
> +#define MIPI_RX_ANA04_CSI1B_RG_CSI1B_BG_VREF_SEL_SHIFT 16
> +#define MIPI_RX_ANA04_CSI1B_RG_CSI1B_BG_VREF_SEL_MASK (0xf << 16)
> +#define MIPI_RX_ANA04_CSI1B_RG_CSI1B_BG_MON_VREF_SEL_SHIFT 24
> +#define MIPI_RX_ANA04_CSI1B_RG_CSI1B_BG_MON_VREF_SEL_MASK (0xf << 24)
> +#define MIPI_RX_ANA04_CSI1B_RG_CSI1B_FORCE_HSRT_EN_SHIFT 28
> +#define MIPI_RX_ANA04_CSI1B_RG_CSI1B_FORCE_HSRT_EN_MASK (0x1 << 28)
> +#define MIPI_RX_ANA08_CSI1B                                    0x3008
> +#define MIPI_RX_ANA08_CSI1B_RG_CSI1B_L0P_HSRT_CODE_SHIFT 0
> +#define MIPI_RX_ANA08_CSI1B_RG_CSI1B_L0P_HSRT_CODE_MASK (0x1f << 0)
> +#define MIPI_RX_ANA08_CSI1B_RG_CSI1B_L0N_HSRT_CODE_SHIFT 8
> +#define MIPI_RX_ANA08_CSI1B_RG_CSI1B_L0N_HSRT_CODE_MASK (0x1f << 8)
> +#define MIPI_RX_ANA08_CSI1B_RG_CSI1B_L1P_HSRT_CODE_SHIFT 16
> +#define MIPI_RX_ANA08_CSI1B_RG_CSI1B_L1P_HSRT_CODE_MASK (0x1f << 16)
> +#define MIPI_RX_ANA08_CSI1B_RG_CSI1B_L1N_HSRT_CODE_SHIFT 24
> +#define MIPI_RX_ANA08_CSI1B_RG_CSI1B_L1N_HSRT_CODE_MASK (0x1f << 24)
> +#define MIPI_RX_ANA0C_CSI1B                                    0x300C
> +#define MIPI_RX_ANA0C_CSI1B_RG_CSI1B_L2P_HSRT_CODE_SHIFT 0
> +#define MIPI_RX_ANA0C_CSI1B_RG_CSI1B_L2P_HSRT_CODE_MASK (0x1f << 0)
> +#define MIPI_RX_ANA0C_CSI1B_RG_CSI1B_L2N_HSRT_CODE_SHIFT 8
> +#define MIPI_RX_ANA0C_CSI1B_RG_CSI1B_L2N_HSRT_CODE_MASK (0x1f << 8)
> +#define MIPI_RX_ANA10_CSI1B                                    0x3010
> +#define MIPI_RX_ANA10_CSI1B_RG_CSI1B_DPHY_L0_DELAYCAL_EN_SHIFT 0
> +#define MIPI_RX_ANA10_CSI1B_RG_CSI1B_DPHY_L0_DELAYCAL_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA10_CSI1B_RG_CSI1B_DPHY_L0_DELAYCAL_RSTB_SHIFT 1
> +#define MIPI_RX_ANA10_CSI1B_RG_CSI1B_DPHY_L0_DELAYCAL_RSTB_MASK (0x1 << 1)
> +#define MIPI_RX_ANA10_CSI1B_RG_CSI1B_DPHY_L0_VREF_SEL_SHIFT 2
> +#define MIPI_RX_ANA10_CSI1B_RG_CSI1B_DPHY_L0_VREF_SEL_MASK (0x3f << 2)
> +#define MIPI_RX_ANA10_CSI1B_RG_CSI1B_DPHY_L1_DELAYCAL_EN_SHIFT 8
> +#define MIPI_RX_ANA10_CSI1B_RG_CSI1B_DPHY_L1_DELAYCAL_EN_MASK (0x1 << 8)
> +#define MIPI_RX_ANA10_CSI1B_RG_CSI1B_DPHY_L1_DELAYCAL_RSTB_SHIFT 9
> +#define MIPI_RX_ANA10_CSI1B_RG_CSI1B_DPHY_L1_DELAYCAL_RSTB_MASK (0x1 << 9)
> +#define MIPI_RX_ANA10_CSI1B_RG_CSI1B_DPHY_L1_VREF_SEL_SHIFT 10
> +#define MIPI_RX_ANA10_CSI1B_RG_CSI1B_DPHY_L1_VREF_SEL_MASK (0x3f << 10)
> +#define MIPI_RX_ANA10_CSI1B_RG_CSI1B_DPHY_L2_DELAYCAL_EN_SHIFT 16
> +#define MIPI_RX_ANA10_CSI1B_RG_CSI1B_DPHY_L2_DELAYCAL_EN_MASK (0x1 << 16)
> +#define MIPI_RX_ANA10_CSI1B_RG_CSI1B_DPHY_L2_DELAYCAL_RSTB_SHIFT 17
> +#define MIPI_RX_ANA10_CSI1B_RG_CSI1B_DPHY_L2_DELAYCAL_RSTB_MASK (0x1 << 17)
> +#define MIPI_RX_ANA10_CSI1B_RG_CSI1B_DPHY_L2_VREF_SEL_SHIFT 18
> +#define MIPI_RX_ANA10_CSI1B_RG_CSI1B_DPHY_L2_VREF_SEL_MASK (0x3f << 18)
> +#define MIPI_RX_ANA18_CSI1B                                    0x3018
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L0_EQ_OS_CAL_EN_SHIFT 0
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L0_EQ_OS_CAL_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L0_EQ_MON_EN_SHIFT 1
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L0_EQ_MON_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L0_EQ_SCA_SHIFT 2
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L0_EQ_SCA_MASK (0x1 << 2)
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L0_EQ_SCB_SHIFT 3
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L0_EQ_SCB_MASK (0x1 << 3)
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L0_EQ_IS_SHIFT 4
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L0_EQ_IS_MASK (0x3 << 4)
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L0_EQ_BW_SHIFT 6
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L0_EQ_BW_MASK (0x3 << 6)
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L0_EQ_SRA_SHIFT 8
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L0_EQ_SRA_MASK (0xf << 8)
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L0_EQ_SRB_SHIFT 12
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L0_EQ_SRB_MASK (0xf << 12)
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L1_EQ_OS_CAL_EN_SHIFT 16
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L1_EQ_OS_CAL_EN_MASK (0x1 << 16)
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L1_EQ_MON_EN_SHIFT 17
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L1_EQ_MON_EN_MASK (0x1 << 17)
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L1_EQ_SCA_SHIFT 18
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L1_EQ_SCA_MASK (0x1 << 18)
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L1_EQ_SCB_SHIFT 19
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L1_EQ_SCB_MASK (0x1 << 19)
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L1_EQ_IS_SHIFT 20
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L1_EQ_IS_MASK (0x3 << 20)
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L1_EQ_BW_SHIFT 22
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L1_EQ_BW_MASK (0x3 << 22)
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L1_EQ_SRA_SHIFT 24
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L1_EQ_SRA_MASK (0xf << 24)
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L1_EQ_SRB_SHIFT 28
> +#define MIPI_RX_ANA18_CSI1B_RG_CSI1B_L1_EQ_SRB_MASK (0xf << 28)
> +#define MIPI_RX_ANA1C_CSI1B                                    0x301C
> +#define MIPI_RX_ANA1C_CSI1B_RG_CSI1B_L2_EQ_OS_CAL_EN_SHIFT 0
> +#define MIPI_RX_ANA1C_CSI1B_RG_CSI1B_L2_EQ_OS_CAL_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA1C_CSI1B_RG_CSI1B_L2_EQ_MON_EN_SHIFT 1
> +#define MIPI_RX_ANA1C_CSI1B_RG_CSI1B_L2_EQ_MON_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA1C_CSI1B_RG_CSI1B_L2_EQ_SCA_SHIFT 2
> +#define MIPI_RX_ANA1C_CSI1B_RG_CSI1B_L2_EQ_SCA_MASK (0x1 << 2)
> +#define MIPI_RX_ANA1C_CSI1B_RG_CSI1B_L2_EQ_SCB_SHIFT 3
> +#define MIPI_RX_ANA1C_CSI1B_RG_CSI1B_L2_EQ_SCB_MASK (0x1 << 3)
> +#define MIPI_RX_ANA1C_CSI1B_RG_CSI1B_L2_EQ_IS_SHIFT 4
> +#define MIPI_RX_ANA1C_CSI1B_RG_CSI1B_L2_EQ_IS_MASK (0x3 << 4)
> +#define MIPI_RX_ANA1C_CSI1B_RG_CSI1B_L2_EQ_BW_SHIFT 6
> +#define MIPI_RX_ANA1C_CSI1B_RG_CSI1B_L2_EQ_BW_MASK (0x3 << 6)
> +#define MIPI_RX_ANA1C_CSI1B_RG_CSI1B_L2_EQ_SRA_SHIFT 8
> +#define MIPI_RX_ANA1C_CSI1B_RG_CSI1B_L2_EQ_SRA_MASK (0xf << 8)
> +#define MIPI_RX_ANA1C_CSI1B_RG_CSI1B_L2_EQ_SRB_SHIFT 12
> +#define MIPI_RX_ANA1C_CSI1B_RG_CSI1B_L2_EQ_SRB_MASK (0xf << 12)
> +#define MIPI_RX_ANA24_CSI1B                                    0x3024
> +#define MIPI_RX_ANA24_CSI1B_RG_CSI1B_RESERVE_SHIFT 24
> +#define MIPI_RX_ANA24_CSI1B_RG_CSI1B_RESERVE_MASK (0xff << 24)
> +#define MIPI_RX_ANA48_CSI1B                                    0x3048
> +#define MIPI_RX_ANA48_CSI1B_RGS_CSI1B_DPHY_L0_OS_CAL_CPLT_SHIFT 3
> +#define MIPI_RX_ANA48_CSI1B_RGS_CSI1B_DPHY_L0_OS_CAL_CPLT_MASK (0x1 << 3)
> +#define MIPI_RX_ANA48_CSI1B_RGS_CSI1B_DPHY_L1_OS_CAL_CPLT_SHIFT 4
> +#define MIPI_RX_ANA48_CSI1B_RGS_CSI1B_DPHY_L1_OS_CAL_CPLT_MASK (0x1 << 4)
> +#define MIPI_RX_ANA48_CSI1B_RGS_CSI1B_DPHY_L2_OS_CAL_CPLT_SHIFT 5
> +#define MIPI_RX_ANA48_CSI1B_RGS_CSI1B_DPHY_L2_OS_CAL_CPLT_MASK (0x1 << 5)
> +#define MIPI_RX_ANA48_CSI1B_RGS_CSI1B_OS_CAL_CODE_SHIFT 8
> +#define MIPI_RX_ANA48_CSI1B_RGS_CSI1B_OS_CAL_CODE_MASK (0xff << 8)
> +#define MIPI_RX_WRAPPER80_CSI1B                                0x3080
> +#define MIPI_RX_WRAPPER80_CSI1B_CSR_CSI_CLK_MON_SHIFT 0
> +#define MIPI_RX_WRAPPER80_CSI1B_CSR_CSI_CLK_MON_MASK (0x1 << 0)
> +#define MIPI_RX_WRAPPER80_CSI1B_CSR_CSI_MON_MUX_SHIFT 8
> +#define MIPI_RX_WRAPPER80_CSI1B_CSR_CSI_MON_MUX_MASK (0xff << 8)
> +#define MIPI_RX_WRAPPER80_CSI1B_CSR_CSI_RST_MODE_SHIFT 16
> +#define MIPI_RX_WRAPPER80_CSI1B_CSR_CSI_RST_MODE_MASK (0x3 << 16)
> +#define MIPI_RX_WRAPPER80_CSI1B_CSR_SW_RST_SHIFT 24
> +#define MIPI_RX_WRAPPER80_CSI1B_CSR_SW_RST_MASK (0xf << 24)
> +#define MIPI_RX_WRAPPER84_CSI1B                                0x3084
> +#define MIPI_RX_WRAPPER84_CSI1B_CSI_DEBUG_OUT_SHIFT 0
> +#define MIPI_RX_WRAPPER84_CSI1B_CSI_DEBUG_OUT_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER88_CSI1B                                0x3088
> +#define MIPI_RX_WRAPPER88_CSI1B_CSR_SW_MODE_0_SHIFT 0
> +#define MIPI_RX_WRAPPER88_CSI1B_CSR_SW_MODE_0_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER8C_CSI1B                                0x308C
> +#define MIPI_RX_WRAPPER8C_CSI1B_CSR_SW_MODE_1_SHIFT 0
> +#define MIPI_RX_WRAPPER8C_CSI1B_CSR_SW_MODE_1_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER90_CSI1B                                0x3090
> +#define MIPI_RX_WRAPPER90_CSI1B_CSR_SW_MODE_2_SHIFT 0
> +#define MIPI_RX_WRAPPER90_CSI1B_CSR_SW_MODE_2_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER94_CSI1B                                0x3094
> +#define MIPI_RX_WRAPPER94_CSI1B_CSR_SW_VALUE_0_SHIFT 0
> +#define MIPI_RX_WRAPPER94_CSI1B_CSR_SW_VALUE_0_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER98_CSI1B                                0x3098
> +#define MIPI_RX_WRAPPER98_CSI1B_CSR_SW_VALUE_1_SHIFT 0
> +#define MIPI_RX_WRAPPER98_CSI1B_CSR_SW_VALUE_1_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER9C_CSI1B                                0x309C
> +#define MIPI_RX_WRAPPER9C_CSI1B_CSR_SW_VALUE_2_SHIFT 0
> +#define MIPI_RX_WRAPPER9C_CSI1B_CSR_SW_VALUE_2_MASK (0xffffffff << 0)
> +#define MIPI_RX_ANAA4_CSI1B                                    0x30A4
> +#define MIPI_RX_ANAA4_CSI1B_RG_CSI1B_DPHY_L0_SYNC_INIT_SEL_SHIFT 0
> +#define MIPI_RX_ANAA4_CSI1B_RG_CSI1B_DPHY_L0_SYNC_INIT_SEL_MASK (0x1 << 0)
> +#define MIPI_RX_ANAA4_CSI1B_RG_CSI1B_DPHY_L0_FORCE_INIT_SHIFT 1
> +#define MIPI_RX_ANAA4_CSI1B_RG_CSI1B_DPHY_L0_FORCE_INIT_MASK (0x1 << 1)
> +#define MIPI_RX_ANAA4_CSI1B_RG_CSI1B_DPHY_L1_SYNC_INIT_SEL_SHIFT 2
> +#define MIPI_RX_ANAA4_CSI1B_RG_CSI1B_DPHY_L1_SYNC_INIT_SEL_MASK (0x1 << 2)
> +#define MIPI_RX_ANAA4_CSI1B_RG_CSI1B_DPHY_L1_FORCE_INIT_SHIFT 3
> +#define MIPI_RX_ANAA4_CSI1B_RG_CSI1B_DPHY_L1_FORCE_INIT_MASK (0x1 << 3)
> +#define MIPI_RX_ANAA4_CSI1B_RG_CSI1B_DPHY_L2_SYNC_INIT_SEL_SHIFT 4
> +#define MIPI_RX_ANAA4_CSI1B_RG_CSI1B_DPHY_L2_SYNC_INIT_SEL_MASK (0x1 << 4)
> +#define MIPI_RX_ANAA4_CSI1B_RG_CSI1B_DPHY_L2_FORCE_INIT_SHIFT 5
> +#define MIPI_RX_ANAA4_CSI1B_RG_CSI1B_DPHY_L2_FORCE_INIT_MASK (0x1 << 5)
> +#define MIPI_RX_ANAA8_CSI1B                                    0x30A8
> +#define MIPI_RX_ANAA8_CSI1B_RG_CSI1B_DPHY_L0_BYTECK_INVERT_SHIFT 0
> +#define MIPI_RX_ANAA8_CSI1B_RG_CSI1B_DPHY_L0_BYTECK_INVERT_MASK (0x1 << 0)
> +#define MIPI_RX_ANAA8_CSI1B_RG_CSI1B_DPHY_L1_BYTECK_INVERT_SHIFT 1
> +#define MIPI_RX_ANAA8_CSI1B_RG_CSI1B_DPHY_L1_BYTECK_INVERT_MASK (0x1 << 1)
> +#define MIPI_RX_ANAA8_CSI1B_RG_CSI1B_DPHY_L2_BYTECK_INVERT_SHIFT 2
> +#define MIPI_RX_ANAA8_CSI1B_RG_CSI1B_DPHY_L2_BYTECK_INVERT_MASK (0x1 << 2)
> +#define MIPI_RX_ANAA8_CSI1B_RG_CSI1B_DPHY_HSDET_LEVEL_MODE_EN_SHIFT 3
> +#define MIPI_RX_ANAA8_CSI1B_RG_CSI1B_DPHY_HSDET_LEVEL_MODE_EN_MASK (0x1 << 3)
> +#define MIPI_RX_ANAA8_CSI1B_RG_CSI1B_OS_CAL_SEL_SHIFT 4
> +#define MIPI_RX_ANAA8_CSI1B_RG_CSI1B_OS_CAL_SEL_MASK (0x7 << 4)
> +#define MIPI_RX_ANAA8_CSI1B_RG_CSI1B_DPHY_HSDET_DIG_BACK_EN_SHIFT 7
> +#define MIPI_RX_ANAA8_CSI1B_RG_CSI1B_DPHY_HSDET_DIG_BACK_EN_MASK (0x1 << 7)
> +#define MIPI_RX_ANAA8_CSI1B_RG_CSI1B_DPHY_DELAYCAL_CK_SEL_SHIFT 8
> +#define MIPI_RX_ANAA8_CSI1B_RG_CSI1B_DPHY_DELAYCAL_CK_SEL_MASK (0x7 << 8)
> +#define MIPI_RX_ANAA8_CSI1B_RG_CSI1B_OS_CAL_DIV_SHIFT 11
> +#define MIPI_RX_ANAA8_CSI1B_RG_CSI1B_OS_CAL_DIV_MASK (0x3 << 11)
> +#define MIPI_RX_ANA00_CSI2A                                    0x4000
> +#define MIPI_RX_ANA00_CSI2A_RG_CSI2A_EQ_PROTECT_EN_SHIFT 1
> +#define MIPI_RX_ANA00_CSI2A_RG_CSI2A_EQ_PROTECT_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA00_CSI2A_RG_CSI2A_BG_LPF_EN_SHIFT 2
> +#define MIPI_RX_ANA00_CSI2A_RG_CSI2A_BG_LPF_EN_MASK (0x1 << 2)
> +#define MIPI_RX_ANA00_CSI2A_RG_CSI2A_BG_CORE_EN_SHIFT 3
> +#define MIPI_RX_ANA00_CSI2A_RG_CSI2A_BG_CORE_EN_MASK (0x1 << 3)
> +#define MIPI_RX_ANA00_CSI2A_RG_CSI2A_DPHY_L0_CKMODE_EN_SHIFT 5
> +#define MIPI_RX_ANA00_CSI2A_RG_CSI2A_DPHY_L0_CKMODE_EN_MASK (0x1 << 5)
> +#define MIPI_RX_ANA00_CSI2A_RG_CSI2A_DPHY_L0_CKSEL_SHIFT 6
> +#define MIPI_RX_ANA00_CSI2A_RG_CSI2A_DPHY_L0_CKSEL_MASK (0x1 << 6)
> +#define MIPI_RX_ANA00_CSI2A_RG_CSI2A_DPHY_L1_CKMODE_EN_SHIFT 8
> +#define MIPI_RX_ANA00_CSI2A_RG_CSI2A_DPHY_L1_CKMODE_EN_MASK (0x1 << 8)
> +#define MIPI_RX_ANA00_CSI2A_RG_CSI2A_DPHY_L1_CKSEL_SHIFT 9
> +#define MIPI_RX_ANA00_CSI2A_RG_CSI2A_DPHY_L1_CKSEL_MASK (0x1 << 9)
> +#define MIPI_RX_ANA00_CSI2A_RG_CSI2A_DPHY_L2_CKMODE_EN_SHIFT 11
> +#define MIPI_RX_ANA00_CSI2A_RG_CSI2A_DPHY_L2_CKMODE_EN_MASK (0x1 << 11)
> +#define MIPI_RX_ANA00_CSI2A_RG_CSI2A_DPHY_L2_CKSEL_SHIFT 12
> +#define MIPI_RX_ANA00_CSI2A_RG_CSI2A_DPHY_L2_CKSEL_MASK (0x1 << 12)
> +#define MIPI_RX_ANA04_CSI2A                                    0x4004
> +#define MIPI_RX_ANA04_CSI2A_RG_CSI2A_BG_LPRX_VTH_SEL_SHIFT 0
> +#define MIPI_RX_ANA04_CSI2A_RG_CSI2A_BG_LPRX_VTH_SEL_MASK (0x7 << 0)
> +#define MIPI_RX_ANA04_CSI2A_RG_CSI2A_BG_LPRX_VTL_SEL_SHIFT 4
> +#define MIPI_RX_ANA04_CSI2A_RG_CSI2A_BG_LPRX_VTL_SEL_MASK (0x7 << 4)
> +#define MIPI_RX_ANA04_CSI2A_RG_CSI2A_BG_HSDET_VTH_SEL_SHIFT 8
> +#define MIPI_RX_ANA04_CSI2A_RG_CSI2A_BG_HSDET_VTH_SEL_MASK (0x7 << 8)
> +#define MIPI_RX_ANA04_CSI2A_RG_CSI2A_BG_HSDET_VTL_SEL_SHIFT 12
> +#define MIPI_RX_ANA04_CSI2A_RG_CSI2A_BG_HSDET_VTL_SEL_MASK (0x7 << 12)
> +#define MIPI_RX_ANA04_CSI2A_RG_CSI2A_BG_VREF_SEL_SHIFT 16
> +#define MIPI_RX_ANA04_CSI2A_RG_CSI2A_BG_VREF_SEL_MASK (0xf << 16)
> +#define MIPI_RX_ANA04_CSI2A_RG_CSI2A_BG_MON_VREF_SEL_SHIFT 24
> +#define MIPI_RX_ANA04_CSI2A_RG_CSI2A_BG_MON_VREF_SEL_MASK (0xf << 24)
> +#define MIPI_RX_ANA04_CSI2A_RG_CSI2A_FORCE_HSRT_EN_SHIFT 28
> +#define MIPI_RX_ANA04_CSI2A_RG_CSI2A_FORCE_HSRT_EN_MASK (0x1 << 28)
> +#define MIPI_RX_ANA08_CSI2A                                    0x4008
> +#define MIPI_RX_ANA08_CSI2A_RG_CSI2A_L0P_HSRT_CODE_SHIFT 0
> +#define MIPI_RX_ANA08_CSI2A_RG_CSI2A_L0P_HSRT_CODE_MASK (0x1f << 0)
> +#define MIPI_RX_ANA08_CSI2A_RG_CSI2A_L0N_HSRT_CODE_SHIFT 8
> +#define MIPI_RX_ANA08_CSI2A_RG_CSI2A_L0N_HSRT_CODE_MASK (0x1f << 8)
> +#define MIPI_RX_ANA08_CSI2A_RG_CSI2A_L1P_HSRT_CODE_SHIFT 16
> +#define MIPI_RX_ANA08_CSI2A_RG_CSI2A_L1P_HSRT_CODE_MASK (0x1f << 16)
> +#define MIPI_RX_ANA08_CSI2A_RG_CSI2A_L1N_HSRT_CODE_SHIFT 24
> +#define MIPI_RX_ANA08_CSI2A_RG_CSI2A_L1N_HSRT_CODE_MASK (0x1f << 24)
> +#define MIPI_RX_ANA0C_CSI2A                                    0x400C
> +#define MIPI_RX_ANA0C_CSI2A_RG_CSI2A_L2P_HSRT_CODE_SHIFT 0
> +#define MIPI_RX_ANA0C_CSI2A_RG_CSI2A_L2P_HSRT_CODE_MASK (0x1f << 0)
> +#define MIPI_RX_ANA0C_CSI2A_RG_CSI2A_L2N_HSRT_CODE_SHIFT 8
> +#define MIPI_RX_ANA0C_CSI2A_RG_CSI2A_L2N_HSRT_CODE_MASK (0x1f << 8)
> +#define MIPI_RX_ANA10_CSI2A                                    0x4010
> +#define MIPI_RX_ANA10_CSI2A_RG_CSI2A_DPHY_L0_DELAYCAL_EN_SHIFT 0
> +#define MIPI_RX_ANA10_CSI2A_RG_CSI2A_DPHY_L0_DELAYCAL_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA10_CSI2A_RG_CSI2A_DPHY_L0_DELAYCAL_RSTB_SHIFT 1
> +#define MIPI_RX_ANA10_CSI2A_RG_CSI2A_DPHY_L0_DELAYCAL_RSTB_MASK (0x1 << 1)
> +#define MIPI_RX_ANA10_CSI2A_RG_CSI2A_DPHY_L0_VREF_SEL_SHIFT 2
> +#define MIPI_RX_ANA10_CSI2A_RG_CSI2A_DPHY_L0_VREF_SEL_MASK (0x3f << 2)
> +#define MIPI_RX_ANA10_CSI2A_RG_CSI2A_DPHY_L1_DELAYCAL_EN_SHIFT 8
> +#define MIPI_RX_ANA10_CSI2A_RG_CSI2A_DPHY_L1_DELAYCAL_EN_MASK (0x1 << 8)
> +#define MIPI_RX_ANA10_CSI2A_RG_CSI2A_DPHY_L1_DELAYCAL_RSTB_SHIFT 9
> +#define MIPI_RX_ANA10_CSI2A_RG_CSI2A_DPHY_L1_DELAYCAL_RSTB_MASK (0x1 << 9)
> +#define MIPI_RX_ANA10_CSI2A_RG_CSI2A_DPHY_L1_VREF_SEL_SHIFT 10
> +#define MIPI_RX_ANA10_CSI2A_RG_CSI2A_DPHY_L1_VREF_SEL_MASK (0x3f << 10)
> +#define MIPI_RX_ANA10_CSI2A_RG_CSI2A_DPHY_L2_DELAYCAL_EN_SHIFT 16
> +#define MIPI_RX_ANA10_CSI2A_RG_CSI2A_DPHY_L2_DELAYCAL_EN_MASK (0x1 << 16)
> +#define MIPI_RX_ANA10_CSI2A_RG_CSI2A_DPHY_L2_DELAYCAL_RSTB_SHIFT 17
> +#define MIPI_RX_ANA10_CSI2A_RG_CSI2A_DPHY_L2_DELAYCAL_RSTB_MASK (0x1 << 17)
> +#define MIPI_RX_ANA10_CSI2A_RG_CSI2A_DPHY_L2_VREF_SEL_SHIFT 18
> +#define MIPI_RX_ANA10_CSI2A_RG_CSI2A_DPHY_L2_VREF_SEL_MASK (0x3f << 18)
> +#define MIPI_RX_ANA18_CSI2A                                    0x4018
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L0_EQ_OS_CAL_EN_SHIFT 0
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L0_EQ_OS_CAL_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L0_EQ_MON_EN_SHIFT 1
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L0_EQ_MON_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L0_EQ_SCA_SHIFT 2
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L0_EQ_SCA_MASK (0x1 << 2)
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L0_EQ_SCB_SHIFT 3
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L0_EQ_SCB_MASK (0x1 << 3)
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L0_EQ_IS_SHIFT 4
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L0_EQ_IS_MASK (0x3 << 4)
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L0_EQ_BW_SHIFT 6
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L0_EQ_BW_MASK (0x3 << 6)
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L0_EQ_SRA_SHIFT 8
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L0_EQ_SRA_MASK (0xf << 8)
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L0_EQ_SRB_SHIFT 12
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L0_EQ_SRB_MASK (0xf << 12)
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L1_EQ_OS_CAL_EN_SHIFT 16
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L1_EQ_OS_CAL_EN_MASK (0x1 << 16)
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L1_EQ_MON_EN_SHIFT 17
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L1_EQ_MON_EN_MASK (0x1 << 17)
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L1_EQ_SCA_SHIFT 18
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L1_EQ_SCA_MASK (0x1 << 18)
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L1_EQ_SCB_SHIFT 19
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L1_EQ_SCB_MASK (0x1 << 19)
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L1_EQ_IS_SHIFT 20
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L1_EQ_IS_MASK (0x3 << 20)
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L1_EQ_BW_SHIFT 22
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L1_EQ_BW_MASK (0x3 << 22)
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L1_EQ_SRA_SHIFT 24
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L1_EQ_SRA_MASK (0xf << 24)
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L1_EQ_SRB_SHIFT 28
> +#define MIPI_RX_ANA18_CSI2A_RG_CSI2A_L1_EQ_SRB_MASK (0xf << 28)
> +#define MIPI_RX_ANA1C_CSI2A                                    0x401C
> +#define MIPI_RX_ANA1C_CSI2A_RG_CSI2A_L2_EQ_OS_CAL_EN_SHIFT 0
> +#define MIPI_RX_ANA1C_CSI2A_RG_CSI2A_L2_EQ_OS_CAL_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA1C_CSI2A_RG_CSI2A_L2_EQ_MON_EN_SHIFT 1
> +#define MIPI_RX_ANA1C_CSI2A_RG_CSI2A_L2_EQ_MON_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA1C_CSI2A_RG_CSI2A_L2_EQ_SCA_SHIFT 2
> +#define MIPI_RX_ANA1C_CSI2A_RG_CSI2A_L2_EQ_SCA_MASK (0x1 << 2)
> +#define MIPI_RX_ANA1C_CSI2A_RG_CSI2A_L2_EQ_SCB_SHIFT 3
> +#define MIPI_RX_ANA1C_CSI2A_RG_CSI2A_L2_EQ_SCB_MASK (0x1 << 3)
> +#define MIPI_RX_ANA1C_CSI2A_RG_CSI2A_L2_EQ_IS_SHIFT 4
> +#define MIPI_RX_ANA1C_CSI2A_RG_CSI2A_L2_EQ_IS_MASK (0x3 << 4)
> +#define MIPI_RX_ANA1C_CSI2A_RG_CSI2A_L2_EQ_BW_SHIFT 6
> +#define MIPI_RX_ANA1C_CSI2A_RG_CSI2A_L2_EQ_BW_MASK (0x3 << 6)
> +#define MIPI_RX_ANA1C_CSI2A_RG_CSI2A_L2_EQ_SRA_SHIFT 8
> +#define MIPI_RX_ANA1C_CSI2A_RG_CSI2A_L2_EQ_SRA_MASK (0xf << 8)
> +#define MIPI_RX_ANA1C_CSI2A_RG_CSI2A_L2_EQ_SRB_SHIFT 12
> +#define MIPI_RX_ANA1C_CSI2A_RG_CSI2A_L2_EQ_SRB_MASK (0xf << 12)
> +#define MIPI_RX_ANA24_CSI2A                                    0x4024
> +#define MIPI_RX_ANA24_CSI2A_RG_CSI2A_RESERVE_SHIFT 24
> +#define MIPI_RX_ANA24_CSI2A_RG_CSI2A_RESERVE_MASK (0xff << 24)
> +#define MIPI_RX_ANA48_CSI2A                                    0x4048
> +#define MIPI_RX_ANA48_CSI2A_RGS_CSI2A_DPHY_L0_OS_CAL_CPLT_SHIFT 3
> +#define MIPI_RX_ANA48_CSI2A_RGS_CSI2A_DPHY_L0_OS_CAL_CPLT_MASK (0x1 << 3)
> +#define MIPI_RX_ANA48_CSI2A_RGS_CSI2A_DPHY_L1_OS_CAL_CPLT_SHIFT 4
> +#define MIPI_RX_ANA48_CSI2A_RGS_CSI2A_DPHY_L1_OS_CAL_CPLT_MASK (0x1 << 4)
> +#define MIPI_RX_ANA48_CSI2A_RGS_CSI2A_DPHY_L2_OS_CAL_CPLT_SHIFT 5
> +#define MIPI_RX_ANA48_CSI2A_RGS_CSI2A_DPHY_L2_OS_CAL_CPLT_MASK (0x1 << 5)
> +#define MIPI_RX_ANA48_CSI2A_RGS_CSI2A_OS_CAL_CODE_SHIFT 8
> +#define MIPI_RX_ANA48_CSI2A_RGS_CSI2A_OS_CAL_CODE_MASK (0xff << 8)
> +#define MIPI_RX_WRAPPER80_CSI2A                                0x4080
> +#define MIPI_RX_WRAPPER80_CSI2A_CSR_CSI_CLK_MON_SHIFT 0
> +#define MIPI_RX_WRAPPER80_CSI2A_CSR_CSI_CLK_MON_MASK (0x1 << 0)
> +#define MIPI_RX_WRAPPER80_CSI2A_CSR_CSI_MON_MUX_SHIFT 8
> +#define MIPI_RX_WRAPPER80_CSI2A_CSR_CSI_MON_MUX_MASK (0xff << 8)
> +#define MIPI_RX_WRAPPER80_CSI2A_CSR_CSI_RST_MODE_SHIFT 16
> +#define MIPI_RX_WRAPPER80_CSI2A_CSR_CSI_RST_MODE_MASK (0x3 << 16)
> +#define MIPI_RX_WRAPPER80_CSI2A_CSR_SW_RST_SHIFT 24
> +#define MIPI_RX_WRAPPER80_CSI2A_CSR_SW_RST_MASK (0xf << 24)
> +#define MIPI_RX_WRAPPER84_CSI2A                                0x4084
> +#define MIPI_RX_WRAPPER84_CSI2A_CSI_DEBUG_OUT_SHIFT 0
> +#define MIPI_RX_WRAPPER84_CSI2A_CSI_DEBUG_OUT_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER88_CSI2A                                0x4088
> +#define MIPI_RX_WRAPPER88_CSI2A_CSR_SW_MODE_0_SHIFT 0
> +#define MIPI_RX_WRAPPER88_CSI2A_CSR_SW_MODE_0_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER8C_CSI2A                                0x408C
> +#define MIPI_RX_WRAPPER8C_CSI2A_CSR_SW_MODE_1_SHIFT 0
> +#define MIPI_RX_WRAPPER8C_CSI2A_CSR_SW_MODE_1_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER90_CSI2A                                0x4090
> +#define MIPI_RX_WRAPPER90_CSI2A_CSR_SW_MODE_2_SHIFT 0
> +#define MIPI_RX_WRAPPER90_CSI2A_CSR_SW_MODE_2_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER94_CSI2A                                0x4094
> +#define MIPI_RX_WRAPPER94_CSI2A_CSR_SW_VALUE_0_SHIFT 0
> +#define MIPI_RX_WRAPPER94_CSI2A_CSR_SW_VALUE_0_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER98_CSI2A                                0x4098
> +#define MIPI_RX_WRAPPER98_CSI2A_CSR_SW_VALUE_1_SHIFT 0
> +#define MIPI_RX_WRAPPER98_CSI2A_CSR_SW_VALUE_1_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER9C_CSI2A                                0x409C
> +#define MIPI_RX_WRAPPER9C_CSI2A_CSR_SW_VALUE_2_SHIFT 0
> +#define MIPI_RX_WRAPPER9C_CSI2A_CSR_SW_VALUE_2_MASK (0xffffffff << 0)
> +#define MIPI_RX_ANAA4_CSI2A                                    0x40A4
> +#define MIPI_RX_ANAA4_CSI2A_RG_CSI2A_DPHY_L0_SYNC_INIT_SEL_SHIFT 0
> +#define MIPI_RX_ANAA4_CSI2A_RG_CSI2A_DPHY_L0_SYNC_INIT_SEL_MASK (0x1 << 0)
> +#define MIPI_RX_ANAA4_CSI2A_RG_CSI2A_DPHY_L0_FORCE_INIT_SHIFT 1
> +#define MIPI_RX_ANAA4_CSI2A_RG_CSI2A_DPHY_L0_FORCE_INIT_MASK (0x1 << 1)
> +#define MIPI_RX_ANAA4_CSI2A_RG_CSI2A_DPHY_L1_SYNC_INIT_SEL_SHIFT 2
> +#define MIPI_RX_ANAA4_CSI2A_RG_CSI2A_DPHY_L1_SYNC_INIT_SEL_MASK (0x1 << 2)
> +#define MIPI_RX_ANAA4_CSI2A_RG_CSI2A_DPHY_L1_FORCE_INIT_SHIFT 3
> +#define MIPI_RX_ANAA4_CSI2A_RG_CSI2A_DPHY_L1_FORCE_INIT_MASK (0x1 << 3)
> +#define MIPI_RX_ANAA4_CSI2A_RG_CSI2A_DPHY_L2_SYNC_INIT_SEL_SHIFT 4
> +#define MIPI_RX_ANAA4_CSI2A_RG_CSI2A_DPHY_L2_SYNC_INIT_SEL_MASK (0x1 << 4)
> +#define MIPI_RX_ANAA4_CSI2A_RG_CSI2A_DPHY_L2_FORCE_INIT_SHIFT 5
> +#define MIPI_RX_ANAA4_CSI2A_RG_CSI2A_DPHY_L2_FORCE_INIT_MASK (0x1 << 5)
> +#define MIPI_RX_ANAA8_CSI2A                                    0x40A8
> +#define MIPI_RX_ANAA8_CSI2A_RG_CSI2A_DPHY_L0_BYTECK_INVERT_SHIFT 0
> +#define MIPI_RX_ANAA8_CSI2A_RG_CSI2A_DPHY_L0_BYTECK_INVERT_MASK (0x1 << 0)
> +#define MIPI_RX_ANAA8_CSI2A_RG_CSI2A_DPHY_L1_BYTECK_INVERT_SHIFT 1
> +#define MIPI_RX_ANAA8_CSI2A_RG_CSI2A_DPHY_L1_BYTECK_INVERT_MASK (0x1 << 1)
> +#define MIPI_RX_ANAA8_CSI2A_RG_CSI2A_DPHY_L2_BYTECK_INVERT_SHIFT 2
> +#define MIPI_RX_ANAA8_CSI2A_RG_CSI2A_DPHY_L2_BYTECK_INVERT_MASK (0x1 << 2)
> +#define MIPI_RX_ANAA8_CSI2A_RG_CSI2A_DPHY_HSDET_LEVEL_MODE_EN_SHIFT 3
> +#define MIPI_RX_ANAA8_CSI2A_RG_CSI2A_DPHY_HSDET_LEVEL_MODE_EN_MASK (0x1 << 3)
> +#define MIPI_RX_ANAA8_CSI2A_RG_CSI2A_OS_CAL_SEL_SHIFT 4
> +#define MIPI_RX_ANAA8_CSI2A_RG_CSI2A_OS_CAL_SEL_MASK (0x7 << 4)
> +#define MIPI_RX_ANAA8_CSI2A_RG_CSI2A_DPHY_HSDET_DIG_BACK_EN_SHIFT 7
> +#define MIPI_RX_ANAA8_CSI2A_RG_CSI2A_DPHY_HSDET_DIG_BACK_EN_MASK (0x1 << 7)
> +#define MIPI_RX_ANAA8_CSI2A_RG_CSI2A_DPHY_DELAYCAL_CK_SEL_SHIFT 8
> +#define MIPI_RX_ANAA8_CSI2A_RG_CSI2A_DPHY_DELAYCAL_CK_SEL_MASK (0x7 << 8)
> +#define MIPI_RX_ANAA8_CSI2A_RG_CSI2A_OS_CAL_DIV_SHIFT 11
> +#define MIPI_RX_ANAA8_CSI2A_RG_CSI2A_OS_CAL_DIV_MASK (0x3 << 11)
> +#define MIPI_RX_ANA00_CSI2B                                    0x5000
> +#define MIPI_RX_ANA00_CSI2B_RG_CSI2B_EQ_PROTECT_EN_SHIFT 1
> +#define MIPI_RX_ANA00_CSI2B_RG_CSI2B_EQ_PROTECT_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA00_CSI2B_RG_CSI2B_BG_LPF_EN_SHIFT 2
> +#define MIPI_RX_ANA00_CSI2B_RG_CSI2B_BG_LPF_EN_MASK (0x1 << 2)
> +#define MIPI_RX_ANA00_CSI2B_RG_CSI2B_BG_CORE_EN_SHIFT 3
> +#define MIPI_RX_ANA00_CSI2B_RG_CSI2B_BG_CORE_EN_MASK (0x1 << 3)
> +#define MIPI_RX_ANA00_CSI2B_RG_CSI2B_DPHY_L0_CKMODE_EN_SHIFT 5
> +#define MIPI_RX_ANA00_CSI2B_RG_CSI2B_DPHY_L0_CKMODE_EN_MASK (0x1 << 5)
> +#define MIPI_RX_ANA00_CSI2B_RG_CSI2B_DPHY_L0_CKSEL_SHIFT 6
> +#define MIPI_RX_ANA00_CSI2B_RG_CSI2B_DPHY_L0_CKSEL_MASK (0x1 << 6)
> +#define MIPI_RX_ANA00_CSI2B_RG_CSI2B_DPHY_L1_CKMODE_EN_SHIFT 8
> +#define MIPI_RX_ANA00_CSI2B_RG_CSI2B_DPHY_L1_CKMODE_EN_MASK (0x1 << 8)
> +#define MIPI_RX_ANA00_CSI2B_RG_CSI2B_DPHY_L1_CKSEL_SHIFT 9
> +#define MIPI_RX_ANA00_CSI2B_RG_CSI2B_DPHY_L1_CKSEL_MASK (0x1 << 9)
> +#define MIPI_RX_ANA00_CSI2B_RG_CSI2B_DPHY_L2_CKMODE_EN_SHIFT 11
> +#define MIPI_RX_ANA00_CSI2B_RG_CSI2B_DPHY_L2_CKMODE_EN_MASK (0x1 << 11)
> +#define MIPI_RX_ANA00_CSI2B_RG_CSI2B_DPHY_L2_CKSEL_SHIFT 12
> +#define MIPI_RX_ANA00_CSI2B_RG_CSI2B_DPHY_L2_CKSEL_MASK (0x1 << 12)
> +#define MIPI_RX_ANA04_CSI2B                                    0x5004
> +#define MIPI_RX_ANA04_CSI2B_RG_CSI2B_BG_LPRX_VTH_SEL_SHIFT 0
> +#define MIPI_RX_ANA04_CSI2B_RG_CSI2B_BG_LPRX_VTH_SEL_MASK (0x7 << 0)
> +#define MIPI_RX_ANA04_CSI2B_RG_CSI2B_BG_LPRX_VTL_SEL_SHIFT 4
> +#define MIPI_RX_ANA04_CSI2B_RG_CSI2B_BG_LPRX_VTL_SEL_MASK (0x7 << 4)
> +#define MIPI_RX_ANA04_CSI2B_RG_CSI2B_BG_HSDET_VTH_SEL_SHIFT 8
> +#define MIPI_RX_ANA04_CSI2B_RG_CSI2B_BG_HSDET_VTH_SEL_MASK (0x7 << 8)
> +#define MIPI_RX_ANA04_CSI2B_RG_CSI2B_BG_HSDET_VTL_SEL_SHIFT 12
> +#define MIPI_RX_ANA04_CSI2B_RG_CSI2B_BG_HSDET_VTL_SEL_MASK (0x7 << 12)
> +#define MIPI_RX_ANA04_CSI2B_RG_CSI2B_BG_VREF_SEL_SHIFT 16
> +#define MIPI_RX_ANA04_CSI2B_RG_CSI2B_BG_VREF_SEL_MASK (0xf << 16)
> +#define MIPI_RX_ANA04_CSI2B_RG_CSI2B_BG_MON_VREF_SEL_SHIFT 24
> +#define MIPI_RX_ANA04_CSI2B_RG_CSI2B_BG_MON_VREF_SEL_MASK (0xf << 24)
> +#define MIPI_RX_ANA04_CSI2B_RG_CSI2B_FORCE_HSRT_EN_SHIFT 28
> +#define MIPI_RX_ANA04_CSI2B_RG_CSI2B_FORCE_HSRT_EN_MASK (0x1 << 28)
> +#define MIPI_RX_ANA08_CSI2B                                    0x5008
> +#define MIPI_RX_ANA08_CSI2B_RG_CSI2B_L0P_HSRT_CODE_SHIFT 0
> +#define MIPI_RX_ANA08_CSI2B_RG_CSI2B_L0P_HSRT_CODE_MASK (0x1f << 0)
> +#define MIPI_RX_ANA08_CSI2B_RG_CSI2B_L0N_HSRT_CODE_SHIFT 8
> +#define MIPI_RX_ANA08_CSI2B_RG_CSI2B_L0N_HSRT_CODE_MASK (0x1f << 8)
> +#define MIPI_RX_ANA08_CSI2B_RG_CSI2B_L1P_HSRT_CODE_SHIFT 16
> +#define MIPI_RX_ANA08_CSI2B_RG_CSI2B_L1P_HSRT_CODE_MASK (0x1f << 16)
> +#define MIPI_RX_ANA08_CSI2B_RG_CSI2B_L1N_HSRT_CODE_SHIFT 24
> +#define MIPI_RX_ANA08_CSI2B_RG_CSI2B_L1N_HSRT_CODE_MASK (0x1f << 24)
> +#define MIPI_RX_ANA0C_CSI2B                                    0x500C
> +#define MIPI_RX_ANA0C_CSI2B_RG_CSI2B_L2P_HSRT_CODE_SHIFT 0
> +#define MIPI_RX_ANA0C_CSI2B_RG_CSI2B_L2P_HSRT_CODE_MASK (0x1f << 0)
> +#define MIPI_RX_ANA0C_CSI2B_RG_CSI2B_L2N_HSRT_CODE_SHIFT 8
> +#define MIPI_RX_ANA0C_CSI2B_RG_CSI2B_L2N_HSRT_CODE_MASK (0x1f << 8)
> +#define MIPI_RX_ANA10_CSI2B                                    0x5010
> +#define MIPI_RX_ANA10_CSI2B_RG_CSI2B_DPHY_L0_DELAYCAL_EN_SHIFT 0
> +#define MIPI_RX_ANA10_CSI2B_RG_CSI2B_DPHY_L0_DELAYCAL_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA10_CSI2B_RG_CSI2B_DPHY_L0_DELAYCAL_RSTB_SHIFT 1
> +#define MIPI_RX_ANA10_CSI2B_RG_CSI2B_DPHY_L0_DELAYCAL_RSTB_MASK (0x1 << 1)
> +#define MIPI_RX_ANA10_CSI2B_RG_CSI2B_DPHY_L0_VREF_SEL_SHIFT 2
> +#define MIPI_RX_ANA10_CSI2B_RG_CSI2B_DPHY_L0_VREF_SEL_MASK (0x3f << 2)
> +#define MIPI_RX_ANA10_CSI2B_RG_CSI2B_DPHY_L1_DELAYCAL_EN_SHIFT 8
> +#define MIPI_RX_ANA10_CSI2B_RG_CSI2B_DPHY_L1_DELAYCAL_EN_MASK (0x1 << 8)
> +#define MIPI_RX_ANA10_CSI2B_RG_CSI2B_DPHY_L1_DELAYCAL_RSTB_SHIFT 9
> +#define MIPI_RX_ANA10_CSI2B_RG_CSI2B_DPHY_L1_DELAYCAL_RSTB_MASK (0x1 << 9)
> +#define MIPI_RX_ANA10_CSI2B_RG_CSI2B_DPHY_L1_VREF_SEL_SHIFT 10
> +#define MIPI_RX_ANA10_CSI2B_RG_CSI2B_DPHY_L1_VREF_SEL_MASK (0x3f << 10)
> +#define MIPI_RX_ANA10_CSI2B_RG_CSI2B_DPHY_L2_DELAYCAL_EN_SHIFT 16
> +#define MIPI_RX_ANA10_CSI2B_RG_CSI2B_DPHY_L2_DELAYCAL_EN_MASK (0x1 << 16)
> +#define MIPI_RX_ANA10_CSI2B_RG_CSI2B_DPHY_L2_DELAYCAL_RSTB_SHIFT 17
> +#define MIPI_RX_ANA10_CSI2B_RG_CSI2B_DPHY_L2_DELAYCAL_RSTB_MASK (0x1 << 17)
> +#define MIPI_RX_ANA10_CSI2B_RG_CSI2B_DPHY_L2_VREF_SEL_SHIFT 18
> +#define MIPI_RX_ANA10_CSI2B_RG_CSI2B_DPHY_L2_VREF_SEL_MASK (0x3f << 18)
> +#define MIPI_RX_ANA18_CSI2B                                    0x5018
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L0_EQ_OS_CAL_EN_SHIFT 0
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L0_EQ_OS_CAL_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L0_EQ_MON_EN_SHIFT 1
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L0_EQ_MON_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L0_EQ_SCA_SHIFT 2
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L0_EQ_SCA_MASK (0x1 << 2)
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L0_EQ_SCB_SHIFT 3
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L0_EQ_SCB_MASK (0x1 << 3)
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L0_EQ_IS_SHIFT 4
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L0_EQ_IS_MASK (0x3 << 4)
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L0_EQ_BW_SHIFT 6
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L0_EQ_BW_MASK (0x3 << 6)
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L0_EQ_SRA_SHIFT 8
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L0_EQ_SRA_MASK (0xf << 8)
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L0_EQ_SRB_SHIFT 12
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L0_EQ_SRB_MASK (0xf << 12)
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L1_EQ_OS_CAL_EN_SHIFT 16
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L1_EQ_OS_CAL_EN_MASK (0x1 << 16)
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L1_EQ_MON_EN_SHIFT 17
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L1_EQ_MON_EN_MASK (0x1 << 17)
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L1_EQ_SCA_SHIFT 18
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L1_EQ_SCA_MASK (0x1 << 18)
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L1_EQ_SCB_SHIFT 19
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L1_EQ_SCB_MASK (0x1 << 19)
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L1_EQ_IS_SHIFT 20
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L1_EQ_IS_MASK (0x3 << 20)
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L1_EQ_BW_SHIFT 22
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L1_EQ_BW_MASK (0x3 << 22)
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L1_EQ_SRA_SHIFT 24
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L1_EQ_SRA_MASK (0xf << 24)
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L1_EQ_SRB_SHIFT 28
> +#define MIPI_RX_ANA18_CSI2B_RG_CSI2B_L1_EQ_SRB_MASK (0xf << 28)
> +#define MIPI_RX_ANA1C_CSI2B                                    0x501C
> +#define MIPI_RX_ANA1C_CSI2B_RG_CSI2B_L2_EQ_OS_CAL_EN_SHIFT 0
> +#define MIPI_RX_ANA1C_CSI2B_RG_CSI2B_L2_EQ_OS_CAL_EN_MASK (0x1 << 0)
> +#define MIPI_RX_ANA1C_CSI2B_RG_CSI2B_L2_EQ_MON_EN_SHIFT 1
> +#define MIPI_RX_ANA1C_CSI2B_RG_CSI2B_L2_EQ_MON_EN_MASK (0x1 << 1)
> +#define MIPI_RX_ANA1C_CSI2B_RG_CSI2B_L2_EQ_SCA_SHIFT 2
> +#define MIPI_RX_ANA1C_CSI2B_RG_CSI2B_L2_EQ_SCA_MASK (0x1 << 2)
> +#define MIPI_RX_ANA1C_CSI2B_RG_CSI2B_L2_EQ_SCB_SHIFT 3
> +#define MIPI_RX_ANA1C_CSI2B_RG_CSI2B_L2_EQ_SCB_MASK (0x1 << 3)
> +#define MIPI_RX_ANA1C_CSI2B_RG_CSI2B_L2_EQ_IS_SHIFT 4
> +#define MIPI_RX_ANA1C_CSI2B_RG_CSI2B_L2_EQ_IS_MASK (0x3 << 4)
> +#define MIPI_RX_ANA1C_CSI2B_RG_CSI2B_L2_EQ_BW_SHIFT 6
> +#define MIPI_RX_ANA1C_CSI2B_RG_CSI2B_L2_EQ_BW_MASK (0x3 << 6)
> +#define MIPI_RX_ANA1C_CSI2B_RG_CSI2B_L2_EQ_SRA_SHIFT 8
> +#define MIPI_RX_ANA1C_CSI2B_RG_CSI2B_L2_EQ_SRA_MASK (0xf << 8)
> +#define MIPI_RX_ANA1C_CSI2B_RG_CSI2B_L2_EQ_SRB_SHIFT 12
> +#define MIPI_RX_ANA1C_CSI2B_RG_CSI2B_L2_EQ_SRB_MASK (0xf << 12)
> +#define MIPI_RX_ANA24_CSI2B                                    0x5024
> +#define MIPI_RX_ANA24_CSI2B_RG_CSI2B_RESERVE_SHIFT 24
> +#define MIPI_RX_ANA24_CSI2B_RG_CSI2B_RESERVE_MASK (0xff << 24)
> +#define MIPI_RX_ANA48_CSI2B                                    0x5048
> +#define MIPI_RX_ANA48_CSI2B_RGS_CSI2B_DPHY_L0_OS_CAL_CPLT_SHIFT 3
> +#define MIPI_RX_ANA48_CSI2B_RGS_CSI2B_DPHY_L0_OS_CAL_CPLT_MASK (0x1 << 3)
> +#define MIPI_RX_ANA48_CSI2B_RGS_CSI2B_DPHY_L1_OS_CAL_CPLT_SHIFT 4
> +#define MIPI_RX_ANA48_CSI2B_RGS_CSI2B_DPHY_L1_OS_CAL_CPLT_MASK (0x1 << 4)
> +#define MIPI_RX_ANA48_CSI2B_RGS_CSI2B_DPHY_L2_OS_CAL_CPLT_SHIFT 5
> +#define MIPI_RX_ANA48_CSI2B_RGS_CSI2B_DPHY_L2_OS_CAL_CPLT_MASK (0x1 << 5)
> +#define MIPI_RX_ANA48_CSI2B_RGS_CSI2B_OS_CAL_CODE_SHIFT 8
> +#define MIPI_RX_ANA48_CSI2B_RGS_CSI2B_OS_CAL_CODE_MASK (0xff << 8)
> +#define MIPI_RX_WRAPPER80_CSI2B                                0x5080
> +#define MIPI_RX_WRAPPER80_CSI2B_CSR_CSI_CLK_MON_SHIFT 0
> +#define MIPI_RX_WRAPPER80_CSI2B_CSR_CSI_CLK_MON_MASK (0x1 << 0)
> +#define MIPI_RX_WRAPPER80_CSI2B_CSR_CSI_MON_MUX_SHIFT 8
> +#define MIPI_RX_WRAPPER80_CSI2B_CSR_CSI_MON_MUX_MASK (0xff << 8)
> +#define MIPI_RX_WRAPPER80_CSI2B_CSR_CSI_RST_MODE_SHIFT 16
> +#define MIPI_RX_WRAPPER80_CSI2B_CSR_CSI_RST_MODE_MASK (0x3 << 16)
> +#define MIPI_RX_WRAPPER80_CSI2B_CSR_SW_RST_SHIFT 24
> +#define MIPI_RX_WRAPPER80_CSI2B_CSR_SW_RST_MASK (0xf << 24)
> +#define MIPI_RX_WRAPPER84_CSI2B                                0x5084
> +#define MIPI_RX_WRAPPER84_CSI2B_CSI_DEBUG_OUT_SHIFT 0
> +#define MIPI_RX_WRAPPER84_CSI2B_CSI_DEBUG_OUT_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER88_CSI2B                                0x5088
> +#define MIPI_RX_WRAPPER88_CSI2B_CSR_SW_MODE_0_SHIFT 0
> +#define MIPI_RX_WRAPPER88_CSI2B_CSR_SW_MODE_0_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER8C_CSI2B                                0x508C
> +#define MIPI_RX_WRAPPER8C_CSI2B_CSR_SW_MODE_1_SHIFT 0
> +#define MIPI_RX_WRAPPER8C_CSI2B_CSR_SW_MODE_1_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER90_CSI2B                                0x5090
> +#define MIPI_RX_WRAPPER90_CSI2B_CSR_SW_MODE_2_SHIFT 0
> +#define MIPI_RX_WRAPPER90_CSI2B_CSR_SW_MODE_2_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER94_CSI2B                                0x5094
> +#define MIPI_RX_WRAPPER94_CSI2B_CSR_SW_VALUE_0_SHIFT 0
> +#define MIPI_RX_WRAPPER94_CSI2B_CSR_SW_VALUE_0_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER98_CSI2B                                0x5098
> +#define MIPI_RX_WRAPPER98_CSI2B_CSR_SW_VALUE_1_SHIFT 0
> +#define MIPI_RX_WRAPPER98_CSI2B_CSR_SW_VALUE_1_MASK (0xffffffff << 0)
> +#define MIPI_RX_WRAPPER9C_CSI2B                                0x509C
> +#define MIPI_RX_WRAPPER9C_CSI2B_CSR_SW_VALUE_2_SHIFT 0
> +#define MIPI_RX_WRAPPER9C_CSI2B_CSR_SW_VALUE_2_MASK (0xffffffff << 0)
> +#define MIPI_RX_ANAA4_CSI2B                                    0x50A4
> +#define MIPI_RX_ANAA4_CSI2B_RG_CSI2B_DPHY_L0_SYNC_INIT_SEL_SHIFT 0
> +#define MIPI_RX_ANAA4_CSI2B_RG_CSI2B_DPHY_L0_SYNC_INIT_SEL_MASK (0x1 << 0)
> +#define MIPI_RX_ANAA4_CSI2B_RG_CSI2B_DPHY_L0_FORCE_INIT_SHIFT 1
> +#define MIPI_RX_ANAA4_CSI2B_RG_CSI2B_DPHY_L0_FORCE_INIT_MASK (0x1 << 1)
> +#define MIPI_RX_ANAA4_CSI2B_RG_CSI2B_DPHY_L1_SYNC_INIT_SEL_SHIFT 2
> +#define MIPI_RX_ANAA4_CSI2B_RG_CSI2B_DPHY_L1_SYNC_INIT_SEL_MASK (0x1 << 2)
> +#define MIPI_RX_ANAA4_CSI2B_RG_CSI2B_DPHY_L1_FORCE_INIT_SHIFT 3
> +#define MIPI_RX_ANAA4_CSI2B_RG_CSI2B_DPHY_L1_FORCE_INIT_MASK (0x1 << 3)
> +#define MIPI_RX_ANAA4_CSI2B_RG_CSI2B_DPHY_L2_SYNC_INIT_SEL_SHIFT 4
> +#define MIPI_RX_ANAA4_CSI2B_RG_CSI2B_DPHY_L2_SYNC_INIT_SEL_MASK (0x1 << 4)
> +#define MIPI_RX_ANAA4_CSI2B_RG_CSI2B_DPHY_L2_FORCE_INIT_SHIFT 5
> +#define MIPI_RX_ANAA4_CSI2B_RG_CSI2B_DPHY_L2_FORCE_INIT_MASK (0x1 << 5)
> +#define MIPI_RX_ANAA8_CSI2B                                    0x50A8
> +#define MIPI_RX_ANAA8_CSI2B_RG_CSI2B_DPHY_L0_BYTECK_INVERT_SHIFT 0
> +#define MIPI_RX_ANAA8_CSI2B_RG_CSI2B_DPHY_L0_BYTECK_INVERT_MASK (0x1 << 0)
> +#define MIPI_RX_ANAA8_CSI2B_RG_CSI2B_DPHY_L1_BYTECK_INVERT_SHIFT 1
> +#define MIPI_RX_ANAA8_CSI2B_RG_CSI2B_DPHY_L1_BYTECK_INVERT_MASK (0x1 << 1)
> +#define MIPI_RX_ANAA8_CSI2B_RG_CSI2B_DPHY_L2_BYTECK_INVERT_SHIFT 2
> +#define MIPI_RX_ANAA8_CSI2B_RG_CSI2B_DPHY_L2_BYTECK_INVERT_MASK (0x1 << 2)
> +#define MIPI_RX_ANAA8_CSI2B_RG_CSI2B_DPHY_HSDET_LEVEL_MODE_EN_SHIFT 3
> +#define MIPI_RX_ANAA8_CSI2B_RG_CSI2B_DPHY_HSDET_LEVEL_MODE_EN_MASK (0x1 << 3)
> +#define MIPI_RX_ANAA8_CSI2B_RG_CSI2B_OS_CAL_SEL_SHIFT 4
> +#define MIPI_RX_ANAA8_CSI2B_RG_CSI2B_OS_CAL_SEL_MASK (0x7 << 4)
> +#define MIPI_RX_ANAA8_CSI2B_RG_CSI2B_DPHY_HSDET_DIG_BACK_EN_SHIFT 7
> +#define MIPI_RX_ANAA8_CSI2B_RG_CSI2B_DPHY_HSDET_DIG_BACK_EN_MASK (0x1 << 7)
> +#define MIPI_RX_ANAA8_CSI2B_RG_CSI2B_DPHY_DELAYCAL_CK_SEL_SHIFT 8
> +#define MIPI_RX_ANAA8_CSI2B_RG_CSI2B_DPHY_DELAYCAL_CK_SEL_MASK (0x7 << 8)
> +#define MIPI_RX_ANAA8_CSI2B_RG_CSI2B_OS_CAL_DIV_SHIFT 11
> +#define MIPI_RX_ANAA8_CSI2B_RG_CSI2B_OS_CAL_DIV_MASK (0x3 << 11)
> +#define SENINF_TOP_CTRL                                        0x0000
> +#define SENINF_TOP_CTRL_SENINF1_PCLK_SEL_SHIFT 8
> +#define SENINF_TOP_CTRL_SENINF1_PCLK_SEL_MASK  (0x1 << 8)
> +#define SENINF_TOP_CTRL_SENINF2_PCLK_SEL_SHIFT 9
> +#define SENINF_TOP_CTRL_SENINF2_PCLK_SEL_MASK  (0x1 << 9)
> +#define SENINF_TOP_CTRL_SENINF1_PCLK_EN_SHIFT  10
> +#define SENINF_TOP_CTRL_SENINF1_PCLK_EN_MASK   (0x1 << 10)
> +#define SENINF_TOP_CTRL_SENINF2_PCLK_EN_SHIFT  11
> +#define SENINF_TOP_CTRL_SENINF2_PCLK_EN_MASK   (0x1 << 11)
> +#define SENINF_TOP_CTRL_SENINF_TOP_N3D_SW_RST_SHIFT 16
> +#define SENINF_TOP_CTRL_SENINF_TOP_N3D_SW_RST_MASK (0x1 << 16)
> +#define SENINF_TOP_CTRL_SENINF_TOP_DBG_SEL_SHIFT 28
> +#define SENINF_TOP_CTRL_SENINF_TOP_DBG_SEL_MASK (0x7 << 28)
> +#define SENINF_TOP_CMODEL_PAR                                  0x0004
> +#define SENINF_TOP_CMODEL_PAR_SENINF1_EN_SHIFT 0
> +#define SENINF_TOP_CMODEL_PAR_SENINF1_EN_MASK  (0x1 << 0)
> +#define SENINF_TOP_CMODEL_PAR_SENINF2_EN_SHIFT 1
> +#define SENINF_TOP_CMODEL_PAR_SENINF2_EN_MASK  (0x1 << 1)
> +#define SENINF_TOP_CMODEL_PAR_SENINF3_EN_SHIFT 2
> +#define SENINF_TOP_CMODEL_PAR_SENINF3_EN_MASK  (0x1 << 2)
> +#define SENINF_TOP_CMODEL_PAR_SENINF4_EN_SHIFT 3
> +#define SENINF_TOP_CMODEL_PAR_SENINF4_EN_MASK  (0x1 << 3)
> +#define SENINF_TOP_CMODEL_PAR_SENINF1_FORMAT_SHIFT 4
> +#define SENINF_TOP_CMODEL_PAR_SENINF1_FORMAT_MASK (0xf << 4)
> +#define SENINF_TOP_CMODEL_PAR_SENINF2_FORMAT_SHIFT 8
> +#define SENINF_TOP_CMODEL_PAR_SENINF2_FORMAT_MASK (0xf << 8)
> +#define SENINF_TOP_CMODEL_PAR_SENINF3_FORMAT_SHIFT 12
> +#define SENINF_TOP_CMODEL_PAR_SENINF3_FORMAT_MASK (0xf << 12)
> +#define SENINF_TOP_CMODEL_PAR_SENINF4_FORMAT_SHIFT 16
> +#define SENINF_TOP_CMODEL_PAR_SENINF4_FORMAT_MASK (0xf << 16)
> +#define SENINF_TOP_MUX_CTRL                                    0x0008
> +#define SENINF_TOP_MUX_CTRL_SENINF1_MUX_SRC_SEL_SHIFT 0
> +#define SENINF_TOP_MUX_CTRL_SENINF1_MUX_SRC_SEL_MASK (0xf << 0)
> +#define SENINF_TOP_MUX_CTRL_SENINF2_MUX_SRC_SEL_SHIFT 4
> +#define SENINF_TOP_MUX_CTRL_SENINF2_MUX_SRC_SEL_MASK (0xf << 4)
> +#define SENINF_TOP_MUX_CTRL_SENINF3_MUX_SRC_SEL_SHIFT 8
> +#define SENINF_TOP_MUX_CTRL_SENINF3_MUX_SRC_SEL_MASK (0xf << 8)
> +#define SENINF_TOP_MUX_CTRL_SENINF4_MUX_SRC_SEL_SHIFT 12
> +#define SENINF_TOP_MUX_CTRL_SENINF4_MUX_SRC_SEL_MASK (0xf << 12)
> +#define SENINF_TOP_MUX_CTRL_SENINF5_MUX_SRC_SEL_SHIFT 16
> +#define SENINF_TOP_MUX_CTRL_SENINF5_MUX_SRC_SEL_MASK (0xf << 16)
> +#define SENINF_TOP_MUX_CTRL_SENINF6_MUX_SRC_SEL_SHIFT 20
> +#define SENINF_TOP_MUX_CTRL_SENINF6_MUX_SRC_SEL_MASK (0xf << 20)
> +#define SENINF_TOP_MUX_CTRL_SENINF7_MUX_SRC_SEL_SHIFT 24
> +#define SENINF_TOP_MUX_CTRL_SENINF7_MUX_SRC_SEL_MASK (0xf << 24)
> +#define SENINF_TOP_MUX_CTRL_SENINF8_MUX_SRC_SEL_SHIFT 28
> +#define SENINF_TOP_MUX_CTRL_SENINF8_MUX_SRC_SEL_MASK (0xf << 28)
> +#define SENINF_TOP_CAM_MUX_CTRL                                0x0010
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM0_MUX_SRC_SEL_SHIFT 0
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM0_MUX_SRC_SEL_MASK (0xf << 0)
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM1_MUX_SRC_SEL_SHIFT 4
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM1_MUX_SRC_SEL_MASK (0xf << 4)
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM2_MUX_SRC_SEL_SHIFT 8
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM2_MUX_SRC_SEL_MASK (0xf << 8)
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM3_MUX_SRC_SEL_SHIFT 12
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM3_MUX_SRC_SEL_MASK (0xf << 12)
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM4_MUX_SRC_SEL_SHIFT 16
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM4_MUX_SRC_SEL_MASK (0xf << 16)
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM5_MUX_SRC_SEL_SHIFT 20
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM5_MUX_SRC_SEL_MASK (0xf << 20)
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM6_MUX_SRC_SEL_SHIFT 24
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM6_MUX_SRC_SEL_MASK (0xf << 24)
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM7_MUX_SRC_SEL_SHIFT 28
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM7_MUX_SRC_SEL_MASK (0xf << 28)
> +#define SENINF_TOP_N3D_A_CTL                                   0x0014
> +#define SENINF_TOP_N3D_A_CTL_SENINF_N3D_S1_SEN_PCLK_SRC_SEL_A_SHIFT 0
> +#define SENINF_TOP_N3D_A_CTL_SENINF_N3D_S1_SEN_PCLK_SRC_SEL_A_MASK (0x7 << 0)
> +#define SENINF_TOP_N3D_A_CTL_SENINF_N3D_S1_SEN_VSYNC_SRC_SEL_A_SHIFT 4
> +#define SENINF_TOP_N3D_A_CTL_SENINF_N3D_S1_SEN_VSYNC_SRC_SEL_A_MASK (0x7 << 4)
> +#define SENINF_TOP_N3D_A_CTL_SENINF_N3D_S2_SEN_PCLK_SRC_SEL_A_SHIFT 8
> +#define SENINF_TOP_N3D_A_CTL_SENINF_N3D_S2_SEN_PCLK_SRC_SEL_A_MASK (0x7 << 8)
> +#define SENINF_TOP_N3D_A_CTL_SENINF_N3D_S2_SEN_VSYNC_SRC_SEL_A_SHIFT 12
> +#define SENINF_TOP_N3D_A_CTL_SENINF_N3D_S2_SEN_VSYNC_SRC_SEL_A_MASK (0x7 << 12)
> +#define SENINF_TOP_N3D_B_CTL                                   0x0018
> +#define SENINF_TOP_N3D_B_CTL_SENINF_N3D_S1_SEN_PCLK_SRC_SEL_B_SHIFT 0
> +#define SENINF_TOP_N3D_B_CTL_SENINF_N3D_S1_SEN_PCLK_SRC_SEL_B_MASK (0x7 << 0)
> +#define SENINF_TOP_N3D_B_CTL_SENINF_N3D_S1_SEN_VSYNC_SRC_SEL_B_SHIFT 4
> +#define SENINF_TOP_N3D_B_CTL_SENINF_N3D_S1_SEN_VSYNC_SRC_SEL_B_MASK (0x7 << 4)
> +#define SENINF_TOP_N3D_B_CTL_SENINF_N3D_S2_SEN_PCLK_SRC_SEL_B_SHIFT 8
> +#define SENINF_TOP_N3D_B_CTL_SENINF_N3D_S2_SEN_PCLK_SRC_SEL_B_MASK (0x7 << 8)
> +#define SENINF_TOP_N3D_B_CTL_SENINF_N3D_S2_SEN_VSYNC_SRC_SEL_B_SHIFT 12
> +#define SENINF_TOP_N3D_B_CTL_SENINF_N3D_S2_SEN_VSYNC_SRC_SEL_B_MASK (0x7 << 12)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0                         0x001C
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_DPHY_MODE_SHIFT 0
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_DPHY_MODE_MASK (0x1 << 0)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_CPHY_MODE_SHIFT 4
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_CPHY_MODE_MASK (0x3 << 4)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_CK_SEL_1_SHIFT 8
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_CK_SEL_1_MASK (0x7 << 8)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_CK_SEL_2_SHIFT 12
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_CK_SEL_2_MASK (0x3 << 12)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_PHY_SENINF_LANE_MUX_CSI0_EN_SHIFT 31
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_PHY_SENINF_LANE_MUX_CSI0_EN_MASK \
> +(0x1 << 31)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1                         0x0020
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_DPHY_MODE_SHIFT 0
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_DPHY_MODE_MASK (0x1 << 0)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_CPHY_MODE_SHIFT 4
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_CPHY_MODE_MASK (0x3 << 4)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_CK_SEL_1_SHIFT 8
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_CK_SEL_1_MASK (0x7 << 8)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_CK_SEL_2_SHIFT 12
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_CK_SEL_2_MASK (0x3 << 12)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_PHY_SENINF_LANE_MUX_CSI1_EN_SHIFT 31
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_PHY_SENINF_LANE_MUX_CSI1_EN_MASK \
> +(0x1 << 31)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2                         0x0024
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2_DPHY_MODE_SHIFT 0
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2_DPHY_MODE_MASK (0x1 << 0)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2_CPHY_MODE_SHIFT 4
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2_CPHY_MODE_MASK (0x3 << 4)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2_CK_SEL_1_SHIFT 8
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2_CK_SEL_1_MASK (0x7 << 8)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2_CK_SEL_2_SHIFT 12
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2_CK_SEL_2_MASK (0x3 << 12)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2_PHY_SENINF_LANE_MUX_CSI2_EN_SHIFT 31
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2_PHY_SENINF_LANE_MUX_CSI2_EN_MASK \
> +(0x1 << 31)
> +#define SENINF_N3D_A_CTL                                       0x0100
> +#define SENINF_N3D_A_CTL_MODE_SHIFT            0
> +#define SENINF_N3D_A_CTL_MODE_MASK             (0x3 << 0)
> +#define SENINF_N3D_A_CTL_I2C1_EN_SHIFT         2
> +#define SENINF_N3D_A_CTL_I2C1_EN_MASK          (0x1 << 2)
> +#define SENINF_N3D_A_CTL_I2C2_EN_SHIFT         3
> +#define SENINF_N3D_A_CTL_I2C2_EN_MASK          (0x1 << 3)
> +#define SENINF_N3D_A_CTL_I2C1_INT_EN_SHIFT     4
> +#define SENINF_N3D_A_CTL_I2C1_INT_EN_MASK      (0x1 << 4)
> +#define SENINF_N3D_A_CTL_I2C2_INT_EN_SHIFT     5
> +#define SENINF_N3D_A_CTL_I2C2_INT_EN_MASK      (0x1 << 5)
> +#define SENINF_N3D_A_CTL_N3D_EN_SHIFT          6
> +#define SENINF_N3D_A_CTL_N3D_EN_MASK           (0x1 << 6)
> +#define SENINF_N3D_A_CTL_W1CLR_SHIFT           7
> +#define SENINF_N3D_A_CTL_W1CLR_MASK            (0x1 << 7)
> +#define SENINF_N3D_A_CTL_DIFF_EN_SHIFT         8
> +#define SENINF_N3D_A_CTL_DIFF_EN_MASK          (0x1 << 8)
> +#define SENINF_N3D_A_CTL_DDBG_SEL_SHIFT        9
> +#define SENINF_N3D_A_CTL_DDBG_SEL_MASK         (0x7 << 9)
> +#define SENINF_N3D_A_CTL_MODE1_DBG_SHIFT       12
> +#define SENINF_N3D_A_CTL_MODE1_DBG_MASK        (0x1 << 12)
> +#define SENINF_N3D_A_CTL_SEN1_TIM_EN_SHIFT     16
> +#define SENINF_N3D_A_CTL_SEN1_TIM_EN_MASK      (0x1 << 16)
> +#define SENINF_N3D_A_CTL_SEN2_TIM_EN_SHIFT     17
> +#define SENINF_N3D_A_CTL_SEN2_TIM_EN_MASK      (0x1 << 17)
> +#define SENINF_N3D_A_CTL_SEN1_OV_VS_INT_EN_SHIFT 18
> +#define SENINF_N3D_A_CTL_SEN1_OV_VS_INT_EN_MASK (0x1 << 18)
> +#define SENINF_N3D_A_CTL_SEN2_OV_VS_INT_EN_SHIFT 19
> +#define SENINF_N3D_A_CTL_SEN2_OV_VS_INT_EN_MASK (0x1 << 19)
> +#define SENINF_N3D_A_CTL_HW_SYNC_MODE_SHIFT    20
> +#define SENINF_N3D_A_CTL_HW_SYNC_MODE_MASK     (0x1 << 20)
> +#define SENINF_N3D_A_CTL_VALID_TG_EN_SHIFT     21
> +#define SENINF_N3D_A_CTL_VALID_TG_EN_MASK      (0x1 << 21)
> +#define SENINF_N3D_A_CTL_SYNC_PIN_A_EN_SHIFT   22
> +#define SENINF_N3D_A_CTL_SYNC_PIN_A_EN_MASK    (0x1 << 22)
> +#define SENINF_N3D_A_CTL_SYNC_PIN_A_POLARITY_SHIFT 23
> +#define SENINF_N3D_A_CTL_SYNC_PIN_A_POLARITY_MASK (0x1 << 23)
> +#define SENINF_N3D_A_CTL_SYNC_PIN_B_EN_SHIFT   24
> +#define SENINF_N3D_A_CTL_SYNC_PIN_B_EN_MASK    (0x1 << 24)
> +#define SENINF_N3D_A_CTL_SYNC_PIN_B_POLARITY_SHIFT 25
> +#define SENINF_N3D_A_CTL_SYNC_PIN_B_POLARITY_MASK (0x1 << 25)
> +#define SENINF_N3D_A_POS                                       0x0104
> +#define SENINF_N3D_A_POS_N3D_POS_SHIFT         0
> +#define SENINF_N3D_A_POS_N3D_POS_MASK          (0xffffffff << 0)
> +#define SENINF_N3D_A_TRIG                                      0x0108
> +#define SENINF_N3D_A_TRIG_I2CA_TRIG_SHIFT      0
> +#define SENINF_N3D_A_TRIG_I2CA_TRIG_MASK       (0x1 << 0)
> +#define SENINF_N3D_A_TRIG_I2CB_TRIG_SHIFT      1
> +#define SENINF_N3D_A_TRIG_I2CB_TRIG_MASK       (0x1 << 1)
> +#define SENINF_N3D_A_INT                                       0x010C
> +#define SENINF_N3D_A_INT_I2C1_INT_SHIFT        0
> +#define SENINF_N3D_A_INT_I2C1_INT_MASK         (0x1 << 0)
> +#define SENINF_N3D_A_INT_I2C2_INT_SHIFT        1
> +#define SENINF_N3D_A_INT_I2C2_INT_MASK         (0x1 << 1)
> +#define SENINF_N3D_A_INT_DIFF_INT_SHIFT        2
> +#define SENINF_N3D_A_INT_DIFF_INT_MASK         (0x1 << 2)
> +#define SENINF_N3D_A_INT_SEN1_OV_VS_INT_SHIFT  4
> +#define SENINF_N3D_A_INT_SEN1_OV_VS_INT_MASK   (0x1 << 4)
> +#define SENINF_N3D_A_INT_SEN2_OV_VS_INT_SHIFT  5
> +#define SENINF_N3D_A_INT_SEN2_OV_VS_INT_MASK   (0x1 << 5)
> +#define SENINF_N3D_A_CNT0                                      0x0110
> +#define SENINF_N3D_A_CNT0_N3D_CNT0_SHIFT       0
> +#define SENINF_N3D_A_CNT0_N3D_CNT0_MASK        (0xffffffff << 0)
> +#define SENINF_N3D_A_CNT1                                      0x0114
> +#define SENINF_N3D_A_CNT1_N3D_CNT1_SHIFT       0
> +#define SENINF_N3D_A_CNT1_N3D_CNT1_MASK        (0xffffffff << 0)
> +#define SENINF_N3D_A_DBG                                       0x0118
> +#define SENINF_N3D_A_DBG_N3D_DBG_SHIFT         0
> +#define SENINF_N3D_A_DBG_N3D_DBG_MASK          (0xffffffff << 0)
> +#define SENINF_N3D_A_DIFF_THR                                  0x011C
> +#define SENINF_N3D_A_DIFF_THR_N3D_DIFF_THR_SHIFT 0
> +#define SENINF_N3D_A_DIFF_THR_N3D_DIFF_THR_MASK (0xffffffff << 0)
> +#define SENINF_N3D_A_DIFF_CNT                                  0x0120
> +#define SENINF_N3D_A_DIFF_CNT_N3D_DIFF_CNT_SHIFT 0
> +#define SENINF_N3D_A_DIFF_CNT_N3D_DIFF_CNT_MASK (0xffffffff << 0)
> +#define SENINF_N3D_A_DBG_1                                     0x0124
> +#define SENINF_N3D_A_DBG_1_N3D_DBG_1_SHIFT     0
> +#define SENINF_N3D_A_DBG_1_N3D_DBG_1_MASK      (0xffffffff << 0)
> +#define SENINF_N3D_A_VALID_TG_CNT                              0x0128
> +#define SENINF_N3D_A_VALID_TG_CNT_N3D_VALID_TG_CNT_SHIFT 0
> +#define SENINF_N3D_A_VALID_TG_CNT_N3D_VALID_TG_CNT_MASK (0xffffffff << 0)
> +#define SENINF_N3D_A_SYNC_A_PERIOD                             0x012C
> +#define SENINF_N3D_A_SYNC_A_PERIOD_N3D_SYNC_A_PERIOD_SHIFT 0
> +#define SENINF_N3D_A_SYNC_A_PERIOD_N3D_SYNC_A_PERIOD_MASK (0xffffffff << 0)
> +#define SENINF_N3D_A_SYNC_B_PERIOD                             0x0130
> +#define SENINF_N3D_A_SYNC_B_PERIOD_N3D_SYNC_B_PERIOD_SHIFT 0
> +#define SENINF_N3D_A_SYNC_B_PERIOD_N3D_SYNC_B_PERIOD_MASK (0xffffffff << 0)
> +#define SENINF_N3D_A_SYNC_A_PULSE_LEN                          0x0134
> +#define SENINF_N3D_A_SYNC_A_PULSE_LEN_N3D_SYNC_A_PULSE_LEN_SHIFT 0
> +#define SENINF_N3D_A_SYNC_A_PULSE_LEN_N3D_SYNC_A_PULSE_LEN_MASK \
> +(0xffffffff << 0)
> +#define SENINF_N3D_A_SYNC_B_PULSE_LEN                          0x0138
> +#define SENINF_N3D_A_SYNC_B_PULSE_LEN_N3D_SYNC_B_PULSE_LEN_SHIFT 0
> +#define SENINF_N3D_A_SYNC_B_PULSE_LEN_N3D_SYNC_B_PULSE_LEN_MASK \
> +(0xffffffff << 0)
> +#define SENINF_N3D_A_SUB_CNT                                   0x013C
> +#define SENINF_N3D_A_SUB_CNT_VS1_SUB_CNT_SHIFT 0
> +#define SENINF_N3D_A_SUB_CNT_VS1_SUB_CNT_MASK  (0x3f << 0)
> +#define SENINF_N3D_A_SUB_CNT_VS1_SUB_CNT_EN_SHIFT 6
> +#define SENINF_N3D_A_SUB_CNT_VS1_SUB_CNT_EN_MASK (0x1 << 6)
> +#define SENINF_N3D_A_SUB_CNT_SYNC_PIN_A_RESET_SEL_SHIFT 7
> +#define SENINF_N3D_A_SUB_CNT_SYNC_PIN_A_RESET_SEL_MASK (0x1 << 7)
> +#define SENINF_N3D_A_SUB_CNT_SYNC_PIN_B_RESET_SEL_SHIFT 8
> +#define SENINF_N3D_A_SUB_CNT_SYNC_PIN_B_RESET_SEL_MASK (0x1 << 8)
> +#define SENINF_N3D_A_SUB_CNT_SYNC_PIN_A_RESET_SEL_EN_SHIFT 9
> +#define SENINF_N3D_A_SUB_CNT_SYNC_PIN_A_RESET_SEL_EN_MASK (0x1 << 9)
> +#define SENINF_N3D_A_SUB_CNT_SYNC_PIN_B_RESET_SEL_EN_SHIFT 10
> +#define SENINF_N3D_A_SUB_CNT_SYNC_PIN_B_RESET_SEL_EN_MASK (0x1 << 10)
> +#define SENINF_N3D_A_SUB_CNT_VS2_SUB_CNT_SHIFT 16
> +#define SENINF_N3D_A_SUB_CNT_VS2_SUB_CNT_MASK  (0x3f << 16)
> +#define SENINF_N3D_A_SUB_CNT_VS2_SUB_CNT_EN_SHIFT 22
> +#define SENINF_N3D_A_SUB_CNT_VS2_SUB_CNT_EN_MASK (0x1 << 22)
> +#define SENINF_N3D_A_VSYNC_CNT                                 0x0140
> +#define SENINF_N3D_A_VSYNC_CNT_N3D_VSYNC_1_CNT_SHIFT 0
> +#define SENINF_N3D_A_VSYNC_CNT_N3D_VSYNC_1_CNT_MASK (0xffff << 0)
> +#define SENINF_N3D_A_VSYNC_CNT_N3D_VSYNC_2_CNT_SHIFT 16
> +#define SENINF_N3D_A_VSYNC_CNT_N3D_VSYNC_2_CNT_MASK (0xffff << 16)
> +#define SENINF1_CTRL                                           0x0200
> +#define SENINF1_CTRL_SENINF_EN_SHIFT           0
> +#define SENINF1_CTRL_SENINF_EN_MASK            (0x1 << 0)
> +#define SENINF1_CTRL_NCSI2_SW_RST_SHIFT        1
> +#define SENINF1_CTRL_NCSI2_SW_RST_MASK         (0x1 << 1)
> +#define SENINF1_CTRL_OCSI2_SW_RST_SHIFT        2
> +#define SENINF1_CTRL_OCSI2_SW_RST_MASK         (0x1 << 2)
> +#define SENINF1_CTRL_CCIR_SW_RST_SHIFT         3
> +#define SENINF1_CTRL_CCIR_SW_RST_MASK          (0x1 << 3)
> +#define SENINF1_CTRL_CKGEN_SW_RST_SHIFT        4
> +#define SENINF1_CTRL_CKGEN_SW_RST_MASK         (0x1 << 4)
> +#define SENINF1_CTRL_TEST_MODEL_SW_RST_SHIFT   5
> +#define SENINF1_CTRL_TEST_MODEL_SW_RST_MASK    (0x1 << 5)
> +#define SENINF1_CTRL_SCAM_SW_RST_SHIFT         6
> +#define SENINF1_CTRL_SCAM_SW_RST_MASK          (0x1 << 6)
> +#define SENINF1_CTRL_CSI2_SW_RST_SHIFT         7
> +#define SENINF1_CTRL_CSI2_SW_RST_MASK          (0x1 << 7)
> +#define SENINF1_CTRL_CSI3_SW_RST_SHIFT         8
> +#define SENINF1_CTRL_CSI3_SW_RST_MASK          (0x1 << 8)
> +#define SENINF1_CTRL_SENINF_SRC_SEL_SHIFT      12
> +#define SENINF1_CTRL_SENINF_SRC_SEL_MASK       (0xf << 12)
> +#define SENINF1_CTRL_SENINF_DEBUG_SEL_SHIFT    20
> +#define SENINF1_CTRL_SENINF_DEBUG_SEL_MASK     (0xf << 20)
> +#define SENINF1_CTRL_PAD2CAM_DATA_SEL_SHIFT    28
> +#define SENINF1_CTRL_PAD2CAM_DATA_SEL_MASK     (0x7 << 28)
> +#define SENINF1_CTRL_EXT                                       0x0204
> +#define SENINF1_CTRL_EXT_SENINF_OCSI2_IP_EN_SHIFT 0
> +#define SENINF1_CTRL_EXT_SENINF_OCSI2_IP_EN_MASK (0x1 << 0)
> +#define SENINF1_CTRL_EXT_SENINF_TESTMDL_IP_EN_SHIFT 1
> +#define SENINF1_CTRL_EXT_SENINF_TESTMDL_IP_EN_MASK (0x1 << 1)
> +#define SENINF1_CTRL_EXT_SENINF_SCAM_IP_EN_SHIFT 4
> +#define SENINF1_CTRL_EXT_SENINF_SCAM_IP_EN_MASK (0x1 << 4)
> +#define SENINF1_CTRL_EXT_SENINF_NCSI2_IP_EN_SHIFT 5
> +#define SENINF1_CTRL_EXT_SENINF_NCSI2_IP_EN_MASK (0x1 << 5)
> +#define SENINF1_CTRL_EXT_SENINF_CSI2_IP_EN_SHIFT 6
> +#define SENINF1_CTRL_EXT_SENINF_CSI2_IP_EN_MASK (0x1 << 6)
> +#define SENINF1_CTRL_EXT_SENINF_CSI3_IP_EN_SHIFT 7
> +#define SENINF1_CTRL_EXT_SENINF_CSI3_IP_EN_MASK (0x1 << 7)
> +#define SENINF1_CTRL_EXT_SENINF_SRC_SEL_EXT_SHIFT 16
> +#define SENINF1_CTRL_EXT_SENINF_SRC_SEL_EXT_MASK (0x3 << 16)
> +#define SENINF1_ASYNC_CTRL                                     0x0208
> +#define SENINF1_ASYNC_CTRL_SENINF_ASYNC_FIFO_RST_SHIFT 0
> +#define SENINF1_ASYNC_CTRL_SENINF_ASYNC_FIFO_RST_MASK (0x1 << 0)
> +#define SENINF1_ASYNC_CTRL_SENINF_HSYNC_MASK_SHIFT 1
> +#define SENINF1_ASYNC_CTRL_SENINF_HSYNC_MASK_MASK (0x1 << 1)
> +#define SENINF1_ASYNC_CTRL_SENINF_VSYNC_POL_SHIFT 2
> +#define SENINF1_ASYNC_CTRL_SENINF_VSYNC_POL_MASK (0x1 << 2)
> +#define SENINF1_ASYNC_CTRL_SENINF_HSYNC_POL_SHIFT 3
> +#define SENINF1_ASYNC_CTRL_SENINF_HSYNC_POL_MASK (0x1 << 3)
> +#define SENINF1_ASYNC_CTRL_FIFO_PUSH_EN_SHIFT  16
> +#define SENINF1_ASYNC_CTRL_FIFO_PUSH_EN_MASK   (0x3f << 16)
> +#define SENINF1_ASYNC_CTRL_FIFO_FLUSH_EN_SHIFT 24
> +#define SENINF1_ASYNC_CTRL_FIFO_FLUSH_EN_MASK  (0x3f << 24)
> +#define SENINF_TG1_PH_CNT                                      0x0600
> +#define SENINF_TG1_PH_CNT_TGCLK_SEL_SHIFT      0
> +#define SENINF_TG1_PH_CNT_TGCLK_SEL_MASK       (0x3 << 0)
> +#define SENINF_TG1_PH_CNT_CLKFL_POL_SHIFT      2
> +#define SENINF_TG1_PH_CNT_CLKFL_POL_MASK       (0x1 << 2)
> +#define SENINF_TG1_PH_CNT_EXT_RST_SHIFT        4
> +#define SENINF_TG1_PH_CNT_EXT_RST_MASK         (0x1 << 4)
> +#define SENINF_TG1_PH_CNT_EXT_PWRDN_SHIFT      5
> +#define SENINF_TG1_PH_CNT_EXT_PWRDN_MASK       (0x1 << 5)
> +#define SENINF_TG1_PH_CNT_PAD_PCLK_INV_SHIFT   6
> +#define SENINF_TG1_PH_CNT_PAD_PCLK_INV_MASK    (0x1 << 6)
> +#define SENINF_TG1_PH_CNT_CAM_PCLK_INV_SHIFT   7
> +#define SENINF_TG1_PH_CNT_CAM_PCLK_INV_MASK    (0x1 << 7)
> +#define SENINF_TG1_PH_CNT_CLKPOL_SHIFT         28
> +#define SENINF_TG1_PH_CNT_CLKPOL_MASK          (0x1 << 28)
> +#define SENINF_TG1_PH_CNT_ADCLK_EN_SHIFT       29
> +#define SENINF_TG1_PH_CNT_ADCLK_EN_MASK        (0x1 << 29)
> +#define SENINF_TG1_PH_CNT_PCEN_SHIFT           31
> +#define SENINF_TG1_PH_CNT_PCEN_MASK            (0x1 << 31)
> +#define SENINF_TG1_SEN_CK                                      0x0604
> +#define SENINF_TG1_SEN_CK_CLKFL_SHIFT          0
> +#define SENINF_TG1_SEN_CK_CLKFL_MASK           (0x3f << 0)
> +#define SENINF_TG1_SEN_CK_CLKRS_SHIFT          8
> +#define SENINF_TG1_SEN_CK_CLKRS_MASK           (0x3f << 8)
> +#define SENINF_TG1_SEN_CK_CLKCNT_SHIFT         16
> +#define SENINF_TG1_SEN_CK_CLKCNT_MASK          (0x3f << 16)
> +#define SENINF_TG1_TM_CTL                                      0x0608
> +#define SENINF_TG1_TM_CTL_TM_EN_SHIFT          0
> +#define SENINF_TG1_TM_CTL_TM_EN_MASK           (0x1 << 0)
> +#define SENINF_TG1_TM_CTL_TM_RST_SHIFT         1
> +#define SENINF_TG1_TM_CTL_TM_RST_MASK          (0x1 << 1)
> +#define SENINF_TG1_TM_CTL_TM_FMT_SHIFT         2
> +#define SENINF_TG1_TM_CTL_TM_FMT_MASK          (0x1 << 2)
> +#define SENINF_TG1_TM_CTL_TM_PAT_SHIFT         4
> +#define SENINF_TG1_TM_CTL_TM_PAT_MASK          (0xf << 4)
> +#define SENINF_TG1_TM_CTL_TM_VSYNC_SHIFT       8
> +#define SENINF_TG1_TM_CTL_TM_VSYNC_MASK        (0xff << 8)
> +#define SENINF_TG1_TM_CTL_TM_DUMMYPXL_SHIFT    16
> +#define SENINF_TG1_TM_CTL_TM_DUMMYPXL_MASK     (0xff << 16)
> +#define SENINF_TG1_TM_SIZE                                     0x060C
> +#define SENINF_TG1_TM_SIZE_TM_PXL_SHIFT        0
> +#define SENINF_TG1_TM_SIZE_TM_PXL_MASK         (0x1fff << 0)
> +#define SENINF_TG1_TM_SIZE_TM_LINE_SHIFT       16
> +#define SENINF_TG1_TM_SIZE_TM_LINE_MASK        (0x3fff << 16)
> +#define SENINF_TG1_TM_CLK                                      0x0610
> +#define SENINF_TG1_TM_CLK_TM_CLK_CNT_SHIFT     0
> +#define SENINF_TG1_TM_CLK_TM_CLK_CNT_MASK      (0xf << 0)
> +#define SENINF_TG1_TM_CLK_TM_CLRBAR_OFT_SHIFT  16
> +#define SENINF_TG1_TM_CLK_TM_CLRBAR_OFT_MASK   (0x3ff << 16)
> +#define SENINF_TG1_TM_CLK_TM_CLRBAR_IDX_SHIFT  28
> +#define SENINF_TG1_TM_CLK_TM_CLRBAR_IDX_MASK   (0x7 << 28)
> +#define SENINF_TG1_TM_STP                                      0x0614
> +#define SENINF_TG1_TM_STP_TG1_TM_STP_SHIFT     0
> +#define SENINF_TG1_TM_STP_TG1_TM_STP_MASK      (0xffffffff << 0)
> +#define MIPI_RX_CON24_CSI0                                     0x0824
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_NUM_SHIFT 0
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_NUM_MASK  (0x3 << 0)
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_EN_SHIFT  2
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_EN_MASK   (0x1 << 2)
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_FIX_PAT_SHIFT 5
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_FIX_PAT_MASK (0x1 << 5)
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_CLK_SEL_SHIFT 6
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_CLK_SEL_MASK (0x1 << 6)
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_CLK4X_SEL_SHIFT 7
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_CLK4X_SEL_MASK (0x1 << 7)
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_TERM_DELAY_SHIFT 8
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_TERM_DELAY_MASK (0xff << 8)
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_SETTLE_DELAY_SHIFT 16
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_SETTLE_DELAY_MASK (0xff << 16)
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_LN0_MUX_SHIFT 24
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_LN0_MUX_MASK (0x3 << 24)
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_LN1_MUX_SHIFT 26
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_LN1_MUX_MASK (0x3 << 26)
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_LN2_MUX_SHIFT 28
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_LN2_MUX_MASK (0x3 << 28)
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_LN3_MUX_SHIFT 30
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_LN3_MUX_MASK (0x3 << 30)
> +#define MIPI_RX_CON28_CSI0                                     0x0828
> +#define MIPI_RX_CON28_CSI0_CSI0_BIST_START_SHIFT 0
> +#define MIPI_RX_CON28_CSI0_CSI0_BIST_START_MASK (0x1 << 0)
> +#define MIPI_RX_CON28_CSI0_CSI0_BIST_DATA_OK_SHIFT 1
> +#define MIPI_RX_CON28_CSI0_CSI0_BIST_DATA_OK_MASK (0x1 << 1)
> +#define MIPI_RX_CON28_CSI0_CSI0_BIST_HS_FSM_OK_SHIFT 2
> +#define MIPI_RX_CON28_CSI0_CSI0_BIST_HS_FSM_OK_MASK (0x1 << 2)
> +#define MIPI_RX_CON28_CSI0_CSI0_BIST_LANE_FSM_OK_SHIFT 3
> +#define MIPI_RX_CON28_CSI0_CSI0_BIST_LANE_FSM_OK_MASK (0x1 << 3)
> +#define MIPI_RX_CON28_CSI0_CSI0_BIST_CSI2_DATA_OK_SHIFT 4
> +#define MIPI_RX_CON28_CSI0_CSI0_BIST_CSI2_DATA_OK_MASK (0x1 << 4)
> +#define MIPI_RX_CON34_CSI0                                     0x0834
> +#define MIPI_RX_CON34_CSI0_BIST_MODE_SHIFT     0
> +#define MIPI_RX_CON34_CSI0_BIST_MODE_MASK      (0x1 << 0)
> +#define MIPI_RX_CON34_CSI0_CSI0_BIST_HSDET_MUX_SHIFT 22
> +#define MIPI_RX_CON34_CSI0_CSI0_BIST_HSDET_MUX_MASK (0x3 << 22)
> +#define MIPI_RX_CON34_CSI0_CSI0_BIST_LN4_MUX_SHIFT 24
> +#define MIPI_RX_CON34_CSI0_CSI0_BIST_LN4_MUX_MASK (0x3 << 24)
> +#define MIPI_RX_CON34_CSI0_CSI0_BIST_LN5_MUX_SHIFT 26
> +#define MIPI_RX_CON34_CSI0_CSI0_BIST_LN5_MUX_MASK (0x3 << 26)
> +#define MIPI_RX_CON34_CSI0_CSI0_BIST_LN6_MUX_SHIFT 28
> +#define MIPI_RX_CON34_CSI0_CSI0_BIST_LN6_MUX_MASK (0x3 << 28)
> +#define MIPI_RX_CON34_CSI0_CSI0_BIST_LN7_MUX_SHIFT 30
> +#define MIPI_RX_CON34_CSI0_CSI0_BIST_LN7_MUX_MASK (0x3 << 30)
> +#define MIPI_RX_CON38_CSI0                                     0x0838
> +#define MIPI_RX_CON38_CSI0_MIPI_RX_SW_CTRL_MODE_SHIFT 0
> +#define MIPI_RX_CON38_CSI0_MIPI_RX_SW_CTRL_MODE_MASK (0x1 << 0)
> +#define MIPI_RX_CON38_CSI0_MIPI_RX_SW_CAL_MODE_SHIFT 1
> +#define MIPI_RX_CON38_CSI0_MIPI_RX_SW_CAL_MODE_MASK (0x1 << 1)
> +#define MIPI_RX_CON38_CSI0_MIPI_RX_HW_CAL_START_SHIFT 2
> +#define MIPI_RX_CON38_CSI0_MIPI_RX_HW_CAL_START_MASK (0x1 << 2)
> +#define MIPI_RX_CON38_CSI0_MIPI_RX_HW_CAL_OPTION_SHIFT 3
> +#define MIPI_RX_CON38_CSI0_MIPI_RX_HW_CAL_OPTION_MASK (0x1 << 3)
> +#define MIPI_RX_CON38_CSI0_MIPI_RX_SW_RST_SHIFT 4
> +#define MIPI_RX_CON38_CSI0_MIPI_RX_SW_RST_MASK (0x1f << 4)
> +#define MIPI_RX_CON38_CSI0_MIPI_RX_SW_CPHY_TX_MODE_SHIFT 9
> +#define MIPI_RX_CON38_CSI0_MIPI_RX_SW_CPHY_TX_MODE_MASK (0x1 << 9)
> +#define MIPI_RX_CON38_CSI0_MIPI_RX_SW_CPHY_RX_MODE_SHIFT 10
> +#define MIPI_RX_CON38_CSI0_MIPI_RX_SW_CPHY_RX_MODE_MASK (0x1 << 10)
> +#define MIPI_RX_CON38_CSI0_RG_CKPHASE_TRIO0_SHIFT 16
> +#define MIPI_RX_CON38_CSI0_RG_CKPHASE_TRIO0_MASK (0x1f << 16)
> +#define MIPI_RX_CON38_CSI0_RG_CKPHASE_TRIO1_SHIFT 22
> +#define MIPI_RX_CON38_CSI0_RG_CKPHASE_TRIO1_MASK (0x1f << 22)
> +#define MIPI_RX_CON38_CSI0_RG_CKPHASE_TRIO2_SHIFT 27
> +#define MIPI_RX_CON38_CSI0_RG_CKPHASE_TRIO2_MASK (0x1f << 27)
> +#define MIPI_RX_CON3C_CSI0                                     0x083C
> +#define MIPI_RX_CON3C_CSI0_MIPI_RX_SW_CTRL__SHIFT 0
> +#define MIPI_RX_CON3C_CSI0_MIPI_RX_SW_CTRL__MASK (0xffffffff << 0)
> +#define MIPI_RX_CON7C_CSI0                                     0x087C
> +#define MIPI_RX_CON7C_CSI0_DA_CSI0_LNRD0_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON7C_CSI0_DA_CSI0_LNRD0_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON7C_CSI0_DA_CSI0_LNRD0_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON7C_CSI0_DA_CSI0_LNRD0_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON7C_CSI0_DA_CSI0_LNRD0_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON7C_CSI0_DA_CSI0_LNRD0_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON80_CSI0                                     0x0880
> +#define MIPI_RX_CON80_CSI0_DA_CSI0_LNRD1_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON80_CSI0_DA_CSI0_LNRD1_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON80_CSI0_DA_CSI0_LNRD1_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON80_CSI0_DA_CSI0_LNRD1_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON80_CSI0_DA_CSI0_LNRD1_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON80_CSI0_DA_CSI0_LNRD1_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON84_CSI0                                     0x0884
> +#define MIPI_RX_CON84_CSI0_DA_CSI0_LNRD2_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON84_CSI0_DA_CSI0_LNRD2_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON84_CSI0_DA_CSI0_LNRD2_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON84_CSI0_DA_CSI0_LNRD2_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON84_CSI0_DA_CSI0_LNRD2_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON84_CSI0_DA_CSI0_LNRD2_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON88_CSI0                                     0x0888
> +#define MIPI_RX_CON88_CSI0_DA_CSI0_LNRD3_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON88_CSI0_DA_CSI0_LNRD3_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON88_CSI0_DA_CSI0_LNRD3_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON88_CSI0_DA_CSI0_LNRD3_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON88_CSI0_DA_CSI0_LNRD3_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON88_CSI0_DA_CSI0_LNRD3_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON8C_CSI0                                     0x088C
> +#define MIPI_RX_CON8C_CSI0_RG_CSI0_LNRD0_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON8C_CSI0_RG_CSI0_LNRD0_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON8C_CSI0_RG_CSI0_LNRD0_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON8C_CSI0_RG_CSI0_LNRD0_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON8C_CSI0_RG_CSI0_LNRD0_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON8C_CSI0_RG_CSI0_LNRD0_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON90_CSI0                                     0x0890
> +#define MIPI_RX_CON90_CSI0_RG_CSI0_LNRD1_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON90_CSI0_RG_CSI0_LNRD1_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON90_CSI0_RG_CSI0_LNRD1_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON90_CSI0_RG_CSI0_LNRD1_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON90_CSI0_RG_CSI0_LNRD1_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON90_CSI0_RG_CSI0_LNRD1_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON94_CSI0                                     0x0894
> +#define MIPI_RX_CON94_CSI0_RG_CSI0_LNRD2_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON94_CSI0_RG_CSI0_LNRD2_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON94_CSI0_RG_CSI0_LNRD2_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON94_CSI0_RG_CSI0_LNRD2_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON94_CSI0_RG_CSI0_LNRD2_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON94_CSI0_RG_CSI0_LNRD2_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON98_CSI0                                     0x0898
> +#define MIPI_RX_CON98_CSI0_RG_CSI0_LNRD3_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON98_CSI0_RG_CSI0_LNRD3_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON98_CSI0_RG_CSI0_LNRD3_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON98_CSI0_RG_CSI0_LNRD3_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON98_CSI0_RG_CSI0_LNRD3_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON98_CSI0_RG_CSI0_LNRD3_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CONA0_CSI0                                     0x08A0
> +#define MIPI_RX_CONA0_CSI0_RG_CSI0_LNRC_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CONA0_CSI0_RG_CSI0_LNRC_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CONA0_CSI0_RG_CSI0_LNRC_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CONA0_CSI0_RG_CSI0_LNRC_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CONA0_CSI0_RG_CSI0_LNRC_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CONA0_CSI0_RG_CSI0_LNRC_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CONB0_CSI0                                     0x08B0
> +#define MIPI_RX_CONB0_CSI0_DELAY_APPLY_MODE_SHIFT 0
> +#define MIPI_RX_CONB0_CSI0_DELAY_APPLY_MODE_MASK (0xf << 0)
> +#define MIPI_RX_CONB0_CSI0_DESKEW_SW_RST_SHIFT 7
> +#define MIPI_RX_CONB0_CSI0_DESKEW_SW_RST_MASK  (0x1 << 7)
> +#define MIPI_RX_CONB0_CSI0_DESKEW_TRIGGER_MODE_SHIFT 8
> +#define MIPI_RX_CONB0_CSI0_DESKEW_TRIGGER_MODE_MASK (0x7 << 8)
> +#define MIPI_RX_CONB0_CSI0_DESKEW_ACC_MODE_SHIFT 12
> +#define MIPI_RX_CONB0_CSI0_DESKEW_ACC_MODE_MASK (0xf << 12)
> +#define MIPI_RX_CONB0_CSI0_DESKEW_CSI2_RST_ENABLE_SHIFT 16
> +#define MIPI_RX_CONB0_CSI0_DESKEW_CSI2_RST_ENABLE_MASK (0x1 << 16)
> +#define MIPI_RX_CONB0_CSI0_DESKEW_IP_SEL_SHIFT 30
> +#define MIPI_RX_CONB0_CSI0_DESKEW_IP_SEL_MASK  (0x1 << 30)
> +#define MIPI_RX_CONB0_CSI0_DESKEW_ENABLE_SHIFT 31
> +#define MIPI_RX_CONB0_CSI0_DESKEW_ENABLE_MASK  (0x1 << 31)
> +#define MIPI_RX_CONB4_CSI0                                     0x08B4
> +#define MIPI_RX_CONB4_CSI0_SYNC_CODE_MASK_SHIFT 0
> +#define MIPI_RX_CONB4_CSI0_SYNC_CODE_MASK_MASK (0xffff << 0)
> +#define MIPI_RX_CONB4_CSI0_EXPECTED_SYNC_CODE_SHIFT 16
> +#define MIPI_RX_CONB4_CSI0_EXPECTED_SYNC_CODE_MASK (0xffff << 16)
> +#define MIPI_RX_CONB8_CSI0                                     0x08B8
> +#define MIPI_RX_CONB8_CSI0_DESKEW_SETUP_TIME_SHIFT 0
> +#define MIPI_RX_CONB8_CSI0_DESKEW_SETUP_TIME_MASK (0xf << 0)
> +#define MIPI_RX_CONB8_CSI0_DESKEW_HOLD_TIME_SHIFT 8
> +#define MIPI_RX_CONB8_CSI0_DESKEW_HOLD_TIME_MASK (0xf << 8)
> +#define MIPI_RX_CONB8_CSI0_DESKEW_TIME_OUT_SHIFT 16
> +#define MIPI_RX_CONB8_CSI0_DESKEW_TIME_OUT_MASK (0xff << 16)
> +#define MIPI_RX_CONB8_CSI0_DESKEW_TIME_OUT_EN_SHIFT 24
> +#define MIPI_RX_CONB8_CSI0_DESKEW_TIME_OUT_EN_MASK (0x1 << 24)
> +#define MIPI_RX_CONBC_CSI0                                     0x08BC
> +#define MIPI_RX_CONBC_CSI0_DESKEW_DETECTION_MODE_SHIFT 0
> +#define MIPI_RX_CONBC_CSI0_DESKEW_DETECTION_MODE_MASK (0xf << 0)
> +#define MIPI_RX_CONBC_CSI0_DESKEW_DETECTION_CNT_SHIFT 8
> +#define MIPI_RX_CONBC_CSI0_DESKEW_DETECTION_CNT_MASK (0x7f << 8)
> +#define MIPI_RX_CONBC_CSI0_DESKEW_DELAY_APPLY_MODE_SHIFT 16
> +#define MIPI_RX_CONBC_CSI0_DESKEW_DELAY_APPLY_MODE_MASK (0xf << 16)
> +#define MIPI_RX_CONBC_CSI0_DESKEW_LANE_NUMBER_SHIFT 24
> +#define MIPI_RX_CONBC_CSI0_DESKEW_LANE_NUMBER_MASK (0x3 << 24)
> +#define MIPI_RX_CONC0_CSI0                                     0x08C0
> +#define MIPI_RX_CONC0_CSI0_DESKEW_INTERRUPT_ENABLE_SHIFT 0
> +#define MIPI_RX_CONC0_CSI0_DESKEW_INTERRUPT_ENABLE_MASK (0xffff << 0)
> +#define MIPI_RX_CONC0_CSI0_DESKEW_INTERRUPT_W1C_EN_SHIFT 31
> +#define MIPI_RX_CONC0_CSI0_DESKEW_INTERRUPT_W1C_EN_MASK (0x1 << 31)
> +#define MIPI_RX_CONC4_CSI0                                     0x08C4
> +#define MIPI_RX_CONC4_CSI0_DESKEW_INTERRUPT_STATUS_SHIFT 0
> +#define MIPI_RX_CONC4_CSI0_DESKEW_INTERRUPT_STATUS_MASK (0xffff << 0)
> +#define MIPI_RX_CONC8_CSI0                                     0x08C8
> +#define MIPI_RX_CONC8_CSI0_DESKEW_DEBUG_MUX_SELECT_SHIFT 0
> +#define MIPI_RX_CONC8_CSI0_DESKEW_DEBUG_MUX_SELECT_MASK (0xff << 0)
> +#define MIPI_RX_CONCC_CSI0                                     0x08CC
> +#define MIPI_RX_CONCC_CSI0_DESKEW_DEBUG_OUTPUTS_SHIFT 0
> +#define MIPI_RX_CONCC_CSI0_DESKEW_DEBUG_OUTPUTS_MASK (0xffffffff << 0)
> +#define MIPI_RX_COND0_CSI0                                     0x08D0
> +#define MIPI_RX_COND0_CSI0_DESKEW_DELAY_LENGTH_SHIFT 0
> +#define MIPI_RX_COND0_CSI0_DESKEW_DELAY_LENGTH_MASK (0x3f << 0)
> +#define SENINF1_CSI2_CTL                                       0x0A00
> +#define SENINF1_CSI2_CTL_DATA_LANE0_EN_SHIFT   0
> +#define SENINF1_CSI2_CTL_DATA_LANE0_EN_MASK    (0x1 << 0)
> +#define SENINF1_CSI2_CTL_DATA_LANE1_EN_SHIFT   1
> +#define SENINF1_CSI2_CTL_DATA_LANE1_EN_MASK    (0x1 << 1)
> +#define SENINF1_CSI2_CTL_DATA_LANE2_EN_SHIFT   2
> +#define SENINF1_CSI2_CTL_DATA_LANE2_EN_MASK    (0x1 << 2)
> +#define SENINF1_CSI2_CTL_DATA_LANE3_EN_SHIFT   3
> +#define SENINF1_CSI2_CTL_DATA_LANE3_EN_MASK    (0x1 << 3)
> +#define SENINF1_CSI2_CTL_CLOCK_LANE_EN_SHIFT   4
> +#define SENINF1_CSI2_CTL_CLOCK_LANE_EN_MASK    (0x1 << 4)
> +#define SENINF1_CSI2_CTL_ECC_EN_SHIFT          5
> +#define SENINF1_CSI2_CTL_ECC_EN_MASK           (0x1 << 5)
> +#define SENINF1_CSI2_CTL_CRC_EN_SHIFT          6
> +#define SENINF1_CSI2_CTL_CRC_EN_MASK           (0x1 << 6)
> +#define SENINF1_CSI2_CTL_HSRX_DET_EN_SHIFT     7
> +#define SENINF1_CSI2_CTL_HSRX_DET_EN_MASK      (0x1 << 7)
> +#define SENINF1_CSI2_CTL_HS_PRPR_EN_SHIFT      8
> +#define SENINF1_CSI2_CTL_HS_PRPR_EN_MASK       (0x1 << 8)
> +#define SENINF1_CSI2_CTL_HS_END_EN_SHIFT       9
> +#define SENINF1_CSI2_CTL_HS_END_EN_MASK        (0x1 << 9)
> +#define SENINF1_CSI2_CTL_GENERIC_LONG_PACKET_EN_SHIFT 12
> +#define SENINF1_CSI2_CTL_GENERIC_LONG_PACKET_EN_MASK (0x1 << 12)
> +#define SENINF1_CSI2_CTL_IMAGE_PACKET_EN_SHIFT 13
> +#define SENINF1_CSI2_CTL_IMAGE_PACKET_EN_MASK  (0x1 << 13)
> +#define SENINF1_CSI2_CTL_BYTE2PIXEL_EN_SHIFT   14
> +#define SENINF1_CSI2_CTL_BYTE2PIXEL_EN_MASK    (0x1 << 14)
> +#define SENINF1_CSI2_CTL_VS_TYPE_SHIFT         15
> +#define SENINF1_CSI2_CTL_VS_TYPE_MASK          (0x1 << 15)
> +#define SENINF1_CSI2_CTL_ED_SEL_SHIFT          16
> +#define SENINF1_CSI2_CTL_ED_SEL_MASK           (0x1 << 16)
> +#define SENINF1_CSI2_CTL_FLUSH_MODE_SHIFT      18
> +#define SENINF1_CSI2_CTL_FLUSH_MODE_MASK       (0x3 << 18)
> +#define SENINF1_CSI2_CTL_HS_TRAIL_EN_SHIFT     25
> +#define SENINF1_CSI2_CTL_HS_TRAIL_EN_MASK      (0x1 << 25)
> +#define SENINF1_CSI2_CTL_CLOCK_HS_OPTION_SHIFT 27
> +#define SENINF1_CSI2_CTL_CLOCK_HS_OPTION_MASK  (0x1 << 27)
> +#define SENINF1_CSI2_CTL_VS_OUT_CYCLE_NUMBER_SHIFT 28
> +#define SENINF1_CSI2_CTL_VS_OUT_CYCLE_NUMBER_MASK (0x3 << 28)
> +#define SENINF1_CSI2_LNRC_TIMING                               0x0A04
> +#define SENINF1_CSI2_LNRC_TIMING_CLOCK_TERM_PARAMETER_SHIFT 0
> +#define SENINF1_CSI2_LNRC_TIMING_CLOCK_TERM_PARAMETER_MASK (0xff << 0)
> +#define SENINF1_CSI2_LNRC_TIMING_CLOCK_SETTLE_PARAMETER_SHIFT 8
> +#define SENINF1_CSI2_LNRC_TIMING_CLOCK_SETTLE_PARAMETER_MASK (0xff << 8)
> +#define SENINF1_CSI2_LNRD_TIMING                               0x0A08
> +#define SENINF1_CSI2_LNRD_TIMING_DATA_TERM_PARAMETER_SHIFT 0
> +#define SENINF1_CSI2_LNRD_TIMING_DATA_TERM_PARAMETER_MASK (0xff << 0)
> +#define SENINF1_CSI2_LNRD_TIMING_DATA_SETTLE_PARAMETER_SHIFT 8
> +#define SENINF1_CSI2_LNRD_TIMING_DATA_SETTLE_PARAMETER_MASK (0xff << 8)
> +#define SENINF1_CSI2_DPCM                                      0x0A0C
> +#define SENINF1_CSI2_DPCM_DPCM_MODE_SHIFT      0
> +#define SENINF1_CSI2_DPCM_DPCM_MODE_MASK       (0xf << 0)
> +#define SENINF1_CSI2_DPCM_DI_30_DPCM_EN_SHIFT  7
> +#define SENINF1_CSI2_DPCM_DI_30_DPCM_EN_MASK   (0x1 << 7)
> +#define SENINF1_CSI2_DPCM_DI_31_DPCM_EN_SHIFT  8
> +#define SENINF1_CSI2_DPCM_DI_31_DPCM_EN_MASK   (0x1 << 8)
> +#define SENINF1_CSI2_DPCM_DI_32_DPCM_EN_SHIFT  9
> +#define SENINF1_CSI2_DPCM_DI_32_DPCM_EN_MASK   (0x1 << 9)
> +#define SENINF1_CSI2_DPCM_DI_33_DPCM_EN_SHIFT  10
> +#define SENINF1_CSI2_DPCM_DI_33_DPCM_EN_MASK   (0x1 << 10)
> +#define SENINF1_CSI2_DPCM_DI_34_DPCM_EN_SHIFT  11
> +#define SENINF1_CSI2_DPCM_DI_34_DPCM_EN_MASK   (0x1 << 11)
> +#define SENINF1_CSI2_DPCM_DI_35_DPCM_EN_SHIFT  12
> +#define SENINF1_CSI2_DPCM_DI_35_DPCM_EN_MASK   (0x1 << 12)
> +#define SENINF1_CSI2_DPCM_DI_36_DPCM_EN_SHIFT  13
> +#define SENINF1_CSI2_DPCM_DI_36_DPCM_EN_MASK   (0x1 << 13)
> +#define SENINF1_CSI2_DPCM_DI_37_DPCM_EN_SHIFT  14
> +#define SENINF1_CSI2_DPCM_DI_37_DPCM_EN_MASK   (0x1 << 14)
> +#define SENINF1_CSI2_DPCM_DI_2A_DPCM_EN_SHIFT  15
> +#define SENINF1_CSI2_DPCM_DI_2A_DPCM_EN_MASK   (0x1 << 15)
> +#define SENINF1_CSI2_INT_EN                                    0x0A10
> +#define SENINF1_CSI2_INT_EN_ERR_FRAME_SYNC_SHIFT 0
> +#define SENINF1_CSI2_INT_EN_ERR_FRAME_SYNC_MASK (0x1 << 0)
> +#define SENINF1_CSI2_INT_EN_ERR_ID_SHIFT       1
> +#define SENINF1_CSI2_INT_EN_ERR_ID_MASK        (0x1 << 1)
> +#define SENINF1_CSI2_INT_EN_ERR_ECC_NO_ERROR_SHIFT 2
> +#define SENINF1_CSI2_INT_EN_ERR_ECC_NO_ERROR_MASK (0x1 << 2)
> +#define SENINF1_CSI2_INT_EN_ERR_ECC_CORRECTED_SHIFT 3
> +#define SENINF1_CSI2_INT_EN_ERR_ECC_CORRECTED_MASK (0x1 << 3)
> +#define SENINF1_CSI2_INT_EN_ERR_ECC_DOUBLE_SHIFT 4
> +#define SENINF1_CSI2_INT_EN_ERR_ECC_DOUBLE_MASK (0x1 << 4)
> +#define SENINF1_CSI2_INT_EN_ERR_CRC_SHIFT      5
> +#define SENINF1_CSI2_INT_EN_ERR_CRC_MASK       (0x1 << 5)
> +#define SENINF1_CSI2_INT_EN_ERR_CRC_NO_ERROR_SHIFT 6
> +#define SENINF1_CSI2_INT_EN_ERR_CRC_NO_ERROR_MASK (0x1 << 6)
> +#define SENINF1_CSI2_INT_EN_ERR_MULTI_LANE_SYNC_SHIFT 7
> +#define SENINF1_CSI2_INT_EN_ERR_MULTI_LANE_SYNC_MASK (0x1 << 7)
> +#define SENINF1_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD0_SHIFT 8
> +#define SENINF1_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD0_MASK (0x1 << 8)
> +#define SENINF1_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD1_SHIFT 9
> +#define SENINF1_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD1_MASK (0x1 << 9)
> +#define SENINF1_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD2_SHIFT 10
> +#define SENINF1_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD2_MASK (0x1 << 10)
> +#define SENINF1_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD3_SHIFT 11
> +#define SENINF1_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD3_MASK (0x1 << 11)
> +#define SENINF1_CSI2_INT_EN_FS_SHIFT           12
> +#define SENINF1_CSI2_INT_EN_FS_MASK            (0x1 << 12)
> +#define SENINF1_CSI2_INT_EN_LS_SHIFT           13
> +#define SENINF1_CSI2_INT_EN_LS_MASK            (0x1 << 13)
> +#define SENINF1_CSI2_INT_EN_GS_SHIFT           14
> +#define SENINF1_CSI2_INT_EN_GS_MASK            (0x1 << 14)
> +#define SENINF1_CSI2_INT_EN_FE_SHIFT           15
> +#define SENINF1_CSI2_INT_EN_FE_MASK            (0x1 << 15)
> +#define SENINF1_CSI2_INT_EN_ERR_FRAME_SYNC_S0_SHIFT 16
> +#define SENINF1_CSI2_INT_EN_ERR_FRAME_SYNC_S0_MASK (0x1 << 16)
> +#define SENINF1_CSI2_INT_EN_ERR_FRAME_SYNC_S1_SHIFT 17
> +#define SENINF1_CSI2_INT_EN_ERR_FRAME_SYNC_S1_MASK (0x1 << 17)
> +#define SENINF1_CSI2_INT_EN_ERR_FRAME_SYNC_S2_SHIFT 18
> +#define SENINF1_CSI2_INT_EN_ERR_FRAME_SYNC_S2_MASK (0x1 << 18)
> +#define SENINF1_CSI2_INT_EN_ERR_FRAME_SYNC_S3_SHIFT 19
> +#define SENINF1_CSI2_INT_EN_ERR_FRAME_SYNC_S3_MASK (0x1 << 19)
> +#define SENINF1_CSI2_INT_EN_ERR_FRAME_SYNC_S4_SHIFT 20
> +#define SENINF1_CSI2_INT_EN_ERR_FRAME_SYNC_S4_MASK (0x1 << 20)
> +#define SENINF1_CSI2_INT_EN_ERR_FRAME_SYNC_S5_SHIFT 21
> +#define SENINF1_CSI2_INT_EN_ERR_FRAME_SYNC_S5_MASK (0x1 << 21)
> +#define SENINF1_CSI2_INT_EN_ERR_LANE_RESYNC_SHIFT 22
> +#define SENINF1_CSI2_INT_EN_ERR_LANE_RESYNC_MASK (0x1 << 22)
> +#define SENINF1_CSI2_INT_EN_ERR_FRAME_SYNC_S6_SHIFT 23
> +#define SENINF1_CSI2_INT_EN_ERR_FRAME_SYNC_S6_MASK (0x1 << 23)
> +#define SENINF1_CSI2_INT_EN_ERR_FRAME_SYNC_S7_SHIFT 24
> +#define SENINF1_CSI2_INT_EN_ERR_FRAME_SYNC_S7_MASK (0x1 << 24)
> +#define SENINF1_CSI2_INT_EN_TRIO0_ESCAPE_CODE_DETECT_SHIFT 26
> +#define SENINF1_CSI2_INT_EN_TRIO0_ESCAPE_CODE_DETECT_MASK (0x1 << 26)
> +#define SENINF1_CSI2_INT_EN_TRIO1_ESCAPE_CODE_DETECT_SHIFT 27
> +#define SENINF1_CSI2_INT_EN_TRIO1_ESCAPE_CODE_DETECT_MASK (0x1 << 27)
> +#define SENINF1_CSI2_INT_EN_TRIO2_ESCAPE_CODE_DETECT_SHIFT 28
> +#define SENINF1_CSI2_INT_EN_TRIO2_ESCAPE_CODE_DETECT_MASK (0x1 << 28)
> +#define SENINF1_CSI2_INT_EN_TRIO3_ESCAPE_CODE_DETECT_SHIFT 29
> +#define SENINF1_CSI2_INT_EN_TRIO3_ESCAPE_CODE_DETECT_MASK (0x1 << 29)
> +#define SENINF1_CSI2_INT_EN_MERGE_FIFO_AF_SHIFT 30
> +#define SENINF1_CSI2_INT_EN_MERGE_FIFO_AF_MASK (0x1 << 30)
> +#define SENINF1_CSI2_INT_EN_INT_WCLR_EN_SHIFT  31
> +#define SENINF1_CSI2_INT_EN_INT_WCLR_EN_MASK   (0x1 << 31)
> +#define SENINF1_CSI2_INT_STATUS                                0x0A14
> +#define SENINF1_CSI2_INT_STATUS_ERR_FRAME_SYNC_STA_SHIFT 0
> +#define SENINF1_CSI2_INT_STATUS_ERR_FRAME_SYNC_STA_MASK (0x1 << 0)
> +#define SENINF1_CSI2_INT_STATUS_ERR_ID_STA_SHIFT 1
> +#define SENINF1_CSI2_INT_STATUS_ERR_ID_STA_MASK (0x1 << 1)
> +#define SENINF1_CSI2_INT_STATUS_ERR_ECC_NO_ERROR_STA_SHIFT 2
> +#define SENINF1_CSI2_INT_STATUS_ERR_ECC_NO_ERROR_STA_MASK (0x1 << 2)
> +#define SENINF1_CSI2_INT_STATUS_ERR_ECC_CORRECTED_STA_SHIFT 3
> +#define SENINF1_CSI2_INT_STATUS_ERR_ECC_CORRECTED_STA_MASK (0x1 << 3)
> +#define SENINF1_CSI2_INT_STATUS_ERR_ECC_DOUBLE_STA_SHIFT 4
> +#define SENINF1_CSI2_INT_STATUS_ERR_ECC_DOUBLE_STA_MASK (0x1 << 4)
> +#define SENINF1_CSI2_INT_STATUS_ERR_CRC_STA_SHIFT 5
> +#define SENINF1_CSI2_INT_STATUS_ERR_CRC_STA_MASK (0x1 << 5)
> +#define SENINF1_CSI2_INT_STATUS_ERR_MULTI_LANE_SYNC_STA_SHIFT 7
> +#define SENINF1_CSI2_INT_STATUS_ERR_MULTI_LANE_SYNC_STA_MASK (0x1 << 7)
> +#define SENINF1_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD0_STA_SHIFT 8
> +#define SENINF1_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD0_STA_MASK (0x1 << 8)
> +#define SENINF1_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD1_STA_SHIFT 9
> +#define SENINF1_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD1_STA_MASK (0x1 << 9)
> +#define SENINF1_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD2_STA_SHIFT 10
> +#define SENINF1_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD2_STA_MASK (0x1 << 10)
> +#define SENINF1_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD3_STA_SHIFT 11
> +#define SENINF1_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD3_STA_MASK (0x1 << 11)
> +#define SENINF1_CSI2_INT_STATUS_FS_STA_SHIFT   12
> +#define SENINF1_CSI2_INT_STATUS_FS_STA_MASK    (0x1 << 12)
> +#define SENINF1_CSI2_INT_STATUS_LS_STA_SHIFT   13
> +#define SENINF1_CSI2_INT_STATUS_LS_STA_MASK    (0x1 << 13)
> +#define SENINF1_CSI2_INT_STATUS_GS_STA_SHIFT   14
> +#define SENINF1_CSI2_INT_STATUS_GS_STA_MASK    (0x1 << 14)
> +#define SENINF1_CSI2_INT_STATUS_FE_STA_SHIFT   15
> +#define SENINF1_CSI2_INT_STATUS_FE_STA_MASK    (0x1 << 15)
> +#define SENINF1_CSI2_INT_STATUS_ERR_FRAME_SYNC_S0_STA_SHIFT 16
> +#define SENINF1_CSI2_INT_STATUS_ERR_FRAME_SYNC_S0_STA_MASK (0x1 << 16)
> +#define SENINF1_CSI2_INT_STATUS_ERR_FRAME_SYNC_S1_STA_SHIFT 17
> +#define SENINF1_CSI2_INT_STATUS_ERR_FRAME_SYNC_S1_STA_MASK (0x1 << 17)
> +#define SENINF1_CSI2_INT_STATUS_ERR_FRAME_SYNC_S2_STA_SHIFT 18
> +#define SENINF1_CSI2_INT_STATUS_ERR_FRAME_SYNC_S2_STA_MASK (0x1 << 18)
> +#define SENINF1_CSI2_INT_STATUS_ERR_FRAME_SYNC_S3_STA_SHIFT 19
> +#define SENINF1_CSI2_INT_STATUS_ERR_FRAME_SYNC_S3_STA_MASK (0x1 << 19)
> +#define SENINF1_CSI2_INT_STATUS_ERR_FRAME_SYNC_S4_STA_SHIFT 20
> +#define SENINF1_CSI2_INT_STATUS_ERR_FRAME_SYNC_S4_STA_MASK (0x1 << 20)
> +#define SENINF1_CSI2_INT_STATUS_ERR_FRAME_SYNC_S5_STA_SHIFT 21
> +#define SENINF1_CSI2_INT_STATUS_ERR_FRAME_SYNC_S5_STA_MASK (0x1 << 21)
> +#define SENINF1_CSI2_INT_STATUS_ERR_LANE_RESYNC_STA_SHIFT 22
> +#define SENINF1_CSI2_INT_STATUS_ERR_LANE_RESYNC_STA_MASK (0x1 << 22)
> +#define SENINF1_CSI2_INT_STATUS_ERR_FRAME_SYNC_S6_STA_SHIFT 23
> +#define SENINF1_CSI2_INT_STATUS_ERR_FRAME_SYNC_S6_STA_MASK (0x1 << 23)
> +#define SENINF1_CSI2_INT_STATUS_ERR_FRAME_SYNC_S7_STA_SHIFT 24
> +#define SENINF1_CSI2_INT_STATUS_ERR_FRAME_SYNC_S7_STA_MASK (0x1 << 24)
> +#define SENINF1_CSI2_INT_STATUS_TRIO0_ESCAPE_CODE_DETECT_STA_SHIFT 26
> +#define SENINF1_CSI2_INT_STATUS_TRIO0_ESCAPE_CODE_DETECT_STA_MASK (0x1 << 26)
> +#define SENINF1_CSI2_INT_STATUS_TRIO1_ESCAPE_CODE_DETECT_STA_SHIFT 27
> +#define SENINF1_CSI2_INT_STATUS_TRIO1_ESCAPE_CODE_DETECT_STA_MASK (0x1 << 27)
> +#define SENINF1_CSI2_INT_STATUS_TRIO2_ESCAPE_CODE_DETECT_STA_SHIFT 28
> +#define SENINF1_CSI2_INT_STATUS_TRIO2_ESCAPE_CODE_DETECT_STA_MASK (0x1 << 28)
> +#define SENINF1_CSI2_INT_STATUS_TRIO3_ESCAPE_CODE_DETECT_STA_SHIFT 29
> +#define SENINF1_CSI2_INT_STATUS_TRIO3_ESCAPE_CODE_DETECT_STA_MASK (0x1 << 29)
> +#define SENINF1_CSI2_INT_STATUS_MERGE_FIFO_AF_SHIFT 30
> +#define SENINF1_CSI2_INT_STATUS_MERGE_FIFO_AF_MASK (0x1 << 30)
> +#define SENINF1_CSI2_DGB_SEL                                   0x0A18
> +#define SENINF1_CSI2_DGB_SEL_DEBUG_SEL_SHIFT   0
> +#define SENINF1_CSI2_DGB_SEL_DEBUG_SEL_MASK    (0xff << 0)
> +#define SENINF1_CSI2_DGB_SEL_DEBUG_EN_SHIFT    31
> +#define SENINF1_CSI2_DGB_SEL_DEBUG_EN_MASK     (0x1 << 31)
> +#define SENINF1_CSI2_DBG_PORT                                  0x0A1C
> +#define SENINF1_CSI2_DBG_PORT_CTL_DBG_PORT_SHIFT 0
> +#define SENINF1_CSI2_DBG_PORT_CTL_DBG_PORT_MASK (0xffff << 0)
> +#define SENINF1_CSI2_SPARE0                                    0x0A20
> +#define SENINF1_CSI2_SPARE0_SPARE0_SHIFT       0
> +#define SENINF1_CSI2_SPARE0_SPARE0_MASK        (0xffffffff << 0)
> +#define SENINF1_CSI2_SPARE1                                    0x0A24
> +#define SENINF1_CSI2_SPARE1_SPARE1_SHIFT       0
> +#define SENINF1_CSI2_SPARE1_SPARE1_MASK        (0xffffffff << 0)
> +#define SENINF1_CSI2_LNRC_FSM                                  0x0A28
> +#define SENINF1_CSI2_LNRC_FSM_LNRC_RX_FSM_SHIFT 0
> +#define SENINF1_CSI2_LNRC_FSM_LNRC_RX_FSM_MASK (0x3f << 0)
> +#define SENINF1_CSI2_LNRD_FSM                                  0x0A2C
> +#define SENINF1_CSI2_LNRD_FSM_LNRD0_RX_FSM_SHIFT 0
> +#define SENINF1_CSI2_LNRD_FSM_LNRD0_RX_FSM_MASK (0x7f << 0)
> +#define SENINF1_CSI2_LNRD_FSM_LNRD1_RX_FSM_SHIFT 8
> +#define SENINF1_CSI2_LNRD_FSM_LNRD1_RX_FSM_MASK (0x7f << 8)
> +#define SENINF1_CSI2_LNRD_FSM_LNRD2_RX_FSM_SHIFT 16
> +#define SENINF1_CSI2_LNRD_FSM_LNRD2_RX_FSM_MASK (0x7f << 16)
> +#define SENINF1_CSI2_LNRD_FSM_LNRD3_RX_FSM_SHIFT 24
> +#define SENINF1_CSI2_LNRD_FSM_LNRD3_RX_FSM_MASK (0x7f << 24)
> +#define SENINF1_CSI2_FRAME_LINE_NUM                            0x0A30
> +#define SENINF1_CSI2_FRAME_LINE_NUM_FRAME_NUM_SHIFT 0
> +#define SENINF1_CSI2_FRAME_LINE_NUM_FRAME_NUM_MASK (0xffff << 0)
> +#define SENINF1_CSI2_FRAME_LINE_NUM_LINE_NUM_SHIFT 16
> +#define SENINF1_CSI2_FRAME_LINE_NUM_LINE_NUM_MASK (0xffff << 16)
> +#define SENINF1_CSI2_GENERIC_SHORT                             0x0A34
> +#define SENINF1_CSI2_GENERIC_SHORT_GENERIC_SHORT_PACKET_DT_SHIFT 0
> +#define SENINF1_CSI2_GENERIC_SHORT_GENERIC_SHORT_PACKET_DT_MASK (0x3f << 0)
> +#define SENINF1_CSI2_GENERIC_SHORT_GENERIC_SHORT_PACKET_DATA_SHIFT 16
> +#define SENINF1_CSI2_GENERIC_SHORT_GENERIC_SHORT_PACKET_DATA_MASK (0xffff << 16)
> +#define SENINF1_CSI2_HSRX_DBG                                  0x0A38
> +#define SENINF1_CSI2_HSRX_DBG_DATA_LANE0_HSRX_EN_SHIFT 0
> +#define SENINF1_CSI2_HSRX_DBG_DATA_LANE0_HSRX_EN_MASK (0x1 << 0)
> +#define SENINF1_CSI2_HSRX_DBG_DATA_LANE1_HSRX_EN_SHIFT 1
> +#define SENINF1_CSI2_HSRX_DBG_DATA_LANE1_HSRX_EN_MASK (0x1 << 1)
> +#define SENINF1_CSI2_HSRX_DBG_DATA_LANE2_HSRX_EN_SHIFT 2
> +#define SENINF1_CSI2_HSRX_DBG_DATA_LANE2_HSRX_EN_MASK (0x1 << 2)
> +#define SENINF1_CSI2_HSRX_DBG_DATA_LANE3_HSRX_EN_SHIFT 3
> +#define SENINF1_CSI2_HSRX_DBG_DATA_LANE3_HSRX_EN_MASK (0x1 << 3)
> +#define SENINF1_CSI2_HSRX_DBG_CLOCK_LANE_HSRX_EN_SHIFT 4
> +#define SENINF1_CSI2_HSRX_DBG_CLOCK_LANE_HSRX_EN_MASK (0x1 << 4)
> +#define SENINF1_CSI2_DI                                        0x0A3C
> +#define SENINF1_CSI2_DI_VC0_SHIFT              0
> +#define SENINF1_CSI2_DI_VC0_MASK               (0x3 << 0)
> +#define SENINF1_CSI2_DI_DT0_SHIFT              2
> +#define SENINF1_CSI2_DI_DT0_MASK               (0x3f << 2)
> +#define SENINF1_CSI2_DI_VC1_SHIFT              8
> +#define SENINF1_CSI2_DI_VC1_MASK               (0x3 << 8)
> +#define SENINF1_CSI2_DI_DT1_SHIFT              10
> +#define SENINF1_CSI2_DI_DT1_MASK               (0x3f << 10)
> +#define SENINF1_CSI2_DI_VC2_SHIFT              16
> +#define SENINF1_CSI2_DI_VC2_MASK               (0x3 << 16)
> +#define SENINF1_CSI2_DI_DT2_SHIFT              18
> +#define SENINF1_CSI2_DI_DT2_MASK               (0x3f << 18)
> +#define SENINF1_CSI2_DI_VC3_SHIFT              24
> +#define SENINF1_CSI2_DI_VC3_MASK               (0x3 << 24)
> +#define SENINF1_CSI2_DI_DT3_SHIFT              26
> +#define SENINF1_CSI2_DI_DT3_MASK               (0x3f << 26)
> +#define SENINF1_CSI2_HS_TRAIL                                  0x0A40
> +#define SENINF1_CSI2_HS_TRAIL_HS_TRAIL_PARAMETER_SHIFT 0
> +#define SENINF1_CSI2_HS_TRAIL_HS_TRAIL_PARAMETER_MASK (0xff << 0)
> +#define SENINF1_CSI2_DI_CTRL                                   0x0A44
> +#define SENINF1_CSI2_DI_CTRL_VC0_INTERLEAVING_SHIFT 0
> +#define SENINF1_CSI2_DI_CTRL_VC0_INTERLEAVING_MASK (0x1 << 0)
> +#define SENINF1_CSI2_DI_CTRL_DT0_INTERLEAVING_SHIFT 1
> +#define SENINF1_CSI2_DI_CTRL_DT0_INTERLEAVING_MASK (0x3 << 1)
> +#define SENINF1_CSI2_DI_CTRL_VC1_INTERLEAVING_SHIFT 8
> +#define SENINF1_CSI2_DI_CTRL_VC1_INTERLEAVING_MASK (0x1 << 8)
> +#define SENINF1_CSI2_DI_CTRL_DT1_INTERLEAVING_SHIFT 9
> +#define SENINF1_CSI2_DI_CTRL_DT1_INTERLEAVING_MASK (0x3 << 9)
> +#define SENINF1_CSI2_DI_CTRL_VC2_INTERLEAVING_SHIFT 16
> +#define SENINF1_CSI2_DI_CTRL_VC2_INTERLEAVING_MASK (0x1 << 16)
> +#define SENINF1_CSI2_DI_CTRL_DT2_INTERLEAVING_SHIFT 17
> +#define SENINF1_CSI2_DI_CTRL_DT2_INTERLEAVING_MASK (0x3 << 17)
> +#define SENINF1_CSI2_DI_CTRL_VC3_INTERLEAVING_SHIFT 24
> +#define SENINF1_CSI2_DI_CTRL_VC3_INTERLEAVING_MASK (0x1 << 24)
> +#define SENINF1_CSI2_DI_CTRL_DT3_INTERLEAVING_SHIFT 25
> +#define SENINF1_CSI2_DI_CTRL_DT3_INTERLEAVING_MASK (0x3 << 25)
> +#define SENINF1_CSI2_DETECT_CON1                               0x0A4C
> +#define SENINF1_CSI2_DETECT_CON1_DETECT_SYNC_DISABLE_SHIFT 0
> +#define SENINF1_CSI2_DETECT_CON1_DETECT_SYNC_DISABLE_MASK (0x1 << 0)
> +#define SENINF1_CSI2_DETECT_CON1_DETECT_SYNC_MASK_SHIFT 1
> +#define SENINF1_CSI2_DETECT_CON1_DETECT_SYNC_MASK_MASK (0x7f << 1)
> +#define SENINF1_CSI2_DETECT_CON1_SYNC_WORD_SHIFT 8
> +#define SENINF1_CSI2_DETECT_CON1_SYNC_WORD_MASK (0x1fffff << 8)
> +#define SENINF1_CSI2_DETECT_CON2                               0x0A50
> +#define SENINF1_CSI2_DETECT_CON2_DETECT_ESCAPE_DISABLE_SHIFT 0
> +#define SENINF1_CSI2_DETECT_CON2_DETECT_ESCAPE_DISABLE_MASK (0x1 << 0)
> +#define SENINF1_CSI2_DETECT_CON2_DETECT_ESCAPE_MASK_SHIFT 1
> +#define SENINF1_CSI2_DETECT_CON2_DETECT_ESCAPE_MASK_MASK (0x7f << 1)
> +#define SENINF1_CSI2_DETECT_CON2_ESCAPE_WORD_SHIFT 8
> +#define SENINF1_CSI2_DETECT_CON2_ESCAPE_WORD_MASK (0x1fffff << 8)
> +#define SENINF1_CSI2_DETECT_CON3                               0x0A54
> +#define SENINF1_CSI2_DETECT_CON3_DETECT_POST_DISABLE_SHIFT 0
> +#define SENINF1_CSI2_DETECT_CON3_DETECT_POST_DISABLE_MASK (0x1 << 0)
> +#define SENINF1_CSI2_DETECT_CON3_DETECT_POST_MASK_SHIFT 1
> +#define SENINF1_CSI2_DETECT_CON3_DETECT_POST_MASK_MASK (0x7f << 1)
> +#define SENINF1_CSI2_DETECT_CON3_POST_WORD_SHIFT 8
> +#define SENINF1_CSI2_DETECT_CON3_POST_WORD_MASK (0x1fffff << 8)
> +#define SENINF1_CSI2_RLR0_CON0                                 0x0A58
> +#define SENINF1_CSI2_RLR0_CON0_RLR0_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF1_CSI2_RLR0_CON0_RLR0_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF1_CSI2_RLR0_CON0_RLR0_PRBS_SEED_0_SHIFT 8
> +#define SENINF1_CSI2_RLR0_CON0_RLR0_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF1_CSI2_RLR0_CON0_RLR0_PRBS_SEED_1_SHIFT 16
> +#define SENINF1_CSI2_RLR0_CON0_RLR0_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF1_CSI2_RLR0_CON0_RLR0_PRBS_SEED_2_SHIFT 24
> +#define SENINF1_CSI2_RLR0_CON0_RLR0_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF1_CSI2_RLR1_CON0                                 0x0A5C
> +#define SENINF1_CSI2_RLR1_CON0_RLR1_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF1_CSI2_RLR1_CON0_RLR1_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF1_CSI2_RLR1_CON0_RLR1_PRBS_SEED_0_SHIFT 8
> +#define SENINF1_CSI2_RLR1_CON0_RLR1_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF1_CSI2_RLR1_CON0_RLR1_PRBS_SEED_1_SHIFT 16
> +#define SENINF1_CSI2_RLR1_CON0_RLR1_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF1_CSI2_RLR1_CON0_RLR1_PRBS_SEED_2_SHIFT 24
> +#define SENINF1_CSI2_RLR1_CON0_RLR1_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF1_CSI2_RLR2_CON0                                 0x0A60
> +#define SENINF1_CSI2_RLR2_CON0_RLR2_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF1_CSI2_RLR2_CON0_RLR2_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF1_CSI2_RLR2_CON0_RLR2_PRBS_SEED_0_SHIFT 8
> +#define SENINF1_CSI2_RLR2_CON0_RLR2_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF1_CSI2_RLR2_CON0_RLR2_PRBS_SEED_1_SHIFT 16
> +#define SENINF1_CSI2_RLR2_CON0_RLR2_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF1_CSI2_RLR2_CON0_RLR2_PRBS_SEED_2_SHIFT 24
> +#define SENINF1_CSI2_RLR2_CON0_RLR2_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF1_CSI2_RLR_CON0                                  0x0A64
> +#define SENINF1_CSI2_RLR_CON0_RLRN_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF1_CSI2_RLR_CON0_RLRN_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF1_CSI2_RLR_CON0_RLRN_PRBS_SEED_0_SHIFT 8
> +#define SENINF1_CSI2_RLR_CON0_RLRN_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF1_CSI2_RLR_CON0_RLRN_PRBS_SEED_1_SHIFT 16
> +#define SENINF1_CSI2_RLR_CON0_RLRN_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF1_CSI2_RLR_CON0_RLRN_PRBS_SEED_2_SHIFT 24
> +#define SENINF1_CSI2_RLR_CON0_RLRN_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF1_CSI2_MUX_CON                                   0x0A68
> +#define SENINF1_CSI2_MUX_CON_DPHY_RX_EXTERNAL_EN_SHIFT 0
> +#define SENINF1_CSI2_MUX_CON_DPHY_RX_EXTERNAL_EN_MASK (0x1 << 0)
> +#define SENINF1_CSI2_MUX_CON_CPHY_TX_EXTERNAL_EN_SHIFT 1
> +#define SENINF1_CSI2_MUX_CON_CPHY_TX_EXTERNAL_EN_MASK (0x1 << 1)
> +#define SENINF1_CSI2_MUX_CON_CPHY_RX_EXTERNAL_EN_SHIFT 2
> +#define SENINF1_CSI2_MUX_CON_CPHY_RX_EXTERNAL_EN_MASK (0x1 << 2)
> +#define SENINF1_CSI2_MUX_CON_RLR_PATTERN_DELAY_EN_SHIFT 3
> +#define SENINF1_CSI2_MUX_CON_RLR_PATTERN_DELAY_EN_MASK (0x1 << 3)
> +#define SENINF1_CSI2_MUX_CON_POST_PACKET_IGNORE_EN_SHIFT 4
> +#define SENINF1_CSI2_MUX_CON_POST_PACKET_IGNORE_EN_MASK (0x1 << 4)
> +#define SENINF1_CSI2_DETECT_DBG0                               0x0A6C
> +#define SENINF1_CSI2_DETECT_DBG0_DETECT_SYNC_LANE0_ST_SHIFT 0
> +#define SENINF1_CSI2_DETECT_DBG0_DETECT_SYNC_LANE0_ST_MASK (0x1 << 0)
> +#define SENINF1_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE0_ST_SHIFT 1
> +#define SENINF1_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE0_ST_MASK (0x1 << 1)
> +#define SENINF1_CSI2_DETECT_DBG0_DETECT_POST_LANE0_ST_SHIFT 2
> +#define SENINF1_CSI2_DETECT_DBG0_DETECT_POST_LANE0_ST_MASK (0x1 << 2)
> +#define SENINF1_CSI2_DETECT_DBG0_POSITION_SYNC_LANE0_ST_SHIFT 3
> +#define SENINF1_CSI2_DETECT_DBG0_POSITION_SYNC_LANE0_ST_MASK (0xf << 3)
> +#define SENINF1_CSI2_DETECT_DBG0_POSITION_ESCAPE_LANE0_ST_SHIFT 7
> +#define SENINF1_CSI2_DETECT_DBG0_POSITION_ESCAPE_LANE0_ST_MASK (0xf << 7)
> +#define SENINF1_CSI2_DETECT_DBG0_DETECT_SYNC_LANE1_ST_SHIFT 12
> +#define SENINF1_CSI2_DETECT_DBG0_DETECT_SYNC_LANE1_ST_MASK (0x1 << 12)
> +#define SENINF1_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE1_ST_SHIFT 13
> +#define SENINF1_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE1_ST_MASK (0x1 << 13)
> +#define SENINF1_CSI2_DETECT_DBG0_DETECT_POST_LANE1_ST_SHIFT 14
> +#define SENINF1_CSI2_DETECT_DBG0_DETECT_POST_LANE1_ST_MASK (0x1 << 14)
> +#define SENINF1_CSI2_DETECT_DBG0_POSITION_SYNC_LANE1_ST_SHIFT 15
> +#define SENINF1_CSI2_DETECT_DBG0_POSITION_SYNC_LANE1_ST_MASK (0xf << 15)
> +#define SENINF1_CSI2_DETECT_DBG0_POSITION_ESCAPE_LANE1_ST_SHIFT 19
> +#define SENINF1_CSI2_DETECT_DBG0_POSITION_ESCAPE_LANE1_ST_MASK (0xf << 19)
> +#define SENINF1_CSI2_DETECT_DBG0_DETECT_SYNC_LANE2_ST_SHIFT 24
> +#define SENINF1_CSI2_DETECT_DBG0_DETECT_SYNC_LANE2_ST_MASK (0x1 << 24)
> +#define SENINF1_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE2_ST_SHIFT 25
> +#define SENINF1_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE2_ST_MASK (0x1 << 25)
> +#define SENINF1_CSI2_DETECT_DBG0_DETECT_POST_LANE2_ST_SHIFT 26
> +#define SENINF1_CSI2_DETECT_DBG0_DETECT_POST_LANE2_ST_MASK (0x1 << 26)
> +#define SENINF1_CSI2_DETECT_DBG0_POSITION_SYNC_LANE2_ST_SHIFT 27
> +#define SENINF1_CSI2_DETECT_DBG0_POSITION_SYNC_LANE2_ST_MASK (0xf << 27)
> +#define SENINF1_CSI2_DETECT_DBG1                               0x0A70
> +#define SENINF1_CSI2_DETECT_DBG1_POSITION_ESCAPE_LANE2_ST_SHIFT 0
> +#define SENINF1_CSI2_DETECT_DBG1_POSITION_ESCAPE_LANE2_ST_MASK (0xf << 0)
> +#define SENINF1_CSI2_RESYNC_MERGE_CTL                          0x0A74
> +#define SENINF1_CSI2_RESYNC_MERGE_CTL_CPHY_LANE_RESYNC_CNT_SHIFT 0
> +#define SENINF1_CSI2_RESYNC_MERGE_CTL_CPHY_LANE_RESYNC_CNT_MASK (0x7 << 0)
> +#define SENINF1_CSI2_RESYNC_MERGE_CTL_LANE_RESYNC_FLUSH_EN_SHIFT 8
> +#define SENINF1_CSI2_RESYNC_MERGE_CTL_LANE_RESYNC_FLUSH_EN_MASK (0x1 << 8)
> +#define SENINF1_CSI2_RESYNC_MERGE_CTL_LANE_RESYNC_DATAOUT_OPTION_SHIFT 9
> +#define SENINF1_CSI2_RESYNC_MERGE_CTL_LANE_RESYNC_DATAOUT_OPTION_MASK (0x1 << 9)
> +#define SENINF1_CSI2_RESYNC_MERGE_CTL_BYPASS_LANE_RESYNC_SHIFT 10
> +#define SENINF1_CSI2_RESYNC_MERGE_CTL_BYPASS_LANE_RESYNC_MASK (0x1 << 10)
> +#define SENINF1_CSI2_RESYNC_MERGE_CTL_CDPHY_SEL_SHIFT 11
> +#define SENINF1_CSI2_RESYNC_MERGE_CTL_CDPHY_SEL_MASK (0x1 << 11)
> +#define SENINF1_CSI2_CTRL_TRIO_MUX                             0x0A78
> +#define SENINF1_CSI2_CTRL_TRIO_MUX_TRIO0_MUX_SHIFT 0
> +#define SENINF1_CSI2_CTRL_TRIO_MUX_TRIO0_MUX_MASK (0x7 << 0)
> +#define SENINF1_CSI2_CTRL_TRIO_MUX_TRIO1_MUX_SHIFT 3
> +#define SENINF1_CSI2_CTRL_TRIO_MUX_TRIO1_MUX_MASK (0x7 << 3)
> +#define SENINF1_CSI2_CTRL_TRIO_MUX_TRIO2_MUX_SHIFT 6
> +#define SENINF1_CSI2_CTRL_TRIO_MUX_TRIO2_MUX_MASK (0x7 << 6)
> +#define SENINF1_CSI2_CTRL_TRIO_MUX_TRIO3_MUX_SHIFT 9
> +#define SENINF1_CSI2_CTRL_TRIO_MUX_TRIO3_MUX_MASK (0x7 << 9)
> +#define SENINF1_CSI2_CTRL_TRIO_CON                             0x0A7C
> +#define SENINF1_CSI2_CTRL_TRIO_CON_TRIO0_LPRX_EN_SHIFT 0
> +#define SENINF1_CSI2_CTRL_TRIO_CON_TRIO0_LPRX_EN_MASK (0x1 << 0)
> +#define SENINF1_CSI2_CTRL_TRIO_CON_TRIO0_HSRX_EN_SHIFT 1
> +#define SENINF1_CSI2_CTRL_TRIO_CON_TRIO0_HSRX_EN_MASK (0x1 << 1)
> +#define SENINF1_CSI2_CTRL_TRIO_CON_TRIO1_LPRX_EN_SHIFT 2
> +#define SENINF1_CSI2_CTRL_TRIO_CON_TRIO1_LPRX_EN_MASK (0x1 << 2)
> +#define SENINF1_CSI2_CTRL_TRIO_CON_TRIO1_HSRX_EN_SHIFT 3
> +#define SENINF1_CSI2_CTRL_TRIO_CON_TRIO1_HSRX_EN_MASK (0x1 << 3)
> +#define SENINF1_CSI2_CTRL_TRIO_CON_TRIO2_LPRX_EN_SHIFT 4
> +#define SENINF1_CSI2_CTRL_TRIO_CON_TRIO2_LPRX_EN_MASK (0x1 << 4)
> +#define SENINF1_CSI2_CTRL_TRIO_CON_TRIO2_HSRX_EN_SHIFT 5
> +#define SENINF1_CSI2_CTRL_TRIO_CON_TRIO2_HSRX_EN_MASK (0x1 << 5)
> +#define SENINF1_CSI2_CTRL_TRIO_CON_TRIO3_LPRX_EN_SHIFT 6
> +#define SENINF1_CSI2_CTRL_TRIO_CON_TRIO3_LPRX_EN_MASK (0x1 << 6)
> +#define SENINF1_CSI2_CTRL_TRIO_CON_TRIO3_HSRX_EN_SHIFT 7
> +#define SENINF1_CSI2_CTRL_TRIO_CON_TRIO3_HSRX_EN_MASK (0x1 << 7)
> +#define SENINF1_FIX_ADDR_CPHY0_DBG                             0x0A80
> +#define SENINF1_FIX_ADDR_CPHY0_DBG_ERROR_COUNT_CPHY0_SHIFT 16
> +#define SENINF1_FIX_ADDR_CPHY0_DBG_ERROR_COUNT_CPHY0_MASK (0xff << 16)
> +#define SENINF1_FIX_ADDR_CPHY0_DBG_WORD_COUNT_OVER_FLOAT_CPHY0_SHIFT 24
> +#define SENINF1_FIX_ADDR_CPHY0_DBG_WORD_COUNT_OVER_FLOAT_CPHY0_MASK (0x1 << 24)
> +#define SENINF1_FIX_ADDR_CPHY1_DBG                             0x0A84
> +#define SENINF1_FIX_ADDR_CPHY1_DBG_ERROR_COUNT_CPHY1_SHIFT 16
> +#define SENINF1_FIX_ADDR_CPHY1_DBG_ERROR_COUNT_CPHY1_MASK (0xff << 16)
> +#define SENINF1_FIX_ADDR_CPHY1_DBG_WORD_COUNT_OVER_FLOAT_CPHY1_SHIFT 24
> +#define SENINF1_FIX_ADDR_CPHY1_DBG_WORD_COUNT_OVER_FLOAT_CPHY1_MASK (0x1 << 24)
> +#define SENINF1_FIX_ADDR_CPHY2_DBG                             0x0A88
> +#define SENINF1_FIX_ADDR_CPHY2_DBG_ERROR_COUNT_CPHY2_SHIFT 16
> +#define SENINF1_FIX_ADDR_CPHY2_DBG_ERROR_COUNT_CPHY2_MASK (0xff << 16)
> +#define SENINF1_FIX_ADDR_CPHY2_DBG_WORD_COUNT_OVER_FLOAT_CPHY2_SHIFT 24
> +#define SENINF1_FIX_ADDR_CPHY2_DBG_WORD_COUNT_OVER_FLOAT_CPHY2_MASK (0x1 << 24)
> +#define SENINF1_FIX_ADDR_DBG                                   0x0A8C
> +#define SENINF1_FIX_ADDR_DBG_ERROR_COUNT_SHIFT 16
> +#define SENINF1_FIX_ADDR_DBG_ERROR_COUNT_MASK  (0xff << 16)
> +#define SENINF1_FIX_ADDR_DBG_WORD_COUNT_OVER_FLOAT_SHIFT 24
> +#define SENINF1_FIX_ADDR_DBG_WORD_COUNT_OVER_FLOAT_MASK (0x1 << 24)
> +#define SENINF1_WIRE_STATE_DECODE_CPHY0_DBG0                   0x0A90
> +#define SENINF1_WIRE_STATE_DECODE_CPHY0_DBG0_SYMBOL_STREAM0_CPHY0_SHIFT 0
> +#define SENINF1_WIRE_STATE_DECODE_CPHY0_DBG0_SYMBOL_STREAM0_CPHY0_MASK \
> +(0xffffffff << 0)
> +#define SENINF1_WIRE_STATE_DECODE_CPHY0_DBG1                   0x0A94
> +#define SENINF1_WIRE_STATE_DECODE_CPHY0_DBG1_SYMBOL_STREAM1_CPHY0_SHIFT 0
> +#define SENINF1_WIRE_STATE_DECODE_CPHY0_DBG1_SYMBOL_STREAM1_CPHY0_MASK \
> +(0x3ff << 0)
> +#define SENINF1_WIRE_STATE_DECODE_CPHY0_DBG1_SYMBOL_STREAM_VALID_CPHY0_SHIFT 10
> +#define SENINF1_WIRE_STATE_DECODE_CPHY0_DBG1_SYMBOL_STREAM_VALID_CPHY0_MASK \
> +(0x1 << 10)
> +#define SENINF1_WIRE_STATE_DECODE_CPHY1_DBG0                   0x0A98
> +#define SENINF1_WIRE_STATE_DECODE_CPHY1_DBG0_SYMBOL_STREAM0_CPHY1_SHIFT 0
> +#define SENINF1_WIRE_STATE_DECODE_CPHY1_DBG0_SYMBOL_STREAM0_CPHY1_MASK \
> +(0xffffffff << 0)
> +#define SENINF1_WIRE_STATE_DECODE_CPHY1_DBG1                   0x0A9C
> +#define SENINF1_WIRE_STATE_DECODE_CPHY1_DBG1_SYMBOL_STREAM1_CPHY1_SHIFT 0
> +#define SENINF1_WIRE_STATE_DECODE_CPHY1_DBG1_SYMBOL_STREAM1_CPHY1_MASK \
> +(0x3ff << 0)
> +#define SENINF1_WIRE_STATE_DECODE_CPHY1_DBG1_SYMBOL_STREAM_VALID_CPHY1_SHIFT 10
> +#define SENINF1_WIRE_STATE_DECODE_CPHY1_DBG1_SYMBOL_STREAM_VALID_CPHY1_MASK \
> +(0x1 << 10)
> +#define SENINF1_WIRE_STATE_DECODE_CPHY2_DBG0                   0x0AA0
> +#define SENINF1_WIRE_STATE_DECODE_CPHY2_DBG0_SYMBOL_STREAM0_CPHY2_SHIFT 0
> +#define SENINF1_WIRE_STATE_DECODE_CPHY2_DBG0_SYMBOL_STREAM0_CPHY2_MASK \
> +(0xffffffff << 0)
> +#define SENINF1_WIRE_STATE_DECODE_CPHY2_DBG1                   0x0AA4
> +#define SENINF1_WIRE_STATE_DECODE_CPHY2_DBG1_SYMBOL_STREAM1_CPHY2_SHIFT 0
> +#define SENINF1_WIRE_STATE_DECODE_CPHY2_DBG1_SYMBOL_STREAM1_CPHY2_MASK \
> +(0x3ff << 0)
> +#define SENINF1_WIRE_STATE_DECODE_CPHY2_DBG1_SYMBOL_STREAM_VALID_CPHY2_SHIFT 10
> +#define SENINF1_WIRE_STATE_DECODE_CPHY2_DBG1_SYMBOL_STREAM_VALID_CPHY2_MASK \
> +(0x1 << 10)
> +#define SENINF1_SYNC_RESYNC_CTL                                0x0AA8
> +#define SENINF1_SYNC_RESYNC_CTL_SYNC_DETECTION_SEL_SHIFT 0
> +#define SENINF1_SYNC_RESYNC_CTL_SYNC_DETECTION_SEL_MASK (0x7 << 0)
> +#define SENINF1_SYNC_RESYNC_CTL_FLUSH_VALID_SHIFT 3
> +#define SENINF1_SYNC_RESYNC_CTL_FLUSH_VALID_MASK (0x1 << 3)
> +#define SENINF1_POST_DETECT_CTL                                0x0AAC
> +#define SENINF1_POST_DETECT_CTL_POST_DETECT_DISABLE_SHIFT 0
> +#define SENINF1_POST_DETECT_CTL_POST_DETECT_DISABLE_MASK (0x1 << 0)
> +#define SENINF1_POST_DETECT_CTL_POST_EN_SHIFT  1
> +#define SENINF1_POST_DETECT_CTL_POST_EN_MASK   (0x1 << 1)
> +#define SENINF1_WIRE_STATE_DECODE_CONFIG                       0x0AB0
> +#define SENINF1_WIRE_STATE_DECODE_CONFIG_INIT_STATE_DECODE_SHIFT 0
> +#define SENINF1_WIRE_STATE_DECODE_CONFIG_INIT_STATE_DECODE_MASK (0x7 << 0)
> +#define SENINF1_CSI2_CPHY_LNRD_FSM                             0x0AB4
> +#define SENINF1_CSI2_CPHY_LNRD_FSM_TRIO0_RX_FSM_SHIFT 8
> +#define SENINF1_CSI2_CPHY_LNRD_FSM_TRIO0_RX_FSM_MASK (0x7f << 8)
> +#define SENINF1_CSI2_CPHY_LNRD_FSM_TRIO1_RX_FSM_SHIFT 16
> +#define SENINF1_CSI2_CPHY_LNRD_FSM_TRIO1_RX_FSM_MASK (0x7f << 16)
> +#define SENINF1_CSI2_CPHY_LNRD_FSM_TRIO2_RX_FSM_SHIFT 24
> +#define SENINF1_CSI2_CPHY_LNRD_FSM_TRIO2_RX_FSM_MASK (0x7f << 24)
> +#define SENINF1_FIX_ADDR_CPHY0_DBG0                            0x0AB8
> +#define SENINF1_FIX_ADDR_CPHY0_DBG0_WORD_COUNT_CPHY0_DBG0_SHIFT 0
> +#define SENINF1_FIX_ADDR_CPHY0_DBG0_WORD_COUNT_CPHY0_DBG0_MASK \
> +(0xffffffff << 0)
> +#define SENINF1_FIX_ADDR_CPHY0_DBG1                            0x0ABC
> +#define SENINF1_FIX_ADDR_CPHY0_DBG1_WORD_COUNT_CPHY0_DBG1_SHIFT 0
> +#define SENINF1_FIX_ADDR_CPHY0_DBG1_WORD_COUNT_CPHY0_DBG1_MASK (0xffff << 0)
> +#define SENINF1_FIX_ADDR_CPHY0_DBG1_ERROR_RECORD_CPHY0_DBG0_SHIFT 16
> +#define SENINF1_FIX_ADDR_CPHY0_DBG1_ERROR_RECORD_CPHY0_DBG0_MASK \
> +(0xffff << 16)
> +#define SENINF1_FIX_ADDR_CPHY0_DBG2                            0x0AC0
> +#define SENINF1_FIX_ADDR_CPHY0_DBG2_ERROR_RECORD_CPHY0_DBG1_SHIFT 0
> +#define SENINF1_FIX_ADDR_CPHY0_DBG2_ERROR_RECORD_CPHY0_DBG1_MASK \
> +(0xffffffff << 0)
> +#define SENINF1_FIX_ADDR_CPHY1_DBG0                            0x0AC4
> +#define SENINF1_FIX_ADDR_CPHY1_DBG0_WORD_COUNT_CPHY1_DBG0_SHIFT 0
> +#define SENINF1_FIX_ADDR_CPHY1_DBG0_WORD_COUNT_CPHY1_DBG0_MASK \
> +(0xffffffff << 0)
> +#define SENINF1_FIX_ADDR_CPHY1_DBG1                            0x0AC8
> +#define SENINF1_FIX_ADDR_CPHY1_DBG1_WORD_COUNT_CPHY1_DBG1_SHIFT 0
> +#define SENINF1_FIX_ADDR_CPHY1_DBG1_WORD_COUNT_CPHY1_DBG1_MASK (0xffff << 0)
> +#define SENINF1_FIX_ADDR_CPHY1_DBG1_ERROR_RECORD_CPHY1_DBG0_SHIFT 16
> +#define SENINF1_FIX_ADDR_CPHY1_DBG1_ERROR_RECORD_CPHY1_DBG0_MASK (0xffff << 16)
> +#define SENINF1_FIX_ADDR_CPHY1_DBG2                            0x0ACC
> +#define SENINF1_FIX_ADDR_CPHY1_DBG2_ERROR_RECORD_CPHY1_DBG1_SHIFT 0
> +#define SENINF1_FIX_ADDR_CPHY1_DBG2_ERROR_RECORD_CPHY1_DBG1_MASK \
> +(0xffffffff << 0)
> +#define SENINF1_FIX_ADDR_CPHY2_DBG0                            0x0AD0
> +#define SENINF1_FIX_ADDR_CPHY2_DBG0_WORD_COUNT_CPHY2_DBG0_SHIFT 0
> +#define SENINF1_FIX_ADDR_CPHY2_DBG0_WORD_COUNT_CPHY2_DBG0_MASK \
> +(0xffffffff << 0)
> +#define SENINF1_FIX_ADDR_CPHY2_DBG1                            0x0AD4
> +#define SENINF1_FIX_ADDR_CPHY2_DBG1_WORD_COUNT_CPHY2_DBG1_SHIFT 0
> +#define SENINF1_FIX_ADDR_CPHY2_DBG1_WORD_COUNT_CPHY2_DBG1_MASK \
> +(0xffff << 0)
> +#define SENINF1_FIX_ADDR_CPHY2_DBG1_ERROR_RECORD_CPHY2_DBG0_SHIFT 16
> +#define SENINF1_FIX_ADDR_CPHY2_DBG1_ERROR_RECORD_CPHY2_DBG0_MASK \
> +(0xffff << 16)
> +#define SENINF1_FIX_ADDR_CPHY2_DBG2                            0x0AD8
> +#define SENINF1_FIX_ADDR_CPHY2_DBG2_ERROR_RECORD_CPHY2_DBG1_SHIFT 0
> +#define SENINF1_FIX_ADDR_CPHY2_DBG2_ERROR_RECORD_CPHY2_DBG1_MASK \
> +(0xffffffff << 0)
> +#define SENINF1_FIX_ADDR_DBG0                                  0x0ADC
> +#define SENINF1_FIX_ADDR_DBG0_WORD_COUNT_DBG0_SHIFT 0
> +#define SENINF1_FIX_ADDR_DBG0_WORD_COUNT_DBG0_MASK (0xffffffff << 0)
> +#define SENINF1_FIX_ADDR_DBG1                                  0x0AE0
> +#define SENINF1_FIX_ADDR_DBG1_WORD_COUNT_DBG1_SHIFT 0
> +#define SENINF1_FIX_ADDR_DBG1_WORD_COUNT_DBG1_MASK (0xffff << 0)
> +#define SENINF1_FIX_ADDR_DBG1_ERROR_RECORD_DBG0_SHIFT 16
> +#define SENINF1_FIX_ADDR_DBG1_ERROR_RECORD_DBG0_MASK (0xffff << 16)
> +#define SENINF1_FIX_ADDR_DBG2                                  0x0AE4
> +#define SENINF1_FIX_ADDR_DBG2_ERROR_RECORD_DBG1_SHIFT 0
> +#define SENINF1_FIX_ADDR_DBG2_ERROR_RECORD_DBG1_MASK (0xffffffff << 0)
> +#define SENINF1_CSI2_MODE                                      0x0AE8
> +#define SENINF1_CSI2_MODE_CSR_CSI2_MODE_SHIFT  0
> +#define SENINF1_CSI2_MODE_CSR_CSI2_MODE_MASK   (0xff << 0)
> +#define SENINF1_CSI2_MODE_CSR_CSI2_HEADER_LEN_SHIFT 8
> +#define SENINF1_CSI2_MODE_CSR_CSI2_HEADER_LEN_MASK (0x7 << 8)
> +#define SENINF1_CSI2_MODE_CSR_CPHY_DI_POS_SHIFT 16
> +#define SENINF1_CSI2_MODE_CSR_CPHY_DI_POS_MASK (0xff << 16)
> +#define SENINF1_CSI2_MODE_CSR_CPHY_WC_POS_SHIFT 24
> +#define SENINF1_CSI2_MODE_CSR_CPHY_WC_POS_MASK (0xff << 24)
> +#define SENINF1_CSI2_DI_EXT                                    0x0AF0
> +#define SENINF1_CSI2_DI_EXT_VC4_SHIFT          0
> +#define SENINF1_CSI2_DI_EXT_VC4_MASK           (0x3 << 0)
> +#define SENINF1_CSI2_DI_EXT_DT4_SHIFT          2
> +#define SENINF1_CSI2_DI_EXT_DT4_MASK           (0x3f << 2)
> +#define SENINF1_CSI2_DI_EXT_VC5_SHIFT          8
> +#define SENINF1_CSI2_DI_EXT_VC5_MASK           (0x3 << 8)
> +#define SENINF1_CSI2_DI_EXT_DT5_SHIFT          10
> +#define SENINF1_CSI2_DI_EXT_DT5_MASK           (0x3f << 10)
> +#define SENINF1_CSI2_DI_CTRL_EXT                               0x0AF4
> +#define SENINF1_CSI2_DI_CTRL_EXT_VC4_INTERLEAVING_SHIFT 0
> +#define SENINF1_CSI2_DI_CTRL_EXT_VC4_INTERLEAVING_MASK (0x1 << 0)
> +#define SENINF1_CSI2_DI_CTRL_EXT_DT4_INTERLEAVING_SHIFT 1
> +#define SENINF1_CSI2_DI_CTRL_EXT_DT4_INTERLEAVING_MASK (0x3 << 1)
> +#define SENINF1_CSI2_DI_CTRL_EXT_VC5_INTERLEAVING_SHIFT 8
> +#define SENINF1_CSI2_DI_CTRL_EXT_VC5_INTERLEAVING_MASK (0x1 << 8)
> +#define SENINF1_CSI2_DI_CTRL_EXT_DT5_INTERLEAVING_SHIFT 9
> +#define SENINF1_CSI2_DI_CTRL_EXT_DT5_INTERLEAVING_MASK (0x3 << 9)
> +#define SENINF1_CSI2_CPHY_LOOPBACK                             0x0AF8
> +#define SENINF1_CSI2_CPHY_LOOPBACK_TRIGGER_SYNC_INIT_SHIFT 0
> +#define SENINF1_CSI2_CPHY_LOOPBACK_TRIGGER_SYNC_INIT_MASK (0x1 << 0)
> +#define SENINF1_CSI2_CPHY_LOOPBACK_RELEASE_SYNC_INIT_SHIFT 1
> +#define SENINF1_CSI2_CPHY_LOOPBACK_RELEASE_SYNC_INIT_MASK (0x1 << 1)
> +#define SENINF1_CSI2_PROGSEQ_0                                 0x0B00
> +#define SENINF1_CSI2_PROGSEQ_0_PROGSEQ_S0_SHIFT 0
> +#define SENINF1_CSI2_PROGSEQ_0_PROGSEQ_S0_MASK (0x7 << 0)
> +#define SENINF1_CSI2_PROGSEQ_0_PROGSEQ_S1_SHIFT 4
> +#define SENINF1_CSI2_PROGSEQ_0_PROGSEQ_S1_MASK (0x7 << 4)
> +#define SENINF1_CSI2_PROGSEQ_0_PROGSEQ_S2_SHIFT 8
> +#define SENINF1_CSI2_PROGSEQ_0_PROGSEQ_S2_MASK (0x7 << 8)
> +#define SENINF1_CSI2_PROGSEQ_0_PROGSEQ_S3_SHIFT 12
> +#define SENINF1_CSI2_PROGSEQ_0_PROGSEQ_S3_MASK (0x7 << 12)
> +#define SENINF1_CSI2_PROGSEQ_0_PROGSEQ_S4_SHIFT 16
> +#define SENINF1_CSI2_PROGSEQ_0_PROGSEQ_S4_MASK (0x7 << 16)
> +#define SENINF1_CSI2_PROGSEQ_0_PROGSEQ_S5_SHIFT 20
> +#define SENINF1_CSI2_PROGSEQ_0_PROGSEQ_S5_MASK (0x7 << 20)
> +#define SENINF1_CSI2_PROGSEQ_0_PROGSEQ_S6_SHIFT 24
> +#define SENINF1_CSI2_PROGSEQ_0_PROGSEQ_S6_MASK (0x7 << 24)
> +#define SENINF1_CSI2_PROGSEQ_0_PROGSEQ_S7_SHIFT 28
> +#define SENINF1_CSI2_PROGSEQ_0_PROGSEQ_S7_MASK (0x7 << 28)
> +#define SENINF1_CSI2_PROGSEQ_1                                 0x0B04
> +#define SENINF1_CSI2_PROGSEQ_1_PROGSEQ_S8_SHIFT 0
> +#define SENINF1_CSI2_PROGSEQ_1_PROGSEQ_S8_MASK (0x7 << 0)
> +#define SENINF1_CSI2_PROGSEQ_1_PROGSEQ_S9_SHIFT 4
> +#define SENINF1_CSI2_PROGSEQ_1_PROGSEQ_S9_MASK (0x7 << 4)
> +#define SENINF1_CSI2_PROGSEQ_1_PROGSEQ_S10_SHIFT 8
> +#define SENINF1_CSI2_PROGSEQ_1_PROGSEQ_S10_MASK (0x7 << 8)
> +#define SENINF1_CSI2_PROGSEQ_1_PROGSEQ_S11_SHIFT 12
> +#define SENINF1_CSI2_PROGSEQ_1_PROGSEQ_S11_MASK (0x7 << 12)
> +#define SENINF1_CSI2_PROGSEQ_1_PROGSEQ_S12_SHIFT 16
> +#define SENINF1_CSI2_PROGSEQ_1_PROGSEQ_S12_MASK (0x7 << 16)
> +#define SENINF1_CSI2_PROGSEQ_1_PROGSEQ_S13_SHIFT 20
> +#define SENINF1_CSI2_PROGSEQ_1_PROGSEQ_S13_MASK (0x7 << 20)
> +#define SENINF1_CSI2_INT_EN_EXT                                0x0B10
> +#define SENINF1_CSI2_INT_EN_EXT_DPHY0_RESYNC_FIFO_OVERFLOW_SHIFT 1
> +#define SENINF1_CSI2_INT_EN_EXT_DPHY0_RESYNC_FIFO_OVERFLOW_MASK (0x1 << 1)
> +#define SENINF1_CSI2_INT_EN_EXT_DPHY1_RESYNC_FIFO_OVERFLOW_SHIFT 2
> +#define SENINF1_CSI2_INT_EN_EXT_DPHY1_RESYNC_FIFO_OVERFLOW_MASK (0x1 << 2)
> +#define SENINF1_CSI2_INT_EN_EXT_DPHY2_RESYNC_FIFO_OVERFLOW_SHIFT 3
> +#define SENINF1_CSI2_INT_EN_EXT_DPHY2_RESYNC_FIFO_OVERFLOW_MASK (0x1 << 3)
> +#define SENINF1_CSI2_INT_EN_EXT_DPHY3_RESYNC_FIFO_OVERFLOW_SHIFT 4
> +#define SENINF1_CSI2_INT_EN_EXT_DPHY3_RESYNC_FIFO_OVERFLOW_MASK (0x1 << 4)
> +#define SENINF1_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO0_SHIFT 8
> +#define SENINF1_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO0_MASK (0x1 << 8)
> +#define SENINF1_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO1_SHIFT 9
> +#define SENINF1_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO1_MASK (0x1 << 9)
> +#define SENINF1_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO2_SHIFT 10
> +#define SENINF1_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO2_MASK (0x1 << 10)
> +#define SENINF1_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO3_SHIFT 11
> +#define SENINF1_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO3_MASK (0x1 << 11)
> +#define SENINF1_CSI2_INT_EN_EXT_INT_WCLR_EN_SHIFT 31
> +#define SENINF1_CSI2_INT_EN_EXT_INT_WCLR_EN_MASK (0x1 << 31)
> +#define SENINF1_CSI2_INT_STATUS_EXT                            0x0B14
> +#define SENINF1_CSI2_INT_STATUS_EXT_DPHY0_RESYNC_FIFO_OVERFLOW_STA_SHIFT 1
> +#define SENINF1_CSI2_INT_STATUS_EXT_DPHY0_RESYNC_FIFO_OVERFLOW_STA_MASK \
> +(0x1 << 1)
> +#define SENINF1_CSI2_INT_STATUS_EXT_DPHY1_RESYNC_FIFO_OVERFLOW_STA_SHIFT 2
> +#define SENINF1_CSI2_INT_STATUS_EXT_DPHY1_RESYNC_FIFO_OVERFLOW_STA_MASK \
> +(0x1 << 2)
> +#define SENINF1_CSI2_INT_STATUS_EXT_DPHY2_RESYNC_FIFO_OVERFLOW_STA_SHIFT 3
> +#define SENINF1_CSI2_INT_STATUS_EXT_DPHY2_RESYNC_FIFO_OVERFLOW_STA_MASK \
> +(0x1 << 3)
> +#define SENINF1_CSI2_INT_STATUS_EXT_DPHY3_RESYNC_FIFO_OVERFLOW_STA_SHIFT 4
> +#define SENINF1_CSI2_INT_STATUS_EXT_DPHY3_RESYNC_FIFO_OVERFLOW_STA_MASK \
> +(0x1 << 4)
> +#define SENINF1_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO0_SHIFT 8
> +#define SENINF1_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO0_MASK (0x1 << 8)
> +#define SENINF1_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO1_SHIFT 9
> +#define SENINF1_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO1_MASK (0x1 << 9)
> +#define SENINF1_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO2_SHIFT 10
> +#define SENINF1_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO2_MASK (0x1 << 10)
> +#define SENINF1_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO3_SHIFT 11
> +#define SENINF1_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO3_MASK (0x1 << 11)
> +#define SENINF1_CSI2_CPHY_FIX_POINT_RST                        0x0B18
> +#define SENINF1_CSI2_CPHY_FIX_POINT_RST_CPHY_FIX_POINT_RST_SHIFT 0
> +#define SENINF1_CSI2_CPHY_FIX_POINT_RST_CPHY_FIX_POINT_RST_MASK (0x1 << 0)
> +#define SENINF1_CSI2_CPHY_FIX_POINT_RST_CPHY_FIX_POINT_RST_MODE_SHIFT 1
> +#define SENINF1_CSI2_CPHY_FIX_POINT_RST_CPHY_FIX_POINT_RST_MODE_MASK (0x1 << 1)
> +#define SENINF1_CSI2_RLR3_CON0                                 0x0B1C
> +#define SENINF1_CSI2_RLR3_CON0_RLR3_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF1_CSI2_RLR3_CON0_RLR3_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF1_CSI2_RLR3_CON0_RLR3_PRBS_SEED_0_SHIFT 8
> +#define SENINF1_CSI2_RLR3_CON0_RLR3_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF1_CSI2_RLR3_CON0_RLR3_PRBS_SEED_1_SHIFT 16
> +#define SENINF1_CSI2_RLR3_CON0_RLR3_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF1_CSI2_RLR3_CON0_RLR3_PRBS_SEED_2_SHIFT 24
> +#define SENINF1_CSI2_RLR3_CON0_RLR3_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF1_CSI2_DPHY_SYNC                                 0x0B20
> +#define SENINF1_CSI2_DPHY_SYNC_SYNC_SEQ_MASK_0_SHIFT 0
> +#define SENINF1_CSI2_DPHY_SYNC_SYNC_SEQ_MASK_0_MASK (0xffff << 0)
> +#define SENINF1_CSI2_DPHY_SYNC_SYNC_SEQ_PAT_0_SHIFT 16
> +#define SENINF1_CSI2_DPHY_SYNC_SYNC_SEQ_PAT_0_MASK (0xffff << 16)
> +#define SENINF1_CSI2_DESKEW_SYNC                               0x0B24
> +#define SENINF1_CSI2_DESKEW_SYNC_SYNC_SEQ_MASK_1_SHIFT 0
> +#define SENINF1_CSI2_DESKEW_SYNC_SYNC_SEQ_MASK_1_MASK (0xffff << 0)
> +#define SENINF1_CSI2_DESKEW_SYNC_SYNC_SEQ_PAT_1_SHIFT 16
> +#define SENINF1_CSI2_DESKEW_SYNC_SYNC_SEQ_PAT_1_MASK (0xffff << 16)
> +#define SENINF1_CSI2_DETECT_DBG2                               0x0B28
> +#define SENINF1_CSI2_DETECT_DBG2_DETECT_SYNC_LANE3_ST_SHIFT 0
> +#define SENINF1_CSI2_DETECT_DBG2_DETECT_SYNC_LANE3_ST_MASK (0x1 << 0)
> +#define SENINF1_CSI2_DETECT_DBG2_DETECT_ESCAPE_LANE3_ST_SHIFT 1
> +#define SENINF1_CSI2_DETECT_DBG2_DETECT_ESCAPE_LANE3_ST_MASK (0x1 << 1)
> +#define SENINF1_CSI2_DETECT_DBG2_DETECT_POST_LANE3_ST_SHIFT 2
> +#define SENINF1_CSI2_DETECT_DBG2_DETECT_POST_LANE3_ST_MASK (0x1 << 2)
> +#define SENINF1_CSI2_DETECT_DBG2_POSITION_SYNC_LANE3_ST_SHIFT 3
> +#define SENINF1_CSI2_DETECT_DBG2_POSITION_SYNC_LANE3_ST_MASK (0xf << 3)
> +#define SENINF1_CSI2_DETECT_DBG2_POSITION_ESCAPE_LANE3_ST_SHIFT 7
> +#define SENINF1_CSI2_DETECT_DBG2_POSITION_ESCAPE_LANE3_ST_MASK (0xf << 7)
> +#define SENINF1_FIX_ADDR_CPHY3_DBG0                            0x0B30
> +#define SENINF1_FIX_ADDR_CPHY3_DBG0_WORD_COUNT_CPHY3_DBG0_SHIFT 0
> +#define SENINF1_FIX_ADDR_CPHY3_DBG0_WORD_COUNT_CPHY3_DBG0_MASK \
> +(0xffffffff << 0)
> +#define SENINF1_FIX_ADDR_CPHY3_DBG1                            0x0B34
> +#define SENINF1_FIX_ADDR_CPHY3_DBG1_WORD_COUNT_CPHY3_DBG1_SHIFT 0
> +#define SENINF1_FIX_ADDR_CPHY3_DBG1_WORD_COUNT_CPHY3_DBG1_MASK \
> +(0xffff << 0)
> +#define SENINF1_FIX_ADDR_CPHY3_DBG1_ERROR_RECORD_CPHY3_DBG0_SHIFT 16
> +#define SENINF1_FIX_ADDR_CPHY3_DBG1_ERROR_RECORD_CPHY3_DBG0_MASK \
> +(0xffff << 16)
> +#define SENINF1_FIX_ADDR_CPHY3_DBG2                            0x0B38
> +#define SENINF1_FIX_ADDR_CPHY3_DBG2_ERROR_RECORD_CPHY3_DBG1_SHIFT 0
> +#define SENINF1_FIX_ADDR_CPHY3_DBG2_ERROR_RECORD_CPHY3_DBG1_MASK \
> +(0xffffffff << 0)
> +#define SENINF1_CSI2_DI_EXT_2                                  0x0B3C
> +#define SENINF1_CSI2_DI_EXT_2_VC6_SHIFT        0
> +#define SENINF1_CSI2_DI_EXT_2_VC6_MASK         (0x3 << 0)
> +#define SENINF1_CSI2_DI_EXT_2_DT6_SHIFT        2
> +#define SENINF1_CSI2_DI_EXT_2_DT6_MASK         (0x3f << 2)
> +#define SENINF1_CSI2_DI_EXT_2_VC7_SHIFT        8
> +#define SENINF1_CSI2_DI_EXT_2_VC7_MASK         (0x3 << 8)
> +#define SENINF1_CSI2_DI_EXT_2_DT7_SHIFT        10
> +#define SENINF1_CSI2_DI_EXT_2_DT7_MASK         (0x3f << 10)
> +#define SENINF1_CSI2_DI_CTRL_EXT_2                             0x0B40
> +#define SENINF1_CSI2_DI_CTRL_EXT_2_VC6_INTERLEAVING_SHIFT 0
> +#define SENINF1_CSI2_DI_CTRL_EXT_2_VC6_INTERLEAVING_MASK (0x1 << 0)
> +#define SENINF1_CSI2_DI_CTRL_EXT_2_DT6_INTERLEAVING_SHIFT 1
> +#define SENINF1_CSI2_DI_CTRL_EXT_2_DT6_INTERLEAVING_MASK (0x3 << 1)
> +#define SENINF1_CSI2_DI_CTRL_EXT_2_VC7_INTERLEAVING_SHIFT 8
> +#define SENINF1_CSI2_DI_CTRL_EXT_2_VC7_INTERLEAVING_MASK (0x1 << 8)
> +#define SENINF1_CSI2_DI_CTRL_EXT_2_DT7_INTERLEAVING_SHIFT 9
> +#define SENINF1_CSI2_DI_CTRL_EXT_2_DT7_INTERLEAVING_MASK (0x3 << 9)
> +#define SENINF1_WIRE_STATE_DECODE_CPHY3_DBG0                   0x0B44
> +#define SENINF1_WIRE_STATE_DECODE_CPHY3_DBG0_SYMBOL_STREAM0_CPHY3_SHIFT 0
> +#define SENINF1_WIRE_STATE_DECODE_CPHY3_DBG0_SYMBOL_STREAM0_CPHY3_MASK \
> +(0xffffffff << 0)
> +#define SENINF1_WIRE_STATE_DECODE_CPHY3_DBG1                   0x0B48
> +#define SENINF1_WIRE_STATE_DECODE_CPHY3_DBG1_SYMBOL_STREAM1_CPHY3_SHIFT 0
> +#define SENINF1_WIRE_STATE_DECODE_CPHY3_DBG1_SYMBOL_STREAM1_CPHY3_MASK \
> +(0x3ff << 0)
> +#define SENINF1_WIRE_STATE_DECODE_CPHY3_DBG1_SYMBOL_STREAM_VALID_CPHY3_SHIFT 10
> +#define SENINF1_WIRE_STATE_DECODE_CPHY3_DBG1_SYMBOL_STREAM_VALID_CPHY3_MASK \
> +(0x1 << 10)
> +#define SENINF1_MUX_CTRL                                       0x0D00
> +#define SENINF1_MUX_CTRL_SENINF_MUX_SW_RST_SHIFT 0
> +#define SENINF1_MUX_CTRL_SENINF_MUX_SW_RST_MASK (0x1 << 0)
> +#define SENINF1_MUX_CTRL_SENINF_IRQ_SW_RST_SHIFT 1
> +#define SENINF1_MUX_CTRL_SENINF_IRQ_SW_RST_MASK (0x1 << 1)
> +#define SENINF1_MUX_CTRL_SENINF_MUX_RDY_MODE_SHIFT 4
> +#define SENINF1_MUX_CTRL_SENINF_MUX_RDY_MODE_MASK (0x1 << 4)
> +#define SENINF1_MUX_CTRL_SENINF_MUX_RDY_VALUE_SHIFT 5
> +#define SENINF1_MUX_CTRL_SENINF_MUX_RDY_VALUE_MASK (0x1 << 5)
> +#define SENINF1_MUX_CTRL_SENINF_HSYNC_MASK_SHIFT 7
> +#define SENINF1_MUX_CTRL_SENINF_HSYNC_MASK_MASK (0x1 << 7)
> +#define SENINF1_MUX_CTRL_SENINF_PIX_SEL_SHIFT  8
> +#define SENINF1_MUX_CTRL_SENINF_PIX_SEL_MASK   (0x1 << 8)
> +#define SENINF1_MUX_CTRL_SENINF_VSYNC_POL_SHIFT 9
> +#define SENINF1_MUX_CTRL_SENINF_VSYNC_POL_MASK (0x1 << 9)
> +#define SENINF1_MUX_CTRL_SENINF_HSYNC_POL_SHIFT 10
> +#define SENINF1_MUX_CTRL_SENINF_HSYNC_POL_MASK (0x1 << 10)
> +#define SENINF1_MUX_CTRL_OVERRUN_RST_EN_SHIFT  11
> +#define SENINF1_MUX_CTRL_OVERRUN_RST_EN_MASK   (0x1 << 11)
> +#define SENINF1_MUX_CTRL_SENINF_SRC_SEL_SHIFT  12
> +#define SENINF1_MUX_CTRL_SENINF_SRC_SEL_MASK   (0xf << 12)
> +#define SENINF1_MUX_CTRL_FIFO_PUSH_EN_SHIFT    16
> +#define SENINF1_MUX_CTRL_FIFO_PUSH_EN_MASK     (0x3f << 16)
> +#define SENINF1_MUX_CTRL_FIFO_FLUSH_EN_SHIFT   22
> +#define SENINF1_MUX_CTRL_FIFO_FLUSH_EN_MASK    (0x3f << 22)
> +#define SENINF1_MUX_CTRL_FIFO_FULL_WR_EN_SHIFT 28
> +#define SENINF1_MUX_CTRL_FIFO_FULL_WR_EN_MASK  (0x3 << 28)
> +#define SENINF1_MUX_CTRL_CROP_EN_SHIFT         30
> +#define SENINF1_MUX_CTRL_CROP_EN_MASK          (0x1 << 30)
> +#define SENINF1_MUX_CTRL_SENINF_MUX_EN_SHIFT   31
> +#define SENINF1_MUX_CTRL_SENINF_MUX_EN_MASK    (0x1 << 31)
> +#define SENINF1_MUX_INTEN                                      0x0D04
> +#define SENINF1_MUX_INTEN_SENINF_OVERRUN_IRQ_EN_SHIFT 0
> +#define SENINF1_MUX_INTEN_SENINF_OVERRUN_IRQ_EN_MASK (0x1 << 0)
> +#define SENINF1_MUX_INTEN_SENINF_CRCERR_IRQ_EN_SHIFT 1
> +#define SENINF1_MUX_INTEN_SENINF_CRCERR_IRQ_EN_MASK (0x1 << 1)
> +#define SENINF1_MUX_INTEN_SENINF_FSMERR_IRQ_EN_SHIFT 2
> +#define SENINF1_MUX_INTEN_SENINF_FSMERR_IRQ_EN_MASK (0x1 << 2)
> +#define SENINF1_MUX_INTEN_SENINF_VSIZEERR_IRQ_EN_SHIFT 3
> +#define SENINF1_MUX_INTEN_SENINF_VSIZEERR_IRQ_EN_MASK (0x1 << 3)
> +#define SENINF1_MUX_INTEN_SENINF_HSIZEERR_IRQ_EN_SHIFT 4
> +#define SENINF1_MUX_INTEN_SENINF_HSIZEERR_IRQ_EN_MASK (0x1 << 4)
> +#define SENINF1_MUX_INTEN_SENINF_SENSOR_VSIZEERR_IRQ_EN_SHIFT 5
> +#define SENINF1_MUX_INTEN_SENINF_SENSOR_VSIZEERR_IRQ_EN_MASK (0x1 << 5)
> +#define SENINF1_MUX_INTEN_SENINF_SENSOR_HSIZEERR_IRQ_EN_SHIFT 6
> +#define SENINF1_MUX_INTEN_SENINF_SENSOR_HSIZEERR_IRQ_EN_MASK (0x1 << 6)
> +#define SENINF1_MUX_INTEN_SENINF_IRQ_CLR_SEL_SHIFT 31
> +#define SENINF1_MUX_INTEN_SENINF_IRQ_CLR_SEL_MASK (0x1 << 31)
> +#define SENINF1_MUX_INTSTA                                     0x0D08
> +#define SENINF1_MUX_INTSTA_SENINF_OVERRUN_IRQ_STA_SHIFT 0
> +#define SENINF1_MUX_INTSTA_SENINF_OVERRUN_IRQ_STA_MASK (0x1 << 0)
> +#define SENINF1_MUX_INTSTA_SENINF_CRCERR_IRQ_STA_SHIFT 1
> +#define SENINF1_MUX_INTSTA_SENINF_CRCERR_IRQ_STA_MASK (0x1 << 1)
> +#define SENINF1_MUX_INTSTA_SENINF_FSMERR_IRQ_STA_SHIFT 2
> +#define SENINF1_MUX_INTSTA_SENINF_FSMERR_IRQ_STA_MASK (0x1 << 2)
> +#define SENINF1_MUX_INTSTA_SENINF_VSIZEERR_IRQ_STA_SHIFT 3
> +#define SENINF1_MUX_INTSTA_SENINF_VSIZEERR_IRQ_STA_MASK (0x1 << 3)
> +#define SENINF1_MUX_INTSTA_SENINF_HSIZEERR_IRQ_STA_SHIFT 4
> +#define SENINF1_MUX_INTSTA_SENINF_HSIZEERR_IRQ_STA_MASK (0x1 << 4)
> +#define SENINF1_MUX_INTSTA_SENINF_SENSOR_VSIZEERR_IRQ_STA_SHIFT 5
> +#define SENINF1_MUX_INTSTA_SENINF_SENSOR_VSIZEERR_IRQ_STA_MASK (0x1 << 5)
> +#define SENINF1_MUX_INTSTA_SENINF_SENSOR_HSIZEERR_IRQ_STA_SHIFT 6
> +#define SENINF1_MUX_INTSTA_SENINF_SENSOR_HSIZEERR_IRQ_STA_MASK (0x1 << 6)
> +#define SENINF1_MUX_SIZE                                       0x0D0C
> +#define SENINF1_MUX_SIZE_SENINF_VSIZE_SHIFT    0
> +#define SENINF1_MUX_SIZE_SENINF_VSIZE_MASK     (0xffff << 0)
> +#define SENINF1_MUX_SIZE_SENINF_HSIZE_SHIFT    16
> +#define SENINF1_MUX_SIZE_SENINF_HSIZE_MASK     (0xffff << 16)
> +#define SENINF1_MUX_DEBUG_1                                    0x0D10
> +#define SENINF1_MUX_DEBUG_1_DEBUG_INFO_SHIFT   0
> +#define SENINF1_MUX_DEBUG_1_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF1_MUX_DEBUG_2                                    0x0D14
> +#define SENINF1_MUX_DEBUG_2_DEBUG_INFO_SHIFT   0
> +#define SENINF1_MUX_DEBUG_2_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF1_MUX_DEBUG_3                                    0x0D18
> +#define SENINF1_MUX_DEBUG_3_DEBUG_INFO_SHIFT   0
> +#define SENINF1_MUX_DEBUG_3_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF1_MUX_DEBUG_4                                    0x0D1C
> +#define SENINF1_MUX_DEBUG_4_DEBUG_INFO_SHIFT   0
> +#define SENINF1_MUX_DEBUG_4_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF1_MUX_DEBUG_5                                    0x0D20
> +#define SENINF1_MUX_DEBUG_5_DEBUG_INFO_SHIFT   0
> +#define SENINF1_MUX_DEBUG_5_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF1_MUX_DEBUG_6                                    0x0D24
> +#define SENINF1_MUX_DEBUG_6_DEBUG_INFO_SHIFT   0
> +#define SENINF1_MUX_DEBUG_6_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF1_MUX_DEBUG_7                                    0x0D28
> +#define SENINF1_MUX_DEBUG_7_DEBUG_INFO_SHIFT   0
> +#define SENINF1_MUX_DEBUG_7_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF1_MUX_SPARE                                      0x0D2C
> +#define SENINF1_MUX_SPARE_SENINF_CRC_SEL_SHIFT 9
> +#define SENINF1_MUX_SPARE_SENINF_CRC_SEL_MASK  (0x3 << 9)
> +#define SENINF1_MUX_SPARE_SENINF_VCNT_SEL_SHIFT 11
> +#define SENINF1_MUX_SPARE_SENINF_VCNT_SEL_MASK (0x3 << 11)
> +#define SENINF1_MUX_SPARE_SENINF_FIFO_FULL_SEL_SHIFT 13
> +#define SENINF1_MUX_SPARE_SENINF_FIFO_FULL_SEL_MASK (0x1 << 13)
> +#define SENINF1_MUX_SPARE_SENINF_SPARE_SHIFT   14
> +#define SENINF1_MUX_SPARE_SENINF_SPARE_MASK    (0x3f << 14)
> +#define SENINF1_MUX_DATA                                       0x0D30
> +#define SENINF1_MUX_DATA_SENINF_DATA0_SHIFT    0
> +#define SENINF1_MUX_DATA_SENINF_DATA0_MASK     (0xffff << 0)
> +#define SENINF1_MUX_DATA_SENINF_DATA1_SHIFT    16
> +#define SENINF1_MUX_DATA_SENINF_DATA1_MASK     (0xffff << 16)
> +#define SENINF1_MUX_DATA_CNT                                   0x0D34
> +#define SENINF1_MUX_DATA_CNT_SENINF_DATA_CNT_SHIFT 0
> +#define SENINF1_MUX_DATA_CNT_SENINF_DATA_CNT_MASK (0xffffffff << 0)
> +#define SENINF1_MUX_CROP                                       0x0D38
> +#define SENINF1_MUX_CROP_SENINF_CROP_X1_SHIFT  0
> +#define SENINF1_MUX_CROP_SENINF_CROP_X1_MASK   (0xffff << 0)
> +#define SENINF1_MUX_CROP_SENINF_CROP_X2_SHIFT  16
> +#define SENINF1_MUX_CROP_SENINF_CROP_X2_MASK   (0xffff << 16)
> +#define SENINF1_MUX_CTRL_EXT                                   0x0D3C
> +#define SENINF1_MUX_CTRL_EXT_SENINF_SRC_SEL_EXT_SHIFT 0
> +#define SENINF1_MUX_CTRL_EXT_SENINF_SRC_SEL_EXT_MASK (0x3 << 0)
> +#define SENINF1_MUX_CTRL_EXT_SENINF_PIX_SEL_EXT_SHIFT 4
> +#define SENINF1_MUX_CTRL_EXT_SENINF_PIX_SEL_EXT_MASK (0x1 << 4)
> +#define SENINF_N3D_B_CTL                                       0x1100
> +#define SENINF_N3D_B_CTL_MODE_SHIFT            0
> +#define SENINF_N3D_B_CTL_MODE_MASK             (0x3 << 0)
> +#define SENINF_N3D_B_CTL_I2C1_EN_SHIFT         2
> +#define SENINF_N3D_B_CTL_I2C1_EN_MASK          (0x1 << 2)
> +#define SENINF_N3D_B_CTL_I2C2_EN_SHIFT         3
> +#define SENINF_N3D_B_CTL_I2C2_EN_MASK          (0x1 << 3)
> +#define SENINF_N3D_B_CTL_I2C1_INT_EN_SHIFT     4
> +#define SENINF_N3D_B_CTL_I2C1_INT_EN_MASK      (0x1 << 4)
> +#define SENINF_N3D_B_CTL_I2C2_INT_EN_SHIFT     5
> +#define SENINF_N3D_B_CTL_I2C2_INT_EN_MASK      (0x1 << 5)
> +#define SENINF_N3D_B_CTL_N3D_EN_SHIFT          6
> +#define SENINF_N3D_B_CTL_N3D_EN_MASK           (0x1 << 6)
> +#define SENINF_N3D_B_CTL_W1CLR_SHIFT           7
> +#define SENINF_N3D_B_CTL_W1CLR_MASK            (0x1 << 7)
> +#define SENINF_N3D_B_CTL_DIFF_EN_SHIFT         8
> +#define SENINF_N3D_B_CTL_DIFF_EN_MASK          (0x1 << 8)
> +#define SENINF_N3D_B_CTL_DDBG_SEL_SHIFT        9
> +#define SENINF_N3D_B_CTL_DDBG_SEL_MASK         (0x7 << 9)
> +#define SENINF_N3D_B_CTL_MODE1_DBG_SHIFT       12
> +#define SENINF_N3D_B_CTL_MODE1_DBG_MASK        (0x1 << 12)
> +#define SENINF_N3D_B_CTL_SEN1_TIM_EN_SHIFT     16
> +#define SENINF_N3D_B_CTL_SEN1_TIM_EN_MASK      (0x1 << 16)
> +#define SENINF_N3D_B_CTL_SEN2_TIM_EN_SHIFT     17
> +#define SENINF_N3D_B_CTL_SEN2_TIM_EN_MASK      (0x1 << 17)
> +#define SENINF_N3D_B_CTL_SEN1_OV_VS_INT_EN_SHIFT 18
> +#define SENINF_N3D_B_CTL_SEN1_OV_VS_INT_EN_MASK (0x1 << 18)
> +#define SENINF_N3D_B_CTL_SEN2_OV_VS_INT_EN_SHIFT 19
> +#define SENINF_N3D_B_CTL_SEN2_OV_VS_INT_EN_MASK (0x1 << 19)
> +#define SENINF_N3D_B_CTL_HW_SYNC_MODE_SHIFT    20
> +#define SENINF_N3D_B_CTL_HW_SYNC_MODE_MASK     (0x1 << 20)
> +#define SENINF_N3D_B_CTL_VALID_TG_EN_SHIFT     21
> +#define SENINF_N3D_B_CTL_VALID_TG_EN_MASK      (0x1 << 21)
> +#define SENINF_N3D_B_CTL_SYNC_PIN_A_EN_SHIFT   22
> +#define SENINF_N3D_B_CTL_SYNC_PIN_A_EN_MASK    (0x1 << 22)
> +#define SENINF_N3D_B_CTL_SYNC_PIN_A_POLARITY_SHIFT 23
> +#define SENINF_N3D_B_CTL_SYNC_PIN_A_POLARITY_MASK (0x1 << 23)
> +#define SENINF_N3D_B_CTL_SYNC_PIN_B_EN_SHIFT   24
> +#define SENINF_N3D_B_CTL_SYNC_PIN_B_EN_MASK    (0x1 << 24)
> +#define SENINF_N3D_B_CTL_SYNC_PIN_B_POLARITY_SHIFT 25
> +#define SENINF_N3D_B_CTL_SYNC_PIN_B_POLARITY_MASK (0x1 << 25)
> +#define SENINF_N3D_B_POS                                       0x1104
> +#define SENINF_N3D_B_POS_N3D_POS_SHIFT         0
> +#define SENINF_N3D_B_POS_N3D_POS_MASK          (0xffffffff << 0)
> +#define SENINF_N3D_B_TRIG                                      0x1108
> +#define SENINF_N3D_B_TRIG_I2CA_TRIG_SHIFT      0
> +#define SENINF_N3D_B_TRIG_I2CA_TRIG_MASK       (0x1 << 0)
> +#define SENINF_N3D_B_TRIG_I2CB_TRIG_SHIFT      1
> +#define SENINF_N3D_B_TRIG_I2CB_TRIG_MASK       (0x1 << 1)
> +#define SENINF_N3D_B_INT                                       0x110C
> +#define SENINF_N3D_B_INT_I2C1_INT_SHIFT        0
> +#define SENINF_N3D_B_INT_I2C1_INT_MASK         (0x1 << 0)
> +#define SENINF_N3D_B_INT_I2C2_INT_SHIFT        1
> +#define SENINF_N3D_B_INT_I2C2_INT_MASK         (0x1 << 1)
> +#define SENINF_N3D_B_INT_DIFF_INT_SHIFT        2
> +#define SENINF_N3D_B_INT_DIFF_INT_MASK         (0x1 << 2)
> +#define SENINF_N3D_B_INT_SEN1_OV_VS_INT_SHIFT  4
> +#define SENINF_N3D_B_INT_SEN1_OV_VS_INT_MASK   (0x1 << 4)
> +#define SENINF_N3D_B_INT_SEN2_OV_VS_INT_SHIFT  5
> +#define SENINF_N3D_B_INT_SEN2_OV_VS_INT_MASK   (0x1 << 5)
> +#define SENINF_N3D_B_CNT0                                      0x1110
> +#define SENINF_N3D_B_CNT0_N3D_CNT0_SHIFT       0
> +#define SENINF_N3D_B_CNT0_N3D_CNT0_MASK        (0xffffffff << 0)
> +#define SENINF_N3D_B_CNT1                                      0x1114
> +#define SENINF_N3D_B_CNT1_N3D_CNT1_SHIFT       0
> +#define SENINF_N3D_B_CNT1_N3D_CNT1_MASK        (0xffffffff << 0)
> +#define SENINF_N3D_B_DBG                                       0x1118
> +#define SENINF_N3D_B_DBG_N3D_DBG_SHIFT         0
> +#define SENINF_N3D_B_DBG_N3D_DBG_MASK          (0xffffffff << 0)
> +#define SENINF_N3D_B_DIFF_THR                                  0x111C
> +#define SENINF_N3D_B_DIFF_THR_N3D_DIFF_THR_SHIFT 0
> +#define SENINF_N3D_B_DIFF_THR_N3D_DIFF_THR_MASK (0xffffffff << 0)
> +#define SENINF_N3D_B_DIFF_CNT                                  0x1120
> +#define SENINF_N3D_B_DIFF_CNT_N3D_DIFF_CNT_SHIFT 0
> +#define SENINF_N3D_B_DIFF_CNT_N3D_DIFF_CNT_MASK (0xffffffff << 0)
> +#define SENINF_N3D_B_DBG_1                                     0x1124
> +#define SENINF_N3D_B_DBG_1_N3D_DBG_1_SHIFT     0
> +#define SENINF_N3D_B_DBG_1_N3D_DBG_1_MASK      (0xffffffff << 0)
> +#define SENINF_N3D_B_VALID_TG_CNT                              0x1128
> +#define SENINF_N3D_B_VALID_TG_CNT_N3D_VALID_TG_CNT_SHIFT 0
> +#define SENINF_N3D_B_VALID_TG_CNT_N3D_VALID_TG_CNT_MASK (0xffffffff << 0)
> +#define SENINF_N3D_B_SYNC_A_PERIOD                             0x112C
> +#define SENINF_N3D_B_SYNC_A_PERIOD_N3D_SYNC_A_PERIOD_SHIFT 0
> +#define SENINF_N3D_B_SYNC_A_PERIOD_N3D_SYNC_A_PERIOD_MASK (0xffffffff << 0)
> +#define SENINF_N3D_B_SYNC_B_PERIOD                             0x1130
> +#define SENINF_N3D_B_SYNC_B_PERIOD_N3D_SYNC_B_PERIOD_SHIFT 0
> +#define SENINF_N3D_B_SYNC_B_PERIOD_N3D_SYNC_B_PERIOD_MASK (0xffffffff << 0)
> +#define SENINF_N3D_B_SYNC_A_PULSE_LEN                          0x1134
> +#define SENINF_N3D_B_SYNC_A_PULSE_LEN_N3D_SYNC_A_PULSE_LEN_SHIFT 0
> +#define SENINF_N3D_B_SYNC_A_PULSE_LEN_N3D_SYNC_A_PULSE_LEN_MASK \
> +(0xffffffff << 0)
> +#define SENINF_N3D_B_SYNC_B_PULSE_LEN                          0x1138
> +#define SENINF_N3D_B_SYNC_B_PULSE_LEN_N3D_SYNC_B_PULSE_LEN_SHIFT 0
> +#define SENINF_N3D_B_SYNC_B_PULSE_LEN_N3D_SYNC_B_PULSE_LEN_MASK \
> +(0xffffffff << 0)
> +#define SENINF_N3D_B_SUB_CNT                                   0x113C
> +#define SENINF_N3D_B_SUB_CNT_VS1_SUB_CNT_SHIFT 0
> +#define SENINF_N3D_B_SUB_CNT_VS1_SUB_CNT_MASK  (0x3f << 0)
> +#define SENINF_N3D_B_SUB_CNT_VS1_SUB_CNT_EN_SHIFT 6
> +#define SENINF_N3D_B_SUB_CNT_VS1_SUB_CNT_EN_MASK (0x1 << 6)
> +#define SENINF_N3D_B_SUB_CNT_SYNC_PIN_A_RESET_SEL_SHIFT 7
> +#define SENINF_N3D_B_SUB_CNT_SYNC_PIN_A_RESET_SEL_MASK (0x1 << 7)
> +#define SENINF_N3D_B_SUB_CNT_SYNC_PIN_B_RESET_SEL_SHIFT 8
> +#define SENINF_N3D_B_SUB_CNT_SYNC_PIN_B_RESET_SEL_MASK (0x1 << 8)
> +#define SENINF_N3D_B_SUB_CNT_SYNC_PIN_A_RESET_SEL_EN_SHIFT 9
> +#define SENINF_N3D_B_SUB_CNT_SYNC_PIN_A_RESET_SEL_EN_MASK (0x1 << 9)
> +#define SENINF_N3D_B_SUB_CNT_SYNC_PIN_B_RESET_SEL_EN_SHIFT 10
> +#define SENINF_N3D_B_SUB_CNT_SYNC_PIN_B_RESET_SEL_EN_MASK (0x1 << 10)
> +#define SENINF_N3D_B_SUB_CNT_VS2_SUB_CNT_SHIFT 16
> +#define SENINF_N3D_B_SUB_CNT_VS2_SUB_CNT_MASK  (0x3f << 16)
> +#define SENINF_N3D_B_SUB_CNT_VS2_SUB_CNT_EN_SHIFT 22
> +#define SENINF_N3D_B_SUB_CNT_VS2_SUB_CNT_EN_MASK (0x1 << 22)
> +#define SENINF_N3D_B_VSYNC_CNT                                 0x1140
> +#define SENINF_N3D_B_VSYNC_CNT_N3D_VSYNC_1_CNT_SHIFT 0
> +#define SENINF_N3D_B_VSYNC_CNT_N3D_VSYNC_1_CNT_MASK (0xffff << 0)
> +#define SENINF2_CTRL                                           0x1200
> +#define SENINF2_CTRL_SENINF_EN_SHIFT           0
> +#define SENINF2_CTRL_SENINF_EN_MASK            (0x1 << 0)
> +#define SENINF2_CTRL_NCSI2_SW_RST_SHIFT        1
> +#define SENINF2_CTRL_NCSI2_SW_RST_MASK         (0x1 << 1)
> +#define SENINF2_CTRL_OCSI2_SW_RST_SHIFT        2
> +#define SENINF2_CTRL_OCSI2_SW_RST_MASK         (0x1 << 2)
> +#define SENINF2_CTRL_CCIR_SW_RST_SHIFT         3
> +#define SENINF2_CTRL_CCIR_SW_RST_MASK          (0x1 << 3)
> +#define SENINF2_CTRL_CKGEN_SW_RST_SHIFT        4
> +#define SENINF2_CTRL_CKGEN_SW_RST_MASK         (0x1 << 4)
> +#define SENINF2_CTRL_TEST_MODEL_SW_RST_SHIFT   5
> +#define SENINF2_CTRL_TEST_MODEL_SW_RST_MASK    (0x1 << 5)
> +#define SENINF2_CTRL_SCAM_SW_RST_SHIFT         6
> +#define SENINF2_CTRL_SCAM_SW_RST_MASK          (0x1 << 6)
> +#define SENINF2_CTRL_CSI2_SW_RST_SHIFT         7
> +#define SENINF2_CTRL_CSI2_SW_RST_MASK          (0x1 << 7)
> +#define SENINF2_CTRL_CSI3_SW_RST_SHIFT         8
> +#define SENINF2_CTRL_CSI3_SW_RST_MASK          (0x1 << 8)
> +#define SENINF2_CTRL_SENINF_SRC_SEL_SHIFT      12
> +#define SENINF2_CTRL_SENINF_SRC_SEL_MASK       (0xf << 12)
> +#define SENINF2_CTRL_SENINF_DEBUG_SEL_SHIFT    20
> +#define SENINF2_CTRL_SENINF_DEBUG_SEL_MASK     (0xf << 20)
> +#define SENINF2_CTRL_PAD2CAM_DATA_SEL_SHIFT    28
> +#define SENINF2_CTRL_PAD2CAM_DATA_SEL_MASK     (0x7 << 28)
> +#define SENINF2_CTRL_EXT                                       0x1204
> +#define SENINF2_CTRL_EXT_SENINF_OCSI2_IP_EN_SHIFT 0
> +#define SENINF2_CTRL_EXT_SENINF_OCSI2_IP_EN_MASK (0x1 << 0)
> +#define SENINF2_CTRL_EXT_SENINF_TESTMDL_IP_EN_SHIFT 1
> +#define SENINF2_CTRL_EXT_SENINF_TESTMDL_IP_EN_MASK (0x1 << 1)
> +#define SENINF2_CTRL_EXT_SENINF_SCAM_IP_EN_SHIFT 4
> +#define SENINF2_CTRL_EXT_SENINF_SCAM_IP_EN_MASK (0x1 << 4)
> +#define SENINF2_CTRL_EXT_SENINF_NCSI2_IP_EN_SHIFT 5
> +#define SENINF2_CTRL_EXT_SENINF_NCSI2_IP_EN_MASK (0x1 << 5)
> +#define SENINF2_CTRL_EXT_SENINF_CSI2_IP_EN_SHIFT 6
> +#define SENINF2_CTRL_EXT_SENINF_CSI2_IP_EN_MASK (0x1 << 6)
> +#define SENINF2_CTRL_EXT_SENINF_CSI3_IP_EN_SHIFT 7
> +#define SENINF2_CTRL_EXT_SENINF_CSI3_IP_EN_MASK (0x1 << 7)
> +#define SENINF2_CTRL_EXT_SENINF_SRC_SEL_EXT_SHIFT 16
> +#define SENINF2_CTRL_EXT_SENINF_SRC_SEL_EXT_MASK (0x3 << 16)
> +#define SENINF2_ASYNC_CTRL                                     0x1208
> +#define SENINF2_ASYNC_CTRL_SENINF_ASYNC_FIFO_RST_SHIFT 0
> +#define SENINF2_ASYNC_CTRL_SENINF_ASYNC_FIFO_RST_MASK (0x1 << 0)
> +#define SENINF2_ASYNC_CTRL_SENINF_HSYNC_MASK_SHIFT 1
> +#define SENINF2_ASYNC_CTRL_SENINF_HSYNC_MASK_MASK (0x1 << 1)
> +#define SENINF2_ASYNC_CTRL_SENINF_VSYNC_POL_SHIFT 2
> +#define SENINF2_ASYNC_CTRL_SENINF_VSYNC_POL_MASK (0x1 << 2)
> +#define SENINF2_ASYNC_CTRL_SENINF_HSYNC_POL_SHIFT 3
> +#define SENINF2_ASYNC_CTRL_SENINF_HSYNC_POL_MASK (0x1 << 3)
> +#define SENINF2_ASYNC_CTRL_FIFO_PUSH_EN_SHIFT  16
> +#define SENINF2_ASYNC_CTRL_FIFO_PUSH_EN_MASK   (0x3f << 16)
> +#define SENINF2_ASYNC_CTRL_FIFO_FLUSH_EN_SHIFT 24
> +#define SENINF2_ASYNC_CTRL_FIFO_FLUSH_EN_MASK  (0x3f << 24)
> +#define SENINF_TG2_PH_CNT                                      0x1600
> +#define SENINF_TG2_PH_CNT_TGCLK_SEL_SHIFT      0
> +#define SENINF_TG2_PH_CNT_TGCLK_SEL_MASK       (0x3 << 0)
> +#define SENINF_TG2_PH_CNT_CLKFL_POL_SHIFT      2
> +#define SENINF_TG2_PH_CNT_CLKFL_POL_MASK       (0x1 << 2)
> +#define SENINF_TG2_PH_CNT_EXT_RST_SHIFT        4
> +#define SENINF_TG2_PH_CNT_EXT_RST_MASK         (0x1 << 4)
> +#define SENINF_TG2_PH_CNT_EXT_PWRDN_SHIFT      5
> +#define SENINF_TG2_PH_CNT_EXT_PWRDN_MASK       (0x1 << 5)
> +#define SENINF_TG2_PH_CNT_PAD_PCLK_INV_SHIFT   6
> +#define SENINF_TG2_PH_CNT_PAD_PCLK_INV_MASK    (0x1 << 6)
> +#define SENINF_TG2_PH_CNT_CAM_PCLK_INV_SHIFT   7
> +#define SENINF_TG2_PH_CNT_CAM_PCLK_INV_MASK    (0x1 << 7)
> +#define SENINF_TG2_PH_CNT_CLKPOL_SHIFT         28
> +#define SENINF_TG2_PH_CNT_CLKPOL_MASK          (0x1 << 28)
> +#define SENINF_TG2_PH_CNT_ADCLK_EN_SHIFT       29
> +#define SENINF_TG2_PH_CNT_ADCLK_EN_MASK        (0x1 << 29)
> +#define SENINF_TG2_PH_CNT_PCEN_SHIFT           31
> +#define SENINF_TG2_PH_CNT_PCEN_MASK            (0x1 << 31)
> +#define SENINF_TG2_SEN_CK                                      0x1604
> +#define SENINF_TG2_SEN_CK_CLKFL_SHIFT          0
> +#define SENINF_TG2_SEN_CK_CLKFL_MASK           (0x3f << 0)
> +#define SENINF_TG2_SEN_CK_CLKRS_SHIFT          8
> +#define SENINF_TG2_SEN_CK_CLKRS_MASK           (0x3f << 8)
> +#define SENINF_TG2_SEN_CK_CLKCNT_SHIFT         16
> +#define SENINF_TG2_SEN_CK_CLKCNT_MASK          (0x3f << 16)
> +#define SENINF_TG2_TM_CTL                                      0x1608
> +#define SENINF_TG2_TM_CTL_TM_EN_SHIFT          0
> +#define SENINF_TG2_TM_CTL_TM_EN_MASK           (0x1 << 0)
> +#define SENINF_TG2_TM_CTL_TM_RST_SHIFT         1
> +#define SENINF_TG2_TM_CTL_TM_RST_MASK          (0x1 << 1)
> +#define SENINF_TG2_TM_CTL_TM_FMT_SHIFT         2
> +#define SENINF_TG2_TM_CTL_TM_FMT_MASK          (0x1 << 2)
> +#define SENINF_TG2_TM_CTL_TM_PAT_SHIFT         4
> +#define SENINF_TG2_TM_CTL_TM_PAT_MASK          (0xf << 4)
> +#define SENINF_TG2_TM_CTL_TM_VSYNC_SHIFT       8
> +#define SENINF_TG2_TM_CTL_TM_VSYNC_MASK        (0xff << 8)
> +#define SENINF_TG2_TM_CTL_TM_DUMMYPXL_SHIFT    16
> +#define SENINF_TG2_TM_CTL_TM_DUMMYPXL_MASK     (0xff << 16)
> +#define SENINF_TG2_TM_SIZE                                     0x160C
> +#define SENINF_TG2_TM_SIZE_TM_PXL_SHIFT        0
> +#define SENINF_TG2_TM_SIZE_TM_PXL_MASK         (0x1fff << 0)
> +#define SENINF_TG2_TM_SIZE_TM_LINE_SHIFT       16
> +#define SENINF_TG2_TM_SIZE_TM_LINE_MASK        (0x3fff << 16)
> +#define SENINF_TG2_TM_CLK                                      0x1610
> +#define SENINF_TG2_TM_CLK_TM_CLK_CNT_SHIFT     0
> +#define SENINF_TG2_TM_CLK_TM_CLK_CNT_MASK      (0xf << 0)
> +#define SENINF_TG2_TM_CLK_TM_CLRBAR_OFT_SHIFT  16
> +#define SENINF_TG2_TM_CLK_TM_CLRBAR_OFT_MASK   (0x3ff << 16)
> +#define SENINF_TG2_TM_CLK_TM_CLRBAR_IDX_SHIFT  28
> +#define SENINF_TG2_TM_CLK_TM_CLRBAR_IDX_MASK   (0x7 << 28)
> +#define SENINF_TG2_TM_STP                                      0x1614
> +#define SENINF_TG2_TM_STP_TG1_TM_STP_SHIFT     0
> +#define SENINF_TG2_TM_STP_TG1_TM_STP_MASK      (0xffffffff << 0)
> +#define MIPI_RX_CON24_CSI1                                     0x1824
> +#define MIPI_RX_CON24_CSI1_CSI0_BIST_NUM_SHIFT 0
> +#define MIPI_RX_CON24_CSI1_CSI0_BIST_NUM_MASK  (0x3 << 0)
> +#define MIPI_RX_CON24_CSI1_CSI0_BIST_EN_SHIFT  2
> +#define MIPI_RX_CON24_CSI1_CSI0_BIST_EN_MASK   (0x1 << 2)
> +#define MIPI_RX_CON24_CSI1_CSI0_BIST_FIX_PAT_SHIFT 5
> +#define MIPI_RX_CON24_CSI1_CSI0_BIST_FIX_PAT_MASK (0x1 << 5)
> +#define MIPI_RX_CON24_CSI1_CSI0_BIST_CLK_SEL_SHIFT 6
> +#define MIPI_RX_CON24_CSI1_CSI0_BIST_CLK_SEL_MASK (0x1 << 6)
> +#define MIPI_RX_CON24_CSI1_CSI0_BIST_CLK4X_SEL_SHIFT 7
> +#define MIPI_RX_CON24_CSI1_CSI0_BIST_CLK4X_SEL_MASK (0x1 << 7)
> +#define MIPI_RX_CON24_CSI1_CSI0_BIST_TERM_DELAY_SHIFT 8
> +#define MIPI_RX_CON24_CSI1_CSI0_BIST_TERM_DELAY_MASK (0xff << 8)
> +#define MIPI_RX_CON24_CSI1_CSI0_BIST_SETTLE_DELAY_SHIFT 16
> +#define MIPI_RX_CON24_CSI1_CSI0_BIST_SETTLE_DELAY_MASK (0xff << 16)
> +#define MIPI_RX_CON24_CSI1_CSI0_BIST_LN0_MUX_SHIFT 24
> +#define MIPI_RX_CON24_CSI1_CSI0_BIST_LN0_MUX_MASK (0x3 << 24)
> +#define MIPI_RX_CON24_CSI1_CSI0_BIST_LN1_MUX_SHIFT 26
> +#define MIPI_RX_CON24_CSI1_CSI0_BIST_LN1_MUX_MASK (0x3 << 26)
> +#define MIPI_RX_CON24_CSI1_CSI0_BIST_LN2_MUX_SHIFT 28
> +#define MIPI_RX_CON24_CSI1_CSI0_BIST_LN2_MUX_MASK (0x3 << 28)
> +#define MIPI_RX_CON24_CSI1_CSI0_BIST_LN3_MUX_SHIFT 30
> +#define MIPI_RX_CON24_CSI1_CSI0_BIST_LN3_MUX_MASK (0x3 << 30)
> +#define MIPI_RX_CON28_CSI1                                     0x1828
> +#define MIPI_RX_CON28_CSI1_CSI0_BIST_START_SHIFT 0
> +#define MIPI_RX_CON28_CSI1_CSI0_BIST_START_MASK (0x1 << 0)
> +#define MIPI_RX_CON28_CSI1_CSI0_BIST_DATA_OK_SHIFT 1
> +#define MIPI_RX_CON28_CSI1_CSI0_BIST_DATA_OK_MASK (0x1 << 1)
> +#define MIPI_RX_CON28_CSI1_CSI0_BIST_HS_FSM_OK_SHIFT 2
> +#define MIPI_RX_CON28_CSI1_CSI0_BIST_HS_FSM_OK_MASK (0x1 << 2)
> +#define MIPI_RX_CON28_CSI1_CSI0_BIST_LANE_FSM_OK_SHIFT 3
> +#define MIPI_RX_CON28_CSI1_CSI0_BIST_LANE_FSM_OK_MASK (0x1 << 3)
> +#define MIPI_RX_CON28_CSI1_CSI0_BIST_CSI2_DATA_OK_SHIFT 4
> +#define MIPI_RX_CON28_CSI1_CSI0_BIST_CSI2_DATA_OK_MASK (0x1 << 4)
> +#define MIPI_RX_CON34_CSI1                                     0x1834
> +#define MIPI_RX_CON34_CSI1_BIST_MODE_SHIFT     0
> +#define MIPI_RX_CON34_CSI1_BIST_MODE_MASK      (0x1 << 0)
> +#define MIPI_RX_CON34_CSI1_CSI0_BIST_HSDET_MUX_SHIFT 22
> +#define MIPI_RX_CON34_CSI1_CSI0_BIST_HSDET_MUX_MASK (0x3 << 22)
> +#define MIPI_RX_CON34_CSI1_CSI0_BIST_LN4_MUX_SHIFT 24
> +#define MIPI_RX_CON34_CSI1_CSI0_BIST_LN4_MUX_MASK (0x3 << 24)
> +#define MIPI_RX_CON34_CSI1_CSI0_BIST_LN5_MUX_SHIFT 26
> +#define MIPI_RX_CON34_CSI1_CSI0_BIST_LN5_MUX_MASK (0x3 << 26)
> +#define MIPI_RX_CON34_CSI1_CSI0_BIST_LN6_MUX_SHIFT 28
> +#define MIPI_RX_CON34_CSI1_CSI0_BIST_LN6_MUX_MASK (0x3 << 28)
> +#define MIPI_RX_CON34_CSI1_CSI0_BIST_LN7_MUX_SHIFT 30
> +#define MIPI_RX_CON34_CSI1_CSI0_BIST_LN7_MUX_MASK (0x3 << 30)
> +#define MIPI_RX_CON38_CSI1                                     0x1838
> +#define MIPI_RX_CON38_CSI1_MIPI_RX_SW_CTRL_MODE_SHIFT 0
> +#define MIPI_RX_CON38_CSI1_MIPI_RX_SW_CTRL_MODE_MASK (0x1 << 0)
> +#define MIPI_RX_CON38_CSI1_MIPI_RX_SW_CAL_MODE_SHIFT 1
> +#define MIPI_RX_CON38_CSI1_MIPI_RX_SW_CAL_MODE_MASK (0x1 << 1)
> +#define MIPI_RX_CON38_CSI1_MIPI_RX_HW_CAL_START_SHIFT 2
> +#define MIPI_RX_CON38_CSI1_MIPI_RX_HW_CAL_START_MASK (0x1 << 2)
> +#define MIPI_RX_CON38_CSI1_MIPI_RX_HW_CAL_OPTION_SHIFT 3
> +#define MIPI_RX_CON38_CSI1_MIPI_RX_HW_CAL_OPTION_MASK (0x1 << 3)
> +#define MIPI_RX_CON38_CSI1_MIPI_RX_SW_RST_SHIFT 4
> +#define MIPI_RX_CON38_CSI1_MIPI_RX_SW_RST_MASK (0x1f << 4)
> +#define MIPI_RX_CON38_CSI1_MIPI_RX_SW_CPHY_TX_MODE_SHIFT 9
> +#define MIPI_RX_CON38_CSI1_MIPI_RX_SW_CPHY_TX_MODE_MASK (0x1 << 9)
> +#define MIPI_RX_CON38_CSI1_MIPI_RX_SW_CPHY_RX_MODE_SHIFT 10
> +#define MIPI_RX_CON38_CSI1_MIPI_RX_SW_CPHY_RX_MODE_MASK (0x1 << 10)
> +#define MIPI_RX_CON38_CSI1_RG_CKPHASE_TRIO0_SHIFT 16
> +#define MIPI_RX_CON38_CSI1_RG_CKPHASE_TRIO0_MASK (0x1f << 16)
> +#define MIPI_RX_CON38_CSI1_RG_CKPHASE_TRIO1_SHIFT 22
> +#define MIPI_RX_CON38_CSI1_RG_CKPHASE_TRIO1_MASK (0x1f << 22)
> +#define MIPI_RX_CON38_CSI1_RG_CKPHASE_TRIO2_SHIFT 27
> +#define MIPI_RX_CON38_CSI1_RG_CKPHASE_TRIO2_MASK (0x1f << 27)
> +#define MIPI_RX_CON3C_CSI1                                     0x183C
> +#define MIPI_RX_CON3C_CSI1_MIPI_RX_SW_CTRL__SHIFT 0
> +#define MIPI_RX_CON3C_CSI1_MIPI_RX_SW_CTRL__MASK (0xffffffff << 0)
> +#define MIPI_RX_CON7C_CSI1                                     0x187C
> +#define MIPI_RX_CON7C_CSI1_DA_CSI0_LNRD0_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON7C_CSI1_DA_CSI0_LNRD0_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON7C_CSI1_DA_CSI0_LNRD0_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON7C_CSI1_DA_CSI0_LNRD0_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON7C_CSI1_DA_CSI0_LNRD0_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON7C_CSI1_DA_CSI0_LNRD0_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON80_CSI1                                     0x1880
> +#define MIPI_RX_CON80_CSI1_DA_CSI0_LNRD1_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON80_CSI1_DA_CSI0_LNRD1_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON80_CSI1_DA_CSI0_LNRD1_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON80_CSI1_DA_CSI0_LNRD1_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON80_CSI1_DA_CSI0_LNRD1_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON80_CSI1_DA_CSI0_LNRD1_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON84_CSI1                                     0x1884
> +#define MIPI_RX_CON84_CSI1_DA_CSI0_LNRD2_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON84_CSI1_DA_CSI0_LNRD2_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON84_CSI1_DA_CSI0_LNRD2_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON84_CSI1_DA_CSI0_LNRD2_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON84_CSI1_DA_CSI0_LNRD2_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON84_CSI1_DA_CSI0_LNRD2_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON88_CSI1                                     0x1888
> +#define MIPI_RX_CON88_CSI1_DA_CSI0_LNRD3_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON88_CSI1_DA_CSI0_LNRD3_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON88_CSI1_DA_CSI0_LNRD3_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON88_CSI1_DA_CSI0_LNRD3_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON88_CSI1_DA_CSI0_LNRD3_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON88_CSI1_DA_CSI0_LNRD3_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON8C_CSI1                                     0x188C
> +#define MIPI_RX_CON8C_CSI1_RG_CSI0_LNRD0_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON8C_CSI1_RG_CSI0_LNRD0_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON8C_CSI1_RG_CSI0_LNRD0_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON8C_CSI1_RG_CSI0_LNRD0_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON8C_CSI1_RG_CSI0_LNRD0_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON8C_CSI1_RG_CSI0_LNRD0_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON90_CSI1                                     0x1890
> +#define MIPI_RX_CON90_CSI1_RG_CSI0_LNRD1_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON90_CSI1_RG_CSI0_LNRD1_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON90_CSI1_RG_CSI0_LNRD1_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON90_CSI1_RG_CSI0_LNRD1_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON90_CSI1_RG_CSI0_LNRD1_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON90_CSI1_RG_CSI0_LNRD1_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON94_CSI1                                     0x1894
> +#define MIPI_RX_CON94_CSI1_RG_CSI0_LNRD2_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON94_CSI1_RG_CSI0_LNRD2_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON94_CSI1_RG_CSI0_LNRD2_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON94_CSI1_RG_CSI0_LNRD2_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON94_CSI1_RG_CSI0_LNRD2_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON94_CSI1_RG_CSI0_LNRD2_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON98_CSI1                                     0x1898
> +#define MIPI_RX_CON98_CSI1_RG_CSI0_LNRD3_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON98_CSI1_RG_CSI0_LNRD3_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON98_CSI1_RG_CSI0_LNRD3_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON98_CSI1_RG_CSI0_LNRD3_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON98_CSI1_RG_CSI0_LNRD3_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON98_CSI1_RG_CSI0_LNRD3_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CONA0_CSI1                                     0x18A0
> +#define MIPI_RX_CONA0_CSI1_RG_CSI0_LNRC_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CONA0_CSI1_RG_CSI0_LNRC_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CONA0_CSI1_RG_CSI0_LNRC_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CONA0_CSI1_RG_CSI0_LNRC_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CONA0_CSI1_RG_CSI0_LNRC_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CONA0_CSI1_RG_CSI0_LNRC_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CONB0_CSI1                                     0x18B0
> +#define MIPI_RX_CONB0_CSI1_DELAY_APPLY_MODE_SHIFT 0
> +#define MIPI_RX_CONB0_CSI1_DELAY_APPLY_MODE_MASK (0xf << 0)
> +#define MIPI_RX_CONB0_CSI1_DESKEW_SW_RST_SHIFT 7
> +#define MIPI_RX_CONB0_CSI1_DESKEW_SW_RST_MASK  (0x1 << 7)
> +#define MIPI_RX_CONB0_CSI1_DESKEW_TRIGGER_MODE_SHIFT 8
> +#define MIPI_RX_CONB0_CSI1_DESKEW_TRIGGER_MODE_MASK (0x7 << 8)
> +#define MIPI_RX_CONB0_CSI1_DESKEW_ACC_MODE_SHIFT 12
> +#define MIPI_RX_CONB0_CSI1_DESKEW_ACC_MODE_MASK (0xf << 12)
> +#define MIPI_RX_CONB0_CSI1_DESKEW_CSI2_RST_ENABLE_SHIFT 16
> +#define MIPI_RX_CONB0_CSI1_DESKEW_CSI2_RST_ENABLE_MASK (0x1 << 16)
> +#define MIPI_RX_CONB0_CSI1_DESKEW_IP_SEL_SHIFT 30
> +#define MIPI_RX_CONB0_CSI1_DESKEW_IP_SEL_MASK  (0x1 << 30)
> +#define MIPI_RX_CONB0_CSI1_DESKEW_ENABLE_SHIFT 31
> +#define MIPI_RX_CONB0_CSI1_DESKEW_ENABLE_MASK  (0x1 << 31)
> +#define MIPI_RX_CONB4_CSI1                                     0x18B4
> +#define MIPI_RX_CONB4_CSI1_SYNC_CODE_MASK_SHIFT 0
> +#define MIPI_RX_CONB4_CSI1_SYNC_CODE_MASK_MASK (0xffff << 0)
> +#define MIPI_RX_CONB4_CSI1_EXPECTED_SYNC_CODE_SHIFT 16
> +#define MIPI_RX_CONB4_CSI1_EXPECTED_SYNC_CODE_MASK (0xffff << 16)
> +#define MIPI_RX_CONB8_CSI1                                     0x18B8
> +#define MIPI_RX_CONB8_CSI1_DESKEW_SETUP_TIME_SHIFT 0
> +#define MIPI_RX_CONB8_CSI1_DESKEW_SETUP_TIME_MASK (0xf << 0)
> +#define MIPI_RX_CONB8_CSI1_DESKEW_HOLD_TIME_SHIFT 8
> +#define MIPI_RX_CONB8_CSI1_DESKEW_HOLD_TIME_MASK (0xf << 8)
> +#define MIPI_RX_CONB8_CSI1_DESKEW_TIME_OUT_SHIFT 16
> +#define MIPI_RX_CONB8_CSI1_DESKEW_TIME_OUT_MASK (0xff << 16)
> +#define MIPI_RX_CONB8_CSI1_DESKEW_TIME_OUT_EN_SHIFT 24
> +#define MIPI_RX_CONB8_CSI1_DESKEW_TIME_OUT_EN_MASK (0x1 << 24)
> +#define MIPI_RX_CONBC_CSI1                                     0x18BC
> +#define MIPI_RX_CONBC_CSI1_DESKEW_DETECTION_MODE_SHIFT 0
> +#define MIPI_RX_CONBC_CSI1_DESKEW_DETECTION_MODE_MASK (0xf << 0)
> +#define MIPI_RX_CONBC_CSI1_DESKEW_DETECTION_CNT_SHIFT 8
> +#define MIPI_RX_CONBC_CSI1_DESKEW_DETECTION_CNT_MASK (0x7f << 8)
> +#define MIPI_RX_CONBC_CSI1_DESKEW_DELAY_APPLY_MODE_SHIFT 16
> +#define MIPI_RX_CONBC_CSI1_DESKEW_DELAY_APPLY_MODE_MASK (0xf << 16)
> +#define MIPI_RX_CONBC_CSI1_DESKEW_LANE_NUMBER_SHIFT 24
> +#define MIPI_RX_CONBC_CSI1_DESKEW_LANE_NUMBER_MASK (0x3 << 24)
> +#define MIPI_RX_CONC0_CSI1                                     0x18C0
> +#define MIPI_RX_CONC0_CSI1_DESKEW_INTERRUPT_ENABLE_SHIFT 0
> +#define MIPI_RX_CONC0_CSI1_DESKEW_INTERRUPT_ENABLE_MASK (0xffff << 0)
> +#define MIPI_RX_CONC0_CSI1_DESKEW_INTERRUPT_W1C_EN_SHIFT 31
> +#define MIPI_RX_CONC0_CSI1_DESKEW_INTERRUPT_W1C_EN_MASK (0x1 << 31)
> +#define MIPI_RX_CONC4_CSI1                                     0x18C4
> +#define MIPI_RX_CONC4_CSI1_DESKEW_INTERRUPT_STATUS_SHIFT 0
> +#define MIPI_RX_CONC4_CSI1_DESKEW_INTERRUPT_STATUS_MASK (0xffff << 0)
> +#define MIPI_RX_CONC8_CSI1                                     0x18C8
> +#define MIPI_RX_CONC8_CSI1_DESKEW_DEBUG_MUX_SELECT_SHIFT 0
> +#define MIPI_RX_CONC8_CSI1_DESKEW_DEBUG_MUX_SELECT_MASK (0xff << 0)
> +#define MIPI_RX_CONCC_CSI1                                     0x18CC
> +#define MIPI_RX_CONCC_CSI1_DESKEW_DEBUG_OUTPUTS_SHIFT 0
> +#define MIPI_RX_CONCC_CSI1_DESKEW_DEBUG_OUTPUTS_MASK (0xffffffff << 0)
> +#define MIPI_RX_COND0_CSI1                                     0x18D0
> +#define MIPI_RX_COND0_CSI1_DESKEW_DELAY_LENGTH_SHIFT 0
> +#define MIPI_RX_COND0_CSI1_DESKEW_DELAY_LENGTH_MASK (0x3f << 0)
> +#define SENINF2_CSI2_CTL                                       0x1A00
> +#define SENINF2_CSI2_CTL_DATA_LANE0_EN_SHIFT   0
> +#define SENINF2_CSI2_CTL_DATA_LANE0_EN_MASK    (0x1 << 0)
> +#define SENINF2_CSI2_CTL_DATA_LANE1_EN_SHIFT   1
> +#define SENINF2_CSI2_CTL_DATA_LANE1_EN_MASK    (0x1 << 1)
> +#define SENINF2_CSI2_CTL_DATA_LANE2_EN_SHIFT   2
> +#define SENINF2_CSI2_CTL_DATA_LANE2_EN_MASK    (0x1 << 2)
> +#define SENINF2_CSI2_CTL_DATA_LANE3_EN_SHIFT   3
> +#define SENINF2_CSI2_CTL_DATA_LANE3_EN_MASK    (0x1 << 3)
> +#define SENINF2_CSI2_CTL_CLOCK_LANE_EN_SHIFT   4
> +#define SENINF2_CSI2_CTL_CLOCK_LANE_EN_MASK    (0x1 << 4)
> +#define SENINF2_CSI2_CTL_ECC_EN_SHIFT          5
> +#define SENINF2_CSI2_CTL_ECC_EN_MASK           (0x1 << 5)
> +#define SENINF2_CSI2_CTL_CRC_EN_SHIFT          6
> +#define SENINF2_CSI2_CTL_CRC_EN_MASK           (0x1 << 6)
> +#define SENINF2_CSI2_CTL_HSRX_DET_EN_SHIFT     7
> +#define SENINF2_CSI2_CTL_HSRX_DET_EN_MASK      (0x1 << 7)
> +#define SENINF2_CSI2_CTL_HS_PRPR_EN_SHIFT      8
> +#define SENINF2_CSI2_CTL_HS_PRPR_EN_MASK       (0x1 << 8)
> +#define SENINF2_CSI2_CTL_HS_END_EN_SHIFT       9
> +#define SENINF2_CSI2_CTL_HS_END_EN_MASK        (0x1 << 9)
> +#define SENINF2_CSI2_CTL_GENERIC_LONG_PACKET_EN_SHIFT 12
> +#define SENINF2_CSI2_CTL_GENERIC_LONG_PACKET_EN_MASK (0x1 << 12)
> +#define SENINF2_CSI2_CTL_IMAGE_PACKET_EN_SHIFT 13
> +#define SENINF2_CSI2_CTL_IMAGE_PACKET_EN_MASK  (0x1 << 13)
> +#define SENINF2_CSI2_CTL_BYTE2PIXEL_EN_SHIFT   14
> +#define SENINF2_CSI2_CTL_BYTE2PIXEL_EN_MASK    (0x1 << 14)
> +#define SENINF2_CSI2_CTL_VS_TYPE_SHIFT         15
> +#define SENINF2_CSI2_CTL_VS_TYPE_MASK          (0x1 << 15)
> +#define SENINF2_CSI2_CTL_ED_SEL_SHIFT          16
> +#define SENINF2_CSI2_CTL_ED_SEL_MASK           (0x1 << 16)
> +#define SENINF2_CSI2_CTL_FLUSH_MODE_SHIFT      18
> +#define SENINF2_CSI2_CTL_FLUSH_MODE_MASK       (0x3 << 18)
> +#define SENINF2_CSI2_CTL_HS_TRAIL_EN_SHIFT     25
> +#define SENINF2_CSI2_CTL_HS_TRAIL_EN_MASK      (0x1 << 25)
> +#define SENINF2_CSI2_CTL_CLOCK_HS_OPTION_SHIFT 27
> +#define SENINF2_CSI2_CTL_CLOCK_HS_OPTION_MASK  (0x1 << 27)
> +#define SENINF2_CSI2_CTL_VS_OUT_CYCLE_NUMBER_SHIFT 28
> +#define SENINF2_CSI2_CTL_VS_OUT_CYCLE_NUMBER_MASK (0x3 << 28)
> +#define SENINF2_CSI2_LNRC_TIMING                               0x1A04
> +#define SENINF2_CSI2_LNRC_TIMING_CLOCK_TERM_PARAMETER_SHIFT 0
> +#define SENINF2_CSI2_LNRC_TIMING_CLOCK_TERM_PARAMETER_MASK (0xff << 0)
> +#define SENINF2_CSI2_LNRC_TIMING_CLOCK_SETTLE_PARAMETER_SHIFT 8
> +#define SENINF2_CSI2_LNRC_TIMING_CLOCK_SETTLE_PARAMETER_MASK (0xff << 8)
> +#define SENINF2_CSI2_LNRD_TIMING                               0x1A08
> +#define SENINF2_CSI2_LNRD_TIMING_DATA_TERM_PARAMETER_SHIFT 0
> +#define SENINF2_CSI2_LNRD_TIMING_DATA_TERM_PARAMETER_MASK (0xff << 0)
> +#define SENINF2_CSI2_LNRD_TIMING_DATA_SETTLE_PARAMETER_SHIFT 8
> +#define SENINF2_CSI2_LNRD_TIMING_DATA_SETTLE_PARAMETER_MASK (0xff << 8)
> +#define SENINF2_CSI2_DPCM                                      0x1A0C
> +#define SENINF2_CSI2_DPCM_DPCM_MODE_SHIFT      0
> +#define SENINF2_CSI2_DPCM_DPCM_MODE_MASK       (0xf << 0)
> +#define SENINF2_CSI2_DPCM_DI_30_DPCM_EN_SHIFT  7
> +#define SENINF2_CSI2_DPCM_DI_30_DPCM_EN_MASK   (0x1 << 7)
> +#define SENINF2_CSI2_DPCM_DI_31_DPCM_EN_SHIFT  8
> +#define SENINF2_CSI2_DPCM_DI_31_DPCM_EN_MASK   (0x1 << 8)
> +#define SENINF2_CSI2_DPCM_DI_32_DPCM_EN_SHIFT  9
> +#define SENINF2_CSI2_DPCM_DI_32_DPCM_EN_MASK   (0x1 << 9)
> +#define SENINF2_CSI2_DPCM_DI_33_DPCM_EN_SHIFT  10
> +#define SENINF2_CSI2_DPCM_DI_33_DPCM_EN_MASK   (0x1 << 10)
> +#define SENINF2_CSI2_DPCM_DI_34_DPCM_EN_SHIFT  11
> +#define SENINF2_CSI2_DPCM_DI_34_DPCM_EN_MASK   (0x1 << 11)
> +#define SENINF2_CSI2_DPCM_DI_35_DPCM_EN_SHIFT  12
> +#define SENINF2_CSI2_DPCM_DI_35_DPCM_EN_MASK   (0x1 << 12)
> +#define SENINF2_CSI2_DPCM_DI_36_DPCM_EN_SHIFT  13
> +#define SENINF2_CSI2_DPCM_DI_36_DPCM_EN_MASK   (0x1 << 13)
> +#define SENINF2_CSI2_DPCM_DI_37_DPCM_EN_SHIFT  14
> +#define SENINF2_CSI2_DPCM_DI_37_DPCM_EN_MASK   (0x1 << 14)
> +#define SENINF2_CSI2_DPCM_DI_2A_DPCM_EN_SHIFT  15
> +#define SENINF2_CSI2_DPCM_DI_2A_DPCM_EN_MASK   (0x1 << 15)
> +#define SENINF2_CSI2_INT_EN                                    0x1A10
> +#define SENINF2_CSI2_INT_EN_ERR_FRAME_SYNC_SHIFT 0
> +#define SENINF2_CSI2_INT_EN_ERR_FRAME_SYNC_MASK (0x1 << 0)
> +#define SENINF2_CSI2_INT_EN_ERR_ID_SHIFT       1
> +#define SENINF2_CSI2_INT_EN_ERR_ID_MASK        (0x1 << 1)
> +#define SENINF2_CSI2_INT_EN_ERR_ECC_NO_ERROR_SHIFT 2
> +#define SENINF2_CSI2_INT_EN_ERR_ECC_NO_ERROR_MASK (0x1 << 2)
> +#define SENINF2_CSI2_INT_EN_ERR_ECC_CORRECTED_SHIFT 3
> +#define SENINF2_CSI2_INT_EN_ERR_ECC_CORRECTED_MASK (0x1 << 3)
> +#define SENINF2_CSI2_INT_EN_ERR_ECC_DOUBLE_SHIFT 4
> +#define SENINF2_CSI2_INT_EN_ERR_ECC_DOUBLE_MASK (0x1 << 4)
> +#define SENINF2_CSI2_INT_EN_ERR_CRC_SHIFT      5
> +#define SENINF2_CSI2_INT_EN_ERR_CRC_MASK       (0x1 << 5)
> +#define SENINF2_CSI2_INT_EN_ERR_CRC_NO_ERROR_SHIFT 6
> +#define SENINF2_CSI2_INT_EN_ERR_CRC_NO_ERROR_MASK (0x1 << 6)
> +#define SENINF2_CSI2_INT_EN_ERR_MULTI_LANE_SYNC_SHIFT 7
> +#define SENINF2_CSI2_INT_EN_ERR_MULTI_LANE_SYNC_MASK (0x1 << 7)
> +#define SENINF2_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD0_SHIFT 8
> +#define SENINF2_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD0_MASK (0x1 << 8)
> +#define SENINF2_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD1_SHIFT 9
> +#define SENINF2_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD1_MASK (0x1 << 9)
> +#define SENINF2_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD2_SHIFT 10
> +#define SENINF2_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD2_MASK (0x1 << 10)
> +#define SENINF2_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD3_SHIFT 11
> +#define SENINF2_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD3_MASK (0x1 << 11)
> +#define SENINF2_CSI2_INT_EN_FS_SHIFT           12
> +#define SENINF2_CSI2_INT_EN_FS_MASK            (0x1 << 12)
> +#define SENINF2_CSI2_INT_EN_LS_SHIFT           13
> +#define SENINF2_CSI2_INT_EN_LS_MASK            (0x1 << 13)
> +#define SENINF2_CSI2_INT_EN_GS_SHIFT           14
> +#define SENINF2_CSI2_INT_EN_GS_MASK            (0x1 << 14)
> +#define SENINF2_CSI2_INT_EN_FE_SHIFT           15
> +#define SENINF2_CSI2_INT_EN_FE_MASK            (0x1 << 15)
> +#define SENINF2_CSI2_INT_EN_ERR_FRAME_SYNC_S0_SHIFT 16
> +#define SENINF2_CSI2_INT_EN_ERR_FRAME_SYNC_S0_MASK (0x1 << 16)
> +#define SENINF2_CSI2_INT_EN_ERR_FRAME_SYNC_S1_SHIFT 17
> +#define SENINF2_CSI2_INT_EN_ERR_FRAME_SYNC_S1_MASK (0x1 << 17)
> +#define SENINF2_CSI2_INT_EN_ERR_FRAME_SYNC_S2_SHIFT 18
> +#define SENINF2_CSI2_INT_EN_ERR_FRAME_SYNC_S2_MASK (0x1 << 18)
> +#define SENINF2_CSI2_INT_EN_ERR_FRAME_SYNC_S3_SHIFT 19
> +#define SENINF2_CSI2_INT_EN_ERR_FRAME_SYNC_S3_MASK (0x1 << 19)
> +#define SENINF2_CSI2_INT_EN_ERR_FRAME_SYNC_S4_SHIFT 20
> +#define SENINF2_CSI2_INT_EN_ERR_FRAME_SYNC_S4_MASK (0x1 << 20)
> +#define SENINF2_CSI2_INT_EN_ERR_FRAME_SYNC_S5_SHIFT 21
> +#define SENINF2_CSI2_INT_EN_ERR_FRAME_SYNC_S5_MASK (0x1 << 21)
> +#define SENINF2_CSI2_INT_EN_ERR_LANE_RESYNC_SHIFT 22
> +#define SENINF2_CSI2_INT_EN_ERR_LANE_RESYNC_MASK (0x1 << 22)
> +#define SENINF2_CSI2_INT_EN_ERR_FRAME_SYNC_S6_SHIFT 23
> +#define SENINF2_CSI2_INT_EN_ERR_FRAME_SYNC_S6_MASK (0x1 << 23)
> +#define SENINF2_CSI2_INT_EN_ERR_FRAME_SYNC_S7_SHIFT 24
> +#define SENINF2_CSI2_INT_EN_ERR_FRAME_SYNC_S7_MASK (0x1 << 24)
> +#define SENINF2_CSI2_INT_EN_TRIO0_ESCAPE_CODE_DETECT_SHIFT 26
> +#define SENINF2_CSI2_INT_EN_TRIO0_ESCAPE_CODE_DETECT_MASK (0x1 << 26)
> +#define SENINF2_CSI2_INT_EN_TRIO1_ESCAPE_CODE_DETECT_SHIFT 27
> +#define SENINF2_CSI2_INT_EN_TRIO1_ESCAPE_CODE_DETECT_MASK (0x1 << 27)
> +#define SENINF2_CSI2_INT_EN_TRIO2_ESCAPE_CODE_DETECT_SHIFT 28
> +#define SENINF2_CSI2_INT_EN_TRIO2_ESCAPE_CODE_DETECT_MASK (0x1 << 28)
> +#define SENINF2_CSI2_INT_EN_TRIO3_ESCAPE_CODE_DETECT_SHIFT 29
> +#define SENINF2_CSI2_INT_EN_TRIO3_ESCAPE_CODE_DETECT_MASK (0x1 << 29)
> +#define SENINF2_CSI2_INT_EN_MERGE_FIFO_AF_SHIFT 30
> +#define SENINF2_CSI2_INT_EN_MERGE_FIFO_AF_MASK (0x1 << 30)
> +#define SENINF2_CSI2_INT_EN_INT_WCLR_EN_SHIFT  31
> +#define SENINF2_CSI2_INT_EN_INT_WCLR_EN_MASK   (0x1 << 31)
> +#define SENINF2_CSI2_INT_STATUS                                0x1A14
> +#define SENINF2_CSI2_INT_STATUS_ERR_FRAME_SYNC_STA_SHIFT 0
> +#define SENINF2_CSI2_INT_STATUS_ERR_FRAME_SYNC_STA_MASK (0x1 << 0)
> +#define SENINF2_CSI2_INT_STATUS_ERR_ID_STA_SHIFT 1
> +#define SENINF2_CSI2_INT_STATUS_ERR_ID_STA_MASK (0x1 << 1)
> +#define SENINF2_CSI2_INT_STATUS_ERR_ECC_NO_ERROR_STA_SHIFT 2
> +#define SENINF2_CSI2_INT_STATUS_ERR_ECC_NO_ERROR_STA_MASK (0x1 << 2)
> +#define SENINF2_CSI2_INT_STATUS_ERR_ECC_CORRECTED_STA_SHIFT 3
> +#define SENINF2_CSI2_INT_STATUS_ERR_ECC_CORRECTED_STA_MASK (0x1 << 3)
> +#define SENINF2_CSI2_INT_STATUS_ERR_ECC_DOUBLE_STA_SHIFT 4
> +#define SENINF2_CSI2_INT_STATUS_ERR_ECC_DOUBLE_STA_MASK (0x1 << 4)
> +#define SENINF2_CSI2_INT_STATUS_ERR_CRC_STA_SHIFT 5
> +#define SENINF2_CSI2_INT_STATUS_ERR_CRC_STA_MASK (0x1 << 5)
> +#define SENINF2_CSI2_INT_STATUS_ERR_MULTI_LANE_SYNC_STA_SHIFT 7
> +#define SENINF2_CSI2_INT_STATUS_ERR_MULTI_LANE_SYNC_STA_MASK (0x1 << 7)
> +#define SENINF2_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD0_STA_SHIFT 8
> +#define SENINF2_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD0_STA_MASK (0x1 << 8)
> +#define SENINF2_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD1_STA_SHIFT 9
> +#define SENINF2_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD1_STA_MASK (0x1 << 9)
> +#define SENINF2_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD2_STA_SHIFT 10
> +#define SENINF2_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD2_STA_MASK (0x1 << 10)
> +#define SENINF2_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD3_STA_SHIFT 11
> +#define SENINF2_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD3_STA_MASK (0x1 << 11)
> +#define SENINF2_CSI2_INT_STATUS_FS_STA_SHIFT   12
> +#define SENINF2_CSI2_INT_STATUS_FS_STA_MASK    (0x1 << 12)
> +#define SENINF2_CSI2_INT_STATUS_LS_STA_SHIFT   13
> +#define SENINF2_CSI2_INT_STATUS_LS_STA_MASK    (0x1 << 13)
> +#define SENINF2_CSI2_INT_STATUS_GS_STA_SHIFT   14
> +#define SENINF2_CSI2_INT_STATUS_GS_STA_MASK    (0x1 << 14)
> +#define SENINF2_CSI2_INT_STATUS_FE_STA_SHIFT   15
> +#define SENINF2_CSI2_INT_STATUS_FE_STA_MASK    (0x1 << 15)
> +#define SENINF2_CSI2_INT_STATUS_ERR_FRAME_SYNC_S0_STA_SHIFT 16
> +#define SENINF2_CSI2_INT_STATUS_ERR_FRAME_SYNC_S0_STA_MASK (0x1 << 16)
> +#define SENINF2_CSI2_INT_STATUS_ERR_FRAME_SYNC_S1_STA_SHIFT 17
> +#define SENINF2_CSI2_INT_STATUS_ERR_FRAME_SYNC_S1_STA_MASK (0x1 << 17)
> +#define SENINF2_CSI2_INT_STATUS_ERR_FRAME_SYNC_S2_STA_SHIFT 18
> +#define SENINF2_CSI2_INT_STATUS_ERR_FRAME_SYNC_S2_STA_MASK (0x1 << 18)
> +#define SENINF2_CSI2_INT_STATUS_ERR_FRAME_SYNC_S3_STA_SHIFT 19
> +#define SENINF2_CSI2_INT_STATUS_ERR_FRAME_SYNC_S3_STA_MASK (0x1 << 19)
> +#define SENINF2_CSI2_INT_STATUS_ERR_FRAME_SYNC_S4_STA_SHIFT 20
> +#define SENINF2_CSI2_INT_STATUS_ERR_FRAME_SYNC_S4_STA_MASK (0x1 << 20)
> +#define SENINF2_CSI2_INT_STATUS_ERR_FRAME_SYNC_S5_STA_SHIFT 21
> +#define SENINF2_CSI2_INT_STATUS_ERR_FRAME_SYNC_S5_STA_MASK (0x1 << 21)
> +#define SENINF2_CSI2_INT_STATUS_ERR_LANE_RESYNC_STA_SHIFT 22
> +#define SENINF2_CSI2_INT_STATUS_ERR_LANE_RESYNC_STA_MASK (0x1 << 22)
> +#define SENINF2_CSI2_INT_STATUS_ERR_FRAME_SYNC_S6_STA_SHIFT 23
> +#define SENINF2_CSI2_INT_STATUS_ERR_FRAME_SYNC_S6_STA_MASK (0x1 << 23)
> +#define SENINF2_CSI2_INT_STATUS_ERR_FRAME_SYNC_S7_STA_SHIFT 24
> +#define SENINF2_CSI2_INT_STATUS_ERR_FRAME_SYNC_S7_STA_MASK (0x1 << 24)
> +#define SENINF2_CSI2_INT_STATUS_TRIO0_ESCAPE_CODE_DETECT_STA_SHIFT 26
> +#define SENINF2_CSI2_INT_STATUS_TRIO0_ESCAPE_CODE_DETECT_STA_MASK (0x1 << 26)
> +#define SENINF2_CSI2_INT_STATUS_TRIO1_ESCAPE_CODE_DETECT_STA_SHIFT 27
> +#define SENINF2_CSI2_INT_STATUS_TRIO1_ESCAPE_CODE_DETECT_STA_MASK (0x1 << 27)
> +#define SENINF2_CSI2_INT_STATUS_TRIO2_ESCAPE_CODE_DETECT_STA_SHIFT 28
> +#define SENINF2_CSI2_INT_STATUS_TRIO2_ESCAPE_CODE_DETECT_STA_MASK (0x1 << 28)
> +#define SENINF2_CSI2_INT_STATUS_TRIO3_ESCAPE_CODE_DETECT_STA_SHIFT 29
> +#define SENINF2_CSI2_INT_STATUS_TRIO3_ESCAPE_CODE_DETECT_STA_MASK (0x1 << 29)
> +#define SENINF2_CSI2_INT_STATUS_MERGE_FIFO_AF_SHIFT 30
> +#define SENINF2_CSI2_INT_STATUS_MERGE_FIFO_AF_MASK (0x1 << 30)
> +#define SENINF2_CSI2_DGB_SEL                                   0x1A18
> +#define SENINF2_CSI2_DGB_SEL_DEBUG_SEL_SHIFT   0
> +#define SENINF2_CSI2_DGB_SEL_DEBUG_SEL_MASK    (0xff << 0)
> +#define SENINF2_CSI2_DGB_SEL_DEBUG_EN_SHIFT    31
> +#define SENINF2_CSI2_DGB_SEL_DEBUG_EN_MASK     (0x1 << 31)
> +#define SENINF2_CSI2_DBG_PORT                                  0x1A1C
> +#define SENINF2_CSI2_DBG_PORT_CTL_DBG_PORT_SHIFT 0
> +#define SENINF2_CSI2_DBG_PORT_CTL_DBG_PORT_MASK (0xffff << 0)
> +#define SENINF2_CSI2_SPARE0                                    0x1A20
> +#define SENINF2_CSI2_SPARE0_SPARE0_SHIFT       0
> +#define SENINF2_CSI2_SPARE0_SPARE0_MASK        (0xffffffff << 0)
> +#define SENINF2_CSI2_SPARE1                                    0x1A24
> +#define SENINF2_CSI2_SPARE1_SPARE1_SHIFT       0
> +#define SENINF2_CSI2_SPARE1_SPARE1_MASK        (0xffffffff << 0)
> +#define SENINF2_CSI2_LNRC_FSM                                  0x1A28
> +#define SENINF2_CSI2_LNRC_FSM_LNRC_RX_FSM_SHIFT 0
> +#define SENINF2_CSI2_LNRC_FSM_LNRC_RX_FSM_MASK (0x3f << 0)
> +#define SENINF2_CSI2_LNRD_FSM                                  0x1A2C
> +#define SENINF2_CSI2_LNRD_FSM_LNRD0_RX_FSM_SHIFT 0
> +#define SENINF2_CSI2_LNRD_FSM_LNRD0_RX_FSM_MASK (0x7f << 0)
> +#define SENINF2_CSI2_LNRD_FSM_LNRD1_RX_FSM_SHIFT 8
> +#define SENINF2_CSI2_LNRD_FSM_LNRD1_RX_FSM_MASK (0x7f << 8)
> +#define SENINF2_CSI2_LNRD_FSM_LNRD2_RX_FSM_SHIFT 16
> +#define SENINF2_CSI2_LNRD_FSM_LNRD2_RX_FSM_MASK (0x7f << 16)
> +#define SENINF2_CSI2_LNRD_FSM_LNRD3_RX_FSM_SHIFT 24
> +#define SENINF2_CSI2_LNRD_FSM_LNRD3_RX_FSM_MASK (0x7f << 24)
> +#define SENINF2_CSI2_FRAME_LINE_NUM                            0x1A30
> +#define SENINF2_CSI2_FRAME_LINE_NUM_FRAME_NUM_SHIFT 0
> +#define SENINF2_CSI2_FRAME_LINE_NUM_FRAME_NUM_MASK (0xffff << 0)
> +#define SENINF2_CSI2_FRAME_LINE_NUM_LINE_NUM_SHIFT 16
> +#define SENINF2_CSI2_FRAME_LINE_NUM_LINE_NUM_MASK (0xffff << 16)
> +#define SENINF2_CSI2_GENERIC_SHORT                             0x1A34
> +#define SENINF2_CSI2_GENERIC_SHORT_GENERIC_SHORT_PACKET_DT_SHIFT 0
> +#define SENINF2_CSI2_GENERIC_SHORT_GENERIC_SHORT_PACKET_DT_MASK (0x3f << 0)
> +#define SENINF2_CSI2_GENERIC_SHORT_GENERIC_SHORT_PACKET_DATA_SHIFT 16
> +#define SENINF2_CSI2_GENERIC_SHORT_GENERIC_SHORT_PACKET_DATA_MASK \
> +(0xffff << 16)
> +#define SENINF2_CSI2_HSRX_DBG                                  0x1A38
> +#define SENINF2_CSI2_HSRX_DBG_DATA_LANE0_HSRX_EN_SHIFT 0
> +#define SENINF2_CSI2_HSRX_DBG_DATA_LANE0_HSRX_EN_MASK (0x1 << 0)
> +#define SENINF2_CSI2_HSRX_DBG_DATA_LANE1_HSRX_EN_SHIFT 1
> +#define SENINF2_CSI2_HSRX_DBG_DATA_LANE1_HSRX_EN_MASK (0x1 << 1)
> +#define SENINF2_CSI2_HSRX_DBG_DATA_LANE2_HSRX_EN_SHIFT 2
> +#define SENINF2_CSI2_HSRX_DBG_DATA_LANE2_HSRX_EN_MASK (0x1 << 2)
> +#define SENINF2_CSI2_HSRX_DBG_DATA_LANE3_HSRX_EN_SHIFT 3
> +#define SENINF2_CSI2_HSRX_DBG_DATA_LANE3_HSRX_EN_MASK (0x1 << 3)
> +#define SENINF2_CSI2_HSRX_DBG_CLOCK_LANE_HSRX_EN_SHIFT 4
> +#define SENINF2_CSI2_HSRX_DBG_CLOCK_LANE_HSRX_EN_MASK (0x1 << 4)
> +#define SENINF2_CSI2_DI                                        0x1A3C
> +#define SENINF2_CSI2_DI_VC0_SHIFT              0
> +#define SENINF2_CSI2_DI_VC0_MASK               (0x3 << 0)
> +#define SENINF2_CSI2_DI_DT0_SHIFT              2
> +#define SENINF2_CSI2_DI_DT0_MASK               (0x3f << 2)
> +#define SENINF2_CSI2_DI_VC1_SHIFT              8
> +#define SENINF2_CSI2_DI_VC1_MASK               (0x3 << 8)
> +#define SENINF2_CSI2_DI_DT1_SHIFT              10
> +#define SENINF2_CSI2_DI_DT1_MASK               (0x3f << 10)
> +#define SENINF2_CSI2_DI_VC2_SHIFT              16
> +#define SENINF2_CSI2_DI_VC2_MASK               (0x3 << 16)
> +#define SENINF2_CSI2_DI_DT2_SHIFT              18
> +#define SENINF2_CSI2_DI_DT2_MASK               (0x3f << 18)
> +#define SENINF2_CSI2_DI_VC3_SHIFT              24
> +#define SENINF2_CSI2_DI_VC3_MASK               (0x3 << 24)
> +#define SENINF2_CSI2_DI_DT3_SHIFT              26
> +#define SENINF2_CSI2_DI_DT3_MASK               (0x3f << 26)
> +#define SENINF2_CSI2_HS_TRAIL                                  0x1A40
> +#define SENINF2_CSI2_HS_TRAIL_HS_TRAIL_PARAMETER_SHIFT 0
> +#define SENINF2_CSI2_HS_TRAIL_HS_TRAIL_PARAMETER_MASK (0xff << 0)
> +#define SENINF2_CSI2_DI_CTRL                                   0x1A44
> +#define SENINF2_CSI2_DI_CTRL_VC0_INTERLEAVING_SHIFT 0
> +#define SENINF2_CSI2_DI_CTRL_VC0_INTERLEAVING_MASK (0x1 << 0)
> +#define SENINF2_CSI2_DI_CTRL_DT0_INTERLEAVING_SHIFT 1
> +#define SENINF2_CSI2_DI_CTRL_DT0_INTERLEAVING_MASK (0x3 << 1)
> +#define SENINF2_CSI2_DI_CTRL_VC1_INTERLEAVING_SHIFT 8
> +#define SENINF2_CSI2_DI_CTRL_VC1_INTERLEAVING_MASK (0x1 << 8)
> +#define SENINF2_CSI2_DI_CTRL_DT1_INTERLEAVING_SHIFT 9
> +#define SENINF2_CSI2_DI_CTRL_DT1_INTERLEAVING_MASK (0x3 << 9)
> +#define SENINF2_CSI2_DI_CTRL_VC2_INTERLEAVING_SHIFT 16
> +#define SENINF2_CSI2_DI_CTRL_VC2_INTERLEAVING_MASK (0x1 << 16)
> +#define SENINF2_CSI2_DI_CTRL_DT2_INTERLEAVING_SHIFT 17
> +#define SENINF2_CSI2_DI_CTRL_DT2_INTERLEAVING_MASK (0x3 << 17)
> +#define SENINF2_CSI2_DI_CTRL_VC3_INTERLEAVING_SHIFT 24
> +#define SENINF2_CSI2_DI_CTRL_VC3_INTERLEAVING_MASK (0x1 << 24)
> +#define SENINF2_CSI2_DI_CTRL_DT3_INTERLEAVING_SHIFT 25
> +#define SENINF2_CSI2_DI_CTRL_DT3_INTERLEAVING_MASK (0x3 << 25)
> +#define SENINF2_CSI2_DETECT_CON1                               0x1A4C
> +#define SENINF2_CSI2_DETECT_CON1_DETECT_SYNC_DISABLE_SHIFT 0
> +#define SENINF2_CSI2_DETECT_CON1_DETECT_SYNC_DISABLE_MASK (0x1 << 0)
> +#define SENINF2_CSI2_DETECT_CON1_DETECT_SYNC_MASK_SHIFT 1
> +#define SENINF2_CSI2_DETECT_CON1_DETECT_SYNC_MASK_MASK (0x7f << 1)
> +#define SENINF2_CSI2_DETECT_CON1_SYNC_WORD_SHIFT 8
> +#define SENINF2_CSI2_DETECT_CON1_SYNC_WORD_MASK (0x1fffff << 8)
> +#define SENINF2_CSI2_DETECT_CON2                               0x1A50
> +#define SENINF2_CSI2_DETECT_CON2_DETECT_ESCAPE_DISABLE_SHIFT 0
> +#define SENINF2_CSI2_DETECT_CON2_DETECT_ESCAPE_DISABLE_MASK (0x1 << 0)
> +#define SENINF2_CSI2_DETECT_CON2_DETECT_ESCAPE_MASK_SHIFT 1
> +#define SENINF2_CSI2_DETECT_CON2_DETECT_ESCAPE_MASK_MASK (0x7f << 1)
> +#define SENINF2_CSI2_DETECT_CON2_ESCAPE_WORD_SHIFT 8
> +#define SENINF2_CSI2_DETECT_CON2_ESCAPE_WORD_MASK (0x1fffff << 8)
> +#define SENINF2_CSI2_DETECT_CON3                               0x1A54
> +#define SENINF2_CSI2_DETECT_CON3_DETECT_POST_DISABLE_SHIFT 0
> +#define SENINF2_CSI2_DETECT_CON3_DETECT_POST_DISABLE_MASK (0x1 << 0)
> +#define SENINF2_CSI2_DETECT_CON3_DETECT_POST_MASK_SHIFT 1
> +#define SENINF2_CSI2_DETECT_CON3_DETECT_POST_MASK_MASK (0x7f << 1)
> +#define SENINF2_CSI2_DETECT_CON3_POST_WORD_SHIFT 8
> +#define SENINF2_CSI2_DETECT_CON3_POST_WORD_MASK (0x1fffff << 8)
> +#define SENINF2_CSI2_RLR0_CON0                                 0x1A58
> +#define SENINF2_CSI2_RLR0_CON0_RLR0_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF2_CSI2_RLR0_CON0_RLR0_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF2_CSI2_RLR0_CON0_RLR0_PRBS_SEED_0_SHIFT 8
> +#define SENINF2_CSI2_RLR0_CON0_RLR0_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF2_CSI2_RLR0_CON0_RLR0_PRBS_SEED_1_SHIFT 16
> +#define SENINF2_CSI2_RLR0_CON0_RLR0_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF2_CSI2_RLR0_CON0_RLR0_PRBS_SEED_2_SHIFT 24
> +#define SENINF2_CSI2_RLR0_CON0_RLR0_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF2_CSI2_RLR1_CON0                                 0x1A5C
> +#define SENINF2_CSI2_RLR1_CON0_RLR1_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF2_CSI2_RLR1_CON0_RLR1_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF2_CSI2_RLR1_CON0_RLR1_PRBS_SEED_0_SHIFT 8
> +#define SENINF2_CSI2_RLR1_CON0_RLR1_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF2_CSI2_RLR1_CON0_RLR1_PRBS_SEED_1_SHIFT 16
> +#define SENINF2_CSI2_RLR1_CON0_RLR1_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF2_CSI2_RLR1_CON0_RLR1_PRBS_SEED_2_SHIFT 24
> +#define SENINF2_CSI2_RLR1_CON0_RLR1_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF2_CSI2_RLR2_CON0                                 0x1A60
> +#define SENINF2_CSI2_RLR2_CON0_RLR2_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF2_CSI2_RLR2_CON0_RLR2_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF2_CSI2_RLR2_CON0_RLR2_PRBS_SEED_0_SHIFT 8
> +#define SENINF2_CSI2_RLR2_CON0_RLR2_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF2_CSI2_RLR2_CON0_RLR2_PRBS_SEED_1_SHIFT 16
> +#define SENINF2_CSI2_RLR2_CON0_RLR2_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF2_CSI2_RLR2_CON0_RLR2_PRBS_SEED_2_SHIFT 24
> +#define SENINF2_CSI2_RLR2_CON0_RLR2_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF2_CSI2_RLR_CON0                                  0x1A64
> +#define SENINF2_CSI2_RLR_CON0_RLRN_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF2_CSI2_RLR_CON0_RLRN_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF2_CSI2_RLR_CON0_RLRN_PRBS_SEED_0_SHIFT 8
> +#define SENINF2_CSI2_RLR_CON0_RLRN_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF2_CSI2_RLR_CON0_RLRN_PRBS_SEED_1_SHIFT 16
> +#define SENINF2_CSI2_RLR_CON0_RLRN_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF2_CSI2_RLR_CON0_RLRN_PRBS_SEED_2_SHIFT 24
> +#define SENINF2_CSI2_RLR_CON0_RLRN_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF2_CSI2_MUX_CON                                   0x1A68
> +#define SENINF2_CSI2_MUX_CON_DPHY_RX_EXTERNAL_EN_SHIFT 0
> +#define SENINF2_CSI2_MUX_CON_DPHY_RX_EXTERNAL_EN_MASK (0x1 << 0)
> +#define SENINF2_CSI2_MUX_CON_CPHY_TX_EXTERNAL_EN_SHIFT 1
> +#define SENINF2_CSI2_MUX_CON_CPHY_TX_EXTERNAL_EN_MASK (0x1 << 1)
> +#define SENINF2_CSI2_MUX_CON_CPHY_RX_EXTERNAL_EN_SHIFT 2
> +#define SENINF2_CSI2_MUX_CON_CPHY_RX_EXTERNAL_EN_MASK (0x1 << 2)
> +#define SENINF2_CSI2_MUX_CON_RLR_PATTERN_DELAY_EN_SHIFT 3
> +#define SENINF2_CSI2_MUX_CON_RLR_PATTERN_DELAY_EN_MASK (0x1 << 3)
> +#define SENINF2_CSI2_MUX_CON_POST_PACKET_IGNORE_EN_SHIFT 4
> +#define SENINF2_CSI2_MUX_CON_POST_PACKET_IGNORE_EN_MASK (0x1 << 4)
> +#define SENINF2_CSI2_DETECT_DBG0                               0x1A6C
> +#define SENINF2_CSI2_DETECT_DBG0_DETECT_SYNC_LANE0_ST_SHIFT 0
> +#define SENINF2_CSI2_DETECT_DBG0_DETECT_SYNC_LANE0_ST_MASK (0x1 << 0)
> +#define SENINF2_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE0_ST_SHIFT 1
> +#define SENINF2_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE0_ST_MASK (0x1 << 1)
> +#define SENINF2_CSI2_DETECT_DBG0_DETECT_POST_LANE0_ST_SHIFT 2
> +#define SENINF2_CSI2_DETECT_DBG0_DETECT_POST_LANE0_ST_MASK (0x1 << 2)
> +#define SENINF2_CSI2_DETECT_DBG0_POSITION_SYNC_LANE0_ST_SHIFT 3
> +#define SENINF2_CSI2_DETECT_DBG0_POSITION_SYNC_LANE0_ST_MASK (0xf << 3)
> +#define SENINF2_CSI2_DETECT_DBG0_POSITION_ESCAPE_LANE0_ST_SHIFT 7
> +#define SENINF2_CSI2_DETECT_DBG0_POSITION_ESCAPE_LANE0_ST_MASK (0xf << 7)
> +#define SENINF2_CSI2_DETECT_DBG0_DETECT_SYNC_LANE1_ST_SHIFT 12
> +#define SENINF2_CSI2_DETECT_DBG0_DETECT_SYNC_LANE1_ST_MASK (0x1 << 12)
> +#define SENINF2_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE1_ST_SHIFT 13
> +#define SENINF2_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE1_ST_MASK (0x1 << 13)
> +#define SENINF2_CSI2_DETECT_DBG0_DETECT_POST_LANE1_ST_SHIFT 14
> +#define SENINF2_CSI2_DETECT_DBG0_DETECT_POST_LANE1_ST_MASK (0x1 << 14)
> +#define SENINF2_CSI2_DETECT_DBG0_POSITION_SYNC_LANE1_ST_SHIFT 15
> +#define SENINF2_CSI2_DETECT_DBG0_POSITION_SYNC_LANE1_ST_MASK (0xf << 15)
> +#define SENINF2_CSI2_DETECT_DBG0_POSITION_ESCAPE_LANE1_ST_SHIFT 19
> +#define SENINF2_CSI2_DETECT_DBG0_POSITION_ESCAPE_LANE1_ST_MASK (0xf << 19)
> +#define SENINF2_CSI2_DETECT_DBG0_DETECT_SYNC_LANE2_ST_SHIFT 24
> +#define SENINF2_CSI2_DETECT_DBG0_DETECT_SYNC_LANE2_ST_MASK (0x1 << 24)
> +#define SENINF2_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE2_ST_SHIFT 25
> +#define SENINF2_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE2_ST_MASK (0x1 << 25)
> +#define SENINF2_CSI2_DETECT_DBG0_DETECT_POST_LANE2_ST_SHIFT 26
> +#define SENINF2_CSI2_DETECT_DBG0_DETECT_POST_LANE2_ST_MASK (0x1 << 26)
> +#define SENINF2_CSI2_DETECT_DBG0_POSITION_SYNC_LANE2_ST_SHIFT 27
> +#define SENINF2_CSI2_DETECT_DBG0_POSITION_SYNC_LANE2_ST_MASK (0xf << 27)
> +#define SENINF2_CSI2_DETECT_DBG1                               0x1A70
> +#define SENINF2_CSI2_DETECT_DBG1_POSITION_ESCAPE_LANE2_ST_SHIFT 0
> +#define SENINF2_CSI2_DETECT_DBG1_POSITION_ESCAPE_LANE2_ST_MASK (0xf << 0)
> +#define SENINF2_CSI2_RESYNC_MERGE_CTL                          0x1A74
> +#define SENINF2_CSI2_RESYNC_MERGE_CTL_CPHY_LANE_RESYNC_CNT_SHIFT 0
> +#define SENINF2_CSI2_RESYNC_MERGE_CTL_CPHY_LANE_RESYNC_CNT_MASK (0x7 << 0)
> +#define SENINF2_CSI2_RESYNC_MERGE_CTL_LANE_RESYNC_FLUSH_EN_SHIFT 8
> +#define SENINF2_CSI2_RESYNC_MERGE_CTL_LANE_RESYNC_FLUSH_EN_MASK (0x1 << 8)
> +#define SENINF2_CSI2_RESYNC_MERGE_CTL_LANE_RESYNC_DATAOUT_OPTION_SHIFT 9
> +#define SENINF2_CSI2_RESYNC_MERGE_CTL_LANE_RESYNC_DATAOUT_OPTION_MASK \
> +(0x1 << 9)
> +#define SENINF2_CSI2_RESYNC_MERGE_CTL_BYPASS_LANE_RESYNC_SHIFT 10
> +#define SENINF2_CSI2_RESYNC_MERGE_CTL_BYPASS_LANE_RESYNC_MASK (0x1 << 10)
> +#define SENINF2_CSI2_RESYNC_MERGE_CTL_CDPHY_SEL_SHIFT 11
> +#define SENINF2_CSI2_RESYNC_MERGE_CTL_CDPHY_SEL_MASK (0x1 << 11)
> +#define SENINF2_CSI2_CTRL_TRIO_MUX                             0x1A78
> +#define SENINF2_CSI2_CTRL_TRIO_MUX_TRIO0_MUX_SHIFT 0
> +#define SENINF2_CSI2_CTRL_TRIO_MUX_TRIO0_MUX_MASK (0x7 << 0)
> +#define SENINF2_CSI2_CTRL_TRIO_MUX_TRIO1_MUX_SHIFT 3
> +#define SENINF2_CSI2_CTRL_TRIO_MUX_TRIO1_MUX_MASK (0x7 << 3)
> +#define SENINF2_CSI2_CTRL_TRIO_MUX_TRIO2_MUX_SHIFT 6
> +#define SENINF2_CSI2_CTRL_TRIO_MUX_TRIO2_MUX_MASK (0x7 << 6)
> +#define SENINF2_CSI2_CTRL_TRIO_MUX_TRIO3_MUX_SHIFT 9
> +#define SENINF2_CSI2_CTRL_TRIO_MUX_TRIO3_MUX_MASK (0x7 << 9)
> +#define SENINF2_CSI2_CTRL_TRIO_CON                             0x1A7C
> +#define SENINF2_CSI2_CTRL_TRIO_CON_TRIO0_LPRX_EN_SHIFT 0
> +#define SENINF2_CSI2_CTRL_TRIO_CON_TRIO0_LPRX_EN_MASK (0x1 << 0)
> +#define SENINF2_CSI2_CTRL_TRIO_CON_TRIO0_HSRX_EN_SHIFT 1
> +#define SENINF2_CSI2_CTRL_TRIO_CON_TRIO0_HSRX_EN_MASK (0x1 << 1)
> +#define SENINF2_CSI2_CTRL_TRIO_CON_TRIO1_LPRX_EN_SHIFT 2
> +#define SENINF2_CSI2_CTRL_TRIO_CON_TRIO1_LPRX_EN_MASK (0x1 << 2)
> +#define SENINF2_CSI2_CTRL_TRIO_CON_TRIO1_HSRX_EN_SHIFT 3
> +#define SENINF2_CSI2_CTRL_TRIO_CON_TRIO1_HSRX_EN_MASK (0x1 << 3)
> +#define SENINF2_CSI2_CTRL_TRIO_CON_TRIO2_LPRX_EN_SHIFT 4
> +#define SENINF2_CSI2_CTRL_TRIO_CON_TRIO2_LPRX_EN_MASK (0x1 << 4)
> +#define SENINF2_CSI2_CTRL_TRIO_CON_TRIO2_HSRX_EN_SHIFT 5
> +#define SENINF2_CSI2_CTRL_TRIO_CON_TRIO2_HSRX_EN_MASK (0x1 << 5)
> +#define SENINF2_CSI2_CTRL_TRIO_CON_TRIO3_LPRX_EN_SHIFT 6
> +#define SENINF2_CSI2_CTRL_TRIO_CON_TRIO3_LPRX_EN_MASK (0x1 << 6)
> +#define SENINF2_CSI2_CTRL_TRIO_CON_TRIO3_HSRX_EN_SHIFT 7
> +#define SENINF2_CSI2_CTRL_TRIO_CON_TRIO3_HSRX_EN_MASK (0x1 << 7)
> +#define SENINF2_FIX_ADDR_CPHY0_DBG                             0x1A80
> +#define SENINF2_FIX_ADDR_CPHY0_DBG_ERROR_COUNT_CPHY0_SHIFT 16
> +#define SENINF2_FIX_ADDR_CPHY0_DBG_ERROR_COUNT_CPHY0_MASK (0xff << 16)
> +#define SENINF2_FIX_ADDR_CPHY0_DBG_WORD_COUNT_OVER_FLOAT_CPHY0_SHIFT 24
> +#define SENINF2_FIX_ADDR_CPHY0_DBG_WORD_COUNT_OVER_FLOAT_CPHY0_MASK (0x1 << 24)
> +#define SENINF2_FIX_ADDR_CPHY1_DBG                             0x1A84
> +#define SENINF2_FIX_ADDR_CPHY1_DBG_ERROR_COUNT_CPHY1_SHIFT 16
> +#define SENINF2_FIX_ADDR_CPHY1_DBG_ERROR_COUNT_CPHY1_MASK (0xff << 16)
> +#define SENINF2_FIX_ADDR_CPHY1_DBG_WORD_COUNT_OVER_FLOAT_CPHY1_SHIFT 24
> +#define SENINF2_FIX_ADDR_CPHY1_DBG_WORD_COUNT_OVER_FLOAT_CPHY1_MASK (0x1 << 24)
> +#define SENINF2_FIX_ADDR_CPHY2_DBG                             0x1A88
> +#define SENINF2_FIX_ADDR_CPHY2_DBG_ERROR_COUNT_CPHY2_SHIFT 16
> +#define SENINF2_FIX_ADDR_CPHY2_DBG_ERROR_COUNT_CPHY2_MASK (0xff << 16)
> +#define SENINF2_FIX_ADDR_CPHY2_DBG_WORD_COUNT_OVER_FLOAT_CPHY2_SHIFT 24
> +#define SENINF2_FIX_ADDR_CPHY2_DBG_WORD_COUNT_OVER_FLOAT_CPHY2_MASK (0x1 << 24)
> +#define SENINF2_FIX_ADDR_DBG                                   0x1A8C
> +#define SENINF2_FIX_ADDR_DBG_ERROR_COUNT_SHIFT 16
> +#define SENINF2_FIX_ADDR_DBG_ERROR_COUNT_MASK  (0xff << 16)
> +#define SENINF2_FIX_ADDR_DBG_WORD_COUNT_OVER_FLOAT_SHIFT 24
> +#define SENINF2_FIX_ADDR_DBG_WORD_COUNT_OVER_FLOAT_MASK (0x1 << 24)
> +#define SENINF2_WIRE_STATE_DECODE_CPHY0_DBG0                   0x1A90
> +#define SENINF2_WIRE_STATE_DECODE_CPHY0_DBG0_SYMBOL_STREAM0_CPHY0_SHIFT 0
> +#define SENINF2_WIRE_STATE_DECODE_CPHY0_DBG0_SYMBOL_STREAM0_CPHY0_MASK \
> +(0xffffffff << 0)
> +#define SENINF2_WIRE_STATE_DECODE_CPHY0_DBG1                   0x1A94
> +#define SENINF2_WIRE_STATE_DECODE_CPHY0_DBG1_SYMBOL_STREAM1_CPHY0_SHIFT 0
> +#define SENINF2_WIRE_STATE_DECODE_CPHY0_DBG1_SYMBOL_STREAM1_CPHY0_MASK \
> +(0x3ff << 0)
> +#define SENINF2_WIRE_STATE_DECODE_CPHY0_DBG1_SYMBOL_STREAM_VALID_CPHY0_SHIFT 10
> +#define SENINF2_WIRE_STATE_DECODE_CPHY0_DBG1_SYMBOL_STREAM_VALID_CPHY0_MASK \
> +(0x1 << 10)
> +#define SENINF2_WIRE_STATE_DECODE_CPHY1_DBG0                   0x1A98
> +#define SENINF2_WIRE_STATE_DECODE_CPHY1_DBG0_SYMBOL_STREAM0_CPHY1_SHIFT 0
> +#define SENINF2_WIRE_STATE_DECODE_CPHY1_DBG0_SYMBOL_STREAM0_CPHY1_MASK \
> +(0xffffffff << 0)
> +#define SENINF2_WIRE_STATE_DECODE_CPHY1_DBG1                   0x1A9C
> +#define SENINF2_WIRE_STATE_DECODE_CPHY1_DBG1_SYMBOL_STREAM1_CPHY1_SHIFT 0
> +#define SENINF2_WIRE_STATE_DECODE_CPHY1_DBG1_SYMBOL_STREAM1_CPHY1_MASK \
> +(0x3ff << 0)
> +#define SENINF2_WIRE_STATE_DECODE_CPHY1_DBG1_SYMBOL_STREAM_VALID_CPHY1_SHIFT 10
> +#define SENINF2_WIRE_STATE_DECODE_CPHY1_DBG1_SYMBOL_STREAM_VALID_CPHY1_MASK \
> +(0x1 << 10)
> +#define SENINF2_WIRE_STATE_DECODE_CPHY2_DBG0                   0x1AA0
> +#define SENINF2_WIRE_STATE_DECODE_CPHY2_DBG0_SYMBOL_STREAM0_CPHY2_SHIFT 0
> +#define SENINF2_WIRE_STATE_DECODE_CPHY2_DBG0_SYMBOL_STREAM0_CPHY2_MASK \
> +(0xffffffff << 0)
> +#define SENINF2_WIRE_STATE_DECODE_CPHY2_DBG1                   0x1AA4
> +#define SENINF2_WIRE_STATE_DECODE_CPHY2_DBG1_SYMBOL_STREAM1_CPHY2_SHIFT 0
> +#define SENINF2_WIRE_STATE_DECODE_CPHY2_DBG1_SYMBOL_STREAM1_CPHY2_MASK \
> +(0x3ff << 0)
> +#define SENINF2_WIRE_STATE_DECODE_CPHY2_DBG1_SYMBOL_STREAM_VALID_CPHY2_SHIFT 10
> +#define SENINF2_WIRE_STATE_DECODE_CPHY2_DBG1_SYMBOL_STREAM_VALID_CPHY2_MASK \
> +(0x1 << 10)
> +#define SENINF2_SYNC_RESYNC_CTL                                0x1AA8
> +#define SENINF2_SYNC_RESYNC_CTL_SYNC_DETECTION_SEL_SHIFT 0
> +#define SENINF2_SYNC_RESYNC_CTL_SYNC_DETECTION_SEL_MASK (0x7 << 0)
> +#define SENINF2_SYNC_RESYNC_CTL_FLUSH_VALID_SHIFT 3
> +#define SENINF2_SYNC_RESYNC_CTL_FLUSH_VALID_MASK (0x1 << 3)
> +#define SENINF2_POST_DETECT_CTL                                0x1AAC
> +#define SENINF2_POST_DETECT_CTL_POST_DETECT_DISABLE_SHIFT 0
> +#define SENINF2_POST_DETECT_CTL_POST_DETECT_DISABLE_MASK (0x1 << 0)
> +#define SENINF2_POST_DETECT_CTL_POST_EN_SHIFT  1
> +#define SENINF2_POST_DETECT_CTL_POST_EN_MASK   (0x1 << 1)
> +#define SENINF2_WIRE_STATE_DECODE_CONFIG                       0x1AB0
> +#define SENINF2_WIRE_STATE_DECODE_CONFIG_INIT_STATE_DECODE_SHIFT 0
> +#define SENINF2_WIRE_STATE_DECODE_CONFIG_INIT_STATE_DECODE_MASK (0x7 << 0)
> +#define SENINF2_CSI2_CPHY_LNRD_FSM                             0x1AB4
> +#define SENINF2_CSI2_CPHY_LNRD_FSM_TRIO0_RX_FSM_SHIFT 8
> +#define SENINF2_CSI2_CPHY_LNRD_FSM_TRIO0_RX_FSM_MASK (0x7f << 8)
> +#define SENINF2_CSI2_CPHY_LNRD_FSM_TRIO1_RX_FSM_SHIFT 16
> +#define SENINF2_CSI2_CPHY_LNRD_FSM_TRIO1_RX_FSM_MASK (0x7f << 16)
> +#define SENINF2_CSI2_CPHY_LNRD_FSM_TRIO2_RX_FSM_SHIFT 24
> +#define SENINF2_CSI2_CPHY_LNRD_FSM_TRIO2_RX_FSM_MASK (0x7f << 24)
> +#define SENINF2_FIX_ADDR_CPHY0_DBG0                            0x1AB8
> +#define SENINF2_FIX_ADDR_CPHY0_DBG0_WORD_COUNT_CPHY0_DBG0_SHIFT 0
> +#define SENINF2_FIX_ADDR_CPHY0_DBG0_WORD_COUNT_CPHY0_DBG0_MASK \
> +(0xffffffff << 0)
> +#define SENINF2_FIX_ADDR_CPHY0_DBG1                            0x1ABC
> +#define SENINF2_FIX_ADDR_CPHY0_DBG1_WORD_COUNT_CPHY0_DBG1_SHIFT 0
> +#define SENINF2_FIX_ADDR_CPHY0_DBG1_WORD_COUNT_CPHY0_DBG1_MASK (0xffff << 0)
> +#define SENINF2_FIX_ADDR_CPHY0_DBG1_ERROR_RECORD_CPHY0_DBG0_SHIFT 16
> +#define SENINF2_FIX_ADDR_CPHY0_DBG1_ERROR_RECORD_CPHY0_DBG0_MASK (0xffff << 16)
> +#define SENINF2_FIX_ADDR_CPHY0_DBG2                            0x1AC0
> +#define SENINF2_FIX_ADDR_CPHY0_DBG2_ERROR_RECORD_CPHY0_DBG1_SHIFT 0
> +#define SENINF2_FIX_ADDR_CPHY0_DBG2_ERROR_RECORD_CPHY0_DBG1_MASK \
> +(0xffffffff << 0)
> +#define SENINF2_FIX_ADDR_CPHY1_DBG0                            0x1AC4
> +#define SENINF2_FIX_ADDR_CPHY1_DBG0_WORD_COUNT_CPHY1_DBG0_SHIFT 0
> +#define SENINF2_FIX_ADDR_CPHY1_DBG0_WORD_COUNT_CPHY1_DBG0_MASK \
> +(0xffffffff << 0)
> +#define SENINF2_FIX_ADDR_CPHY1_DBG1                            0x1AC8
> +#define SENINF2_FIX_ADDR_CPHY1_DBG1_WORD_COUNT_CPHY1_DBG1_SHIFT 0
> +#define SENINF2_FIX_ADDR_CPHY1_DBG1_WORD_COUNT_CPHY1_DBG1_MASK (0xffff << 0)
> +#define SENINF2_FIX_ADDR_CPHY1_DBG1_ERROR_RECORD_CPHY1_DBG0_SHIFT 16
> +#define SENINF2_FIX_ADDR_CPHY1_DBG1_ERROR_RECORD_CPHY1_DBG0_MASK (0xffff << 16)
> +#define SENINF2_FIX_ADDR_CPHY1_DBG2                            0x1ACC
> +#define SENINF2_FIX_ADDR_CPHY1_DBG2_ERROR_RECORD_CPHY1_DBG1_SHIFT 0
> +#define SENINF2_FIX_ADDR_CPHY1_DBG2_ERROR_RECORD_CPHY1_DBG1_MASK \
> +(0xffffffff << 0)
> +#define SENINF2_FIX_ADDR_CPHY2_DBG0                            0x1AD0
> +#define SENINF2_FIX_ADDR_CPHY2_DBG0_WORD_COUNT_CPHY2_DBG0_SHIFT 0
> +#define SENINF2_FIX_ADDR_CPHY2_DBG0_WORD_COUNT_CPHY2_DBG0_MASK \
> +(0xffffffff << 0)
> +#define SENINF2_FIX_ADDR_CPHY2_DBG1                            0x1AD4
> +#define SENINF2_FIX_ADDR_CPHY2_DBG1_WORD_COUNT_CPHY2_DBG1_SHIFT 0
> +#define SENINF2_FIX_ADDR_CPHY2_DBG1_WORD_COUNT_CPHY2_DBG1_MASK (0xffff << 0)
> +#define SENINF2_FIX_ADDR_CPHY2_DBG1_ERROR_RECORD_CPHY2_DBG0_SHIFT 16
> +#define SENINF2_FIX_ADDR_CPHY2_DBG1_ERROR_RECORD_CPHY2_DBG0_MASK \
> +(0xffff << 16)
> +#define SENINF2_FIX_ADDR_CPHY2_DBG2                            0x1AD8
> +#define SENINF2_FIX_ADDR_CPHY2_DBG2_ERROR_RECORD_CPHY2_DBG1_SHIFT 0
> +#define SENINF2_FIX_ADDR_CPHY2_DBG2_ERROR_RECORD_CPHY2_DBG1_MASK \
> +(0xffffffff << 0)
> +#define SENINF2_FIX_ADDR_DBG0                                  0x1ADC
> +#define SENINF2_FIX_ADDR_DBG0_WORD_COUNT_DBG0_SHIFT 0
> +#define SENINF2_FIX_ADDR_DBG0_WORD_COUNT_DBG0_MASK (0xffffffff << 0)
> +#define SENINF2_FIX_ADDR_DBG1                                  0x1AE0
> +#define SENINF2_FIX_ADDR_DBG1_WORD_COUNT_DBG1_SHIFT 0
> +#define SENINF2_FIX_ADDR_DBG1_WORD_COUNT_DBG1_MASK (0xffff << 0)
> +#define SENINF2_FIX_ADDR_DBG1_ERROR_RECORD_DBG0_SHIFT 16
> +#define SENINF2_FIX_ADDR_DBG1_ERROR_RECORD_DBG0_MASK (0xffff << 16)
> +#define SENINF2_FIX_ADDR_DBG2                                  0x1AE4
> +#define SENINF2_FIX_ADDR_DBG2_ERROR_RECORD_DBG1_SHIFT 0
> +#define SENINF2_FIX_ADDR_DBG2_ERROR_RECORD_DBG1_MASK (0xffffffff << 0)
> +#define SENINF2_CSI2_MODE                                      0x1AE8
> +#define SENINF2_CSI2_MODE_CSR_CSI2_MODE_SHIFT  0
> +#define SENINF2_CSI2_MODE_CSR_CSI2_MODE_MASK   (0xff << 0)
> +#define SENINF2_CSI2_MODE_CSR_CSI2_HEADER_LEN_SHIFT 8
> +#define SENINF2_CSI2_MODE_CSR_CSI2_HEADER_LEN_MASK (0x7 << 8)
> +#define SENINF2_CSI2_MODE_CSR_CPHY_DI_POS_SHIFT 16
> +#define SENINF2_CSI2_MODE_CSR_CPHY_DI_POS_MASK (0xff << 16)
> +#define SENINF2_CSI2_MODE_CSR_CPHY_WC_POS_SHIFT 24
> +#define SENINF2_CSI2_MODE_CSR_CPHY_WC_POS_MASK (0xff << 24)
> +#define SENINF2_CSI2_DI_EXT                                    0x1AF0
> +#define SENINF2_CSI2_DI_EXT_VC4_SHIFT          0
> +#define SENINF2_CSI2_DI_EXT_VC4_MASK           (0x3 << 0)
> +#define SENINF2_CSI2_DI_EXT_DT4_SHIFT          2
> +#define SENINF2_CSI2_DI_EXT_DT4_MASK           (0x3f << 2)
> +#define SENINF2_CSI2_DI_EXT_VC5_SHIFT          8
> +#define SENINF2_CSI2_DI_EXT_VC5_MASK           (0x3 << 8)
> +#define SENINF2_CSI2_DI_EXT_DT5_SHIFT          10
> +#define SENINF2_CSI2_DI_EXT_DT5_MASK           (0x3f << 10)
> +#define SENINF2_CSI2_DI_CTRL_EXT                               0x1AF4
> +#define SENINF2_CSI2_DI_CTRL_EXT_VC4_INTERLEAVING_SHIFT 0
> +#define SENINF2_CSI2_DI_CTRL_EXT_VC4_INTERLEAVING_MASK (0x1 << 0)
> +#define SENINF2_CSI2_DI_CTRL_EXT_DT4_INTERLEAVING_SHIFT 1
> +#define SENINF2_CSI2_DI_CTRL_EXT_DT4_INTERLEAVING_MASK (0x3 << 1)
> +#define SENINF2_CSI2_DI_CTRL_EXT_VC5_INTERLEAVING_SHIFT 8
> +#define SENINF2_CSI2_DI_CTRL_EXT_VC5_INTERLEAVING_MASK (0x1 << 8)
> +#define SENINF2_CSI2_DI_CTRL_EXT_DT5_INTERLEAVING_SHIFT 9
> +#define SENINF2_CSI2_DI_CTRL_EXT_DT5_INTERLEAVING_MASK (0x3 << 9)
> +#define SENINF2_CSI2_CPHY_LOOPBACK                             0x1AF8
> +#define SENINF2_CSI2_CPHY_LOOPBACK_TRIGGER_SYNC_INIT_SHIFT 0
> +#define SENINF2_CSI2_CPHY_LOOPBACK_TRIGGER_SYNC_INIT_MASK (0x1 << 0)
> +#define SENINF2_CSI2_CPHY_LOOPBACK_RELEASE_SYNC_INIT_SHIFT 1
> +#define SENINF2_CSI2_CPHY_LOOPBACK_RELEASE_SYNC_INIT_MASK (0x1 << 1)
> +#define SENINF2_CSI2_PROGSEQ_0                                 0x1B00
> +#define SENINF2_CSI2_PROGSEQ_0_PROGSEQ_S0_SHIFT 0
> +#define SENINF2_CSI2_PROGSEQ_0_PROGSEQ_S0_MASK (0x7 << 0)
> +#define SENINF2_CSI2_PROGSEQ_0_PROGSEQ_S1_SHIFT 4
> +#define SENINF2_CSI2_PROGSEQ_0_PROGSEQ_S1_MASK (0x7 << 4)
> +#define SENINF2_CSI2_PROGSEQ_0_PROGSEQ_S2_SHIFT 8
> +#define SENINF2_CSI2_PROGSEQ_0_PROGSEQ_S2_MASK (0x7 << 8)
> +#define SENINF2_CSI2_PROGSEQ_0_PROGSEQ_S3_SHIFT 12
> +#define SENINF2_CSI2_PROGSEQ_0_PROGSEQ_S3_MASK (0x7 << 12)
> +#define SENINF2_CSI2_PROGSEQ_0_PROGSEQ_S4_SHIFT 16
> +#define SENINF2_CSI2_PROGSEQ_0_PROGSEQ_S4_MASK (0x7 << 16)
> +#define SENINF2_CSI2_PROGSEQ_0_PROGSEQ_S5_SHIFT 20
> +#define SENINF2_CSI2_PROGSEQ_0_PROGSEQ_S5_MASK (0x7 << 20)
> +#define SENINF2_CSI2_PROGSEQ_0_PROGSEQ_S6_SHIFT 24
> +#define SENINF2_CSI2_PROGSEQ_0_PROGSEQ_S6_MASK (0x7 << 24)
> +#define SENINF2_CSI2_PROGSEQ_0_PROGSEQ_S7_SHIFT 28
> +#define SENINF2_CSI2_PROGSEQ_0_PROGSEQ_S7_MASK (0x7 << 28)
> +#define SENINF2_CSI2_PROGSEQ_1                                 0x1B04
> +#define SENINF2_CSI2_PROGSEQ_1_PROGSEQ_S8_SHIFT 0
> +#define SENINF2_CSI2_PROGSEQ_1_PROGSEQ_S8_MASK (0x7 << 0)
> +#define SENINF2_CSI2_PROGSEQ_1_PROGSEQ_S9_SHIFT 4
> +#define SENINF2_CSI2_PROGSEQ_1_PROGSEQ_S9_MASK (0x7 << 4)
> +#define SENINF2_CSI2_PROGSEQ_1_PROGSEQ_S10_SHIFT 8
> +#define SENINF2_CSI2_PROGSEQ_1_PROGSEQ_S10_MASK (0x7 << 8)
> +#define SENINF2_CSI2_PROGSEQ_1_PROGSEQ_S11_SHIFT 12
> +#define SENINF2_CSI2_PROGSEQ_1_PROGSEQ_S11_MASK (0x7 << 12)
> +#define SENINF2_CSI2_PROGSEQ_1_PROGSEQ_S12_SHIFT 16
> +#define SENINF2_CSI2_PROGSEQ_1_PROGSEQ_S12_MASK (0x7 << 16)
> +#define SENINF2_CSI2_PROGSEQ_1_PROGSEQ_S13_SHIFT 20
> +#define SENINF2_CSI2_PROGSEQ_1_PROGSEQ_S13_MASK (0x7 << 20)
> +#define SENINF2_CSI2_INT_EN_EXT                                0x1B10
> +#define SENINF2_CSI2_INT_EN_EXT_DPHY0_RESYNC_FIFO_OVERFLOW_SHIFT 1
> +#define SENINF2_CSI2_INT_EN_EXT_DPHY0_RESYNC_FIFO_OVERFLOW_MASK (0x1 << 1)
> +#define SENINF2_CSI2_INT_EN_EXT_DPHY1_RESYNC_FIFO_OVERFLOW_SHIFT 2
> +#define SENINF2_CSI2_INT_EN_EXT_DPHY1_RESYNC_FIFO_OVERFLOW_MASK (0x1 << 2)
> +#define SENINF2_CSI2_INT_EN_EXT_DPHY2_RESYNC_FIFO_OVERFLOW_SHIFT 3
> +#define SENINF2_CSI2_INT_EN_EXT_DPHY2_RESYNC_FIFO_OVERFLOW_MASK (0x1 << 3)
> +#define SENINF2_CSI2_INT_EN_EXT_DPHY3_RESYNC_FIFO_OVERFLOW_SHIFT 4
> +#define SENINF2_CSI2_INT_EN_EXT_DPHY3_RESYNC_FIFO_OVERFLOW_MASK (0x1 << 4)
> +#define SENINF2_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO0_SHIFT 8
> +#define SENINF2_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO0_MASK (0x1 << 8)
> +#define SENINF2_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO1_SHIFT 9
> +#define SENINF2_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO1_MASK (0x1 << 9)
> +#define SENINF2_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO2_SHIFT 10
> +#define SENINF2_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO2_MASK (0x1 << 10)
> +#define SENINF2_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO3_SHIFT 11
> +#define SENINF2_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO3_MASK (0x1 << 11)
> +#define SENINF2_CSI2_INT_EN_EXT_INT_WCLR_EN_SHIFT 31
> +#define SENINF2_CSI2_INT_EN_EXT_INT_WCLR_EN_MASK (0x1 << 31)
> +#define SENINF2_CSI2_INT_STATUS_EXT                            0x1B14
> +#define SENINF2_CSI2_INT_STATUS_EXT_DPHY0_RESYNC_FIFO_OVERFLOW_STA_SHIFT 1
> +#define SENINF2_CSI2_INT_STATUS_EXT_DPHY0_RESYNC_FIFO_OVERFLOW_STA_MASK \
> +(0x1 << 1)
> +#define SENINF2_CSI2_INT_STATUS_EXT_DPHY1_RESYNC_FIFO_OVERFLOW_STA_SHIFT 2
> +#define SENINF2_CSI2_INT_STATUS_EXT_DPHY1_RESYNC_FIFO_OVERFLOW_STA_MASK \
> +(0x1 << 2)
> +#define SENINF2_CSI2_INT_STATUS_EXT_DPHY2_RESYNC_FIFO_OVERFLOW_STA_SHIFT 3
> +#define SENINF2_CSI2_INT_STATUS_EXT_DPHY2_RESYNC_FIFO_OVERFLOW_STA_MASK \
> +(0x1 << 3)
> +#define SENINF2_CSI2_INT_STATUS_EXT_DPHY3_RESYNC_FIFO_OVERFLOW_STA_SHIFT 4
> +#define SENINF2_CSI2_INT_STATUS_EXT_DPHY3_RESYNC_FIFO_OVERFLOW_STA_MASK \
> +(0x1 << 4)
> +#define SENINF2_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO0_SHIFT 8
> +#define SENINF2_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO0_MASK (0x1 << 8)
> +#define SENINF2_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO1_SHIFT 9
> +#define SENINF2_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO1_MASK (0x1 << 9)
> +#define SENINF2_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO2_SHIFT 10
> +#define SENINF2_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO2_MASK (0x1 << 10)
> +#define SENINF2_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO3_SHIFT 11
> +#define SENINF2_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO3_MASK (0x1 << 11)
> +#define SENINF2_CSI2_CPHY_FIX_POINT_RST                        0x1B18
> +#define SENINF2_CSI2_CPHY_FIX_POINT_RST_CPHY_FIX_POINT_RST_SHIFT 0
> +#define SENINF2_CSI2_CPHY_FIX_POINT_RST_CPHY_FIX_POINT_RST_MASK (0x1 << 0)
> +#define SENINF2_CSI2_CPHY_FIX_POINT_RST_CPHY_FIX_POINT_RST_MODE_SHIFT 1
> +#define SENINF2_CSI2_CPHY_FIX_POINT_RST_CPHY_FIX_POINT_RST_MODE_MASK (0x1 << 1)
> +#define SENINF2_CSI2_RLR3_CON0                                 0x1B1C
> +#define SENINF2_CSI2_RLR3_CON0_RLR3_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF2_CSI2_RLR3_CON0_RLR3_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF2_CSI2_RLR3_CON0_RLR3_PRBS_SEED_0_SHIFT 8
> +#define SENINF2_CSI2_RLR3_CON0_RLR3_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF2_CSI2_RLR3_CON0_RLR3_PRBS_SEED_1_SHIFT 16
> +#define SENINF2_CSI2_RLR3_CON0_RLR3_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF2_CSI2_RLR3_CON0_RLR3_PRBS_SEED_2_SHIFT 24
> +#define SENINF2_CSI2_RLR3_CON0_RLR3_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF2_CSI2_DPHY_SYNC                                 0x1B20
> +#define SENINF2_CSI2_DPHY_SYNC_SYNC_SEQ_MASK_0_SHIFT 0
> +#define SENINF2_CSI2_DPHY_SYNC_SYNC_SEQ_MASK_0_MASK (0xffff << 0)
> +#define SENINF2_CSI2_DPHY_SYNC_SYNC_SEQ_PAT_0_SHIFT 16
> +#define SENINF2_CSI2_DPHY_SYNC_SYNC_SEQ_PAT_0_MASK (0xffff << 16)
> +#define SENINF2_CSI2_DESKEW_SYNC                               0x1B24
> +#define SENINF2_CSI2_DESKEW_SYNC_SYNC_SEQ_MASK_1_SHIFT 0
> +#define SENINF2_CSI2_DESKEW_SYNC_SYNC_SEQ_MASK_1_MASK (0xffff << 0)
> +#define SENINF2_CSI2_DESKEW_SYNC_SYNC_SEQ_PAT_1_SHIFT 16
> +#define SENINF2_CSI2_DESKEW_SYNC_SYNC_SEQ_PAT_1_MASK (0xffff << 16)
> +#define SENINF2_CSI2_DETECT_DBG2                               0x1B28
> +#define SENINF2_CSI2_DETECT_DBG2_DETECT_SYNC_LANE3_ST_SHIFT 0
> +#define SENINF2_CSI2_DETECT_DBG2_DETECT_SYNC_LANE3_ST_MASK (0x1 << 0)
> +#define SENINF2_CSI2_DETECT_DBG2_DETECT_ESCAPE_LANE3_ST_SHIFT 1
> +#define SENINF2_CSI2_DETECT_DBG2_DETECT_ESCAPE_LANE3_ST_MASK (0x1 << 1)
> +#define SENINF2_CSI2_DETECT_DBG2_DETECT_POST_LANE3_ST_SHIFT 2
> +#define SENINF2_CSI2_DETECT_DBG2_DETECT_POST_LANE3_ST_MASK (0x1 << 2)
> +#define SENINF2_CSI2_DETECT_DBG2_POSITION_SYNC_LANE3_ST_SHIFT 3
> +#define SENINF2_CSI2_DETECT_DBG2_POSITION_SYNC_LANE3_ST_MASK (0xf << 3)
> +#define SENINF2_CSI2_DETECT_DBG2_POSITION_ESCAPE_LANE3_ST_SHIFT 7
> +#define SENINF2_CSI2_DETECT_DBG2_POSITION_ESCAPE_LANE3_ST_MASK (0xf << 7)
> +#define SENINF2_FIX_ADDR_CPHY3_DBG0                            0x1B30
> +#define SENINF2_FIX_ADDR_CPHY3_DBG0_WORD_COUNT_CPHY3_DBG0_SHIFT 0
> +#define SENINF2_FIX_ADDR_CPHY3_DBG0_WORD_COUNT_CPHY3_DBG0_MASK \
> +(0xffffffff << 0)
> +#define SENINF2_FIX_ADDR_CPHY3_DBG1                            0x1B34
> +#define SENINF2_FIX_ADDR_CPHY3_DBG1_WORD_COUNT_CPHY3_DBG1_SHIFT 0
> +#define SENINF2_FIX_ADDR_CPHY3_DBG1_WORD_COUNT_CPHY3_DBG1_MASK \
> +(0xffff << 0)
> +#define SENINF2_FIX_ADDR_CPHY3_DBG1_ERROR_RECORD_CPHY3_DBG0_SHIFT 16
> +#define SENINF2_FIX_ADDR_CPHY3_DBG1_ERROR_RECORD_CPHY3_DBG0_MASK \
> +(0xffff << 16)
> +#define SENINF2_FIX_ADDR_CPHY3_DBG2                            0x1B38
> +#define SENINF2_FIX_ADDR_CPHY3_DBG2_ERROR_RECORD_CPHY3_DBG1_SHIFT 0
> +#define SENINF2_FIX_ADDR_CPHY3_DBG2_ERROR_RECORD_CPHY3_DBG1_MASK \
> +(0xffffffff << 0)
> +#define SENINF2_CSI2_DI_EXT_2                                  0x1B3C
> +#define SENINF2_CSI2_DI_EXT_2_VC6_SHIFT        0
> +#define SENINF2_CSI2_DI_EXT_2_VC6_MASK         (0x3 << 0)
> +#define SENINF2_CSI2_DI_EXT_2_DT6_SHIFT        2
> +#define SENINF2_CSI2_DI_EXT_2_DT6_MASK         (0x3f << 2)
> +#define SENINF2_CSI2_DI_EXT_2_VC7_SHIFT        8
> +#define SENINF2_CSI2_DI_EXT_2_VC7_MASK         (0x3 << 8)
> +#define SENINF2_CSI2_DI_EXT_2_DT7_SHIFT        10
> +#define SENINF2_CSI2_DI_EXT_2_DT7_MASK         (0x3f << 10)
> +#define SENINF2_CSI2_DI_CTRL_EXT_2                             0x1B40
> +#define SENINF2_CSI2_DI_CTRL_EXT_2_VC6_INTERLEAVING_SHIFT 0
> +#define SENINF2_CSI2_DI_CTRL_EXT_2_VC6_INTERLEAVING_MASK (0x1 << 0)
> +#define SENINF2_CSI2_DI_CTRL_EXT_2_DT6_INTERLEAVING_SHIFT 1
> +#define SENINF2_CSI2_DI_CTRL_EXT_2_DT6_INTERLEAVING_MASK (0x3 << 1)
> +#define SENINF2_CSI2_DI_CTRL_EXT_2_VC7_INTERLEAVING_SHIFT 8
> +#define SENINF2_CSI2_DI_CTRL_EXT_2_VC7_INTERLEAVING_MASK (0x1 << 8)
> +#define SENINF2_CSI2_DI_CTRL_EXT_2_DT7_INTERLEAVING_SHIFT 9
> +#define SENINF2_CSI2_DI_CTRL_EXT_2_DT7_INTERLEAVING_MASK (0x3 << 9)
> +#define SENINF2_WIRE_STATE_DECODE_CPHY3_DBG0                   0x1B44
> +#define SENINF2_WIRE_STATE_DECODE_CPHY3_DBG0_SYMBOL_STREAM0_CPHY3_SHIFT 0
> +#define SENINF2_WIRE_STATE_DECODE_CPHY3_DBG0_SYMBOL_STREAM0_CPHY3_MASK \
> +(0xffffffff << 0)
> +#define SENINF2_WIRE_STATE_DECODE_CPHY3_DBG1                   0x1B48
> +#define SENINF2_WIRE_STATE_DECODE_CPHY3_DBG1_SYMBOL_STREAM1_CPHY3_SHIFT 0
> +#define SENINF2_WIRE_STATE_DECODE_CPHY3_DBG1_SYMBOL_STREAM1_CPHY3_MASK \
> +(0x3ff << 0)
> +#define SENINF2_WIRE_STATE_DECODE_CPHY3_DBG1_SYMBOL_STREAM_VALID_CPHY3_SHIFT 10
> +#define SENINF2_WIRE_STATE_DECODE_CPHY3_DBG1_SYMBOL_STREAM_VALID_CPHY3_MASK \
> +(0x1 << 10)
> +#define SENINF2_MUX_CTRL                                       0x1D00
> +#define SENINF2_MUX_CTRL_SENINF_MUX_SW_RST_SHIFT 0
> +#define SENINF2_MUX_CTRL_SENINF_MUX_SW_RST_MASK (0x1 << 0)
> +#define SENINF2_MUX_CTRL_SENINF_IRQ_SW_RST_SHIFT 1
> +#define SENINF2_MUX_CTRL_SENINF_IRQ_SW_RST_MASK (0x1 << 1)
> +#define SENINF2_MUX_CTRL_SENINF_MUX_RDY_MODE_SHIFT 4
> +#define SENINF2_MUX_CTRL_SENINF_MUX_RDY_MODE_MASK (0x1 << 4)
> +#define SENINF2_MUX_CTRL_SENINF_MUX_RDY_VALUE_SHIFT 5
> +#define SENINF2_MUX_CTRL_SENINF_MUX_RDY_VALUE_MASK (0x1 << 5)
> +#define SENINF2_MUX_CTRL_SENINF_HSYNC_MASK_SHIFT 7
> +#define SENINF2_MUX_CTRL_SENINF_HSYNC_MASK_MASK (0x1 << 7)
> +#define SENINF2_MUX_CTRL_SENINF_PIX_SEL_SHIFT  8
> +#define SENINF2_MUX_CTRL_SENINF_PIX_SEL_MASK   (0x1 << 8)
> +#define SENINF2_MUX_CTRL_SENINF_VSYNC_POL_SHIFT 9
> +#define SENINF2_MUX_CTRL_SENINF_VSYNC_POL_MASK (0x1 << 9)
> +#define SENINF2_MUX_CTRL_SENINF_HSYNC_POL_SHIFT 10
> +#define SENINF2_MUX_CTRL_SENINF_HSYNC_POL_MASK (0x1 << 10)
> +#define SENINF2_MUX_CTRL_OVERRUN_RST_EN_SHIFT  11
> +#define SENINF2_MUX_CTRL_OVERRUN_RST_EN_MASK   (0x1 << 11)
> +#define SENINF2_MUX_CTRL_SENINF_SRC_SEL_SHIFT  12
> +#define SENINF2_MUX_CTRL_SENINF_SRC_SEL_MASK   (0xf << 12)
> +#define SENINF2_MUX_CTRL_FIFO_PUSH_EN_SHIFT    16
> +#define SENINF2_MUX_CTRL_FIFO_PUSH_EN_MASK     (0x3f << 16)
> +#define SENINF2_MUX_CTRL_FIFO_FLUSH_EN_SHIFT   22
> +#define SENINF2_MUX_CTRL_FIFO_FLUSH_EN_MASK    (0x3f << 22)
> +#define SENINF2_MUX_CTRL_FIFO_FULL_WR_EN_SHIFT 28
> +#define SENINF2_MUX_CTRL_FIFO_FULL_WR_EN_MASK  (0x3 << 28)
> +#define SENINF2_MUX_CTRL_CROP_EN_SHIFT         30
> +#define SENINF2_MUX_CTRL_CROP_EN_MASK          (0x1 << 30)
> +#define SENINF2_MUX_CTRL_SENINF_MUX_EN_SHIFT   31
> +#define SENINF2_MUX_CTRL_SENINF_MUX_EN_MASK    (0x1 << 31)
> +#define SENINF2_MUX_INTEN                                      0x1D04
> +#define SENINF2_MUX_INTEN_SENINF_OVERRUN_IRQ_EN_SHIFT 0
> +#define SENINF2_MUX_INTEN_SENINF_OVERRUN_IRQ_EN_MASK (0x1 << 0)
> +#define SENINF2_MUX_INTEN_SENINF_CRCERR_IRQ_EN_SHIFT 1
> +#define SENINF2_MUX_INTEN_SENINF_CRCERR_IRQ_EN_MASK (0x1 << 1)
> +#define SENINF2_MUX_INTEN_SENINF_FSMERR_IRQ_EN_SHIFT 2
> +#define SENINF2_MUX_INTEN_SENINF_FSMERR_IRQ_EN_MASK (0x1 << 2)
> +#define SENINF2_MUX_INTEN_SENINF_VSIZEERR_IRQ_EN_SHIFT 3
> +#define SENINF2_MUX_INTEN_SENINF_VSIZEERR_IRQ_EN_MASK (0x1 << 3)
> +#define SENINF2_MUX_INTEN_SENINF_HSIZEERR_IRQ_EN_SHIFT 4
> +#define SENINF2_MUX_INTEN_SENINF_HSIZEERR_IRQ_EN_MASK (0x1 << 4)
> +#define SENINF2_MUX_INTEN_SENINF_SENSOR_VSIZEERR_IRQ_EN_SHIFT 5
> +#define SENINF2_MUX_INTEN_SENINF_SENSOR_VSIZEERR_IRQ_EN_MASK (0x1 << 5)
> +#define SENINF2_MUX_INTEN_SENINF_SENSOR_HSIZEERR_IRQ_EN_SHIFT 6
> +#define SENINF2_MUX_INTEN_SENINF_SENSOR_HSIZEERR_IRQ_EN_MASK (0x1 << 6)
> +#define SENINF2_MUX_INTEN_SENINF_IRQ_CLR_SEL_SHIFT 31
> +#define SENINF2_MUX_INTEN_SENINF_IRQ_CLR_SEL_MASK (0x1 << 31)
> +#define SENINF2_MUX_INTSTA                                     0x1D08
> +#define SENINF2_MUX_INTSTA_SENINF_OVERRUN_IRQ_STA_SHIFT 0
> +#define SENINF2_MUX_INTSTA_SENINF_OVERRUN_IRQ_STA_MASK (0x1 << 0)
> +#define SENINF2_MUX_INTSTA_SENINF_CRCERR_IRQ_STA_SHIFT 1
> +#define SENINF2_MUX_INTSTA_SENINF_CRCERR_IRQ_STA_MASK (0x1 << 1)
> +#define SENINF2_MUX_INTSTA_SENINF_FSMERR_IRQ_STA_SHIFT 2
> +#define SENINF2_MUX_INTSTA_SENINF_FSMERR_IRQ_STA_MASK (0x1 << 2)
> +#define SENINF2_MUX_INTSTA_SENINF_VSIZEERR_IRQ_STA_SHIFT 3
> +#define SENINF2_MUX_INTSTA_SENINF_VSIZEERR_IRQ_STA_MASK (0x1 << 3)
> +#define SENINF2_MUX_INTSTA_SENINF_HSIZEERR_IRQ_STA_SHIFT 4
> +#define SENINF2_MUX_INTSTA_SENINF_HSIZEERR_IRQ_STA_MASK (0x1 << 4)
> +#define SENINF2_MUX_INTSTA_SENINF_SENSOR_VSIZEERR_IRQ_STA_SHIFT 5
> +#define SENINF2_MUX_INTSTA_SENINF_SENSOR_VSIZEERR_IRQ_STA_MASK (0x1 << 5)
> +#define SENINF2_MUX_INTSTA_SENINF_SENSOR_HSIZEERR_IRQ_STA_SHIFT 6
> +#define SENINF2_MUX_INTSTA_SENINF_SENSOR_HSIZEERR_IRQ_STA_MASK (0x1 << 6)
> +#define SENINF2_MUX_SIZE                                       0x1D0C
> +#define SENINF2_MUX_SIZE_SENINF_VSIZE_SHIFT    0
> +#define SENINF2_MUX_SIZE_SENINF_VSIZE_MASK     (0xffff << 0)
> +#define SENINF2_MUX_SIZE_SENINF_HSIZE_SHIFT    16
> +#define SENINF2_MUX_SIZE_SENINF_HSIZE_MASK     (0xffff << 16)
> +#define SENINF2_MUX_DEBUG_1                                    0x1D10
> +#define SENINF2_MUX_DEBUG_1_DEBUG_INFO_SHIFT   0
> +#define SENINF2_MUX_DEBUG_1_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF2_MUX_DEBUG_2                                    0x1D14
> +#define SENINF2_MUX_DEBUG_2_DEBUG_INFO_SHIFT   0
> +#define SENINF2_MUX_DEBUG_2_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF2_MUX_DEBUG_3                                    0x1D18
> +#define SENINF2_MUX_DEBUG_3_DEBUG_INFO_SHIFT   0
> +#define SENINF2_MUX_DEBUG_3_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF2_MUX_DEBUG_4                                    0x1D1C
> +#define SENINF2_MUX_DEBUG_4_DEBUG_INFO_SHIFT   0
> +#define SENINF2_MUX_DEBUG_4_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF2_MUX_DEBUG_5                                    0x1D20
> +#define SENINF2_MUX_DEBUG_5_DEBUG_INFO_SHIFT   0
> +#define SENINF2_MUX_DEBUG_5_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF2_MUX_DEBUG_6                                    0x1D24
> +#define SENINF2_MUX_DEBUG_6_DEBUG_INFO_SHIFT   0
> +#define SENINF2_MUX_DEBUG_6_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF2_MUX_DEBUG_7                                    0x1D28
> +#define SENINF2_MUX_DEBUG_7_DEBUG_INFO_SHIFT   0
> +#define SENINF2_MUX_DEBUG_7_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF2_MUX_SPARE                                      0x1D2C
> +#define SENINF2_MUX_SPARE_SENINF_CRC_SEL_SHIFT 9
> +#define SENINF2_MUX_SPARE_SENINF_CRC_SEL_MASK  (0x3 << 9)
> +#define SENINF2_MUX_SPARE_SENINF_VCNT_SEL_SHIFT 11
> +#define SENINF2_MUX_SPARE_SENINF_VCNT_SEL_MASK (0x3 << 11)
> +#define SENINF2_MUX_SPARE_SENINF_FIFO_FULL_SEL_SHIFT 13
> +#define SENINF2_MUX_SPARE_SENINF_FIFO_FULL_SEL_MASK (0x1 << 13)
> +#define SENINF2_MUX_SPARE_SENINF_SPARE_SHIFT   14
> +#define SENINF2_MUX_SPARE_SENINF_SPARE_MASK    (0x3f << 14)
> +#define SENINF2_MUX_DATA                                       0x1D30
> +#define SENINF2_MUX_DATA_SENINF_DATA0_SHIFT    0
> +#define SENINF2_MUX_DATA_SENINF_DATA0_MASK     (0xffff << 0)
> +#define SENINF2_MUX_DATA_SENINF_DATA1_SHIFT    16
> +#define SENINF2_MUX_DATA_SENINF_DATA1_MASK     (0xffff << 16)
> +#define SENINF2_MUX_DATA_CNT                                   0x1D34
> +#define SENINF2_MUX_DATA_CNT_SENINF_DATA_CNT_SHIFT 0
> +#define SENINF2_MUX_DATA_CNT_SENINF_DATA_CNT_MASK (0xffffffff << 0)
> +#define SENINF2_MUX_CROP                                       0x1D38
> +#define SENINF2_MUX_CROP_SENINF_CROP_X1_SHIFT  0
> +#define SENINF2_MUX_CROP_SENINF_CROP_X1_MASK   (0xffff << 0)
> +#define SENINF2_MUX_CROP_SENINF_CROP_X2_SHIFT  16
> +#define SENINF2_MUX_CROP_SENINF_CROP_X2_MASK   (0xffff << 16)
> +#define SENINF2_MUX_CTRL_EXT                                   0x1D3C
> +#define SENINF2_MUX_CTRL_EXT_SENINF_SRC_SEL_EXT_SHIFT 0
> +#define SENINF2_MUX_CTRL_EXT_SENINF_SRC_SEL_EXT_MASK (0x3 << 0)
> +#define SENINF2_MUX_CTRL_EXT_SENINF_PIX_SEL_EXT_SHIFT 4
> +#define SENINF2_MUX_CTRL_EXT_SENINF_PIX_SEL_EXT_MASK (0x1 << 4)
> +#define SENINF3_CTRL                                           0x2200
> +#define SENINF3_CTRL_SENINF_EN_SHIFT           0
> +#define SENINF3_CTRL_SENINF_EN_MASK            (0x1 << 0)
> +#define SENINF3_CTRL_NCSI2_SW_RST_SHIFT        1
> +#define SENINF3_CTRL_NCSI2_SW_RST_MASK         (0x1 << 1)
> +#define SENINF3_CTRL_OCSI2_SW_RST_SHIFT        2
> +#define SENINF3_CTRL_OCSI2_SW_RST_MASK         (0x1 << 2)
> +#define SENINF3_CTRL_CCIR_SW_RST_SHIFT         3
> +#define SENINF3_CTRL_CCIR_SW_RST_MASK          (0x1 << 3)
> +#define SENINF3_CTRL_CKGEN_SW_RST_SHIFT        4
> +#define SENINF3_CTRL_CKGEN_SW_RST_MASK         (0x1 << 4)
> +#define SENINF3_CTRL_TEST_MODEL_SW_RST_SHIFT   5
> +#define SENINF3_CTRL_TEST_MODEL_SW_RST_MASK    (0x1 << 5)
> +#define SENINF3_CTRL_SCAM_SW_RST_SHIFT         6
> +#define SENINF3_CTRL_SCAM_SW_RST_MASK          (0x1 << 6)
> +#define SENINF3_CTRL_CSI2_SW_RST_SHIFT         7
> +#define SENINF3_CTRL_CSI2_SW_RST_MASK          (0x1 << 7)
> +#define SENINF3_CTRL_CSI3_SW_RST_SHIFT         8
> +#define SENINF3_CTRL_CSI3_SW_RST_MASK          (0x1 << 8)
> +#define SENINF3_CTRL_SENINF_SRC_SEL_SHIFT      12
> +#define SENINF3_CTRL_SENINF_SRC_SEL_MASK       (0xf << 12)
> +#define SENINF3_CTRL_SENINF_DEBUG_SEL_SHIFT    20
> +#define SENINF3_CTRL_SENINF_DEBUG_SEL_MASK     (0xf << 20)
> +#define SENINF3_CTRL_PAD2CAM_DATA_SEL_SHIFT    28
> +#define SENINF3_CTRL_PAD2CAM_DATA_SEL_MASK     (0x7 << 28)
> +#define SENINF3_CTRL_EXT                                       0x2204
> +#define SENINF3_CTRL_EXT_SENINF_OCSI2_IP_EN_SHIFT 0
> +#define SENINF3_CTRL_EXT_SENINF_OCSI2_IP_EN_MASK (0x1 << 0)
> +#define SENINF3_CTRL_EXT_SENINF_TESTMDL_IP_EN_SHIFT 1
> +#define SENINF3_CTRL_EXT_SENINF_TESTMDL_IP_EN_MASK (0x1 << 1)
> +#define SENINF3_CTRL_EXT_SENINF_SCAM_IP_EN_SHIFT 4
> +#define SENINF3_CTRL_EXT_SENINF_SCAM_IP_EN_MASK (0x1 << 4)
> +#define SENINF3_CTRL_EXT_SENINF_NCSI2_IP_EN_SHIFT 5
> +#define SENINF3_CTRL_EXT_SENINF_NCSI2_IP_EN_MASK (0x1 << 5)
> +#define SENINF3_CTRL_EXT_SENINF_CSI2_IP_EN_SHIFT 6
> +#define SENINF3_CTRL_EXT_SENINF_CSI2_IP_EN_MASK (0x1 << 6)
> +#define SENINF3_CTRL_EXT_SENINF_CSI3_IP_EN_SHIFT 7
> +#define SENINF3_CTRL_EXT_SENINF_CSI3_IP_EN_MASK (0x1 << 7)
> +#define SENINF3_CTRL_EXT_SENINF_SRC_SEL_EXT_SHIFT 16
> +#define SENINF3_CTRL_EXT_SENINF_SRC_SEL_EXT_MASK (0x3 << 16)
> +#define SENINF3_ASYNC_CTRL                                     0x2208
> +#define SENINF3_ASYNC_CTRL_SENINF_ASYNC_FIFO_RST_SHIFT 0
> +#define SENINF3_ASYNC_CTRL_SENINF_ASYNC_FIFO_RST_MASK (0x1 << 0)
> +#define SENINF3_ASYNC_CTRL_SENINF_HSYNC_MASK_SHIFT 1
> +#define SENINF3_ASYNC_CTRL_SENINF_HSYNC_MASK_MASK (0x1 << 1)
> +#define SENINF3_ASYNC_CTRL_SENINF_VSYNC_POL_SHIFT 2
> +#define SENINF3_ASYNC_CTRL_SENINF_VSYNC_POL_MASK (0x1 << 2)
> +#define SENINF3_ASYNC_CTRL_SENINF_HSYNC_POL_SHIFT 3
> +#define SENINF3_ASYNC_CTRL_SENINF_HSYNC_POL_MASK (0x1 << 3)
> +#define SENINF3_ASYNC_CTRL_FIFO_PUSH_EN_SHIFT  16
> +#define SENINF3_ASYNC_CTRL_FIFO_PUSH_EN_MASK   (0x3f << 16)
> +#define SENINF3_ASYNC_CTRL_FIFO_FLUSH_EN_SHIFT 24
> +#define SENINF3_ASYNC_CTRL_FIFO_FLUSH_EN_MASK  (0x3f << 24)
> +#define SENINF_TG3_PH_CNT                                      0x2600
> +#define SENINF_TG3_PH_CNT_TGCLK_SEL_SHIFT      0
> +#define SENINF_TG3_PH_CNT_TGCLK_SEL_MASK       (0x3 << 0)
> +#define SENINF_TG3_PH_CNT_CLKFL_POL_SHIFT      2
> +#define SENINF_TG3_PH_CNT_CLKFL_POL_MASK       (0x1 << 2)
> +#define SENINF_TG3_PH_CNT_EXT_RST_SHIFT        4
> +#define SENINF_TG3_PH_CNT_EXT_RST_MASK         (0x1 << 4)
> +#define SENINF_TG3_PH_CNT_EXT_PWRDN_SHIFT      5
> +#define SENINF_TG3_PH_CNT_EXT_PWRDN_MASK       (0x1 << 5)
> +#define SENINF_TG3_PH_CNT_PAD_PCLK_INV_SHIFT   6
> +#define SENINF_TG3_PH_CNT_PAD_PCLK_INV_MASK    (0x1 << 6)
> +#define SENINF_TG3_PH_CNT_CAM_PCLK_INV_SHIFT   7
> +#define SENINF_TG3_PH_CNT_CAM_PCLK_INV_MASK    (0x1 << 7)
> +#define SENINF_TG3_PH_CNT_CLKPOL_SHIFT         28
> +#define SENINF_TG3_PH_CNT_CLKPOL_MASK          (0x1 << 28)
> +#define SENINF_TG3_PH_CNT_ADCLK_EN_SHIFT       29
> +#define SENINF_TG3_PH_CNT_ADCLK_EN_MASK        (0x1 << 29)
> +#define SENINF_TG3_PH_CNT_PCEN_SHIFT           31
> +#define SENINF_TG3_PH_CNT_PCEN_MASK            (0x1 << 31)
> +#define SENINF_TG3_SEN_CK                                      0x2604
> +#define SENINF_TG3_SEN_CK_CLKFL_SHIFT          0
> +#define SENINF_TG3_SEN_CK_CLKFL_MASK           (0x3f << 0)
> +#define SENINF_TG3_SEN_CK_CLKRS_SHIFT          8
> +#define SENINF_TG3_SEN_CK_CLKRS_MASK           (0x3f << 8)
> +#define SENINF_TG3_SEN_CK_CLKCNT_SHIFT         16
> +#define SENINF_TG3_SEN_CK_CLKCNT_MASK          (0x3f << 16)
> +#define SENINF_TG3_TM_CTL                                      0x2608
> +#define SENINF_TG3_TM_CTL_TM_EN_SHIFT          0
> +#define SENINF_TG3_TM_CTL_TM_EN_MASK           (0x1 << 0)
> +#define SENINF_TG3_TM_CTL_TM_RST_SHIFT         1
> +#define SENINF_TG3_TM_CTL_TM_RST_MASK          (0x1 << 1)
> +#define SENINF_TG3_TM_CTL_TM_FMT_SHIFT         2
> +#define SENINF_TG3_TM_CTL_TM_FMT_MASK          (0x1 << 2)
> +#define SENINF_TG3_TM_CTL_TM_PAT_SHIFT         4
> +#define SENINF_TG3_TM_CTL_TM_PAT_MASK          (0xf << 4)
> +#define SENINF_TG3_TM_CTL_TM_VSYNC_SHIFT       8
> +#define SENINF_TG3_TM_CTL_TM_VSYNC_MASK        (0xff << 8)
> +#define SENINF_TG3_TM_CTL_TM_DUMMYPXL_SHIFT    16
> +#define SENINF_TG3_TM_CTL_TM_DUMMYPXL_MASK     (0xff << 16)
> +#define SENINF_TG3_TM_SIZE                                     0x260C
> +#define SENINF_TG3_TM_SIZE_TM_PXL_SHIFT        0
> +#define SENINF_TG3_TM_SIZE_TM_PXL_MASK         (0x1fff << 0)
> +#define SENINF_TG3_TM_SIZE_TM_LINE_SHIFT       16
> +#define SENINF_TG3_TM_SIZE_TM_LINE_MASK        (0x3fff << 16)
> +#define SENINF_TG3_TM_CLK                                      0x2610
> +#define SENINF_TG3_TM_CLK_TM_CLK_CNT_SHIFT     0
> +#define SENINF_TG3_TM_CLK_TM_CLK_CNT_MASK      (0xf << 0)
> +#define SENINF_TG3_TM_CLK_TM_CLRBAR_OFT_SHIFT  16
> +#define SENINF_TG3_TM_CLK_TM_CLRBAR_OFT_MASK   (0x3ff << 16)
> +#define SENINF_TG3_TM_CLK_TM_CLRBAR_IDX_SHIFT  28
> +#define SENINF_TG3_TM_CLK_TM_CLRBAR_IDX_MASK   (0x7 << 28)
> +#define SENINF_TG3_TM_STP                                      0x2614
> +#define SENINF_TG3_TM_STP_TG1_TM_STP_SHIFT     0
> +#define SENINF_TG3_TM_STP_TG1_TM_STP_MASK      (0xffffffff << 0)
> +#define MIPI_RX_CON24_CSI2                                     0x2824
> +#define MIPI_RX_CON24_CSI2_CSI0_BIST_NUM_SHIFT 0
> +#define MIPI_RX_CON24_CSI2_CSI0_BIST_NUM_MASK  (0x3 << 0)
> +#define MIPI_RX_CON24_CSI2_CSI0_BIST_EN_SHIFT  2
> +#define MIPI_RX_CON24_CSI2_CSI0_BIST_EN_MASK   (0x1 << 2)
> +#define MIPI_RX_CON24_CSI2_CSI0_BIST_FIX_PAT_SHIFT 5
> +#define MIPI_RX_CON24_CSI2_CSI0_BIST_FIX_PAT_MASK (0x1 << 5)
> +#define MIPI_RX_CON24_CSI2_CSI0_BIST_CLK_SEL_SHIFT 6
> +#define MIPI_RX_CON24_CSI2_CSI0_BIST_CLK_SEL_MASK (0x1 << 6)
> +#define MIPI_RX_CON24_CSI2_CSI0_BIST_CLK4X_SEL_SHIFT 7
> +#define MIPI_RX_CON24_CSI2_CSI0_BIST_CLK4X_SEL_MASK (0x1 << 7)
> +#define MIPI_RX_CON24_CSI2_CSI0_BIST_TERM_DELAY_SHIFT 8
> +#define MIPI_RX_CON24_CSI2_CSI0_BIST_TERM_DELAY_MASK (0xff << 8)
> +#define MIPI_RX_CON24_CSI2_CSI0_BIST_SETTLE_DELAY_SHIFT 16
> +#define MIPI_RX_CON24_CSI2_CSI0_BIST_SETTLE_DELAY_MASK (0xff << 16)
> +#define MIPI_RX_CON24_CSI2_CSI0_BIST_LN0_MUX_SHIFT 24
> +#define MIPI_RX_CON24_CSI2_CSI0_BIST_LN0_MUX_MASK (0x3 << 24)
> +#define MIPI_RX_CON24_CSI2_CSI0_BIST_LN1_MUX_SHIFT 26
> +#define MIPI_RX_CON24_CSI2_CSI0_BIST_LN1_MUX_MASK (0x3 << 26)
> +#define MIPI_RX_CON24_CSI2_CSI0_BIST_LN2_MUX_SHIFT 28
> +#define MIPI_RX_CON24_CSI2_CSI0_BIST_LN2_MUX_MASK (0x3 << 28)
> +#define MIPI_RX_CON24_CSI2_CSI0_BIST_LN3_MUX_SHIFT 30
> +#define MIPI_RX_CON24_CSI2_CSI0_BIST_LN3_MUX_MASK (0x3 << 30)
> +#define MIPI_RX_CON28_CSI2                                     0x2828
> +#define MIPI_RX_CON28_CSI2_CSI0_BIST_START_SHIFT 0
> +#define MIPI_RX_CON28_CSI2_CSI0_BIST_START_MASK (0x1 << 0)
> +#define MIPI_RX_CON28_CSI2_CSI0_BIST_DATA_OK_SHIFT 1
> +#define MIPI_RX_CON28_CSI2_CSI0_BIST_DATA_OK_MASK (0x1 << 1)
> +#define MIPI_RX_CON28_CSI2_CSI0_BIST_HS_FSM_OK_SHIFT 2
> +#define MIPI_RX_CON28_CSI2_CSI0_BIST_HS_FSM_OK_MASK (0x1 << 2)
> +#define MIPI_RX_CON28_CSI2_CSI0_BIST_LANE_FSM_OK_SHIFT 3
> +#define MIPI_RX_CON28_CSI2_CSI0_BIST_LANE_FSM_OK_MASK (0x1 << 3)
> +#define MIPI_RX_CON28_CSI2_CSI0_BIST_CSI2_DATA_OK_SHIFT 4
> +#define MIPI_RX_CON28_CSI2_CSI0_BIST_CSI2_DATA_OK_MASK (0x1 << 4)
> +#define MIPI_RX_CON34_CSI2                                     0x2834
> +#define MIPI_RX_CON34_CSI2_BIST_MODE_SHIFT     0
> +#define MIPI_RX_CON34_CSI2_BIST_MODE_MASK      (0x1 << 0)
> +#define MIPI_RX_CON34_CSI2_CSI0_BIST_HSDET_MUX_SHIFT 22
> +#define MIPI_RX_CON34_CSI2_CSI0_BIST_HSDET_MUX_MASK (0x3 << 22)
> +#define MIPI_RX_CON34_CSI2_CSI0_BIST_LN4_MUX_SHIFT 24
> +#define MIPI_RX_CON34_CSI2_CSI0_BIST_LN4_MUX_MASK (0x3 << 24)
> +#define MIPI_RX_CON34_CSI2_CSI0_BIST_LN5_MUX_SHIFT 26
> +#define MIPI_RX_CON34_CSI2_CSI0_BIST_LN5_MUX_MASK (0x3 << 26)
> +#define MIPI_RX_CON34_CSI2_CSI0_BIST_LN6_MUX_SHIFT 28
> +#define MIPI_RX_CON34_CSI2_CSI0_BIST_LN6_MUX_MASK (0x3 << 28)
> +#define MIPI_RX_CON34_CSI2_CSI0_BIST_LN7_MUX_SHIFT 30
> +#define MIPI_RX_CON34_CSI2_CSI0_BIST_LN7_MUX_MASK (0x3 << 30)
> +#define MIPI_RX_CON38_CSI2                                     0x2838
> +#define MIPI_RX_CON38_CSI2_MIPI_RX_SW_CTRL_MODE_SHIFT 0
> +#define MIPI_RX_CON38_CSI2_MIPI_RX_SW_CTRL_MODE_MASK (0x1 << 0)
> +#define MIPI_RX_CON38_CSI2_MIPI_RX_SW_CAL_MODE_SHIFT 1
> +#define MIPI_RX_CON38_CSI2_MIPI_RX_SW_CAL_MODE_MASK (0x1 << 1)
> +#define MIPI_RX_CON38_CSI2_MIPI_RX_HW_CAL_START_SHIFT 2
> +#define MIPI_RX_CON38_CSI2_MIPI_RX_HW_CAL_START_MASK (0x1 << 2)
> +#define MIPI_RX_CON38_CSI2_MIPI_RX_HW_CAL_OPTION_SHIFT 3
> +#define MIPI_RX_CON38_CSI2_MIPI_RX_HW_CAL_OPTION_MASK (0x1 << 3)
> +#define MIPI_RX_CON38_CSI2_MIPI_RX_SW_RST_SHIFT 4
> +#define MIPI_RX_CON38_CSI2_MIPI_RX_SW_RST_MASK (0x1f << 4)
> +#define MIPI_RX_CON38_CSI2_MIPI_RX_SW_CPHY_TX_MODE_SHIFT 9
> +#define MIPI_RX_CON38_CSI2_MIPI_RX_SW_CPHY_TX_MODE_MASK (0x1 << 9)
> +#define MIPI_RX_CON38_CSI2_MIPI_RX_SW_CPHY_RX_MODE_SHIFT 10
> +#define MIPI_RX_CON38_CSI2_MIPI_RX_SW_CPHY_RX_MODE_MASK (0x1 << 10)
> +#define MIPI_RX_CON38_CSI2_RG_CKPHASE_TRIO0_SHIFT 16
> +#define MIPI_RX_CON38_CSI2_RG_CKPHASE_TRIO0_MASK (0x1f << 16)
> +#define MIPI_RX_CON38_CSI2_RG_CKPHASE_TRIO1_SHIFT 22
> +#define MIPI_RX_CON38_CSI2_RG_CKPHASE_TRIO1_MASK (0x1f << 22)
> +#define MIPI_RX_CON38_CSI2_RG_CKPHASE_TRIO2_SHIFT 27
> +#define MIPI_RX_CON38_CSI2_RG_CKPHASE_TRIO2_MASK (0x1f << 27)
> +#define MIPI_RX_CON3C_CSI2                                     0x283C
> +#define MIPI_RX_CON3C_CSI2_MIPI_RX_SW_CTRL__SHIFT 0
> +#define MIPI_RX_CON3C_CSI2_MIPI_RX_SW_CTRL__MASK (0xffffffff << 0)
> +#define MIPI_RX_CON7C_CSI2                                     0x287C
> +#define MIPI_RX_CON7C_CSI2_DA_CSI0_LNRD0_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON7C_CSI2_DA_CSI0_LNRD0_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON7C_CSI2_DA_CSI0_LNRD0_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON7C_CSI2_DA_CSI0_LNRD0_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON7C_CSI2_DA_CSI0_LNRD0_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON7C_CSI2_DA_CSI0_LNRD0_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON80_CSI2                                     0x2880
> +#define MIPI_RX_CON80_CSI2_DA_CSI0_LNRD1_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON80_CSI2_DA_CSI0_LNRD1_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON80_CSI2_DA_CSI0_LNRD1_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON80_CSI2_DA_CSI0_LNRD1_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON80_CSI2_DA_CSI0_LNRD1_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON80_CSI2_DA_CSI0_LNRD1_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON84_CSI2                                     0x2884
> +#define MIPI_RX_CON84_CSI2_DA_CSI0_LNRD2_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON84_CSI2_DA_CSI0_LNRD2_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON84_CSI2_DA_CSI0_LNRD2_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON84_CSI2_DA_CSI0_LNRD2_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON84_CSI2_DA_CSI0_LNRD2_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON84_CSI2_DA_CSI0_LNRD2_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON88_CSI2                                     0x2888
> +#define MIPI_RX_CON88_CSI2_DA_CSI0_LNRD3_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON88_CSI2_DA_CSI0_LNRD3_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON88_CSI2_DA_CSI0_LNRD3_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON88_CSI2_DA_CSI0_LNRD3_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON88_CSI2_DA_CSI0_LNRD3_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON88_CSI2_DA_CSI0_LNRD3_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON8C_CSI2                                     0x288C
> +#define MIPI_RX_CON8C_CSI2_RG_CSI0_LNRD0_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON8C_CSI2_RG_CSI0_LNRD0_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON8C_CSI2_RG_CSI0_LNRD0_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON8C_CSI2_RG_CSI0_LNRD0_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON8C_CSI2_RG_CSI0_LNRD0_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON8C_CSI2_RG_CSI0_LNRD0_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON90_CSI2                                     0x2890
> +#define MIPI_RX_CON90_CSI2_RG_CSI0_LNRD1_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON90_CSI2_RG_CSI0_LNRD1_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON90_CSI2_RG_CSI0_LNRD1_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON90_CSI2_RG_CSI0_LNRD1_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON90_CSI2_RG_CSI0_LNRD1_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON90_CSI2_RG_CSI0_LNRD1_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON94_CSI2                                     0x2894
> +#define MIPI_RX_CON94_CSI2_RG_CSI0_LNRD2_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON94_CSI2_RG_CSI0_LNRD2_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON94_CSI2_RG_CSI0_LNRD2_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON94_CSI2_RG_CSI0_LNRD2_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON94_CSI2_RG_CSI0_LNRD2_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON94_CSI2_RG_CSI0_LNRD2_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON98_CSI2                                     0x2898
> +#define MIPI_RX_CON98_CSI2_RG_CSI0_LNRD3_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON98_CSI2_RG_CSI0_LNRD3_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON98_CSI2_RG_CSI0_LNRD3_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON98_CSI2_RG_CSI0_LNRD3_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON98_CSI2_RG_CSI0_LNRD3_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON98_CSI2_RG_CSI0_LNRD3_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CONA0_CSI2                                     0x28A0
> +#define MIPI_RX_CONA0_CSI2_RG_CSI0_LNRC_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CONA0_CSI2_RG_CSI0_LNRC_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CONA0_CSI2_RG_CSI0_LNRC_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CONA0_CSI2_RG_CSI0_LNRC_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CONA0_CSI2_RG_CSI0_LNRC_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CONA0_CSI2_RG_CSI0_LNRC_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CONB0_CSI2                                     0x28B0
> +#define MIPI_RX_CONB0_CSI2_DELAY_APPLY_MODE_SHIFT 0
> +#define MIPI_RX_CONB0_CSI2_DELAY_APPLY_MODE_MASK (0xf << 0)
> +#define MIPI_RX_CONB0_CSI2_DESKEW_SW_RST_SHIFT 7
> +#define MIPI_RX_CONB0_CSI2_DESKEW_SW_RST_MASK  (0x1 << 7)
> +#define MIPI_RX_CONB0_CSI2_DESKEW_TRIGGER_MODE_SHIFT 8
> +#define MIPI_RX_CONB0_CSI2_DESKEW_TRIGGER_MODE_MASK (0x7 << 8)
> +#define MIPI_RX_CONB0_CSI2_DESKEW_ACC_MODE_SHIFT 12
> +#define MIPI_RX_CONB0_CSI2_DESKEW_ACC_MODE_MASK (0xf << 12)
> +#define MIPI_RX_CONB0_CSI2_DESKEW_CSI2_RST_ENABLE_SHIFT 16
> +#define MIPI_RX_CONB0_CSI2_DESKEW_CSI2_RST_ENABLE_MASK (0x1 << 16)
> +#define MIPI_RX_CONB0_CSI2_DESKEW_IP_SEL_SHIFT 30
> +#define MIPI_RX_CONB0_CSI2_DESKEW_IP_SEL_MASK  (0x1 << 30)
> +#define MIPI_RX_CONB0_CSI2_DESKEW_ENABLE_SHIFT 31
> +#define MIPI_RX_CONB0_CSI2_DESKEW_ENABLE_MASK  (0x1 << 31)
> +#define MIPI_RX_CONB4_CSI2                                     0x28B4
> +#define MIPI_RX_CONB4_CSI2_SYNC_CODE_MASK_SHIFT 0
> +#define MIPI_RX_CONB4_CSI2_SYNC_CODE_MASK_MASK (0xffff << 0)
> +#define MIPI_RX_CONB4_CSI2_EXPECTED_SYNC_CODE_SHIFT 16
> +#define MIPI_RX_CONB4_CSI2_EXPECTED_SYNC_CODE_MASK (0xffff << 16)
> +#define MIPI_RX_CONB8_CSI2                                     0x28B8
> +#define MIPI_RX_CONB8_CSI2_DESKEW_SETUP_TIME_SHIFT 0
> +#define MIPI_RX_CONB8_CSI2_DESKEW_SETUP_TIME_MASK (0xf << 0)
> +#define MIPI_RX_CONB8_CSI2_DESKEW_HOLD_TIME_SHIFT 8
> +#define MIPI_RX_CONB8_CSI2_DESKEW_HOLD_TIME_MASK (0xf << 8)
> +#define MIPI_RX_CONB8_CSI2_DESKEW_TIME_OUT_SHIFT 16
> +#define MIPI_RX_CONB8_CSI2_DESKEW_TIME_OUT_MASK (0xff << 16)
> +#define MIPI_RX_CONB8_CSI2_DESKEW_TIME_OUT_EN_SHIFT 24
> +#define MIPI_RX_CONB8_CSI2_DESKEW_TIME_OUT_EN_MASK (0x1 << 24)
> +#define MIPI_RX_CONBC_CSI2                                     0x28BC
> +#define MIPI_RX_CONBC_CSI2_DESKEW_DETECTION_MODE_SHIFT 0
> +#define MIPI_RX_CONBC_CSI2_DESKEW_DETECTION_MODE_MASK (0xf << 0)
> +#define MIPI_RX_CONBC_CSI2_DESKEW_DETECTION_CNT_SHIFT 8
> +#define MIPI_RX_CONBC_CSI2_DESKEW_DETECTION_CNT_MASK (0x7f << 8)
> +#define MIPI_RX_CONBC_CSI2_DESKEW_DELAY_APPLY_MODE_SHIFT 16
> +#define MIPI_RX_CONBC_CSI2_DESKEW_DELAY_APPLY_MODE_MASK (0xf << 16)
> +#define MIPI_RX_CONBC_CSI2_DESKEW_LANE_NUMBER_SHIFT 24
> +#define MIPI_RX_CONBC_CSI2_DESKEW_LANE_NUMBER_MASK (0x3 << 24)
> +#define MIPI_RX_CONC0_CSI2                                     0x28C0
> +#define MIPI_RX_CONC0_CSI2_DESKEW_INTERRUPT_ENABLE_SHIFT 0
> +#define MIPI_RX_CONC0_CSI2_DESKEW_INTERRUPT_ENABLE_MASK (0xffff << 0)
> +#define MIPI_RX_CONC0_CSI2_DESKEW_INTERRUPT_W1C_EN_SHIFT 31
> +#define MIPI_RX_CONC0_CSI2_DESKEW_INTERRUPT_W1C_EN_MASK (0x1 << 31)
> +#define MIPI_RX_CONC4_CSI2                                     0x28C4
> +#define MIPI_RX_CONC4_CSI2_DESKEW_INTERRUPT_STATUS_SHIFT 0
> +#define MIPI_RX_CONC4_CSI2_DESKEW_INTERRUPT_STATUS_MASK (0xffff << 0)
> +#define MIPI_RX_CONC8_CSI2                                     0x28C8
> +#define MIPI_RX_CONC8_CSI2_DESKEW_DEBUG_MUX_SELECT_SHIFT 0
> +#define MIPI_RX_CONC8_CSI2_DESKEW_DEBUG_MUX_SELECT_MASK (0xff << 0)
> +#define MIPI_RX_CONCC_CSI2                                     0x28CC
> +#define MIPI_RX_CONCC_CSI2_DESKEW_DEBUG_OUTPUTS_SHIFT 0
> +#define MIPI_RX_CONCC_CSI2_DESKEW_DEBUG_OUTPUTS_MASK (0xffffffff << 0)
> +#define MIPI_RX_COND0_CSI2                                     0x28D0
> +#define MIPI_RX_COND0_CSI2_DESKEW_DELAY_LENGTH_SHIFT 0
> +#define MIPI_RX_COND0_CSI2_DESKEW_DELAY_LENGTH_MASK (0x3f << 0)
> +#define SENINF3_CSI2_CTL                                       0x2A00
> +#define SENINF3_CSI2_CTL_DATA_LANE0_EN_SHIFT   0
> +#define SENINF3_CSI2_CTL_DATA_LANE0_EN_MASK    (0x1 << 0)
> +#define SENINF3_CSI2_CTL_DATA_LANE1_EN_SHIFT   1
> +#define SENINF3_CSI2_CTL_DATA_LANE1_EN_MASK    (0x1 << 1)
> +#define SENINF3_CSI2_CTL_DATA_LANE2_EN_SHIFT   2
> +#define SENINF3_CSI2_CTL_DATA_LANE2_EN_MASK    (0x1 << 2)
> +#define SENINF3_CSI2_CTL_DATA_LANE3_EN_SHIFT   3
> +#define SENINF3_CSI2_CTL_DATA_LANE3_EN_MASK    (0x1 << 3)
> +#define SENINF3_CSI2_CTL_CLOCK_LANE_EN_SHIFT   4
> +#define SENINF3_CSI2_CTL_CLOCK_LANE_EN_MASK    (0x1 << 4)
> +#define SENINF3_CSI2_CTL_ECC_EN_SHIFT          5
> +#define SENINF3_CSI2_CTL_ECC_EN_MASK           (0x1 << 5)
> +#define SENINF3_CSI2_CTL_CRC_EN_SHIFT          6
> +#define SENINF3_CSI2_CTL_CRC_EN_MASK           (0x1 << 6)
> +#define SENINF3_CSI2_CTL_HSRX_DET_EN_SHIFT     7
> +#define SENINF3_CSI2_CTL_HSRX_DET_EN_MASK      (0x1 << 7)
> +#define SENINF3_CSI2_CTL_HS_PRPR_EN_SHIFT      8
> +#define SENINF3_CSI2_CTL_HS_PRPR_EN_MASK       (0x1 << 8)
> +#define SENINF3_CSI2_CTL_HS_END_EN_SHIFT       9
> +#define SENINF3_CSI2_CTL_HS_END_EN_MASK        (0x1 << 9)
> +#define SENINF3_CSI2_CTL_GENERIC_LONG_PACKET_EN_SHIFT 12
> +#define SENINF3_CSI2_CTL_GENERIC_LONG_PACKET_EN_MASK (0x1 << 12)
> +#define SENINF3_CSI2_CTL_IMAGE_PACKET_EN_SHIFT 13
> +#define SENINF3_CSI2_CTL_IMAGE_PACKET_EN_MASK  (0x1 << 13)
> +#define SENINF3_CSI2_CTL_BYTE2PIXEL_EN_SHIFT   14
> +#define SENINF3_CSI2_CTL_BYTE2PIXEL_EN_MASK    (0x1 << 14)
> +#define SENINF3_CSI2_CTL_VS_TYPE_SHIFT         15
> +#define SENINF3_CSI2_CTL_VS_TYPE_MASK          (0x1 << 15)
> +#define SENINF3_CSI2_CTL_ED_SEL_SHIFT          16
> +#define SENINF3_CSI2_CTL_ED_SEL_MASK           (0x1 << 16)
> +#define SENINF3_CSI2_CTL_FLUSH_MODE_SHIFT      18
> +#define SENINF3_CSI2_CTL_FLUSH_MODE_MASK       (0x3 << 18)
> +#define SENINF3_CSI2_CTL_HS_TRAIL_EN_SHIFT     25
> +#define SENINF3_CSI2_CTL_HS_TRAIL_EN_MASK      (0x1 << 25)
> +#define SENINF3_CSI2_CTL_CLOCK_HS_OPTION_SHIFT 27
> +#define SENINF3_CSI2_CTL_CLOCK_HS_OPTION_MASK  (0x1 << 27)
> +#define SENINF3_CSI2_CTL_VS_OUT_CYCLE_NUMBER_SHIFT 28
> +#define SENINF3_CSI2_CTL_VS_OUT_CYCLE_NUMBER_MASK (0x3 << 28)
> +#define SENINF3_CSI2_LNRC_TIMING                               0x2A04
> +#define SENINF3_CSI2_LNRC_TIMING_CLOCK_TERM_PARAMETER_SHIFT 0
> +#define SENINF3_CSI2_LNRC_TIMING_CLOCK_TERM_PARAMETER_MASK (0xff << 0)
> +#define SENINF3_CSI2_LNRC_TIMING_CLOCK_SETTLE_PARAMETER_SHIFT 8
> +#define SENINF3_CSI2_LNRC_TIMING_CLOCK_SETTLE_PARAMETER_MASK (0xff << 8)
> +#define SENINF3_CSI2_LNRD_TIMING                               0x2A08
> +#define SENINF3_CSI2_LNRD_TIMING_DATA_TERM_PARAMETER_SHIFT 0
> +#define SENINF3_CSI2_LNRD_TIMING_DATA_TERM_PARAMETER_MASK (0xff << 0)
> +#define SENINF3_CSI2_LNRD_TIMING_DATA_SETTLE_PARAMETER_SHIFT 8
> +#define SENINF3_CSI2_LNRD_TIMING_DATA_SETTLE_PARAMETER_MASK (0xff << 8)
> +#define SENINF3_CSI2_DPCM                                      0x2A0C
> +#define SENINF3_CSI2_DPCM_DPCM_MODE_SHIFT      0
> +#define SENINF3_CSI2_DPCM_DPCM_MODE_MASK       (0xf << 0)
> +#define SENINF3_CSI2_DPCM_DI_30_DPCM_EN_SHIFT  7
> +#define SENINF3_CSI2_DPCM_DI_30_DPCM_EN_MASK   (0x1 << 7)
> +#define SENINF3_CSI2_DPCM_DI_31_DPCM_EN_SHIFT  8
> +#define SENINF3_CSI2_DPCM_DI_31_DPCM_EN_MASK   (0x1 << 8)
> +#define SENINF3_CSI2_DPCM_DI_32_DPCM_EN_SHIFT  9
> +#define SENINF3_CSI2_DPCM_DI_32_DPCM_EN_MASK   (0x1 << 9)
> +#define SENINF3_CSI2_DPCM_DI_33_DPCM_EN_SHIFT  10
> +#define SENINF3_CSI2_DPCM_DI_33_DPCM_EN_MASK   (0x1 << 10)
> +#define SENINF3_CSI2_DPCM_DI_34_DPCM_EN_SHIFT  11
> +#define SENINF3_CSI2_DPCM_DI_34_DPCM_EN_MASK   (0x1 << 11)
> +#define SENINF3_CSI2_DPCM_DI_35_DPCM_EN_SHIFT  12
> +#define SENINF3_CSI2_DPCM_DI_35_DPCM_EN_MASK   (0x1 << 12)
> +#define SENINF3_CSI2_DPCM_DI_36_DPCM_EN_SHIFT  13
> +#define SENINF3_CSI2_DPCM_DI_36_DPCM_EN_MASK   (0x1 << 13)
> +#define SENINF3_CSI2_DPCM_DI_37_DPCM_EN_SHIFT  14
> +#define SENINF3_CSI2_DPCM_DI_37_DPCM_EN_MASK   (0x1 << 14)
> +#define SENINF3_CSI2_DPCM_DI_2A_DPCM_EN_SHIFT  15
> +#define SENINF3_CSI2_DPCM_DI_2A_DPCM_EN_MASK   (0x1 << 15)
> +#define SENINF3_CSI2_INT_EN                                    0x2A10
> +#define SENINF3_CSI2_INT_EN_ERR_FRAME_SYNC_SHIFT 0
> +#define SENINF3_CSI2_INT_EN_ERR_FRAME_SYNC_MASK (0x1 << 0)
> +#define SENINF3_CSI2_INT_EN_ERR_ID_SHIFT       1
> +#define SENINF3_CSI2_INT_EN_ERR_ID_MASK        (0x1 << 1)
> +#define SENINF3_CSI2_INT_EN_ERR_ECC_NO_ERROR_SHIFT 2
> +#define SENINF3_CSI2_INT_EN_ERR_ECC_NO_ERROR_MASK (0x1 << 2)
> +#define SENINF3_CSI2_INT_EN_ERR_ECC_CORRECTED_SHIFT 3
> +#define SENINF3_CSI2_INT_EN_ERR_ECC_CORRECTED_MASK (0x1 << 3)
> +#define SENINF3_CSI2_INT_EN_ERR_ECC_DOUBLE_SHIFT 4
> +#define SENINF3_CSI2_INT_EN_ERR_ECC_DOUBLE_MASK (0x1 << 4)
> +#define SENINF3_CSI2_INT_EN_ERR_CRC_SHIFT      5
> +#define SENINF3_CSI2_INT_EN_ERR_CRC_MASK       (0x1 << 5)
> +#define SENINF3_CSI2_INT_EN_ERR_CRC_NO_ERROR_SHIFT 6
> +#define SENINF3_CSI2_INT_EN_ERR_CRC_NO_ERROR_MASK (0x1 << 6)
> +#define SENINF3_CSI2_INT_EN_ERR_MULTI_LANE_SYNC_SHIFT 7
> +#define SENINF3_CSI2_INT_EN_ERR_MULTI_LANE_SYNC_MASK (0x1 << 7)
> +#define SENINF3_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD0_SHIFT 8
> +#define SENINF3_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD0_MASK (0x1 << 8)
> +#define SENINF3_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD1_SHIFT 9
> +#define SENINF3_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD1_MASK (0x1 << 9)
> +#define SENINF3_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD2_SHIFT 10
> +#define SENINF3_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD2_MASK (0x1 << 10)
> +#define SENINF3_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD3_SHIFT 11
> +#define SENINF3_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD3_MASK (0x1 << 11)
> +#define SENINF3_CSI2_INT_EN_FS_SHIFT           12
> +#define SENINF3_CSI2_INT_EN_FS_MASK            (0x1 << 12)
> +#define SENINF3_CSI2_INT_EN_LS_SHIFT           13
> +#define SENINF3_CSI2_INT_EN_LS_MASK            (0x1 << 13)
> +#define SENINF3_CSI2_INT_EN_GS_SHIFT           14
> +#define SENINF3_CSI2_INT_EN_GS_MASK            (0x1 << 14)
> +#define SENINF3_CSI2_INT_EN_FE_SHIFT           15
> +#define SENINF3_CSI2_INT_EN_FE_MASK            (0x1 << 15)
> +#define SENINF3_CSI2_INT_EN_ERR_FRAME_SYNC_S0_SHIFT 16
> +#define SENINF3_CSI2_INT_EN_ERR_FRAME_SYNC_S0_MASK (0x1 << 16)
> +#define SENINF3_CSI2_INT_EN_ERR_FRAME_SYNC_S1_SHIFT 17
> +#define SENINF3_CSI2_INT_EN_ERR_FRAME_SYNC_S1_MASK (0x1 << 17)
> +#define SENINF3_CSI2_INT_EN_ERR_FRAME_SYNC_S2_SHIFT 18
> +#define SENINF3_CSI2_INT_EN_ERR_FRAME_SYNC_S2_MASK (0x1 << 18)
> +#define SENINF3_CSI2_INT_EN_ERR_FRAME_SYNC_S3_SHIFT 19
> +#define SENINF3_CSI2_INT_EN_ERR_FRAME_SYNC_S3_MASK (0x1 << 19)
> +#define SENINF3_CSI2_INT_EN_ERR_FRAME_SYNC_S4_SHIFT 20
> +#define SENINF3_CSI2_INT_EN_ERR_FRAME_SYNC_S4_MASK (0x1 << 20)
> +#define SENINF3_CSI2_INT_EN_ERR_FRAME_SYNC_S5_SHIFT 21
> +#define SENINF3_CSI2_INT_EN_ERR_FRAME_SYNC_S5_MASK (0x1 << 21)
> +#define SENINF3_CSI2_INT_EN_ERR_LANE_RESYNC_SHIFT 22
> +#define SENINF3_CSI2_INT_EN_ERR_LANE_RESYNC_MASK (0x1 << 22)
> +#define SENINF3_CSI2_INT_EN_ERR_FRAME_SYNC_S6_SHIFT 23
> +#define SENINF3_CSI2_INT_EN_ERR_FRAME_SYNC_S6_MASK (0x1 << 23)
> +#define SENINF3_CSI2_INT_EN_ERR_FRAME_SYNC_S7_SHIFT 24
> +#define SENINF3_CSI2_INT_EN_ERR_FRAME_SYNC_S7_MASK (0x1 << 24)
> +#define SENINF3_CSI2_INT_EN_TRIO0_ESCAPE_CODE_DETECT_SHIFT 26
> +#define SENINF3_CSI2_INT_EN_TRIO0_ESCAPE_CODE_DETECT_MASK (0x1 << 26)
> +#define SENINF3_CSI2_INT_EN_TRIO1_ESCAPE_CODE_DETECT_SHIFT 27
> +#define SENINF3_CSI2_INT_EN_TRIO1_ESCAPE_CODE_DETECT_MASK (0x1 << 27)
> +#define SENINF3_CSI2_INT_EN_TRIO2_ESCAPE_CODE_DETECT_SHIFT 28
> +#define SENINF3_CSI2_INT_EN_TRIO2_ESCAPE_CODE_DETECT_MASK (0x1 << 28)
> +#define SENINF3_CSI2_INT_EN_TRIO3_ESCAPE_CODE_DETECT_SHIFT 29
> +#define SENINF3_CSI2_INT_EN_TRIO3_ESCAPE_CODE_DETECT_MASK (0x1 << 29)
> +#define SENINF3_CSI2_INT_EN_MERGE_FIFO_AF_SHIFT 30
> +#define SENINF3_CSI2_INT_EN_MERGE_FIFO_AF_MASK (0x1 << 30)
> +#define SENINF3_CSI2_INT_EN_INT_WCLR_EN_SHIFT  31
> +#define SENINF3_CSI2_INT_EN_INT_WCLR_EN_MASK   (0x1 << 31)
> +#define SENINF3_CSI2_INT_STATUS                                0x2A14
> +#define SENINF3_CSI2_INT_STATUS_ERR_FRAME_SYNC_STA_SHIFT 0
> +#define SENINF3_CSI2_INT_STATUS_ERR_FRAME_SYNC_STA_MASK (0x1 << 0)
> +#define SENINF3_CSI2_INT_STATUS_ERR_ID_STA_SHIFT 1
> +#define SENINF3_CSI2_INT_STATUS_ERR_ID_STA_MASK (0x1 << 1)
> +#define SENINF3_CSI2_INT_STATUS_ERR_ECC_NO_ERROR_STA_SHIFT 2
> +#define SENINF3_CSI2_INT_STATUS_ERR_ECC_NO_ERROR_STA_MASK (0x1 << 2)
> +#define SENINF3_CSI2_INT_STATUS_ERR_ECC_CORRECTED_STA_SHIFT 3
> +#define SENINF3_CSI2_INT_STATUS_ERR_ECC_CORRECTED_STA_MASK (0x1 << 3)
> +#define SENINF3_CSI2_INT_STATUS_ERR_ECC_DOUBLE_STA_SHIFT 4
> +#define SENINF3_CSI2_INT_STATUS_ERR_ECC_DOUBLE_STA_MASK (0x1 << 4)
> +#define SENINF3_CSI2_INT_STATUS_ERR_CRC_STA_SHIFT 5
> +#define SENINF3_CSI2_INT_STATUS_ERR_CRC_STA_MASK (0x1 << 5)
> +#define SENINF3_CSI2_INT_STATUS_ERR_MULTI_LANE_SYNC_STA_SHIFT 7
> +#define SENINF3_CSI2_INT_STATUS_ERR_MULTI_LANE_SYNC_STA_MASK (0x1 << 7)
> +#define SENINF3_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD0_STA_SHIFT 8
> +#define SENINF3_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD0_STA_MASK (0x1 << 8)
> +#define SENINF3_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD1_STA_SHIFT 9
> +#define SENINF3_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD1_STA_MASK (0x1 << 9)
> +#define SENINF3_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD2_STA_SHIFT 10
> +#define SENINF3_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD2_STA_MASK (0x1 << 10)
> +#define SENINF3_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD3_STA_SHIFT 11
> +#define SENINF3_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD3_STA_MASK (0x1 << 11)
> +#define SENINF3_CSI2_INT_STATUS_FS_STA_SHIFT   12
> +#define SENINF3_CSI2_INT_STATUS_FS_STA_MASK    (0x1 << 12)
> +#define SENINF3_CSI2_INT_STATUS_LS_STA_SHIFT   13
> +#define SENINF3_CSI2_INT_STATUS_LS_STA_MASK    (0x1 << 13)
> +#define SENINF3_CSI2_INT_STATUS_GS_STA_SHIFT   14
> +#define SENINF3_CSI2_INT_STATUS_GS_STA_MASK    (0x1 << 14)
> +#define SENINF3_CSI2_INT_STATUS_FE_STA_SHIFT   15
> +#define SENINF3_CSI2_INT_STATUS_FE_STA_MASK    (0x1 << 15)
> +#define SENINF3_CSI2_INT_STATUS_ERR_FRAME_SYNC_S0_STA_SHIFT 16
> +#define SENINF3_CSI2_INT_STATUS_ERR_FRAME_SYNC_S0_STA_MASK (0x1 << 16)
> +#define SENINF3_CSI2_INT_STATUS_ERR_FRAME_SYNC_S1_STA_SHIFT 17
> +#define SENINF3_CSI2_INT_STATUS_ERR_FRAME_SYNC_S1_STA_MASK (0x1 << 17)
> +#define SENINF3_CSI2_INT_STATUS_ERR_FRAME_SYNC_S2_STA_SHIFT 18
> +#define SENINF3_CSI2_INT_STATUS_ERR_FRAME_SYNC_S2_STA_MASK (0x1 << 18)
> +#define SENINF3_CSI2_INT_STATUS_ERR_FRAME_SYNC_S3_STA_SHIFT 19
> +#define SENINF3_CSI2_INT_STATUS_ERR_FRAME_SYNC_S3_STA_MASK (0x1 << 19)
> +#define SENINF3_CSI2_INT_STATUS_ERR_FRAME_SYNC_S4_STA_SHIFT 20
> +#define SENINF3_CSI2_INT_STATUS_ERR_FRAME_SYNC_S4_STA_MASK (0x1 << 20)
> +#define SENINF3_CSI2_INT_STATUS_ERR_FRAME_SYNC_S5_STA_SHIFT 21
> +#define SENINF3_CSI2_INT_STATUS_ERR_FRAME_SYNC_S5_STA_MASK (0x1 << 21)
> +#define SENINF3_CSI2_INT_STATUS_ERR_LANE_RESYNC_STA_SHIFT 22
> +#define SENINF3_CSI2_INT_STATUS_ERR_LANE_RESYNC_STA_MASK (0x1 << 22)
> +#define SENINF3_CSI2_INT_STATUS_ERR_FRAME_SYNC_S6_STA_SHIFT 23
> +#define SENINF3_CSI2_INT_STATUS_ERR_FRAME_SYNC_S6_STA_MASK (0x1 << 23)
> +#define SENINF3_CSI2_INT_STATUS_ERR_FRAME_SYNC_S7_STA_SHIFT 24
> +#define SENINF3_CSI2_INT_STATUS_ERR_FRAME_SYNC_S7_STA_MASK (0x1 << 24)
> +#define SENINF3_CSI2_INT_STATUS_TRIO0_ESCAPE_CODE_DETECT_STA_SHIFT 26
> +#define SENINF3_CSI2_INT_STATUS_TRIO0_ESCAPE_CODE_DETECT_STA_MASK (0x1 << 26)
> +#define SENINF3_CSI2_INT_STATUS_TRIO1_ESCAPE_CODE_DETECT_STA_SHIFT 27
> +#define SENINF3_CSI2_INT_STATUS_TRIO1_ESCAPE_CODE_DETECT_STA_MASK (0x1 << 27)
> +#define SENINF3_CSI2_INT_STATUS_TRIO2_ESCAPE_CODE_DETECT_STA_SHIFT 28
> +#define SENINF3_CSI2_INT_STATUS_TRIO2_ESCAPE_CODE_DETECT_STA_MASK (0x1 << 28)
> +#define SENINF3_CSI2_INT_STATUS_TRIO3_ESCAPE_CODE_DETECT_STA_SHIFT 29
> +#define SENINF3_CSI2_INT_STATUS_TRIO3_ESCAPE_CODE_DETECT_STA_MASK (0x1 << 29)
> +#define SENINF3_CSI2_INT_STATUS_MERGE_FIFO_AF_SHIFT 30
> +#define SENINF3_CSI2_INT_STATUS_MERGE_FIFO_AF_MASK (0x1 << 30)
> +#define SENINF3_CSI2_DGB_SEL                                   0x2A18
> +#define SENINF3_CSI2_DGB_SEL_DEBUG_SEL_SHIFT   0
> +#define SENINF3_CSI2_DGB_SEL_DEBUG_SEL_MASK    (0xff << 0)
> +#define SENINF3_CSI2_DGB_SEL_DEBUG_EN_SHIFT    31
> +#define SENINF3_CSI2_DGB_SEL_DEBUG_EN_MASK     (0x1 << 31)
> +#define SENINF3_CSI2_DBG_PORT                                  0x2A1C
> +#define SENINF3_CSI2_DBG_PORT_CTL_DBG_PORT_SHIFT 0
> +#define SENINF3_CSI2_DBG_PORT_CTL_DBG_PORT_MASK (0xffff << 0)
> +#define SENINF3_CSI2_SPARE0                                    0x2A20
> +#define SENINF3_CSI2_SPARE0_SPARE0_SHIFT       0
> +#define SENINF3_CSI2_SPARE0_SPARE0_MASK        (0xffffffff << 0)
> +#define SENINF3_CSI2_SPARE1                                    0x2A24
> +#define SENINF3_CSI2_SPARE1_SPARE1_SHIFT       0
> +#define SENINF3_CSI2_SPARE1_SPARE1_MASK        (0xffffffff << 0)
> +#define SENINF3_CSI2_LNRC_FSM                                  0x2A28
> +#define SENINF3_CSI2_LNRC_FSM_LNRC_RX_FSM_SHIFT 0
> +#define SENINF3_CSI2_LNRC_FSM_LNRC_RX_FSM_MASK (0x3f << 0)
> +#define SENINF3_CSI2_LNRD_FSM                                  0x2A2C
> +#define SENINF3_CSI2_LNRD_FSM_LNRD0_RX_FSM_SHIFT 0
> +#define SENINF3_CSI2_LNRD_FSM_LNRD0_RX_FSM_MASK (0x7f << 0)
> +#define SENINF3_CSI2_LNRD_FSM_LNRD1_RX_FSM_SHIFT 8
> +#define SENINF3_CSI2_LNRD_FSM_LNRD1_RX_FSM_MASK (0x7f << 8)
> +#define SENINF3_CSI2_LNRD_FSM_LNRD2_RX_FSM_SHIFT 16
> +#define SENINF3_CSI2_LNRD_FSM_LNRD2_RX_FSM_MASK (0x7f << 16)
> +#define SENINF3_CSI2_LNRD_FSM_LNRD3_RX_FSM_SHIFT 24
> +#define SENINF3_CSI2_LNRD_FSM_LNRD3_RX_FSM_MASK (0x7f << 24)
> +#define SENINF3_CSI2_FRAME_LINE_NUM                            0x2A30
> +#define SENINF3_CSI2_FRAME_LINE_NUM_FRAME_NUM_SHIFT 0
> +#define SENINF3_CSI2_FRAME_LINE_NUM_FRAME_NUM_MASK (0xffff << 0)
> +#define SENINF3_CSI2_FRAME_LINE_NUM_LINE_NUM_SHIFT 16
> +#define SENINF3_CSI2_FRAME_LINE_NUM_LINE_NUM_MASK (0xffff << 16)
> +#define SENINF3_CSI2_GENERIC_SHORT                             0x2A34
> +#define SENINF3_CSI2_GENERIC_SHORT_GENERIC_SHORT_PACKET_DT_SHIFT 0
> +#define SENINF3_CSI2_GENERIC_SHORT_GENERIC_SHORT_PACKET_DT_MASK (0x3f << 0)
> +#define SENINF3_CSI2_GENERIC_SHORT_GENERIC_SHORT_PACKET_DATA_SHIFT 16
> +#define SENINF3_CSI2_GENERIC_SHORT_GENERIC_SHORT_PACKET_DATA_MASK \
> +(0xffff << 16)
> +#define SENINF3_CSI2_HSRX_DBG                                  0x2A38
> +#define SENINF3_CSI2_HSRX_DBG_DATA_LANE0_HSRX_EN_SHIFT 0
> +#define SENINF3_CSI2_HSRX_DBG_DATA_LANE0_HSRX_EN_MASK (0x1 << 0)
> +#define SENINF3_CSI2_HSRX_DBG_DATA_LANE1_HSRX_EN_SHIFT 1
> +#define SENINF3_CSI2_HSRX_DBG_DATA_LANE1_HSRX_EN_MASK (0x1 << 1)
> +#define SENINF3_CSI2_HSRX_DBG_DATA_LANE2_HSRX_EN_SHIFT 2
> +#define SENINF3_CSI2_HSRX_DBG_DATA_LANE2_HSRX_EN_MASK (0x1 << 2)
> +#define SENINF3_CSI2_HSRX_DBG_DATA_LANE3_HSRX_EN_SHIFT 3
> +#define SENINF3_CSI2_HSRX_DBG_DATA_LANE3_HSRX_EN_MASK (0x1 << 3)
> +#define SENINF3_CSI2_HSRX_DBG_CLOCK_LANE_HSRX_EN_SHIFT 4
> +#define SENINF3_CSI2_HSRX_DBG_CLOCK_LANE_HSRX_EN_MASK (0x1 << 4)
> +#define SENINF3_CSI2_DI                                        0x2A3C
> +#define SENINF3_CSI2_DI_VC0_SHIFT              0
> +#define SENINF3_CSI2_DI_VC0_MASK               (0x3 << 0)
> +#define SENINF3_CSI2_DI_DT0_SHIFT              2
> +#define SENINF3_CSI2_DI_DT0_MASK               (0x3f << 2)
> +#define SENINF3_CSI2_DI_VC1_SHIFT              8
> +#define SENINF3_CSI2_DI_VC1_MASK               (0x3 << 8)
> +#define SENINF3_CSI2_DI_DT1_SHIFT              10
> +#define SENINF3_CSI2_DI_DT1_MASK               (0x3f << 10)
> +#define SENINF3_CSI2_DI_VC2_SHIFT              16
> +#define SENINF3_CSI2_DI_VC2_MASK               (0x3 << 16)
> +#define SENINF3_CSI2_DI_DT2_SHIFT              18
> +#define SENINF3_CSI2_DI_DT2_MASK               (0x3f << 18)
> +#define SENINF3_CSI2_DI_VC3_SHIFT              24
> +#define SENINF3_CSI2_DI_VC3_MASK               (0x3 << 24)
> +#define SENINF3_CSI2_DI_DT3_SHIFT              26
> +#define SENINF3_CSI2_DI_DT3_MASK               (0x3f << 26)
> +#define SENINF3_CSI2_HS_TRAIL                                  0x2A40
> +#define SENINF3_CSI2_HS_TRAIL_HS_TRAIL_PARAMETER_SHIFT 0
> +#define SENINF3_CSI2_HS_TRAIL_HS_TRAIL_PARAMETER_MASK (0xff << 0)
> +#define SENINF3_CSI2_DI_CTRL                                   0x2A44
> +#define SENINF3_CSI2_DI_CTRL_VC0_INTERLEAVING_SHIFT 0
> +#define SENINF3_CSI2_DI_CTRL_VC0_INTERLEAVING_MASK (0x1 << 0)
> +#define SENINF3_CSI2_DI_CTRL_DT0_INTERLEAVING_SHIFT 1
> +#define SENINF3_CSI2_DI_CTRL_DT0_INTERLEAVING_MASK (0x3 << 1)
> +#define SENINF3_CSI2_DI_CTRL_VC1_INTERLEAVING_SHIFT 8
> +#define SENINF3_CSI2_DI_CTRL_VC1_INTERLEAVING_MASK (0x1 << 8)
> +#define SENINF3_CSI2_DI_CTRL_DT1_INTERLEAVING_SHIFT 9
> +#define SENINF3_CSI2_DI_CTRL_DT1_INTERLEAVING_MASK (0x3 << 9)
> +#define SENINF3_CSI2_DI_CTRL_VC2_INTERLEAVING_SHIFT 16
> +#define SENINF3_CSI2_DI_CTRL_VC2_INTERLEAVING_MASK (0x1 << 16)
> +#define SENINF3_CSI2_DI_CTRL_DT2_INTERLEAVING_SHIFT 17
> +#define SENINF3_CSI2_DI_CTRL_DT2_INTERLEAVING_MASK (0x3 << 17)
> +#define SENINF3_CSI2_DI_CTRL_VC3_INTERLEAVING_SHIFT 24
> +#define SENINF3_CSI2_DI_CTRL_VC3_INTERLEAVING_MASK (0x1 << 24)
> +#define SENINF3_CSI2_DI_CTRL_DT3_INTERLEAVING_SHIFT 25
> +#define SENINF3_CSI2_DI_CTRL_DT3_INTERLEAVING_MASK (0x3 << 25)
> +#define SENINF3_CSI2_DETECT_CON1                               0x2A4C
> +#define SENINF3_CSI2_DETECT_CON1_DETECT_SYNC_DISABLE_SHIFT 0
> +#define SENINF3_CSI2_DETECT_CON1_DETECT_SYNC_DISABLE_MASK (0x1 << 0)
> +#define SENINF3_CSI2_DETECT_CON1_DETECT_SYNC_MASK_SHIFT 1
> +#define SENINF3_CSI2_DETECT_CON1_DETECT_SYNC_MASK_MASK (0x7f << 1)
> +#define SENINF3_CSI2_DETECT_CON1_SYNC_WORD_SHIFT 8
> +#define SENINF3_CSI2_DETECT_CON1_SYNC_WORD_MASK (0x1fffff << 8)
> +#define SENINF3_CSI2_DETECT_CON2                               0x2A50
> +#define SENINF3_CSI2_DETECT_CON2_DETECT_ESCAPE_DISABLE_SHIFT 0
> +#define SENINF3_CSI2_DETECT_CON2_DETECT_ESCAPE_DISABLE_MASK (0x1 << 0)
> +#define SENINF3_CSI2_DETECT_CON2_DETECT_ESCAPE_MASK_SHIFT 1
> +#define SENINF3_CSI2_DETECT_CON2_DETECT_ESCAPE_MASK_MASK (0x7f << 1)
> +#define SENINF3_CSI2_DETECT_CON2_ESCAPE_WORD_SHIFT 8
> +#define SENINF3_CSI2_DETECT_CON2_ESCAPE_WORD_MASK (0x1fffff << 8)
> +#define SENINF3_CSI2_DETECT_CON3                               0x2A54
> +#define SENINF3_CSI2_DETECT_CON3_DETECT_POST_DISABLE_SHIFT 0
> +#define SENINF3_CSI2_DETECT_CON3_DETECT_POST_DISABLE_MASK (0x1 << 0)
> +#define SENINF3_CSI2_DETECT_CON3_DETECT_POST_MASK_SHIFT 1
> +#define SENINF3_CSI2_DETECT_CON3_DETECT_POST_MASK_MASK (0x7f << 1)
> +#define SENINF3_CSI2_DETECT_CON3_POST_WORD_SHIFT 8
> +#define SENINF3_CSI2_DETECT_CON3_POST_WORD_MASK (0x1fffff << 8)
> +#define SENINF3_CSI2_RLR0_CON0                                 0x2A58
> +#define SENINF3_CSI2_RLR0_CON0_RLR0_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF3_CSI2_RLR0_CON0_RLR0_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF3_CSI2_RLR0_CON0_RLR0_PRBS_SEED_0_SHIFT 8
> +#define SENINF3_CSI2_RLR0_CON0_RLR0_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF3_CSI2_RLR0_CON0_RLR0_PRBS_SEED_1_SHIFT 16
> +#define SENINF3_CSI2_RLR0_CON0_RLR0_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF3_CSI2_RLR0_CON0_RLR0_PRBS_SEED_2_SHIFT 24
> +#define SENINF3_CSI2_RLR0_CON0_RLR0_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF3_CSI2_RLR1_CON0                                 0x2A5C
> +#define SENINF3_CSI2_RLR1_CON0_RLR1_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF3_CSI2_RLR1_CON0_RLR1_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF3_CSI2_RLR1_CON0_RLR1_PRBS_SEED_0_SHIFT 8
> +#define SENINF3_CSI2_RLR1_CON0_RLR1_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF3_CSI2_RLR1_CON0_RLR1_PRBS_SEED_1_SHIFT 16
> +#define SENINF3_CSI2_RLR1_CON0_RLR1_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF3_CSI2_RLR1_CON0_RLR1_PRBS_SEED_2_SHIFT 24
> +#define SENINF3_CSI2_RLR1_CON0_RLR1_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF3_CSI2_RLR2_CON0                                 0x2A60
> +#define SENINF3_CSI2_RLR2_CON0_RLR2_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF3_CSI2_RLR2_CON0_RLR2_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF3_CSI2_RLR2_CON0_RLR2_PRBS_SEED_0_SHIFT 8
> +#define SENINF3_CSI2_RLR2_CON0_RLR2_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF3_CSI2_RLR2_CON0_RLR2_PRBS_SEED_1_SHIFT 16
> +#define SENINF3_CSI2_RLR2_CON0_RLR2_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF3_CSI2_RLR2_CON0_RLR2_PRBS_SEED_2_SHIFT 24
> +#define SENINF3_CSI2_RLR2_CON0_RLR2_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF3_CSI2_RLR_CON0                                  0x2A64
> +#define SENINF3_CSI2_RLR_CON0_RLRN_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF3_CSI2_RLR_CON0_RLRN_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF3_CSI2_RLR_CON0_RLRN_PRBS_SEED_0_SHIFT 8
> +#define SENINF3_CSI2_RLR_CON0_RLRN_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF3_CSI2_RLR_CON0_RLRN_PRBS_SEED_1_SHIFT 16
> +#define SENINF3_CSI2_RLR_CON0_RLRN_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF3_CSI2_RLR_CON0_RLRN_PRBS_SEED_2_SHIFT 24
> +#define SENINF3_CSI2_RLR_CON0_RLRN_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF3_CSI2_MUX_CON                                   0x2A68
> +#define SENINF3_CSI2_MUX_CON_DPHY_RX_EXTERNAL_EN_SHIFT 0
> +#define SENINF3_CSI2_MUX_CON_DPHY_RX_EXTERNAL_EN_MASK (0x1 << 0)
> +#define SENINF3_CSI2_MUX_CON_CPHY_TX_EXTERNAL_EN_SHIFT 1
> +#define SENINF3_CSI2_MUX_CON_CPHY_TX_EXTERNAL_EN_MASK (0x1 << 1)
> +#define SENINF3_CSI2_MUX_CON_CPHY_RX_EXTERNAL_EN_SHIFT 2
> +#define SENINF3_CSI2_MUX_CON_CPHY_RX_EXTERNAL_EN_MASK (0x1 << 2)
> +#define SENINF3_CSI2_MUX_CON_RLR_PATTERN_DELAY_EN_SHIFT 3
> +#define SENINF3_CSI2_MUX_CON_RLR_PATTERN_DELAY_EN_MASK (0x1 << 3)
> +#define SENINF3_CSI2_MUX_CON_POST_PACKET_IGNORE_EN_SHIFT 4
> +#define SENINF3_CSI2_MUX_CON_POST_PACKET_IGNORE_EN_MASK (0x1 << 4)
> +#define SENINF3_CSI2_DETECT_DBG0                               0x2A6C
> +#define SENINF3_CSI2_DETECT_DBG0_DETECT_SYNC_LANE0_ST_SHIFT 0
> +#define SENINF3_CSI2_DETECT_DBG0_DETECT_SYNC_LANE0_ST_MASK (0x1 << 0)
> +#define SENINF3_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE0_ST_SHIFT 1
> +#define SENINF3_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE0_ST_MASK (0x1 << 1)
> +#define SENINF3_CSI2_DETECT_DBG0_DETECT_POST_LANE0_ST_SHIFT 2
> +#define SENINF3_CSI2_DETECT_DBG0_DETECT_POST_LANE0_ST_MASK (0x1 << 2)
> +#define SENINF3_CSI2_DETECT_DBG0_POSITION_SYNC_LANE0_ST_SHIFT 3
> +#define SENINF3_CSI2_DETECT_DBG0_POSITION_SYNC_LANE0_ST_MASK (0xf << 3)
> +#define SENINF3_CSI2_DETECT_DBG0_POSITION_ESCAPE_LANE0_ST_SHIFT 7
> +#define SENINF3_CSI2_DETECT_DBG0_POSITION_ESCAPE_LANE0_ST_MASK (0xf << 7)
> +#define SENINF3_CSI2_DETECT_DBG0_DETECT_SYNC_LANE1_ST_SHIFT 12
> +#define SENINF3_CSI2_DETECT_DBG0_DETECT_SYNC_LANE1_ST_MASK (0x1 << 12)
> +#define SENINF3_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE1_ST_SHIFT 13
> +#define SENINF3_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE1_ST_MASK (0x1 << 13)
> +#define SENINF3_CSI2_DETECT_DBG0_DETECT_POST_LANE1_ST_SHIFT 14
> +#define SENINF3_CSI2_DETECT_DBG0_DETECT_POST_LANE1_ST_MASK (0x1 << 14)
> +#define SENINF3_CSI2_DETECT_DBG0_POSITION_SYNC_LANE1_ST_SHIFT 15
> +#define SENINF3_CSI2_DETECT_DBG0_POSITION_SYNC_LANE1_ST_MASK (0xf << 15)
> +#define SENINF3_CSI2_DETECT_DBG0_POSITION_ESCAPE_LANE1_ST_SHIFT 19
> +#define SENINF3_CSI2_DETECT_DBG0_POSITION_ESCAPE_LANE1_ST_MASK (0xf << 19)
> +#define SENINF3_CSI2_DETECT_DBG0_DETECT_SYNC_LANE2_ST_SHIFT 24
> +#define SENINF3_CSI2_DETECT_DBG0_DETECT_SYNC_LANE2_ST_MASK (0x1 << 24)
> +#define SENINF3_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE2_ST_SHIFT 25
> +#define SENINF3_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE2_ST_MASK (0x1 << 25)
> +#define SENINF3_CSI2_DETECT_DBG0_DETECT_POST_LANE2_ST_SHIFT 26
> +#define SENINF3_CSI2_DETECT_DBG0_DETECT_POST_LANE2_ST_MASK (0x1 << 26)
> +#define SENINF3_CSI2_DETECT_DBG0_POSITION_SYNC_LANE2_ST_SHIFT 27
> +#define SENINF3_CSI2_DETECT_DBG0_POSITION_SYNC_LANE2_ST_MASK (0xf << 27)
> +#define SENINF3_CSI2_DETECT_DBG1                               0x2A70
> +#define SENINF3_CSI2_DETECT_DBG1_POSITION_ESCAPE_LANE2_ST_SHIFT 0
> +#define SENINF3_CSI2_DETECT_DBG1_POSITION_ESCAPE_LANE2_ST_MASK (0xf << 0)
> +#define SENINF3_CSI2_RESYNC_MERGE_CTL                          0x2A74
> +#define SENINF3_CSI2_RESYNC_MERGE_CTL_CPHY_LANE_RESYNC_CNT_SHIFT 0
> +#define SENINF3_CSI2_RESYNC_MERGE_CTL_CPHY_LANE_RESYNC_CNT_MASK (0x7 << 0)
> +#define SENINF3_CSI2_RESYNC_MERGE_CTL_LANE_RESYNC_FLUSH_EN_SHIFT 8
> +#define SENINF3_CSI2_RESYNC_MERGE_CTL_LANE_RESYNC_FLUSH_EN_MASK (0x1 << 8)
> +#define SENINF3_CSI2_RESYNC_MERGE_CTL_LANE_RESYNC_DATAOUT_OPTION_SHIFT 9
> +#define SENINF3_CSI2_RESYNC_MERGE_CTL_LANE_RESYNC_DATAOUT_OPTION_MASK (0x1 << 9)
> +#define SENINF3_CSI2_RESYNC_MERGE_CTL_BYPASS_LANE_RESYNC_SHIFT 10
> +#define SENINF3_CSI2_RESYNC_MERGE_CTL_BYPASS_LANE_RESYNC_MASK (0x1 << 10)
> +#define SENINF3_CSI2_RESYNC_MERGE_CTL_CDPHY_SEL_SHIFT 11
> +#define SENINF3_CSI2_RESYNC_MERGE_CTL_CDPHY_SEL_MASK (0x1 << 11)
> +#define SENINF3_CSI2_CTRL_TRIO_MUX                             0x2A78
> +#define SENINF3_CSI2_CTRL_TRIO_MUX_TRIO0_MUX_SHIFT 0
> +#define SENINF3_CSI2_CTRL_TRIO_MUX_TRIO0_MUX_MASK (0x7 << 0)
> +#define SENINF3_CSI2_CTRL_TRIO_MUX_TRIO1_MUX_SHIFT 3
> +#define SENINF3_CSI2_CTRL_TRIO_MUX_TRIO1_MUX_MASK (0x7 << 3)
> +#define SENINF3_CSI2_CTRL_TRIO_MUX_TRIO2_MUX_SHIFT 6
> +#define SENINF3_CSI2_CTRL_TRIO_MUX_TRIO2_MUX_MASK (0x7 << 6)
> +#define SENINF3_CSI2_CTRL_TRIO_MUX_TRIO3_MUX_SHIFT 9
> +#define SENINF3_CSI2_CTRL_TRIO_MUX_TRIO3_MUX_MASK (0x7 << 9)
> +#define SENINF3_CSI2_CTRL_TRIO_CON                             0x2A7C
> +#define SENINF3_CSI2_CTRL_TRIO_CON_TRIO0_LPRX_EN_SHIFT 0
> +#define SENINF3_CSI2_CTRL_TRIO_CON_TRIO0_LPRX_EN_MASK (0x1 << 0)
> +#define SENINF3_CSI2_CTRL_TRIO_CON_TRIO0_HSRX_EN_SHIFT 1
> +#define SENINF3_CSI2_CTRL_TRIO_CON_TRIO0_HSRX_EN_MASK (0x1 << 1)
> +#define SENINF3_CSI2_CTRL_TRIO_CON_TRIO1_LPRX_EN_SHIFT 2
> +#define SENINF3_CSI2_CTRL_TRIO_CON_TRIO1_LPRX_EN_MASK (0x1 << 2)
> +#define SENINF3_CSI2_CTRL_TRIO_CON_TRIO1_HSRX_EN_SHIFT 3
> +#define SENINF3_CSI2_CTRL_TRIO_CON_TRIO1_HSRX_EN_MASK (0x1 << 3)
> +#define SENINF3_CSI2_CTRL_TRIO_CON_TRIO2_LPRX_EN_SHIFT 4
> +#define SENINF3_CSI2_CTRL_TRIO_CON_TRIO2_LPRX_EN_MASK (0x1 << 4)
> +#define SENINF3_CSI2_CTRL_TRIO_CON_TRIO2_HSRX_EN_SHIFT 5
> +#define SENINF3_CSI2_CTRL_TRIO_CON_TRIO2_HSRX_EN_MASK (0x1 << 5)
> +#define SENINF3_CSI2_CTRL_TRIO_CON_TRIO3_LPRX_EN_SHIFT 6
> +#define SENINF3_CSI2_CTRL_TRIO_CON_TRIO3_LPRX_EN_MASK (0x1 << 6)
> +#define SENINF3_CSI2_CTRL_TRIO_CON_TRIO3_HSRX_EN_SHIFT 7
> +#define SENINF3_CSI2_CTRL_TRIO_CON_TRIO3_HSRX_EN_MASK (0x1 << 7)
> +#define SENINF3_FIX_ADDR_CPHY0_DBG                             0x2A80
> +#define SENINF3_FIX_ADDR_CPHY0_DBG_ERROR_COUNT_CPHY0_SHIFT 16
> +#define SENINF3_FIX_ADDR_CPHY0_DBG_ERROR_COUNT_CPHY0_MASK (0xff << 16)
> +#define SENINF3_FIX_ADDR_CPHY0_DBG_WORD_COUNT_OVER_FLOAT_CPHY0_SHIFT 24
> +#define SENINF3_FIX_ADDR_CPHY0_DBG_WORD_COUNT_OVER_FLOAT_CPHY0_MASK (0x1 << 24)
> +#define SENINF3_FIX_ADDR_CPHY1_DBG                             0x2A84
> +#define SENINF3_FIX_ADDR_CPHY1_DBG_ERROR_COUNT_CPHY1_SHIFT 16
> +#define SENINF3_FIX_ADDR_CPHY1_DBG_ERROR_COUNT_CPHY1_MASK (0xff << 16)
> +#define SENINF3_FIX_ADDR_CPHY1_DBG_WORD_COUNT_OVER_FLOAT_CPHY1_SHIFT 24
> +#define SENINF3_FIX_ADDR_CPHY1_DBG_WORD_COUNT_OVER_FLOAT_CPHY1_MASK (0x1 << 24)
> +#define SENINF3_FIX_ADDR_CPHY2_DBG                             0x2A88
> +#define SENINF3_FIX_ADDR_CPHY2_DBG_ERROR_COUNT_CPHY2_SHIFT 16
> +#define SENINF3_FIX_ADDR_CPHY2_DBG_ERROR_COUNT_CPHY2_MASK (0xff << 16)
> +#define SENINF3_FIX_ADDR_CPHY2_DBG_WORD_COUNT_OVER_FLOAT_CPHY2_SHIFT 24
> +#define SENINF3_FIX_ADDR_CPHY2_DBG_WORD_COUNT_OVER_FLOAT_CPHY2_MASK (0x1 << 24)
> +#define SENINF3_FIX_ADDR_DBG                                   0x2A8C
> +#define SENINF3_FIX_ADDR_DBG_ERROR_COUNT_SHIFT 16
> +#define SENINF3_FIX_ADDR_DBG_ERROR_COUNT_MASK  (0xff << 16)
> +#define SENINF3_FIX_ADDR_DBG_WORD_COUNT_OVER_FLOAT_SHIFT 24
> +#define SENINF3_FIX_ADDR_DBG_WORD_COUNT_OVER_FLOAT_MASK (0x1 << 24)
> +#define SENINF3_WIRE_STATE_DECODE_CPHY0_DBG0                   0x2A90
> +#define SENINF3_WIRE_STATE_DECODE_CPHY0_DBG0_SYMBOL_STREAM0_CPHY0_SHIFT 0
> +#define SENINF3_WIRE_STATE_DECODE_CPHY0_DBG0_SYMBOL_STREAM0_CPHY0_MASK \
> +(0xffffffff << 0)
> +#define SENINF3_WIRE_STATE_DECODE_CPHY0_DBG1                   0x2A94
> +#define SENINF3_WIRE_STATE_DECODE_CPHY0_DBG1_SYMBOL_STREAM1_CPHY0_SHIFT 0
> +#define SENINF3_WIRE_STATE_DECODE_CPHY0_DBG1_SYMBOL_STREAM1_CPHY0_MASK \
> +(0x3ff << 0)
> +#define SENINF3_WIRE_STATE_DECODE_CPHY0_DBG1_SYMBOL_STREAM_VALID_CPHY0_SHIFT 10
> +#define SENINF3_WIRE_STATE_DECODE_CPHY0_DBG1_SYMBOL_STREAM_VALID_CPHY0_MASK \
> +(0x1 << 10)
> +#define SENINF3_WIRE_STATE_DECODE_CPHY1_DBG0                   0x2A98
> +#define SENINF3_WIRE_STATE_DECODE_CPHY1_DBG0_SYMBOL_STREAM0_CPHY1_SHIFT 0
> +#define SENINF3_WIRE_STATE_DECODE_CPHY1_DBG0_SYMBOL_STREAM0_CPHY1_MASK \
> +(0xffffffff << 0)
> +#define SENINF3_WIRE_STATE_DECODE_CPHY1_DBG1                   0x2A9C
> +#define SENINF3_WIRE_STATE_DECODE_CPHY1_DBG1_SYMBOL_STREAM1_CPHY1_SHIFT 0
> +#define SENINF3_WIRE_STATE_DECODE_CPHY1_DBG1_SYMBOL_STREAM1_CPHY1_MASK \
> +(0x3ff << 0)
> +#define SENINF3_WIRE_STATE_DECODE_CPHY1_DBG1_SYMBOL_STREAM_VALID_CPHY1_SHIFT 10
> +#define SENINF3_WIRE_STATE_DECODE_CPHY1_DBG1_SYMBOL_STREAM_VALID_CPHY1_MASK \
> +(0x1 << 10)
> +#define SENINF3_WIRE_STATE_DECODE_CPHY2_DBG0                   0x2AA0
> +#define SENINF3_WIRE_STATE_DECODE_CPHY2_DBG0_SYMBOL_STREAM0_CPHY2_SHIFT 0
> +#define SENINF3_WIRE_STATE_DECODE_CPHY2_DBG0_SYMBOL_STREAM0_CPHY2_MASK \
> +(0xffffffff << 0)
> +#define SENINF3_WIRE_STATE_DECODE_CPHY2_DBG1                   0x2AA4
> +#define SENINF3_WIRE_STATE_DECODE_CPHY2_DBG1_SYMBOL_STREAM1_CPHY2_SHIFT 0
> +#define SENINF3_WIRE_STATE_DECODE_CPHY2_DBG1_SYMBOL_STREAM1_CPHY2_MASK \
> +(0x3ff << 0)
> +#define SENINF3_WIRE_STATE_DECODE_CPHY2_DBG1_SYMBOL_STREAM_VALID_CPHY2_SHIFT 10
> +#define SENINF3_WIRE_STATE_DECODE_CPHY2_DBG1_SYMBOL_STREAM_VALID_CPHY2_MASK \
> +(0x1 << 10)
> +#define SENINF3_SYNC_RESYNC_CTL                                0x2AA8
> +#define SENINF3_SYNC_RESYNC_CTL_SYNC_DETECTION_SEL_SHIFT 0
> +#define SENINF3_SYNC_RESYNC_CTL_SYNC_DETECTION_SEL_MASK (0x7 << 0)
> +#define SENINF3_SYNC_RESYNC_CTL_FLUSH_VALID_SHIFT 3
> +#define SENINF3_SYNC_RESYNC_CTL_FLUSH_VALID_MASK (0x1 << 3)
> +#define SENINF3_POST_DETECT_CTL                                0x2AAC
> +#define SENINF3_POST_DETECT_CTL_POST_DETECT_DISABLE_SHIFT 0
> +#define SENINF3_POST_DETECT_CTL_POST_DETECT_DISABLE_MASK (0x1 << 0)
> +#define SENINF3_POST_DETECT_CTL_POST_EN_SHIFT  1
> +#define SENINF3_POST_DETECT_CTL_POST_EN_MASK   (0x1 << 1)
> +#define SENINF3_WIRE_STATE_DECODE_CONFIG                       0x2AB0
> +#define SENINF3_WIRE_STATE_DECODE_CONFIG_INIT_STATE_DECODE_SHIFT 0
> +#define SENINF3_WIRE_STATE_DECODE_CONFIG_INIT_STATE_DECODE_MASK (0x7 << 0)
> +#define SENINF3_CSI2_CPHY_LNRD_FSM                             0x2AB4
> +#define SENINF3_CSI2_CPHY_LNRD_FSM_TRIO0_RX_FSM_SHIFT 8
> +#define SENINF3_CSI2_CPHY_LNRD_FSM_TRIO0_RX_FSM_MASK (0x7f << 8)
> +#define SENINF3_CSI2_CPHY_LNRD_FSM_TRIO1_RX_FSM_SHIFT 16
> +#define SENINF3_CSI2_CPHY_LNRD_FSM_TRIO1_RX_FSM_MASK (0x7f << 16)
> +#define SENINF3_CSI2_CPHY_LNRD_FSM_TRIO2_RX_FSM_SHIFT 24
> +#define SENINF3_CSI2_CPHY_LNRD_FSM_TRIO2_RX_FSM_MASK (0x7f << 24)
> +#define SENINF3_FIX_ADDR_CPHY0_DBG0                            0x2AB8
> +#define SENINF3_FIX_ADDR_CPHY0_DBG0_WORD_COUNT_CPHY0_DBG0_SHIFT 0
> +#define SENINF3_FIX_ADDR_CPHY0_DBG0_WORD_COUNT_CPHY0_DBG0_MASK \
> +(0xffffffff << 0)
> +#define SENINF3_FIX_ADDR_CPHY0_DBG1                            0x2ABC
> +#define SENINF3_FIX_ADDR_CPHY0_DBG1_WORD_COUNT_CPHY0_DBG1_SHIFT 0
> +#define SENINF3_FIX_ADDR_CPHY0_DBG1_WORD_COUNT_CPHY0_DBG1_MASK (0xffff << 0)
> +#define SENINF3_FIX_ADDR_CPHY0_DBG1_ERROR_RECORD_CPHY0_DBG0_SHIFT 16
> +#define SENINF3_FIX_ADDR_CPHY0_DBG1_ERROR_RECORD_CPHY0_DBG0_MASK (0xffff << 16)
> +#define SENINF3_FIX_ADDR_CPHY0_DBG2                            0x2AC0
> +#define SENINF3_FIX_ADDR_CPHY0_DBG2_ERROR_RECORD_CPHY0_DBG1_SHIFT 0
> +#define SENINF3_FIX_ADDR_CPHY0_DBG2_ERROR_RECORD_CPHY0_DBG1_MASK \
> +(0xffffffff << 0)
> +#define SENINF3_FIX_ADDR_CPHY1_DBG0                            0x2AC4
> +#define SENINF3_FIX_ADDR_CPHY1_DBG0_WORD_COUNT_CPHY1_DBG0_SHIFT 0
> +#define SENINF3_FIX_ADDR_CPHY1_DBG0_WORD_COUNT_CPHY1_DBG0_MASK \
> +(0xffffffff << 0)
> +#define SENINF3_FIX_ADDR_CPHY1_DBG1                            0x2AC8
> +#define SENINF3_FIX_ADDR_CPHY1_DBG1_WORD_COUNT_CPHY1_DBG1_SHIFT 0
> +#define SENINF3_FIX_ADDR_CPHY1_DBG1_WORD_COUNT_CPHY1_DBG1_MASK (0xffff << 0)
> +#define SENINF3_FIX_ADDR_CPHY1_DBG1_ERROR_RECORD_CPHY1_DBG0_SHIFT 16
> +#define SENINF3_FIX_ADDR_CPHY1_DBG1_ERROR_RECORD_CPHY1_DBG0_MASK (0xffff << 16)
> +#define SENINF3_FIX_ADDR_CPHY1_DBG2                            0x2ACC
> +#define SENINF3_FIX_ADDR_CPHY1_DBG2_ERROR_RECORD_CPHY1_DBG1_SHIFT 0
> +#define SENINF3_FIX_ADDR_CPHY1_DBG2_ERROR_RECORD_CPHY1_DBG1_MASK \
> +(0xffffffff << 0)
> +#define SENINF3_FIX_ADDR_CPHY2_DBG0                            0x2AD0
> +#define SENINF3_FIX_ADDR_CPHY2_DBG0_WORD_COUNT_CPHY2_DBG0_SHIFT 0
> +#define SENINF3_FIX_ADDR_CPHY2_DBG0_WORD_COUNT_CPHY2_DBG0_MASK \
> +(0xffffffff << 0)
> +#define SENINF3_FIX_ADDR_CPHY2_DBG1                            0x2AD4
> +#define SENINF3_FIX_ADDR_CPHY2_DBG1_WORD_COUNT_CPHY2_DBG1_SHIFT 0
> +#define SENINF3_FIX_ADDR_CPHY2_DBG1_WORD_COUNT_CPHY2_DBG1_MASK (0xffff << 0)
> +#define SENINF3_FIX_ADDR_CPHY2_DBG1_ERROR_RECORD_CPHY2_DBG0_SHIFT 16
> +#define SENINF3_FIX_ADDR_CPHY2_DBG1_ERROR_RECORD_CPHY2_DBG0_MASK \
> +(0xffff << 16)
> +#define SENINF3_FIX_ADDR_CPHY2_DBG2                            0x2AD8
> +#define SENINF3_FIX_ADDR_CPHY2_DBG2_ERROR_RECORD_CPHY2_DBG1_SHIFT 0
> +#define SENINF3_FIX_ADDR_CPHY2_DBG2_ERROR_RECORD_CPHY2_DBG1_MASK \
> +(0xffffffff << 0)
> +#define SENINF3_FIX_ADDR_DBG0                                  0x2ADC
> +#define SENINF3_FIX_ADDR_DBG0_WORD_COUNT_DBG0_SHIFT 0
> +#define SENINF3_FIX_ADDR_DBG0_WORD_COUNT_DBG0_MASK (0xffffffff << 0)
> +#define SENINF3_FIX_ADDR_DBG1                                  0x2AE0
> +#define SENINF3_FIX_ADDR_DBG1_WORD_COUNT_DBG1_SHIFT 0
> +#define SENINF3_FIX_ADDR_DBG1_WORD_COUNT_DBG1_MASK (0xffff << 0)
> +#define SENINF3_FIX_ADDR_DBG1_ERROR_RECORD_DBG0_SHIFT 16
> +#define SENINF3_FIX_ADDR_DBG1_ERROR_RECORD_DBG0_MASK (0xffff << 16)
> +#define SENINF3_FIX_ADDR_DBG2                                  0x2AE4
> +#define SENINF3_FIX_ADDR_DBG2_ERROR_RECORD_DBG1_SHIFT 0
> +#define SENINF3_FIX_ADDR_DBG2_ERROR_RECORD_DBG1_MASK (0xffffffff << 0)
> +#define SENINF3_CSI2_MODE                                      0x2AE8
> +#define SENINF3_CSI2_MODE_CSR_CSI2_MODE_SHIFT  0
> +#define SENINF3_CSI2_MODE_CSR_CSI2_MODE_MASK   (0xff << 0)
> +#define SENINF3_CSI2_MODE_CSR_CSI2_HEADER_LEN_SHIFT 8
> +#define SENINF3_CSI2_MODE_CSR_CSI2_HEADER_LEN_MASK (0x7 << 8)
> +#define SENINF3_CSI2_MODE_CSR_CPHY_DI_POS_SHIFT 16
> +#define SENINF3_CSI2_MODE_CSR_CPHY_DI_POS_MASK (0xff << 16)
> +#define SENINF3_CSI2_MODE_CSR_CPHY_WC_POS_SHIFT 24
> +#define SENINF3_CSI2_MODE_CSR_CPHY_WC_POS_MASK (0xff << 24)
> +#define SENINF3_CSI2_DI_EXT                                    0x2AF0
> +#define SENINF3_CSI2_DI_EXT_VC4_SHIFT          0
> +#define SENINF3_CSI2_DI_EXT_VC4_MASK           (0x3 << 0)
> +#define SENINF3_CSI2_DI_EXT_DT4_SHIFT          2
> +#define SENINF3_CSI2_DI_EXT_DT4_MASK           (0x3f << 2)
> +#define SENINF3_CSI2_DI_EXT_VC5_SHIFT          8
> +#define SENINF3_CSI2_DI_EXT_VC5_MASK           (0x3 << 8)
> +#define SENINF3_CSI2_DI_EXT_DT5_SHIFT          10
> +#define SENINF3_CSI2_DI_EXT_DT5_MASK           (0x3f << 10)
> +#define SENINF3_CSI2_DI_CTRL_EXT                               0x2AF4
> +#define SENINF3_CSI2_DI_CTRL_EXT_VC4_INTERLEAVING_SHIFT 0
> +#define SENINF3_CSI2_DI_CTRL_EXT_VC4_INTERLEAVING_MASK (0x1 << 0)
> +#define SENINF3_CSI2_DI_CTRL_EXT_DT4_INTERLEAVING_SHIFT 1
> +#define SENINF3_CSI2_DI_CTRL_EXT_DT4_INTERLEAVING_MASK (0x3 << 1)
> +#define SENINF3_CSI2_DI_CTRL_EXT_VC5_INTERLEAVING_SHIFT 8
> +#define SENINF3_CSI2_DI_CTRL_EXT_VC5_INTERLEAVING_MASK (0x1 << 8)
> +#define SENINF3_CSI2_DI_CTRL_EXT_DT5_INTERLEAVING_SHIFT 9
> +#define SENINF3_CSI2_DI_CTRL_EXT_DT5_INTERLEAVING_MASK (0x3 << 9)
> +#define SENINF3_CSI2_CPHY_LOOPBACK                             0x2AF8
> +#define SENINF3_CSI2_CPHY_LOOPBACK_TRIGGER_SYNC_INIT_SHIFT 0
> +#define SENINF3_CSI2_CPHY_LOOPBACK_TRIGGER_SYNC_INIT_MASK (0x1 << 0)
> +#define SENINF3_CSI2_CPHY_LOOPBACK_RELEASE_SYNC_INIT_SHIFT 1
> +#define SENINF3_CSI2_CPHY_LOOPBACK_RELEASE_SYNC_INIT_MASK (0x1 << 1)
> +#define SENINF3_CSI2_PROGSEQ_0                                 0x2B00
> +#define SENINF3_CSI2_PROGSEQ_0_PROGSEQ_S0_SHIFT 0
> +#define SENINF3_CSI2_PROGSEQ_0_PROGSEQ_S0_MASK (0x7 << 0)
> +#define SENINF3_CSI2_PROGSEQ_0_PROGSEQ_S1_SHIFT 4
> +#define SENINF3_CSI2_PROGSEQ_0_PROGSEQ_S1_MASK (0x7 << 4)
> +#define SENINF3_CSI2_PROGSEQ_0_PROGSEQ_S2_SHIFT 8
> +#define SENINF3_CSI2_PROGSEQ_0_PROGSEQ_S2_MASK (0x7 << 8)
> +#define SENINF3_CSI2_PROGSEQ_0_PROGSEQ_S3_SHIFT 12
> +#define SENINF3_CSI2_PROGSEQ_0_PROGSEQ_S3_MASK (0x7 << 12)
> +#define SENINF3_CSI2_PROGSEQ_0_PROGSEQ_S4_SHIFT 16
> +#define SENINF3_CSI2_PROGSEQ_0_PROGSEQ_S4_MASK (0x7 << 16)
> +#define SENINF3_CSI2_PROGSEQ_0_PROGSEQ_S5_SHIFT 20
> +#define SENINF3_CSI2_PROGSEQ_0_PROGSEQ_S5_MASK (0x7 << 20)
> +#define SENINF3_CSI2_PROGSEQ_0_PROGSEQ_S6_SHIFT 24
> +#define SENINF3_CSI2_PROGSEQ_0_PROGSEQ_S6_MASK (0x7 << 24)
> +#define SENINF3_CSI2_PROGSEQ_0_PROGSEQ_S7_SHIFT 28
> +#define SENINF3_CSI2_PROGSEQ_0_PROGSEQ_S7_MASK (0x7 << 28)
> +#define SENINF3_CSI2_PROGSEQ_1                                 0x2B04
> +#define SENINF3_CSI2_PROGSEQ_1_PROGSEQ_S8_SHIFT 0
> +#define SENINF3_CSI2_PROGSEQ_1_PROGSEQ_S8_MASK (0x7 << 0)
> +#define SENINF3_CSI2_PROGSEQ_1_PROGSEQ_S9_SHIFT 4
> +#define SENINF3_CSI2_PROGSEQ_1_PROGSEQ_S9_MASK (0x7 << 4)
> +#define SENINF3_CSI2_PROGSEQ_1_PROGSEQ_S10_SHIFT 8
> +#define SENINF3_CSI2_PROGSEQ_1_PROGSEQ_S10_MASK (0x7 << 8)
> +#define SENINF3_CSI2_PROGSEQ_1_PROGSEQ_S11_SHIFT 12
> +#define SENINF3_CSI2_PROGSEQ_1_PROGSEQ_S11_MASK (0x7 << 12)
> +#define SENINF3_CSI2_PROGSEQ_1_PROGSEQ_S12_SHIFT 16
> +#define SENINF3_CSI2_PROGSEQ_1_PROGSEQ_S12_MASK (0x7 << 16)
> +#define SENINF3_CSI2_PROGSEQ_1_PROGSEQ_S13_SHIFT 20
> +#define SENINF3_CSI2_PROGSEQ_1_PROGSEQ_S13_MASK (0x7 << 20)
> +#define SENINF3_CSI2_INT_EN_EXT                                0x2B10
> +#define SENINF3_CSI2_INT_EN_EXT_DPHY0_RESYNC_FIFO_OVERFLOW_SHIFT 1
> +#define SENINF3_CSI2_INT_EN_EXT_DPHY0_RESYNC_FIFO_OVERFLOW_MASK (0x1 << 1)
> +#define SENINF3_CSI2_INT_EN_EXT_DPHY1_RESYNC_FIFO_OVERFLOW_SHIFT 2
> +#define SENINF3_CSI2_INT_EN_EXT_DPHY1_RESYNC_FIFO_OVERFLOW_MASK (0x1 << 2)
> +#define SENINF3_CSI2_INT_EN_EXT_DPHY2_RESYNC_FIFO_OVERFLOW_SHIFT 3
> +#define SENINF3_CSI2_INT_EN_EXT_DPHY2_RESYNC_FIFO_OVERFLOW_MASK (0x1 << 3)
> +#define SENINF3_CSI2_INT_EN_EXT_DPHY3_RESYNC_FIFO_OVERFLOW_SHIFT 4
> +#define SENINF3_CSI2_INT_EN_EXT_DPHY3_RESYNC_FIFO_OVERFLOW_MASK (0x1 << 4)
> +#define SENINF3_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO0_SHIFT 8
> +#define SENINF3_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO0_MASK (0x1 << 8)
> +#define SENINF3_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO1_SHIFT 9
> +#define SENINF3_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO1_MASK (0x1 << 9)
> +#define SENINF3_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO2_SHIFT 10
> +#define SENINF3_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO2_MASK (0x1 << 10)
> +#define SENINF3_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO3_SHIFT 11
> +#define SENINF3_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO3_MASK (0x1 << 11)
> +#define SENINF3_CSI2_INT_EN_EXT_INT_WCLR_EN_SHIFT 31
> +#define SENINF3_CSI2_INT_EN_EXT_INT_WCLR_EN_MASK (0x1 << 31)
> +#define SENINF3_CSI2_INT_STATUS_EXT                            0x2B14
> +#define SENINF3_CSI2_INT_STATUS_EXT_DPHY0_RESYNC_FIFO_OVERFLOW_STA_SHIFT 1
> +#define SENINF3_CSI2_INT_STATUS_EXT_DPHY0_RESYNC_FIFO_OVERFLOW_STA_MASK \
> +(0x1 << 1)
> +#define SENINF3_CSI2_INT_STATUS_EXT_DPHY1_RESYNC_FIFO_OVERFLOW_STA_SHIFT 2
> +#define SENINF3_CSI2_INT_STATUS_EXT_DPHY1_RESYNC_FIFO_OVERFLOW_STA_MASK \
> +(0x1 << 2)
> +#define SENINF3_CSI2_INT_STATUS_EXT_DPHY2_RESYNC_FIFO_OVERFLOW_STA_SHIFT 3
> +#define SENINF3_CSI2_INT_STATUS_EXT_DPHY2_RESYNC_FIFO_OVERFLOW_STA_MASK \
> +(0x1 << 3)
> +#define SENINF3_CSI2_INT_STATUS_EXT_DPHY3_RESYNC_FIFO_OVERFLOW_STA_SHIFT 4
> +#define SENINF3_CSI2_INT_STATUS_EXT_DPHY3_RESYNC_FIFO_OVERFLOW_STA_MASK \
> +(0x1 << 4)
> +#define SENINF3_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO0_SHIFT 8
> +#define SENINF3_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO0_MASK (0x1 << 8)
> +#define SENINF3_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO1_SHIFT 9
> +#define SENINF3_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO1_MASK (0x1 << 9)
> +#define SENINF3_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO2_SHIFT 10
> +#define SENINF3_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO2_MASK (0x1 << 10)
> +#define SENINF3_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO3_SHIFT 11
> +#define SENINF3_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO3_MASK (0x1 << 11)
> +#define SENINF3_CSI2_CPHY_FIX_POINT_RST                        0x2B18
> +#define SENINF3_CSI2_CPHY_FIX_POINT_RST_CPHY_FIX_POINT_RST_SHIFT 0
> +#define SENINF3_CSI2_CPHY_FIX_POINT_RST_CPHY_FIX_POINT_RST_MASK (0x1 << 0)
> +#define SENINF3_CSI2_CPHY_FIX_POINT_RST_CPHY_FIX_POINT_RST_MODE_SHIFT 1
> +#define SENINF3_CSI2_CPHY_FIX_POINT_RST_CPHY_FIX_POINT_RST_MODE_MASK \
> +(0x1 << 1)
> +#define SENINF3_CSI2_RLR3_CON0                                 0x2B1C
> +#define SENINF3_CSI2_RLR3_CON0_RLR3_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF3_CSI2_RLR3_CON0_RLR3_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF3_CSI2_RLR3_CON0_RLR3_PRBS_SEED_0_SHIFT 8
> +#define SENINF3_CSI2_RLR3_CON0_RLR3_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF3_CSI2_RLR3_CON0_RLR3_PRBS_SEED_1_SHIFT 16
> +#define SENINF3_CSI2_RLR3_CON0_RLR3_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF3_CSI2_RLR3_CON0_RLR3_PRBS_SEED_2_SHIFT 24
> +#define SENINF3_CSI2_RLR3_CON0_RLR3_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF3_CSI2_DPHY_SYNC                                 0x2B20
> +#define SENINF3_CSI2_DPHY_SYNC_SYNC_SEQ_MASK_0_SHIFT 0
> +#define SENINF3_CSI2_DPHY_SYNC_SYNC_SEQ_MASK_0_MASK (0xffff << 0)
> +#define SENINF3_CSI2_DPHY_SYNC_SYNC_SEQ_PAT_0_SHIFT 16
> +#define SENINF3_CSI2_DPHY_SYNC_SYNC_SEQ_PAT_0_MASK (0xffff << 16)
> +#define SENINF3_CSI2_DESKEW_SYNC                               0x2B24
> +#define SENINF3_CSI2_DESKEW_SYNC_SYNC_SEQ_MASK_1_SHIFT 0
> +#define SENINF3_CSI2_DESKEW_SYNC_SYNC_SEQ_MASK_1_MASK (0xffff << 0)
> +#define SENINF3_CSI2_DESKEW_SYNC_SYNC_SEQ_PAT_1_SHIFT 16
> +#define SENINF3_CSI2_DESKEW_SYNC_SYNC_SEQ_PAT_1_MASK (0xffff << 16)
> +#define SENINF3_CSI2_DETECT_DBG2                               0x2B28
> +#define SENINF3_CSI2_DETECT_DBG2_DETECT_SYNC_LANE3_ST_SHIFT 0
> +#define SENINF3_CSI2_DETECT_DBG2_DETECT_SYNC_LANE3_ST_MASK (0x1 << 0)
> +#define SENINF3_CSI2_DETECT_DBG2_DETECT_ESCAPE_LANE3_ST_SHIFT 1
> +#define SENINF3_CSI2_DETECT_DBG2_DETECT_ESCAPE_LANE3_ST_MASK (0x1 << 1)
> +#define SENINF3_CSI2_DETECT_DBG2_DETECT_POST_LANE3_ST_SHIFT 2
> +#define SENINF3_CSI2_DETECT_DBG2_DETECT_POST_LANE3_ST_MASK (0x1 << 2)
> +#define SENINF3_CSI2_DETECT_DBG2_POSITION_SYNC_LANE3_ST_SHIFT 3
> +#define SENINF3_CSI2_DETECT_DBG2_POSITION_SYNC_LANE3_ST_MASK (0xf << 3)
> +#define SENINF3_CSI2_DETECT_DBG2_POSITION_ESCAPE_LANE3_ST_SHIFT 7
> +#define SENINF3_CSI2_DETECT_DBG2_POSITION_ESCAPE_LANE3_ST_MASK (0xf << 7)
> +#define SENINF3_FIX_ADDR_CPHY3_DBG0                            0x2B30
> +#define SENINF3_FIX_ADDR_CPHY3_DBG0_WORD_COUNT_CPHY3_DBG0_SHIFT 0
> +#define SENINF3_FIX_ADDR_CPHY3_DBG0_WORD_COUNT_CPHY3_DBG0_MASK \
> +(0xffffffff << 0)
> +#define SENINF3_FIX_ADDR_CPHY3_DBG1                            0x2B34
> +#define SENINF3_FIX_ADDR_CPHY3_DBG1_WORD_COUNT_CPHY3_DBG1_SHIFT 0
> +#define SENINF3_FIX_ADDR_CPHY3_DBG1_WORD_COUNT_CPHY3_DBG1_MASK \
> +(0xffff << 0)
> +#define SENINF3_FIX_ADDR_CPHY3_DBG1_ERROR_RECORD_CPHY3_DBG0_SHIFT 16
> +#define SENINF3_FIX_ADDR_CPHY3_DBG1_ERROR_RECORD_CPHY3_DBG0_MASK \
> +(0xffff << 16)
> +#define SENINF3_FIX_ADDR_CPHY3_DBG2                            0x2B38
> +#define SENINF3_FIX_ADDR_CPHY3_DBG2_ERROR_RECORD_CPHY3_DBG1_SHIFT 0
> +#define SENINF3_FIX_ADDR_CPHY3_DBG2_ERROR_RECORD_CPHY3_DBG1_MASK \
> +(0xffffffff << 0)
> +#define SENINF3_CSI2_DI_EXT_2                                  0x2B3C
> +#define SENINF3_CSI2_DI_EXT_2_VC6_SHIFT        0
> +#define SENINF3_CSI2_DI_EXT_2_VC6_MASK         (0x3 << 0)
> +#define SENINF3_CSI2_DI_EXT_2_DT6_SHIFT        2
> +#define SENINF3_CSI2_DI_EXT_2_DT6_MASK         (0x3f << 2)
> +#define SENINF3_CSI2_DI_EXT_2_VC7_SHIFT        8
> +#define SENINF3_CSI2_DI_EXT_2_VC7_MASK         (0x3 << 8)
> +#define SENINF3_CSI2_DI_EXT_2_DT7_SHIFT        10
> +#define SENINF3_CSI2_DI_EXT_2_DT7_MASK         (0x3f << 10)
> +#define SENINF3_CSI2_DI_CTRL_EXT_2                             0x2B40
> +#define SENINF3_CSI2_DI_CTRL_EXT_2_VC6_INTERLEAVING_SHIFT 0
> +#define SENINF3_CSI2_DI_CTRL_EXT_2_VC6_INTERLEAVING_MASK (0x1 << 0)
> +#define SENINF3_CSI2_DI_CTRL_EXT_2_DT6_INTERLEAVING_SHIFT 1
> +#define SENINF3_CSI2_DI_CTRL_EXT_2_DT6_INTERLEAVING_MASK (0x3 << 1)
> +#define SENINF3_CSI2_DI_CTRL_EXT_2_VC7_INTERLEAVING_SHIFT 8
> +#define SENINF3_CSI2_DI_CTRL_EXT_2_VC7_INTERLEAVING_MASK (0x1 << 8)
> +#define SENINF3_CSI2_DI_CTRL_EXT_2_DT7_INTERLEAVING_SHIFT 9
> +#define SENINF3_CSI2_DI_CTRL_EXT_2_DT7_INTERLEAVING_MASK (0x3 << 9)
> +#define SENINF3_WIRE_STATE_DECODE_CPHY3_DBG0                   0x2B44
> +#define SENINF3_WIRE_STATE_DECODE_CPHY3_DBG0_SYMBOL_STREAM0_CPHY3_SHIFT 0
> +#define SENINF3_WIRE_STATE_DECODE_CPHY3_DBG0_SYMBOL_STREAM0_CPHY3_MASK \
> +(0xffffffff << 0)
> +#define SENINF3_WIRE_STATE_DECODE_CPHY3_DBG1                   0x2B48
> +#define SENINF3_WIRE_STATE_DECODE_CPHY3_DBG1_SYMBOL_STREAM1_CPHY3_SHIFT 0
> +#define SENINF3_WIRE_STATE_DECODE_CPHY3_DBG1_SYMBOL_STREAM1_CPHY3_MASK \
> +(0x3ff << 0)
> +#define SENINF3_WIRE_STATE_DECODE_CPHY3_DBG1_SYMBOL_STREAM_VALID_CPHY3_SHIFT 10
> +#define SENINF3_WIRE_STATE_DECODE_CPHY3_DBG1_SYMBOL_STREAM_VALID_CPHY3_MASK \
> +(0x1 << 10)
> +#define SENINF3_MUX_CTRL                                       0x2D00
> +#define SENINF3_MUX_CTRL_SENINF_MUX_SW_RST_SHIFT 0
> +#define SENINF3_MUX_CTRL_SENINF_MUX_SW_RST_MASK (0x1 << 0)
> +#define SENINF3_MUX_CTRL_SENINF_IRQ_SW_RST_SHIFT 1
> +#define SENINF3_MUX_CTRL_SENINF_IRQ_SW_RST_MASK (0x1 << 1)
> +#define SENINF3_MUX_CTRL_SENINF_MUX_RDY_MODE_SHIFT 4
> +#define SENINF3_MUX_CTRL_SENINF_MUX_RDY_MODE_MASK (0x1 << 4)
> +#define SENINF3_MUX_CTRL_SENINF_MUX_RDY_VALUE_SHIFT 5
> +#define SENINF3_MUX_CTRL_SENINF_MUX_RDY_VALUE_MASK (0x1 << 5)
> +#define SENINF3_MUX_CTRL_SENINF_HSYNC_MASK_SHIFT 7
> +#define SENINF3_MUX_CTRL_SENINF_HSYNC_MASK_MASK (0x1 << 7)
> +#define SENINF3_MUX_CTRL_SENINF_PIX_SEL_SHIFT  8
> +#define SENINF3_MUX_CTRL_SENINF_PIX_SEL_MASK   (0x1 << 8)
> +#define SENINF3_MUX_CTRL_SENINF_VSYNC_POL_SHIFT 9
> +#define SENINF3_MUX_CTRL_SENINF_VSYNC_POL_MASK (0x1 << 9)
> +#define SENINF3_MUX_CTRL_SENINF_HSYNC_POL_SHIFT 10
> +#define SENINF3_MUX_CTRL_SENINF_HSYNC_POL_MASK (0x1 << 10)
> +#define SENINF3_MUX_CTRL_OVERRUN_RST_EN_SHIFT  11
> +#define SENINF3_MUX_CTRL_OVERRUN_RST_EN_MASK   (0x1 << 11)
> +#define SENINF3_MUX_CTRL_SENINF_SRC_SEL_SHIFT  12
> +#define SENINF3_MUX_CTRL_SENINF_SRC_SEL_MASK   (0xf << 12)
> +#define SENINF3_MUX_CTRL_FIFO_PUSH_EN_SHIFT    16
> +#define SENINF3_MUX_CTRL_FIFO_PUSH_EN_MASK     (0x3f << 16)
> +#define SENINF3_MUX_CTRL_FIFO_FLUSH_EN_SHIFT   22
> +#define SENINF3_MUX_CTRL_FIFO_FLUSH_EN_MASK    (0x3f << 22)
> +#define SENINF3_MUX_CTRL_FIFO_FULL_WR_EN_SHIFT 28
> +#define SENINF3_MUX_CTRL_FIFO_FULL_WR_EN_MASK  (0x3 << 28)
> +#define SENINF3_MUX_CTRL_CROP_EN_SHIFT         30
> +#define SENINF3_MUX_CTRL_CROP_EN_MASK          (0x1 << 30)
> +#define SENINF3_MUX_CTRL_SENINF_MUX_EN_SHIFT   31
> +#define SENINF3_MUX_CTRL_SENINF_MUX_EN_MASK    (0x1 << 31)
> +#define SENINF3_MUX_INTEN                                      0x2D04
> +#define SENINF3_MUX_INTEN_SENINF_OVERRUN_IRQ_EN_SHIFT 0
> +#define SENINF3_MUX_INTEN_SENINF_OVERRUN_IRQ_EN_MASK (0x1 << 0)
> +#define SENINF3_MUX_INTEN_SENINF_CRCERR_IRQ_EN_SHIFT 1
> +#define SENINF3_MUX_INTEN_SENINF_CRCERR_IRQ_EN_MASK (0x1 << 1)
> +#define SENINF3_MUX_INTEN_SENINF_FSMERR_IRQ_EN_SHIFT 2
> +#define SENINF3_MUX_INTEN_SENINF_FSMERR_IRQ_EN_MASK (0x1 << 2)
> +#define SENINF3_MUX_INTEN_SENINF_VSIZEERR_IRQ_EN_SHIFT 3
> +#define SENINF3_MUX_INTEN_SENINF_VSIZEERR_IRQ_EN_MASK (0x1 << 3)
> +#define SENINF3_MUX_INTEN_SENINF_HSIZEERR_IRQ_EN_SHIFT 4
> +#define SENINF3_MUX_INTEN_SENINF_HSIZEERR_IRQ_EN_MASK (0x1 << 4)
> +#define SENINF3_MUX_INTEN_SENINF_SENSOR_VSIZEERR_IRQ_EN_SHIFT 5
> +#define SENINF3_MUX_INTEN_SENINF_SENSOR_VSIZEERR_IRQ_EN_MASK (0x1 << 5)
> +#define SENINF3_MUX_INTEN_SENINF_SENSOR_HSIZEERR_IRQ_EN_SHIFT 6
> +#define SENINF3_MUX_INTEN_SENINF_SENSOR_HSIZEERR_IRQ_EN_MASK (0x1 << 6)
> +#define SENINF3_MUX_INTEN_SENINF_IRQ_CLR_SEL_SHIFT 31
> +#define SENINF3_MUX_INTEN_SENINF_IRQ_CLR_SEL_MASK (0x1 << 31)
> +#define SENINF3_MUX_INTSTA                                     0x2D08
> +#define SENINF3_MUX_INTSTA_SENINF_OVERRUN_IRQ_STA_SHIFT 0
> +#define SENINF3_MUX_INTSTA_SENINF_OVERRUN_IRQ_STA_MASK (0x1 << 0)
> +#define SENINF3_MUX_INTSTA_SENINF_CRCERR_IRQ_STA_SHIFT 1
> +#define SENINF3_MUX_INTSTA_SENINF_CRCERR_IRQ_STA_MASK (0x1 << 1)
> +#define SENINF3_MUX_INTSTA_SENINF_FSMERR_IRQ_STA_SHIFT 2
> +#define SENINF3_MUX_INTSTA_SENINF_FSMERR_IRQ_STA_MASK (0x1 << 2)
> +#define SENINF3_MUX_INTSTA_SENINF_VSIZEERR_IRQ_STA_SHIFT 3
> +#define SENINF3_MUX_INTSTA_SENINF_VSIZEERR_IRQ_STA_MASK (0x1 << 3)
> +#define SENINF3_MUX_INTSTA_SENINF_HSIZEERR_IRQ_STA_SHIFT 4
> +#define SENINF3_MUX_INTSTA_SENINF_HSIZEERR_IRQ_STA_MASK (0x1 << 4)
> +#define SENINF3_MUX_INTSTA_SENINF_SENSOR_VSIZEERR_IRQ_STA_SHIFT 5
> +#define SENINF3_MUX_INTSTA_SENINF_SENSOR_VSIZEERR_IRQ_STA_MASK (0x1 << 5)
> +#define SENINF3_MUX_INTSTA_SENINF_SENSOR_HSIZEERR_IRQ_STA_SHIFT 6
> +#define SENINF3_MUX_INTSTA_SENINF_SENSOR_HSIZEERR_IRQ_STA_MASK (0x1 << 6)
> +#define SENINF3_MUX_SIZE                                       0x2D0C
> +#define SENINF3_MUX_SIZE_SENINF_VSIZE_SHIFT    0
> +#define SENINF3_MUX_SIZE_SENINF_VSIZE_MASK     (0xffff << 0)
> +#define SENINF3_MUX_SIZE_SENINF_HSIZE_SHIFT    16
> +#define SENINF3_MUX_SIZE_SENINF_HSIZE_MASK     (0xffff << 16)
> +#define SENINF3_MUX_DEBUG_1                                    0x2D10
> +#define SENINF3_MUX_DEBUG_1_DEBUG_INFO_SHIFT   0
> +#define SENINF3_MUX_DEBUG_1_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF3_MUX_DEBUG_2                                    0x2D14
> +#define SENINF3_MUX_DEBUG_2_DEBUG_INFO_SHIFT   0
> +#define SENINF3_MUX_DEBUG_2_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF3_MUX_DEBUG_3                                    0x2D18
> +#define SENINF3_MUX_DEBUG_3_DEBUG_INFO_SHIFT   0
> +#define SENINF3_MUX_DEBUG_3_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF3_MUX_DEBUG_4                                    0x2D1C
> +#define SENINF3_MUX_DEBUG_4_DEBUG_INFO_SHIFT   0
> +#define SENINF3_MUX_DEBUG_4_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF3_MUX_DEBUG_5                                    0x2D20
> +#define SENINF3_MUX_DEBUG_5_DEBUG_INFO_SHIFT   0
> +#define SENINF3_MUX_DEBUG_5_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF3_MUX_DEBUG_6                                    0x2D24
> +#define SENINF3_MUX_DEBUG_6_DEBUG_INFO_SHIFT   0
> +#define SENINF3_MUX_DEBUG_6_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF3_MUX_DEBUG_7                                    0x2D28
> +#define SENINF3_MUX_DEBUG_7_DEBUG_INFO_SHIFT   0
> +#define SENINF3_MUX_DEBUG_7_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF3_MUX_SPARE                                      0x2D2C
> +#define SENINF3_MUX_SPARE_SENINF_CRC_SEL_SHIFT 9
> +#define SENINF3_MUX_SPARE_SENINF_CRC_SEL_MASK  (0x3 << 9)
> +#define SENINF3_MUX_SPARE_SENINF_VCNT_SEL_SHIFT 11
> +#define SENINF3_MUX_SPARE_SENINF_VCNT_SEL_MASK (0x3 << 11)
> +#define SENINF3_MUX_SPARE_SENINF_FIFO_FULL_SEL_SHIFT 13
> +#define SENINF3_MUX_SPARE_SENINF_FIFO_FULL_SEL_MASK (0x1 << 13)
> +#define SENINF3_MUX_SPARE_SENINF_SPARE_SHIFT   14
> +#define SENINF3_MUX_SPARE_SENINF_SPARE_MASK    (0x3f << 14)
> +#define SENINF3_MUX_DATA                                       0x2D30
> +#define SENINF3_MUX_DATA_SENINF_DATA0_SHIFT    0
> +#define SENINF3_MUX_DATA_SENINF_DATA0_MASK     (0xffff << 0)
> +#define SENINF3_MUX_DATA_SENINF_DATA1_SHIFT    16
> +#define SENINF3_MUX_DATA_SENINF_DATA1_MASK     (0xffff << 16)
> +#define SENINF3_MUX_DATA_CNT                                   0x2D34
> +#define SENINF3_MUX_DATA_CNT_SENINF_DATA_CNT_SHIFT 0
> +#define SENINF3_MUX_DATA_CNT_SENINF_DATA_CNT_MASK (0xffffffff << 0)
> +#define SENINF3_MUX_CROP                                       0x2D38
> +#define SENINF3_MUX_CROP_SENINF_CROP_X1_SHIFT  0
> +#define SENINF3_MUX_CROP_SENINF_CROP_X1_MASK   (0xffff << 0)
> +#define SENINF3_MUX_CROP_SENINF_CROP_X2_SHIFT  16
> +#define SENINF3_MUX_CROP_SENINF_CROP_X2_MASK   (0xffff << 16)
> +#define SENINF3_MUX_CTRL_EXT                                   0x2D3C
> +#define SENINF3_MUX_CTRL_EXT_SENINF_SRC_SEL_EXT_SHIFT 0
> +#define SENINF3_MUX_CTRL_EXT_SENINF_SRC_SEL_EXT_MASK (0x3 << 0)
> +#define SENINF3_MUX_CTRL_EXT_SENINF_PIX_SEL_EXT_SHIFT 4
> +#define SENINF3_MUX_CTRL_EXT_SENINF_PIX_SEL_EXT_MASK (0x1 << 4)
> +#define SENINF4_CTRL                                           0x3200
> +#define SENINF4_CTRL_SENINF_EN_SHIFT           0
> +#define SENINF4_CTRL_SENINF_EN_MASK            (0x1 << 0)
> +#define SENINF4_CTRL_NCSI2_SW_RST_SHIFT        1
> +#define SENINF4_CTRL_NCSI2_SW_RST_MASK         (0x1 << 1)
> +#define SENINF4_CTRL_OCSI2_SW_RST_SHIFT        2
> +#define SENINF4_CTRL_OCSI2_SW_RST_MASK         (0x1 << 2)
> +#define SENINF4_CTRL_CCIR_SW_RST_SHIFT         3
> +#define SENINF4_CTRL_CCIR_SW_RST_MASK          (0x1 << 3)
> +#define SENINF4_CTRL_CKGEN_SW_RST_SHIFT        4
> +#define SENINF4_CTRL_CKGEN_SW_RST_MASK         (0x1 << 4)
> +#define SENINF4_CTRL_TEST_MODEL_SW_RST_SHIFT   5
> +#define SENINF4_CTRL_TEST_MODEL_SW_RST_MASK    (0x1 << 5)
> +#define SENINF4_CTRL_SCAM_SW_RST_SHIFT         6
> +#define SENINF4_CTRL_SCAM_SW_RST_MASK          (0x1 << 6)
> +#define SENINF4_CTRL_CSI2_SW_RST_SHIFT         7
> +#define SENINF4_CTRL_CSI2_SW_RST_MASK          (0x1 << 7)
> +#define SENINF4_CTRL_CSI3_SW_RST_SHIFT         8
> +#define SENINF4_CTRL_CSI3_SW_RST_MASK          (0x1 << 8)
> +#define SENINF4_CTRL_SENINF_SRC_SEL_SHIFT      12
> +#define SENINF4_CTRL_SENINF_SRC_SEL_MASK       (0xf << 12)
> +#define SENINF4_CTRL_SENINF_DEBUG_SEL_SHIFT    20
> +#define SENINF4_CTRL_SENINF_DEBUG_SEL_MASK     (0xf << 20)
> +#define SENINF4_CTRL_PAD2CAM_DATA_SEL_SHIFT    28
> +#define SENINF4_CTRL_PAD2CAM_DATA_SEL_MASK     (0x7 << 28)
> +#define SENINF4_CTRL_EXT                                       0x3204
> +#define SENINF4_CTRL_EXT_SENINF_OCSI2_IP_EN_SHIFT 0
> +#define SENINF4_CTRL_EXT_SENINF_OCSI2_IP_EN_MASK (0x1 << 0)
> +#define SENINF4_CTRL_EXT_SENINF_TESTMDL_IP_EN_SHIFT 1
> +#define SENINF4_CTRL_EXT_SENINF_TESTMDL_IP_EN_MASK (0x1 << 1)
> +#define SENINF4_CTRL_EXT_SENINF_SCAM_IP_EN_SHIFT 4
> +#define SENINF4_CTRL_EXT_SENINF_SCAM_IP_EN_MASK (0x1 << 4)
> +#define SENINF4_CTRL_EXT_SENINF_NCSI2_IP_EN_SHIFT 5
> +#define SENINF4_CTRL_EXT_SENINF_NCSI2_IP_EN_MASK (0x1 << 5)
> +#define SENINF4_CTRL_EXT_SENINF_CSI2_IP_EN_SHIFT 6
> +#define SENINF4_CTRL_EXT_SENINF_CSI2_IP_EN_MASK (0x1 << 6)
> +#define SENINF4_CTRL_EXT_SENINF_CSI3_IP_EN_SHIFT 7
> +#define SENINF4_CTRL_EXT_SENINF_CSI3_IP_EN_MASK (0x1 << 7)
> +#define SENINF4_CTRL_EXT_SENINF_SRC_SEL_EXT_SHIFT 16
> +#define SENINF4_CTRL_EXT_SENINF_SRC_SEL_EXT_MASK (0x3 << 16)
> +#define SENINF4_ASYNC_CTRL                                     0x3208
> +#define SENINF4_ASYNC_CTRL_SENINF_ASYNC_FIFO_RST_SHIFT 0
> +#define SENINF4_ASYNC_CTRL_SENINF_ASYNC_FIFO_RST_MASK (0x1 << 0)
> +#define SENINF4_ASYNC_CTRL_SENINF_HSYNC_MASK_SHIFT 1
> +#define SENINF4_ASYNC_CTRL_SENINF_HSYNC_MASK_MASK (0x1 << 1)
> +#define SENINF4_ASYNC_CTRL_SENINF_VSYNC_POL_SHIFT 2
> +#define SENINF4_ASYNC_CTRL_SENINF_VSYNC_POL_MASK (0x1 << 2)
> +#define SENINF4_ASYNC_CTRL_SENINF_HSYNC_POL_SHIFT 3
> +#define SENINF4_ASYNC_CTRL_SENINF_HSYNC_POL_MASK (0x1 << 3)
> +#define SENINF4_ASYNC_CTRL_FIFO_PUSH_EN_SHIFT  16
> +#define SENINF4_ASYNC_CTRL_FIFO_PUSH_EN_MASK   (0x3f << 16)
> +#define SENINF4_ASYNC_CTRL_FIFO_FLUSH_EN_SHIFT 24
> +#define SENINF4_ASYNC_CTRL_FIFO_FLUSH_EN_MASK  (0x3f << 24)
> +#define SENINF_TG4_PH_CNT                                      0x3600
> +#define SENINF_TG4_PH_CNT_TGCLK_SEL_SHIFT      0
> +#define SENINF_TG4_PH_CNT_TGCLK_SEL_MASK       (0x3 << 0)
> +#define SENINF_TG4_PH_CNT_CLKFL_POL_SHIFT      2
> +#define SENINF_TG4_PH_CNT_CLKFL_POL_MASK       (0x1 << 2)
> +#define SENINF_TG4_PH_CNT_EXT_RST_SHIFT        4
> +#define SENINF_TG4_PH_CNT_EXT_RST_MASK         (0x1 << 4)
> +#define SENINF_TG4_PH_CNT_EXT_PWRDN_SHIFT      5
> +#define SENINF_TG4_PH_CNT_EXT_PWRDN_MASK       (0x1 << 5)
> +#define SENINF_TG4_PH_CNT_PAD_PCLK_INV_SHIFT   6
> +#define SENINF_TG4_PH_CNT_PAD_PCLK_INV_MASK    (0x1 << 6)
> +#define SENINF_TG4_PH_CNT_CAM_PCLK_INV_SHIFT   7
> +#define SENINF_TG4_PH_CNT_CAM_PCLK_INV_MASK    (0x1 << 7)
> +#define SENINF_TG4_PH_CNT_CLKPOL_SHIFT         28
> +#define SENINF_TG4_PH_CNT_CLKPOL_MASK          (0x1 << 28)
> +#define SENINF_TG4_PH_CNT_ADCLK_EN_SHIFT       29
> +#define SENINF_TG4_PH_CNT_ADCLK_EN_MASK        (0x1 << 29)
> +#define SENINF_TG4_PH_CNT_PCEN_SHIFT           31
> +#define SENINF_TG4_PH_CNT_PCEN_MASK            (0x1 << 31)
> +#define SENINF_TG4_SEN_CK                                      0x3604
> +#define SENINF_TG4_SEN_CK_CLKFL_SHIFT          0
> +#define SENINF_TG4_SEN_CK_CLKFL_MASK           (0x3f << 0)
> +#define SENINF_TG4_SEN_CK_CLKRS_SHIFT          8
> +#define SENINF_TG4_SEN_CK_CLKRS_MASK           (0x3f << 8)
> +#define SENINF_TG4_SEN_CK_CLKCNT_SHIFT         16
> +#define SENINF_TG4_SEN_CK_CLKCNT_MASK          (0x3f << 16)
> +#define SENINF_TG4_TM_CTL                                      0x3608
> +#define SENINF_TG4_TM_CTL_TM_EN_SHIFT          0
> +#define SENINF_TG4_TM_CTL_TM_EN_MASK           (0x1 << 0)
> +#define SENINF_TG4_TM_CTL_TM_RST_SHIFT         1
> +#define SENINF_TG4_TM_CTL_TM_RST_MASK          (0x1 << 1)
> +#define SENINF_TG4_TM_CTL_TM_FMT_SHIFT         2
> +#define SENINF_TG4_TM_CTL_TM_FMT_MASK          (0x1 << 2)
> +#define SENINF_TG4_TM_CTL_TM_PAT_SHIFT         4
> +#define SENINF_TG4_TM_CTL_TM_PAT_MASK          (0xf << 4)
> +#define SENINF_TG4_TM_CTL_TM_VSYNC_SHIFT       8
> +#define SENINF_TG4_TM_CTL_TM_VSYNC_MASK        (0xff << 8)
> +#define SENINF_TG4_TM_CTL_TM_DUMMYPXL_SHIFT    16
> +#define SENINF_TG4_TM_CTL_TM_DUMMYPXL_MASK     (0xff << 16)
> +#define SENINF_TG4_TM_SIZE                                     0x360C
> +#define SENINF_TG4_TM_SIZE_TM_PXL_SHIFT        0
> +#define SENINF_TG4_TM_SIZE_TM_PXL_MASK         (0x1fff << 0)
> +#define SENINF_TG4_TM_SIZE_TM_LINE_SHIFT       16
> +#define SENINF_TG4_TM_SIZE_TM_LINE_MASK        (0x3fff << 16)
> +#define SENINF_TG4_TM_CLK                                      0x3610
> +#define SENINF_TG4_TM_CLK_TM_CLK_CNT_SHIFT     0
> +#define SENINF_TG4_TM_CLK_TM_CLK_CNT_MASK      (0xf << 0)
> +#define SENINF_TG4_TM_CLK_TM_CLRBAR_OFT_SHIFT  16
> +#define SENINF_TG4_TM_CLK_TM_CLRBAR_OFT_MASK   (0x3ff << 16)
> +#define SENINF_TG4_TM_CLK_TM_CLRBAR_IDX_SHIFT  28
> +#define SENINF_TG4_TM_CLK_TM_CLRBAR_IDX_MASK   (0x7 << 28)
> +#define SENINF_TG4_TM_STP                                      0x3614
> +#define SENINF_TG4_TM_STP_TG1_TM_STP_SHIFT     0
> +#define SENINF_TG4_TM_STP_TG1_TM_STP_MASK      (0xffffffff << 0)
> +#define MIPI_RX_CON24_CSI3                                     0x3824
> +#define MIPI_RX_CON24_CSI3_CSI0_BIST_NUM_SHIFT 0
> +#define MIPI_RX_CON24_CSI3_CSI0_BIST_NUM_MASK  (0x3 << 0)
> +#define MIPI_RX_CON24_CSI3_CSI0_BIST_EN_SHIFT  2
> +#define MIPI_RX_CON24_CSI3_CSI0_BIST_EN_MASK   (0x1 << 2)
> +#define MIPI_RX_CON24_CSI3_CSI0_BIST_FIX_PAT_SHIFT 5
> +#define MIPI_RX_CON24_CSI3_CSI0_BIST_FIX_PAT_MASK (0x1 << 5)
> +#define MIPI_RX_CON24_CSI3_CSI0_BIST_CLK_SEL_SHIFT 6
> +#define MIPI_RX_CON24_CSI3_CSI0_BIST_CLK_SEL_MASK (0x1 << 6)
> +#define MIPI_RX_CON24_CSI3_CSI0_BIST_CLK4X_SEL_SHIFT 7
> +#define MIPI_RX_CON24_CSI3_CSI0_BIST_CLK4X_SEL_MASK (0x1 << 7)
> +#define MIPI_RX_CON24_CSI3_CSI0_BIST_TERM_DELAY_SHIFT 8
> +#define MIPI_RX_CON24_CSI3_CSI0_BIST_TERM_DELAY_MASK (0xff << 8)
> +#define MIPI_RX_CON24_CSI3_CSI0_BIST_SETTLE_DELAY_SHIFT 16
> +#define MIPI_RX_CON24_CSI3_CSI0_BIST_SETTLE_DELAY_MASK (0xff << 16)
> +#define MIPI_RX_CON24_CSI3_CSI0_BIST_LN0_MUX_SHIFT 24
> +#define MIPI_RX_CON24_CSI3_CSI0_BIST_LN0_MUX_MASK (0x3 << 24)
> +#define MIPI_RX_CON24_CSI3_CSI0_BIST_LN1_MUX_SHIFT 26
> +#define MIPI_RX_CON24_CSI3_CSI0_BIST_LN1_MUX_MASK (0x3 << 26)
> +#define MIPI_RX_CON24_CSI3_CSI0_BIST_LN2_MUX_SHIFT 28
> +#define MIPI_RX_CON24_CSI3_CSI0_BIST_LN2_MUX_MASK (0x3 << 28)
> +#define MIPI_RX_CON24_CSI3_CSI0_BIST_LN3_MUX_SHIFT 30
> +#define MIPI_RX_CON24_CSI3_CSI0_BIST_LN3_MUX_MASK (0x3 << 30)
> +#define MIPI_RX_CON28_CSI3                                     0x3828
> +#define MIPI_RX_CON28_CSI3_CSI0_BIST_START_SHIFT 0
> +#define MIPI_RX_CON28_CSI3_CSI0_BIST_START_MASK (0x1 << 0)
> +#define MIPI_RX_CON28_CSI3_CSI0_BIST_DATA_OK_SHIFT 1
> +#define MIPI_RX_CON28_CSI3_CSI0_BIST_DATA_OK_MASK (0x1 << 1)
> +#define MIPI_RX_CON28_CSI3_CSI0_BIST_HS_FSM_OK_SHIFT 2
> +#define MIPI_RX_CON28_CSI3_CSI0_BIST_HS_FSM_OK_MASK (0x1 << 2)
> +#define MIPI_RX_CON28_CSI3_CSI0_BIST_LANE_FSM_OK_SHIFT 3
> +#define MIPI_RX_CON28_CSI3_CSI0_BIST_LANE_FSM_OK_MASK (0x1 << 3)
> +#define MIPI_RX_CON28_CSI3_CSI0_BIST_CSI2_DATA_OK_SHIFT 4
> +#define MIPI_RX_CON28_CSI3_CSI0_BIST_CSI2_DATA_OK_MASK (0x1 << 4)
> +#define MIPI_RX_CON34_CSI3                                     0x3834
> +#define MIPI_RX_CON34_CSI3_BIST_MODE_SHIFT     0
> +#define MIPI_RX_CON34_CSI3_BIST_MODE_MASK      (0x1 << 0)
> +#define MIPI_RX_CON34_CSI3_CSI0_BIST_HSDET_MUX_SHIFT 22
> +#define MIPI_RX_CON34_CSI3_CSI0_BIST_HSDET_MUX_MASK (0x3 << 22)
> +#define MIPI_RX_CON34_CSI3_CSI0_BIST_LN4_MUX_SHIFT 24
> +#define MIPI_RX_CON34_CSI3_CSI0_BIST_LN4_MUX_MASK (0x3 << 24)
> +#define MIPI_RX_CON34_CSI3_CSI0_BIST_LN5_MUX_SHIFT 26
> +#define MIPI_RX_CON34_CSI3_CSI0_BIST_LN5_MUX_MASK (0x3 << 26)
> +#define MIPI_RX_CON34_CSI3_CSI0_BIST_LN6_MUX_SHIFT 28
> +#define MIPI_RX_CON34_CSI3_CSI0_BIST_LN6_MUX_MASK (0x3 << 28)
> +#define MIPI_RX_CON34_CSI3_CSI0_BIST_LN7_MUX_SHIFT 30
> +#define MIPI_RX_CON34_CSI3_CSI0_BIST_LN7_MUX_MASK (0x3 << 30)
> +#define MIPI_RX_CON38_CSI3                                     0x3838
> +#define MIPI_RX_CON38_CSI3_MIPI_RX_SW_CTRL_MODE_SHIFT 0
> +#define MIPI_RX_CON38_CSI3_MIPI_RX_SW_CTRL_MODE_MASK (0x1 << 0)
> +#define MIPI_RX_CON38_CSI3_MIPI_RX_SW_CAL_MODE_SHIFT 1
> +#define MIPI_RX_CON38_CSI3_MIPI_RX_SW_CAL_MODE_MASK (0x1 << 1)
> +#define MIPI_RX_CON38_CSI3_MIPI_RX_HW_CAL_START_SHIFT 2
> +#define MIPI_RX_CON38_CSI3_MIPI_RX_HW_CAL_START_MASK (0x1 << 2)
> +#define MIPI_RX_CON38_CSI3_MIPI_RX_HW_CAL_OPTION_SHIFT 3
> +#define MIPI_RX_CON38_CSI3_MIPI_RX_HW_CAL_OPTION_MASK (0x1 << 3)
> +#define MIPI_RX_CON38_CSI3_MIPI_RX_SW_RST_SHIFT 4
> +#define MIPI_RX_CON38_CSI3_MIPI_RX_SW_RST_MASK (0x1f << 4)
> +#define MIPI_RX_CON38_CSI3_MIPI_RX_SW_CPHY_TX_MODE_SHIFT 9
> +#define MIPI_RX_CON38_CSI3_MIPI_RX_SW_CPHY_TX_MODE_MASK (0x1 << 9)
> +#define MIPI_RX_CON38_CSI3_MIPI_RX_SW_CPHY_RX_MODE_SHIFT 10
> +#define MIPI_RX_CON38_CSI3_MIPI_RX_SW_CPHY_RX_MODE_MASK (0x1 << 10)
> +#define MIPI_RX_CON38_CSI3_RG_CKPHASE_TRIO0_SHIFT 16
> +#define MIPI_RX_CON38_CSI3_RG_CKPHASE_TRIO0_MASK (0x1f << 16)
> +#define MIPI_RX_CON38_CSI3_RG_CKPHASE_TRIO1_SHIFT 22
> +#define MIPI_RX_CON38_CSI3_RG_CKPHASE_TRIO1_MASK (0x1f << 22)
> +#define MIPI_RX_CON38_CSI3_RG_CKPHASE_TRIO2_SHIFT 27
> +#define MIPI_RX_CON38_CSI3_RG_CKPHASE_TRIO2_MASK (0x1f << 27)
> +#define MIPI_RX_CON3C_CSI3                                     0x383C
> +#define MIPI_RX_CON3C_CSI3_MIPI_RX_SW_CTRL__SHIFT 0
> +#define MIPI_RX_CON3C_CSI3_MIPI_RX_SW_CTRL__MASK (0xffffffff << 0)
> +#define MIPI_RX_CON7C_CSI3                                     0x387C
> +#define MIPI_RX_CON7C_CSI3_DA_CSI0_LNRD0_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON7C_CSI3_DA_CSI0_LNRD0_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON7C_CSI3_DA_CSI0_LNRD0_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON7C_CSI3_DA_CSI0_LNRD0_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON7C_CSI3_DA_CSI0_LNRD0_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON7C_CSI3_DA_CSI0_LNRD0_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON80_CSI3                                     0x3880
> +#define MIPI_RX_CON80_CSI3_DA_CSI0_LNRD1_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON80_CSI3_DA_CSI0_LNRD1_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON80_CSI3_DA_CSI0_LNRD1_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON80_CSI3_DA_CSI0_LNRD1_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON80_CSI3_DA_CSI0_LNRD1_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON80_CSI3_DA_CSI0_LNRD1_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON84_CSI3                                     0x3884
> +#define MIPI_RX_CON84_CSI3_DA_CSI0_LNRD2_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON84_CSI3_DA_CSI0_LNRD2_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON84_CSI3_DA_CSI0_LNRD2_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON84_CSI3_DA_CSI0_LNRD2_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON84_CSI3_DA_CSI0_LNRD2_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON84_CSI3_DA_CSI0_LNRD2_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON88_CSI3                                     0x3888
> +#define MIPI_RX_CON88_CSI3_DA_CSI0_LNRD3_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON88_CSI3_DA_CSI0_LNRD3_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON88_CSI3_DA_CSI0_LNRD3_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON88_CSI3_DA_CSI0_LNRD3_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON88_CSI3_DA_CSI0_LNRD3_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON88_CSI3_DA_CSI0_LNRD3_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON8C_CSI3                                     0x388C
> +#define MIPI_RX_CON8C_CSI3_RG_CSI0_LNRD0_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON8C_CSI3_RG_CSI0_LNRD0_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON8C_CSI3_RG_CSI0_LNRD0_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON8C_CSI3_RG_CSI0_LNRD0_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON8C_CSI3_RG_CSI0_LNRD0_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON8C_CSI3_RG_CSI0_LNRD0_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON90_CSI3                                     0x3890
> +#define MIPI_RX_CON90_CSI3_RG_CSI0_LNRD1_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON90_CSI3_RG_CSI0_LNRD1_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON90_CSI3_RG_CSI0_LNRD1_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON90_CSI3_RG_CSI0_LNRD1_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON90_CSI3_RG_CSI0_LNRD1_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON90_CSI3_RG_CSI0_LNRD1_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON94_CSI3                                     0x3894
> +#define MIPI_RX_CON94_CSI3_RG_CSI0_LNRD2_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON94_CSI3_RG_CSI0_LNRD2_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON94_CSI3_RG_CSI0_LNRD2_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON94_CSI3_RG_CSI0_LNRD2_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON94_CSI3_RG_CSI0_LNRD2_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON94_CSI3_RG_CSI0_LNRD2_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON98_CSI3                                     0x3898
> +#define MIPI_RX_CON98_CSI3_RG_CSI0_LNRD3_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON98_CSI3_RG_CSI0_LNRD3_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON98_CSI3_RG_CSI0_LNRD3_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON98_CSI3_RG_CSI0_LNRD3_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON98_CSI3_RG_CSI0_LNRD3_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON98_CSI3_RG_CSI0_LNRD3_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CONA0_CSI3                                     0x38A0
> +#define MIPI_RX_CONA0_CSI3_RG_CSI0_LNRC_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CONA0_CSI3_RG_CSI0_LNRC_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CONA0_CSI3_RG_CSI0_LNRC_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CONA0_CSI3_RG_CSI0_LNRC_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CONA0_CSI3_RG_CSI0_LNRC_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CONA0_CSI3_RG_CSI0_LNRC_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CONB0_CSI3                                     0x38B0
> +#define MIPI_RX_CONB0_CSI3_DELAY_APPLY_MODE_SHIFT 0
> +#define MIPI_RX_CONB0_CSI3_DELAY_APPLY_MODE_MASK (0xf << 0)
> +#define MIPI_RX_CONB0_CSI3_DESKEW_SW_RST_SHIFT 7
> +#define MIPI_RX_CONB0_CSI3_DESKEW_SW_RST_MASK  (0x1 << 7)
> +#define MIPI_RX_CONB0_CSI3_DESKEW_TRIGGER_MODE_SHIFT 8
> +#define MIPI_RX_CONB0_CSI3_DESKEW_TRIGGER_MODE_MASK (0x7 << 8)
> +#define MIPI_RX_CONB0_CSI3_DESKEW_ACC_MODE_SHIFT 12
> +#define MIPI_RX_CONB0_CSI3_DESKEW_ACC_MODE_MASK (0xf << 12)
> +#define MIPI_RX_CONB0_CSI3_DESKEW_CSI2_RST_ENABLE_SHIFT 16
> +#define MIPI_RX_CONB0_CSI3_DESKEW_CSI2_RST_ENABLE_MASK (0x1 << 16)
> +#define MIPI_RX_CONB0_CSI3_DESKEW_IP_SEL_SHIFT 30
> +#define MIPI_RX_CONB0_CSI3_DESKEW_IP_SEL_MASK  (0x1 << 30)
> +#define MIPI_RX_CONB0_CSI3_DESKEW_ENABLE_SHIFT 31
> +#define MIPI_RX_CONB0_CSI3_DESKEW_ENABLE_MASK  (0x1 << 31)
> +#define MIPI_RX_CONB4_CSI3                                     0x38B4
> +#define MIPI_RX_CONB4_CSI3_SYNC_CODE_MASK_SHIFT 0
> +#define MIPI_RX_CONB4_CSI3_SYNC_CODE_MASK_MASK (0xffff << 0)
> +#define MIPI_RX_CONB4_CSI3_EXPECTED_SYNC_CODE_SHIFT 16
> +#define MIPI_RX_CONB4_CSI3_EXPECTED_SYNC_CODE_MASK (0xffff << 16)
> +#define MIPI_RX_CONB8_CSI3                                     0x38B8
> +#define MIPI_RX_CONB8_CSI3_DESKEW_SETUP_TIME_SHIFT 0
> +#define MIPI_RX_CONB8_CSI3_DESKEW_SETUP_TIME_MASK (0xf << 0)
> +#define MIPI_RX_CONB8_CSI3_DESKEW_HOLD_TIME_SHIFT 8
> +#define MIPI_RX_CONB8_CSI3_DESKEW_HOLD_TIME_MASK (0xf << 8)
> +#define MIPI_RX_CONB8_CSI3_DESKEW_TIME_OUT_SHIFT 16
> +#define MIPI_RX_CONB8_CSI3_DESKEW_TIME_OUT_MASK (0xff << 16)
> +#define MIPI_RX_CONB8_CSI3_DESKEW_TIME_OUT_EN_SHIFT 24
> +#define MIPI_RX_CONB8_CSI3_DESKEW_TIME_OUT_EN_MASK (0x1 << 24)
> +#define MIPI_RX_CONBC_CSI3                                     0x38BC
> +#define MIPI_RX_CONBC_CSI3_DESKEW_DETECTION_MODE_SHIFT 0
> +#define MIPI_RX_CONBC_CSI3_DESKEW_DETECTION_MODE_MASK (0xf << 0)
> +#define MIPI_RX_CONBC_CSI3_DESKEW_DETECTION_CNT_SHIFT 8
> +#define MIPI_RX_CONBC_CSI3_DESKEW_DETECTION_CNT_MASK (0x7f << 8)
> +#define MIPI_RX_CONBC_CSI3_DESKEW_DELAY_APPLY_MODE_SHIFT 16
> +#define MIPI_RX_CONBC_CSI3_DESKEW_DELAY_APPLY_MODE_MASK (0xf << 16)
> +#define MIPI_RX_CONBC_CSI3_DESKEW_LANE_NUMBER_SHIFT 24
> +#define MIPI_RX_CONBC_CSI3_DESKEW_LANE_NUMBER_MASK (0x3 << 24)
> +#define MIPI_RX_CONC0_CSI3                                     0x38C0
> +#define MIPI_RX_CONC0_CSI3_DESKEW_INTERRUPT_ENABLE_SHIFT 0
> +#define MIPI_RX_CONC0_CSI3_DESKEW_INTERRUPT_ENABLE_MASK (0xffff << 0)
> +#define MIPI_RX_CONC0_CSI3_DESKEW_INTERRUPT_W1C_EN_SHIFT 31
> +#define MIPI_RX_CONC0_CSI3_DESKEW_INTERRUPT_W1C_EN_MASK (0x1 << 31)
> +#define MIPI_RX_CONC4_CSI3                                     0x38C4
> +#define MIPI_RX_CONC4_CSI3_DESKEW_INTERRUPT_STATUS_SHIFT 0
> +#define MIPI_RX_CONC4_CSI3_DESKEW_INTERRUPT_STATUS_MASK (0xffff << 0)
> +#define MIPI_RX_CONC8_CSI3                                     0x38C8
> +#define MIPI_RX_CONC8_CSI3_DESKEW_DEBUG_MUX_SELECT_SHIFT 0
> +#define MIPI_RX_CONC8_CSI3_DESKEW_DEBUG_MUX_SELECT_MASK (0xff << 0)
> +#define MIPI_RX_CONCC_CSI3                                     0x38CC
> +#define MIPI_RX_CONCC_CSI3_DESKEW_DEBUG_OUTPUTS_SHIFT 0
> +#define MIPI_RX_CONCC_CSI3_DESKEW_DEBUG_OUTPUTS_MASK (0xffffffff << 0)
> +#define MIPI_RX_COND0_CSI3                                     0x38D0
> +#define MIPI_RX_COND0_CSI3_DESKEW_DELAY_LENGTH_SHIFT 0
> +#define MIPI_RX_COND0_CSI3_DESKEW_DELAY_LENGTH_MASK (0x3f << 0)
> +#define SENINF4_CSI2_CTL                                       0x3A00
> +#define SENINF4_CSI2_CTL_DATA_LANE0_EN_SHIFT   0
> +#define SENINF4_CSI2_CTL_DATA_LANE0_EN_MASK    (0x1 << 0)
> +#define SENINF4_CSI2_CTL_DATA_LANE1_EN_SHIFT   1
> +#define SENINF4_CSI2_CTL_DATA_LANE1_EN_MASK    (0x1 << 1)
> +#define SENINF4_CSI2_CTL_DATA_LANE2_EN_SHIFT   2
> +#define SENINF4_CSI2_CTL_DATA_LANE2_EN_MASK    (0x1 << 2)
> +#define SENINF4_CSI2_CTL_DATA_LANE3_EN_SHIFT   3
> +#define SENINF4_CSI2_CTL_DATA_LANE3_EN_MASK    (0x1 << 3)
> +#define SENINF4_CSI2_CTL_CLOCK_LANE_EN_SHIFT   4
> +#define SENINF4_CSI2_CTL_CLOCK_LANE_EN_MASK    (0x1 << 4)
> +#define SENINF4_CSI2_CTL_ECC_EN_SHIFT          5
> +#define SENINF4_CSI2_CTL_ECC_EN_MASK           (0x1 << 5)
> +#define SENINF4_CSI2_CTL_CRC_EN_SHIFT          6
> +#define SENINF4_CSI2_CTL_CRC_EN_MASK           (0x1 << 6)
> +#define SENINF4_CSI2_CTL_HSRX_DET_EN_SHIFT     7
> +#define SENINF4_CSI2_CTL_HSRX_DET_EN_MASK      (0x1 << 7)
> +#define SENINF4_CSI2_CTL_HS_PRPR_EN_SHIFT      8
> +#define SENINF4_CSI2_CTL_HS_PRPR_EN_MASK       (0x1 << 8)
> +#define SENINF4_CSI2_CTL_HS_END_EN_SHIFT       9
> +#define SENINF4_CSI2_CTL_HS_END_EN_MASK        (0x1 << 9)
> +#define SENINF4_CSI2_CTL_GENERIC_LONG_PACKET_EN_SHIFT 12
> +#define SENINF4_CSI2_CTL_GENERIC_LONG_PACKET_EN_MASK (0x1 << 12)
> +#define SENINF4_CSI2_CTL_IMAGE_PACKET_EN_SHIFT 13
> +#define SENINF4_CSI2_CTL_IMAGE_PACKET_EN_MASK  (0x1 << 13)
> +#define SENINF4_CSI2_CTL_BYTE2PIXEL_EN_SHIFT   14
> +#define SENINF4_CSI2_CTL_BYTE2PIXEL_EN_MASK    (0x1 << 14)
> +#define SENINF4_CSI2_CTL_VS_TYPE_SHIFT         15
> +#define SENINF4_CSI2_CTL_VS_TYPE_MASK          (0x1 << 15)
> +#define SENINF4_CSI2_CTL_ED_SEL_SHIFT          16
> +#define SENINF4_CSI2_CTL_ED_SEL_MASK           (0x1 << 16)
> +#define SENINF4_CSI2_CTL_FLUSH_MODE_SHIFT      18
> +#define SENINF4_CSI2_CTL_FLUSH_MODE_MASK       (0x3 << 18)
> +#define SENINF4_CSI2_CTL_HS_TRAIL_EN_SHIFT     25
> +#define SENINF4_CSI2_CTL_HS_TRAIL_EN_MASK      (0x1 << 25)
> +#define SENINF4_CSI2_CTL_CLOCK_HS_OPTION_SHIFT 27
> +#define SENINF4_CSI2_CTL_CLOCK_HS_OPTION_MASK  (0x1 << 27)
> +#define SENINF4_CSI2_CTL_VS_OUT_CYCLE_NUMBER_SHIFT 28
> +#define SENINF4_CSI2_CTL_VS_OUT_CYCLE_NUMBER_MASK (0x3 << 28)
> +#define SENINF4_CSI2_LNRC_TIMING                               0x3A04
> +#define SENINF4_CSI2_LNRC_TIMING_CLOCK_TERM_PARAMETER_SHIFT 0
> +#define SENINF4_CSI2_LNRC_TIMING_CLOCK_TERM_PARAMETER_MASK (0xff << 0)
> +#define SENINF4_CSI2_LNRC_TIMING_CLOCK_SETTLE_PARAMETER_SHIFT 8
> +#define SENINF4_CSI2_LNRC_TIMING_CLOCK_SETTLE_PARAMETER_MASK (0xff << 8)
> +#define SENINF4_CSI2_LNRD_TIMING                               0x3A08
> +#define SENINF4_CSI2_LNRD_TIMING_DATA_TERM_PARAMETER_SHIFT 0
> +#define SENINF4_CSI2_LNRD_TIMING_DATA_TERM_PARAMETER_MASK (0xff << 0)
> +#define SENINF4_CSI2_LNRD_TIMING_DATA_SETTLE_PARAMETER_SHIFT 8
> +#define SENINF4_CSI2_LNRD_TIMING_DATA_SETTLE_PARAMETER_MASK (0xff << 8)
> +#define SENINF4_CSI2_DPCM                                      0x3A0C
> +#define SENINF4_CSI2_DPCM_DPCM_MODE_SHIFT      0
> +#define SENINF4_CSI2_DPCM_DPCM_MODE_MASK       (0xf << 0)
> +#define SENINF4_CSI2_DPCM_DI_30_DPCM_EN_SHIFT  7
> +#define SENINF4_CSI2_DPCM_DI_30_DPCM_EN_MASK   (0x1 << 7)
> +#define SENINF4_CSI2_DPCM_DI_31_DPCM_EN_SHIFT  8
> +#define SENINF4_CSI2_DPCM_DI_31_DPCM_EN_MASK   (0x1 << 8)
> +#define SENINF4_CSI2_DPCM_DI_32_DPCM_EN_SHIFT  9
> +#define SENINF4_CSI2_DPCM_DI_32_DPCM_EN_MASK   (0x1 << 9)
> +#define SENINF4_CSI2_DPCM_DI_33_DPCM_EN_SHIFT  10
> +#define SENINF4_CSI2_DPCM_DI_33_DPCM_EN_MASK   (0x1 << 10)
> +#define SENINF4_CSI2_DPCM_DI_34_DPCM_EN_SHIFT  11
> +#define SENINF4_CSI2_DPCM_DI_34_DPCM_EN_MASK   (0x1 << 11)
> +#define SENINF4_CSI2_DPCM_DI_35_DPCM_EN_SHIFT  12
> +#define SENINF4_CSI2_DPCM_DI_35_DPCM_EN_MASK   (0x1 << 12)
> +#define SENINF4_CSI2_DPCM_DI_36_DPCM_EN_SHIFT  13
> +#define SENINF4_CSI2_DPCM_DI_36_DPCM_EN_MASK   (0x1 << 13)
> +#define SENINF4_CSI2_DPCM_DI_37_DPCM_EN_SHIFT  14
> +#define SENINF4_CSI2_DPCM_DI_37_DPCM_EN_MASK   (0x1 << 14)
> +#define SENINF4_CSI2_DPCM_DI_2A_DPCM_EN_SHIFT  15
> +#define SENINF4_CSI2_DPCM_DI_2A_DPCM_EN_MASK   (0x1 << 15)
> +#define SENINF4_CSI2_INT_EN                                    0x3A10
> +#define SENINF4_CSI2_INT_EN_ERR_FRAME_SYNC_SHIFT 0
> +#define SENINF4_CSI2_INT_EN_ERR_FRAME_SYNC_MASK (0x1 << 0)
> +#define SENINF4_CSI2_INT_EN_ERR_ID_SHIFT       1
> +#define SENINF4_CSI2_INT_EN_ERR_ID_MASK        (0x1 << 1)
> +#define SENINF4_CSI2_INT_EN_ERR_ECC_NO_ERROR_SHIFT 2
> +#define SENINF4_CSI2_INT_EN_ERR_ECC_NO_ERROR_MASK (0x1 << 2)
> +#define SENINF4_CSI2_INT_EN_ERR_ECC_CORRECTED_SHIFT 3
> +#define SENINF4_CSI2_INT_EN_ERR_ECC_CORRECTED_MASK (0x1 << 3)
> +#define SENINF4_CSI2_INT_EN_ERR_ECC_DOUBLE_SHIFT 4
> +#define SENINF4_CSI2_INT_EN_ERR_ECC_DOUBLE_MASK (0x1 << 4)
> +#define SENINF4_CSI2_INT_EN_ERR_CRC_SHIFT      5
> +#define SENINF4_CSI2_INT_EN_ERR_CRC_MASK       (0x1 << 5)
> +#define SENINF4_CSI2_INT_EN_ERR_CRC_NO_ERROR_SHIFT 6
> +#define SENINF4_CSI2_INT_EN_ERR_CRC_NO_ERROR_MASK (0x1 << 6)
> +#define SENINF4_CSI2_INT_EN_ERR_MULTI_LANE_SYNC_SHIFT 7
> +#define SENINF4_CSI2_INT_EN_ERR_MULTI_LANE_SYNC_MASK (0x1 << 7)
> +#define SENINF4_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD0_SHIFT 8
> +#define SENINF4_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD0_MASK (0x1 << 8)
> +#define SENINF4_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD1_SHIFT 9
> +#define SENINF4_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD1_MASK (0x1 << 9)
> +#define SENINF4_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD2_SHIFT 10
> +#define SENINF4_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD2_MASK (0x1 << 10)
> +#define SENINF4_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD3_SHIFT 11
> +#define SENINF4_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD3_MASK (0x1 << 11)
> +#define SENINF4_CSI2_INT_EN_FS_SHIFT           12
> +#define SENINF4_CSI2_INT_EN_FS_MASK            (0x1 << 12)
> +#define SENINF4_CSI2_INT_EN_LS_SHIFT           13
> +#define SENINF4_CSI2_INT_EN_LS_MASK            (0x1 << 13)
> +#define SENINF4_CSI2_INT_EN_GS_SHIFT           14
> +#define SENINF4_CSI2_INT_EN_GS_MASK            (0x1 << 14)
> +#define SENINF4_CSI2_INT_EN_FE_SHIFT           15
> +#define SENINF4_CSI2_INT_EN_FE_MASK            (0x1 << 15)
> +#define SENINF4_CSI2_INT_EN_ERR_FRAME_SYNC_S0_SHIFT 16
> +#define SENINF4_CSI2_INT_EN_ERR_FRAME_SYNC_S0_MASK (0x1 << 16)
> +#define SENINF4_CSI2_INT_EN_ERR_FRAME_SYNC_S1_SHIFT 17
> +#define SENINF4_CSI2_INT_EN_ERR_FRAME_SYNC_S1_MASK (0x1 << 17)
> +#define SENINF4_CSI2_INT_EN_ERR_FRAME_SYNC_S2_SHIFT 18
> +#define SENINF4_CSI2_INT_EN_ERR_FRAME_SYNC_S2_MASK (0x1 << 18)
> +#define SENINF4_CSI2_INT_EN_ERR_FRAME_SYNC_S3_SHIFT 19
> +#define SENINF4_CSI2_INT_EN_ERR_FRAME_SYNC_S3_MASK (0x1 << 19)
> +#define SENINF4_CSI2_INT_EN_ERR_FRAME_SYNC_S4_SHIFT 20
> +#define SENINF4_CSI2_INT_EN_ERR_FRAME_SYNC_S4_MASK (0x1 << 20)
> +#define SENINF4_CSI2_INT_EN_ERR_FRAME_SYNC_S5_SHIFT 21
> +#define SENINF4_CSI2_INT_EN_ERR_FRAME_SYNC_S5_MASK (0x1 << 21)
> +#define SENINF4_CSI2_INT_EN_ERR_LANE_RESYNC_SHIFT 22
> +#define SENINF4_CSI2_INT_EN_ERR_LANE_RESYNC_MASK (0x1 << 22)
> +#define SENINF4_CSI2_INT_EN_ERR_FRAME_SYNC_S6_SHIFT 23
> +#define SENINF4_CSI2_INT_EN_ERR_FRAME_SYNC_S6_MASK (0x1 << 23)
> +#define SENINF4_CSI2_INT_EN_ERR_FRAME_SYNC_S7_SHIFT 24
> +#define SENINF4_CSI2_INT_EN_ERR_FRAME_SYNC_S7_MASK (0x1 << 24)
> +#define SENINF4_CSI2_INT_EN_TRIO0_ESCAPE_CODE_DETECT_SHIFT 26
> +#define SENINF4_CSI2_INT_EN_TRIO0_ESCAPE_CODE_DETECT_MASK (0x1 << 26)
> +#define SENINF4_CSI2_INT_EN_TRIO1_ESCAPE_CODE_DETECT_SHIFT 27
> +#define SENINF4_CSI2_INT_EN_TRIO1_ESCAPE_CODE_DETECT_MASK (0x1 << 27)
> +#define SENINF4_CSI2_INT_EN_TRIO2_ESCAPE_CODE_DETECT_SHIFT 28
> +#define SENINF4_CSI2_INT_EN_TRIO2_ESCAPE_CODE_DETECT_MASK (0x1 << 28)
> +#define SENINF4_CSI2_INT_EN_TRIO3_ESCAPE_CODE_DETECT_SHIFT 29
> +#define SENINF4_CSI2_INT_EN_TRIO3_ESCAPE_CODE_DETECT_MASK (0x1 << 29)
> +#define SENINF4_CSI2_INT_EN_MERGE_FIFO_AF_SHIFT 30
> +#define SENINF4_CSI2_INT_EN_MERGE_FIFO_AF_MASK (0x1 << 30)
> +#define SENINF4_CSI2_INT_EN_INT_WCLR_EN_SHIFT  31
> +#define SENINF4_CSI2_INT_EN_INT_WCLR_EN_MASK   (0x1 << 31)
> +#define SENINF4_CSI2_INT_STATUS                                0x3A14
> +#define SENINF4_CSI2_INT_STATUS_ERR_FRAME_SYNC_STA_SHIFT 0
> +#define SENINF4_CSI2_INT_STATUS_ERR_FRAME_SYNC_STA_MASK (0x1 << 0)
> +#define SENINF4_CSI2_INT_STATUS_ERR_ID_STA_SHIFT 1
> +#define SENINF4_CSI2_INT_STATUS_ERR_ID_STA_MASK (0x1 << 1)
> +#define SENINF4_CSI2_INT_STATUS_ERR_ECC_NO_ERROR_STA_SHIFT 2
> +#define SENINF4_CSI2_INT_STATUS_ERR_ECC_NO_ERROR_STA_MASK (0x1 << 2)
> +#define SENINF4_CSI2_INT_STATUS_ERR_ECC_CORRECTED_STA_SHIFT 3
> +#define SENINF4_CSI2_INT_STATUS_ERR_ECC_CORRECTED_STA_MASK (0x1 << 3)
> +#define SENINF4_CSI2_INT_STATUS_ERR_ECC_DOUBLE_STA_SHIFT 4
> +#define SENINF4_CSI2_INT_STATUS_ERR_ECC_DOUBLE_STA_MASK (0x1 << 4)
> +#define SENINF4_CSI2_INT_STATUS_ERR_CRC_STA_SHIFT 5
> +#define SENINF4_CSI2_INT_STATUS_ERR_CRC_STA_MASK (0x1 << 5)
> +#define SENINF4_CSI2_INT_STATUS_ERR_MULTI_LANE_SYNC_STA_SHIFT 7
> +#define SENINF4_CSI2_INT_STATUS_ERR_MULTI_LANE_SYNC_STA_MASK (0x1 << 7)
> +#define SENINF4_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD0_STA_SHIFT 8
> +#define SENINF4_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD0_STA_MASK (0x1 << 8)
> +#define SENINF4_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD1_STA_SHIFT 9
> +#define SENINF4_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD1_STA_MASK (0x1 << 9)
> +#define SENINF4_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD2_STA_SHIFT 10
> +#define SENINF4_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD2_STA_MASK (0x1 << 10)
> +#define SENINF4_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD3_STA_SHIFT 11
> +#define SENINF4_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD3_STA_MASK (0x1 << 11)
> +#define SENINF4_CSI2_INT_STATUS_FS_STA_SHIFT   12
> +#define SENINF4_CSI2_INT_STATUS_FS_STA_MASK    (0x1 << 12)
> +#define SENINF4_CSI2_INT_STATUS_LS_STA_SHIFT   13
> +#define SENINF4_CSI2_INT_STATUS_LS_STA_MASK    (0x1 << 13)
> +#define SENINF4_CSI2_INT_STATUS_GS_STA_SHIFT   14
> +#define SENINF4_CSI2_INT_STATUS_GS_STA_MASK    (0x1 << 14)
> +#define SENINF4_CSI2_INT_STATUS_FE_STA_SHIFT   15
> +#define SENINF4_CSI2_INT_STATUS_FE_STA_MASK    (0x1 << 15)
> +#define SENINF4_CSI2_INT_STATUS_ERR_FRAME_SYNC_S0_STA_SHIFT 16
> +#define SENINF4_CSI2_INT_STATUS_ERR_FRAME_SYNC_S0_STA_MASK (0x1 << 16)
> +#define SENINF4_CSI2_INT_STATUS_ERR_FRAME_SYNC_S1_STA_SHIFT 17
> +#define SENINF4_CSI2_INT_STATUS_ERR_FRAME_SYNC_S1_STA_MASK (0x1 << 17)
> +#define SENINF4_CSI2_INT_STATUS_ERR_FRAME_SYNC_S2_STA_SHIFT 18
> +#define SENINF4_CSI2_INT_STATUS_ERR_FRAME_SYNC_S2_STA_MASK (0x1 << 18)
> +#define SENINF4_CSI2_INT_STATUS_ERR_FRAME_SYNC_S3_STA_SHIFT 19
> +#define SENINF4_CSI2_INT_STATUS_ERR_FRAME_SYNC_S3_STA_MASK (0x1 << 19)
> +#define SENINF4_CSI2_INT_STATUS_ERR_FRAME_SYNC_S4_STA_SHIFT 20
> +#define SENINF4_CSI2_INT_STATUS_ERR_FRAME_SYNC_S4_STA_MASK (0x1 << 20)
> +#define SENINF4_CSI2_INT_STATUS_ERR_FRAME_SYNC_S5_STA_SHIFT 21
> +#define SENINF4_CSI2_INT_STATUS_ERR_FRAME_SYNC_S5_STA_MASK (0x1 << 21)
> +#define SENINF4_CSI2_INT_STATUS_ERR_LANE_RESYNC_STA_SHIFT 22
> +#define SENINF4_CSI2_INT_STATUS_ERR_LANE_RESYNC_STA_MASK (0x1 << 22)
> +#define SENINF4_CSI2_INT_STATUS_ERR_FRAME_SYNC_S6_STA_SHIFT 23
> +#define SENINF4_CSI2_INT_STATUS_ERR_FRAME_SYNC_S6_STA_MASK (0x1 << 23)
> +#define SENINF4_CSI2_INT_STATUS_ERR_FRAME_SYNC_S7_STA_SHIFT 24
> +#define SENINF4_CSI2_INT_STATUS_ERR_FRAME_SYNC_S7_STA_MASK (0x1 << 24)
> +#define SENINF4_CSI2_INT_STATUS_TRIO0_ESCAPE_CODE_DETECT_STA_SHIFT 26
> +#define SENINF4_CSI2_INT_STATUS_TRIO0_ESCAPE_CODE_DETECT_STA_MASK (0x1 << 26)
> +#define SENINF4_CSI2_INT_STATUS_TRIO1_ESCAPE_CODE_DETECT_STA_SHIFT 27
> +#define SENINF4_CSI2_INT_STATUS_TRIO1_ESCAPE_CODE_DETECT_STA_MASK (0x1 << 27)
> +#define SENINF4_CSI2_INT_STATUS_TRIO2_ESCAPE_CODE_DETECT_STA_SHIFT 28
> +#define SENINF4_CSI2_INT_STATUS_TRIO2_ESCAPE_CODE_DETECT_STA_MASK (0x1 << 28)
> +#define SENINF4_CSI2_INT_STATUS_TRIO3_ESCAPE_CODE_DETECT_STA_SHIFT 29
> +#define SENINF4_CSI2_INT_STATUS_TRIO3_ESCAPE_CODE_DETECT_STA_MASK (0x1 << 29)
> +#define SENINF4_CSI2_INT_STATUS_MERGE_FIFO_AF_SHIFT 30
> +#define SENINF4_CSI2_INT_STATUS_MERGE_FIFO_AF_MASK (0x1 << 30)
> +#define SENINF4_CSI2_DGB_SEL                                   0x3A18
> +#define SENINF4_CSI2_DGB_SEL_DEBUG_SEL_SHIFT   0
> +#define SENINF4_CSI2_DGB_SEL_DEBUG_SEL_MASK    (0xff << 0)
> +#define SENINF4_CSI2_DGB_SEL_DEBUG_EN_SHIFT    31
> +#define SENINF4_CSI2_DGB_SEL_DEBUG_EN_MASK     (0x1 << 31)
> +#define SENINF4_CSI2_DBG_PORT                                  0x3A1C
> +#define SENINF4_CSI2_DBG_PORT_CTL_DBG_PORT_SHIFT 0
> +#define SENINF4_CSI2_DBG_PORT_CTL_DBG_PORT_MASK (0xffff << 0)
> +#define SENINF4_CSI2_SPARE0                                    0x3A20
> +#define SENINF4_CSI2_SPARE0_SPARE0_SHIFT       0
> +#define SENINF4_CSI2_SPARE0_SPARE0_MASK        (0xffffffff << 0)
> +#define SENINF4_CSI2_SPARE1                                    0x3A24
> +#define SENINF4_CSI2_SPARE1_SPARE1_SHIFT       0
> +#define SENINF4_CSI2_SPARE1_SPARE1_MASK        (0xffffffff << 0)
> +#define SENINF4_CSI2_LNRC_FSM                                  0x3A28
> +#define SENINF4_CSI2_LNRC_FSM_LNRC_RX_FSM_SHIFT 0
> +#define SENINF4_CSI2_LNRC_FSM_LNRC_RX_FSM_MASK (0x3f << 0)
> +#define SENINF4_CSI2_LNRD_FSM                                  0x3A2C
> +#define SENINF4_CSI2_LNRD_FSM_LNRD0_RX_FSM_SHIFT 0
> +#define SENINF4_CSI2_LNRD_FSM_LNRD0_RX_FSM_MASK (0x7f << 0)
> +#define SENINF4_CSI2_LNRD_FSM_LNRD1_RX_FSM_SHIFT 8
> +#define SENINF4_CSI2_LNRD_FSM_LNRD1_RX_FSM_MASK (0x7f << 8)
> +#define SENINF4_CSI2_LNRD_FSM_LNRD2_RX_FSM_SHIFT 16
> +#define SENINF4_CSI2_LNRD_FSM_LNRD2_RX_FSM_MASK (0x7f << 16)
> +#define SENINF4_CSI2_LNRD_FSM_LNRD3_RX_FSM_SHIFT 24
> +#define SENINF4_CSI2_LNRD_FSM_LNRD3_RX_FSM_MASK (0x7f << 24)
> +#define SENINF4_CSI2_FRAME_LINE_NUM                            0x3A30
> +#define SENINF4_CSI2_FRAME_LINE_NUM_FRAME_NUM_SHIFT 0
> +#define SENINF4_CSI2_FRAME_LINE_NUM_FRAME_NUM_MASK (0xffff << 0)
> +#define SENINF4_CSI2_FRAME_LINE_NUM_LINE_NUM_SHIFT 16
> +#define SENINF4_CSI2_FRAME_LINE_NUM_LINE_NUM_MASK (0xffff << 16)
> +#define SENINF4_CSI2_GENERIC_SHORT                             0x3A34
> +#define SENINF4_CSI2_GENERIC_SHORT_GENERIC_SHORT_PACKET_DT_SHIFT 0
> +#define SENINF4_CSI2_GENERIC_SHORT_GENERIC_SHORT_PACKET_DT_MASK (0x3f << 0)
> +#define SENINF4_CSI2_GENERIC_SHORT_GENERIC_SHORT_PACKET_DATA_SHIFT 16
> +#define SENINF4_CSI2_GENERIC_SHORT_GENERIC_SHORT_PACKET_DATA_MASK \
> +(0xffff << 16)
> +#define SENINF4_CSI2_HSRX_DBG                                  0x3A38
> +#define SENINF4_CSI2_HSRX_DBG_DATA_LANE0_HSRX_EN_SHIFT 0
> +#define SENINF4_CSI2_HSRX_DBG_DATA_LANE0_HSRX_EN_MASK (0x1 << 0)
> +#define SENINF4_CSI2_HSRX_DBG_DATA_LANE1_HSRX_EN_SHIFT 1
> +#define SENINF4_CSI2_HSRX_DBG_DATA_LANE1_HSRX_EN_MASK (0x1 << 1)
> +#define SENINF4_CSI2_HSRX_DBG_DATA_LANE2_HSRX_EN_SHIFT 2
> +#define SENINF4_CSI2_HSRX_DBG_DATA_LANE2_HSRX_EN_MASK (0x1 << 2)
> +#define SENINF4_CSI2_HSRX_DBG_DATA_LANE3_HSRX_EN_SHIFT 3
> +#define SENINF4_CSI2_HSRX_DBG_DATA_LANE3_HSRX_EN_MASK (0x1 << 3)
> +#define SENINF4_CSI2_HSRX_DBG_CLOCK_LANE_HSRX_EN_SHIFT 4
> +#define SENINF4_CSI2_HSRX_DBG_CLOCK_LANE_HSRX_EN_MASK (0x1 << 4)
> +#define SENINF4_CSI2_DI                                        0x3A3C
> +#define SENINF4_CSI2_DI_VC0_SHIFT              0
> +#define SENINF4_CSI2_DI_VC0_MASK               (0x3 << 0)
> +#define SENINF4_CSI2_DI_DT0_SHIFT              2
> +#define SENINF4_CSI2_DI_DT0_MASK               (0x3f << 2)
> +#define SENINF4_CSI2_DI_VC1_SHIFT              8
> +#define SENINF4_CSI2_DI_VC1_MASK               (0x3 << 8)
> +#define SENINF4_CSI2_DI_DT1_SHIFT              10
> +#define SENINF4_CSI2_DI_DT1_MASK               (0x3f << 10)
> +#define SENINF4_CSI2_DI_VC2_SHIFT              16
> +#define SENINF4_CSI2_DI_VC2_MASK               (0x3 << 16)
> +#define SENINF4_CSI2_DI_DT2_SHIFT              18
> +#define SENINF4_CSI2_DI_DT2_MASK               (0x3f << 18)
> +#define SENINF4_CSI2_DI_VC3_SHIFT              24
> +#define SENINF4_CSI2_DI_VC3_MASK               (0x3 << 24)
> +#define SENINF4_CSI2_DI_DT3_SHIFT              26
> +#define SENINF4_CSI2_DI_DT3_MASK               (0x3f << 26)
> +#define SENINF4_CSI2_HS_TRAIL                                  0x3A40
> +#define SENINF4_CSI2_HS_TRAIL_HS_TRAIL_PARAMETER_SHIFT 0
> +#define SENINF4_CSI2_HS_TRAIL_HS_TRAIL_PARAMETER_MASK (0xff << 0)
> +#define SENINF4_CSI2_DI_CTRL                                   0x3A44
> +#define SENINF4_CSI2_DI_CTRL_VC0_INTERLEAVING_SHIFT 0
> +#define SENINF4_CSI2_DI_CTRL_VC0_INTERLEAVING_MASK (0x1 << 0)
> +#define SENINF4_CSI2_DI_CTRL_DT0_INTERLEAVING_SHIFT 1
> +#define SENINF4_CSI2_DI_CTRL_DT0_INTERLEAVING_MASK (0x3 << 1)
> +#define SENINF4_CSI2_DI_CTRL_VC1_INTERLEAVING_SHIFT 8
> +#define SENINF4_CSI2_DI_CTRL_VC1_INTERLEAVING_MASK (0x1 << 8)
> +#define SENINF4_CSI2_DI_CTRL_DT1_INTERLEAVING_SHIFT 9
> +#define SENINF4_CSI2_DI_CTRL_DT1_INTERLEAVING_MASK (0x3 << 9)
> +#define SENINF4_CSI2_DI_CTRL_VC2_INTERLEAVING_SHIFT 16
> +#define SENINF4_CSI2_DI_CTRL_VC2_INTERLEAVING_MASK (0x1 << 16)
> +#define SENINF4_CSI2_DI_CTRL_DT2_INTERLEAVING_SHIFT 17
> +#define SENINF4_CSI2_DI_CTRL_DT2_INTERLEAVING_MASK (0x3 << 17)
> +#define SENINF4_CSI2_DI_CTRL_VC3_INTERLEAVING_SHIFT 24
> +#define SENINF4_CSI2_DI_CTRL_VC3_INTERLEAVING_MASK (0x1 << 24)
> +#define SENINF4_CSI2_DI_CTRL_DT3_INTERLEAVING_SHIFT 25
> +#define SENINF4_CSI2_DI_CTRL_DT3_INTERLEAVING_MASK (0x3 << 25)
> +#define SENINF4_CSI2_DETECT_CON1                               0x3A4C
> +#define SENINF4_CSI2_DETECT_CON1_DETECT_SYNC_DISABLE_SHIFT 0
> +#define SENINF4_CSI2_DETECT_CON1_DETECT_SYNC_DISABLE_MASK (0x1 << 0)
> +#define SENINF4_CSI2_DETECT_CON1_DETECT_SYNC_MASK_SHIFT 1
> +#define SENINF4_CSI2_DETECT_CON1_DETECT_SYNC_MASK_MASK (0x7f << 1)
> +#define SENINF4_CSI2_DETECT_CON1_SYNC_WORD_SHIFT 8
> +#define SENINF4_CSI2_DETECT_CON1_SYNC_WORD_MASK (0x1fffff << 8)
> +#define SENINF4_CSI2_DETECT_CON2                               0x3A50
> +#define SENINF4_CSI2_DETECT_CON2_DETECT_ESCAPE_DISABLE_SHIFT 0
> +#define SENINF4_CSI2_DETECT_CON2_DETECT_ESCAPE_DISABLE_MASK (0x1 << 0)
> +#define SENINF4_CSI2_DETECT_CON2_DETECT_ESCAPE_MASK_SHIFT 1
> +#define SENINF4_CSI2_DETECT_CON2_DETECT_ESCAPE_MASK_MASK (0x7f << 1)
> +#define SENINF4_CSI2_DETECT_CON2_ESCAPE_WORD_SHIFT 8
> +#define SENINF4_CSI2_DETECT_CON2_ESCAPE_WORD_MASK (0x1fffff << 8)
> +#define SENINF4_CSI2_DETECT_CON3                               0x3A54
> +#define SENINF4_CSI2_DETECT_CON3_DETECT_POST_DISABLE_SHIFT 0
> +#define SENINF4_CSI2_DETECT_CON3_DETECT_POST_DISABLE_MASK (0x1 << 0)
> +#define SENINF4_CSI2_DETECT_CON3_DETECT_POST_MASK_SHIFT 1
> +#define SENINF4_CSI2_DETECT_CON3_DETECT_POST_MASK_MASK (0x7f << 1)
> +#define SENINF4_CSI2_DETECT_CON3_POST_WORD_SHIFT 8
> +#define SENINF4_CSI2_DETECT_CON3_POST_WORD_MASK (0x1fffff << 8)
> +#define SENINF4_CSI2_RLR0_CON0                                 0x3A58
> +#define SENINF4_CSI2_RLR0_CON0_RLR0_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF4_CSI2_RLR0_CON0_RLR0_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF4_CSI2_RLR0_CON0_RLR0_PRBS_SEED_0_SHIFT 8
> +#define SENINF4_CSI2_RLR0_CON0_RLR0_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF4_CSI2_RLR0_CON0_RLR0_PRBS_SEED_1_SHIFT 16
> +#define SENINF4_CSI2_RLR0_CON0_RLR0_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF4_CSI2_RLR0_CON0_RLR0_PRBS_SEED_2_SHIFT 24
> +#define SENINF4_CSI2_RLR0_CON0_RLR0_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF4_CSI2_RLR1_CON0                                 0x3A5C
> +#define SENINF4_CSI2_RLR1_CON0_RLR1_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF4_CSI2_RLR1_CON0_RLR1_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF4_CSI2_RLR1_CON0_RLR1_PRBS_SEED_0_SHIFT 8
> +#define SENINF4_CSI2_RLR1_CON0_RLR1_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF4_CSI2_RLR1_CON0_RLR1_PRBS_SEED_1_SHIFT 16
> +#define SENINF4_CSI2_RLR1_CON0_RLR1_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF4_CSI2_RLR1_CON0_RLR1_PRBS_SEED_2_SHIFT 24
> +#define SENINF4_CSI2_RLR1_CON0_RLR1_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF4_CSI2_RLR2_CON0                                 0x3A60
> +#define SENINF4_CSI2_RLR2_CON0_RLR2_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF4_CSI2_RLR2_CON0_RLR2_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF4_CSI2_RLR2_CON0_RLR2_PRBS_SEED_0_SHIFT 8
> +#define SENINF4_CSI2_RLR2_CON0_RLR2_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF4_CSI2_RLR2_CON0_RLR2_PRBS_SEED_1_SHIFT 16
> +#define SENINF4_CSI2_RLR2_CON0_RLR2_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF4_CSI2_RLR2_CON0_RLR2_PRBS_SEED_2_SHIFT 24
> +#define SENINF4_CSI2_RLR2_CON0_RLR2_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF4_CSI2_RLR_CON0                                  0x3A64
> +#define SENINF4_CSI2_RLR_CON0_RLRN_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF4_CSI2_RLR_CON0_RLRN_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF4_CSI2_RLR_CON0_RLRN_PRBS_SEED_0_SHIFT 8
> +#define SENINF4_CSI2_RLR_CON0_RLRN_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF4_CSI2_RLR_CON0_RLRN_PRBS_SEED_1_SHIFT 16
> +#define SENINF4_CSI2_RLR_CON0_RLRN_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF4_CSI2_RLR_CON0_RLRN_PRBS_SEED_2_SHIFT 24
> +#define SENINF4_CSI2_RLR_CON0_RLRN_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF4_CSI2_MUX_CON                                   0x3A68
> +#define SENINF4_CSI2_MUX_CON_DPHY_RX_EXTERNAL_EN_SHIFT 0
> +#define SENINF4_CSI2_MUX_CON_DPHY_RX_EXTERNAL_EN_MASK (0x1 << 0)
> +#define SENINF4_CSI2_MUX_CON_CPHY_TX_EXTERNAL_EN_SHIFT 1
> +#define SENINF4_CSI2_MUX_CON_CPHY_TX_EXTERNAL_EN_MASK (0x1 << 1)
> +#define SENINF4_CSI2_MUX_CON_CPHY_RX_EXTERNAL_EN_SHIFT 2
> +#define SENINF4_CSI2_MUX_CON_CPHY_RX_EXTERNAL_EN_MASK (0x1 << 2)
> +#define SENINF4_CSI2_MUX_CON_RLR_PATTERN_DELAY_EN_SHIFT 3
> +#define SENINF4_CSI2_MUX_CON_RLR_PATTERN_DELAY_EN_MASK (0x1 << 3)
> +#define SENINF4_CSI2_MUX_CON_POST_PACKET_IGNORE_EN_SHIFT 4
> +#define SENINF4_CSI2_MUX_CON_POST_PACKET_IGNORE_EN_MASK (0x1 << 4)
> +#define SENINF4_CSI2_DETECT_DBG0                               0x3A6C
> +#define SENINF4_CSI2_DETECT_DBG0_DETECT_SYNC_LANE0_ST_SHIFT 0
> +#define SENINF4_CSI2_DETECT_DBG0_DETECT_SYNC_LANE0_ST_MASK (0x1 << 0)
> +#define SENINF4_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE0_ST_SHIFT 1
> +#define SENINF4_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE0_ST_MASK (0x1 << 1)
> +#define SENINF4_CSI2_DETECT_DBG0_DETECT_POST_LANE0_ST_SHIFT 2
> +#define SENINF4_CSI2_DETECT_DBG0_DETECT_POST_LANE0_ST_MASK (0x1 << 2)
> +#define SENINF4_CSI2_DETECT_DBG0_POSITION_SYNC_LANE0_ST_SHIFT 3
> +#define SENINF4_CSI2_DETECT_DBG0_POSITION_SYNC_LANE0_ST_MASK (0xf << 3)
> +#define SENINF4_CSI2_DETECT_DBG0_POSITION_ESCAPE_LANE0_ST_SHIFT 7
> +#define SENINF4_CSI2_DETECT_DBG0_POSITION_ESCAPE_LANE0_ST_MASK (0xf << 7)
> +#define SENINF4_CSI2_DETECT_DBG0_DETECT_SYNC_LANE1_ST_SHIFT 12
> +#define SENINF4_CSI2_DETECT_DBG0_DETECT_SYNC_LANE1_ST_MASK (0x1 << 12)
> +#define SENINF4_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE1_ST_SHIFT 13
> +#define SENINF4_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE1_ST_MASK (0x1 << 13)
> +#define SENINF4_CSI2_DETECT_DBG0_DETECT_POST_LANE1_ST_SHIFT 14
> +#define SENINF4_CSI2_DETECT_DBG0_DETECT_POST_LANE1_ST_MASK (0x1 << 14)
> +#define SENINF4_CSI2_DETECT_DBG0_POSITION_SYNC_LANE1_ST_SHIFT 15
> +#define SENINF4_CSI2_DETECT_DBG0_POSITION_SYNC_LANE1_ST_MASK (0xf << 15)
> +#define SENINF4_CSI2_DETECT_DBG0_POSITION_ESCAPE_LANE1_ST_SHIFT 19
> +#define SENINF4_CSI2_DETECT_DBG0_POSITION_ESCAPE_LANE1_ST_MASK (0xf << 19)
> +#define SENINF4_CSI2_DETECT_DBG0_DETECT_SYNC_LANE2_ST_SHIFT 24
> +#define SENINF4_CSI2_DETECT_DBG0_DETECT_SYNC_LANE2_ST_MASK (0x1 << 24)
> +#define SENINF4_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE2_ST_SHIFT 25
> +#define SENINF4_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE2_ST_MASK (0x1 << 25)
> +#define SENINF4_CSI2_DETECT_DBG0_DETECT_POST_LANE2_ST_SHIFT 26
> +#define SENINF4_CSI2_DETECT_DBG0_DETECT_POST_LANE2_ST_MASK (0x1 << 26)
> +#define SENINF4_CSI2_DETECT_DBG0_POSITION_SYNC_LANE2_ST_SHIFT 27
> +#define SENINF4_CSI2_DETECT_DBG0_POSITION_SYNC_LANE2_ST_MASK (0xf << 27)
> +#define SENINF4_CSI2_DETECT_DBG1                               0x3A70
> +#define SENINF4_CSI2_DETECT_DBG1_POSITION_ESCAPE_LANE2_ST_SHIFT 0
> +#define SENINF4_CSI2_DETECT_DBG1_POSITION_ESCAPE_LANE2_ST_MASK (0xf << 0)
> +#define SENINF4_CSI2_RESYNC_MERGE_CTL                          0x3A74
> +#define SENINF4_CSI2_RESYNC_MERGE_CTL_CPHY_LANE_RESYNC_CNT_SHIFT 0
> +#define SENINF4_CSI2_RESYNC_MERGE_CTL_CPHY_LANE_RESYNC_CNT_MASK (0x7 << 0)
> +#define SENINF4_CSI2_RESYNC_MERGE_CTL_LANE_RESYNC_FLUSH_EN_SHIFT 8
> +#define SENINF4_CSI2_RESYNC_MERGE_CTL_LANE_RESYNC_FLUSH_EN_MASK (0x1 << 8)
> +#define SENINF4_CSI2_RESYNC_MERGE_CTL_LANE_RESYNC_DATAOUT_OPTION_SHIFT 9
> +#define SENINF4_CSI2_RESYNC_MERGE_CTL_LANE_RESYNC_DATAOUT_OPTION_MASK \
> +(0x1 << 9)
> +#define SENINF4_CSI2_RESYNC_MERGE_CTL_BYPASS_LANE_RESYNC_SHIFT 10
> +#define SENINF4_CSI2_RESYNC_MERGE_CTL_BYPASS_LANE_RESYNC_MASK (0x1 << 10)
> +#define SENINF4_CSI2_RESYNC_MERGE_CTL_CDPHY_SEL_SHIFT 11
> +#define SENINF4_CSI2_RESYNC_MERGE_CTL_CDPHY_SEL_MASK (0x1 << 11)
> +#define SENINF4_CSI2_CTRL_TRIO_MUX                             0x3A78
> +#define SENINF4_CSI2_CTRL_TRIO_MUX_TRIO0_MUX_SHIFT 0
> +#define SENINF4_CSI2_CTRL_TRIO_MUX_TRIO0_MUX_MASK (0x7 << 0)
> +#define SENINF4_CSI2_CTRL_TRIO_MUX_TRIO1_MUX_SHIFT 3
> +#define SENINF4_CSI2_CTRL_TRIO_MUX_TRIO1_MUX_MASK (0x7 << 3)
> +#define SENINF4_CSI2_CTRL_TRIO_MUX_TRIO2_MUX_SHIFT 6
> +#define SENINF4_CSI2_CTRL_TRIO_MUX_TRIO2_MUX_MASK (0x7 << 6)
> +#define SENINF4_CSI2_CTRL_TRIO_MUX_TRIO3_MUX_SHIFT 9
> +#define SENINF4_CSI2_CTRL_TRIO_MUX_TRIO3_MUX_MASK (0x7 << 9)
> +#define SENINF4_CSI2_CTRL_TRIO_CON                             0x3A7C
> +#define SENINF4_CSI2_CTRL_TRIO_CON_TRIO0_LPRX_EN_SHIFT 0
> +#define SENINF4_CSI2_CTRL_TRIO_CON_TRIO0_LPRX_EN_MASK (0x1 << 0)
> +#define SENINF4_CSI2_CTRL_TRIO_CON_TRIO0_HSRX_EN_SHIFT 1
> +#define SENINF4_CSI2_CTRL_TRIO_CON_TRIO0_HSRX_EN_MASK (0x1 << 1)
> +#define SENINF4_CSI2_CTRL_TRIO_CON_TRIO1_LPRX_EN_SHIFT 2
> +#define SENINF4_CSI2_CTRL_TRIO_CON_TRIO1_LPRX_EN_MASK (0x1 << 2)
> +#define SENINF4_CSI2_CTRL_TRIO_CON_TRIO1_HSRX_EN_SHIFT 3
> +#define SENINF4_CSI2_CTRL_TRIO_CON_TRIO1_HSRX_EN_MASK (0x1 << 3)
> +#define SENINF4_CSI2_CTRL_TRIO_CON_TRIO2_LPRX_EN_SHIFT 4
> +#define SENINF4_CSI2_CTRL_TRIO_CON_TRIO2_LPRX_EN_MASK (0x1 << 4)
> +#define SENINF4_CSI2_CTRL_TRIO_CON_TRIO2_HSRX_EN_SHIFT 5
> +#define SENINF4_CSI2_CTRL_TRIO_CON_TRIO2_HSRX_EN_MASK (0x1 << 5)
> +#define SENINF4_CSI2_CTRL_TRIO_CON_TRIO3_LPRX_EN_SHIFT 6
> +#define SENINF4_CSI2_CTRL_TRIO_CON_TRIO3_LPRX_EN_MASK (0x1 << 6)
> +#define SENINF4_CSI2_CTRL_TRIO_CON_TRIO3_HSRX_EN_SHIFT 7
> +#define SENINF4_CSI2_CTRL_TRIO_CON_TRIO3_HSRX_EN_MASK (0x1 << 7)
> +#define SENINF4_FIX_ADDR_CPHY0_DBG                             0x3A80
> +#define SENINF4_FIX_ADDR_CPHY0_DBG_ERROR_COUNT_CPHY0_SHIFT 16
> +#define SENINF4_FIX_ADDR_CPHY0_DBG_ERROR_COUNT_CPHY0_MASK (0xff << 16)
> +#define SENINF4_FIX_ADDR_CPHY0_DBG_WORD_COUNT_OVER_FLOAT_CPHY0_SHIFT 24
> +#define SENINF4_FIX_ADDR_CPHY0_DBG_WORD_COUNT_OVER_FLOAT_CPHY0_MASK (0x1 << 24)
> +#define SENINF4_FIX_ADDR_CPHY1_DBG                             0x3A84
> +#define SENINF4_FIX_ADDR_CPHY1_DBG_ERROR_COUNT_CPHY1_SHIFT 16
> +#define SENINF4_FIX_ADDR_CPHY1_DBG_ERROR_COUNT_CPHY1_MASK (0xff << 16)
> +#define SENINF4_FIX_ADDR_CPHY1_DBG_WORD_COUNT_OVER_FLOAT_CPHY1_SHIFT 24
> +#define SENINF4_FIX_ADDR_CPHY1_DBG_WORD_COUNT_OVER_FLOAT_CPHY1_MASK (0x1 << 24)
> +#define SENINF4_FIX_ADDR_CPHY2_DBG                             0x3A88
> +#define SENINF4_FIX_ADDR_CPHY2_DBG_ERROR_COUNT_CPHY2_SHIFT 16
> +#define SENINF4_FIX_ADDR_CPHY2_DBG_ERROR_COUNT_CPHY2_MASK (0xff << 16)
> +#define SENINF4_FIX_ADDR_CPHY2_DBG_WORD_COUNT_OVER_FLOAT_CPHY2_SHIFT 24
> +#define SENINF4_FIX_ADDR_CPHY2_DBG_WORD_COUNT_OVER_FLOAT_CPHY2_MASK (0x1 << 24)
> +#define SENINF4_FIX_ADDR_DBG                                   0x3A8C
> +#define SENINF4_FIX_ADDR_DBG_ERROR_COUNT_SHIFT 16
> +#define SENINF4_FIX_ADDR_DBG_ERROR_COUNT_MASK  (0xff << 16)
> +#define SENINF4_FIX_ADDR_DBG_WORD_COUNT_OVER_FLOAT_SHIFT 24
> +#define SENINF4_FIX_ADDR_DBG_WORD_COUNT_OVER_FLOAT_MASK (0x1 << 24)
> +#define SENINF4_WIRE_STATE_DECODE_CPHY0_DBG0                   0x3A90
> +#define SENINF4_WIRE_STATE_DECODE_CPHY0_DBG0_SYMBOL_STREAM0_CPHY0_SHIFT 0
> +#define SENINF4_WIRE_STATE_DECODE_CPHY0_DBG0_SYMBOL_STREAM0_CPHY0_MASK \
> +(0xffffffff << 0)
> +#define SENINF4_WIRE_STATE_DECODE_CPHY0_DBG1                   0x3A94
> +#define SENINF4_WIRE_STATE_DECODE_CPHY0_DBG1_SYMBOL_STREAM1_CPHY0_SHIFT 0
> +#define SENINF4_WIRE_STATE_DECODE_CPHY0_DBG1_SYMBOL_STREAM1_CPHY0_MASK \
> +(0x3ff << 0)
> +#define SENINF4_WIRE_STATE_DECODE_CPHY0_DBG1_SYMBOL_STREAM_VALID_CPHY0_SHIFT 10
> +#define SENINF4_WIRE_STATE_DECODE_CPHY0_DBG1_SYMBOL_STREAM_VALID_CPHY0_MASK \
> +(0x1 << 10)
> +#define SENINF4_WIRE_STATE_DECODE_CPHY1_DBG0                   0x3A98
> +#define SENINF4_WIRE_STATE_DECODE_CPHY1_DBG0_SYMBOL_STREAM0_CPHY1_SHIFT 0
> +#define SENINF4_WIRE_STATE_DECODE_CPHY1_DBG0_SYMBOL_STREAM0_CPHY1_MASK \
> +(0xffffffff << 0)
> +#define SENINF4_WIRE_STATE_DECODE_CPHY1_DBG1                   0x3A9C
> +#define SENINF4_WIRE_STATE_DECODE_CPHY1_DBG1_SYMBOL_STREAM1_CPHY1_SHIFT 0
> +#define SENINF4_WIRE_STATE_DECODE_CPHY1_DBG1_SYMBOL_STREAM1_CPHY1_MASK \
> +(0x3ff << 0)
> +#define SENINF4_WIRE_STATE_DECODE_CPHY1_DBG1_SYMBOL_STREAM_VALID_CPHY1_SHIFT 10
> +#define SENINF4_WIRE_STATE_DECODE_CPHY1_DBG1_SYMBOL_STREAM_VALID_CPHY1_MASK \
> +(0x1 << 10)
> +#define SENINF4_WIRE_STATE_DECODE_CPHY2_DBG0                   0x3AA0
> +#define SENINF4_WIRE_STATE_DECODE_CPHY2_DBG0_SYMBOL_STREAM0_CPHY2_SHIFT 0
> +#define SENINF4_WIRE_STATE_DECODE_CPHY2_DBG0_SYMBOL_STREAM0_CPHY2_MASK \
> +(0xffffffff << 0)
> +#define SENINF4_WIRE_STATE_DECODE_CPHY2_DBG1                   0x3AA4
> +#define SENINF4_WIRE_STATE_DECODE_CPHY2_DBG1_SYMBOL_STREAM1_CPHY2_SHIFT 0
> +#define SENINF4_WIRE_STATE_DECODE_CPHY2_DBG1_SYMBOL_STREAM1_CPHY2_MASK \
> +(0x3ff << 0)
> +#define SENINF4_WIRE_STATE_DECODE_CPHY2_DBG1_SYMBOL_STREAM_VALID_CPHY2_SHIFT 10
> +#define SENINF4_WIRE_STATE_DECODE_CPHY2_DBG1_SYMBOL_STREAM_VALID_CPHY2_MASK \
> +(0x1 << 10)
> +#define SENINF4_SYNC_RESYNC_CTL                                0x3AA8
> +#define SENINF4_SYNC_RESYNC_CTL_SYNC_DETECTION_SEL_SHIFT 0
> +#define SENINF4_SYNC_RESYNC_CTL_SYNC_DETECTION_SEL_MASK (0x7 << 0)
> +#define SENINF4_SYNC_RESYNC_CTL_FLUSH_VALID_SHIFT 3
> +#define SENINF4_SYNC_RESYNC_CTL_FLUSH_VALID_MASK (0x1 << 3)
> +#define SENINF4_POST_DETECT_CTL                                0x3AAC
> +#define SENINF4_POST_DETECT_CTL_POST_DETECT_DISABLE_SHIFT 0
> +#define SENINF4_POST_DETECT_CTL_POST_DETECT_DISABLE_MASK (0x1 << 0)
> +#define SENINF4_POST_DETECT_CTL_POST_EN_SHIFT  1
> +#define SENINF4_POST_DETECT_CTL_POST_EN_MASK   (0x1 << 1)
> +#define SENINF4_WIRE_STATE_DECODE_CONFIG                       0x3AB0
> +#define SENINF4_WIRE_STATE_DECODE_CONFIG_INIT_STATE_DECODE_SHIFT 0
> +#define SENINF4_WIRE_STATE_DECODE_CONFIG_INIT_STATE_DECODE_MASK (0x7 << 0)
> +#define SENINF4_CSI2_CPHY_LNRD_FSM                             0x3AB4
> +#define SENINF4_CSI2_CPHY_LNRD_FSM_TRIO0_RX_FSM_SHIFT 8
> +#define SENINF4_CSI2_CPHY_LNRD_FSM_TRIO0_RX_FSM_MASK (0x7f << 8)
> +#define SENINF4_CSI2_CPHY_LNRD_FSM_TRIO1_RX_FSM_SHIFT 16
> +#define SENINF4_CSI2_CPHY_LNRD_FSM_TRIO1_RX_FSM_MASK (0x7f << 16)
> +#define SENINF4_CSI2_CPHY_LNRD_FSM_TRIO2_RX_FSM_SHIFT 24
> +#define SENINF4_CSI2_CPHY_LNRD_FSM_TRIO2_RX_FSM_MASK (0x7f << 24)
> +#define SENINF4_FIX_ADDR_CPHY0_DBG0                            0x3AB8
> +#define SENINF4_FIX_ADDR_CPHY0_DBG0_WORD_COUNT_CPHY0_DBG0_SHIFT 0
> +#define SENINF4_FIX_ADDR_CPHY0_DBG0_WORD_COUNT_CPHY0_DBG0_MASK \
> +(0xffffffff << 0)
> +#define SENINF4_FIX_ADDR_CPHY0_DBG1                            0x3ABC
> +#define SENINF4_FIX_ADDR_CPHY0_DBG1_WORD_COUNT_CPHY0_DBG1_SHIFT 0
> +#define SENINF4_FIX_ADDR_CPHY0_DBG1_WORD_COUNT_CPHY0_DBG1_MASK (0xffff << 0)
> +#define SENINF4_FIX_ADDR_CPHY0_DBG1_ERROR_RECORD_CPHY0_DBG0_SHIFT 16
> +#define SENINF4_FIX_ADDR_CPHY0_DBG1_ERROR_RECORD_CPHY0_DBG0_MASK \
> +(0xffff << 16)
> +#define SENINF4_FIX_ADDR_CPHY0_DBG2                            0x3AC0
> +#define SENINF4_FIX_ADDR_CPHY0_DBG2_ERROR_RECORD_CPHY0_DBG1_SHIFT 0
> +#define SENINF4_FIX_ADDR_CPHY0_DBG2_ERROR_RECORD_CPHY0_DBG1_MASK \
> +(0xffffffff << 0)
> +#define SENINF4_FIX_ADDR_CPHY1_DBG0                            0x3AC4
> +#define SENINF4_FIX_ADDR_CPHY1_DBG0_WORD_COUNT_CPHY1_DBG0_SHIFT 0
> +#define SENINF4_FIX_ADDR_CPHY1_DBG0_WORD_COUNT_CPHY1_DBG0_MASK \
> +(0xffffffff << 0)
> +#define SENINF4_FIX_ADDR_CPHY1_DBG1                            0x3AC8
> +#define SENINF4_FIX_ADDR_CPHY1_DBG1_WORD_COUNT_CPHY1_DBG1_SHIFT 0
> +#define SENINF4_FIX_ADDR_CPHY1_DBG1_WORD_COUNT_CPHY1_DBG1_MASK \
> +(0xffff << 0)
> +#define SENINF4_FIX_ADDR_CPHY1_DBG1_ERROR_RECORD_CPHY1_DBG0_SHIFT 16
> +#define SENINF4_FIX_ADDR_CPHY1_DBG1_ERROR_RECORD_CPHY1_DBG0_MASK \
> +(0xffff << 16)
> +#define SENINF4_FIX_ADDR_CPHY1_DBG2                            0x3ACC
> +#define SENINF4_FIX_ADDR_CPHY1_DBG2_ERROR_RECORD_CPHY1_DBG1_SHIFT 0
> +#define SENINF4_FIX_ADDR_CPHY1_DBG2_ERROR_RECORD_CPHY1_DBG1_MASK \
> +(0xffffffff << 0)
> +#define SENINF4_FIX_ADDR_CPHY2_DBG0                            0x3AD0
> +#define SENINF4_FIX_ADDR_CPHY2_DBG0_WORD_COUNT_CPHY2_DBG0_SHIFT 0
> +#define SENINF4_FIX_ADDR_CPHY2_DBG0_WORD_COUNT_CPHY2_DBG0_MASK \
> +(0xffffffff << 0)
> +#define SENINF4_FIX_ADDR_CPHY2_DBG1                            0x3AD4
> +#define SENINF4_FIX_ADDR_CPHY2_DBG1_WORD_COUNT_CPHY2_DBG1_SHIFT 0
> +#define SENINF4_FIX_ADDR_CPHY2_DBG1_WORD_COUNT_CPHY2_DBG1_MASK (0xffff << 0)
> +#define SENINF4_FIX_ADDR_CPHY2_DBG1_ERROR_RECORD_CPHY2_DBG0_SHIFT 16
> +#define SENINF4_FIX_ADDR_CPHY2_DBG1_ERROR_RECORD_CPHY2_DBG0_MASK \
> +(0xffff << 16)
> +#define SENINF4_FIX_ADDR_CPHY2_DBG2                            0x3AD8
> +#define SENINF4_FIX_ADDR_CPHY2_DBG2_ERROR_RECORD_CPHY2_DBG1_SHIFT 0
> +#define SENINF4_FIX_ADDR_CPHY2_DBG2_ERROR_RECORD_CPHY2_DBG1_MASK \
> +(0xffffffff << 0)
> +#define SENINF4_FIX_ADDR_DBG0                                  0x3ADC
> +#define SENINF4_FIX_ADDR_DBG0_WORD_COUNT_DBG0_SHIFT 0
> +#define SENINF4_FIX_ADDR_DBG0_WORD_COUNT_DBG0_MASK (0xffffffff << 0)
> +#define SENINF4_FIX_ADDR_DBG1                                  0x3AE0
> +#define SENINF4_FIX_ADDR_DBG1_WORD_COUNT_DBG1_SHIFT 0
> +#define SENINF4_FIX_ADDR_DBG1_WORD_COUNT_DBG1_MASK (0xffff << 0)
> +#define SENINF4_FIX_ADDR_DBG1_ERROR_RECORD_DBG0_SHIFT 16
> +#define SENINF4_FIX_ADDR_DBG1_ERROR_RECORD_DBG0_MASK (0xffff << 16)
> +#define SENINF4_FIX_ADDR_DBG2                                  0x3AE4
> +#define SENINF4_FIX_ADDR_DBG2_ERROR_RECORD_DBG1_SHIFT 0
> +#define SENINF4_FIX_ADDR_DBG2_ERROR_RECORD_DBG1_MASK (0xffffffff << 0)
> +#define SENINF4_CSI2_MODE                                      0x3AE8
> +#define SENINF4_CSI2_MODE_CSR_CSI2_MODE_SHIFT  0
> +#define SENINF4_CSI2_MODE_CSR_CSI2_MODE_MASK   (0xff << 0)
> +#define SENINF4_CSI2_MODE_CSR_CSI2_HEADER_LEN_SHIFT 8
> +#define SENINF4_CSI2_MODE_CSR_CSI2_HEADER_LEN_MASK (0x7 << 8)
> +#define SENINF4_CSI2_MODE_CSR_CPHY_DI_POS_SHIFT 16
> +#define SENINF4_CSI2_MODE_CSR_CPHY_DI_POS_MASK (0xff << 16)
> +#define SENINF4_CSI2_MODE_CSR_CPHY_WC_POS_SHIFT 24
> +#define SENINF4_CSI2_MODE_CSR_CPHY_WC_POS_MASK (0xff << 24)
> +#define SENINF4_CSI2_DI_EXT                                    0x3AF0
> +#define SENINF4_CSI2_DI_EXT_VC4_SHIFT          0
> +#define SENINF4_CSI2_DI_EXT_VC4_MASK           (0x3 << 0)
> +#define SENINF4_CSI2_DI_EXT_DT4_SHIFT          2
> +#define SENINF4_CSI2_DI_EXT_DT4_MASK           (0x3f << 2)
> +#define SENINF4_CSI2_DI_EXT_VC5_SHIFT          8
> +#define SENINF4_CSI2_DI_EXT_VC5_MASK           (0x3 << 8)
> +#define SENINF4_CSI2_DI_EXT_DT5_SHIFT          10
> +#define SENINF4_CSI2_DI_EXT_DT5_MASK           (0x3f << 10)
> +#define SENINF4_CSI2_DI_CTRL_EXT                               0x3AF4
> +#define SENINF4_CSI2_DI_CTRL_EXT_VC4_INTERLEAVING_SHIFT 0
> +#define SENINF4_CSI2_DI_CTRL_EXT_VC4_INTERLEAVING_MASK (0x1 << 0)
> +#define SENINF4_CSI2_DI_CTRL_EXT_DT4_INTERLEAVING_SHIFT 1
> +#define SENINF4_CSI2_DI_CTRL_EXT_DT4_INTERLEAVING_MASK (0x3 << 1)
> +#define SENINF4_CSI2_DI_CTRL_EXT_VC5_INTERLEAVING_SHIFT 8
> +#define SENINF4_CSI2_DI_CTRL_EXT_VC5_INTERLEAVING_MASK (0x1 << 8)
> +#define SENINF4_CSI2_DI_CTRL_EXT_DT5_INTERLEAVING_SHIFT 9
> +#define SENINF4_CSI2_DI_CTRL_EXT_DT5_INTERLEAVING_MASK (0x3 << 9)
> +#define SENINF4_CSI2_CPHY_LOOPBACK                             0x3AF8
> +#define SENINF4_CSI2_CPHY_LOOPBACK_TRIGGER_SYNC_INIT_SHIFT 0
> +#define SENINF4_CSI2_CPHY_LOOPBACK_TRIGGER_SYNC_INIT_MASK (0x1 << 0)
> +#define SENINF4_CSI2_CPHY_LOOPBACK_RELEASE_SYNC_INIT_SHIFT 1
> +#define SENINF4_CSI2_CPHY_LOOPBACK_RELEASE_SYNC_INIT_MASK (0x1 << 1)
> +#define SENINF4_CSI2_PROGSEQ_0                                 0x3B00
> +#define SENINF4_CSI2_PROGSEQ_0_PROGSEQ_S0_SHIFT 0
> +#define SENINF4_CSI2_PROGSEQ_0_PROGSEQ_S0_MASK (0x7 << 0)
> +#define SENINF4_CSI2_PROGSEQ_0_PROGSEQ_S1_SHIFT 4
> +#define SENINF4_CSI2_PROGSEQ_0_PROGSEQ_S1_MASK (0x7 << 4)
> +#define SENINF4_CSI2_PROGSEQ_0_PROGSEQ_S2_SHIFT 8
> +#define SENINF4_CSI2_PROGSEQ_0_PROGSEQ_S2_MASK (0x7 << 8)
> +#define SENINF4_CSI2_PROGSEQ_0_PROGSEQ_S3_SHIFT 12
> +#define SENINF4_CSI2_PROGSEQ_0_PROGSEQ_S3_MASK (0x7 << 12)
> +#define SENINF4_CSI2_PROGSEQ_0_PROGSEQ_S4_SHIFT 16
> +#define SENINF4_CSI2_PROGSEQ_0_PROGSEQ_S4_MASK (0x7 << 16)
> +#define SENINF4_CSI2_PROGSEQ_0_PROGSEQ_S5_SHIFT 20
> +#define SENINF4_CSI2_PROGSEQ_0_PROGSEQ_S5_MASK (0x7 << 20)
> +#define SENINF4_CSI2_PROGSEQ_0_PROGSEQ_S6_SHIFT 24
> +#define SENINF4_CSI2_PROGSEQ_0_PROGSEQ_S6_MASK (0x7 << 24)
> +#define SENINF4_CSI2_PROGSEQ_0_PROGSEQ_S7_SHIFT 28
> +#define SENINF4_CSI2_PROGSEQ_0_PROGSEQ_S7_MASK (0x7 << 28)
> +#define SENINF4_CSI2_PROGSEQ_1                                 0x3B04
> +#define SENINF4_CSI2_PROGSEQ_1_PROGSEQ_S8_SHIFT 0
> +#define SENINF4_CSI2_PROGSEQ_1_PROGSEQ_S8_MASK (0x7 << 0)
> +#define SENINF4_CSI2_PROGSEQ_1_PROGSEQ_S9_SHIFT 4
> +#define SENINF4_CSI2_PROGSEQ_1_PROGSEQ_S9_MASK (0x7 << 4)
> +#define SENINF4_CSI2_PROGSEQ_1_PROGSEQ_S10_SHIFT 8
> +#define SENINF4_CSI2_PROGSEQ_1_PROGSEQ_S10_MASK (0x7 << 8)
> +#define SENINF4_CSI2_PROGSEQ_1_PROGSEQ_S11_SHIFT 12
> +#define SENINF4_CSI2_PROGSEQ_1_PROGSEQ_S11_MASK (0x7 << 12)
> +#define SENINF4_CSI2_PROGSEQ_1_PROGSEQ_S12_SHIFT 16
> +#define SENINF4_CSI2_PROGSEQ_1_PROGSEQ_S12_MASK (0x7 << 16)
> +#define SENINF4_CSI2_PROGSEQ_1_PROGSEQ_S13_SHIFT 20
> +#define SENINF4_CSI2_PROGSEQ_1_PROGSEQ_S13_MASK (0x7 << 20)
> +#define SENINF4_CSI2_INT_EN_EXT                                0x3B10
> +#define SENINF4_CSI2_INT_EN_EXT_DPHY0_RESYNC_FIFO_OVERFLOW_SHIFT 1
> +#define SENINF4_CSI2_INT_EN_EXT_DPHY0_RESYNC_FIFO_OVERFLOW_MASK (0x1 << 1)
> +#define SENINF4_CSI2_INT_EN_EXT_DPHY1_RESYNC_FIFO_OVERFLOW_SHIFT 2
> +#define SENINF4_CSI2_INT_EN_EXT_DPHY1_RESYNC_FIFO_OVERFLOW_MASK (0x1 << 2)
> +#define SENINF4_CSI2_INT_EN_EXT_DPHY2_RESYNC_FIFO_OVERFLOW_SHIFT 3
> +#define SENINF4_CSI2_INT_EN_EXT_DPHY2_RESYNC_FIFO_OVERFLOW_MASK (0x1 << 3)
> +#define SENINF4_CSI2_INT_EN_EXT_DPHY3_RESYNC_FIFO_OVERFLOW_SHIFT 4
> +#define SENINF4_CSI2_INT_EN_EXT_DPHY3_RESYNC_FIFO_OVERFLOW_MASK (0x1 << 4)
> +#define SENINF4_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO0_SHIFT 8
> +#define SENINF4_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO0_MASK (0x1 << 8)
> +#define SENINF4_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO1_SHIFT 9
> +#define SENINF4_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO1_MASK (0x1 << 9)
> +#define SENINF4_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO2_SHIFT 10
> +#define SENINF4_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO2_MASK (0x1 << 10)
> +#define SENINF4_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO3_SHIFT 11
> +#define SENINF4_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO3_MASK (0x1 << 11)
> +#define SENINF4_CSI2_INT_EN_EXT_INT_WCLR_EN_SHIFT 31
> +#define SENINF4_CSI2_INT_EN_EXT_INT_WCLR_EN_MASK (0x1 << 31)
> +#define SENINF4_CSI2_INT_STATUS_EXT                            0x3B14
> +#define SENINF4_CSI2_INT_STATUS_EXT_DPHY0_RESYNC_FIFO_OVERFLOW_STA_SHIFT 1
> +#define SENINF4_CSI2_INT_STATUS_EXT_DPHY0_RESYNC_FIFO_OVERFLOW_STA_MASK \
> +(0x1 << 1)
> +#define SENINF4_CSI2_INT_STATUS_EXT_DPHY1_RESYNC_FIFO_OVERFLOW_STA_SHIFT 2
> +#define SENINF4_CSI2_INT_STATUS_EXT_DPHY1_RESYNC_FIFO_OVERFLOW_STA_MASK \
> +(0x1 << 2)
> +#define SENINF4_CSI2_INT_STATUS_EXT_DPHY2_RESYNC_FIFO_OVERFLOW_STA_SHIFT 3
> +#define SENINF4_CSI2_INT_STATUS_EXT_DPHY2_RESYNC_FIFO_OVERFLOW_STA_MASK \
> +(0x1 << 3)
> +#define SENINF4_CSI2_INT_STATUS_EXT_DPHY3_RESYNC_FIFO_OVERFLOW_STA_SHIFT 4
> +#define SENINF4_CSI2_INT_STATUS_EXT_DPHY3_RESYNC_FIFO_OVERFLOW_STA_MASK \
> +(0x1 << 4)
> +#define SENINF4_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO0_SHIFT 8
> +#define SENINF4_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO0_MASK (0x1 << 8)
> +#define SENINF4_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO1_SHIFT 9
> +#define SENINF4_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO1_MASK (0x1 << 9)
> +#define SENINF4_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO2_SHIFT 10
> +#define SENINF4_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO2_MASK (0x1 << 10)
> +#define SENINF4_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO3_SHIFT 11
> +#define SENINF4_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO3_MASK (0x1 << 11)
> +#define SENINF4_CSI2_CPHY_FIX_POINT_RST                        0x3B18
> +#define SENINF4_CSI2_CPHY_FIX_POINT_RST_CPHY_FIX_POINT_RST_SHIFT 0
> +#define SENINF4_CSI2_CPHY_FIX_POINT_RST_CPHY_FIX_POINT_RST_MASK (0x1 << 0)
> +#define SENINF4_CSI2_CPHY_FIX_POINT_RST_CPHY_FIX_POINT_RST_MODE_SHIFT 1
> +#define SENINF4_CSI2_CPHY_FIX_POINT_RST_CPHY_FIX_POINT_RST_MODE_MASK (0x1 << 1)
> +#define SENINF4_CSI2_RLR3_CON0                                 0x3B1C
> +#define SENINF4_CSI2_RLR3_CON0_RLR3_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF4_CSI2_RLR3_CON0_RLR3_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF4_CSI2_RLR3_CON0_RLR3_PRBS_SEED_0_SHIFT 8
> +#define SENINF4_CSI2_RLR3_CON0_RLR3_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF4_CSI2_RLR3_CON0_RLR3_PRBS_SEED_1_SHIFT 16
> +#define SENINF4_CSI2_RLR3_CON0_RLR3_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF4_CSI2_RLR3_CON0_RLR3_PRBS_SEED_2_SHIFT 24
> +#define SENINF4_CSI2_RLR3_CON0_RLR3_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF4_CSI2_DPHY_SYNC                                 0x3B20
> +#define SENINF4_CSI2_DPHY_SYNC_SYNC_SEQ_MASK_0_SHIFT 0
> +#define SENINF4_CSI2_DPHY_SYNC_SYNC_SEQ_MASK_0_MASK (0xffff << 0)
> +#define SENINF4_CSI2_DPHY_SYNC_SYNC_SEQ_PAT_0_SHIFT 16
> +#define SENINF4_CSI2_DPHY_SYNC_SYNC_SEQ_PAT_0_MASK (0xffff << 16)
> +#define SENINF4_CSI2_DESKEW_SYNC                               0x3B24
> +#define SENINF4_CSI2_DESKEW_SYNC_SYNC_SEQ_MASK_1_SHIFT 0
> +#define SENINF4_CSI2_DESKEW_SYNC_SYNC_SEQ_MASK_1_MASK (0xffff << 0)
> +#define SENINF4_CSI2_DESKEW_SYNC_SYNC_SEQ_PAT_1_SHIFT 16
> +#define SENINF4_CSI2_DESKEW_SYNC_SYNC_SEQ_PAT_1_MASK (0xffff << 16)
> +#define SENINF4_CSI2_DETECT_DBG2                               0x3B28
> +#define SENINF4_CSI2_DETECT_DBG2_DETECT_SYNC_LANE3_ST_SHIFT 0
> +#define SENINF4_CSI2_DETECT_DBG2_DETECT_SYNC_LANE3_ST_MASK (0x1 << 0)
> +#define SENINF4_CSI2_DETECT_DBG2_DETECT_ESCAPE_LANE3_ST_SHIFT 1
> +#define SENINF4_CSI2_DETECT_DBG2_DETECT_ESCAPE_LANE3_ST_MASK (0x1 << 1)
> +#define SENINF4_CSI2_DETECT_DBG2_DETECT_POST_LANE3_ST_SHIFT 2
> +#define SENINF4_CSI2_DETECT_DBG2_DETECT_POST_LANE3_ST_MASK (0x1 << 2)
> +#define SENINF4_CSI2_DETECT_DBG2_POSITION_SYNC_LANE3_ST_SHIFT 3
> +#define SENINF4_CSI2_DETECT_DBG2_POSITION_SYNC_LANE3_ST_MASK (0xf << 3)
> +#define SENINF4_CSI2_DETECT_DBG2_POSITION_ESCAPE_LANE3_ST_SHIFT 7
> +#define SENINF4_CSI2_DETECT_DBG2_POSITION_ESCAPE_LANE3_ST_MASK (0xf << 7)
> +#define SENINF4_FIX_ADDR_CPHY3_DBG0                            0x3B30
> +#define SENINF4_FIX_ADDR_CPHY3_DBG0_WORD_COUNT_CPHY3_DBG0_SHIFT 0
> +#define SENINF4_FIX_ADDR_CPHY3_DBG0_WORD_COUNT_CPHY3_DBG0_MASK \
> +(0xffffffff << 0)
> +#define SENINF4_FIX_ADDR_CPHY3_DBG1                            0x3B34
> +#define SENINF4_FIX_ADDR_CPHY3_DBG1_WORD_COUNT_CPHY3_DBG1_SHIFT 0
> +#define SENINF4_FIX_ADDR_CPHY3_DBG1_WORD_COUNT_CPHY3_DBG1_MASK (0xffff << 0)
> +#define SENINF4_FIX_ADDR_CPHY3_DBG1_ERROR_RECORD_CPHY3_DBG0_SHIFT 16
> +#define SENINF4_FIX_ADDR_CPHY3_DBG1_ERROR_RECORD_CPHY3_DBG0_MASK (0xffff << 16)
> +#define SENINF4_FIX_ADDR_CPHY3_DBG2                            0x3B38
> +#define SENINF4_FIX_ADDR_CPHY3_DBG2_ERROR_RECORD_CPHY3_DBG1_SHIFT 0
> +#define SENINF4_FIX_ADDR_CPHY3_DBG2_ERROR_RECORD_CPHY3_DBG1_MASK \
> +(0xffffffff << 0)
> +#define SENINF4_CSI2_DI_EXT_2                                  0x3B3C
> +#define SENINF4_CSI2_DI_EXT_2_VC6_SHIFT        0
> +#define SENINF4_CSI2_DI_EXT_2_VC6_MASK         (0x3 << 0)
> +#define SENINF4_CSI2_DI_EXT_2_DT6_SHIFT        2
> +#define SENINF4_CSI2_DI_EXT_2_DT6_MASK         (0x3f << 2)
> +#define SENINF4_CSI2_DI_EXT_2_VC7_SHIFT        8
> +#define SENINF4_CSI2_DI_EXT_2_VC7_MASK         (0x3 << 8)
> +#define SENINF4_CSI2_DI_EXT_2_DT7_SHIFT        10
> +#define SENINF4_CSI2_DI_EXT_2_DT7_MASK         (0x3f << 10)
> +#define SENINF4_CSI2_DI_CTRL_EXT_2                             0x3B40
> +#define SENINF4_CSI2_DI_CTRL_EXT_2_VC6_INTERLEAVING_SHIFT 0
> +#define SENINF4_CSI2_DI_CTRL_EXT_2_VC6_INTERLEAVING_MASK (0x1 << 0)
> +#define SENINF4_CSI2_DI_CTRL_EXT_2_DT6_INTERLEAVING_SHIFT 1
> +#define SENINF4_CSI2_DI_CTRL_EXT_2_DT6_INTERLEAVING_MASK (0x3 << 1)
> +#define SENINF4_CSI2_DI_CTRL_EXT_2_VC7_INTERLEAVING_SHIFT 8
> +#define SENINF4_CSI2_DI_CTRL_EXT_2_VC7_INTERLEAVING_MASK (0x1 << 8)
> +#define SENINF4_CSI2_DI_CTRL_EXT_2_DT7_INTERLEAVING_SHIFT 9
> +#define SENINF4_CSI2_DI_CTRL_EXT_2_DT7_INTERLEAVING_MASK (0x3 << 9)
> +#define SENINF4_WIRE_STATE_DECODE_CPHY3_DBG0                   0x3B44
> +#define SENINF4_WIRE_STATE_DECODE_CPHY3_DBG0_SYMBOL_STREAM0_CPHY3_SHIFT 0
> +#define SENINF4_WIRE_STATE_DECODE_CPHY3_DBG0_SYMBOL_STREAM0_CPHY3_MASK \
> +(0xffffffff << 0)
> +#define SENINF4_WIRE_STATE_DECODE_CPHY3_DBG1                   0x3B48
> +#define SENINF4_WIRE_STATE_DECODE_CPHY3_DBG1_SYMBOL_STREAM1_CPHY3_SHIFT 0
> +#define SENINF4_WIRE_STATE_DECODE_CPHY3_DBG1_SYMBOL_STREAM1_CPHY3_MASK \
> +(0x3ff << 0)
> +#define SENINF4_WIRE_STATE_DECODE_CPHY3_DBG1_SYMBOL_STREAM_VALID_CPHY3_SHIFT 10
> +#define SENINF4_WIRE_STATE_DECODE_CPHY3_DBG1_SYMBOL_STREAM_VALID_CPHY3_MASK \
> +(0x1 << 10)
> +#define SENINF4_MUX_CTRL                                       0x3D00
> +#define SENINF4_MUX_CTRL_SENINF_MUX_SW_RST_SHIFT 0
> +#define SENINF4_MUX_CTRL_SENINF_MUX_SW_RST_MASK (0x1 << 0)
> +#define SENINF4_MUX_CTRL_SENINF_IRQ_SW_RST_SHIFT 1
> +#define SENINF4_MUX_CTRL_SENINF_IRQ_SW_RST_MASK (0x1 << 1)
> +#define SENINF4_MUX_CTRL_SENINF_MUX_RDY_MODE_SHIFT 4
> +#define SENINF4_MUX_CTRL_SENINF_MUX_RDY_MODE_MASK (0x1 << 4)
> +#define SENINF4_MUX_CTRL_SENINF_MUX_RDY_VALUE_SHIFT 5
> +#define SENINF4_MUX_CTRL_SENINF_MUX_RDY_VALUE_MASK (0x1 << 5)
> +#define SENINF4_MUX_CTRL_SENINF_HSYNC_MASK_SHIFT 7
> +#define SENINF4_MUX_CTRL_SENINF_HSYNC_MASK_MASK (0x1 << 7)
> +#define SENINF4_MUX_CTRL_SENINF_PIX_SEL_SHIFT  8
> +#define SENINF4_MUX_CTRL_SENINF_PIX_SEL_MASK   (0x1 << 8)
> +#define SENINF4_MUX_CTRL_SENINF_VSYNC_POL_SHIFT 9
> +#define SENINF4_MUX_CTRL_SENINF_VSYNC_POL_MASK (0x1 << 9)
> +#define SENINF4_MUX_CTRL_SENINF_HSYNC_POL_SHIFT 10
> +#define SENINF4_MUX_CTRL_SENINF_HSYNC_POL_MASK (0x1 << 10)
> +#define SENINF4_MUX_CTRL_OVERRUN_RST_EN_SHIFT  11
> +#define SENINF4_MUX_CTRL_OVERRUN_RST_EN_MASK   (0x1 << 11)
> +#define SENINF4_MUX_CTRL_SENINF_SRC_SEL_SHIFT  12
> +#define SENINF4_MUX_CTRL_SENINF_SRC_SEL_MASK   (0xf << 12)
> +#define SENINF4_MUX_CTRL_FIFO_PUSH_EN_SHIFT    16
> +#define SENINF4_MUX_CTRL_FIFO_PUSH_EN_MASK     (0x3f << 16)
> +#define SENINF4_MUX_CTRL_FIFO_FLUSH_EN_SHIFT   22
> +#define SENINF4_MUX_CTRL_FIFO_FLUSH_EN_MASK    (0x3f << 22)
> +#define SENINF4_MUX_CTRL_FIFO_FULL_WR_EN_SHIFT 28
> +#define SENINF4_MUX_CTRL_FIFO_FULL_WR_EN_MASK  (0x3 << 28)
> +#define SENINF4_MUX_CTRL_CROP_EN_SHIFT         30
> +#define SENINF4_MUX_CTRL_CROP_EN_MASK          (0x1 << 30)
> +#define SENINF4_MUX_CTRL_SENINF_MUX_EN_SHIFT   31
> +#define SENINF4_MUX_CTRL_SENINF_MUX_EN_MASK    (0x1 << 31)
> +#define SENINF4_MUX_INTEN                                      0x3D04
> +#define SENINF4_MUX_INTEN_SENINF_OVERRUN_IRQ_EN_SHIFT 0
> +#define SENINF4_MUX_INTEN_SENINF_OVERRUN_IRQ_EN_MASK (0x1 << 0)
> +#define SENINF4_MUX_INTEN_SENINF_CRCERR_IRQ_EN_SHIFT 1
> +#define SENINF4_MUX_INTEN_SENINF_CRCERR_IRQ_EN_MASK (0x1 << 1)
> +#define SENINF4_MUX_INTEN_SENINF_FSMERR_IRQ_EN_SHIFT 2
> +#define SENINF4_MUX_INTEN_SENINF_FSMERR_IRQ_EN_MASK (0x1 << 2)
> +#define SENINF4_MUX_INTEN_SENINF_VSIZEERR_IRQ_EN_SHIFT 3
> +#define SENINF4_MUX_INTEN_SENINF_VSIZEERR_IRQ_EN_MASK (0x1 << 3)
> +#define SENINF4_MUX_INTEN_SENINF_HSIZEERR_IRQ_EN_SHIFT 4
> +#define SENINF4_MUX_INTEN_SENINF_HSIZEERR_IRQ_EN_MASK (0x1 << 4)
> +#define SENINF4_MUX_INTEN_SENINF_SENSOR_VSIZEERR_IRQ_EN_SHIFT 5
> +#define SENINF4_MUX_INTEN_SENINF_SENSOR_VSIZEERR_IRQ_EN_MASK (0x1 << 5)
> +#define SENINF4_MUX_INTEN_SENINF_SENSOR_HSIZEERR_IRQ_EN_SHIFT 6
> +#define SENINF4_MUX_INTEN_SENINF_SENSOR_HSIZEERR_IRQ_EN_MASK (0x1 << 6)
> +#define SENINF4_MUX_INTEN_SENINF_IRQ_CLR_SEL_SHIFT 31
> +#define SENINF4_MUX_INTEN_SENINF_IRQ_CLR_SEL_MASK (0x1 << 31)
> +#define SENINF4_MUX_INTSTA                                     0x3D08
> +#define SENINF4_MUX_INTSTA_SENINF_OVERRUN_IRQ_STA_SHIFT 0
> +#define SENINF4_MUX_INTSTA_SENINF_OVERRUN_IRQ_STA_MASK (0x1 << 0)
> +#define SENINF4_MUX_INTSTA_SENINF_CRCERR_IRQ_STA_SHIFT 1
> +#define SENINF4_MUX_INTSTA_SENINF_CRCERR_IRQ_STA_MASK (0x1 << 1)
> +#define SENINF4_MUX_INTSTA_SENINF_FSMERR_IRQ_STA_SHIFT 2
> +#define SENINF4_MUX_INTSTA_SENINF_FSMERR_IRQ_STA_MASK (0x1 << 2)
> +#define SENINF4_MUX_INTSTA_SENINF_VSIZEERR_IRQ_STA_SHIFT 3
> +#define SENINF4_MUX_INTSTA_SENINF_VSIZEERR_IRQ_STA_MASK (0x1 << 3)
> +#define SENINF4_MUX_INTSTA_SENINF_HSIZEERR_IRQ_STA_SHIFT 4
> +#define SENINF4_MUX_INTSTA_SENINF_HSIZEERR_IRQ_STA_MASK (0x1 << 4)
> +#define SENINF4_MUX_INTSTA_SENINF_SENSOR_VSIZEERR_IRQ_STA_SHIFT 5
> +#define SENINF4_MUX_INTSTA_SENINF_SENSOR_VSIZEERR_IRQ_STA_MASK (0x1 << 5)
> +#define SENINF4_MUX_INTSTA_SENINF_SENSOR_HSIZEERR_IRQ_STA_SHIFT 6
> +#define SENINF4_MUX_INTSTA_SENINF_SENSOR_HSIZEERR_IRQ_STA_MASK (0x1 << 6)
> +#define SENINF4_MUX_SIZE                                       0x3D0C
> +#define SENINF4_MUX_SIZE_SENINF_VSIZE_SHIFT    0
> +#define SENINF4_MUX_SIZE_SENINF_VSIZE_MASK     (0xffff << 0)
> +#define SENINF4_MUX_SIZE_SENINF_HSIZE_SHIFT    16
> +#define SENINF4_MUX_SIZE_SENINF_HSIZE_MASK     (0xffff << 16)
> +#define SENINF4_MUX_DEBUG_1                                    0x3D10
> +#define SENINF4_MUX_DEBUG_1_DEBUG_INFO_SHIFT   0
> +#define SENINF4_MUX_DEBUG_1_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF4_MUX_DEBUG_2                                    0x3D14
> +#define SENINF4_MUX_DEBUG_2_DEBUG_INFO_SHIFT   0
> +#define SENINF4_MUX_DEBUG_2_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF4_MUX_DEBUG_3                                    0x3D18
> +#define SENINF4_MUX_DEBUG_3_DEBUG_INFO_SHIFT   0
> +#define SENINF4_MUX_DEBUG_3_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF4_MUX_DEBUG_4                                    0x3D1C
> +#define SENINF4_MUX_DEBUG_4_DEBUG_INFO_SHIFT   0
> +#define SENINF4_MUX_DEBUG_4_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF4_MUX_DEBUG_5                                    0x3D20
> +#define SENINF4_MUX_DEBUG_5_DEBUG_INFO_SHIFT   0
> +#define SENINF4_MUX_DEBUG_5_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF4_MUX_DEBUG_6                                    0x3D24
> +#define SENINF4_MUX_DEBUG_6_DEBUG_INFO_SHIFT   0
> +#define SENINF4_MUX_DEBUG_6_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF4_MUX_DEBUG_7                                    0x3D28
> +#define SENINF4_MUX_DEBUG_7_DEBUG_INFO_SHIFT   0
> +#define SENINF4_MUX_DEBUG_7_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF4_MUX_SPARE                                      0x3D2C
> +#define SENINF4_MUX_SPARE_SENINF_CRC_SEL_SHIFT 9
> +#define SENINF4_MUX_SPARE_SENINF_CRC_SEL_MASK  (0x3 << 9)
> +#define SENINF4_MUX_SPARE_SENINF_VCNT_SEL_SHIFT 11
> +#define SENINF4_MUX_SPARE_SENINF_VCNT_SEL_MASK (0x3 << 11)
> +#define SENINF4_MUX_SPARE_SENINF_FIFO_FULL_SEL_SHIFT 13
> +#define SENINF4_MUX_SPARE_SENINF_FIFO_FULL_SEL_MASK (0x1 << 13)
> +#define SENINF4_MUX_SPARE_SENINF_SPARE_SHIFT   14
> +#define SENINF4_MUX_SPARE_SENINF_SPARE_MASK    (0x3f << 14)
> +#define SENINF4_MUX_DATA                                       0x3D30
> +#define SENINF4_MUX_DATA_SENINF_DATA0_SHIFT    0
> +#define SENINF4_MUX_DATA_SENINF_DATA0_MASK     (0xffff << 0)
> +#define SENINF4_MUX_DATA_SENINF_DATA1_SHIFT    16
> +#define SENINF4_MUX_DATA_SENINF_DATA1_MASK     (0xffff << 16)
> +#define SENINF4_MUX_DATA_CNT                                   0x3D34
> +#define SENINF4_MUX_DATA_CNT_SENINF_DATA_CNT_SHIFT 0
> +#define SENINF4_MUX_DATA_CNT_SENINF_DATA_CNT_MASK (0xffffffff << 0)
> +#define SENINF4_MUX_CROP                                       0x3D38
> +#define SENINF4_MUX_CROP_SENINF_CROP_X1_SHIFT  0
> +#define SENINF4_MUX_CROP_SENINF_CROP_X1_MASK   (0xffff << 0)
> +#define SENINF4_MUX_CROP_SENINF_CROP_X2_SHIFT  16
> +#define SENINF4_MUX_CROP_SENINF_CROP_X2_MASK   (0xffff << 16)
> +#define SENINF4_MUX_CTRL_EXT                                   0x3D3C
> +#define SENINF4_MUX_CTRL_EXT_SENINF_SRC_SEL_EXT_SHIFT 0
> +#define SENINF4_MUX_CTRL_EXT_SENINF_SRC_SEL_EXT_MASK (0x3 << 0)
> +#define SENINF4_MUX_CTRL_EXT_SENINF_PIX_SEL_EXT_SHIFT 4
> +#define SENINF4_MUX_CTRL_EXT_SENINF_PIX_SEL_EXT_MASK (0x1 << 4)
> +#define SENINF5_CTRL                                           0x4200
> +#define SENINF5_CTRL_SENINF_EN_SHIFT           0
> +#define SENINF5_CTRL_SENINF_EN_MASK            (0x1 << 0)
> +#define SENINF5_CTRL_NCSI2_SW_RST_SHIFT        1
> +#define SENINF5_CTRL_NCSI2_SW_RST_MASK         (0x1 << 1)
> +#define SENINF5_CTRL_OCSI2_SW_RST_SHIFT        2
> +#define SENINF5_CTRL_OCSI2_SW_RST_MASK         (0x1 << 2)
> +#define SENINF5_CTRL_CCIR_SW_RST_SHIFT         3
> +#define SENINF5_CTRL_CCIR_SW_RST_MASK          (0x1 << 3)
> +#define SENINF5_CTRL_CKGEN_SW_RST_SHIFT        4
> +#define SENINF5_CTRL_CKGEN_SW_RST_MASK         (0x1 << 4)
> +#define SENINF5_CTRL_TEST_MODEL_SW_RST_SHIFT   5
> +#define SENINF5_CTRL_TEST_MODEL_SW_RST_MASK    (0x1 << 5)
> +#define SENINF5_CTRL_SCAM_SW_RST_SHIFT         6
> +#define SENINF5_CTRL_SCAM_SW_RST_MASK          (0x1 << 6)
> +#define SENINF5_CTRL_CSI2_SW_RST_SHIFT         7
> +#define SENINF5_CTRL_CSI2_SW_RST_MASK          (0x1 << 7)
> +#define SENINF5_CTRL_CSI3_SW_RST_SHIFT         8
> +#define SENINF5_CTRL_CSI3_SW_RST_MASK          (0x1 << 8)
> +#define SENINF5_CTRL_SENINF_SRC_SEL_SHIFT      12
> +#define SENINF5_CTRL_SENINF_SRC_SEL_MASK       (0xf << 12)
> +#define SENINF5_CTRL_SENINF_DEBUG_SEL_SHIFT    20
> +#define SENINF5_CTRL_SENINF_DEBUG_SEL_MASK     (0xf << 20)
> +#define SENINF5_CTRL_PAD2CAM_DATA_SEL_SHIFT    28
> +#define SENINF5_CTRL_PAD2CAM_DATA_SEL_MASK     (0x7 << 28)
> +#define SENINF5_CTRL_EXT                                       0x4204
> +#define SENINF5_CTRL_EXT_SENINF_OCSI2_IP_EN_SHIFT 0
> +#define SENINF5_CTRL_EXT_SENINF_OCSI2_IP_EN_MASK (0x1 << 0)
> +#define SENINF5_CTRL_EXT_SENINF_TESTMDL_IP_EN_SHIFT 1
> +#define SENINF5_CTRL_EXT_SENINF_TESTMDL_IP_EN_MASK (0x1 << 1)
> +#define SENINF5_CTRL_EXT_SENINF_SCAM_IP_EN_SHIFT 4
> +#define SENINF5_CTRL_EXT_SENINF_SCAM_IP_EN_MASK (0x1 << 4)
> +#define SENINF5_CTRL_EXT_SENINF_NCSI2_IP_EN_SHIFT 5
> +#define SENINF5_CTRL_EXT_SENINF_NCSI2_IP_EN_MASK (0x1 << 5)
> +#define SENINF5_CTRL_EXT_SENINF_CSI2_IP_EN_SHIFT 6
> +#define SENINF5_CTRL_EXT_SENINF_CSI2_IP_EN_MASK (0x1 << 6)
> +#define SENINF5_CTRL_EXT_SENINF_CSI3_IP_EN_SHIFT 7
> +#define SENINF5_CTRL_EXT_SENINF_CSI3_IP_EN_MASK (0x1 << 7)
> +#define SENINF5_CTRL_EXT_SENINF_SRC_SEL_EXT_SHIFT 16
> +#define SENINF5_CTRL_EXT_SENINF_SRC_SEL_EXT_MASK (0x3 << 16)
> +#define SENINF5_ASYNC_CTRL                                     0x4208
> +#define SENINF5_ASYNC_CTRL_SENINF_ASYNC_FIFO_RST_SHIFT 0
> +#define SENINF5_ASYNC_CTRL_SENINF_ASYNC_FIFO_RST_MASK (0x1 << 0)
> +#define SENINF5_ASYNC_CTRL_SENINF_HSYNC_MASK_SHIFT 1
> +#define SENINF5_ASYNC_CTRL_SENINF_HSYNC_MASK_MASK (0x1 << 1)
> +#define SENINF5_ASYNC_CTRL_SENINF_VSYNC_POL_SHIFT 2
> +#define SENINF5_ASYNC_CTRL_SENINF_VSYNC_POL_MASK (0x1 << 2)
> +#define SENINF5_ASYNC_CTRL_SENINF_HSYNC_POL_SHIFT 3
> +#define SENINF5_ASYNC_CTRL_SENINF_HSYNC_POL_MASK (0x1 << 3)
> +#define SENINF5_ASYNC_CTRL_FIFO_PUSH_EN_SHIFT  16
> +#define SENINF5_ASYNC_CTRL_FIFO_PUSH_EN_MASK   (0x3f << 16)
> +#define SENINF5_ASYNC_CTRL_FIFO_FLUSH_EN_SHIFT 24
> +#define SENINF5_ASYNC_CTRL_FIFO_FLUSH_EN_MASK  (0x3f << 24)
> +#define SENINF_TG5_PH_CNT                                      0x4600
> +#define SENINF_TG5_PH_CNT_TGCLK_SEL_SHIFT      0
> +#define SENINF_TG5_PH_CNT_TGCLK_SEL_MASK       (0x3 << 0)
> +#define SENINF_TG5_PH_CNT_CLKFL_POL_SHIFT      2
> +#define SENINF_TG5_PH_CNT_CLKFL_POL_MASK       (0x1 << 2)
> +#define SENINF_TG5_PH_CNT_EXT_RST_SHIFT        4
> +#define SENINF_TG5_PH_CNT_EXT_RST_MASK         (0x1 << 4)
> +#define SENINF_TG5_PH_CNT_EXT_PWRDN_SHIFT      5
> +#define SENINF_TG5_PH_CNT_EXT_PWRDN_MASK       (0x1 << 5)
> +#define SENINF_TG5_PH_CNT_PAD_PCLK_INV_SHIFT   6
> +#define SENINF_TG5_PH_CNT_PAD_PCLK_INV_MASK    (0x1 << 6)
> +#define SENINF_TG5_PH_CNT_CAM_PCLK_INV_SHIFT   7
> +#define SENINF_TG5_PH_CNT_CAM_PCLK_INV_MASK    (0x1 << 7)
> +#define SENINF_TG5_PH_CNT_CLKPOL_SHIFT         28
> +#define SENINF_TG5_PH_CNT_CLKPOL_MASK          (0x1 << 28)
> +#define SENINF_TG5_PH_CNT_ADCLK_EN_SHIFT       29
> +#define SENINF_TG5_PH_CNT_ADCLK_EN_MASK        (0x1 << 29)
> +#define SENINF_TG5_PH_CNT_PCEN_SHIFT           31
> +#define SENINF_TG5_PH_CNT_PCEN_MASK            (0x1 << 31)
> +#define SENINF_TG5_SEN_CK                                      0x4604
> +#define SENINF_TG5_SEN_CK_CLKFL_SHIFT          0
> +#define SENINF_TG5_SEN_CK_CLKFL_MASK           (0x3f << 0)
> +#define SENINF_TG5_SEN_CK_CLKRS_SHIFT          8
> +#define SENINF_TG5_SEN_CK_CLKRS_MASK           (0x3f << 8)
> +#define SENINF_TG5_SEN_CK_CLKCNT_SHIFT         16
> +#define SENINF_TG5_SEN_CK_CLKCNT_MASK          (0x3f << 16)
> +#define SENINF_TG5_TM_CTL                                      0x4608
> +#define SENINF_TG5_TM_CTL_TM_EN_SHIFT          0
> +#define SENINF_TG5_TM_CTL_TM_EN_MASK           (0x1 << 0)
> +#define SENINF_TG5_TM_CTL_TM_RST_SHIFT         1
> +#define SENINF_TG5_TM_CTL_TM_RST_MASK          (0x1 << 1)
> +#define SENINF_TG5_TM_CTL_TM_FMT_SHIFT         2
> +#define SENINF_TG5_TM_CTL_TM_FMT_MASK          (0x1 << 2)
> +#define SENINF_TG5_TM_CTL_TM_PAT_SHIFT         4
> +#define SENINF_TG5_TM_CTL_TM_PAT_MASK          (0xf << 4)
> +#define SENINF_TG5_TM_CTL_TM_VSYNC_SHIFT       8
> +#define SENINF_TG5_TM_CTL_TM_VSYNC_MASK        (0xff << 8)
> +#define SENINF_TG5_TM_CTL_TM_DUMMYPXL_SHIFT    16
> +#define SENINF_TG5_TM_CTL_TM_DUMMYPXL_MASK     (0xff << 16)
> +#define SENINF_TG5_TM_SIZE                                     0x460C
> +#define SENINF_TG5_TM_SIZE_TM_PXL_SHIFT        0
> +#define SENINF_TG5_TM_SIZE_TM_PXL_MASK         (0x1fff << 0)
> +#define SENINF_TG5_TM_SIZE_TM_LINE_SHIFT       16
> +#define SENINF_TG5_TM_SIZE_TM_LINE_MASK        (0x3fff << 16)
> +#define SENINF_TG5_TM_CLK                                      0x4610
> +#define SENINF_TG5_TM_CLK_TM_CLK_CNT_SHIFT     0
> +#define SENINF_TG5_TM_CLK_TM_CLK_CNT_MASK      (0xf << 0)
> +#define SENINF_TG5_TM_CLK_TM_CLRBAR_OFT_SHIFT  16
> +#define SENINF_TG5_TM_CLK_TM_CLRBAR_OFT_MASK   (0x3ff << 16)
> +#define SENINF_TG5_TM_CLK_TM_CLRBAR_IDX_SHIFT  28
> +#define SENINF_TG5_TM_CLK_TM_CLRBAR_IDX_MASK   (0x7 << 28)
> +#define SENINF_TG5_TM_STP                                      0x4614
> +#define SENINF_TG5_TM_STP_TG1_TM_STP_SHIFT     0
> +#define SENINF_TG5_TM_STP_TG1_TM_STP_MASK      (0xffffffff << 0)
> +#define MIPI_RX_CON24_CSI4                                     0x4824
> +#define MIPI_RX_CON24_CSI4_CSI0_BIST_NUM_SHIFT 0
> +#define MIPI_RX_CON24_CSI4_CSI0_BIST_NUM_MASK  (0x3 << 0)
> +#define MIPI_RX_CON24_CSI4_CSI0_BIST_EN_SHIFT  2
> +#define MIPI_RX_CON24_CSI4_CSI0_BIST_EN_MASK   (0x1 << 2)
> +#define MIPI_RX_CON24_CSI4_CSI0_BIST_FIX_PAT_SHIFT 5
> +#define MIPI_RX_CON24_CSI4_CSI0_BIST_FIX_PAT_MASK (0x1 << 5)
> +#define MIPI_RX_CON24_CSI4_CSI0_BIST_CLK_SEL_SHIFT 6
> +#define MIPI_RX_CON24_CSI4_CSI0_BIST_CLK_SEL_MASK (0x1 << 6)
> +#define MIPI_RX_CON24_CSI4_CSI0_BIST_CLK4X_SEL_SHIFT 7
> +#define MIPI_RX_CON24_CSI4_CSI0_BIST_CLK4X_SEL_MASK (0x1 << 7)
> +#define MIPI_RX_CON24_CSI4_CSI0_BIST_TERM_DELAY_SHIFT 8
> +#define MIPI_RX_CON24_CSI4_CSI0_BIST_TERM_DELAY_MASK (0xff << 8)
> +#define MIPI_RX_CON24_CSI4_CSI0_BIST_SETTLE_DELAY_SHIFT 16
> +#define MIPI_RX_CON24_CSI4_CSI0_BIST_SETTLE_DELAY_MASK (0xff << 16)
> +#define MIPI_RX_CON24_CSI4_CSI0_BIST_LN0_MUX_SHIFT 24
> +#define MIPI_RX_CON24_CSI4_CSI0_BIST_LN0_MUX_MASK (0x3 << 24)
> +#define MIPI_RX_CON24_CSI4_CSI0_BIST_LN1_MUX_SHIFT 26
> +#define MIPI_RX_CON24_CSI4_CSI0_BIST_LN1_MUX_MASK (0x3 << 26)
> +#define MIPI_RX_CON24_CSI4_CSI0_BIST_LN2_MUX_SHIFT 28
> +#define MIPI_RX_CON24_CSI4_CSI0_BIST_LN2_MUX_MASK (0x3 << 28)
> +#define MIPI_RX_CON24_CSI4_CSI0_BIST_LN3_MUX_SHIFT 30
> +#define MIPI_RX_CON24_CSI4_CSI0_BIST_LN3_MUX_MASK (0x3 << 30)
> +#define MIPI_RX_CON28_CSI4                                     0x4828
> +#define MIPI_RX_CON28_CSI4_CSI0_BIST_START_SHIFT 0
> +#define MIPI_RX_CON28_CSI4_CSI0_BIST_START_MASK (0x1 << 0)
> +#define MIPI_RX_CON28_CSI4_CSI0_BIST_DATA_OK_SHIFT 1
> +#define MIPI_RX_CON28_CSI4_CSI0_BIST_DATA_OK_MASK (0x1 << 1)
> +#define MIPI_RX_CON28_CSI4_CSI0_BIST_HS_FSM_OK_SHIFT 2
> +#define MIPI_RX_CON28_CSI4_CSI0_BIST_HS_FSM_OK_MASK (0x1 << 2)
> +#define MIPI_RX_CON28_CSI4_CSI0_BIST_LANE_FSM_OK_SHIFT 3
> +#define MIPI_RX_CON28_CSI4_CSI0_BIST_LANE_FSM_OK_MASK (0x1 << 3)
> +#define MIPI_RX_CON28_CSI4_CSI0_BIST_CSI2_DATA_OK_SHIFT 4
> +#define MIPI_RX_CON28_CSI4_CSI0_BIST_CSI2_DATA_OK_MASK (0x1 << 4)
> +#define MIPI_RX_CON34_CSI4                                     0x4834
> +#define MIPI_RX_CON34_CSI4_BIST_MODE_SHIFT     0
> +#define MIPI_RX_CON34_CSI4_BIST_MODE_MASK      (0x1 << 0)
> +#define MIPI_RX_CON34_CSI4_CSI0_BIST_HSDET_MUX_SHIFT 22
> +#define MIPI_RX_CON34_CSI4_CSI0_BIST_HSDET_MUX_MASK (0x3 << 22)
> +#define MIPI_RX_CON34_CSI4_CSI0_BIST_LN4_MUX_SHIFT 24
> +#define MIPI_RX_CON34_CSI4_CSI0_BIST_LN4_MUX_MASK (0x3 << 24)
> +#define MIPI_RX_CON34_CSI4_CSI0_BIST_LN5_MUX_SHIFT 26
> +#define MIPI_RX_CON34_CSI4_CSI0_BIST_LN5_MUX_MASK (0x3 << 26)
> +#define MIPI_RX_CON34_CSI4_CSI0_BIST_LN6_MUX_SHIFT 28
> +#define MIPI_RX_CON34_CSI4_CSI0_BIST_LN6_MUX_MASK (0x3 << 28)
> +#define MIPI_RX_CON34_CSI4_CSI0_BIST_LN7_MUX_SHIFT 30
> +#define MIPI_RX_CON34_CSI4_CSI0_BIST_LN7_MUX_MASK (0x3 << 30)
> +#define MIPI_RX_CON38_CSI4                                     0x4838
> +#define MIPI_RX_CON38_CSI4_MIPI_RX_SW_CTRL_MODE_SHIFT 0
> +#define MIPI_RX_CON38_CSI4_MIPI_RX_SW_CTRL_MODE_MASK (0x1 << 0)
> +#define MIPI_RX_CON38_CSI4_MIPI_RX_SW_CAL_MODE_SHIFT 1
> +#define MIPI_RX_CON38_CSI4_MIPI_RX_SW_CAL_MODE_MASK (0x1 << 1)
> +#define MIPI_RX_CON38_CSI4_MIPI_RX_HW_CAL_START_SHIFT 2
> +#define MIPI_RX_CON38_CSI4_MIPI_RX_HW_CAL_START_MASK (0x1 << 2)
> +#define MIPI_RX_CON38_CSI4_MIPI_RX_HW_CAL_OPTION_SHIFT 3
> +#define MIPI_RX_CON38_CSI4_MIPI_RX_HW_CAL_OPTION_MASK (0x1 << 3)
> +#define MIPI_RX_CON38_CSI4_MIPI_RX_SW_RST_SHIFT 4
> +#define MIPI_RX_CON38_CSI4_MIPI_RX_SW_RST_MASK (0x1f << 4)
> +#define MIPI_RX_CON38_CSI4_MIPI_RX_SW_CPHY_TX_MODE_SHIFT 9
> +#define MIPI_RX_CON38_CSI4_MIPI_RX_SW_CPHY_TX_MODE_MASK (0x1 << 9)
> +#define MIPI_RX_CON38_CSI4_MIPI_RX_SW_CPHY_RX_MODE_SHIFT 10
> +#define MIPI_RX_CON38_CSI4_MIPI_RX_SW_CPHY_RX_MODE_MASK (0x1 << 10)
> +#define MIPI_RX_CON38_CSI4_RG_CKPHASE_TRIO0_SHIFT 16
> +#define MIPI_RX_CON38_CSI4_RG_CKPHASE_TRIO0_MASK (0x1f << 16)
> +#define MIPI_RX_CON38_CSI4_RG_CKPHASE_TRIO1_SHIFT 22
> +#define MIPI_RX_CON38_CSI4_RG_CKPHASE_TRIO1_MASK (0x1f << 22)
> +#define MIPI_RX_CON38_CSI4_RG_CKPHASE_TRIO2_SHIFT 27
> +#define MIPI_RX_CON38_CSI4_RG_CKPHASE_TRIO2_MASK (0x1f << 27)
> +#define MIPI_RX_CON3C_CSI4                                     0x483C
> +#define MIPI_RX_CON3C_CSI4_MIPI_RX_SW_CTRL__SHIFT 0
> +#define MIPI_RX_CON3C_CSI4_MIPI_RX_SW_CTRL__MASK (0xffffffff << 0)
> +#define MIPI_RX_CON7C_CSI4                                     0x487C
> +#define MIPI_RX_CON7C_CSI4_DA_CSI0_LNRD0_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON7C_CSI4_DA_CSI0_LNRD0_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON7C_CSI4_DA_CSI0_LNRD0_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON7C_CSI4_DA_CSI0_LNRD0_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON7C_CSI4_DA_CSI0_LNRD0_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON7C_CSI4_DA_CSI0_LNRD0_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON80_CSI4                                     0x4880
> +#define MIPI_RX_CON80_CSI4_DA_CSI0_LNRD1_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON80_CSI4_DA_CSI0_LNRD1_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON80_CSI4_DA_CSI0_LNRD1_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON80_CSI4_DA_CSI0_LNRD1_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON80_CSI4_DA_CSI0_LNRD1_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON80_CSI4_DA_CSI0_LNRD1_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON84_CSI4                                     0x4884
> +#define MIPI_RX_CON84_CSI4_DA_CSI0_LNRD2_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON84_CSI4_DA_CSI0_LNRD2_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON84_CSI4_DA_CSI0_LNRD2_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON84_CSI4_DA_CSI0_LNRD2_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON84_CSI4_DA_CSI0_LNRD2_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON84_CSI4_DA_CSI0_LNRD2_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON88_CSI4                                     0x4888
> +#define MIPI_RX_CON88_CSI4_DA_CSI0_LNRD3_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON88_CSI4_DA_CSI0_LNRD3_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON88_CSI4_DA_CSI0_LNRD3_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON88_CSI4_DA_CSI0_LNRD3_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON88_CSI4_DA_CSI0_LNRD3_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON88_CSI4_DA_CSI0_LNRD3_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON8C_CSI4                                     0x488C
> +#define MIPI_RX_CON8C_CSI4_RG_CSI0_LNRD0_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON8C_CSI4_RG_CSI0_LNRD0_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON8C_CSI4_RG_CSI0_LNRD0_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON8C_CSI4_RG_CSI0_LNRD0_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON8C_CSI4_RG_CSI0_LNRD0_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON8C_CSI4_RG_CSI0_LNRD0_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON90_CSI4                                     0x4890
> +#define MIPI_RX_CON90_CSI4_RG_CSI0_LNRD1_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON90_CSI4_RG_CSI0_LNRD1_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON90_CSI4_RG_CSI0_LNRD1_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON90_CSI4_RG_CSI0_LNRD1_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON90_CSI4_RG_CSI0_LNRD1_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON90_CSI4_RG_CSI0_LNRD1_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON94_CSI4                                     0x4894
> +#define MIPI_RX_CON94_CSI4_RG_CSI0_LNRD2_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON94_CSI4_RG_CSI0_LNRD2_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON94_CSI4_RG_CSI0_LNRD2_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON94_CSI4_RG_CSI0_LNRD2_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON94_CSI4_RG_CSI0_LNRD2_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON94_CSI4_RG_CSI0_LNRD2_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CON98_CSI4                                     0x4898
> +#define MIPI_RX_CON98_CSI4_RG_CSI0_LNRD3_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CON98_CSI4_RG_CSI0_LNRD3_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CON98_CSI4_RG_CSI0_LNRD3_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CON98_CSI4_RG_CSI0_LNRD3_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CON98_CSI4_RG_CSI0_LNRD3_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CON98_CSI4_RG_CSI0_LNRD3_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CONA0_CSI4                                     0x48A0
> +#define MIPI_RX_CONA0_CSI4_RG_CSI0_LNRC_HSRX_DELAY_EN_SHIFT 0
> +#define MIPI_RX_CONA0_CSI4_RG_CSI0_LNRC_HSRX_DELAY_EN_MASK (0x1 << 0)
> +#define MIPI_RX_CONA0_CSI4_RG_CSI0_LNRC_HSRX_DELAY_APPLY_SHIFT 1
> +#define MIPI_RX_CONA0_CSI4_RG_CSI0_LNRC_HSRX_DELAY_APPLY_MASK (0x1 << 1)
> +#define MIPI_RX_CONA0_CSI4_RG_CSI0_LNRC_HSRX_DELAY_CODE_SHIFT 2
> +#define MIPI_RX_CONA0_CSI4_RG_CSI0_LNRC_HSRX_DELAY_CODE_MASK (0x3f << 2)
> +#define MIPI_RX_CONB0_CSI4                                     0x48B0
> +#define MIPI_RX_CONB0_CSI4_DELAY_APPLY_MODE_SHIFT 0
> +#define MIPI_RX_CONB0_CSI4_DELAY_APPLY_MODE_MASK (0xf << 0)
> +#define MIPI_RX_CONB0_CSI4_DESKEW_SW_RST_SHIFT 7
> +#define MIPI_RX_CONB0_CSI4_DESKEW_SW_RST_MASK  (0x1 << 7)
> +#define MIPI_RX_CONB0_CSI4_DESKEW_TRIGGER_MODE_SHIFT 8
> +#define MIPI_RX_CONB0_CSI4_DESKEW_TRIGGER_MODE_MASK (0x7 << 8)
> +#define MIPI_RX_CONB0_CSI4_DESKEW_ACC_MODE_SHIFT 12
> +#define MIPI_RX_CONB0_CSI4_DESKEW_ACC_MODE_MASK (0xf << 12)
> +#define MIPI_RX_CONB0_CSI4_DESKEW_CSI2_RST_ENABLE_SHIFT 16
> +#define MIPI_RX_CONB0_CSI4_DESKEW_CSI2_RST_ENABLE_MASK (0x1 << 16)
> +#define MIPI_RX_CONB0_CSI4_DESKEW_IP_SEL_SHIFT 30
> +#define MIPI_RX_CONB0_CSI4_DESKEW_IP_SEL_MASK  (0x1 << 30)
> +#define MIPI_RX_CONB0_CSI4_DESKEW_ENABLE_SHIFT 31
> +#define MIPI_RX_CONB0_CSI4_DESKEW_ENABLE_MASK  (0x1 << 31)
> +#define MIPI_RX_CONB4_CSI4                                     0x48B4
> +#define MIPI_RX_CONB4_CSI4_SYNC_CODE_MASK_SHIFT 0
> +#define MIPI_RX_CONB4_CSI4_SYNC_CODE_MASK_MASK (0xffff << 0)
> +#define MIPI_RX_CONB4_CSI4_EXPECTED_SYNC_CODE_SHIFT 16
> +#define MIPI_RX_CONB4_CSI4_EXPECTED_SYNC_CODE_MASK (0xffff << 16)
> +#define MIPI_RX_CONB8_CSI4                                     0x48B8
> +#define MIPI_RX_CONB8_CSI4_DESKEW_SETUP_TIME_SHIFT 0
> +#define MIPI_RX_CONB8_CSI4_DESKEW_SETUP_TIME_MASK (0xf << 0)
> +#define MIPI_RX_CONB8_CSI4_DESKEW_HOLD_TIME_SHIFT 8
> +#define MIPI_RX_CONB8_CSI4_DESKEW_HOLD_TIME_MASK (0xf << 8)
> +#define MIPI_RX_CONB8_CSI4_DESKEW_TIME_OUT_SHIFT 16
> +#define MIPI_RX_CONB8_CSI4_DESKEW_TIME_OUT_MASK (0xff << 16)
> +#define MIPI_RX_CONB8_CSI4_DESKEW_TIME_OUT_EN_SHIFT 24
> +#define MIPI_RX_CONB8_CSI4_DESKEW_TIME_OUT_EN_MASK (0x1 << 24)
> +#define MIPI_RX_CONBC_CSI4                                     0x48BC
> +#define MIPI_RX_CONBC_CSI4_DESKEW_DETECTION_MODE_SHIFT 0
> +#define MIPI_RX_CONBC_CSI4_DESKEW_DETECTION_MODE_MASK (0xf << 0)
> +#define MIPI_RX_CONBC_CSI4_DESKEW_DETECTION_CNT_SHIFT 8
> +#define MIPI_RX_CONBC_CSI4_DESKEW_DETECTION_CNT_MASK (0x7f << 8)
> +#define MIPI_RX_CONBC_CSI4_DESKEW_DELAY_APPLY_MODE_SHIFT 16
> +#define MIPI_RX_CONBC_CSI4_DESKEW_DELAY_APPLY_MODE_MASK (0xf << 16)
> +#define MIPI_RX_CONBC_CSI4_DESKEW_LANE_NUMBER_SHIFT 24
> +#define MIPI_RX_CONBC_CSI4_DESKEW_LANE_NUMBER_MASK (0x3 << 24)
> +#define MIPI_RX_CONC0_CSI4                                     0x48C0
> +#define MIPI_RX_CONC0_CSI4_DESKEW_INTERRUPT_ENABLE_SHIFT 0
> +#define MIPI_RX_CONC0_CSI4_DESKEW_INTERRUPT_ENABLE_MASK (0xffff << 0)
> +#define MIPI_RX_CONC0_CSI4_DESKEW_INTERRUPT_W1C_EN_SHIFT 31
> +#define MIPI_RX_CONC0_CSI4_DESKEW_INTERRUPT_W1C_EN_MASK (0x1 << 31)
> +#define MIPI_RX_CONC4_CSI4                                     0x48C4
> +#define MIPI_RX_CONC4_CSI4_DESKEW_INTERRUPT_STATUS_SHIFT 0
> +#define MIPI_RX_CONC4_CSI4_DESKEW_INTERRUPT_STATUS_MASK (0xffff << 0)
> +#define MIPI_RX_CONC8_CSI4                                     0x48C8
> +#define MIPI_RX_CONC8_CSI4_DESKEW_DEBUG_MUX_SELECT_SHIFT 0
> +#define MIPI_RX_CONC8_CSI4_DESKEW_DEBUG_MUX_SELECT_MASK (0xff << 0)
> +#define MIPI_RX_CONCC_CSI4                                     0x48CC
> +#define MIPI_RX_CONCC_CSI4_DESKEW_DEBUG_OUTPUTS_SHIFT 0
> +#define MIPI_RX_CONCC_CSI4_DESKEW_DEBUG_OUTPUTS_MASK (0xffffffff << 0)
> +#define MIPI_RX_COND0_CSI4                                     0x48D0
> +#define MIPI_RX_COND0_CSI4_DESKEW_DELAY_LENGTH_SHIFT 0
> +#define MIPI_RX_COND0_CSI4_DESKEW_DELAY_LENGTH_MASK (0x3f << 0)
> +#define SENINF5_CSI2_CTL                                       0x4A00
> +#define SENINF5_CSI2_CTL_DATA_LANE0_EN_SHIFT   0
> +#define SENINF5_CSI2_CTL_DATA_LANE0_EN_MASK    (0x1 << 0)
> +#define SENINF5_CSI2_CTL_DATA_LANE1_EN_SHIFT   1
> +#define SENINF5_CSI2_CTL_DATA_LANE1_EN_MASK    (0x1 << 1)
> +#define SENINF5_CSI2_CTL_DATA_LANE2_EN_SHIFT   2
> +#define SENINF5_CSI2_CTL_DATA_LANE2_EN_MASK    (0x1 << 2)
> +#define SENINF5_CSI2_CTL_DATA_LANE3_EN_SHIFT   3
> +#define SENINF5_CSI2_CTL_DATA_LANE3_EN_MASK    (0x1 << 3)
> +#define SENINF5_CSI2_CTL_CLOCK_LANE_EN_SHIFT   4
> +#define SENINF5_CSI2_CTL_CLOCK_LANE_EN_MASK    (0x1 << 4)
> +#define SENINF5_CSI2_CTL_ECC_EN_SHIFT          5
> +#define SENINF5_CSI2_CTL_ECC_EN_MASK           (0x1 << 5)
> +#define SENINF5_CSI2_CTL_CRC_EN_SHIFT          6
> +#define SENINF5_CSI2_CTL_CRC_EN_MASK           (0x1 << 6)
> +#define SENINF5_CSI2_CTL_HSRX_DET_EN_SHIFT     7
> +#define SENINF5_CSI2_CTL_HSRX_DET_EN_MASK      (0x1 << 7)
> +#define SENINF5_CSI2_CTL_HS_PRPR_EN_SHIFT      8
> +#define SENINF5_CSI2_CTL_HS_PRPR_EN_MASK       (0x1 << 8)
> +#define SENINF5_CSI2_CTL_HS_END_EN_SHIFT       9
> +#define SENINF5_CSI2_CTL_HS_END_EN_MASK        (0x1 << 9)
> +#define SENINF5_CSI2_CTL_GENERIC_LONG_PACKET_EN_SHIFT 12
> +#define SENINF5_CSI2_CTL_GENERIC_LONG_PACKET_EN_MASK (0x1 << 12)
> +#define SENINF5_CSI2_CTL_IMAGE_PACKET_EN_SHIFT 13
> +#define SENINF5_CSI2_CTL_IMAGE_PACKET_EN_MASK  (0x1 << 13)
> +#define SENINF5_CSI2_CTL_BYTE2PIXEL_EN_SHIFT   14
> +#define SENINF5_CSI2_CTL_BYTE2PIXEL_EN_MASK    (0x1 << 14)
> +#define SENINF5_CSI2_CTL_VS_TYPE_SHIFT         15
> +#define SENINF5_CSI2_CTL_VS_TYPE_MASK          (0x1 << 15)
> +#define SENINF5_CSI2_CTL_ED_SEL_SHIFT          16
> +#define SENINF5_CSI2_CTL_ED_SEL_MASK           (0x1 << 16)
> +#define SENINF5_CSI2_CTL_FLUSH_MODE_SHIFT      18
> +#define SENINF5_CSI2_CTL_FLUSH_MODE_MASK       (0x3 << 18)
> +#define SENINF5_CSI2_CTL_HS_TRAIL_EN_SHIFT     25
> +#define SENINF5_CSI2_CTL_HS_TRAIL_EN_MASK      (0x1 << 25)
> +#define SENINF5_CSI2_CTL_CLOCK_HS_OPTION_SHIFT 27
> +#define SENINF5_CSI2_CTL_CLOCK_HS_OPTION_MASK  (0x1 << 27)
> +#define SENINF5_CSI2_CTL_VS_OUT_CYCLE_NUMBER_SHIFT 28
> +#define SENINF5_CSI2_CTL_VS_OUT_CYCLE_NUMBER_MASK (0x3 << 28)
> +#define SENINF5_CSI2_LNRC_TIMING                               0x4A04
> +#define SENINF5_CSI2_LNRC_TIMING_CLOCK_TERM_PARAMETER_SHIFT 0
> +#define SENINF5_CSI2_LNRC_TIMING_CLOCK_TERM_PARAMETER_MASK (0xff << 0)
> +#define SENINF5_CSI2_LNRC_TIMING_CLOCK_SETTLE_PARAMETER_SHIFT 8
> +#define SENINF5_CSI2_LNRC_TIMING_CLOCK_SETTLE_PARAMETER_MASK (0xff << 8)
> +#define SENINF5_CSI2_LNRD_TIMING                               0x4A08
> +#define SENINF5_CSI2_LNRD_TIMING_DATA_TERM_PARAMETER_SHIFT 0
> +#define SENINF5_CSI2_LNRD_TIMING_DATA_TERM_PARAMETER_MASK (0xff << 0)
> +#define SENINF5_CSI2_LNRD_TIMING_DATA_SETTLE_PARAMETER_SHIFT 8
> +#define SENINF5_CSI2_LNRD_TIMING_DATA_SETTLE_PARAMETER_MASK (0xff << 8)
> +#define SENINF5_CSI2_DPCM                                      0x4A0C
> +#define SENINF5_CSI2_DPCM_DPCM_MODE_SHIFT      0
> +#define SENINF5_CSI2_DPCM_DPCM_MODE_MASK       (0xf << 0)
> +#define SENINF5_CSI2_DPCM_DI_30_DPCM_EN_SHIFT  7
> +#define SENINF5_CSI2_DPCM_DI_30_DPCM_EN_MASK   (0x1 << 7)
> +#define SENINF5_CSI2_DPCM_DI_31_DPCM_EN_SHIFT  8
> +#define SENINF5_CSI2_DPCM_DI_31_DPCM_EN_MASK   (0x1 << 8)
> +#define SENINF5_CSI2_DPCM_DI_32_DPCM_EN_SHIFT  9
> +#define SENINF5_CSI2_DPCM_DI_32_DPCM_EN_MASK   (0x1 << 9)
> +#define SENINF5_CSI2_DPCM_DI_33_DPCM_EN_SHIFT  10
> +#define SENINF5_CSI2_DPCM_DI_33_DPCM_EN_MASK   (0x1 << 10)
> +#define SENINF5_CSI2_DPCM_DI_34_DPCM_EN_SHIFT  11
> +#define SENINF5_CSI2_DPCM_DI_34_DPCM_EN_MASK   (0x1 << 11)
> +#define SENINF5_CSI2_DPCM_DI_35_DPCM_EN_SHIFT  12
> +#define SENINF5_CSI2_DPCM_DI_35_DPCM_EN_MASK   (0x1 << 12)
> +#define SENINF5_CSI2_DPCM_DI_36_DPCM_EN_SHIFT  13
> +#define SENINF5_CSI2_DPCM_DI_36_DPCM_EN_MASK   (0x1 << 13)
> +#define SENINF5_CSI2_DPCM_DI_37_DPCM_EN_SHIFT  14
> +#define SENINF5_CSI2_DPCM_DI_37_DPCM_EN_MASK   (0x1 << 14)
> +#define SENINF5_CSI2_DPCM_DI_2A_DPCM_EN_SHIFT  15
> +#define SENINF5_CSI2_DPCM_DI_2A_DPCM_EN_MASK   (0x1 << 15)
> +#define SENINF5_CSI2_INT_EN                                    0x4A10
> +#define SENINF5_CSI2_INT_EN_ERR_FRAME_SYNC_SHIFT 0
> +#define SENINF5_CSI2_INT_EN_ERR_FRAME_SYNC_MASK (0x1 << 0)
> +#define SENINF5_CSI2_INT_EN_ERR_ID_SHIFT       1
> +#define SENINF5_CSI2_INT_EN_ERR_ID_MASK        (0x1 << 1)
> +#define SENINF5_CSI2_INT_EN_ERR_ECC_NO_ERROR_SHIFT 2
> +#define SENINF5_CSI2_INT_EN_ERR_ECC_NO_ERROR_MASK (0x1 << 2)
> +#define SENINF5_CSI2_INT_EN_ERR_ECC_CORRECTED_SHIFT 3
> +#define SENINF5_CSI2_INT_EN_ERR_ECC_CORRECTED_MASK (0x1 << 3)
> +#define SENINF5_CSI2_INT_EN_ERR_ECC_DOUBLE_SHIFT 4
> +#define SENINF5_CSI2_INT_EN_ERR_ECC_DOUBLE_MASK (0x1 << 4)
> +#define SENINF5_CSI2_INT_EN_ERR_CRC_SHIFT      5
> +#define SENINF5_CSI2_INT_EN_ERR_CRC_MASK       (0x1 << 5)
> +#define SENINF5_CSI2_INT_EN_ERR_CRC_NO_ERROR_SHIFT 6
> +#define SENINF5_CSI2_INT_EN_ERR_CRC_NO_ERROR_MASK (0x1 << 6)
> +#define SENINF5_CSI2_INT_EN_ERR_MULTI_LANE_SYNC_SHIFT 7
> +#define SENINF5_CSI2_INT_EN_ERR_MULTI_LANE_SYNC_MASK (0x1 << 7)
> +#define SENINF5_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD0_SHIFT 8
> +#define SENINF5_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD0_MASK (0x1 << 8)
> +#define SENINF5_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD1_SHIFT 9
> +#define SENINF5_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD1_MASK (0x1 << 9)
> +#define SENINF5_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD2_SHIFT 10
> +#define SENINF5_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD2_MASK (0x1 << 10)
> +#define SENINF5_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD3_SHIFT 11
> +#define SENINF5_CSI2_INT_EN_ERR_SOT_SYNC_HS_LNRD3_MASK (0x1 << 11)
> +#define SENINF5_CSI2_INT_EN_FS_SHIFT           12
> +#define SENINF5_CSI2_INT_EN_FS_MASK            (0x1 << 12)
> +#define SENINF5_CSI2_INT_EN_LS_SHIFT           13
> +#define SENINF5_CSI2_INT_EN_LS_MASK            (0x1 << 13)
> +#define SENINF5_CSI2_INT_EN_GS_SHIFT           14
> +#define SENINF5_CSI2_INT_EN_GS_MASK            (0x1 << 14)
> +#define SENINF5_CSI2_INT_EN_FE_SHIFT           15
> +#define SENINF5_CSI2_INT_EN_FE_MASK            (0x1 << 15)
> +#define SENINF5_CSI2_INT_EN_ERR_FRAME_SYNC_S0_SHIFT 16
> +#define SENINF5_CSI2_INT_EN_ERR_FRAME_SYNC_S0_MASK (0x1 << 16)
> +#define SENINF5_CSI2_INT_EN_ERR_FRAME_SYNC_S1_SHIFT 17
> +#define SENINF5_CSI2_INT_EN_ERR_FRAME_SYNC_S1_MASK (0x1 << 17)
> +#define SENINF5_CSI2_INT_EN_ERR_FRAME_SYNC_S2_SHIFT 18
> +#define SENINF5_CSI2_INT_EN_ERR_FRAME_SYNC_S2_MASK (0x1 << 18)
> +#define SENINF5_CSI2_INT_EN_ERR_FRAME_SYNC_S3_SHIFT 19
> +#define SENINF5_CSI2_INT_EN_ERR_FRAME_SYNC_S3_MASK (0x1 << 19)
> +#define SENINF5_CSI2_INT_EN_ERR_FRAME_SYNC_S4_SHIFT 20
> +#define SENINF5_CSI2_INT_EN_ERR_FRAME_SYNC_S4_MASK (0x1 << 20)
> +#define SENINF5_CSI2_INT_EN_ERR_FRAME_SYNC_S5_SHIFT 21
> +#define SENINF5_CSI2_INT_EN_ERR_FRAME_SYNC_S5_MASK (0x1 << 21)
> +#define SENINF5_CSI2_INT_EN_ERR_LANE_RESYNC_SHIFT 22
> +#define SENINF5_CSI2_INT_EN_ERR_LANE_RESYNC_MASK (0x1 << 22)
> +#define SENINF5_CSI2_INT_EN_ERR_FRAME_SYNC_S6_SHIFT 23
> +#define SENINF5_CSI2_INT_EN_ERR_FRAME_SYNC_S6_MASK (0x1 << 23)
> +#define SENINF5_CSI2_INT_EN_ERR_FRAME_SYNC_S7_SHIFT 24
> +#define SENINF5_CSI2_INT_EN_ERR_FRAME_SYNC_S7_MASK (0x1 << 24)
> +#define SENINF5_CSI2_INT_EN_TRIO0_ESCAPE_CODE_DETECT_SHIFT 26
> +#define SENINF5_CSI2_INT_EN_TRIO0_ESCAPE_CODE_DETECT_MASK (0x1 << 26)
> +#define SENINF5_CSI2_INT_EN_TRIO1_ESCAPE_CODE_DETECT_SHIFT 27
> +#define SENINF5_CSI2_INT_EN_TRIO1_ESCAPE_CODE_DETECT_MASK (0x1 << 27)
> +#define SENINF5_CSI2_INT_EN_TRIO2_ESCAPE_CODE_DETECT_SHIFT 28
> +#define SENINF5_CSI2_INT_EN_TRIO2_ESCAPE_CODE_DETECT_MASK (0x1 << 28)
> +#define SENINF5_CSI2_INT_EN_TRIO3_ESCAPE_CODE_DETECT_SHIFT 29
> +#define SENINF5_CSI2_INT_EN_TRIO3_ESCAPE_CODE_DETECT_MASK (0x1 << 29)
> +#define SENINF5_CSI2_INT_EN_MERGE_FIFO_AF_SHIFT 30
> +#define SENINF5_CSI2_INT_EN_MERGE_FIFO_AF_MASK (0x1 << 30)
> +#define SENINF5_CSI2_INT_EN_INT_WCLR_EN_SHIFT  31
> +#define SENINF5_CSI2_INT_EN_INT_WCLR_EN_MASK   (0x1 << 31)
> +#define SENINF5_CSI2_INT_STATUS                                0x4A14
> +#define SENINF5_CSI2_INT_STATUS_ERR_FRAME_SYNC_STA_SHIFT 0
> +#define SENINF5_CSI2_INT_STATUS_ERR_FRAME_SYNC_STA_MASK (0x1 << 0)
> +#define SENINF5_CSI2_INT_STATUS_ERR_ID_STA_SHIFT 1
> +#define SENINF5_CSI2_INT_STATUS_ERR_ID_STA_MASK (0x1 << 1)
> +#define SENINF5_CSI2_INT_STATUS_ERR_ECC_NO_ERROR_STA_SHIFT 2
> +#define SENINF5_CSI2_INT_STATUS_ERR_ECC_NO_ERROR_STA_MASK (0x1 << 2)
> +#define SENINF5_CSI2_INT_STATUS_ERR_ECC_CORRECTED_STA_SHIFT 3
> +#define SENINF5_CSI2_INT_STATUS_ERR_ECC_CORRECTED_STA_MASK (0x1 << 3)
> +#define SENINF5_CSI2_INT_STATUS_ERR_ECC_DOUBLE_STA_SHIFT 4
> +#define SENINF5_CSI2_INT_STATUS_ERR_ECC_DOUBLE_STA_MASK (0x1 << 4)
> +#define SENINF5_CSI2_INT_STATUS_ERR_CRC_STA_SHIFT 5
> +#define SENINF5_CSI2_INT_STATUS_ERR_CRC_STA_MASK (0x1 << 5)
> +#define SENINF5_CSI2_INT_STATUS_ERR_MULTI_LANE_SYNC_STA_SHIFT 7
> +#define SENINF5_CSI2_INT_STATUS_ERR_MULTI_LANE_SYNC_STA_MASK (0x1 << 7)
> +#define SENINF5_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD0_STA_SHIFT 8
> +#define SENINF5_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD0_STA_MASK (0x1 << 8)
> +#define SENINF5_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD1_STA_SHIFT 9
> +#define SENINF5_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD1_STA_MASK (0x1 << 9)
> +#define SENINF5_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD2_STA_SHIFT 10
> +#define SENINF5_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD2_STA_MASK (0x1 << 10)
> +#define SENINF5_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD3_STA_SHIFT 11
> +#define SENINF5_CSI2_INT_STATUS_ERR_SOT_SYNC_HS_LNRD3_STA_MASK (0x1 << 11)
> +#define SENINF5_CSI2_INT_STATUS_FS_STA_SHIFT   12
> +#define SENINF5_CSI2_INT_STATUS_FS_STA_MASK    (0x1 << 12)
> +#define SENINF5_CSI2_INT_STATUS_LS_STA_SHIFT   13
> +#define SENINF5_CSI2_INT_STATUS_LS_STA_MASK    (0x1 << 13)
> +#define SENINF5_CSI2_INT_STATUS_GS_STA_SHIFT   14
> +#define SENINF5_CSI2_INT_STATUS_GS_STA_MASK    (0x1 << 14)
> +#define SENINF5_CSI2_INT_STATUS_FE_STA_SHIFT   15
> +#define SENINF5_CSI2_INT_STATUS_FE_STA_MASK    (0x1 << 15)
> +#define SENINF5_CSI2_INT_STATUS_ERR_FRAME_SYNC_S0_STA_SHIFT 16
> +#define SENINF5_CSI2_INT_STATUS_ERR_FRAME_SYNC_S0_STA_MASK (0x1 << 16)
> +#define SENINF5_CSI2_INT_STATUS_ERR_FRAME_SYNC_S1_STA_SHIFT 17
> +#define SENINF5_CSI2_INT_STATUS_ERR_FRAME_SYNC_S1_STA_MASK (0x1 << 17)
> +#define SENINF5_CSI2_INT_STATUS_ERR_FRAME_SYNC_S2_STA_SHIFT 18
> +#define SENINF5_CSI2_INT_STATUS_ERR_FRAME_SYNC_S2_STA_MASK (0x1 << 18)
> +#define SENINF5_CSI2_INT_STATUS_ERR_FRAME_SYNC_S3_STA_SHIFT 19
> +#define SENINF5_CSI2_INT_STATUS_ERR_FRAME_SYNC_S3_STA_MASK (0x1 << 19)
> +#define SENINF5_CSI2_INT_STATUS_ERR_FRAME_SYNC_S4_STA_SHIFT 20
> +#define SENINF5_CSI2_INT_STATUS_ERR_FRAME_SYNC_S4_STA_MASK (0x1 << 20)
> +#define SENINF5_CSI2_INT_STATUS_ERR_FRAME_SYNC_S5_STA_SHIFT 21
> +#define SENINF5_CSI2_INT_STATUS_ERR_FRAME_SYNC_S5_STA_MASK (0x1 << 21)
> +#define SENINF5_CSI2_INT_STATUS_ERR_LANE_RESYNC_STA_SHIFT 22
> +#define SENINF5_CSI2_INT_STATUS_ERR_LANE_RESYNC_STA_MASK (0x1 << 22)
> +#define SENINF5_CSI2_INT_STATUS_ERR_FRAME_SYNC_S6_STA_SHIFT 23
> +#define SENINF5_CSI2_INT_STATUS_ERR_FRAME_SYNC_S6_STA_MASK (0x1 << 23)
> +#define SENINF5_CSI2_INT_STATUS_ERR_FRAME_SYNC_S7_STA_SHIFT 24
> +#define SENINF5_CSI2_INT_STATUS_ERR_FRAME_SYNC_S7_STA_MASK (0x1 << 24)
> +#define SENINF5_CSI2_INT_STATUS_TRIO0_ESCAPE_CODE_DETECT_STA_SHIFT 26
> +#define SENINF5_CSI2_INT_STATUS_TRIO0_ESCAPE_CODE_DETECT_STA_MASK (0x1 << 26)
> +#define SENINF5_CSI2_INT_STATUS_TRIO1_ESCAPE_CODE_DETECT_STA_SHIFT 27
> +#define SENINF5_CSI2_INT_STATUS_TRIO1_ESCAPE_CODE_DETECT_STA_MASK (0x1 << 27)
> +#define SENINF5_CSI2_INT_STATUS_TRIO2_ESCAPE_CODE_DETECT_STA_SHIFT 28
> +#define SENINF5_CSI2_INT_STATUS_TRIO2_ESCAPE_CODE_DETECT_STA_MASK (0x1 << 28)
> +#define SENINF5_CSI2_INT_STATUS_TRIO3_ESCAPE_CODE_DETECT_STA_SHIFT 29
> +#define SENINF5_CSI2_INT_STATUS_TRIO3_ESCAPE_CODE_DETECT_STA_MASK (0x1 << 29)
> +#define SENINF5_CSI2_INT_STATUS_MERGE_FIFO_AF_SHIFT 30
> +#define SENINF5_CSI2_INT_STATUS_MERGE_FIFO_AF_MASK (0x1 << 30)
> +#define SENINF5_CSI2_DGB_SEL                                   0x4A18
> +#define SENINF5_CSI2_DGB_SEL_DEBUG_SEL_SHIFT   0
> +#define SENINF5_CSI2_DGB_SEL_DEBUG_SEL_MASK    (0xff << 0)
> +#define SENINF5_CSI2_DGB_SEL_DEBUG_EN_SHIFT    31
> +#define SENINF5_CSI2_DGB_SEL_DEBUG_EN_MASK     (0x1 << 31)
> +#define SENINF5_CSI2_DBG_PORT                                  0x4A1C
> +#define SENINF5_CSI2_DBG_PORT_CTL_DBG_PORT_SHIFT 0
> +#define SENINF5_CSI2_DBG_PORT_CTL_DBG_PORT_MASK (0xffff << 0)
> +#define SENINF5_CSI2_SPARE0                                    0x4A20
> +#define SENINF5_CSI2_SPARE0_SPARE0_SHIFT       0
> +#define SENINF5_CSI2_SPARE0_SPARE0_MASK        (0xffffffff << 0)
> +#define SENINF5_CSI2_SPARE1                                    0x4A24
> +#define SENINF5_CSI2_SPARE1_SPARE1_SHIFT       0
> +#define SENINF5_CSI2_SPARE1_SPARE1_MASK        (0xffffffff << 0)
> +#define SENINF5_CSI2_LNRC_FSM                                  0x4A28
> +#define SENINF5_CSI2_LNRC_FSM_LNRC_RX_FSM_SHIFT 0
> +#define SENINF5_CSI2_LNRC_FSM_LNRC_RX_FSM_MASK (0x3f << 0)
> +#define SENINF5_CSI2_LNRD_FSM                                  0x4A2C
> +#define SENINF5_CSI2_LNRD_FSM_LNRD0_RX_FSM_SHIFT 0
> +#define SENINF5_CSI2_LNRD_FSM_LNRD0_RX_FSM_MASK (0x7f << 0)
> +#define SENINF5_CSI2_LNRD_FSM_LNRD1_RX_FSM_SHIFT 8
> +#define SENINF5_CSI2_LNRD_FSM_LNRD1_RX_FSM_MASK (0x7f << 8)
> +#define SENINF5_CSI2_LNRD_FSM_LNRD2_RX_FSM_SHIFT 16
> +#define SENINF5_CSI2_LNRD_FSM_LNRD2_RX_FSM_MASK (0x7f << 16)
> +#define SENINF5_CSI2_LNRD_FSM_LNRD3_RX_FSM_SHIFT 24
> +#define SENINF5_CSI2_LNRD_FSM_LNRD3_RX_FSM_MASK (0x7f << 24)
> +#define SENINF5_CSI2_FRAME_LINE_NUM                            0x4A30
> +#define SENINF5_CSI2_FRAME_LINE_NUM_FRAME_NUM_SHIFT 0
> +#define SENINF5_CSI2_FRAME_LINE_NUM_FRAME_NUM_MASK (0xffff << 0)
> +#define SENINF5_CSI2_FRAME_LINE_NUM_LINE_NUM_SHIFT 16
> +#define SENINF5_CSI2_FRAME_LINE_NUM_LINE_NUM_MASK (0xffff << 16)
> +#define SENINF5_CSI2_GENERIC_SHORT                             0x4A34
> +#define SENINF5_CSI2_GENERIC_SHORT_GENERIC_SHORT_PACKET_DT_SHIFT 0
> +#define SENINF5_CSI2_GENERIC_SHORT_GENERIC_SHORT_PACKET_DT_MASK (0x3f << 0)
> +#define SENINF5_CSI2_GENERIC_SHORT_GENERIC_SHORT_PACKET_DATA_SHIFT 16
> +#define SENINF5_CSI2_GENERIC_SHORT_GENERIC_SHORT_PACKET_DATA_MASK \
> +(0xffff << 16)
> +#define SENINF5_CSI2_HSRX_DBG                                  0x4A38
> +#define SENINF5_CSI2_HSRX_DBG_DATA_LANE0_HSRX_EN_SHIFT 0
> +#define SENINF5_CSI2_HSRX_DBG_DATA_LANE0_HSRX_EN_MASK (0x1 << 0)
> +#define SENINF5_CSI2_HSRX_DBG_DATA_LANE1_HSRX_EN_SHIFT 1
> +#define SENINF5_CSI2_HSRX_DBG_DATA_LANE1_HSRX_EN_MASK (0x1 << 1)
> +#define SENINF5_CSI2_HSRX_DBG_DATA_LANE2_HSRX_EN_SHIFT 2
> +#define SENINF5_CSI2_HSRX_DBG_DATA_LANE2_HSRX_EN_MASK (0x1 << 2)
> +#define SENINF5_CSI2_HSRX_DBG_DATA_LANE3_HSRX_EN_SHIFT 3
> +#define SENINF5_CSI2_HSRX_DBG_DATA_LANE3_HSRX_EN_MASK (0x1 << 3)
> +#define SENINF5_CSI2_HSRX_DBG_CLOCK_LANE_HSRX_EN_SHIFT 4
> +#define SENINF5_CSI2_HSRX_DBG_CLOCK_LANE_HSRX_EN_MASK (0x1 << 4)
> +#define SENINF5_CSI2_DI                                        0x4A3C
> +#define SENINF5_CSI2_DI_VC0_SHIFT              0
> +#define SENINF5_CSI2_DI_VC0_MASK               (0x3 << 0)
> +#define SENINF5_CSI2_DI_DT0_SHIFT              2
> +#define SENINF5_CSI2_DI_DT0_MASK               (0x3f << 2)
> +#define SENINF5_CSI2_DI_VC1_SHIFT              8
> +#define SENINF5_CSI2_DI_VC1_MASK               (0x3 << 8)
> +#define SENINF5_CSI2_DI_DT1_SHIFT              10
> +#define SENINF5_CSI2_DI_DT1_MASK               (0x3f << 10)
> +#define SENINF5_CSI2_DI_VC2_SHIFT              16
> +#define SENINF5_CSI2_DI_VC2_MASK               (0x3 << 16)
> +#define SENINF5_CSI2_DI_DT2_SHIFT              18
> +#define SENINF5_CSI2_DI_DT2_MASK               (0x3f << 18)
> +#define SENINF5_CSI2_DI_VC3_SHIFT              24
> +#define SENINF5_CSI2_DI_VC3_MASK               (0x3 << 24)
> +#define SENINF5_CSI2_DI_DT3_SHIFT              26
> +#define SENINF5_CSI2_DI_DT3_MASK               (0x3f << 26)
> +#define SENINF5_CSI2_HS_TRAIL                                  0x4A40
> +#define SENINF5_CSI2_HS_TRAIL_HS_TRAIL_PARAMETER_SHIFT 0
> +#define SENINF5_CSI2_HS_TRAIL_HS_TRAIL_PARAMETER_MASK (0xff << 0)
> +#define SENINF5_CSI2_DI_CTRL                                   0x4A44
> +#define SENINF5_CSI2_DI_CTRL_VC0_INTERLEAVING_SHIFT 0
> +#define SENINF5_CSI2_DI_CTRL_VC0_INTERLEAVING_MASK (0x1 << 0)
> +#define SENINF5_CSI2_DI_CTRL_DT0_INTERLEAVING_SHIFT 1
> +#define SENINF5_CSI2_DI_CTRL_DT0_INTERLEAVING_MASK (0x3 << 1)
> +#define SENINF5_CSI2_DI_CTRL_VC1_INTERLEAVING_SHIFT 8
> +#define SENINF5_CSI2_DI_CTRL_VC1_INTERLEAVING_MASK (0x1 << 8)
> +#define SENINF5_CSI2_DI_CTRL_DT1_INTERLEAVING_SHIFT 9
> +#define SENINF5_CSI2_DI_CTRL_DT1_INTERLEAVING_MASK (0x3 << 9)
> +#define SENINF5_CSI2_DI_CTRL_VC2_INTERLEAVING_SHIFT 16
> +#define SENINF5_CSI2_DI_CTRL_VC2_INTERLEAVING_MASK (0x1 << 16)
> +#define SENINF5_CSI2_DI_CTRL_DT2_INTERLEAVING_SHIFT 17
> +#define SENINF5_CSI2_DI_CTRL_DT2_INTERLEAVING_MASK (0x3 << 17)
> +#define SENINF5_CSI2_DI_CTRL_VC3_INTERLEAVING_SHIFT 24
> +#define SENINF5_CSI2_DI_CTRL_VC3_INTERLEAVING_MASK (0x1 << 24)
> +#define SENINF5_CSI2_DI_CTRL_DT3_INTERLEAVING_SHIFT 25
> +#define SENINF5_CSI2_DI_CTRL_DT3_INTERLEAVING_MASK (0x3 << 25)
> +#define SENINF5_CSI2_DETECT_CON1                               0x4A4C
> +#define SENINF5_CSI2_DETECT_CON1_DETECT_SYNC_DISABLE_SHIFT 0
> +#define SENINF5_CSI2_DETECT_CON1_DETECT_SYNC_DISABLE_MASK (0x1 << 0)
> +#define SENINF5_CSI2_DETECT_CON1_DETECT_SYNC_MASK_SHIFT 1
> +#define SENINF5_CSI2_DETECT_CON1_DETECT_SYNC_MASK_MASK (0x7f << 1)
> +#define SENINF5_CSI2_DETECT_CON1_SYNC_WORD_SHIFT 8
> +#define SENINF5_CSI2_DETECT_CON1_SYNC_WORD_MASK (0x1fffff << 8)
> +#define SENINF5_CSI2_DETECT_CON2                               0x4A50
> +#define SENINF5_CSI2_DETECT_CON2_DETECT_ESCAPE_DISABLE_SHIFT 0
> +#define SENINF5_CSI2_DETECT_CON2_DETECT_ESCAPE_DISABLE_MASK (0x1 << 0)
> +#define SENINF5_CSI2_DETECT_CON2_DETECT_ESCAPE_MASK_SHIFT 1
> +#define SENINF5_CSI2_DETECT_CON2_DETECT_ESCAPE_MASK_MASK (0x7f << 1)
> +#define SENINF5_CSI2_DETECT_CON2_ESCAPE_WORD_SHIFT 8
> +#define SENINF5_CSI2_DETECT_CON2_ESCAPE_WORD_MASK (0x1fffff << 8)
> +#define SENINF5_CSI2_DETECT_CON3                               0x4A54
> +#define SENINF5_CSI2_DETECT_CON3_DETECT_POST_DISABLE_SHIFT 0
> +#define SENINF5_CSI2_DETECT_CON3_DETECT_POST_DISABLE_MASK (0x1 << 0)
> +#define SENINF5_CSI2_DETECT_CON3_DETECT_POST_MASK_SHIFT 1
> +#define SENINF5_CSI2_DETECT_CON3_DETECT_POST_MASK_MASK (0x7f << 1)
> +#define SENINF5_CSI2_DETECT_CON3_POST_WORD_SHIFT 8
> +#define SENINF5_CSI2_DETECT_CON3_POST_WORD_MASK (0x1fffff << 8)
> +#define SENINF5_CSI2_RLR0_CON0                                 0x4A58
> +#define SENINF5_CSI2_RLR0_CON0_RLR0_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF5_CSI2_RLR0_CON0_RLR0_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF5_CSI2_RLR0_CON0_RLR0_PRBS_SEED_0_SHIFT 8
> +#define SENINF5_CSI2_RLR0_CON0_RLR0_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF5_CSI2_RLR0_CON0_RLR0_PRBS_SEED_1_SHIFT 16
> +#define SENINF5_CSI2_RLR0_CON0_RLR0_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF5_CSI2_RLR0_CON0_RLR0_PRBS_SEED_2_SHIFT 24
> +#define SENINF5_CSI2_RLR0_CON0_RLR0_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF5_CSI2_RLR1_CON0                                 0x4A5C
> +#define SENINF5_CSI2_RLR1_CON0_RLR1_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF5_CSI2_RLR1_CON0_RLR1_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF5_CSI2_RLR1_CON0_RLR1_PRBS_SEED_0_SHIFT 8
> +#define SENINF5_CSI2_RLR1_CON0_RLR1_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF5_CSI2_RLR1_CON0_RLR1_PRBS_SEED_1_SHIFT 16
> +#define SENINF5_CSI2_RLR1_CON0_RLR1_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF5_CSI2_RLR1_CON0_RLR1_PRBS_SEED_2_SHIFT 24
> +#define SENINF5_CSI2_RLR1_CON0_RLR1_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF5_CSI2_RLR2_CON0                                 0x4A60
> +#define SENINF5_CSI2_RLR2_CON0_RLR2_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF5_CSI2_RLR2_CON0_RLR2_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF5_CSI2_RLR2_CON0_RLR2_PRBS_SEED_0_SHIFT 8
> +#define SENINF5_CSI2_RLR2_CON0_RLR2_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF5_CSI2_RLR2_CON0_RLR2_PRBS_SEED_1_SHIFT 16
> +#define SENINF5_CSI2_RLR2_CON0_RLR2_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF5_CSI2_RLR2_CON0_RLR2_PRBS_SEED_2_SHIFT 24
> +#define SENINF5_CSI2_RLR2_CON0_RLR2_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF5_CSI2_RLR_CON0                                  0x4A64
> +#define SENINF5_CSI2_RLR_CON0_RLRN_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF5_CSI2_RLR_CON0_RLRN_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF5_CSI2_RLR_CON0_RLRN_PRBS_SEED_0_SHIFT 8
> +#define SENINF5_CSI2_RLR_CON0_RLRN_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF5_CSI2_RLR_CON0_RLRN_PRBS_SEED_1_SHIFT 16
> +#define SENINF5_CSI2_RLR_CON0_RLRN_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF5_CSI2_RLR_CON0_RLRN_PRBS_SEED_2_SHIFT 24
> +#define SENINF5_CSI2_RLR_CON0_RLRN_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF5_CSI2_MUX_CON                                   0x4A68
> +#define SENINF5_CSI2_MUX_CON_DPHY_RX_EXTERNAL_EN_SHIFT 0
> +#define SENINF5_CSI2_MUX_CON_DPHY_RX_EXTERNAL_EN_MASK (0x1 << 0)
> +#define SENINF5_CSI2_MUX_CON_CPHY_TX_EXTERNAL_EN_SHIFT 1
> +#define SENINF5_CSI2_MUX_CON_CPHY_TX_EXTERNAL_EN_MASK (0x1 << 1)
> +#define SENINF5_CSI2_MUX_CON_CPHY_RX_EXTERNAL_EN_SHIFT 2
> +#define SENINF5_CSI2_MUX_CON_CPHY_RX_EXTERNAL_EN_MASK (0x1 << 2)
> +#define SENINF5_CSI2_MUX_CON_RLR_PATTERN_DELAY_EN_SHIFT 3
> +#define SENINF5_CSI2_MUX_CON_RLR_PATTERN_DELAY_EN_MASK (0x1 << 3)
> +#define SENINF5_CSI2_MUX_CON_POST_PACKET_IGNORE_EN_SHIFT 4
> +#define SENINF5_CSI2_MUX_CON_POST_PACKET_IGNORE_EN_MASK (0x1 << 4)
> +#define SENINF5_CSI2_DETECT_DBG0                               0x4A6C
> +#define SENINF5_CSI2_DETECT_DBG0_DETECT_SYNC_LANE0_ST_SHIFT 0
> +#define SENINF5_CSI2_DETECT_DBG0_DETECT_SYNC_LANE0_ST_MASK (0x1 << 0)
> +#define SENINF5_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE0_ST_SHIFT 1
> +#define SENINF5_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE0_ST_MASK (0x1 << 1)
> +#define SENINF5_CSI2_DETECT_DBG0_DETECT_POST_LANE0_ST_SHIFT 2
> +#define SENINF5_CSI2_DETECT_DBG0_DETECT_POST_LANE0_ST_MASK (0x1 << 2)
> +#define SENINF5_CSI2_DETECT_DBG0_POSITION_SYNC_LANE0_ST_SHIFT 3
> +#define SENINF5_CSI2_DETECT_DBG0_POSITION_SYNC_LANE0_ST_MASK (0xf << 3)
> +#define SENINF5_CSI2_DETECT_DBG0_POSITION_ESCAPE_LANE0_ST_SHIFT 7
> +#define SENINF5_CSI2_DETECT_DBG0_POSITION_ESCAPE_LANE0_ST_MASK (0xf << 7)
> +#define SENINF5_CSI2_DETECT_DBG0_DETECT_SYNC_LANE1_ST_SHIFT 12
> +#define SENINF5_CSI2_DETECT_DBG0_DETECT_SYNC_LANE1_ST_MASK (0x1 << 12)
> +#define SENINF5_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE1_ST_SHIFT 13
> +#define SENINF5_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE1_ST_MASK (0x1 << 13)
> +#define SENINF5_CSI2_DETECT_DBG0_DETECT_POST_LANE1_ST_SHIFT 14
> +#define SENINF5_CSI2_DETECT_DBG0_DETECT_POST_LANE1_ST_MASK (0x1 << 14)
> +#define SENINF5_CSI2_DETECT_DBG0_POSITION_SYNC_LANE1_ST_SHIFT 15
> +#define SENINF5_CSI2_DETECT_DBG0_POSITION_SYNC_LANE1_ST_MASK (0xf << 15)
> +#define SENINF5_CSI2_DETECT_DBG0_POSITION_ESCAPE_LANE1_ST_SHIFT 19
> +#define SENINF5_CSI2_DETECT_DBG0_POSITION_ESCAPE_LANE1_ST_MASK (0xf << 19)
> +#define SENINF5_CSI2_DETECT_DBG0_DETECT_SYNC_LANE2_ST_SHIFT 24
> +#define SENINF5_CSI2_DETECT_DBG0_DETECT_SYNC_LANE2_ST_MASK (0x1 << 24)
> +#define SENINF5_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE2_ST_SHIFT 25
> +#define SENINF5_CSI2_DETECT_DBG0_DETECT_ESCAPE_LANE2_ST_MASK (0x1 << 25)
> +#define SENINF5_CSI2_DETECT_DBG0_DETECT_POST_LANE2_ST_SHIFT 26
> +#define SENINF5_CSI2_DETECT_DBG0_DETECT_POST_LANE2_ST_MASK (0x1 << 26)
> +#define SENINF5_CSI2_DETECT_DBG0_POSITION_SYNC_LANE2_ST_SHIFT 27
> +#define SENINF5_CSI2_DETECT_DBG0_POSITION_SYNC_LANE2_ST_MASK (0xf << 27)
> +#define SENINF5_CSI2_DETECT_DBG1                               0x4A70
> +#define SENINF5_CSI2_DETECT_DBG1_POSITION_ESCAPE_LANE2_ST_SHIFT 0
> +#define SENINF5_CSI2_DETECT_DBG1_POSITION_ESCAPE_LANE2_ST_MASK (0xf << 0)
> +#define SENINF5_CSI2_RESYNC_MERGE_CTL                          0x4A74
> +#define SENINF5_CSI2_RESYNC_MERGE_CTL_CPHY_LANE_RESYNC_CNT_SHIFT 0
> +#define SENINF5_CSI2_RESYNC_MERGE_CTL_CPHY_LANE_RESYNC_CNT_MASK (0x7 << 0)
> +#define SENINF5_CSI2_RESYNC_MERGE_CTL_LANE_RESYNC_FLUSH_EN_SHIFT 8
> +#define SENINF5_CSI2_RESYNC_MERGE_CTL_LANE_RESYNC_FLUSH_EN_MASK (0x1 << 8)
> +#define SENINF5_CSI2_RESYNC_MERGE_CTL_LANE_RESYNC_DATAOUT_OPTION_SHIFT 9
> +#define SENINF5_CSI2_RESYNC_MERGE_CTL_LANE_RESYNC_DATAOUT_OPTION_MASK \
> +(0x1 << 9)
> +#define SENINF5_CSI2_RESYNC_MERGE_CTL_BYPASS_LANE_RESYNC_SHIFT 10
> +#define SENINF5_CSI2_RESYNC_MERGE_CTL_BYPASS_LANE_RESYNC_MASK (0x1 << 10)
> +#define SENINF5_CSI2_RESYNC_MERGE_CTL_CDPHY_SEL_SHIFT 11
> +#define SENINF5_CSI2_RESYNC_MERGE_CTL_CDPHY_SEL_MASK (0x1 << 11)
> +#define SENINF5_CSI2_CTRL_TRIO_MUX                             0x4A78
> +#define SENINF5_CSI2_CTRL_TRIO_MUX_TRIO0_MUX_SHIFT 0
> +#define SENINF5_CSI2_CTRL_TRIO_MUX_TRIO0_MUX_MASK (0x7 << 0)
> +#define SENINF5_CSI2_CTRL_TRIO_MUX_TRIO1_MUX_SHIFT 3
> +#define SENINF5_CSI2_CTRL_TRIO_MUX_TRIO1_MUX_MASK (0x7 << 3)
> +#define SENINF5_CSI2_CTRL_TRIO_MUX_TRIO2_MUX_SHIFT 6
> +#define SENINF5_CSI2_CTRL_TRIO_MUX_TRIO2_MUX_MASK (0x7 << 6)
> +#define SENINF5_CSI2_CTRL_TRIO_MUX_TRIO3_MUX_SHIFT 9
> +#define SENINF5_CSI2_CTRL_TRIO_MUX_TRIO3_MUX_MASK (0x7 << 9)
> +#define SENINF5_CSI2_CTRL_TRIO_CON                             0x4A7C
> +#define SENINF5_CSI2_CTRL_TRIO_CON_TRIO0_LPRX_EN_SHIFT 0
> +#define SENINF5_CSI2_CTRL_TRIO_CON_TRIO0_LPRX_EN_MASK (0x1 << 0)
> +#define SENINF5_CSI2_CTRL_TRIO_CON_TRIO0_HSRX_EN_SHIFT 1
> +#define SENINF5_CSI2_CTRL_TRIO_CON_TRIO0_HSRX_EN_MASK (0x1 << 1)
> +#define SENINF5_CSI2_CTRL_TRIO_CON_TRIO1_LPRX_EN_SHIFT 2
> +#define SENINF5_CSI2_CTRL_TRIO_CON_TRIO1_LPRX_EN_MASK (0x1 << 2)
> +#define SENINF5_CSI2_CTRL_TRIO_CON_TRIO1_HSRX_EN_SHIFT 3
> +#define SENINF5_CSI2_CTRL_TRIO_CON_TRIO1_HSRX_EN_MASK (0x1 << 3)
> +#define SENINF5_CSI2_CTRL_TRIO_CON_TRIO2_LPRX_EN_SHIFT 4
> +#define SENINF5_CSI2_CTRL_TRIO_CON_TRIO2_LPRX_EN_MASK (0x1 << 4)
> +#define SENINF5_CSI2_CTRL_TRIO_CON_TRIO2_HSRX_EN_SHIFT 5
> +#define SENINF5_CSI2_CTRL_TRIO_CON_TRIO2_HSRX_EN_MASK (0x1 << 5)
> +#define SENINF5_CSI2_CTRL_TRIO_CON_TRIO3_LPRX_EN_SHIFT 6
> +#define SENINF5_CSI2_CTRL_TRIO_CON_TRIO3_LPRX_EN_MASK (0x1 << 6)
> +#define SENINF5_CSI2_CTRL_TRIO_CON_TRIO3_HSRX_EN_SHIFT 7
> +#define SENINF5_CSI2_CTRL_TRIO_CON_TRIO3_HSRX_EN_MASK (0x1 << 7)
> +#define SENINF5_FIX_ADDR_CPHY0_DBG                             0x4A80
> +#define SENINF5_FIX_ADDR_CPHY0_DBG_ERROR_COUNT_CPHY0_SHIFT 16
> +#define SENINF5_FIX_ADDR_CPHY0_DBG_ERROR_COUNT_CPHY0_MASK (0xff << 16)
> +#define SENINF5_FIX_ADDR_CPHY0_DBG_WORD_COUNT_OVER_FLOAT_CPHY0_SHIFT 24
> +#define SENINF5_FIX_ADDR_CPHY0_DBG_WORD_COUNT_OVER_FLOAT_CPHY0_MASK (0x1 << 24)
> +#define SENINF5_FIX_ADDR_CPHY1_DBG                             0x4A84
> +#define SENINF5_FIX_ADDR_CPHY1_DBG_ERROR_COUNT_CPHY1_SHIFT 16
> +#define SENINF5_FIX_ADDR_CPHY1_DBG_ERROR_COUNT_CPHY1_MASK (0xff << 16)
> +#define SENINF5_FIX_ADDR_CPHY1_DBG_WORD_COUNT_OVER_FLOAT_CPHY1_SHIFT 24
> +#define SENINF5_FIX_ADDR_CPHY1_DBG_WORD_COUNT_OVER_FLOAT_CPHY1_MASK (0x1 << 24)
> +#define SENINF5_FIX_ADDR_CPHY2_DBG                             0x4A88
> +#define SENINF5_FIX_ADDR_CPHY2_DBG_ERROR_COUNT_CPHY2_SHIFT 16
> +#define SENINF5_FIX_ADDR_CPHY2_DBG_ERROR_COUNT_CPHY2_MASK (0xff << 16)
> +#define SENINF5_FIX_ADDR_CPHY2_DBG_WORD_COUNT_OVER_FLOAT_CPHY2_SHIFT 24
> +#define SENINF5_FIX_ADDR_CPHY2_DBG_WORD_COUNT_OVER_FLOAT_CPHY2_MASK (0x1 << 24)
> +#define SENINF5_FIX_ADDR_DBG                                   0x4A8C
> +#define SENINF5_FIX_ADDR_DBG_ERROR_COUNT_SHIFT 16
> +#define SENINF5_FIX_ADDR_DBG_ERROR_COUNT_MASK  (0xff << 16)
> +#define SENINF5_FIX_ADDR_DBG_WORD_COUNT_OVER_FLOAT_SHIFT 24
> +#define SENINF5_FIX_ADDR_DBG_WORD_COUNT_OVER_FLOAT_MASK (0x1 << 24)
> +#define SENINF5_WIRE_STATE_DECODE_CPHY0_DBG0                   0x4A90
> +#define SENINF5_WIRE_STATE_DECODE_CPHY0_DBG0_SYMBOL_STREAM0_CPHY0_SHIFT 0
> +#define SENINF5_WIRE_STATE_DECODE_CPHY0_DBG0_SYMBOL_STREAM0_CPHY0_MASK \
> +(0xffffffff << 0)
> +#define SENINF5_WIRE_STATE_DECODE_CPHY0_DBG1                   0x4A94
> +#define SENINF5_WIRE_STATE_DECODE_CPHY0_DBG1_SYMBOL_STREAM1_CPHY0_SHIFT 0
> +#define SENINF5_WIRE_STATE_DECODE_CPHY0_DBG1_SYMBOL_STREAM1_CPHY0_MASK \
> +(0x3ff << 0)
> +#define SENINF5_WIRE_STATE_DECODE_CPHY0_DBG1_SYMBOL_STREAM_VALID_CPHY0_SHIFT 10
> +#define SENINF5_WIRE_STATE_DECODE_CPHY0_DBG1_SYMBOL_STREAM_VALID_CPHY0_MASK \
> +(0x1 << 10)
> +#define SENINF5_WIRE_STATE_DECODE_CPHY1_DBG0                   0x4A98
> +#define SENINF5_WIRE_STATE_DECODE_CPHY1_DBG0_SYMBOL_STREAM0_CPHY1_SHIFT 0
> +#define SENINF5_WIRE_STATE_DECODE_CPHY1_DBG0_SYMBOL_STREAM0_CPHY1_MASK \
> +(0xffffffff << 0)
> +#define SENINF5_WIRE_STATE_DECODE_CPHY1_DBG1                   0x4A9C
> +#define SENINF5_WIRE_STATE_DECODE_CPHY1_DBG1_SYMBOL_STREAM1_CPHY1_SHIFT 0
> +#define SENINF5_WIRE_STATE_DECODE_CPHY1_DBG1_SYMBOL_STREAM1_CPHY1_MASK \
> +(0x3ff << 0)
> +#define SENINF5_WIRE_STATE_DECODE_CPHY1_DBG1_SYMBOL_STREAM_VALID_CPHY1_SHIFT 10
> +#define SENINF5_WIRE_STATE_DECODE_CPHY1_DBG1_SYMBOL_STREAM_VALID_CPHY1_MASK \
> +(0x1 << 10)
> +#define SENINF5_WIRE_STATE_DECODE_CPHY2_DBG0                   0x4AA0
> +#define SENINF5_WIRE_STATE_DECODE_CPHY2_DBG0_SYMBOL_STREAM0_CPHY2_SHIFT 0
> +#define SENINF5_WIRE_STATE_DECODE_CPHY2_DBG0_SYMBOL_STREAM0_CPHY2_MASK \
> +(0xffffffff << 0)
> +#define SENINF5_WIRE_STATE_DECODE_CPHY2_DBG1                   0x4AA4
> +#define SENINF5_WIRE_STATE_DECODE_CPHY2_DBG1_SYMBOL_STREAM1_CPHY2_SHIFT 0
> +#define SENINF5_WIRE_STATE_DECODE_CPHY2_DBG1_SYMBOL_STREAM1_CPHY2_MASK \
> +(0x3ff << 0)
> +#define SENINF5_WIRE_STATE_DECODE_CPHY2_DBG1_SYMBOL_STREAM_VALID_CPHY2_SHIFT 10
> +#define SENINF5_WIRE_STATE_DECODE_CPHY2_DBG1_SYMBOL_STREAM_VALID_CPHY2_MASK \
> +(0x1 << 10)
> +#define SENINF5_SYNC_RESYNC_CTL                                0x4AA8
> +#define SENINF5_SYNC_RESYNC_CTL_SYNC_DETECTION_SEL_SHIFT 0
> +#define SENINF5_SYNC_RESYNC_CTL_SYNC_DETECTION_SEL_MASK (0x7 << 0)
> +#define SENINF5_SYNC_RESYNC_CTL_FLUSH_VALID_SHIFT 3
> +#define SENINF5_SYNC_RESYNC_CTL_FLUSH_VALID_MASK (0x1 << 3)
> +#define SENINF5_POST_DETECT_CTL                                0x4AAC
> +#define SENINF5_POST_DETECT_CTL_POST_DETECT_DISABLE_SHIFT 0
> +#define SENINF5_POST_DETECT_CTL_POST_DETECT_DISABLE_MASK (0x1 << 0)
> +#define SENINF5_POST_DETECT_CTL_POST_EN_SHIFT  1
> +#define SENINF5_POST_DETECT_CTL_POST_EN_MASK   (0x1 << 1)
> +#define SENINF5_WIRE_STATE_DECODE_CONFIG                       0x4AB0
> +#define SENINF5_WIRE_STATE_DECODE_CONFIG_INIT_STATE_DECODE_SHIFT 0
> +#define SENINF5_WIRE_STATE_DECODE_CONFIG_INIT_STATE_DECODE_MASK (0x7 << 0)
> +#define SENINF5_CSI2_CPHY_LNRD_FSM                             0x4AB4
> +#define SENINF5_CSI2_CPHY_LNRD_FSM_TRIO0_RX_FSM_SHIFT 8
> +#define SENINF5_CSI2_CPHY_LNRD_FSM_TRIO0_RX_FSM_MASK (0x7f << 8)
> +#define SENINF5_CSI2_CPHY_LNRD_FSM_TRIO1_RX_FSM_SHIFT 16
> +#define SENINF5_CSI2_CPHY_LNRD_FSM_TRIO1_RX_FSM_MASK (0x7f << 16)
> +#define SENINF5_CSI2_CPHY_LNRD_FSM_TRIO2_RX_FSM_SHIFT 24
> +#define SENINF5_CSI2_CPHY_LNRD_FSM_TRIO2_RX_FSM_MASK (0x7f << 24)
> +#define SENINF5_FIX_ADDR_CPHY0_DBG0                            0x4AB8
> +#define SENINF5_FIX_ADDR_CPHY0_DBG0_WORD_COUNT_CPHY0_DBG0_SHIFT 0
> +#define SENINF5_FIX_ADDR_CPHY0_DBG0_WORD_COUNT_CPHY0_DBG0_MASK (0xffffffff << 0)
> +#define SENINF5_FIX_ADDR_CPHY0_DBG1                            0x4ABC
> +#define SENINF5_FIX_ADDR_CPHY0_DBG1_WORD_COUNT_CPHY0_DBG1_SHIFT 0
> +#define SENINF5_FIX_ADDR_CPHY0_DBG1_WORD_COUNT_CPHY0_DBG1_MASK (0xffff << 0)
> +#define SENINF5_FIX_ADDR_CPHY0_DBG1_ERROR_RECORD_CPHY0_DBG0_SHIFT 16
> +#define SENINF5_FIX_ADDR_CPHY0_DBG1_ERROR_RECORD_CPHY0_DBG0_MASK (0xffff << 16)
> +#define SENINF5_FIX_ADDR_CPHY0_DBG2                            0x4AC0
> +#define SENINF5_FIX_ADDR_CPHY0_DBG2_ERROR_RECORD_CPHY0_DBG1_SHIFT 0
> +#define SENINF5_FIX_ADDR_CPHY0_DBG2_ERROR_RECORD_CPHY0_DBG1_MASK \
> +(0xffffffff << 0)
> +#define SENINF5_FIX_ADDR_CPHY1_DBG0                            0x4AC4
> +#define SENINF5_FIX_ADDR_CPHY1_DBG0_WORD_COUNT_CPHY1_DBG0_SHIFT 0
> +#define SENINF5_FIX_ADDR_CPHY1_DBG0_WORD_COUNT_CPHY1_DBG0_MASK (0xffffffff << 0)
> +#define SENINF5_FIX_ADDR_CPHY1_DBG1                            0x4AC8
> +#define SENINF5_FIX_ADDR_CPHY1_DBG1_WORD_COUNT_CPHY1_DBG1_SHIFT 0
> +#define SENINF5_FIX_ADDR_CPHY1_DBG1_WORD_COUNT_CPHY1_DBG1_MASK (0xffff << 0)
> +#define SENINF5_FIX_ADDR_CPHY1_DBG1_ERROR_RECORD_CPHY1_DBG0_SHIFT 16
> +#define SENINF5_FIX_ADDR_CPHY1_DBG1_ERROR_RECORD_CPHY1_DBG0_MASK (0xffff << 16)
> +#define SENINF5_FIX_ADDR_CPHY1_DBG2                            0x4ACC
> +#define SENINF5_FIX_ADDR_CPHY1_DBG2_ERROR_RECORD_CPHY1_DBG1_SHIFT 0
> +#define SENINF5_FIX_ADDR_CPHY1_DBG2_ERROR_RECORD_CPHY1_DBG1_MASK \
> +(0xffffffff << 0)
> +#define SENINF5_FIX_ADDR_CPHY2_DBG0                            0x4AD0
> +#define SENINF5_FIX_ADDR_CPHY2_DBG0_WORD_COUNT_CPHY2_DBG0_SHIFT 0
> +#define SENINF5_FIX_ADDR_CPHY2_DBG0_WORD_COUNT_CPHY2_DBG0_MASK (0xffffffff << 0)
> +#define SENINF5_FIX_ADDR_CPHY2_DBG1                            0x4AD4
> +#define SENINF5_FIX_ADDR_CPHY2_DBG1_WORD_COUNT_CPHY2_DBG1_SHIFT 0
> +#define SENINF5_FIX_ADDR_CPHY2_DBG1_WORD_COUNT_CPHY2_DBG1_MASK (0xffff << 0)
> +#define SENINF5_FIX_ADDR_CPHY2_DBG1_ERROR_RECORD_CPHY2_DBG0_SHIFT 16
> +#define SENINF5_FIX_ADDR_CPHY2_DBG1_ERROR_RECORD_CPHY2_DBG0_MASK (0xffff << 16)
> +#define SENINF5_FIX_ADDR_CPHY2_DBG2                            0x4AD8
> +#define SENINF5_FIX_ADDR_CPHY2_DBG2_ERROR_RECORD_CPHY2_DBG1_SHIFT 0
> +#define SENINF5_FIX_ADDR_CPHY2_DBG2_ERROR_RECORD_CPHY2_DBG1_MASK \
> +(0xffffffff << 0)
> +#define SENINF5_FIX_ADDR_DBG0                                  0x4ADC
> +#define SENINF5_FIX_ADDR_DBG0_WORD_COUNT_DBG0_SHIFT 0
> +#define SENINF5_FIX_ADDR_DBG0_WORD_COUNT_DBG0_MASK (0xffffffff << 0)
> +#define SENINF5_FIX_ADDR_DBG1                                  0x4AE0
> +#define SENINF5_FIX_ADDR_DBG1_WORD_COUNT_DBG1_SHIFT 0
> +#define SENINF5_FIX_ADDR_DBG1_WORD_COUNT_DBG1_MASK (0xffff << 0)
> +#define SENINF5_FIX_ADDR_DBG1_ERROR_RECORD_DBG0_SHIFT 16
> +#define SENINF5_FIX_ADDR_DBG1_ERROR_RECORD_DBG0_MASK (0xffff << 16)
> +#define SENINF5_FIX_ADDR_DBG2                                  0x4AE4
> +#define SENINF5_FIX_ADDR_DBG2_ERROR_RECORD_DBG1_SHIFT 0
> +#define SENINF5_FIX_ADDR_DBG2_ERROR_RECORD_DBG1_MASK (0xffffffff << 0)
> +#define SENINF5_CSI2_MODE                                      0x4AE8
> +#define SENINF5_CSI2_MODE_CSR_CSI2_MODE_SHIFT  0
> +#define SENINF5_CSI2_MODE_CSR_CSI2_MODE_MASK   (0xff << 0)
> +#define SENINF5_CSI2_MODE_CSR_CSI2_HEADER_LEN_SHIFT 8
> +#define SENINF5_CSI2_MODE_CSR_CSI2_HEADER_LEN_MASK (0x7 << 8)
> +#define SENINF5_CSI2_MODE_CSR_CPHY_DI_POS_SHIFT 16
> +#define SENINF5_CSI2_MODE_CSR_CPHY_DI_POS_MASK (0xff << 16)
> +#define SENINF5_CSI2_MODE_CSR_CPHY_WC_POS_SHIFT 24
> +#define SENINF5_CSI2_MODE_CSR_CPHY_WC_POS_MASK (0xff << 24)
> +#define SENINF5_CSI2_DI_EXT                                    0x4AF0
> +#define SENINF5_CSI2_DI_EXT_VC4_SHIFT          0
> +#define SENINF5_CSI2_DI_EXT_VC4_MASK           (0x3 << 0)
> +#define SENINF5_CSI2_DI_EXT_DT4_SHIFT          2
> +#define SENINF5_CSI2_DI_EXT_DT4_MASK           (0x3f << 2)
> +#define SENINF5_CSI2_DI_EXT_VC5_SHIFT          8
> +#define SENINF5_CSI2_DI_EXT_VC5_MASK           (0x3 << 8)
> +#define SENINF5_CSI2_DI_EXT_DT5_SHIFT          10
> +#define SENINF5_CSI2_DI_EXT_DT5_MASK           (0x3f << 10)
> +#define SENINF5_CSI2_DI_CTRL_EXT                               0x4AF4
> +#define SENINF5_CSI2_DI_CTRL_EXT_VC4_INTERLEAVING_SHIFT 0
> +#define SENINF5_CSI2_DI_CTRL_EXT_VC4_INTERLEAVING_MASK (0x1 << 0)
> +#define SENINF5_CSI2_DI_CTRL_EXT_DT4_INTERLEAVING_SHIFT 1
> +#define SENINF5_CSI2_DI_CTRL_EXT_DT4_INTERLEAVING_MASK (0x3 << 1)
> +#define SENINF5_CSI2_DI_CTRL_EXT_VC5_INTERLEAVING_SHIFT 8
> +#define SENINF5_CSI2_DI_CTRL_EXT_VC5_INTERLEAVING_MASK (0x1 << 8)
> +#define SENINF5_CSI2_DI_CTRL_EXT_DT5_INTERLEAVING_SHIFT 9
> +#define SENINF5_CSI2_DI_CTRL_EXT_DT5_INTERLEAVING_MASK (0x3 << 9)
> +#define SENINF5_CSI2_CPHY_LOOPBACK                             0x4AF8
> +#define SENINF5_CSI2_CPHY_LOOPBACK_TRIGGER_SYNC_INIT_SHIFT 0
> +#define SENINF5_CSI2_CPHY_LOOPBACK_TRIGGER_SYNC_INIT_MASK (0x1 << 0)
> +#define SENINF5_CSI2_CPHY_LOOPBACK_RELEASE_SYNC_INIT_SHIFT 1
> +#define SENINF5_CSI2_CPHY_LOOPBACK_RELEASE_SYNC_INIT_MASK (0x1 << 1)
> +#define SENINF5_CSI2_PROGSEQ_0                                 0x4B00
> +#define SENINF5_CSI2_PROGSEQ_0_PROGSEQ_S0_SHIFT 0
> +#define SENINF5_CSI2_PROGSEQ_0_PROGSEQ_S0_MASK (0x7 << 0)
> +#define SENINF5_CSI2_PROGSEQ_0_PROGSEQ_S1_SHIFT 4
> +#define SENINF5_CSI2_PROGSEQ_0_PROGSEQ_S1_MASK (0x7 << 4)
> +#define SENINF5_CSI2_PROGSEQ_0_PROGSEQ_S2_SHIFT 8
> +#define SENINF5_CSI2_PROGSEQ_0_PROGSEQ_S2_MASK (0x7 << 8)
> +#define SENINF5_CSI2_PROGSEQ_0_PROGSEQ_S3_SHIFT 12
> +#define SENINF5_CSI2_PROGSEQ_0_PROGSEQ_S3_MASK (0x7 << 12)
> +#define SENINF5_CSI2_PROGSEQ_0_PROGSEQ_S4_SHIFT 16
> +#define SENINF5_CSI2_PROGSEQ_0_PROGSEQ_S4_MASK (0x7 << 16)
> +#define SENINF5_CSI2_PROGSEQ_0_PROGSEQ_S5_SHIFT 20
> +#define SENINF5_CSI2_PROGSEQ_0_PROGSEQ_S5_MASK (0x7 << 20)
> +#define SENINF5_CSI2_PROGSEQ_0_PROGSEQ_S6_SHIFT 24
> +#define SENINF5_CSI2_PROGSEQ_0_PROGSEQ_S6_MASK (0x7 << 24)
> +#define SENINF5_CSI2_PROGSEQ_0_PROGSEQ_S7_SHIFT 28
> +#define SENINF5_CSI2_PROGSEQ_0_PROGSEQ_S7_MASK (0x7 << 28)
> +#define SENINF5_CSI2_PROGSEQ_1                                 0x4B04
> +#define SENINF5_CSI2_PROGSEQ_1_PROGSEQ_S8_SHIFT 0
> +#define SENINF5_CSI2_PROGSEQ_1_PROGSEQ_S8_MASK (0x7 << 0)
> +#define SENINF5_CSI2_PROGSEQ_1_PROGSEQ_S9_SHIFT 4
> +#define SENINF5_CSI2_PROGSEQ_1_PROGSEQ_S9_MASK (0x7 << 4)
> +#define SENINF5_CSI2_PROGSEQ_1_PROGSEQ_S10_SHIFT 8
> +#define SENINF5_CSI2_PROGSEQ_1_PROGSEQ_S10_MASK (0x7 << 8)
> +#define SENINF5_CSI2_PROGSEQ_1_PROGSEQ_S11_SHIFT 12
> +#define SENINF5_CSI2_PROGSEQ_1_PROGSEQ_S11_MASK (0x7 << 12)
> +#define SENINF5_CSI2_PROGSEQ_1_PROGSEQ_S12_SHIFT 16
> +#define SENINF5_CSI2_PROGSEQ_1_PROGSEQ_S12_MASK (0x7 << 16)
> +#define SENINF5_CSI2_PROGSEQ_1_PROGSEQ_S13_SHIFT 20
> +#define SENINF5_CSI2_PROGSEQ_1_PROGSEQ_S13_MASK (0x7 << 20)
> +#define SENINF5_CSI2_INT_EN_EXT                                0x4B10
> +#define SENINF5_CSI2_INT_EN_EXT_DPHY0_RESYNC_FIFO_OVERFLOW_SHIFT 1
> +#define SENINF5_CSI2_INT_EN_EXT_DPHY0_RESYNC_FIFO_OVERFLOW_MASK (0x1 << 1)
> +#define SENINF5_CSI2_INT_EN_EXT_DPHY1_RESYNC_FIFO_OVERFLOW_SHIFT 2
> +#define SENINF5_CSI2_INT_EN_EXT_DPHY1_RESYNC_FIFO_OVERFLOW_MASK (0x1 << 2)
> +#define SENINF5_CSI2_INT_EN_EXT_DPHY2_RESYNC_FIFO_OVERFLOW_SHIFT 3
> +#define SENINF5_CSI2_INT_EN_EXT_DPHY2_RESYNC_FIFO_OVERFLOW_MASK (0x1 << 3)
> +#define SENINF5_CSI2_INT_EN_EXT_DPHY3_RESYNC_FIFO_OVERFLOW_SHIFT 4
> +#define SENINF5_CSI2_INT_EN_EXT_DPHY3_RESYNC_FIFO_OVERFLOW_MASK (0x1 << 4)
> +#define SENINF5_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO0_SHIFT 8
> +#define SENINF5_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO0_MASK (0x1 << 8)
> +#define SENINF5_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO1_SHIFT 9
> +#define SENINF5_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO1_MASK (0x1 << 9)
> +#define SENINF5_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO2_SHIFT 10
> +#define SENINF5_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO2_MASK (0x1 << 10)
> +#define SENINF5_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO3_SHIFT 11
> +#define SENINF5_CSI2_INT_EN_EXT_ERR_SOT_SYNC_HS_TRIO3_MASK (0x1 << 11)
> +#define SENINF5_CSI2_INT_EN_EXT_INT_WCLR_EN_SHIFT 31
> +#define SENINF5_CSI2_INT_EN_EXT_INT_WCLR_EN_MASK (0x1 << 31)
> +#define SENINF5_CSI2_INT_STATUS_EXT                            0x4B14
> +#define SENINF5_CSI2_INT_STATUS_EXT_DPHY0_RESYNC_FIFO_OVERFLOW_STA_SHIFT 1
> +#define SENINF5_CSI2_INT_STATUS_EXT_DPHY0_RESYNC_FIFO_OVERFLOW_STA_MASK \
> +(0x1 << 1)
> +#define SENINF5_CSI2_INT_STATUS_EXT_DPHY1_RESYNC_FIFO_OVERFLOW_STA_SHIFT 2
> +#define SENINF5_CSI2_INT_STATUS_EXT_DPHY1_RESYNC_FIFO_OVERFLOW_STA_MASK \
> +(0x1 << 2)
> +#define SENINF5_CSI2_INT_STATUS_EXT_DPHY2_RESYNC_FIFO_OVERFLOW_STA_SHIFT 3
> +#define SENINF5_CSI2_INT_STATUS_EXT_DPHY2_RESYNC_FIFO_OVERFLOW_STA_MASK \
> +(0x1 << 3)
> +#define SENINF5_CSI2_INT_STATUS_EXT_DPHY3_RESYNC_FIFO_OVERFLOW_STA_SHIFT 4
> +#define SENINF5_CSI2_INT_STATUS_EXT_DPHY3_RESYNC_FIFO_OVERFLOW_STA_MASK \
> +(0x1 << 4)
> +#define SENINF5_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO0_SHIFT 8
> +#define SENINF5_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO0_MASK (0x1 << 8)
> +#define SENINF5_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO1_SHIFT 9
> +#define SENINF5_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO1_MASK (0x1 << 9)
> +#define SENINF5_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO2_SHIFT 10
> +#define SENINF5_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO2_MASK (0x1 << 10)
> +#define SENINF5_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO3_SHIFT 11
> +#define SENINF5_CSI2_INT_STATUS_EXT_ERR_SOT_SYNC_HS_TRIO3_MASK (0x1 << 11)
> +#define SENINF5_CSI2_CPHY_FIX_POINT_RST                        0x4B18
> +#define SENINF5_CSI2_CPHY_FIX_POINT_RST_CPHY_FIX_POINT_RST_SHIFT 0
> +#define SENINF5_CSI2_CPHY_FIX_POINT_RST_CPHY_FIX_POINT_RST_MASK (0x1 << 0)
> +#define SENINF5_CSI2_CPHY_FIX_POINT_RST_CPHY_FIX_POINT_RST_MODE_SHIFT 1
> +#define SENINF5_CSI2_CPHY_FIX_POINT_RST_CPHY_FIX_POINT_RST_MODE_MASK (0x1 << 1)
> +#define SENINF5_CSI2_RLR3_CON0                                 0x4B1C
> +#define SENINF5_CSI2_RLR3_CON0_RLR3_PRBS_PATTERN_SEL_SHIFT 0
> +#define SENINF5_CSI2_RLR3_CON0_RLR3_PRBS_PATTERN_SEL_MASK (0xff << 0)
> +#define SENINF5_CSI2_RLR3_CON0_RLR3_PRBS_SEED_0_SHIFT 8
> +#define SENINF5_CSI2_RLR3_CON0_RLR3_PRBS_SEED_0_MASK (0xff << 8)
> +#define SENINF5_CSI2_RLR3_CON0_RLR3_PRBS_SEED_1_SHIFT 16
> +#define SENINF5_CSI2_RLR3_CON0_RLR3_PRBS_SEED_1_MASK (0xff << 16)
> +#define SENINF5_CSI2_RLR3_CON0_RLR3_PRBS_SEED_2_SHIFT 24
> +#define SENINF5_CSI2_RLR3_CON0_RLR3_PRBS_SEED_2_MASK (0xff << 24)
> +#define SENINF5_CSI2_DPHY_SYNC                                 0x4B20
> +#define SENINF5_CSI2_DPHY_SYNC_SYNC_SEQ_MASK_0_SHIFT 0
> +#define SENINF5_CSI2_DPHY_SYNC_SYNC_SEQ_MASK_0_MASK (0xffff << 0)
> +#define SENINF5_CSI2_DPHY_SYNC_SYNC_SEQ_PAT_0_SHIFT 16
> +#define SENINF5_CSI2_DPHY_SYNC_SYNC_SEQ_PAT_0_MASK (0xffff << 16)
> +#define SENINF5_CSI2_DESKEW_SYNC                               0x4B24
> +#define SENINF5_CSI2_DESKEW_SYNC_SYNC_SEQ_MASK_1_SHIFT 0
> +#define SENINF5_CSI2_DESKEW_SYNC_SYNC_SEQ_MASK_1_MASK (0xffff << 0)
> +#define SENINF5_CSI2_DESKEW_SYNC_SYNC_SEQ_PAT_1_SHIFT 16
> +#define SENINF5_CSI2_DESKEW_SYNC_SYNC_SEQ_PAT_1_MASK (0xffff << 16)
> +#define SENINF5_CSI2_DETECT_DBG2                               0x4B28
> +#define SENINF5_CSI2_DETECT_DBG2_DETECT_SYNC_LANE3_ST_SHIFT 0
> +#define SENINF5_CSI2_DETECT_DBG2_DETECT_SYNC_LANE3_ST_MASK (0x1 << 0)
> +#define SENINF5_CSI2_DETECT_DBG2_DETECT_ESCAPE_LANE3_ST_SHIFT 1
> +#define SENINF5_CSI2_DETECT_DBG2_DETECT_ESCAPE_LANE3_ST_MASK (0x1 << 1)
> +#define SENINF5_CSI2_DETECT_DBG2_DETECT_POST_LANE3_ST_SHIFT 2
> +#define SENINF5_CSI2_DETECT_DBG2_DETECT_POST_LANE3_ST_MASK (0x1 << 2)
> +#define SENINF5_CSI2_DETECT_DBG2_POSITION_SYNC_LANE3_ST_SHIFT 3
> +#define SENINF5_CSI2_DETECT_DBG2_POSITION_SYNC_LANE3_ST_MASK (0xf << 3)
> +#define SENINF5_CSI2_DETECT_DBG2_POSITION_ESCAPE_LANE3_ST_SHIFT 7
> +#define SENINF5_CSI2_DETECT_DBG2_POSITION_ESCAPE_LANE3_ST_MASK (0xf << 7)
> +#define SENINF5_FIX_ADDR_CPHY3_DBG0                            0x4B30
> +#define SENINF5_FIX_ADDR_CPHY3_DBG0_WORD_COUNT_CPHY3_DBG0_SHIFT 0
> +#define SENINF5_FIX_ADDR_CPHY3_DBG0_WORD_COUNT_CPHY3_DBG0_MASK (0xffffffff << 0)
> +#define SENINF5_FIX_ADDR_CPHY3_DBG1                            0x4B34
> +#define SENINF5_FIX_ADDR_CPHY3_DBG1_WORD_COUNT_CPHY3_DBG1_SHIFT 0
> +#define SENINF5_FIX_ADDR_CPHY3_DBG1_WORD_COUNT_CPHY3_DBG1_MASK (0xffff << 0)
> +#define SENINF5_FIX_ADDR_CPHY3_DBG1_ERROR_RECORD_CPHY3_DBG0_SHIFT 16
> +#define SENINF5_FIX_ADDR_CPHY3_DBG1_ERROR_RECORD_CPHY3_DBG0_MASK (0xffff << 16)
> +#define SENINF5_FIX_ADDR_CPHY3_DBG2                            0x4B38
> +#define SENINF5_FIX_ADDR_CPHY3_DBG2_ERROR_RECORD_CPHY3_DBG1_SHIFT 0
> +#define SENINF5_FIX_ADDR_CPHY3_DBG2_ERROR_RECORD_CPHY3_DBG1_MASK \
> +(0xffffffff << 0)
> +#define SENINF5_CSI2_DI_EXT_2                                  0x4B3C
> +#define SENINF5_CSI2_DI_EXT_2_VC6_SHIFT        0
> +#define SENINF5_CSI2_DI_EXT_2_VC6_MASK         (0x3 << 0)
> +#define SENINF5_CSI2_DI_EXT_2_DT6_SHIFT        2
> +#define SENINF5_CSI2_DI_EXT_2_DT6_MASK         (0x3f << 2)
> +#define SENINF5_CSI2_DI_EXT_2_VC7_SHIFT        8
> +#define SENINF5_CSI2_DI_EXT_2_VC7_MASK         (0x3 << 8)
> +#define SENINF5_CSI2_DI_EXT_2_DT7_SHIFT        10
> +#define SENINF5_CSI2_DI_EXT_2_DT7_MASK         (0x3f << 10)
> +#define SENINF5_CSI2_DI_CTRL_EXT_2                             0x4B40
> +#define SENINF5_CSI2_DI_CTRL_EXT_2_VC6_INTERLEAVING_SHIFT 0
> +#define SENINF5_CSI2_DI_CTRL_EXT_2_VC6_INTERLEAVING_MASK (0x1 << 0)
> +#define SENINF5_CSI2_DI_CTRL_EXT_2_DT6_INTERLEAVING_SHIFT 1
> +#define SENINF5_CSI2_DI_CTRL_EXT_2_DT6_INTERLEAVING_MASK (0x3 << 1)
> +#define SENINF5_CSI2_DI_CTRL_EXT_2_VC7_INTERLEAVING_SHIFT 8
> +#define SENINF5_CSI2_DI_CTRL_EXT_2_VC7_INTERLEAVING_MASK (0x1 << 8)
> +#define SENINF5_CSI2_DI_CTRL_EXT_2_DT7_INTERLEAVING_SHIFT 9
> +#define SENINF5_CSI2_DI_CTRL_EXT_2_DT7_INTERLEAVING_MASK (0x3 << 9)
> +#define SENINF5_WIRE_STATE_DECODE_CPHY3_DBG0                   0x4B44
> +#define SENINF5_WIRE_STATE_DECODE_CPHY3_DBG0_SYMBOL_STREAM0_CPHY3_SHIFT 0
> +#define SENINF5_WIRE_STATE_DECODE_CPHY3_DBG0_SYMBOL_STREAM0_CPHY3_MASK \
> +(0xffffffff << 0)
> +#define SENINF5_WIRE_STATE_DECODE_CPHY3_DBG1                   0x4B48
> +#define SENINF5_WIRE_STATE_DECODE_CPHY3_DBG1_SYMBOL_STREAM1_CPHY3_SHIFT 0
> +#define SENINF5_WIRE_STATE_DECODE_CPHY3_DBG1_SYMBOL_STREAM1_CPHY3_MASK \
> +(0x3ff << 0)
> +#define SENINF5_WIRE_STATE_DECODE_CPHY3_DBG1_SYMBOL_STREAM_VALID_CPHY3_SHIFT 10
> +#define SENINF5_WIRE_STATE_DECODE_CPHY3_DBG1_SYMBOL_STREAM_VALID_CPHY3_MASK \
> +(0x1 << 10)
> +#define SENINF5_MUX_CTRL                                       0x4D00
> +#define SENINF5_MUX_CTRL_SENINF_MUX_SW_RST_SHIFT 0
> +#define SENINF5_MUX_CTRL_SENINF_MUX_SW_RST_MASK (0x1 << 0)
> +#define SENINF5_MUX_CTRL_SENINF_IRQ_SW_RST_SHIFT 1
> +#define SENINF5_MUX_CTRL_SENINF_IRQ_SW_RST_MASK (0x1 << 1)
> +#define SENINF5_MUX_CTRL_SENINF_MUX_RDY_MODE_SHIFT 4
> +#define SENINF5_MUX_CTRL_SENINF_MUX_RDY_MODE_MASK (0x1 << 4)
> +#define SENINF5_MUX_CTRL_SENINF_MUX_RDY_VALUE_SHIFT 5
> +#define SENINF5_MUX_CTRL_SENINF_MUX_RDY_VALUE_MASK (0x1 << 5)
> +#define SENINF5_MUX_CTRL_SENINF_HSYNC_MASK_SHIFT 7
> +#define SENINF5_MUX_CTRL_SENINF_HSYNC_MASK_MASK (0x1 << 7)
> +#define SENINF5_MUX_CTRL_SENINF_PIX_SEL_SHIFT  8
> +#define SENINF5_MUX_CTRL_SENINF_PIX_SEL_MASK   (0x1 << 8)
> +#define SENINF5_MUX_CTRL_SENINF_VSYNC_POL_SHIFT 9
> +#define SENINF5_MUX_CTRL_SENINF_VSYNC_POL_MASK (0x1 << 9)
> +#define SENINF5_MUX_CTRL_SENINF_HSYNC_POL_SHIFT 10
> +#define SENINF5_MUX_CTRL_SENINF_HSYNC_POL_MASK (0x1 << 10)
> +#define SENINF5_MUX_CTRL_OVERRUN_RST_EN_SHIFT  11
> +#define SENINF5_MUX_CTRL_OVERRUN_RST_EN_MASK   (0x1 << 11)
> +#define SENINF5_MUX_CTRL_SENINF_SRC_SEL_SHIFT  12
> +#define SENINF5_MUX_CTRL_SENINF_SRC_SEL_MASK   (0xf << 12)
> +#define SENINF5_MUX_CTRL_FIFO_PUSH_EN_SHIFT    16
> +#define SENINF5_MUX_CTRL_FIFO_PUSH_EN_MASK     (0x3f << 16)
> +#define SENINF5_MUX_CTRL_FIFO_FLUSH_EN_SHIFT   22
> +#define SENINF5_MUX_CTRL_FIFO_FLUSH_EN_MASK    (0x3f << 22)
> +#define SENINF5_MUX_CTRL_FIFO_FULL_WR_EN_SHIFT 28
> +#define SENINF5_MUX_CTRL_FIFO_FULL_WR_EN_MASK  (0x3 << 28)
> +#define SENINF5_MUX_CTRL_CROP_EN_SHIFT         30
> +#define SENINF5_MUX_CTRL_CROP_EN_MASK          (0x1 << 30)
> +#define SENINF5_MUX_CTRL_SENINF_MUX_EN_SHIFT   31
> +#define SENINF5_MUX_CTRL_SENINF_MUX_EN_MASK    (0x1 << 31)
> +#define SENINF5_MUX_INTEN                                      0x4D04
> +#define SENINF5_MUX_INTEN_SENINF_OVERRUN_IRQ_EN_SHIFT 0
> +#define SENINF5_MUX_INTEN_SENINF_OVERRUN_IRQ_EN_MASK (0x1 << 0)
> +#define SENINF5_MUX_INTEN_SENINF_CRCERR_IRQ_EN_SHIFT 1
> +#define SENINF5_MUX_INTEN_SENINF_CRCERR_IRQ_EN_MASK (0x1 << 1)
> +#define SENINF5_MUX_INTEN_SENINF_FSMERR_IRQ_EN_SHIFT 2
> +#define SENINF5_MUX_INTEN_SENINF_FSMERR_IRQ_EN_MASK (0x1 << 2)
> +#define SENINF5_MUX_INTEN_SENINF_VSIZEERR_IRQ_EN_SHIFT 3
> +#define SENINF5_MUX_INTEN_SENINF_VSIZEERR_IRQ_EN_MASK (0x1 << 3)
> +#define SENINF5_MUX_INTEN_SENINF_HSIZEERR_IRQ_EN_SHIFT 4
> +#define SENINF5_MUX_INTEN_SENINF_HSIZEERR_IRQ_EN_MASK (0x1 << 4)
> +#define SENINF5_MUX_INTEN_SENINF_SENSOR_VSIZEERR_IRQ_EN_SHIFT 5
> +#define SENINF5_MUX_INTEN_SENINF_SENSOR_VSIZEERR_IRQ_EN_MASK (0x1 << 5)
> +#define SENINF5_MUX_INTEN_SENINF_SENSOR_HSIZEERR_IRQ_EN_SHIFT 6
> +#define SENINF5_MUX_INTEN_SENINF_SENSOR_HSIZEERR_IRQ_EN_MASK (0x1 << 6)
> +#define SENINF5_MUX_INTEN_SENINF_IRQ_CLR_SEL_SHIFT 31
> +#define SENINF5_MUX_INTEN_SENINF_IRQ_CLR_SEL_MASK (0x1 << 31)
> +#define SENINF5_MUX_INTSTA                                     0x4D08
> +#define SENINF5_MUX_INTSTA_SENINF_OVERRUN_IRQ_STA_SHIFT 0
> +#define SENINF5_MUX_INTSTA_SENINF_OVERRUN_IRQ_STA_MASK (0x1 << 0)
> +#define SENINF5_MUX_INTSTA_SENINF_CRCERR_IRQ_STA_SHIFT 1
> +#define SENINF5_MUX_INTSTA_SENINF_CRCERR_IRQ_STA_MASK (0x1 << 1)
> +#define SENINF5_MUX_INTSTA_SENINF_FSMERR_IRQ_STA_SHIFT 2
> +#define SENINF5_MUX_INTSTA_SENINF_FSMERR_IRQ_STA_MASK (0x1 << 2)
> +#define SENINF5_MUX_INTSTA_SENINF_VSIZEERR_IRQ_STA_SHIFT 3
> +#define SENINF5_MUX_INTSTA_SENINF_VSIZEERR_IRQ_STA_MASK (0x1 << 3)
> +#define SENINF5_MUX_INTSTA_SENINF_HSIZEERR_IRQ_STA_SHIFT 4
> +#define SENINF5_MUX_INTSTA_SENINF_HSIZEERR_IRQ_STA_MASK (0x1 << 4)
> +#define SENINF5_MUX_INTSTA_SENINF_SENSOR_VSIZEERR_IRQ_STA_SHIFT 5
> +#define SENINF5_MUX_INTSTA_SENINF_SENSOR_VSIZEERR_IRQ_STA_MASK (0x1 << 5)
> +#define SENINF5_MUX_INTSTA_SENINF_SENSOR_HSIZEERR_IRQ_STA_SHIFT 6
> +#define SENINF5_MUX_INTSTA_SENINF_SENSOR_HSIZEERR_IRQ_STA_MASK (0x1 << 6)
> +#define SENINF5_MUX_SIZE                                       0x4D0C
> +#define SENINF5_MUX_SIZE_SENINF_VSIZE_SHIFT    0
> +#define SENINF5_MUX_SIZE_SENINF_VSIZE_MASK     (0xffff << 0)
> +#define SENINF5_MUX_SIZE_SENINF_HSIZE_SHIFT    16
> +#define SENINF5_MUX_SIZE_SENINF_HSIZE_MASK     (0xffff << 16)
> +#define SENINF5_MUX_DEBUG_1                                    0x4D10
> +#define SENINF5_MUX_DEBUG_1_DEBUG_INFO_SHIFT   0
> +#define SENINF5_MUX_DEBUG_1_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF5_MUX_DEBUG_2                                    0x4D14
> +#define SENINF5_MUX_DEBUG_2_DEBUG_INFO_SHIFT   0
> +#define SENINF5_MUX_DEBUG_2_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF5_MUX_DEBUG_3                                    0x4D18
> +#define SENINF5_MUX_DEBUG_3_DEBUG_INFO_SHIFT   0
> +#define SENINF5_MUX_DEBUG_3_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF5_MUX_DEBUG_4                                    0x4D1C
> +#define SENINF5_MUX_DEBUG_4_DEBUG_INFO_SHIFT   0
> +#define SENINF5_MUX_DEBUG_4_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF5_MUX_DEBUG_5                                    0x4D20
> +#define SENINF5_MUX_DEBUG_5_DEBUG_INFO_SHIFT   0
> +#define SENINF5_MUX_DEBUG_5_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF5_MUX_DEBUG_6                                    0x4D24
> +#define SENINF5_MUX_DEBUG_6_DEBUG_INFO_SHIFT   0
> +#define SENINF5_MUX_DEBUG_6_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF5_MUX_DEBUG_7                                    0x4D28
> +#define SENINF5_MUX_DEBUG_7_DEBUG_INFO_SHIFT   0
> +#define SENINF5_MUX_DEBUG_7_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF5_MUX_SPARE                                      0x4D2C
> +#define SENINF5_MUX_SPARE_SENINF_CRC_SEL_SHIFT 9
> +#define SENINF5_MUX_SPARE_SENINF_CRC_SEL_MASK  (0x3 << 9)
> +#define SENINF5_MUX_SPARE_SENINF_VCNT_SEL_SHIFT 11
> +#define SENINF5_MUX_SPARE_SENINF_VCNT_SEL_MASK (0x3 << 11)
> +#define SENINF5_MUX_SPARE_SENINF_FIFO_FULL_SEL_SHIFT 13
> +#define SENINF5_MUX_SPARE_SENINF_FIFO_FULL_SEL_MASK (0x1 << 13)
> +#define SENINF5_MUX_SPARE_SENINF_SPARE_SHIFT   14
> +#define SENINF5_MUX_SPARE_SENINF_SPARE_MASK    (0x3f << 14)
> +#define SENINF5_MUX_DATA                                       0x4D30
> +#define SENINF5_MUX_DATA_SENINF_DATA0_SHIFT    0
> +#define SENINF5_MUX_DATA_SENINF_DATA0_MASK     (0xffff << 0)
> +#define SENINF5_MUX_DATA_SENINF_DATA1_SHIFT    16
> +#define SENINF5_MUX_DATA_SENINF_DATA1_MASK     (0xffff << 16)
> +#define SENINF5_MUX_DATA_CNT                                   0x4D34
> +#define SENINF5_MUX_DATA_CNT_SENINF_DATA_CNT_SHIFT 0
> +#define SENINF5_MUX_DATA_CNT_SENINF_DATA_CNT_MASK (0xffffffff << 0)
> +#define SENINF5_MUX_CROP                                       0x4D38
> +#define SENINF5_MUX_CROP_SENINF_CROP_X1_SHIFT  0
> +#define SENINF5_MUX_CROP_SENINF_CROP_X1_MASK   (0xffff << 0)
> +#define SENINF5_MUX_CROP_SENINF_CROP_X2_SHIFT  16
> +#define SENINF5_MUX_CROP_SENINF_CROP_X2_MASK   (0xffff << 16)
> +#define SENINF5_MUX_CTRL_EXT                                   0x4D3C
> +#define SENINF5_MUX_CTRL_EXT_SENINF_SRC_SEL_EXT_SHIFT 0
> +#define SENINF5_MUX_CTRL_EXT_SENINF_SRC_SEL_EXT_MASK (0x3 << 0)
> +#define SENINF5_MUX_CTRL_EXT_SENINF_PIX_SEL_EXT_SHIFT 4
> +#define SENINF5_MUX_CTRL_EXT_SENINF_PIX_SEL_EXT_MASK (0x1 << 4)
> +#define SENINF6_MUX_CTRL                                       0x5D00
> +#define SENINF6_MUX_CTRL_SENINF_MUX_SW_RST_SHIFT 0
> +#define SENINF6_MUX_CTRL_SENINF_MUX_SW_RST_MASK (0x1 << 0)
> +#define SENINF6_MUX_CTRL_SENINF_IRQ_SW_RST_SHIFT 1
> +#define SENINF6_MUX_CTRL_SENINF_IRQ_SW_RST_MASK (0x1 << 1)
> +#define SENINF6_MUX_CTRL_SENINF_MUX_RDY_MODE_SHIFT 4
> +#define SENINF6_MUX_CTRL_SENINF_MUX_RDY_MODE_MASK (0x1 << 4)
> +#define SENINF6_MUX_CTRL_SENINF_MUX_RDY_VALUE_SHIFT 5
> +#define SENINF6_MUX_CTRL_SENINF_MUX_RDY_VALUE_MASK (0x1 << 5)
> +#define SENINF6_MUX_CTRL_SENINF_HSYNC_MASK_SHIFT 7
> +#define SENINF6_MUX_CTRL_SENINF_HSYNC_MASK_MASK (0x1 << 7)
> +#define SENINF6_MUX_CTRL_SENINF_PIX_SEL_SHIFT  8
> +#define SENINF6_MUX_CTRL_SENINF_PIX_SEL_MASK   (0x1 << 8)
> +#define SENINF6_MUX_CTRL_SENINF_VSYNC_POL_SHIFT 9
> +#define SENINF6_MUX_CTRL_SENINF_VSYNC_POL_MASK (0x1 << 9)
> +#define SENINF6_MUX_CTRL_SENINF_HSYNC_POL_SHIFT 10
> +#define SENINF6_MUX_CTRL_SENINF_HSYNC_POL_MASK (0x1 << 10)
> +#define SENINF6_MUX_CTRL_OVERRUN_RST_EN_SHIFT  11
> +#define SENINF6_MUX_CTRL_OVERRUN_RST_EN_MASK   (0x1 << 11)
> +#define SENINF6_MUX_CTRL_SENINF_SRC_SEL_SHIFT  12
> +#define SENINF6_MUX_CTRL_SENINF_SRC_SEL_MASK   (0xf << 12)
> +#define SENINF6_MUX_CTRL_FIFO_PUSH_EN_SHIFT    16
> +#define SENINF6_MUX_CTRL_FIFO_PUSH_EN_MASK     (0x3f << 16)
> +#define SENINF6_MUX_CTRL_FIFO_FLUSH_EN_SHIFT   22
> +#define SENINF6_MUX_CTRL_FIFO_FLUSH_EN_MASK    (0x3f << 22)
> +#define SENINF6_MUX_CTRL_FIFO_FULL_WR_EN_SHIFT 28
> +#define SENINF6_MUX_CTRL_FIFO_FULL_WR_EN_MASK  (0x3 << 28)
> +#define SENINF6_MUX_CTRL_CROP_EN_SHIFT         30
> +#define SENINF6_MUX_CTRL_CROP_EN_MASK          (0x1 << 30)
> +#define SENINF6_MUX_CTRL_SENINF_MUX_EN_SHIFT   31
> +#define SENINF6_MUX_CTRL_SENINF_MUX_EN_MASK    (0x1 << 31)
> +#define SENINF6_MUX_INTEN                                      0x5D04
> +#define SENINF6_MUX_INTEN_SENINF_OVERRUN_IRQ_EN_SHIFT 0
> +#define SENINF6_MUX_INTEN_SENINF_OVERRUN_IRQ_EN_MASK (0x1 << 0)
> +#define SENINF6_MUX_INTEN_SENINF_CRCERR_IRQ_EN_SHIFT 1
> +#define SENINF6_MUX_INTEN_SENINF_CRCERR_IRQ_EN_MASK (0x1 << 1)
> +#define SENINF6_MUX_INTEN_SENINF_FSMERR_IRQ_EN_SHIFT 2
> +#define SENINF6_MUX_INTEN_SENINF_FSMERR_IRQ_EN_MASK (0x1 << 2)
> +#define SENINF6_MUX_INTEN_SENINF_VSIZEERR_IRQ_EN_SHIFT 3
> +#define SENINF6_MUX_INTEN_SENINF_VSIZEERR_IRQ_EN_MASK (0x1 << 3)
> +#define SENINF6_MUX_INTEN_SENINF_HSIZEERR_IRQ_EN_SHIFT 4
> +#define SENINF6_MUX_INTEN_SENINF_HSIZEERR_IRQ_EN_MASK (0x1 << 4)
> +#define SENINF6_MUX_INTEN_SENINF_SENSOR_VSIZEERR_IRQ_EN_SHIFT 5
> +#define SENINF6_MUX_INTEN_SENINF_SENSOR_VSIZEERR_IRQ_EN_MASK (0x1 << 5)
> +#define SENINF6_MUX_INTEN_SENINF_SENSOR_HSIZEERR_IRQ_EN_SHIFT 6
> +#define SENINF6_MUX_INTEN_SENINF_SENSOR_HSIZEERR_IRQ_EN_MASK (0x1 << 6)
> +#define SENINF6_MUX_INTEN_SENINF_IRQ_CLR_SEL_SHIFT 31
> +#define SENINF6_MUX_INTEN_SENINF_IRQ_CLR_SEL_MASK (0x1 << 31)
> +#define SENINF6_MUX_INTSTA                                     0x5D08
> +#define SENINF6_MUX_INTSTA_SENINF_OVERRUN_IRQ_STA_SHIFT 0
> +#define SENINF6_MUX_INTSTA_SENINF_OVERRUN_IRQ_STA_MASK (0x1 << 0)
> +#define SENINF6_MUX_INTSTA_SENINF_CRCERR_IRQ_STA_SHIFT 1
> +#define SENINF6_MUX_INTSTA_SENINF_CRCERR_IRQ_STA_MASK (0x1 << 1)
> +#define SENINF6_MUX_INTSTA_SENINF_FSMERR_IRQ_STA_SHIFT 2
> +#define SENINF6_MUX_INTSTA_SENINF_FSMERR_IRQ_STA_MASK (0x1 << 2)
> +#define SENINF6_MUX_INTSTA_SENINF_VSIZEERR_IRQ_STA_SHIFT 3
> +#define SENINF6_MUX_INTSTA_SENINF_VSIZEERR_IRQ_STA_MASK (0x1 << 3)
> +#define SENINF6_MUX_INTSTA_SENINF_HSIZEERR_IRQ_STA_SHIFT 4
> +#define SENINF6_MUX_INTSTA_SENINF_HSIZEERR_IRQ_STA_MASK (0x1 << 4)
> +#define SENINF6_MUX_INTSTA_SENINF_SENSOR_VSIZEERR_IRQ_STA_SHIFT 5
> +#define SENINF6_MUX_INTSTA_SENINF_SENSOR_VSIZEERR_IRQ_STA_MASK (0x1 << 5)
> +#define SENINF6_MUX_INTSTA_SENINF_SENSOR_HSIZEERR_IRQ_STA_SHIFT 6
> +#define SENINF6_MUX_INTSTA_SENINF_SENSOR_HSIZEERR_IRQ_STA_MASK (0x1 << 6)
> +#define SENINF6_MUX_SIZE                                       0x5D0C
> +#define SENINF6_MUX_SIZE_SENINF_VSIZE_SHIFT    0
> +#define SENINF6_MUX_SIZE_SENINF_VSIZE_MASK     (0xffff << 0)
> +#define SENINF6_MUX_SIZE_SENINF_HSIZE_SHIFT    16
> +#define SENINF6_MUX_SIZE_SENINF_HSIZE_MASK     (0xffff << 16)
> +#define SENINF6_MUX_DEBUG_1                                    0x5D10
> +#define SENINF6_MUX_DEBUG_1_DEBUG_INFO_SHIFT   0
> +#define SENINF6_MUX_DEBUG_1_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF6_MUX_DEBUG_2                                    0x5D14
> +#define SENINF6_MUX_DEBUG_2_DEBUG_INFO_SHIFT   0
> +#define SENINF6_MUX_DEBUG_2_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF6_MUX_DEBUG_3                                    0x5D18
> +#define SENINF6_MUX_DEBUG_3_DEBUG_INFO_SHIFT   0
> +#define SENINF6_MUX_DEBUG_3_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF6_MUX_DEBUG_4                                    0x5D1C
> +#define SENINF6_MUX_DEBUG_4_DEBUG_INFO_SHIFT   0
> +#define SENINF6_MUX_DEBUG_4_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF6_MUX_DEBUG_5                                    0x5D20
> +#define SENINF6_MUX_DEBUG_5_DEBUG_INFO_SHIFT   0
> +#define SENINF6_MUX_DEBUG_5_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF6_MUX_DEBUG_6                                    0x5D24
> +#define SENINF6_MUX_DEBUG_6_DEBUG_INFO_SHIFT   0
> +#define SENINF6_MUX_DEBUG_6_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF6_MUX_DEBUG_7                                    0x5D28
> +#define SENINF6_MUX_DEBUG_7_DEBUG_INFO_SHIFT   0
> +#define SENINF6_MUX_DEBUG_7_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF6_MUX_SPARE                                      0x5D2C
> +#define SENINF6_MUX_SPARE_SENINF_CRC_SEL_SHIFT 9
> +#define SENINF6_MUX_SPARE_SENINF_CRC_SEL_MASK  (0x3 << 9)
> +#define SENINF6_MUX_SPARE_SENINF_VCNT_SEL_SHIFT 11
> +#define SENINF6_MUX_SPARE_SENINF_VCNT_SEL_MASK (0x3 << 11)
> +#define SENINF6_MUX_SPARE_SENINF_FIFO_FULL_SEL_SHIFT 13
> +#define SENINF6_MUX_SPARE_SENINF_FIFO_FULL_SEL_MASK (0x1 << 13)
> +#define SENINF6_MUX_SPARE_SENINF_SPARE_SHIFT   14
> +#define SENINF6_MUX_SPARE_SENINF_SPARE_MASK    (0x3f << 14)
> +#define SENINF6_MUX_DATA                                       0x5D30
> +#define SENINF6_MUX_DATA_SENINF_DATA0_SHIFT    0
> +#define SENINF6_MUX_DATA_SENINF_DATA0_MASK     (0xffff << 0)
> +#define SENINF6_MUX_DATA_SENINF_DATA1_SHIFT    16
> +#define SENINF6_MUX_DATA_SENINF_DATA1_MASK     (0xffff << 16)
> +#define SENINF6_MUX_DATA_CNT                                   0x5D34
> +#define SENINF6_MUX_DATA_CNT_SENINF_DATA_CNT_SHIFT 0
> +#define SENINF6_MUX_DATA_CNT_SENINF_DATA_CNT_MASK (0xffffffff << 0)
> +#define SENINF6_MUX_CROP                                       0x5D38
> +#define SENINF6_MUX_CROP_SENINF_CROP_X1_SHIFT  0
> +#define SENINF6_MUX_CROP_SENINF_CROP_X1_MASK   (0xffff << 0)
> +#define SENINF6_MUX_CROP_SENINF_CROP_X2_SHIFT  16
> +#define SENINF6_MUX_CROP_SENINF_CROP_X2_MASK   (0xffff << 16)
> +#define SENINF6_MUX_CTRL_EXT                                   0x5D3C
> +#define SENINF6_MUX_CTRL_EXT_SENINF_SRC_SEL_EXT_SHIFT 0
> +#define SENINF6_MUX_CTRL_EXT_SENINF_SRC_SEL_EXT_MASK (0x3 << 0)
> +#define SENINF6_MUX_CTRL_EXT_SENINF_PIX_SEL_EXT_SHIFT 4
> +#define SENINF6_MUX_CTRL_EXT_SENINF_PIX_SEL_EXT_MASK (0x1 << 4)
> +#define SENINF7_MUX_CTRL                                       0x6D00
> +#define SENINF7_MUX_CTRL_SENINF_MUX_SW_RST_SHIFT 0
> +#define SENINF7_MUX_CTRL_SENINF_MUX_SW_RST_MASK (0x1 << 0)
> +#define SENINF7_MUX_CTRL_SENINF_IRQ_SW_RST_SHIFT 1
> +#define SENINF7_MUX_CTRL_SENINF_IRQ_SW_RST_MASK (0x1 << 1)
> +#define SENINF7_MUX_CTRL_SENINF_MUX_RDY_MODE_SHIFT 4
> +#define SENINF7_MUX_CTRL_SENINF_MUX_RDY_MODE_MASK (0x1 << 4)
> +#define SENINF7_MUX_CTRL_SENINF_MUX_RDY_VALUE_SHIFT 5
> +#define SENINF7_MUX_CTRL_SENINF_MUX_RDY_VALUE_MASK (0x1 << 5)
> +#define SENINF7_MUX_CTRL_SENINF_HSYNC_MASK_SHIFT 7
> +#define SENINF7_MUX_CTRL_SENINF_HSYNC_MASK_MASK (0x1 << 7)
> +#define SENINF7_MUX_CTRL_SENINF_PIX_SEL_SHIFT  8
> +#define SENINF7_MUX_CTRL_SENINF_PIX_SEL_MASK   (0x1 << 8)
> +#define SENINF7_MUX_CTRL_SENINF_VSYNC_POL_SHIFT 9
> +#define SENINF7_MUX_CTRL_SENINF_VSYNC_POL_MASK (0x1 << 9)
> +#define SENINF7_MUX_CTRL_SENINF_HSYNC_POL_SHIFT 10
> +#define SENINF7_MUX_CTRL_SENINF_HSYNC_POL_MASK (0x1 << 10)
> +#define SENINF7_MUX_CTRL_OVERRUN_RST_EN_SHIFT  11
> +#define SENINF7_MUX_CTRL_OVERRUN_RST_EN_MASK   (0x1 << 11)
> +#define SENINF7_MUX_CTRL_SENINF_SRC_SEL_SHIFT  12
> +#define SENINF7_MUX_CTRL_SENINF_SRC_SEL_MASK   (0xf << 12)
> +#define SENINF7_MUX_CTRL_FIFO_PUSH_EN_SHIFT    16
> +#define SENINF7_MUX_CTRL_FIFO_PUSH_EN_MASK     (0x3f << 16)
> +#define SENINF7_MUX_CTRL_FIFO_FLUSH_EN_SHIFT   22
> +#define SENINF7_MUX_CTRL_FIFO_FLUSH_EN_MASK    (0x3f << 22)
> +#define SENINF7_MUX_CTRL_FIFO_FULL_WR_EN_SHIFT 28
> +#define SENINF7_MUX_CTRL_FIFO_FULL_WR_EN_MASK  (0x3 << 28)
> +#define SENINF7_MUX_CTRL_CROP_EN_SHIFT         30
> +#define SENINF7_MUX_CTRL_CROP_EN_MASK          (0x1 << 30)
> +#define SENINF7_MUX_CTRL_SENINF_MUX_EN_SHIFT   31
> +#define SENINF7_MUX_CTRL_SENINF_MUX_EN_MASK    (0x1 << 31)
> +#define SENINF7_MUX_INTEN                                      0x6D04
> +#define SENINF7_MUX_INTEN_SENINF_OVERRUN_IRQ_EN_SHIFT 0
> +#define SENINF7_MUX_INTEN_SENINF_OVERRUN_IRQ_EN_MASK (0x1 << 0)
> +#define SENINF7_MUX_INTEN_SENINF_CRCERR_IRQ_EN_SHIFT 1
> +#define SENINF7_MUX_INTEN_SENINF_CRCERR_IRQ_EN_MASK (0x1 << 1)
> +#define SENINF7_MUX_INTEN_SENINF_FSMERR_IRQ_EN_SHIFT 2
> +#define SENINF7_MUX_INTEN_SENINF_FSMERR_IRQ_EN_MASK (0x1 << 2)
> +#define SENINF7_MUX_INTEN_SENINF_VSIZEERR_IRQ_EN_SHIFT 3
> +#define SENINF7_MUX_INTEN_SENINF_VSIZEERR_IRQ_EN_MASK (0x1 << 3)
> +#define SENINF7_MUX_INTEN_SENINF_HSIZEERR_IRQ_EN_SHIFT 4
> +#define SENINF7_MUX_INTEN_SENINF_HSIZEERR_IRQ_EN_MASK (0x1 << 4)
> +#define SENINF7_MUX_INTEN_SENINF_SENSOR_VSIZEERR_IRQ_EN_SHIFT 5
> +#define SENINF7_MUX_INTEN_SENINF_SENSOR_VSIZEERR_IRQ_EN_MASK (0x1 << 5)
> +#define SENINF7_MUX_INTEN_SENINF_SENSOR_HSIZEERR_IRQ_EN_SHIFT 6
> +#define SENINF7_MUX_INTEN_SENINF_SENSOR_HSIZEERR_IRQ_EN_MASK (0x1 << 6)
> +#define SENINF7_MUX_INTEN_SENINF_IRQ_CLR_SEL_SHIFT 31
> +#define SENINF7_MUX_INTEN_SENINF_IRQ_CLR_SEL_MASK (0x1 << 31)
> +#define SENINF7_MUX_INTSTA                                     0x6D08
> +#define SENINF7_MUX_INTSTA_SENINF_OVERRUN_IRQ_STA_SHIFT 0
> +#define SENINF7_MUX_INTSTA_SENINF_OVERRUN_IRQ_STA_MASK (0x1 << 0)
> +#define SENINF7_MUX_INTSTA_SENINF_CRCERR_IRQ_STA_SHIFT 1
> +#define SENINF7_MUX_INTSTA_SENINF_CRCERR_IRQ_STA_MASK (0x1 << 1)
> +#define SENINF7_MUX_INTSTA_SENINF_FSMERR_IRQ_STA_SHIFT 2
> +#define SENINF7_MUX_INTSTA_SENINF_FSMERR_IRQ_STA_MASK (0x1 << 2)
> +#define SENINF7_MUX_INTSTA_SENINF_VSIZEERR_IRQ_STA_SHIFT 3
> +#define SENINF7_MUX_INTSTA_SENINF_VSIZEERR_IRQ_STA_MASK (0x1 << 3)
> +#define SENINF7_MUX_INTSTA_SENINF_HSIZEERR_IRQ_STA_SHIFT 4
> +#define SENINF7_MUX_INTSTA_SENINF_HSIZEERR_IRQ_STA_MASK (0x1 << 4)
> +#define SENINF7_MUX_INTSTA_SENINF_SENSOR_VSIZEERR_IRQ_STA_SHIFT 5
> +#define SENINF7_MUX_INTSTA_SENINF_SENSOR_VSIZEERR_IRQ_STA_MASK (0x1 << 5)
> +#define SENINF7_MUX_INTSTA_SENINF_SENSOR_HSIZEERR_IRQ_STA_SHIFT 6
> +#define SENINF7_MUX_INTSTA_SENINF_SENSOR_HSIZEERR_IRQ_STA_MASK (0x1 << 6)
> +#define SENINF7_MUX_SIZE                                       0x6D0C
> +#define SENINF7_MUX_SIZE_SENINF_VSIZE_SHIFT    0
> +#define SENINF7_MUX_SIZE_SENINF_VSIZE_MASK     (0xffff << 0)
> +#define SENINF7_MUX_SIZE_SENINF_HSIZE_SHIFT    16
> +#define SENINF7_MUX_SIZE_SENINF_HSIZE_MASK     (0xffff << 16)
> +#define SENINF7_MUX_DEBUG_1                                    0x6D10
> +#define SENINF7_MUX_DEBUG_1_DEBUG_INFO_SHIFT   0
> +#define SENINF7_MUX_DEBUG_1_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF7_MUX_DEBUG_2                                    0x6D14
> +#define SENINF7_MUX_DEBUG_2_DEBUG_INFO_SHIFT   0
> +#define SENINF7_MUX_DEBUG_2_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF7_MUX_DEBUG_3                                    0x6D18
> +#define SENINF7_MUX_DEBUG_3_DEBUG_INFO_SHIFT   0
> +#define SENINF7_MUX_DEBUG_3_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF7_MUX_DEBUG_4                                    0x6D1C
> +#define SENINF7_MUX_DEBUG_4_DEBUG_INFO_SHIFT   0
> +#define SENINF7_MUX_DEBUG_4_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF7_MUX_DEBUG_5                                    0x6D20
> +#define SENINF7_MUX_DEBUG_5_DEBUG_INFO_SHIFT   0
> +#define SENINF7_MUX_DEBUG_5_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF7_MUX_DEBUG_6                                    0x6D24
> +#define SENINF7_MUX_DEBUG_6_DEBUG_INFO_SHIFT   0
> +#define SENINF7_MUX_DEBUG_6_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF7_MUX_DEBUG_7                                    0x6D28
> +#define SENINF7_MUX_DEBUG_7_DEBUG_INFO_SHIFT   0
> +#define SENINF7_MUX_DEBUG_7_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF7_MUX_SPARE                                      0x6D2C
> +#define SENINF7_MUX_SPARE_SENINF_CRC_SEL_SHIFT 9
> +#define SENINF7_MUX_SPARE_SENINF_CRC_SEL_MASK  (0x3 << 9)
> +#define SENINF7_MUX_SPARE_SENINF_VCNT_SEL_SHIFT 11
> +#define SENINF7_MUX_SPARE_SENINF_VCNT_SEL_MASK (0x3 << 11)
> +#define SENINF7_MUX_SPARE_SENINF_FIFO_FULL_SEL_SHIFT 13
> +#define SENINF7_MUX_SPARE_SENINF_FIFO_FULL_SEL_MASK (0x1 << 13)
> +#define SENINF7_MUX_SPARE_SENINF_SPARE_SHIFT   14
> +#define SENINF7_MUX_SPARE_SENINF_SPARE_MASK    (0x3f << 14)
> +#define SENINF7_MUX_DATA                                       0x6D30
> +#define SENINF7_MUX_DATA_SENINF_DATA0_SHIFT    0
> +#define SENINF7_MUX_DATA_SENINF_DATA0_MASK     (0xffff << 0)
> +#define SENINF7_MUX_DATA_SENINF_DATA1_SHIFT    16
> +#define SENINF7_MUX_DATA_SENINF_DATA1_MASK     (0xffff << 16)
> +#define SENINF7_MUX_DATA_CNT                                   0x6D34
> +#define SENINF7_MUX_DATA_CNT_SENINF_DATA_CNT_SHIFT 0
> +#define SENINF7_MUX_DATA_CNT_SENINF_DATA_CNT_MASK (0xffffffff << 0)
> +#define SENINF7_MUX_CROP                                       0x6D38
> +#define SENINF7_MUX_CROP_SENINF_CROP_X1_SHIFT  0
> +#define SENINF7_MUX_CROP_SENINF_CROP_X1_MASK   (0xffff << 0)
> +#define SENINF7_MUX_CROP_SENINF_CROP_X2_SHIFT  16
> +#define SENINF7_MUX_CROP_SENINF_CROP_X2_MASK   (0xffff << 16)
> +#define SENINF7_MUX_CTRL_EXT                                   0x6D3C
> +#define SENINF7_MUX_CTRL_EXT_SENINF_SRC_SEL_EXT_SHIFT 0
> +#define SENINF7_MUX_CTRL_EXT_SENINF_SRC_SEL_EXT_MASK (0x3 << 0)
> +#define SENINF7_MUX_CTRL_EXT_SENINF_PIX_SEL_EXT_SHIFT 4
> +#define SENINF7_MUX_CTRL_EXT_SENINF_PIX_SEL_EXT_MASK (0x1 << 4)
> +#define SENINF8_MUX_CTRL                                       0x7D00
> +#define SENINF8_MUX_CTRL_SENINF_MUX_SW_RST_SHIFT 0
> +#define SENINF8_MUX_CTRL_SENINF_MUX_SW_RST_MASK (0x1 << 0)
> +#define SENINF8_MUX_CTRL_SENINF_IRQ_SW_RST_SHIFT 1
> +#define SENINF8_MUX_CTRL_SENINF_IRQ_SW_RST_MASK (0x1 << 1)
> +#define SENINF8_MUX_CTRL_SENINF_MUX_RDY_MODE_SHIFT 4
> +#define SENINF8_MUX_CTRL_SENINF_MUX_RDY_MODE_MASK (0x1 << 4)
> +#define SENINF8_MUX_CTRL_SENINF_MUX_RDY_VALUE_SHIFT 5
> +#define SENINF8_MUX_CTRL_SENINF_MUX_RDY_VALUE_MASK (0x1 << 5)
> +#define SENINF8_MUX_CTRL_SENINF_HSYNC_MASK_SHIFT 7
> +#define SENINF8_MUX_CTRL_SENINF_HSYNC_MASK_MASK (0x1 << 7)
> +#define SENINF8_MUX_CTRL_SENINF_PIX_SEL_SHIFT  8
> +#define SENINF8_MUX_CTRL_SENINF_PIX_SEL_MASK   (0x1 << 8)
> +#define SENINF8_MUX_CTRL_SENINF_VSYNC_POL_SHIFT 9
> +#define SENINF8_MUX_CTRL_SENINF_VSYNC_POL_MASK (0x1 << 9)
> +#define SENINF8_MUX_CTRL_SENINF_HSYNC_POL_SHIFT 10
> +#define SENINF8_MUX_CTRL_SENINF_HSYNC_POL_MASK (0x1 << 10)
> +#define SENINF8_MUX_CTRL_OVERRUN_RST_EN_SHIFT  11
> +#define SENINF8_MUX_CTRL_OVERRUN_RST_EN_MASK   (0x1 << 11)
> +#define SENINF8_MUX_CTRL_SENINF_SRC_SEL_SHIFT  12
> +#define SENINF8_MUX_CTRL_SENINF_SRC_SEL_MASK   (0xf << 12)
> +#define SENINF8_MUX_CTRL_FIFO_PUSH_EN_SHIFT    16
> +#define SENINF8_MUX_CTRL_FIFO_PUSH_EN_MASK     (0x3f << 16)
> +#define SENINF8_MUX_CTRL_FIFO_FLUSH_EN_SHIFT   22
> +#define SENINF8_MUX_CTRL_FIFO_FLUSH_EN_MASK    (0x3f << 22)
> +#define SENINF8_MUX_CTRL_FIFO_FULL_WR_EN_SHIFT 28
> +#define SENINF8_MUX_CTRL_FIFO_FULL_WR_EN_MASK  (0x3 << 28)
> +#define SENINF8_MUX_CTRL_CROP_EN_SHIFT         30
> +#define SENINF8_MUX_CTRL_CROP_EN_MASK          (0x1 << 30)
> +#define SENINF8_MUX_CTRL_SENINF_MUX_EN_SHIFT   31
> +#define SENINF8_MUX_CTRL_SENINF_MUX_EN_MASK    (0x1 << 31)
> +#define SENINF8_MUX_INTEN                                      0x7D04
> +#define SENINF8_MUX_INTEN_SENINF_OVERRUN_IRQ_EN_SHIFT 0
> +#define SENINF8_MUX_INTEN_SENINF_OVERRUN_IRQ_EN_MASK (0x1 << 0)
> +#define SENINF8_MUX_INTEN_SENINF_CRCERR_IRQ_EN_SHIFT 1
> +#define SENINF8_MUX_INTEN_SENINF_CRCERR_IRQ_EN_MASK (0x1 << 1)
> +#define SENINF8_MUX_INTEN_SENINF_FSMERR_IRQ_EN_SHIFT 2
> +#define SENINF8_MUX_INTEN_SENINF_FSMERR_IRQ_EN_MASK (0x1 << 2)
> +#define SENINF8_MUX_INTEN_SENINF_VSIZEERR_IRQ_EN_SHIFT 3
> +#define SENINF8_MUX_INTEN_SENINF_VSIZEERR_IRQ_EN_MASK (0x1 << 3)
> +#define SENINF8_MUX_INTEN_SENINF_HSIZEERR_IRQ_EN_SHIFT 4
> +#define SENINF8_MUX_INTEN_SENINF_HSIZEERR_IRQ_EN_MASK (0x1 << 4)
> +#define SENINF8_MUX_INTEN_SENINF_SENSOR_VSIZEERR_IRQ_EN_SHIFT 5
> +#define SENINF8_MUX_INTEN_SENINF_SENSOR_VSIZEERR_IRQ_EN_MASK (0x1 << 5)
> +#define SENINF8_MUX_INTEN_SENINF_SENSOR_HSIZEERR_IRQ_EN_SHIFT 6
> +#define SENINF8_MUX_INTEN_SENINF_SENSOR_HSIZEERR_IRQ_EN_MASK (0x1 << 6)
> +#define SENINF8_MUX_INTEN_SENINF_IRQ_CLR_SEL_SHIFT 31
> +#define SENINF8_MUX_INTEN_SENINF_IRQ_CLR_SEL_MASK (0x1 << 31)
> +#define SENINF8_MUX_INTSTA                                     0x7D08
> +#define SENINF8_MUX_INTSTA_SENINF_OVERRUN_IRQ_STA_SHIFT 0
> +#define SENINF8_MUX_INTSTA_SENINF_OVERRUN_IRQ_STA_MASK (0x1 << 0)
> +#define SENINF8_MUX_INTSTA_SENINF_CRCERR_IRQ_STA_SHIFT 1
> +#define SENINF8_MUX_INTSTA_SENINF_CRCERR_IRQ_STA_MASK (0x1 << 1)
> +#define SENINF8_MUX_INTSTA_SENINF_FSMERR_IRQ_STA_SHIFT 2
> +#define SENINF8_MUX_INTSTA_SENINF_FSMERR_IRQ_STA_MASK (0x1 << 2)
> +#define SENINF8_MUX_INTSTA_SENINF_VSIZEERR_IRQ_STA_SHIFT 3
> +#define SENINF8_MUX_INTSTA_SENINF_VSIZEERR_IRQ_STA_MASK (0x1 << 3)
> +#define SENINF8_MUX_INTSTA_SENINF_HSIZEERR_IRQ_STA_SHIFT 4
> +#define SENINF8_MUX_INTSTA_SENINF_HSIZEERR_IRQ_STA_MASK (0x1 << 4)
> +#define SENINF8_MUX_INTSTA_SENINF_SENSOR_VSIZEERR_IRQ_STA_SHIFT 5
> +#define SENINF8_MUX_INTSTA_SENINF_SENSOR_VSIZEERR_IRQ_STA_MASK (0x1 << 5)
> +#define SENINF8_MUX_INTSTA_SENINF_SENSOR_HSIZEERR_IRQ_STA_SHIFT 6
> +#define SENINF8_MUX_INTSTA_SENINF_SENSOR_HSIZEERR_IRQ_STA_MASK (0x1 << 6)
> +#define SENINF8_MUX_SIZE                                       0x7D0C
> +#define SENINF8_MUX_SIZE_SENINF_VSIZE_SHIFT    0
> +#define SENINF8_MUX_SIZE_SENINF_VSIZE_MASK     (0xffff << 0)
> +#define SENINF8_MUX_SIZE_SENINF_HSIZE_SHIFT    16
> +#define SENINF8_MUX_SIZE_SENINF_HSIZE_MASK     (0xffff << 16)
> +#define SENINF8_MUX_DEBUG_1                                    0x7D10
> +#define SENINF8_MUX_DEBUG_1_DEBUG_INFO_SHIFT   0
> +#define SENINF8_MUX_DEBUG_1_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF8_MUX_DEBUG_2                                    0x7D14
> +#define SENINF8_MUX_DEBUG_2_DEBUG_INFO_SHIFT   0
> +#define SENINF8_MUX_DEBUG_2_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF8_MUX_DEBUG_3                                    0x7D18
> +#define SENINF8_MUX_DEBUG_3_DEBUG_INFO_SHIFT   0
> +#define SENINF8_MUX_DEBUG_3_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF8_MUX_DEBUG_4                                    0x7D1C
> +#define SENINF8_MUX_DEBUG_4_DEBUG_INFO_SHIFT   0
> +#define SENINF8_MUX_DEBUG_4_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF8_MUX_DEBUG_5                                    0x7D20
> +#define SENINF8_MUX_DEBUG_5_DEBUG_INFO_SHIFT   0
> +#define SENINF8_MUX_DEBUG_5_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF8_MUX_DEBUG_6                                    0x7D24
> +#define SENINF8_MUX_DEBUG_6_DEBUG_INFO_SHIFT   0
> +#define SENINF8_MUX_DEBUG_6_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF8_MUX_DEBUG_7                                    0x7D28
> +#define SENINF8_MUX_DEBUG_7_DEBUG_INFO_SHIFT   0
> +#define SENINF8_MUX_DEBUG_7_DEBUG_INFO_MASK    (0xffffffff << 0)
> +#define SENINF8_MUX_SPARE                                      0x7D2C
> +#define SENINF8_MUX_SPARE_SENINF_CRC_SEL_SHIFT 9
> +#define SENINF8_MUX_SPARE_SENINF_CRC_SEL_MASK  (0x3 << 9)
> +#define SENINF8_MUX_SPARE_SENINF_VCNT_SEL_SHIFT 11
> +#define SENINF8_MUX_SPARE_SENINF_VCNT_SEL_MASK (0x3 << 11)
> +#define SENINF8_MUX_SPARE_SENINF_FIFO_FULL_SEL_SHIFT 13
> +#define SENINF8_MUX_SPARE_SENINF_FIFO_FULL_SEL_MASK (0x1 << 13)
> +#define SENINF8_MUX_SPARE_SENINF_SPARE_SHIFT   14
> +#define SENINF8_MUX_SPARE_SENINF_SPARE_MASK    (0x3f << 14)
> +#define SENINF8_MUX_DATA                                       0x7D30
> +#define SENINF8_MUX_DATA_SENINF_DATA0_SHIFT    0
> +#define SENINF8_MUX_DATA_SENINF_DATA0_MASK     (0xffff << 0)
> +#define SENINF8_MUX_DATA_SENINF_DATA1_SHIFT    16
> +#define SENINF8_MUX_DATA_SENINF_DATA1_MASK     (0xffff << 16)
> +#define SENINF8_MUX_DATA_CNT                                   0x7D34
> +#define SENINF8_MUX_DATA_CNT_SENINF_DATA_CNT_SHIFT 0
> +#define SENINF8_MUX_DATA_CNT_SENINF_DATA_CNT_MASK (0xffffffff << 0)
> +#define SENINF8_MUX_CROP                                       0x7D38
> +#define SENINF8_MUX_CROP_SENINF_CROP_X1_SHIFT  0
> +#define SENINF8_MUX_CROP_SENINF_CROP_X1_MASK   (0xffff << 0)
> +#define SENINF8_MUX_CROP_SENINF_CROP_X2_SHIFT  16
> +#define SENINF8_MUX_CROP_SENINF_CROP_X2_MASK   (0xffff << 16)
> +#define SENINF8_MUX_CTRL_EXT                                   0x7D3C
> +#define SENINF8_MUX_CTRL_EXT_SENINF_SRC_SEL_EXT_SHIFT 0
> +#define SENINF8_MUX_CTRL_EXT_SENINF_SRC_SEL_EXT_MASK (0x3 << 0)
> +#define SENINF8_MUX_CTRL_EXT_SENINF_PIX_SEL_EXT_SHIFT 4
> +#define SENINF8_MUX_CTRL_EXT_SENINF_PIX_SEL_EXT_MASK (0x1 << 4)

Add a new line here

> +#endif
> 

Thanks
Helen
