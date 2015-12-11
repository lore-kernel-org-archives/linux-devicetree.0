From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 02/14] drm/mediatek: Add DRM Driver for Mediatek SoC
 MT8173.
Date: Fri, 11 Dec 2015 18:10:16 +0100
Message-ID: <566B0378.7050809@gmail.com>
References: <1448917676-25584-1-git-send-email-p.zabel@pengutronix.de>
 <1448917676-25584-3-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448917676-25584-3-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 30/11/15 22:07, Philipp Zabel wrote:
> From: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>
> This patch adds an initial DRM driver for the Mediatek MT8173 DISP
> subsystem. It currently supports two fixed output streams from the
> OVL0/OVL1 sources to the DSI0/DPI0 sinks, respectively.
>
> Signed-off-by: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
> Changes since v6:
>   - Split disp_ovl driver from mtk_drm_crtc code
>   - Added crtc and plane state atomic reset functions
>   - Toned down debug messages
>   - Improved error handling for hardware initialization
>   - Get/put smi_larb in crtc_enable/disable
>   - Added memory barrier before marking crtc state as ready
>   - Changed crtc_disable to wait for vblank
>   - Renamed component power_on/off to start/stop
>   - Made component ops optional
>   - Moved crtc creation from disp_ovl driver bind callback into mtk_drm_kms_init
>   - Various fixes
>   - Added support for DRIVER_PRIME feature
>   - Moved DISP_OVL, DSI, DPI and component initialization into the respective drivers
> ---
>   drivers/gpu/drm/Kconfig                     |   2 +
>   drivers/gpu/drm/Makefile                    |   1 +
>   drivers/gpu/drm/mediatek/Kconfig            |  16 +
>   drivers/gpu/drm/mediatek/Makefile           |  11 +
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 301 +++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 565 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  31 ++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp.c      | 355 +++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp.h      |  41 ++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 275 ++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 148 ++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 562 +++++++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h      |  53 +++
>   drivers/gpu/drm/mediatek/mtk_drm_fb.c       | 135 +++++++
>   drivers/gpu/drm/mediatek/mtk_drm_fb.h       |  28 ++
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c      | 227 +++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_gem.h      |  55 +++
>   drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 238 ++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_plane.h    |  58 +++
>   19 files changed, 3102 insertions(+)
>   create mode 100644 drivers/gpu/drm/mediatek/Kconfig
>   create mode 100644 drivers/gpu/drm/mediatek/Makefile
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_crtc.h
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_ddp.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_ddp.h
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_drv.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_drv.h
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_fb.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_fb.h
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_gem.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_gem.h
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_plane.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_plane.h
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index c4bf9a1..8fdb0c2 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -266,3 +266,5 @@ source "drivers/gpu/drm/amd/amdkfd/Kconfig"
>   source "drivers/gpu/drm/imx/Kconfig"
>
>   source "drivers/gpu/drm/vc4/Kconfig"
> +
> +source "drivers/gpu/drm/mediatek/Kconfig"
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 1e9ff4c..607a49f 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -71,6 +71,7 @@ obj-$(CONFIG_DRM_MSM) += msm/
>   obj-$(CONFIG_DRM_TEGRA) += tegra/
>   obj-$(CONFIG_DRM_STI) += sti/
>   obj-$(CONFIG_DRM_IMX) += imx/
> +obj-$(CONFIG_DRM_MEDIATEK) += mediatek/
>   obj-y			+= i2c/
>   obj-y			+= panel/
>   obj-y			+= bridge/
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
> new file mode 100644
> index 0000000..5343cf1
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -0,0 +1,16 @@
> +config DRM_MEDIATEK
> +	tristate "DRM Support for Mediatek SoCs"
> +	depends on DRM
> +	depends on ARCH_MEDIATEK || (ARM && COMPILE_TEST)
> +	select MTK_SMI
> +	select DRM_PANEL
> +	select DRM_MIPI_DSI
> +	select DRM_PANEL_SIMPLE
> +	select DRM_KMS_HELPER
> +	select IOMMU_DMA
> +	help
> +	  Choose this option if you have a Mediatek SoCs.
> +	  The module will be called mediatek-drm
> +	  This driver provides kernel mode setting and
> +	  buffer management to userspace.
> +
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> new file mode 100644
> index 0000000..bd6e8df
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -0,0 +1,11 @@
> +mediatek-drm-y := mtk_disp_ovl.o \
> +		  mtk_drm_crtc.o \
> +		  mtk_drm_ddp.o \
> +		  mtk_drm_ddp_comp.o \
> +		  mtk_drm_drv.o \
> +		  mtk_drm_fb.o \
> +		  mtk_drm_gem.o \
> +		  mtk_drm_plane.o
> +
> +obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
> +
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> new file mode 100644
> index 0000000..505da06
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -0,0 +1,301 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <drm/drmP.h>
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +
> +#include "mtk_drm_crtc.h"
> +#include "mtk_drm_ddp_comp.h"
> +
> +#define DISP_REG_OVL_INTEN			0x0004
> +#define OVL_FME_CPL_INT					BIT(1)
> +#define DISP_REG_OVL_INTSTA			0x0008
> +#define DISP_REG_OVL_EN				0x000c
> +#define DISP_REG_OVL_RST			0x0014
> +#define DISP_REG_OVL_ROI_SIZE			0x0020
> +#define DISP_REG_OVL_ROI_BGCLR			0x0028
> +#define DISP_REG_OVL_SRC_CON			0x002c
> +#define DISP_REG_OVL_CON(n)			(0x0030 + 0x20 * n)
> +#define DISP_REG_OVL_SRC_SIZE(n)		(0x0038 + 0x20 * n)
> +#define DISP_REG_OVL_OFFSET(n)			(0x003c + 0x20 * n)
> +#define DISP_REG_OVL_PITCH(n)			(0x0044 + 0x20 * n)
> +#define DISP_REG_OVL_RDMA_CTRL(n)		(0x00c0 + 0x20 * n)
> +#define DISP_REG_OVL_RDMA_GMC(n)		(0x00c8 + 0x20 * n)
> +#define DISP_REG_OVL_ADDR(n)			(0x0f40 + 0x20 * n)
> +
> +enum OVL_INPUT_FORMAT {
> +	OVL_INFMT_RGB565 = 0,
> +	OVL_INFMT_RGB888 = 1,
> +	OVL_INFMT_RGBA8888 = 2,
> +	OVL_INFMT_ARGB8888 = 3,
> +};
> +
> +#define	OVL_RDMA_MEM_GMC	0x40402020
> +#define	OVL_AEN			BIT(8)
> +#define	OVL_ALPHA		0xff
> +
> +/**
> + * struct mtk_disp_ovl - DISP_OVL driver structure
> + * @ddp_comp - structure containing type enum and hardware resources
> + * @drm_device - backlink to allow the irq handler to find the associated crtc
> + */
> +struct mtk_disp_ovl {
> +	struct mtk_ddp_comp		ddp_comp;
> +	struct drm_device		*drm_dev;
> +};
> +
> +static irqreturn_t mtk_disp_ovl_irq_handler(int irq, void *dev_id)
> +{
> +	struct mtk_disp_ovl *priv = dev_id;
> +	struct mtk_ddp_comp *ovl = &priv->ddp_comp;
> +
> +	/* Clear frame completion interrupt */
> +	writel(0x0, ovl->regs + DISP_REG_OVL_INTSTA);
> +
> +	mtk_crtc_ddp_irq(priv->drm_dev, ovl);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void mtk_ovl_enable_vblank(void __iomem *disp_base)
> +{
> +	writel(OVL_FME_CPL_INT, disp_base + DISP_REG_OVL_INTEN);
> +}
> +
> +static void mtk_ovl_disable_vblank(void __iomem *disp_base)
> +{
> +	writel(0x0, disp_base + DISP_REG_OVL_INTEN);
> +}
> +
> +static void mtk_ovl_start(struct mtk_ddp_comp *comp)
> +{
> +	writel(0x1, comp->regs + DISP_REG_OVL_EN);
> +}
> +
> +static void mtk_ovl_stop(struct mtk_ddp_comp *comp)
> +{
> +	writel(0x0, comp->regs + DISP_REG_OVL_EN);
> +}
> +
> +static void mtk_ovl_config(void __iomem *ovl_base,
> +		unsigned int w, unsigned int h, unsigned int vrefresh)
> +{
> +	if (w != 0 && h != 0)
> +		writel(h << 16 | w, ovl_base + DISP_REG_OVL_ROI_SIZE);
> +	writel(0x0, ovl_base + DISP_REG_OVL_ROI_BGCLR);
> +
> +	writel(0x1, ovl_base + DISP_REG_OVL_RST);
> +	writel(0x0, ovl_base + DISP_REG_OVL_RST);
> +}
> +
> +static bool has_rb_swapped(unsigned int fmt)
> +{
> +	switch (fmt) {
> +	case DRM_FORMAT_BGR888:
> +	case DRM_FORMAT_BGR565:
> +	case DRM_FORMAT_ABGR8888:
> +	case DRM_FORMAT_XBGR8888:
> +	case DRM_FORMAT_BGRA8888:
> +	case DRM_FORMAT_BGRX8888:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static unsigned int ovl_fmt_convert(unsigned int fmt)
> +{
> +	switch (fmt) {
> +	case DRM_FORMAT_RGB888:
> +	case DRM_FORMAT_BGR888:
> +		return OVL_INFMT_RGB888;
> +	case DRM_FORMAT_RGB565:
> +	case DRM_FORMAT_BGR565:
> +		return OVL_INFMT_RGB565;
> +	case DRM_FORMAT_RGBX8888:
> +	case DRM_FORMAT_RGBA8888:
> +	case DRM_FORMAT_BGRX8888:
> +	case DRM_FORMAT_BGRA8888:
> +		return OVL_INFMT_ARGB8888;
> +	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_ARGB8888:
> +	case DRM_FORMAT_XBGR8888:
> +	case DRM_FORMAT_ABGR8888:
> +		return OVL_INFMT_RGBA8888;
> +	default:
> +		DRM_ERROR("unsupported format[%08x]\n", fmt);
> +		return OVL_INFMT_RGB888;
> +	}
> +}
> +
> +static void mtk_ovl_layer_on(void __iomem *ovl_base, unsigned int idx)
> +{
> +	unsigned int reg;
> +
> +	writel(0x1, ovl_base + DISP_REG_OVL_RDMA_CTRL(idx));
> +	writel(OVL_RDMA_MEM_GMC, ovl_base + DISP_REG_OVL_RDMA_GMC(idx));
> +
> +	reg = readl(ovl_base + DISP_REG_OVL_SRC_CON);
> +	reg = reg | (1 << idx);
> +	writel(reg, ovl_base + DISP_REG_OVL_SRC_CON);
> +}
> +
> +static void mtk_ovl_layer_off(void __iomem *ovl_base, unsigned int idx)
> +{
> +	unsigned int reg;
> +
> +	reg = readl(ovl_base + DISP_REG_OVL_SRC_CON);
> +	reg = reg & ~(1 << idx);
> +	writel(reg, ovl_base + DISP_REG_OVL_SRC_CON);
> +
> +	writel(0x0, ovl_base + DISP_REG_OVL_RDMA_CTRL(idx));
> +}
> +
> +static void mtk_ovl_layer_config(void __iomem *ovl_base, unsigned int idx,
> +		struct mtk_plane_state *state)
> +{
> +	struct mtk_plane_pending_state *pending = &state->pending;
> +	unsigned int addr = pending->addr;
> +	unsigned int pitch = pending->pitch & 0xffff;
> +	unsigned int fmt = pending->format;
> +	unsigned int offset = (pending->y << 16) | pending->x;
> +	unsigned int src_size = (pending->height << 16) | pending->width;
> +	unsigned int con;
> +
> +	con = has_rb_swapped(fmt) << 24 | ovl_fmt_convert(fmt) << 12;
> +	if (idx != 0)
> +		con |= OVL_AEN | OVL_ALPHA;
> +
> +	writel(con, ovl_base + DISP_REG_OVL_CON(idx));
> +	writel(pitch, ovl_base + DISP_REG_OVL_PITCH(idx));
> +	writel(src_size, ovl_base + DISP_REG_OVL_SRC_SIZE(idx));
> +	writel(offset, ovl_base + DISP_REG_OVL_OFFSET(idx));
> +	writel(addr, ovl_base + DISP_REG_OVL_ADDR(idx));
> +}
> +
> +static const struct mtk_ddp_comp_funcs mtk_disp_ovl_funcs = {
> +	.config = mtk_ovl_config,
> +	.start = mtk_ovl_start,
> +	.stop = mtk_ovl_stop,
> +	.enable_vblank = mtk_ovl_enable_vblank,
> +	.disable_vblank = mtk_ovl_disable_vblank,
> +	.layer_on = mtk_ovl_layer_on,
> +	.layer_off = mtk_ovl_layer_off,
> +	.layer_config = mtk_ovl_layer_config,
> +};
> +
> +static int mtk_disp_ovl_bind(struct device *dev, struct device *master,
> +		void *data)
> +{
> +	struct mtk_disp_ovl *priv = dev_get_drvdata(dev);
> +	struct drm_device *drm_dev = data;
> +	int ret;
> +
> +	priv->drm_dev = drm_dev;
> +
> +	ret = mtk_ddp_comp_register(drm_dev, &priv->ddp_comp);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to register component %s: %d\n",
> +			dev->of_node->full_name, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +
> +}
> +
> +static void mtk_disp_ovl_unbind(struct device *dev, struct device *master,
> +		void *data)
> +{
> +	struct mtk_disp_ovl *priv = dev_get_drvdata(dev);
> +	struct drm_device *drm_dev = data;
> +
> +	mtk_ddp_comp_unregister(drm_dev, &priv->ddp_comp);
> +}
> +
> +static const struct component_ops mtk_disp_ovl_component_ops = {
> +	.bind	= mtk_disp_ovl_bind,
> +	.unbind = mtk_disp_ovl_unbind,
> +};
> +
> +static int mtk_disp_ovl_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_disp_ovl *priv;
> +	int comp_id;
> +	int irq;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_irq(dev, irq, mtk_disp_ovl_irq_handler,
> +			       IRQF_TRIGGER_NONE, dev_name(dev), priv);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to request irq %d: %d\n", irq, ret);
> +		return ret;
> +	}
> +
> +	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DISP_OVL);
> +	if (comp_id < 0) {
> +		dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
> +		return comp_id;
> +	}
> +
> +	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
> +				&mtk_disp_ovl_funcs);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize component: %d\n", ret);
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	ret = component_add(dev, &mtk_disp_ovl_component_ops);
> +	if (ret)
> +		dev_err(dev, "Failed to add component: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int mtk_disp_ovl_remove(struct platform_device *pdev)
> +{
> +	component_del(&pdev->dev, &mtk_disp_ovl_component_ops);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
> +	{ .compatible = "mediatek,mt8173-disp-ovl", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_disp_ovl_driver_dt_match);
> +
> +struct platform_driver mtk_disp_ovl_driver = {
> +	.probe		= mtk_disp_ovl_probe,
> +	.remove		= mtk_disp_ovl_remove,
> +	.driver		= {
> +		.name	= "mediatek-disp-ovl",
> +		.owner	= THIS_MODULE,
> +		.of_match_table = mtk_disp_ovl_driver_dt_match,
> +	},
> +};
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> new file mode 100644
> index 0000000..ec0540f
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -0,0 +1,565 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <asm/barrier.h>
> +#include <drm/drmP.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_plane_helper.h>
> +#include <linux/clk.h>
> +#include <linux/pm_runtime.h>
> +#include <soc/mediatek/smi.h>
> +
> +#include "mtk_drm_drv.h"
> +#include "mtk_drm_crtc.h"
> +#include "mtk_drm_ddp.h"
> +#include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_gem.h"
> +#include "mtk_drm_plane.h"
> +
> +/**
> + * struct mtk_drm_crtc - MediaTek specific crtc structure.
> + * @base: crtc object.
> + * @pipe: a crtc index created at load() with a new crtc object creation
> + *	and the crtc object would be set to private->crtc array
> + *	to get a crtc object corresponding to this pipe from private->crtc
> + *	array when irq interrupt occurred. the reason of using this pipe is that
> + *	drm framework doesn't support multiple irq yet.
> + *	we can refer to the crtc to current hardware interrupt occurred through
> + *	this pipe value.
> + * @enabled: records whether crtc_enable succeeded
> + * @do_flush: enabled by atomic_flush, causes plane atomic_update to commit
> + *            changed state immediately.
> + * @planes: array of 4 mtk_drm_plane structures, one for each overlay plane
> + * @config_regs: memory mapped mmsys configuration register space
> + * @mutex: handle to one of the ten disp_mutex streams
> + * @ddp_comp_nr: number of components in ddp_comp
> + * @ddp_comp: array of pointers the mtk_ddp_comp structures used by this crtc
> + */
> +struct mtk_drm_crtc {
> +	struct drm_crtc			base;
> +	unsigned int			pipe;
> +	bool				enabled;
> +
> +	bool				do_flush;
> +
> +	struct mtk_drm_plane		planes[OVL_LAYER_NR];
> +
> +	void __iomem			*config_regs;
> +	struct mtk_disp_mutex		*mutex;
> +	unsigned int			ddp_comp_nr;
> +	struct mtk_ddp_comp		**ddp_comp;
> +};
> +
> +struct mtk_crtc_state {
> +	struct drm_crtc_state		base;
> +	struct drm_pending_vblank_event	*event;
> +
> +	bool				pending_config;
> +	unsigned int			pending_width;
> +	unsigned int			pending_height;
> +	unsigned int			pending_vrefresh;
> +};
> +
> +static inline struct mtk_drm_crtc *to_mtk_crtc(struct drm_crtc *c)
> +{
> +	return container_of(c, struct mtk_drm_crtc, base);
> +}
> +
> +static inline struct mtk_crtc_state *to_mtk_crtc_state(struct drm_crtc_state *s)
> +{
> +	return container_of(s, struct mtk_crtc_state, base);
> +}
> +
> +static struct mtk_drm_crtc *mtk_crtc_by_comp(struct mtk_drm_private *priv,
> +					     struct mtk_ddp_comp *ddp_comp)
> +{
> +	struct mtk_drm_crtc *mtk_crtc;
> +	int i;
> +
> +	for (i = 0; i < MAX_CRTC; i++) {
> +		mtk_crtc = to_mtk_crtc(priv->crtc[i]);
> +		if (mtk_crtc->ddp_comp[0] == ddp_comp)
> +			return mtk_crtc;
> +	}
> +
> +	return NULL;
> +}
> +
> +static void mtk_drm_crtc_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
> +{
> +	struct drm_crtc *crtc = &mtk_crtc->base;
> +	struct mtk_crtc_state *state = to_mtk_crtc_state(crtc->state);
> +
> +	drm_send_vblank_event(crtc->dev, state->event->pipe, state->event);
> +	drm_crtc_vblank_put(crtc);
> +	state->event = NULL;
> +}
> +
> +static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
> +{
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +	int i;
> +
> +	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
> +		clk_unprepare(mtk_crtc->ddp_comp[i]->clk);
> +
> +	mtk_disp_mutex_put(mtk_crtc->mutex);
> +
> +	drm_crtc_cleanup(crtc);
> +}
> +
> +static void mtk_drm_crtc_reset(struct drm_crtc *crtc)
> +{
> +	struct mtk_crtc_state *state;
> +
> +	if (crtc->state && crtc->state->mode_blob)
> +		drm_property_unreference_blob(crtc->state->mode_blob);
> +
> +	kfree(crtc->state);
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	crtc->state = &state->base;
> +
> +	if (state)
> +		crtc->state->crtc = crtc;
> +}
> +
> +static struct drm_crtc_state *mtk_drm_crtc_duplicate_state(struct drm_crtc *crtc)
> +{
> +	struct mtk_crtc_state *state;
> +
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return NULL;
> +
> +	__drm_atomic_helper_crtc_duplicate_state(crtc, &state->base);
> +
> +	WARN_ON(state->base.crtc != crtc);
> +	state->base.crtc = crtc;
> +
> +	return &state->base;
> +}
> +
> +static bool mtk_drm_crtc_mode_fixup(struct drm_crtc *crtc,
> +		const struct drm_display_mode *mode,
> +		struct drm_display_mode *adjusted_mode)
> +{
> +	/* Nothing to do here, but this callback is mandatory. */
> +	return true;
> +}
> +
> +static void mtk_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
> +{
> +	struct mtk_crtc_state *state = to_mtk_crtc_state(crtc->state);
> +
> +	state->pending_width = crtc->mode.hdisplay;
> +	state->pending_height = crtc->mode.vdisplay;
> +	state->pending_vrefresh = crtc->mode.vrefresh;
> +	wmb();
> +	state->pending_config = true;
> +}
> +
> +int mtk_drm_crtc_enable_vblank(struct drm_device *drm, unsigned int pipe)
> +{
> +	struct mtk_drm_private *priv = drm->dev_private;
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(priv->crtc[pipe]);
> +	struct mtk_ddp_comp *ovl = mtk_crtc->ddp_comp[0];
> +
> +	mtk_ddp_comp_enable_vblank(ovl);
> +
> +	return 0;
> +}
> +
> +void mtk_drm_crtc_disable_vblank(struct drm_device *drm, unsigned int pipe)
> +{
> +	struct mtk_drm_private *priv = drm->dev_private;
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(priv->crtc[pipe]);
> +	struct mtk_ddp_comp *ovl = mtk_crtc->ddp_comp[0];
> +
> +	mtk_ddp_comp_disable_vblank(ovl);
> +}
> +
> +static int mtk_crtc_ddp_power_on(struct mtk_drm_crtc *mtk_crtc)
> +{
> +	int ret;
> +	int i;
> +
> +	DRM_DEBUG_DRIVER("%s\n", __func__);
> +	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
> +		ret = clk_enable(mtk_crtc->ddp_comp[i]->clk);
> +		if (ret) {
> +			DRM_ERROR("Failed to enable clock %d: %d\n", i, ret);
> +			goto err;
> +		}
> +	}
> +
> +	return 0;
> +err:
> +	while (--i >= 0)
> +		clk_disable(mtk_crtc->ddp_comp[i]->clk);
> +	return ret;
> +}
> +
> +static void mtk_crtc_ddp_power_off(struct mtk_drm_crtc *mtk_crtc)
> +{
> +	int i;
> +
> +	DRM_DEBUG_DRIVER("%s\n", __func__);
> +	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
> +		clk_disable(mtk_crtc->ddp_comp[i]->clk);
> +}
> +
> +static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
> +{
> +	struct drm_crtc *crtc = &mtk_crtc->base;
> +	unsigned int width, height, vrefresh;
> +	int ret;
> +	int i;
> +
> +	DRM_DEBUG_DRIVER("%s\n", __func__);
> +	if (WARN_ON(!crtc->state))
> +		return -EINVAL;
> +
> +	width = crtc->state->adjusted_mode.hdisplay;
> +	height = crtc->state->adjusted_mode.vdisplay;
> +	vrefresh = crtc->state->adjusted_mode.vrefresh;
> +
> +	ret = pm_runtime_get_sync(crtc->dev->dev);
> +	if (ret < 0) {
> +		DRM_ERROR("Failed to enable power domain: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mtk_disp_mutex_prepare(mtk_crtc->mutex);
> +	if (ret < 0) {
> +		DRM_ERROR("Failed to enable mutex clock: %d\n", ret);
> +		goto err_pm_runtime_put;
> +	}
> +
> +	ret = mtk_crtc_ddp_power_on(mtk_crtc);
> +	if (ret < 0) {
> +		DRM_ERROR("Failed to enable component clocks: %d\n", ret);
> +		goto err_mutex_unprepare;
> +	}
> +
> +	DRM_DEBUG_DRIVER("mediatek_ddp_ddp_path_setup\n");
> +	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
> +		mtk_ddp_add_comp_to_path(mtk_crtc->config_regs,
> +					 mtk_crtc->ddp_comp[i]->id,
> +					 mtk_crtc->ddp_comp[i + 1]->id);
> +		mtk_disp_mutex_add_comp(mtk_crtc->mutex,
> +					mtk_crtc->ddp_comp[i]->id);
> +	}
> +	mtk_disp_mutex_add_comp(mtk_crtc->mutex, mtk_crtc->ddp_comp[i]->id);
> +	mtk_disp_mutex_enable(mtk_crtc->mutex);
> +
> +	DRM_DEBUG_DRIVER("ddp_disp_path_power_on %dx%d\n", width, height);
> +	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
> +		struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[i];
> +
> +		mtk_ddp_comp_config(comp, width, height, vrefresh);
> +		mtk_ddp_comp_start(comp);
> +	}
> +
> +	return 0;
> +
> +err_mutex_unprepare:
> +	mtk_disp_mutex_unprepare(mtk_crtc->mutex);
> +err_pm_runtime_put:
> +	pm_runtime_put(crtc->dev->dev);
> +	return ret;
> +}
> +
> +static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
> +{
> +	struct drm_device *drm = mtk_crtc->base.dev;
> +	int i;
> +
> +	DRM_DEBUG_DRIVER("%s\n", __func__);
> +	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
> +		mtk_ddp_comp_stop(mtk_crtc->ddp_comp[i]);
> +	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
> +		mtk_disp_mutex_remove_comp(mtk_crtc->mutex,
> +					   mtk_crtc->ddp_comp[i]->id);
> +	mtk_disp_mutex_disable(mtk_crtc->mutex);
> +	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
> +		mtk_ddp_remove_comp_from_path(mtk_crtc->config_regs,
> +					      mtk_crtc->ddp_comp[i]->id,
> +					      mtk_crtc->ddp_comp[i + 1]->id);
> +		mtk_disp_mutex_remove_comp(mtk_crtc->mutex,
> +					   mtk_crtc->ddp_comp[i]->id);
> +	}
> +	mtk_disp_mutex_remove_comp(mtk_crtc->mutex, mtk_crtc->ddp_comp[i]->id);
> +	mtk_crtc_ddp_power_off(mtk_crtc);
> +	mtk_disp_mutex_unprepare(mtk_crtc->mutex);
> +
> +	pm_runtime_put(drm->dev);
> +}
> +
> +static void mtk_drm_crtc_enable(struct drm_crtc *crtc)
> +{
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +	struct mtk_ddp_comp *ovl = mtk_crtc->ddp_comp[0];
> +	int ret;
> +
> +	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
> +
> +	ret = mtk_smi_larb_get(ovl->larb_dev);
> +	if (ret) {
> +		DRM_ERROR("Failed to get larb: %d\n", ret);
> +		return;
> +	}
> +
> +	ret = mtk_crtc_ddp_hw_init(mtk_crtc);
> +	if (ret) {
> +		mtk_smi_larb_put(ovl->larb_dev);
> +		return;
> +	}
> +
> +	drm_crtc_vblank_on(crtc);
> +	mtk_crtc->enabled = true;
> +}
> +
> +static void mtk_drm_crtc_disable(struct drm_crtc *crtc)
> +{
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +	struct mtk_ddp_comp *ovl = mtk_crtc->ddp_comp[0];
> +	int i;
> +
> +	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
> +	if (WARN_ON(!mtk_crtc->enabled))
> +		return;
> +
> +	/* Set all pending plane state to disabled */
> +	for (i = 0; i < OVL_LAYER_NR; i++) {
> +		struct drm_plane *plane = &mtk_crtc->planes[i].base;
> +		struct mtk_plane_state *plane_state;
> +
> +		plane_state = to_mtk_plane_state(plane->state);
> +		plane_state->pending.enable = false;
> +		plane_state->pending.config = true;
> +	}
> +
> +	/* Wait for planes to be disabled */
> +	drm_crtc_wait_one_vblank(crtc);
> +
> +	drm_crtc_vblank_off(crtc);
> +	mtk_crtc_ddp_hw_fini(mtk_crtc);
> +	mtk_smi_larb_put(ovl->larb_dev);
> +
> +	mtk_crtc->do_flush = false;
> +	mtk_crtc->enabled = false;
> +}
> +
> +static void mtk_drm_crtc_atomic_begin(struct drm_crtc *crtc,
> +				      struct drm_crtc_state *old_crtc_state)
> +{
> +	struct mtk_crtc_state *state = to_mtk_crtc_state(crtc->state);
> +
> +	if (state->base.event) {
> +		state->base.event->pipe = drm_crtc_index(crtc);
> +		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
> +		state->event = state->base.event;
> +		state->base.event = NULL;
> +	}
> +}
> +
> +void mtk_drm_crtc_commit(struct drm_crtc *crtc)
> +{
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +	unsigned int i;
> +
> +	for (i = 0; i < OVL_LAYER_NR; i++) {
> +		struct drm_plane *plane = &mtk_crtc->planes[i].base;
> +		struct mtk_plane_state *plane_state;
> +
> +		plane_state = to_mtk_plane_state(plane->state);
> +		if (plane_state->pending.dirty) {
> +			plane_state->pending.config = true;
> +			plane_state->pending.dirty = false;
> +		}
> +	}
> +}
> +
> +static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
> +				      struct drm_crtc_state *old_crtc_state)
> +{
> +	mtk_drm_crtc_commit(crtc);
> +}
> +
> +static const struct drm_crtc_funcs mtk_crtc_funcs = {
> +	.set_config		= drm_atomic_helper_set_config,
> +	.page_flip		= drm_atomic_helper_page_flip,
> +	.destroy		= mtk_drm_crtc_destroy,
> +	.reset			= mtk_drm_crtc_reset,
> +	.atomic_duplicate_state	= mtk_drm_crtc_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
> +};
> +
> +static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
> +	.mode_fixup	= mtk_drm_crtc_mode_fixup,
> +	.mode_set_nofb	= mtk_drm_crtc_mode_set_nofb,
> +	.enable		= mtk_drm_crtc_enable,
> +	.disable	= mtk_drm_crtc_disable,
> +	.atomic_begin	= mtk_drm_crtc_atomic_begin,
> +	.atomic_flush	= mtk_drm_crtc_atomic_flush,
> +};
> +
> +static int mtk_drm_crtc_init(struct drm_device *drm,
> +		struct mtk_drm_crtc *mtk_crtc, struct drm_plane *primary,
> +		struct drm_plane *cursor, unsigned int pipe)
> +{
> +	int ret;
> +
> +	ret = drm_crtc_init_with_planes(drm, &mtk_crtc->base, primary, cursor,
> +			&mtk_crtc_funcs);
> +	if (ret)
> +		goto err_cleanup_crtc;
> +
> +	drm_crtc_helper_add(&mtk_crtc->base, &mtk_crtc_helper_funcs);
> +
> +	mtk_crtc->pipe = pipe;
> +
> +	return 0;
> +
> +err_cleanup_crtc:
> +	drm_crtc_cleanup(&mtk_crtc->base);
> +	return ret;
> +}
> +
> +void mtk_crtc_ddp_irq(struct drm_device *drm_dev, struct mtk_ddp_comp *ovl)
> +{
> +	struct mtk_drm_private *priv = drm_dev->dev_private;
> +	struct mtk_drm_crtc *mtk_crtc;
> +	struct mtk_crtc_state *state;
> +	unsigned int i;
> +
> +	mtk_crtc = mtk_crtc_by_comp(priv, ovl);
> +	if (WARN_ON(!mtk_crtc))
> +		return;
> +
> +	state = to_mtk_crtc_state(mtk_crtc->base.state);
> +
> +	/*
> +	 * TODO: instead of updating the registers here, we should prepare
> +	 * working registers in atomic_commit and let the hardware command
> +	 * queue update module registers on vblank.
> +	 */
> +	if (state->pending_config) {
> +		mtk_ddp_comp_config(ovl, state->pending_width,
> +				    state->pending_height,
> +				    state->pending_vrefresh);
> +
> +		state->pending_config = false;
> +	}
> +
> +	for (i = 0; i < OVL_LAYER_NR; i++) {
> +		struct drm_plane *plane = &mtk_crtc->planes[i].base;
> +		struct mtk_plane_state *plane_state;
> +
> +		plane_state = to_mtk_plane_state(plane->state);
> +
> +		if (plane_state->pending.config) {
> +			if (!plane_state->pending.enable)
> +				mtk_ddp_comp_layer_off(ovl, i);
> +
> +			mtk_ddp_comp_layer_config(ovl, i, plane_state);
> +
> +			if (plane_state->pending.enable)
> +				mtk_ddp_comp_layer_on(ovl, i);
> +
> +			plane_state->pending.config = false;
> +		}
> +	}
> +
> +	drm_handle_vblank(mtk_crtc->base.dev, mtk_crtc->pipe);
> +}
> +
> +int mtk_drm_crtc_create(struct drm_device *drm_dev,
> +			const enum mtk_ddp_comp_id *path, unsigned int path_len)
> +{
> +	struct mtk_drm_private *priv = drm_dev->dev_private;
> +	struct device *dev = drm_dev->dev;
> +	struct mtk_drm_crtc *mtk_crtc;
> +	enum drm_plane_type type;
> +	unsigned int zpos;
> +	int pipe = priv->num_pipes;
> +	int ret;
> +	int i;
> +
> +	mtk_crtc = devm_kzalloc(dev, sizeof(*mtk_crtc), GFP_KERNEL);
> +	if (!mtk_crtc)
> +		return -ENOMEM;
> +
> +	mtk_crtc->config_regs = priv->config_regs;
> +	mtk_crtc->ddp_comp_nr = path_len;
> +	mtk_crtc->ddp_comp = devm_kmalloc_array(dev, mtk_crtc->ddp_comp_nr,
> +						sizeof(*mtk_crtc->ddp_comp),
> +						GFP_KERNEL);
> +
> +	mtk_crtc->mutex = mtk_disp_mutex_get(priv->mutex_dev, pipe);
> +	if (IS_ERR(mtk_crtc->mutex)) {
> +		ret = PTR_ERR(mtk_crtc->mutex);
> +		dev_err(dev, "Failed to get mutex: %d\n", ret);
> +		return ret;
> +	}
> +
> +	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
> +		enum mtk_ddp_comp_id comp_id = path[i];
> +		struct mtk_ddp_comp *comp;
> +
> +		comp = priv->ddp_comp[comp_id];
> +		if (!comp) {
> +			dev_err(dev, "Component %s not initialized\n",
> +				priv->comp_node[comp_id]->full_name);
> +			ret = -ENODEV;
> +			goto unprepare;
> +		}
> +
> +		ret = clk_prepare(comp->clk);
> +		if (ret) {
> +			dev_err(dev,
> +				"Failed to prepare clock for component %s: %d\n",
> +				priv->comp_node[comp_id]->full_name, ret);
> +			goto unprepare;
> +		}
> +
> +		mtk_crtc->ddp_comp[i] = comp;
> +	}
> +
> +	for (zpos = 0; zpos < OVL_LAYER_NR; zpos++) {
> +		type = (zpos == 0) ? DRM_PLANE_TYPE_PRIMARY :
> +				(zpos == 1) ? DRM_PLANE_TYPE_CURSOR :
> +						DRM_PLANE_TYPE_OVERLAY;
> +		ret = mtk_plane_init(drm_dev, &mtk_crtc->planes[zpos],
> +				     BIT(pipe), type, zpos);
> +		if (ret)
> +			goto unprepare;
> +	}
> +
> +	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, &mtk_crtc->planes[0].base,
> +				&mtk_crtc->planes[1].base, pipe);
> +	if (ret < 0)
> +		goto unprepare;
> +
> +	priv->crtc[pipe] = &mtk_crtc->base;
> +	priv->num_pipes++;
> +
> +	return 0;
> +
> +unprepare:
> +	while (--i >= 0)
> +		clk_unprepare(mtk_crtc->ddp_comp[i]->clk);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> new file mode 100644
> index 0000000..f04854f
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> @@ -0,0 +1,31 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef MTK_DRM_CRTC_H
> +#define MTK_DRM_CRTC_H
> +
> +#include <drm/drm_crtc.h>
> +#include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_plane.h"
> +
> +#define OVL_LAYER_NR	4
> +
> +int mtk_drm_crtc_enable_vblank(struct drm_device *drm, unsigned int pipe);
> +void mtk_drm_crtc_disable_vblank(struct drm_device *drm, unsigned int pipe);
> +void mtk_drm_crtc_commit(struct drm_crtc *crtc);
> +void mtk_crtc_ddp_irq(struct drm_device *drm_dev, struct mtk_ddp_comp *ovl);
> +int mtk_drm_crtc_create(struct drm_device *drm_dev,
> +			const enum mtk_ddp_comp_id *path,
> +			unsigned int path_len);
> +
> +#endif /* MTK_DRM_CRTC_H */
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> new file mode 100644
> index 0000000..16584e4
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> @@ -0,0 +1,355 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include "mtk_drm_ddp.h"
> +#include "mtk_drm_ddp_comp.h"
> +
> +#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x040
> +#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN	0x044
> +#define DISP_REG_CONFIG_DISP_OD_MOUT_EN		0x048
> +#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN	0x04c
> +#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN	0x050
> +#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x084
> +#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN	0x088
> +#define DISP_REG_CONFIG_DPI_SEL_IN		0x0ac
> +#define DISP_REG_CONFIG_DISP_RDMA1_MOUT_EN	0x0c8
> +#define DISP_REG_CONFIG_MMSYS_CG_CON0		0x100
> +
> +#define DISP_REG_MUTEX_EN(n)	(0x20 + 0x20 * (n))
> +#define DISP_REG_MUTEX_RST(n)	(0x28 + 0x20 * (n))
> +#define DISP_REG_MUTEX_MOD(n)	(0x2c + 0x20 * (n))
> +#define DISP_REG_MUTEX_SOF(n)	(0x30 + 0x20 * (n))
> +
> +#define MUTEX_MOD_DISP_OVL0		BIT(11)
> +#define MUTEX_MOD_DISP_OVL1		BIT(12)
> +#define MUTEX_MOD_DISP_RDMA0		BIT(13)
> +#define MUTEX_MOD_DISP_RDMA1		BIT(14)
> +#define MUTEX_MOD_DISP_RDMA2		BIT(15)
> +#define MUTEX_MOD_DISP_WDMA0		BIT(16)
> +#define MUTEX_MOD_DISP_WDMA1		BIT(17)
> +#define MUTEX_MOD_DISP_COLOR0		BIT(18)
> +#define MUTEX_MOD_DISP_COLOR1		BIT(19)
> +#define MUTEX_MOD_DISP_AAL		BIT(20)
> +#define MUTEX_MOD_DISP_GAMMA		BIT(21)
> +#define MUTEX_MOD_DISP_UFOE		BIT(22)
> +#define MUTEX_MOD_DISP_PWM0		BIT(23)
> +#define MUTEX_MOD_DISP_PWM1		BIT(24)
> +#define MUTEX_MOD_DISP_OD		BIT(25)
> +
> +#define MUTEX_SOF_SINGLE_MODE		0
> +#define MUTEX_SOF_DSI0			1
> +#define MUTEX_SOF_DSI1			2
> +#define MUTEX_SOF_DPI0			3
> +
> +#define OVL0_MOUT_EN_COLOR0		0x1
> +#define OD_MOUT_EN_RDMA0		0x1
> +#define UFOE_MOUT_EN_DSI0		0x1
> +#define COLOR0_SEL_IN_OVL0		0x1
> +#define OVL1_MOUT_EN_COLOR1		0x1
> +#define GAMMA_MOUT_EN_RDMA1		0x1
> +#define RDMA1_MOUT_DPI0			0x2
> +#define DPI0_SEL_IN_RDMA1		0x1
> +#define COLOR1_SEL_IN_OVL1		0x1
> +
> +struct mtk_disp_mutex {
> +	int id;
> +	bool claimed;
> +};
> +
> +struct mtk_ddp {
> +	struct device			*dev;
> +	struct clk			*clk;
> +	void __iomem			*regs;
> +	struct mtk_disp_mutex		mutex[10];
> +};
> +
> +static const unsigned int mutex_mod[DDP_COMPONENT_ID_MAX] = {
> +	[DDP_COMPONENT_AAL] = MUTEX_MOD_DISP_AAL,
> +	[DDP_COMPONENT_COLOR0] = MUTEX_MOD_DISP_COLOR0,
> +	[DDP_COMPONENT_COLOR1] = MUTEX_MOD_DISP_COLOR1,
> +	[DDP_COMPONENT_GAMMA] = MUTEX_MOD_DISP_GAMMA,
> +	[DDP_COMPONENT_OD] = MUTEX_MOD_DISP_OD,
> +	[DDP_COMPONENT_OVL0] = MUTEX_MOD_DISP_OVL0,
> +	[DDP_COMPONENT_OVL1] = MUTEX_MOD_DISP_OVL1,
> +	[DDP_COMPONENT_PWM0] = MUTEX_MOD_DISP_PWM0,
> +	[DDP_COMPONENT_PWM1] = MUTEX_MOD_DISP_PWM1,
> +	[DDP_COMPONENT_RDMA0] = MUTEX_MOD_DISP_RDMA0,
> +	[DDP_COMPONENT_RDMA1] = MUTEX_MOD_DISP_RDMA1,
> +	[DDP_COMPONENT_RDMA2] = MUTEX_MOD_DISP_RDMA2,
> +	[DDP_COMPONENT_UFOE] = MUTEX_MOD_DISP_UFOE,
> +	[DDP_COMPONENT_WDMA0] = MUTEX_MOD_DISP_WDMA0,
> +	[DDP_COMPONENT_WDMA1] = MUTEX_MOD_DISP_WDMA1,
> +};
> +
> +static unsigned int mtk_ddp_mout_en(enum mtk_ddp_comp_id cur,
> +				    enum mtk_ddp_comp_id next,
> +				    unsigned int *addr)
> +{
> +	unsigned int value;
> +
> +	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> +		*addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
> +		value = OVL0_MOUT_EN_COLOR0;
> +	} else if (cur == DDP_COMPONENT_OD && next == DDP_COMPONENT_RDMA0) {
> +		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> +		value = OD_MOUT_EN_RDMA0;
> +	} else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
> +		*addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
> +		value = UFOE_MOUT_EN_DSI0;
> +	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> +		*addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
> +		value = OVL1_MOUT_EN_COLOR1;
> +	} else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
> +		*addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
> +		value = GAMMA_MOUT_EN_RDMA1;
> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> +		*addr = DISP_REG_CONFIG_DISP_RDMA1_MOUT_EN;
> +		value = RDMA1_MOUT_DPI0;
> +	} else {
> +		value = 0;
> +	}
> +
> +	return value;
> +}
> +
> +static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
> +				   enum mtk_ddp_comp_id next,
> +				   unsigned int *addr)
> +{
> +	unsigned int value;
> +
> +	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> +		*addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
> +		value = COLOR0_SEL_IN_OVL0;
> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> +		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
> +		value = DPI0_SEL_IN_RDMA1;
> +	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> +		*addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
> +		value = COLOR1_SEL_IN_OVL1;
> +	} else {
> +		value = 0;
> +	}
> +
> +	return value;
> +}
> +
> +void mtk_ddp_add_comp_to_path(void __iomem *config_regs,
> +			      enum mtk_ddp_comp_id cur,
> +			      enum mtk_ddp_comp_id next)
> +{
> +	unsigned int addr, value, reg;
> +
> +	value = mtk_ddp_mout_en(cur, next, &addr);
> +	if (value) {
> +		reg = readl_relaxed(config_regs + addr) | value;
> +		writel_relaxed(reg, config_regs + addr);
> +	}
> +
> +	value = mtk_ddp_sel_in(cur, next, &addr);
> +	if (value) {
> +		reg = readl_relaxed(config_regs + addr) | value;
> +		writel_relaxed(reg, config_regs + addr);
> +	}
> +}
> +
> +void mtk_ddp_remove_comp_from_path(void __iomem *config_regs,
> +				   enum mtk_ddp_comp_id cur,
> +				   enum mtk_ddp_comp_id next)
> +{
> +	unsigned int addr, value, reg;
> +
> +	value = mtk_ddp_mout_en(cur, next, &addr);
> +	if (value) {
> +		reg = readl_relaxed(config_regs + addr) & ~value;
> +		writel_relaxed(reg, config_regs + addr);
> +	}
> +
> +	value = mtk_ddp_sel_in(cur, next, &addr);
> +	if (value) {
> +		reg = readl_relaxed(config_regs + addr) & ~value;
> +		writel_relaxed(reg, config_regs + addr);
> +	}
> +}
> +
> +struct mtk_disp_mutex *mtk_disp_mutex_get(struct device *dev, unsigned int id)
> +{
> +	struct mtk_ddp *ddp = dev_get_drvdata(dev);
> +
> +	if (id >= 10)
> +		return ERR_PTR(-EINVAL);
> +	if (ddp->mutex[id].claimed)
> +		return ERR_PTR(-EBUSY);
> +
> +	ddp->mutex[id].claimed = true;
> +
> +	return &ddp->mutex[id];
> +}
> +
> +void mtk_disp_mutex_put(struct mtk_disp_mutex *mutex)
> +{
> +	struct mtk_ddp *ddp = container_of(mutex, struct mtk_ddp,
> +					   mutex[mutex->id]);
> +
> +	WARN_ON(&ddp->mutex[mutex->id] != mutex);
> +
> +	mutex->claimed = false;
> +}
> +
> +int mtk_disp_mutex_prepare(struct mtk_disp_mutex *mutex)
> +{
> +	struct mtk_ddp *ddp = container_of(mutex, struct mtk_ddp,
> +					   mutex[mutex->id]);
> +	return clk_prepare_enable(ddp->clk);
> +}
> +
> +void mtk_disp_mutex_unprepare(struct mtk_disp_mutex *mutex)
> +{
> +	struct mtk_ddp *ddp = container_of(mutex, struct mtk_ddp,
> +					   mutex[mutex->id]);
> +	clk_disable_unprepare(ddp->clk);
> +}
> +
> +void mtk_disp_mutex_add_comp(struct mtk_disp_mutex *mutex,
> +			     enum mtk_ddp_comp_id id)
> +{
> +	struct mtk_ddp *ddp = container_of(mutex, struct mtk_ddp,
> +					   mutex[mutex->id]);
> +	unsigned int reg;
> +
> +	WARN_ON(&ddp->mutex[mutex->id] != mutex);
> +
> +	switch (id) {
> +	case DDP_COMPONENT_DSI0:
> +		reg = MUTEX_SOF_DSI0;
> +		break;
> +	case DDP_COMPONENT_DSI1:
> +		reg = MUTEX_SOF_DSI0;
> +		break;
> +	case DDP_COMPONENT_DPI0:
> +		reg = MUTEX_SOF_DPI0;
> +		break;
> +	default:
> +		reg = readl_relaxed(ddp->regs + DISP_REG_MUTEX_MOD(mutex->id));
> +		reg |= mutex_mod[id];
> +		writel_relaxed(reg, ddp->regs + DISP_REG_MUTEX_MOD(mutex->id));
> +		return;
> +	}
> +
> +	writel_relaxed(reg, ddp->regs + DISP_REG_MUTEX_SOF(mutex->id));
> +}
> +
> +void mtk_disp_mutex_remove_comp(struct mtk_disp_mutex *mutex,
> +				enum mtk_ddp_comp_id id)
> +{
> +	struct mtk_ddp *ddp = container_of(mutex, struct mtk_ddp,
> +					   mutex[mutex->id]);
> +	unsigned int reg;
> +
> +	WARN_ON(&ddp->mutex[mutex->id] != mutex);
> +
> +	switch (id) {
> +	case DDP_COMPONENT_DSI0:
> +	case DDP_COMPONENT_DSI1:
> +	case DDP_COMPONENT_DPI0:
> +		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
> +			       ddp->regs + DISP_REG_MUTEX_SOF(mutex->id));
> +		break;
> +	default:
> +		reg = readl_relaxed(ddp->regs + DISP_REG_MUTEX_MOD(mutex->id));
> +		reg &= ~mutex_mod[id];
> +		writel_relaxed(reg, ddp->regs + DISP_REG_MUTEX_MOD(mutex->id));
> +		break;
> +	}
> +}
> +
> +void mtk_disp_mutex_enable(struct mtk_disp_mutex *mutex)
> +{
> +	struct mtk_ddp *ddp = container_of(mutex, struct mtk_ddp,
> +					   mutex[mutex->id]);
> +
> +	WARN_ON(&ddp->mutex[mutex->id] != mutex);
> +
> +	writel(1, ddp->regs + DISP_REG_MUTEX_EN(mutex->id));
> +}
> +
> +void mtk_disp_mutex_disable(struct mtk_disp_mutex *mutex)
> +{
> +	struct mtk_ddp *ddp = container_of(mutex, struct mtk_ddp,
> +					   mutex[mutex->id]);
> +
> +	WARN_ON(&ddp->mutex[mutex->id] != mutex);
> +
> +	writel(0, ddp->regs + DISP_REG_MUTEX_EN(mutex->id));
> +}
> +
> +static int mtk_ddp_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_ddp *ddp;
> +	struct resource *regs;
> +	int i;
> +
> +	ddp = devm_kzalloc(dev, sizeof(*ddp), GFP_KERNEL);
> +	if (!ddp)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < 10; i++)
> +		ddp->mutex[i].id = i;
> +
> +	ddp->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(ddp->clk)) {
> +		dev_err(dev, "Failed to get clock\n");
> +		return PTR_ERR(ddp->clk);
> +	}
> +
> +	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	ddp->regs = devm_ioremap_resource(dev, regs);
> +	if (IS_ERR(ddp->regs)) {
> +		dev_err(dev, "Failed to map mutex registers\n");
> +		return PTR_ERR(ddp->regs);
> +	}
> +
> +	platform_set_drvdata(pdev, ddp);
> +
> +	return 0;
> +}
> +
> +static int mtk_ddp_remove(struct platform_device *pdev)
> +{
> +	return 0;
> +}
> +
> +static const struct of_device_id ddp_driver_dt_match[] = {
> +	{ .compatible = "mediatek,mt8173-disp-mutex" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ddp_driver_dt_match);
> +
> +static struct platform_driver mtk_ddp_driver = {
> +	.probe		= mtk_ddp_probe,
> +	.remove		= mtk_ddp_remove,
> +	.driver		= {
> +		.name	= "mediatek-ddp",
> +		.owner	= THIS_MODULE,
> +		.of_match_table = ddp_driver_dt_match,
> +	},
> +};
> +
> +module_platform_driver(mtk_ddp_driver);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
> new file mode 100644
> index 0000000..92c1175
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
> @@ -0,0 +1,41 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef MTK_DRM_DDP_H
> +#define MTK_DRM_DDP_H
> +
> +#include "mtk_drm_ddp_comp.h"
> +
> +struct regmap;
> +struct device;
> +struct mtk_disp_mutex;
> +
> +void mtk_ddp_add_comp_to_path(void __iomem *config_regs,
> +			      enum mtk_ddp_comp_id cur,
> +			      enum mtk_ddp_comp_id next);
> +void mtk_ddp_remove_comp_from_path(void __iomem *config_regs,
> +				   enum mtk_ddp_comp_id cur,
> +				   enum mtk_ddp_comp_id next);
> +
> +struct mtk_disp_mutex *mtk_disp_mutex_get(struct device *dev, unsigned int id);
> +int mtk_disp_mutex_prepare(struct mtk_disp_mutex *mutex);
> +void mtk_disp_mutex_add_comp(struct mtk_disp_mutex *mutex,
> +			     enum mtk_ddp_comp_id id);
> +void mtk_disp_mutex_enable(struct mtk_disp_mutex *mutex);
> +void mtk_disp_mutex_disable(struct mtk_disp_mutex *mutex);
> +void mtk_disp_mutex_remove_comp(struct mtk_disp_mutex *mutex,
> +				enum mtk_ddp_comp_id id);
> +void mtk_disp_mutex_unprepare(struct mtk_disp_mutex *mutex);
> +void mtk_disp_mutex_put(struct mtk_disp_mutex *mutex);
> +
> +#endif /* MTK_DRM_DDP_H */
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> new file mode 100644
> index 0000000..49ae1a3
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -0,0 +1,275 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + * Authors:
> + *	YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> + *	CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <drm/drmP.h>
> +#include "mtk_drm_drv.h"
> +#include "mtk_drm_plane.h"
> +#include "mtk_drm_ddp_comp.h"
> +
> +#define DISP_REG_RDMA_INT_ENABLE		0x0000
> +#define DISP_REG_RDMA_INT_STATUS		0x0004
> +#define DISP_REG_RDMA_GLOBAL_CON		0x0010
> +#define DISP_REG_RDMA_SIZE_CON_0		0x0014
> +#define DISP_REG_RDMA_SIZE_CON_1		0x0018
> +#define DISP_REG_RDMA_FIFO_CON			0x0040
> +#define RDMA_FIFO_UNDERFLOW_EN				BIT(31)
> +#define RDMA_FIFO_PSEUDO_SIZE(bytes)			(((bytes) / 16) << 16)
> +#define RDMA_OUTPUT_VALID_FIFO_THRESHOLD(bytes)		((bytes) / 16)
> +
> +#define DISP_OD_EN				0x0000
> +#define DISP_OD_INTEN				0x0008
> +#define DISP_OD_INTSTA				0x000c
> +#define DISP_OD_CFG				0x0020
> +#define DISP_OD_SIZE				0x0030
> +
> +#define DISP_REG_UFO_START			0x0000
> +
> +#define DISP_COLOR_CFG_MAIN			0x0400
> +#define DISP_COLOR_START			0x0c00
> +#define DISP_COLOR_WIDTH			0x0c50
> +#define DISP_COLOR_HEIGHT			0x0c54
> +
> +#define	OD_RELAY_MODE		BIT(0)
> +
> +#define	UFO_BYPASS		BIT(2)
> +
> +#define	COLOR_BYPASS_ALL	BIT(7)
> +#define	COLOR_SEQ_SEL		BIT(13)
> +
> +static void mtk_color_config(void __iomem *color_base, unsigned int w,
> +		unsigned int h, unsigned int vrefresh)
> +{
> +	writel(w, color_base + DISP_COLOR_WIDTH);
> +	writel(h, color_base + DISP_COLOR_HEIGHT);
> +}
> +
> +static void mtk_color_start(struct mtk_ddp_comp *comp)
> +{
> +	writel(COLOR_BYPASS_ALL | COLOR_SEQ_SEL,
> +	       comp->regs + DISP_COLOR_CFG_MAIN);
> +	writel(0x1, comp->regs + DISP_COLOR_START);
> +}
> +
> +static void mtk_od_config(void __iomem *od_base, unsigned int w, unsigned int h,
> +		unsigned int vrefresh)
> +{
> +	writel(w << 16 | h, od_base + DISP_OD_SIZE);
> +}
> +
> +static void mtk_od_start(struct mtk_ddp_comp *comp)
> +{
> +	writel(OD_RELAY_MODE, comp->regs + DISP_OD_CFG);
> +	writel(1, comp->regs + DISP_OD_EN);
> +}
> +
> +static void mtk_rdma_start(struct mtk_ddp_comp *comp)
> +{
> +	unsigned int reg;
> +
> +	writel(0x4, comp->regs + DISP_REG_RDMA_INT_ENABLE);
> +	reg = readl(comp->regs + DISP_REG_RDMA_GLOBAL_CON);
> +	reg |= 1;
> +	writel(reg, comp->regs + DISP_REG_RDMA_GLOBAL_CON);
> +}
> +
> +static void mtk_rdma_config(void __iomem *rdma_base,
> +		unsigned width, unsigned height, unsigned int vrefresh)
> +{
> +	unsigned int threshold;
> +	unsigned int reg;
> +
> +	reg = readl(rdma_base + DISP_REG_RDMA_SIZE_CON_0);
> +	reg = (reg & ~(0xfff)) | (width & 0xfff);
> +	writel(reg, rdma_base + DISP_REG_RDMA_SIZE_CON_0);
> +
> +	reg = readl(rdma_base + DISP_REG_RDMA_SIZE_CON_1);
> +	reg = (reg & ~(0xfffff)) | (height & 0xfffff);
> +	writel(reg, rdma_base + DISP_REG_RDMA_SIZE_CON_1);
> +
> +	/*
> +	 * Enable FIFO underflow since DSI and DPI can't be blocked.
> +	 * Keep the FIFO pseudo size reset default of 8 KiB. Set the
> +	 * output threshold to 6 microseconds with 7/6 overhead to
> +	 * account for blanking, and with a pixel depth of 4 bytes:
> +	 */
> +	threshold = width * height * vrefresh * 4 * 7 / 1000000;
> +	reg = RDMA_FIFO_UNDERFLOW_EN |
> +	      RDMA_FIFO_PSEUDO_SIZE(SZ_8K) |
> +	      RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);
> +	writel(reg, rdma_base + DISP_REG_RDMA_FIFO_CON);
> +}
> +
> +static void mtk_ufoe_start(struct mtk_ddp_comp *comp)
> +{
> +	writel(UFO_BYPASS, comp->regs + DISP_REG_UFO_START);
> +}
> +
> +static const struct mtk_ddp_comp_funcs ddp_color = {
> +	.config = mtk_color_config,
> +	.start = mtk_color_start,
> +};
> +
> +static const struct mtk_ddp_comp_funcs ddp_od = {
> +	.config = mtk_od_config,
> +	.start = mtk_od_start,
> +};
> +
> +static const struct mtk_ddp_comp_funcs ddp_rdma = {
> +	.config = mtk_rdma_config,
> +	.start = mtk_rdma_start,
> +};
> +
> +static const struct mtk_ddp_comp_funcs ddp_ufoe = {
> +	.start = mtk_ufoe_start,
> +};
> +
> +static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
> +	[MTK_DISP_OVL] = "ovl",
> +	[MTK_DISP_RDMA] = "rdma",
> +	[MTK_DISP_WDMA] = "wdma",
> +	[MTK_DISP_COLOR] = "color",
> +	[MTK_DISP_AAL] = "aal",
> +	[MTK_DISP_GAMMA] = "gamma",
> +	[MTK_DISP_UFOE] = "ufoe",
> +	[MTK_DSI] = "dsi",
> +	[MTK_DPI] = "dpi",
> +	[MTK_DISP_PWM] = "pwm",
> +	[MTK_DISP_MUTEX] = "mutex",
> +	[MTK_DISP_OD] = "od",
> +};
> +
> +struct mtk_ddp_comp_match {
> +	enum mtk_ddp_comp_type type;
> +	int alias_id;
> +	const struct mtk_ddp_comp_funcs *funcs;
> +};
> +
> +static struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
> +	[DDP_COMPONENT_AAL]	= { MTK_DISP_AAL,	0, NULL },
> +	[DDP_COMPONENT_COLOR0]	= { MTK_DISP_COLOR,	0, &ddp_color },
> +	[DDP_COMPONENT_COLOR1]	= { MTK_DISP_COLOR,	1, &ddp_color },
> +	[DDP_COMPONENT_DPI0]	= { MTK_DPI,		0, NULL },
> +	[DDP_COMPONENT_DSI0]	= { MTK_DSI,		0, NULL },
> +	[DDP_COMPONENT_DSI1]	= { MTK_DSI,		1, NULL },
> +	[DDP_COMPONENT_GAMMA]	= { MTK_DISP_GAMMA,	0, NULL },
> +	[DDP_COMPONENT_OD]	= { MTK_DISP_OD,	0, NULL },
> +	[DDP_COMPONENT_OVL0]	= { MTK_DISP_OVL,	0, NULL },
> +	[DDP_COMPONENT_OVL1]	= { MTK_DISP_OVL,	1, NULL },
> +	[DDP_COMPONENT_PWM0]	= { MTK_DISP_PWM,	0, NULL },
> +	[DDP_COMPONENT_RDMA0]	= { MTK_DISP_RDMA,	0, &ddp_rdma },
> +	[DDP_COMPONENT_RDMA1]	= { MTK_DISP_RDMA,	1, &ddp_rdma },
> +	[DDP_COMPONENT_RDMA2]	= { MTK_DISP_RDMA,	2, &ddp_rdma },
> +	[DDP_COMPONENT_UFOE]	= { MTK_DISP_UFOE,	0, &ddp_ufoe },
> +	[DDP_COMPONENT_WDMA0]	= { MTK_DISP_WDMA,	0, NULL },
> +	[DDP_COMPONENT_WDMA1]	= { MTK_DISP_WDMA,	1, NULL },
> +};
> +
> +int mtk_ddp_comp_get_id(struct device_node *node,
> +			enum mtk_ddp_comp_type comp_type)
> +{
> +	int id = of_alias_get_id(node, mtk_ddp_comp_stem[comp_type]);
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(mtk_ddp_matches); i++) {
> +		if (comp_type == mtk_ddp_matches[i].type &&
> +		    (id < 0 || id == mtk_ddp_matches[i].alias_id))
> +			return i;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
> +		      struct mtk_ddp_comp *comp, enum mtk_ddp_comp_id comp_id,
> +		      const struct mtk_ddp_comp_funcs *funcs)
> +{
> +	enum mtk_ddp_comp_type type;
> +	struct device_node *larb_node;
> +	struct platform_device *larb_pdev;
> +
> +	if (comp_id < 0 || comp_id >= DDP_COMPONENT_ID_MAX)
> +		return -EINVAL;
> +
> +	comp->id = comp_id;
> +	comp->funcs = funcs ?: mtk_ddp_matches[comp_id].funcs;
> +
> +	if (comp_id == DDP_COMPONENT_DPI0 ||
> +	    comp_id == DDP_COMPONENT_DSI0 ||
> +	    comp_id == DDP_COMPONENT_PWM0) {
> +		comp->regs = NULL;
> +		comp->clk = NULL;
> +		comp->irq = 0;
> +		return 0;
> +	}
> +
> +	comp->regs = of_iomap(node, 0);
> +	comp->irq = of_irq_get(node, 0);
> +	comp->clk = of_clk_get(node, 0);
> +	if (IS_ERR(comp->clk))
> +		comp->clk = NULL;
> +
> +	type = mtk_ddp_matches[comp_id].type;
> +
> +	/* Only DMA capable components need the LARB property */
> +	comp->larb_dev = NULL;
> +	if (type != MTK_DISP_OVL &&
> +	    type != MTK_DISP_RDMA &&
> +	    type != MTK_DISP_WDMA)
> +		return 0;
> +
> +	larb_node = of_parse_phandle(node, "mediatek,larb", 0);
> +	if (!larb_node) {
> +		dev_err(dev,
> +			"Missing mediadek,larb phandle in %s node\n",
> +			node->full_name);
> +		return -EINVAL;
> +	}
> +
> +	larb_pdev = of_find_device_by_node(larb_node);
> +	if (!larb_pdev) {
> +		dev_warn(dev, "Waiting for larb device %s\n",
> +			 larb_node->full_name);
> +		return -EPROBE_DEFER;
> +	}
> +
> +	comp->larb_dev = &larb_pdev->dev;
> +
> +	return 0;
> +}
> +
> +int mtk_ddp_comp_register(struct drm_device *drm, struct mtk_ddp_comp *comp)
> +{
> +	struct mtk_drm_private *private = drm->dev_private;
> +
> +	if (private->ddp_comp[comp->id])
> +		return -EBUSY;
> +
> +	private->ddp_comp[comp->id] = comp;
> +	return 0;
> +}
> +
> +void mtk_ddp_comp_unregister(struct drm_device *drm, struct mtk_ddp_comp *comp)
> +{
> +	struct mtk_drm_private *private = drm->dev_private;
> +
> +	private->ddp_comp[comp->id] = NULL;
> +}
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> new file mode 100644
> index 0000000..eef3608
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -0,0 +1,148 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef MTK_DRM_DDP_COMP_H
> +#define MTK_DRM_DDP_COMP_H
> +
> +#include <linux/io.h>
> +
> +struct device;
> +struct device_node;
> +struct drm_device;
> +struct mtk_plane_state;
> +
> +enum mtk_ddp_comp_type {
> +	MTK_DISP_OVL,
> +	MTK_DISP_RDMA,
> +	MTK_DISP_WDMA,
> +	MTK_DISP_COLOR,
> +	MTK_DISP_AAL,
> +	MTK_DISP_GAMMA,
> +	MTK_DISP_UFOE,
> +	MTK_DSI,
> +	MTK_DPI,
> +	MTK_DISP_PWM,
> +	MTK_DISP_MUTEX,
> +	MTK_DISP_OD,
> +	MTK_DDP_COMP_TYPE_MAX,
> +};
> +
> +enum mtk_ddp_comp_id {
> +	DDP_COMPONENT_AAL,
> +	DDP_COMPONENT_COLOR0,
> +	DDP_COMPONENT_COLOR1,
> +	DDP_COMPONENT_DPI0,
> +	DDP_COMPONENT_DSI0,
> +	DDP_COMPONENT_DSI1,
> +	DDP_COMPONENT_GAMMA,
> +	DDP_COMPONENT_OD,
> +	DDP_COMPONENT_OVL0,
> +	DDP_COMPONENT_OVL1,
> +	DDP_COMPONENT_PWM0,
> +	DDP_COMPONENT_PWM1,
> +	DDP_COMPONENT_RDMA0,
> +	DDP_COMPONENT_RDMA1,
> +	DDP_COMPONENT_RDMA2,
> +	DDP_COMPONENT_UFOE,
> +	DDP_COMPONENT_WDMA0,
> +	DDP_COMPONENT_WDMA1,
> +	DDP_COMPONENT_ID_MAX,
> +};
> +
> +struct mtk_ddp_comp;
> +
> +struct mtk_ddp_comp_funcs {
> +	void (*config)(void __iomem *base, unsigned int w, unsigned int h,
> +		       unsigned int vrefresh);
> +	void (*start)(struct mtk_ddp_comp *comp);
> +	void (*stop)(struct mtk_ddp_comp *comp);
> +	void (*enable_vblank)(void __iomem *base);
> +	void (*disable_vblank)(void __iomem *base);
> +	void (*layer_on)(void __iomem *base, unsigned int idx);
> +	void (*layer_off)(void __iomem *base, unsigned int idx);
> +	void (*layer_config)(void __iomem *base, unsigned int idx,
> +			     struct mtk_plane_state *state);
> +};
> +
> +struct mtk_ddp_comp {
> +	struct clk *clk;
> +	void __iomem *regs;
> +	int irq;
> +	struct device *larb_dev;
> +	enum mtk_ddp_comp_id id;
> +	const struct mtk_ddp_comp_funcs *funcs;
> +};
> +
> +static inline void mtk_ddp_comp_config(struct mtk_ddp_comp *comp,
> +				       unsigned int w, unsigned int h,
> +				       unsigned int vrefresh)
> +{
> +	if (comp->funcs && comp->funcs->config)
> +		comp->funcs->config(comp->regs, w, h, vrefresh);
> +}
> +
> +static inline void mtk_ddp_comp_start(struct mtk_ddp_comp *comp)
> +{
> +	if (comp->funcs && comp->funcs->start)
> +		comp->funcs->start(comp);
> +}
> +
> +static inline void mtk_ddp_comp_stop(struct mtk_ddp_comp *comp)
> +{
> +	if (comp->funcs && comp->funcs->stop)
> +		comp->funcs->stop(comp);
> +}
> +
> +static inline void mtk_ddp_comp_enable_vblank(struct mtk_ddp_comp *comp)
> +{
> +	if (comp->funcs && comp->funcs->enable_vblank)
> +		comp->funcs->enable_vblank(comp->regs);
> +}
> +
> +static inline void mtk_ddp_comp_disable_vblank(struct mtk_ddp_comp *comp)
> +{
> +	if (comp->funcs && comp->funcs->disable_vblank)
> +		comp->funcs->disable_vblank(comp->regs);
> +}
> +
> +static inline void mtk_ddp_comp_layer_on(struct mtk_ddp_comp *comp,
> +					 unsigned int idx)
> +{
> +	if (comp->funcs && comp->funcs->layer_on)
> +		comp->funcs->layer_on(comp->regs, idx);
> +}
> +
> +static inline void mtk_ddp_comp_layer_off(struct mtk_ddp_comp *comp,
> +					  unsigned int idx)
> +{
> +	if (comp->funcs && comp->funcs->layer_off)
> +		comp->funcs->layer_off(comp->regs, idx);
> +}
> +
> +static inline void mtk_ddp_comp_layer_config(struct mtk_ddp_comp *comp,
> +					     unsigned int idx,
> +					     struct mtk_plane_state *state)
> +{
> +	if (comp->funcs && comp->funcs->layer_config)
> +		comp->funcs->layer_config(comp->regs, idx, state);
> +}
> +
> +int mtk_ddp_comp_get_id(struct device_node *node,
> +			enum mtk_ddp_comp_type comp_type);
> +int mtk_ddp_comp_init(struct device *dev, struct device_node *comp_node,
> +		      struct mtk_ddp_comp *comp, enum mtk_ddp_comp_id comp_id,
> +		      const struct mtk_ddp_comp_funcs *funcs);
> +int mtk_ddp_comp_register(struct drm_device *drm, struct mtk_ddp_comp *comp);
> +void mtk_ddp_comp_unregister(struct drm_device *drm, struct mtk_ddp_comp *comp);
> +
> +#endif /* MTK_DRM_DDP_COMP_H */
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> new file mode 100644
> index 0000000..a34c765
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -0,0 +1,562 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + * Author: YT SHEN <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_gem.h>
> +#include <linux/component.h>
> +#include <linux/dma-iommu.h>

Do we need this include here?

> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "mtk_drm_crtc.h"
> +#include "mtk_drm_ddp.h"
> +#include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_drv.h"
> +#include "mtk_drm_fb.h"
> +#include "mtk_drm_gem.h"
> +
> +#define DRIVER_NAME "mediatek"
> +#define DRIVER_DESC "Mediatek SoC DRM"
> +#define DRIVER_DATE "20150513"
> +#define DRIVER_MAJOR 1
> +#define DRIVER_MINOR 0
> +
> +static void mtk_atomic_schedule(struct mtk_drm_private *private,
> +				struct drm_atomic_state *state)
> +{
> +	private->commit.state = state;
> +	schedule_work(&private->commit.work);
> +}
> +
> +static void mtk_atomic_complete(struct mtk_drm_private *private,
> +				struct drm_atomic_state *state)
> +{
> +	struct drm_device *drm = private->drm;
> +
> +	drm_atomic_helper_commit_modeset_disables(drm, state);
> +	drm_atomic_helper_commit_planes(drm, state, false);
> +	drm_atomic_helper_commit_modeset_enables(drm, state);
> +	drm_atomic_helper_wait_for_vblanks(drm, state);
> +	drm_atomic_helper_cleanup_planes(drm, state);
> +	drm_atomic_state_free(state);
> +}
> +
> +static void mtk_atomic_work(struct work_struct *work)
> +{
> +	struct mtk_drm_private *private = container_of(work,
> +			struct mtk_drm_private, commit.work);
> +
> +	mtk_atomic_complete(private, private->commit.state);
> +}
> +
> +static int mtk_atomic_commit(struct drm_device *drm,
> +			     struct drm_atomic_state *state,
> +			     bool async)
> +{
> +	struct mtk_drm_private *private = drm->dev_private;
> +	int ret;
> +
> +	ret = drm_atomic_helper_prepare_planes(drm, state);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&private->commit.lock);
> +	flush_work(&private->commit.work);
> +
> +	drm_atomic_helper_swap_state(drm, state);
> +
> +	if (async)
> +		mtk_atomic_schedule(private, state);
> +	else
> +		mtk_atomic_complete(private, state);
> +
> +	mutex_unlock(&private->commit.lock);
> +
> +	return 0;
> +}
> +
> +static const struct drm_mode_config_funcs mtk_drm_mode_config_funcs = {
> +	.fb_create = mtk_drm_mode_fb_create,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = mtk_atomic_commit,
> +};
> +
> +static const enum mtk_ddp_comp_id mtk_ddp_main[] = {
> +	DDP_COMPONENT_OVL0,
> +	DDP_COMPONENT_COLOR0,
> +	DDP_COMPONENT_AAL,
> +	DDP_COMPONENT_OD,
> +	DDP_COMPONENT_RDMA0,
> +	DDP_COMPONENT_UFOE,
> +	DDP_COMPONENT_DSI0,
> +	DDP_COMPONENT_PWM0,
> +};
> +
> +static const enum mtk_ddp_comp_id mtk_ddp_ext[] = {
> +	DDP_COMPONENT_OVL1,
> +	DDP_COMPONENT_COLOR1,
> +	DDP_COMPONENT_GAMMA,
> +	DDP_COMPONENT_RDMA1,
> +	DDP_COMPONENT_DPI0,
> +};
> +
> +static int mtk_drm_kms_init(struct drm_device *drm)
> +{
> +	struct mtk_drm_private *private = drm->dev_private;
> +	struct platform_device *pdev;
> +	int ret;
> +
> +	pdev = of_find_device_by_node(private->mutex_node);
> +	if (!pdev) {
> +		dev_err(drm->dev, "Waiting for disp-mutex device %s\n",
> +			private->mutex_node->full_name);
> +		of_node_put(private->mutex_node);
> +		return -EPROBE_DEFER;
> +	}
> +	private->mutex_dev = &pdev->dev;
> +
> +	drm_mode_config_init(drm);
> +
> +	drm->mode_config.min_width = 64;
> +	drm->mode_config.min_height = 64;
> +
> +	/*
> +	 * set max width and height as default value(4096x4096).
> +	 * this value would be used to check framebuffer size limitation
> +	 * at drm_mode_addfb().
> +	 */
> +	drm->mode_config.max_width = 4096;
> +	drm->mode_config.max_height = 4096;
> +	drm->mode_config.funcs = &mtk_drm_mode_config_funcs;
> +
> +	ret = component_bind_all(drm->dev, drm);
> +	if (ret)
> +		goto err_config_cleanup;
> +
> +	/*
> +	 * We currently support two fixed data streams, each statically
> +	 * assigned to a crtc:
> +	 * OVL0 -> COLOR0 -> AAL -> OD -> RDMA0 -> UFOE -> DSI0 ...
> +	 */
> +	ret = mtk_drm_crtc_create(drm, mtk_ddp_main, ARRAY_SIZE(mtk_ddp_main));
> +	if (ret < 0)
> +		goto err_component_unbind;
> +	/* ... and OVL1 -> COLOR1 -> GAMMA -> RDMA1 -> DPI0. */
> +	ret = mtk_drm_crtc_create(drm, mtk_ddp_ext, ARRAY_SIZE(mtk_ddp_ext));
> +	if (ret < 0)
> +		goto err_component_unbind;
> +
> +	/*
> +	 * We don't use the drm_irq_install() helpers provided by the DRM
> +	 * core, so we need to set this manually in order to allow the
> +	 * DRM_IOCTL_WAIT_VBLANK to operate correctly.
> +	 */
> +	drm->irq_enabled = true;
> +	ret = drm_vblank_init(drm, MAX_CRTC);
> +	if (ret < 0)
> +		goto err_component_unbind;
> +
> +	drm_kms_helper_poll_init(drm);
> +	drm_mode_config_reset(drm);
> +
> +	return 0;
> +
> +err_component_unbind:
> +	component_unbind_all(drm->dev, drm);
> +err_config_cleanup:
> +	drm_mode_config_cleanup(drm);
> +
> +	return ret;
> +}
> +
> +static void mtk_drm_kms_deinit(struct drm_device *drm)
> +{
> +	drm_kms_helper_poll_fini(drm);
> +
> +	drm_vblank_cleanup(drm);
> +	component_unbind_all(drm->dev, drm);
> +	drm_mode_config_cleanup(drm);
> +}
> +
> +static int mtk_drm_unload(struct drm_device *drm)
> +{
> +	mtk_drm_kms_deinit(drm);
> +	drm->dev_private = NULL;
> +
> +	return 0;
> +}
> +
> +static const struct vm_operations_struct mtk_drm_gem_vm_ops = {
> +	.open = drm_gem_vm_open,
> +	.close = drm_gem_vm_close,
> +};
> +
> +static const struct file_operations mtk_drm_fops = {
> +	.owner = THIS_MODULE,
> +	.open = drm_open,
> +	.release = drm_release,
> +	.unlocked_ioctl = drm_ioctl,
> +	.mmap = mtk_drm_gem_mmap,
> +	.poll = drm_poll,
> +	.read = drm_read,
> +#ifdef CONFIG_COMPAT
> +	.compat_ioctl = drm_compat_ioctl,
> +#endif
> +};
> +
> +static struct drm_driver mtk_drm_driver = {
> +	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME |
> +			   DRIVER_ATOMIC,
> +	.unload = mtk_drm_unload,
> +	.set_busid = drm_platform_set_busid,
> +
> +	.get_vblank_counter = drm_vblank_count,
> +	.enable_vblank = mtk_drm_crtc_enable_vblank,
> +	.disable_vblank = mtk_drm_crtc_disable_vblank,
> +
> +	.gem_free_object = mtk_drm_gem_free_object,
> +	.gem_vm_ops = &mtk_drm_gem_vm_ops,
> +	.dumb_create = mtk_drm_gem_dumb_create,
> +	.dumb_map_offset = mtk_drm_gem_dumb_map_offset,
> +	.dumb_destroy = drm_gem_dumb_destroy,
> +
> +	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> +	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> +	.gem_prime_export = drm_gem_prime_export,
> +	.gem_prime_import = drm_gem_prime_import,
> +	.gem_prime_get_sg_table = mtk_gem_prime_get_sg_table,
> +	.gem_prime_mmap = mtk_drm_gem_mmap_buf,
> +	.fops = &mtk_drm_fops,
> +
> +	.name = DRIVER_NAME,
> +	.desc = DRIVER_DESC,
> +	.date = DRIVER_DATE,
> +	.major = DRIVER_MAJOR,
> +	.minor = DRIVER_MINOR,
> +};
> +
> +static int compare_of(struct device *dev, void *data)
> +{
> +	return dev->of_node == data;
> +}
> +
> +static int mtk_drm_bind(struct device *dev)
> +{
> +	struct mtk_drm_private *private = dev_get_drvdata(dev);
> +	struct drm_device *drm;
> +	int ret;
> +
> +	drm = drm_dev_alloc(&mtk_drm_driver, dev);
> +	if (!drm)
> +		return -ENOMEM;
> +
> +	drm_dev_set_unique(drm, dev_name(dev));
> +
> +	ret = drm_dev_register(drm, 0);
> +	if (ret < 0)
> +		goto err_free;
> +
> +	drm->dev_private = private;
> +	private->drm = drm;
> +
> +	ret = mtk_drm_kms_init(drm);
> +	if (ret < 0)
> +		goto err_unregister;
> +
> +	return 0;
> +
> +err_unregister:
> +	drm_dev_unregister(drm);
> +err_free:
> +	drm_dev_unref(drm);
> +	return ret;
> +}
> +
> +static void mtk_drm_unbind(struct device *dev)
> +{
> +	struct mtk_drm_private *private = dev_get_drvdata(dev);
> +
> +	drm_put_dev(private->drm);
> +	private->drm = NULL;
> +}
> +
> +static const struct component_master_ops mtk_drm_ops = {
> +	.bind		= mtk_drm_bind,
> +	.unbind		= mtk_drm_unbind,
> +};
> +
> +static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
> +	{ .compatible = "mediatek,mt8173-disp-ovl",   .data = (void *)MTK_DISP_OVL },
> +	{ .compatible = "mediatek,mt8173-disp-rdma",  .data = (void *)MTK_DISP_RDMA },
> +	{ .compatible = "mediatek,mt8173-disp-wdma",  .data = (void *)MTK_DISP_WDMA },
> +	{ .compatible = "mediatek,mt8173-disp-color", .data = (void *)MTK_DISP_COLOR },
> +	{ .compatible = "mediatek,mt8173-disp-aal",   .data = (void *)MTK_DISP_AAL},
> +	{ .compatible = "mediatek,mt8173-disp-gamma", .data = (void *)MTK_DISP_GAMMA, },
> +	{ .compatible = "mediatek,mt8173-disp-ufoe",  .data = (void *)MTK_DISP_UFOE },
> +	{ .compatible = "mediatek,mt8173-dsi",        .data = (void *)MTK_DSI },
> +	{ .compatible = "mediatek,mt8173-dpi",        .data = (void *)MTK_DPI },
> +	{ .compatible = "mediatek,mt8173-disp-mutex", .data = (void *)MTK_DISP_MUTEX },
> +	{ .compatible = "mediatek,mt8173-disp-pwm",   .data = (void *)MTK_DISP_PWM },
> +	{ .compatible = "mediatek,mt8173-disp-od",    .data = (void *)MTK_DISP_OD },
> +	{ }
> +};
> +
> +static int mtk_drm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_drm_private *private;
> +	struct resource *mem;
> +	struct device_node *node;
> +	struct component_match *match = NULL;
> +	int ret;
> +	int i;
> +
> +	private = devm_kzalloc(dev, sizeof(*private), GFP_KERNEL);
> +	if (!private)
> +		return -ENOMEM;
> +
> +	mutex_init(&private->commit.lock);
> +	INIT_WORK(&private->commit.work, mtk_atomic_work);
> +
> +	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	private->config_regs = devm_ioremap_resource(dev, mem);
> +	if (IS_ERR(private->config_regs)) {
> +		ret = PTR_ERR(private->config_regs);
> +		dev_err(dev, "Failed to ioremap mmsys-config resource: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	/* Iterate over sibling DISP function blocks */
> +	for_each_child_of_node(dev->of_node->parent, node) {
> +		const struct of_device_id *of_id;
> +		enum mtk_ddp_comp_type comp_type;
> +		int comp_id;
> +
> +		of_id = of_match_node(mtk_ddp_comp_dt_ids, node);
> +		if (!of_id)
> +			continue;
> +
> +		if (!of_device_is_available(node)) {
> +			dev_dbg(dev, "Skipping disabled component %s\n",
> +				node->full_name);
> +			continue;
> +		}
> +
> +		comp_type = (enum mtk_ddp_comp_type)of_id->data;
> +
> +		if (comp_type == MTK_DISP_MUTEX) {
> +			private->mutex_node = of_node_get(node);
> +			continue;
> +		}
> +
> +		comp_id = mtk_ddp_comp_get_id(node, comp_type);
> +		if (comp_id < 0) {
> +			dev_warn(dev, "Skipping unknown component %s\n",
> +				 node->full_name);
> +			continue;
> +		}
> +
> +		private->comp_node[comp_id] = of_node_get(node);
> +
> +		/*
> +		 * Currently only the OVL, DSI, and DPI blocks have separate
> +		 * component platform drivers and initialize their own DDP
> +		 * component structure. The others are initialized here.
> +		 */
> +		if (comp_type == MTK_DISP_OVL ||
> +		    comp_type == MTK_DSI ||
> +		    comp_type == MTK_DPI) {
> +			dev_info(dev, "Adding component match for %s\n",
> +				 node->full_name);
> +			component_match_add(dev, &match, compare_of, node);
> +		} else {
> +			struct mtk_ddp_comp *comp;
> +
> +			comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
> +			if (!comp) {
> +				ret = -ENOMEM;
> +				goto err;
> +			}
> +
> +			ret = mtk_ddp_comp_init(dev, node, comp, comp_id, NULL);
> +			if (ret)
> +				goto err;
> +
> +			private->ddp_comp[comp_id] = comp;
> +		}
> +	}
> +
> +	if (!private->mutex_node) {
> +		dev_err(dev, "Failed to find disp-mutex node\n");
> +		ret = -ENODEV;
> +		goto err;
> +	}
> +
> +	pm_runtime_enable(dev);
> +
> +	platform_set_drvdata(pdev, private);
> +
> +	ret = component_master_add_with_match(dev, &mtk_drm_ops, match);
> +	if (ret)
> +		goto err;
> +
> +	return 0;
> +
> +err:
> +	of_node_put(private->mutex_node);
> +	for (i = 0; i < DDP_COMPONENT_ID_MAX; i++)
> +		of_node_put(private->comp_node[i]);
> +	return ret;
> +}
> +
> +static int mtk_drm_remove(struct platform_device *pdev)
> +{
> +	struct mtk_drm_private *private = platform_get_drvdata(pdev);
> +	int i;
> +
> +	component_master_del(&pdev->dev, &mtk_drm_ops);
> +	pm_runtime_disable(&pdev->dev);
> +	of_node_put(private->mutex_node);
> +	for (i = 0; i < DDP_COMPONENT_ID_MAX; i++)
> +		of_node_put(private->comp_node[i]);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int mtk_drm_sys_suspend(struct device *dev)
> +{
> +	struct mtk_drm_private *private = dev_get_drvdata(dev);
> +	struct drm_device *drm = private->drm;
> +	struct drm_connector *conn;
> +
> +	drm_kms_helper_poll_disable(drm);
> +
> +	drm_modeset_lock_all(drm);
> +	list_for_each_entry(conn, &drm->mode_config.connector_list, head) {
> +		int old_dpms = conn->dpms;
> +
> +		if (conn->funcs->dpms)
> +			conn->funcs->dpms(conn, DRM_MODE_DPMS_OFF);
> +
> +		/* Set the old mode back to the connector for resume */
> +		conn->dpms = old_dpms;
> +	}
> +	drm_modeset_unlock_all(drm);
> +
> +	DRM_DEBUG_DRIVER("mtk_drm_sys_suspend\n");
> +	return 0;
> +}
> +
> +static int mtk_drm_sys_resume(struct device *dev)
> +{
> +	struct mtk_drm_private *private = dev_get_drvdata(dev);
> +	struct drm_device *drm = private->drm;
> +	struct drm_connector *conn;
> +
> +	drm_modeset_lock_all(drm);
> +	list_for_each_entry(conn, &drm->mode_config.connector_list, head) {
> +		int desired_mode = conn->dpms;
> +
> +		/*
> +		 * at suspend time, we save dpms to connector->dpms,
> +		 * restore the old_dpms, and at current time, the connector
> +		 * dpms status must be DRM_MODE_DPMS_OFF.
> +		 */
> +		conn->dpms = DRM_MODE_DPMS_OFF;
> +
> +		/*
> +		 * If the connector has been disconnected during suspend,
> +		 * disconnect it from the encoder and leave it off. We'll notify
> +		 * userspace at the end.
> +		 */
> +		if (conn->funcs->dpms)
> +			conn->funcs->dpms(conn, desired_mode);
> +	}
> +	drm_modeset_unlock_all(drm);
> +
> +	drm_kms_helper_poll_enable(drm);
> +
> +	DRM_DEBUG_DRIVER("mtk_drm_sys_resume\n");
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend,
> +			 mtk_drm_sys_resume);
> +#endif
> +
> +static const struct of_device_id mtk_drm_of_ids[] = {
> +	{ .compatible = "mediatek,mt8173-mmsys", },
> +	{ }
> +};
> +
> +static struct platform_driver mtk_drm_platform_driver = {
> +	.probe	= mtk_drm_probe,
> +	.remove	= mtk_drm_remove,
> +	.driver	= {
> +		.name	= "mediatek-drm",
> +		.of_match_table = mtk_drm_of_ids,
> +#ifdef CONFIG_PM_SLEEP
> +		.pm     = &mtk_drm_pm_ops,
> +#endif
> +	},
> +};
> +
> +static struct platform_driver * const mtk_drm_drivers[] = {
> +	&mtk_drm_platform_driver,
> +	&mtk_disp_ovl_driver,
> +};
> +
> +static int __init mtk_drm_init(void)
> +{
> +	int ret;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(mtk_drm_drivers); i++) {
> +		ret = platform_driver_register(mtk_drm_drivers[i]);
> +		if (ret < 0) {
> +			pr_err("Failed to register %s driver: %d\n",
> +			       mtk_drm_drivers[i]->driver.name, ret);
> +			goto err;
> +		}
> +	}
> +
> +	return 0;
> +
> +err:
> +	while (--i >= 0)
> +		platform_driver_unregister(mtk_drm_drivers[i]);
> +
> +	return ret;
> +}
> +
> +static void __exit mtk_drm_exit(void)
> +{
> +	int i;
> +
> +	for (i = ARRAY_SIZE(mtk_drm_drivers) - 1; i >= 0; i--)
> +		platform_driver_unregister(mtk_drm_drivers[i]);
> +}
> +
> +module_init(mtk_drm_init);
> +module_exit(mtk_drm_exit);
> +
> +MODULE_AUTHOR("YT SHEN <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>");
> +MODULE_DESCRIPTION("Mediatek SoC DRM driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> new file mode 100644
> index 0000000..df421cd
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -0,0 +1,53 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef MTK_DRM_DRV_H
> +#define MTK_DRM_DRV_H
> +
> +#include <linux/io.h>
> +#include "mtk_drm_ddp_comp.h"
> +
> +#define MAX_CRTC	2
> +#define MAX_CONNECTOR	2
> +
> +struct device;
> +struct device_node;
> +struct drm_crtc;
> +struct drm_device;
> +struct drm_fb_helper;
> +struct drm_property;
> +struct regmap;
> +
> +struct mtk_drm_private {
> +	struct drm_device *drm;
> +
> +	struct drm_crtc *crtc[MAX_CRTC];
> +	struct drm_property *plane_zpos_property;
> +	unsigned int num_pipes;
> +
> +	struct device_node *mutex_node;
> +	struct device *mutex_dev;
> +	void __iomem *config_regs;
> +	struct device_node *comp_node[DDP_COMPONENT_ID_MAX];
> +	struct mtk_ddp_comp *ddp_comp[DDP_COMPONENT_ID_MAX];
> +
> +	struct {
> +		struct drm_atomic_state *state;
> +		struct work_struct work;
> +		struct mutex lock;
> +	} commit;
> +};
> +
> +extern struct platform_driver mtk_disp_ovl_driver;
> +
> +#endif /* MTK_DRM_DRV_H */
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_fb.c b/drivers/gpu/drm/mediatek/mtk_drm_fb.c
> new file mode 100644
> index 0000000..b2ada80
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_fb.c
> @@ -0,0 +1,135 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem.h>
> +
> +#include "mtk_drm_drv.h"
> +#include "mtk_drm_fb.h"
> +#include "mtk_drm_gem.h"
> +
> +/*
> + * mtk specific framebuffer structure.
> + *
> + * @fb: drm framebuffer object.
> + * @gem_obj: array of gem objects.
> + */
> +struct mtk_drm_fb {
> +	struct drm_framebuffer	base;
> +	/* For now we only support a single plane */
> +	struct drm_gem_object	*gem_obj;
> +};
> +
> +#define to_mtk_fb(x) container_of(x, struct mtk_drm_fb, base)
> +
> +struct drm_gem_object *mtk_fb_get_gem_obj(struct drm_framebuffer *fb)
> +{
> +	struct mtk_drm_fb *mtk_fb = to_mtk_fb(fb);
> +
> +	return mtk_fb->gem_obj;
> +}
> +
> +static int mtk_drm_fb_create_handle(struct drm_framebuffer *fb,
> +				    struct drm_file *file_priv,
> +				    unsigned int *handle)
> +{
> +	struct mtk_drm_fb *mtk_fb = to_mtk_fb(fb);
> +
> +	return drm_gem_handle_create(file_priv, mtk_fb->gem_obj, handle);
> +}
> +
> +static void mtk_drm_fb_destroy(struct drm_framebuffer *fb)
> +{
> +	struct mtk_drm_fb *mtk_fb = to_mtk_fb(fb);
> +
> +	drm_framebuffer_cleanup(fb);
> +
> +	drm_gem_object_unreference_unlocked(mtk_fb->gem_obj);
> +
> +	kfree(mtk_fb);
> +}
> +
> +static const struct drm_framebuffer_funcs mtk_drm_fb_funcs = {
> +	.create_handle = mtk_drm_fb_create_handle,
> +	.destroy = mtk_drm_fb_destroy,
> +};
> +
> +static struct mtk_drm_fb *mtk_drm_framebuffer_init(struct drm_device *dev,
> +						   struct drm_mode_fb_cmd2 *mode,
> +						   struct drm_gem_object *obj)
> +{
> +	struct mtk_drm_fb *mtk_fb;
> +	int ret;
> +
> +	if (drm_format_num_planes(mode->pixel_format) != 1)
> +		return ERR_PTR(-EINVAL);
> +
> +	mtk_fb = kzalloc(sizeof(*mtk_fb), GFP_KERNEL);
> +	if (!mtk_fb)
> +		return ERR_PTR(-ENOMEM);
> +
> +	drm_helper_mode_fill_fb_struct(&mtk_fb->base, mode);
> +
> +	mtk_fb->gem_obj = obj;
> +
> +	ret = drm_framebuffer_init(dev, &mtk_fb->base, &mtk_drm_fb_funcs);
> +	if (ret) {
> +		DRM_ERROR("failed to initialize framebuffer\n");
> +		kfree(mtk_fb);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return mtk_fb;
> +}
> +
> +struct drm_framebuffer *mtk_drm_mode_fb_create(struct drm_device *dev,
> +					       struct drm_file *file,
> +					       struct drm_mode_fb_cmd2 *cmd)
> +{
> +	struct mtk_drm_fb *mtk_fb;
> +	struct drm_gem_object *gem;
> +	unsigned int width = cmd->width;
> +	unsigned int height = cmd->height;
> +	unsigned int size, bpp;
> +	int ret;
> +
> +	if (drm_format_num_planes(cmd->pixel_format) != 1)
> +		return ERR_PTR(-EINVAL);
> +
> +	gem = drm_gem_object_lookup(dev, file, cmd->handles[0]);
> +	if (!gem)
> +		return ERR_PTR(-ENOENT);
> +
> +	bpp = drm_format_plane_cpp(cmd->pixel_format, 0);
> +	size = (height - 1) * cmd->pitches[0] + width * bpp;
> +	size += cmd->offsets[0];
> +
> +	if (gem->size < size) {
> +		ret = -EINVAL;
> +		goto unreference;
> +	}
> +
> +	mtk_fb = mtk_drm_framebuffer_init(dev, cmd, gem);
> +	if (IS_ERR(mtk_fb)) {
> +		ret = PTR_ERR(mtk_fb);
> +		goto unreference;
> +	}
> +
> +	return &mtk_fb->base;
> +
> +unreference:
> +	drm_gem_object_unreference_unlocked(gem);
> +	return ERR_PTR(ret);
> +}
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_fb.h b/drivers/gpu/drm/mediatek/mtk_drm_fb.h
> new file mode 100644
> index 0000000..ca378c7
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_fb.h
> @@ -0,0 +1,28 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef MTK_DRM_FB_H
> +#define MTK_DRM_FB_H
> +
> +#define MAX_FB_OBJ	3
> +
> +struct drm_gem_object *mtk_fb_get_gem_obj(struct drm_framebuffer *fb);
> +struct drm_framebuffer *mtk_drm_mode_fb_create(struct drm_device *dev,
> +					       struct drm_file *file,
> +					       struct drm_mode_fb_cmd2 *cmd);
> +
> +void mtk_drm_mode_output_poll_changed(struct drm_device *dev);
> +int mtk_fbdev_create(struct drm_device *dev);
> +void mtk_fbdev_destroy(struct drm_device *dev);
> +
> +#endif /* MTK_DRM_FB_H */
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> new file mode 100644
> index 0000000..8a5eab7
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -0,0 +1,227 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_gem.h>
> +
> +#include "mtk_drm_gem.h"
> +
> +static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
> +						unsigned long size)
> +{
> +	struct mtk_drm_gem_obj *mtk_gem_obj;
> +	int ret;
> +
> +	size = round_up(size, PAGE_SIZE);
> +
> +	mtk_gem_obj = kzalloc(sizeof(*mtk_gem_obj), GFP_KERNEL);
> +	if (!mtk_gem_obj)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = drm_gem_object_init(dev, &mtk_gem_obj->base, size);
> +	if (ret < 0) {
> +		DRM_ERROR("failed to initialize gem object\n");
> +		kfree(mtk_gem_obj);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return mtk_gem_obj;
> +}
> +
> +struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_device *dev,
> +					   unsigned long size, bool alloc_kmap)
> +{
> +	struct mtk_drm_gem_obj *mtk_gem;
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	mtk_gem = mtk_drm_gem_init(dev, size);
> +	if (IS_ERR(mtk_gem))
> +		return ERR_CAST(mtk_gem);
> +
> +	obj = &mtk_gem->base;
> +
> +	init_dma_attrs(&mtk_gem->dma_attrs);
> +	dma_set_attr(DMA_ATTR_WRITE_COMBINE, &mtk_gem->dma_attrs);
> +
> +	if (!alloc_kmap)
> +		dma_set_attr(DMA_ATTR_NO_KERNEL_MAPPING, &mtk_gem->dma_attrs);
> +
> +	mtk_gem->cookie = dma_alloc_attrs(dev->dev, obj->size,
> +				(dma_addr_t *)&mtk_gem->dma_addr, GFP_KERNEL,
> +				&mtk_gem->dma_attrs);
> +	if (!mtk_gem->cookie) {
> +		DRM_ERROR("failed to allocate %zx byte dma buffer", obj->size);
> +		ret = -ENOMEM;
> +		goto err_gem_free;
> +	}
> +
> +	if (alloc_kmap)
> +		mtk_gem->kvaddr = mtk_gem->cookie;
> +
> +	DRM_DEBUG_DRIVER("cookie = %p dma_addr = %llx\n",
> +			 mtk_gem->cookie, mtk_gem->dma_addr);
> +
> +	return mtk_gem;
> +
> +err_gem_free:
> +	drm_gem_object_release(obj);
> +	kfree(mtk_gem);
> +	return ERR_PTR(ret);
> +}
> +
> +void mtk_drm_gem_free_object(struct drm_gem_object *obj)
> +{
> +	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
> +
> +	dma_free_attrs(obj->dev->dev, obj->size, mtk_gem->cookie,
> +		       mtk_gem->dma_addr, &mtk_gem->dma_attrs);
> +
> +	/* release file pointer to gem object. */
> +	drm_gem_object_release(obj);
> +
> +	kfree(mtk_gem);
> +}
> +
> +int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
> +			    struct drm_mode_create_dumb *args)
> +{
> +	struct mtk_drm_gem_obj *mtk_gem;
> +	int ret;
> +
> +	args->pitch = args->width * DIV_ROUND_UP(args->bpp, 8);
> +	args->size = args->pitch * args->height;
> +
> +	mtk_gem = mtk_drm_gem_create(dev, args->size, false);
> +	if (IS_ERR(mtk_gem))
> +		return PTR_ERR(mtk_gem);
> +
> +	/*
> +	 * allocate a id of idr table where the obj is registered
> +	 * and handle has the id what user can see.
> +	 */
> +	ret = drm_gem_handle_create(file_priv, &mtk_gem->base, &args->handle);
> +	if (ret)
> +		goto err_handle_create;
> +
> +	/* drop reference from allocate - handle holds it now. */
> +	drm_gem_object_unreference_unlocked(&mtk_gem->base);
> +
> +	return 0;
> +
> +err_handle_create:
> +	mtk_drm_gem_free_object(&mtk_gem->base);
> +	return ret;
> +}
> +
> +int mtk_drm_gem_dumb_map_offset(struct drm_file *file_priv,
> +				struct drm_device *dev, uint32_t handle,
> +				uint64_t *offset)
> +{
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	obj = drm_gem_object_lookup(dev, file_priv, handle);
> +	if (!obj) {
> +		DRM_ERROR("failed to lookup gem object.\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = drm_gem_create_mmap_offset(obj);
> +	if (ret)
> +		goto out;
> +
> +	*offset = drm_vma_node_offset_addr(&obj->vma_node);
> +	DRM_DEBUG_KMS("offset = 0x%llx\n", *offset);
> +
> +out:
> +	drm_gem_object_unreference_unlocked(obj);
> +	return ret;
> +}
> +
> +static int mtk_drm_gem_object_mmap(struct drm_gem_object *obj,
> +				   struct vm_area_struct *vma)
> +
> +{
> +	int ret;
> +	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
> +	struct drm_device *drm = obj->dev;
> +
> +	/*
> +	 * dma_alloc_attrs() allocated a struct page table for rk_obj, so clear
> +	 * VM_PFNMAP flag that was set by drm_gem_mmap_obj()/drm_gem_mmap().
> +	 */
> +	vma->vm_flags &= ~VM_PFNMAP;
> +	vma->vm_pgoff = 0;
> +
> +	ret = dma_mmap_attrs(drm->dev, vma, mtk_gem->cookie, mtk_gem->dma_addr,
> +			     obj->size, &mtk_gem->dma_attrs);
> +	if (ret)
> +		drm_gem_vm_close(vma);
> +
> +	return ret;
> +}
> +
> +int mtk_drm_gem_mmap_buf(struct drm_gem_object *obj, struct vm_area_struct *vma)
> +{
> +	int ret;
> +
> +	ret = drm_gem_mmap_obj(obj, obj->size, vma);
> +	if (ret)
> +		return ret;
> +
> +	return mtk_drm_gem_object_mmap(obj, vma);
> +}
> +
> +int mtk_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
> +{
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	ret = drm_gem_mmap(filp, vma);
> +	if (ret)
> +		return ret;
> +
> +	obj = vma->vm_private_data;
> +
> +	return mtk_drm_gem_object_mmap(obj, vma);
> +}
> +
> +/*
> + * Allocate a sg_table for this GEM object.
> + * Note: Both the table's contents, and the sg_table itself must be freed by
> + *       the caller.
> + * Returns a pointer to the newly allocated sg_table, or an ERR_PTR() error.
> + */
> +struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj)
> +{
> +	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
> +	struct drm_device *drm = obj->dev;
> +	struct sg_table *sgt;
> +	int ret;
> +
> +	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
> +	if (!sgt)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = dma_get_sgtable_attrs(drm->dev, sgt, mtk_gem->cookie,
> +				    mtk_gem->dma_addr, obj->size,
> +				    &mtk_gem->dma_attrs);
> +	if (ret) {
> +		DRM_ERROR("failed to allocate sgt, %d\n", ret);
> +		kfree(sgt);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return sgt;
> +}
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.h b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
> new file mode 100644
> index 0000000..9bdeeb3
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
> @@ -0,0 +1,55 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef _MTK_DRM_GEM_H_
> +#define _MTK_DRM_GEM_H_
> +
> +#include <drm/drm_gem.h>
> +
> +/*
> + * mtk drm buffer structure.
> + *
> + * @base: a gem object.
> + *	- a new handle to this gem object would be created
> + *	by drm_gem_handle_create().
> + * @cookie: the return value of dma_alloc_attrs(), keep it for dma_free_attrs()
> + * @kvaddr: kernel virtual address of gem buffer.
> + * @dma_addr: dma address of gem buffer.
> + * @dma_attrs: dma attributes of gem buffer.
> + *
> + * P.S. this object would be transferred to user as kms_bo.handle so
> + *	user can access the buffer through kms_bo.handle.
> + */
> +struct mtk_drm_gem_obj {
> +	struct drm_gem_object	base;
> +	void			*cookie;
> +	void			*kvaddr;
> +	dma_addr_t		dma_addr;
> +	struct dma_attrs	dma_attrs;
> +};
> +
> +#define to_mtk_gem_obj(x)	container_of(x, struct mtk_drm_gem_obj, base)
> +
> +void mtk_drm_gem_free_object(struct drm_gem_object *gem);
> +struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_device *dev,
> +		unsigned long size, bool alloc_kmap);
> +int mtk_drm_gem_dumb_create(struct drm_file *file_priv,
> +		struct drm_device *dev, struct drm_mode_create_dumb *args);
> +int mtk_drm_gem_dumb_map_offset(struct drm_file *file_priv,
> +		struct drm_device *dev, uint32_t handle, uint64_t *offset);
> +int mtk_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
> +int mtk_drm_gem_mmap_buf(struct drm_gem_object *obj,
> +		struct vm_area_struct *vma);
> +struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj);
> +
> +#endif
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> new file mode 100644
> index 0000000..c0b62d1
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -0,0 +1,238 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + * Author: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_plane_helper.h>
> +#include <linux/dma-buf.h>
> +#include <linux/reservation.h>
> +
> +#include "mtk_drm_crtc.h"
> +#include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_drv.h"
> +#include "mtk_drm_fb.h"
> +#include "mtk_drm_gem.h"
> +#include "mtk_drm_plane.h"
> +
> +static const uint32_t formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_RGB565,
> +};
> +
> +static void mtk_plane_config(struct mtk_drm_plane *mtk_plane, bool enable,
> +			     dma_addr_t addr, struct drm_rect *dest)
> +{
> +	struct drm_plane *plane = &mtk_plane->base;
> +	struct mtk_plane_state *state = to_mtk_plane_state(plane->state);
> +	unsigned int pitch, format;
> +	int x, y;
> +
> +	if (WARN_ON(!plane->state || (enable && !plane->state->fb)))
> +		return;
> +
> +	if (plane->state->fb) {
> +		pitch = plane->state->fb->pitches[0];
> +		format = plane->state->fb->pixel_format;
> +	} else {
> +		pitch = 0;
> +		format = DRM_FORMAT_RGBA8888;
> +	}
> +
> +	x = plane->state->crtc_x;
> +	y = plane->state->crtc_y;
> +
> +	if (x < 0) {
> +		addr -= x * 4;
> +		x = 0;
> +	}
> +
> +	if (y < 0) {
> +		addr -= y * pitch;
> +		y = 0;
> +	}
> +
> +	state->pending.enable = enable;
> +	state->pending.pitch = pitch;
> +	state->pending.format = format;
> +	state->pending.addr = addr;
> +	state->pending.x = x;
> +	state->pending.y = y;
> +	state->pending.width = dest->x2 - dest->x1;
> +	state->pending.height = dest->y2 - dest->y1;
> +	state->pending.dirty = true;
> +}
> +
> +static void mtk_plane_reset(struct drm_plane *plane)
> +{
> +	struct mtk_plane_state *state;
> +
> +	if (plane->state && plane->state->fb)
> +		drm_framebuffer_unreference(plane->state->fb);
> +
> +	kfree(plane->state);
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	plane->state = &state->base;
> +	if (!state)
> +		return;
> +
> +	plane->state->plane = plane;
> +	state->pending.format = DRM_FORMAT_RGB565;
> +}
> +
> +static struct drm_plane_state *mtk_plane_duplicate_state(struct drm_plane *plane)
> +{
> +	struct mtk_plane_state *old_state = to_mtk_plane_state(plane->state);
> +	struct mtk_plane_state *state;
> +
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return NULL;
> +
> +	__drm_atomic_helper_plane_duplicate_state(plane, &state->base);
> +
> +	WARN_ON(state->base.plane != plane);
> +
> +	state->pending = old_state->pending;
> +
> +	return &state->base;
> +}
> +
> +static const struct drm_plane_funcs mtk_plane_funcs = {
> +	.update_plane = drm_atomic_helper_update_plane,
> +	.disable_plane = drm_atomic_helper_disable_plane,
> +	.destroy = drm_plane_cleanup,
> +	.reset = mtk_plane_reset,
> +	.atomic_duplicate_state = mtk_plane_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> +};
> +
> +static int mtk_plane_atomic_check(struct drm_plane *plane,
> +				  struct drm_plane_state *state)
> +{
> +	struct drm_framebuffer *fb = state->fb;
> +	struct drm_crtc_state *crtc_state;
> +	bool visible;
> +	int ret;
> +	struct drm_rect dest = {
> +		.x1 = state->crtc_x,
> +		.y1 = state->crtc_y,
> +		.x2 = state->crtc_x + state->crtc_w,
> +		.y2 = state->crtc_y + state->crtc_h,
> +	};
> +	struct drm_rect src = {
> +		/* 16.16 fixed point */
> +		.x1 = state->src_x,
> +		.y1 = state->src_y,
> +		.x2 = state->src_x + state->src_w,
> +		.y2 = state->src_y + state->src_h,
> +	};
> +	struct drm_rect clip = { 0, };
> +
> +	if (!fb)
> +		return 0;
> +
> +	if (!mtk_fb_get_gem_obj(fb)) {
> +		DRM_DEBUG_KMS("buffer is null\n");
> +		return -EFAULT;
> +	}
> +
> +	if (!state->crtc)
> +		return 0;
> +
> +	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
> +	if (IS_ERR(crtc_state))
> +		return PTR_ERR(crtc_state);
> +
> +	clip.x2 = crtc_state->mode.hdisplay;
> +	clip.y2 = crtc_state->mode.vdisplay;
> +
> +	ret = drm_plane_helper_check_update(plane, state->crtc, fb,
> +					    &src, &dest, &clip,
> +					    DRM_PLANE_HELPER_NO_SCALING,
> +					    DRM_PLANE_HELPER_NO_SCALING,
> +					    true, true, &visible);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void mtk_plane_atomic_update(struct drm_plane *plane,
> +				    struct drm_plane_state *old_state)
> +{
> +	struct mtk_plane_state *state = to_mtk_plane_state(plane->state);
> +	struct drm_crtc *crtc = state->base.crtc;
> +	struct drm_gem_object *gem;
> +	struct mtk_drm_plane *mtk_plane = to_mtk_plane(plane);
> +	struct drm_rect dest = {
> +		.x1 = state->base.crtc_x,
> +		.y1 = state->base.crtc_y,
> +		.x2 = state->base.crtc_x + state->base.crtc_w,
> +		.y2 = state->base.crtc_y + state->base.crtc_h,
> +	};
> +	struct drm_rect clip = { 0, };
> +
> +	if (!crtc)
> +		return;
> +
> +	clip.x2 = state->base.crtc->state->mode.hdisplay;
> +	clip.y2 = state->base.crtc->state->mode.vdisplay;
> +	drm_rect_intersect(&dest, &clip);
> +
> +	gem = mtk_fb_get_gem_obj(state->base.fb);
> +	if (gem)
> +		mtk_plane_config(mtk_plane, true, to_mtk_gem_obj(gem)->dma_addr,
> +				 &dest);
> +}
> +
> +static void mtk_plane_atomic_disable(struct drm_plane *plane,
> +				     struct drm_plane_state *old_state)
> +{
> +	struct mtk_drm_plane *mtk_plane = to_mtk_plane(plane);
> +	struct drm_crtc *crtc = old_state->crtc;
> +	struct drm_rect dest = { 0, };
> +
> +	if (!crtc)
> +		return;
> +
> +	mtk_plane_config(mtk_plane, false, 0, &dest);
> +}
> +
> +static const struct drm_plane_helper_funcs mtk_plane_helper_funcs = {
> +	.atomic_check = mtk_plane_atomic_check,
> +	.atomic_update = mtk_plane_atomic_update,
> +	.atomic_disable = mtk_plane_atomic_disable,
> +};
> +
> +int mtk_plane_init(struct drm_device *dev, struct mtk_drm_plane *mtk_plane,
> +		   unsigned long possible_crtcs, enum drm_plane_type type,
> +		   unsigned int zpos)
> +{
> +	int err;
> +
> +	err = drm_universal_plane_init(dev, &mtk_plane->base, possible_crtcs,
> +			&mtk_plane_funcs, formats, ARRAY_SIZE(formats), type);
> +
> +	if (err) {
> +		DRM_ERROR("failed to initialize plane\n");
> +		return err;
> +	}
> +
> +	drm_plane_helper_add(&mtk_plane->base, &mtk_plane_helper_funcs);
> +	mtk_plane->idx = zpos;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> new file mode 100644
> index 0000000..0e57ab7
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> @@ -0,0 +1,58 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + * Author: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef _MTK_DRM_PLANE_H_
> +#define _MTK_DRM_PLANE_H_
> +
> +#include <drm/drm_crtc.h>
> +
> +struct mtk_drm_plane {
> +	struct drm_plane		base;
> +	unsigned int			idx;
> +};
> +
> +struct mtk_plane_pending_state {
> +	bool				config;
> +	bool				enable;
> +	unsigned int			addr;
> +	unsigned int			pitch;
> +	unsigned int			format;
> +	unsigned int			x;
> +	unsigned int			y;
> +	unsigned int			width;
> +	unsigned int			height;
> +	bool				dirty;
> +};
> +
> +struct mtk_plane_state {
> +	struct drm_plane_state		base;
> +	struct mtk_plane_pending_state	pending;
> +};
> +
> +static inline struct mtk_drm_plane *to_mtk_plane(struct drm_plane *plane)
> +{
> +	return container_of(plane, struct mtk_drm_plane, base);
> +}
> +
> +static inline struct mtk_plane_state *
> +to_mtk_plane_state(struct drm_plane_state *state)
> +{
> +	return container_of(state, struct mtk_plane_state, base);
> +}
> +
> +int mtk_plane_init(struct drm_device *dev, struct mtk_drm_plane *mtk_plane,
> +		   unsigned long possible_crtcs, enum drm_plane_type type,
> +		   unsigned int zpos);
> +
> +#endif
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
