From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 3/9] gpu: ipu-v3: add driver for Prefetch Resolve Engine
Date: Fri, 17 Feb 2017 19:28:24 +0100
Message-ID: <20170217182830.32618-4-l.stach@pengutronix.de>
References: <20170217182830.32618-1-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170217182830.32618-1-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds support for the i.MX6 QuadPlus PRE units. Currently only
linear prefetch into SRAM is supported, other modes of operation
like the tiled-to-linear conversion will be added later.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/gpu/ipu-v3/Makefile  |   2 +-
 drivers/gpu/ipu-v3/ipu-pre.c | 290 +++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/ipu-v3/ipu-prv.h |  11 ++
 3 files changed, 302 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/ipu-v3/ipu-pre.c

diff --git a/drivers/gpu/ipu-v3/Makefile b/drivers/gpu/ipu-v3/Makefile
index 5f961416c4ee..8ae90de46b4d 100644
--- a/drivers/gpu/ipu-v3/Makefile
+++ b/drivers/gpu/ipu-v3/Makefile
@@ -2,4 +2,4 @@ obj-$(CONFIG_IMX_IPUV3_CORE) += imx-ipu-v3.o
 
 imx-ipu-v3-objs := ipu-common.o ipu-cpmem.o ipu-csi.o ipu-dc.o ipu-di.o \
 		ipu-dp.o ipu-dmfc.o ipu-ic.o ipu-image-convert.o \
-		ipu-smfc.o ipu-vdi.o
+		ipu-pre.o ipu-smfc.o ipu-vdi.o
diff --git a/drivers/gpu/ipu-v3/ipu-pre.c b/drivers/gpu/ipu-v3/ipu-pre.c
new file mode 100644
index 000000000000..febe0cb8b094
--- /dev/null
+++ b/drivers/gpu/ipu-v3/ipu-pre.c
@@ -0,0 +1,290 @@
+/*
+ * Copyright (c) 2017 Lucas Stach, Pengutronix
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ */
+
+#include <drm/drm_fourcc.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/genalloc.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <video/imx-ipu-v3.h>
+
+#include "ipu-prv.h"
+
+#define IPU_PRE_MAX_WIDTH	2048
+#define IPU_PRE_NUM_SCANLINES	8
+
+#define IPU_PRE_CTRL					0x000
+#define IPU_PRE_CTRL_SET				0x004
+#define  IPU_PRE_CTRL_ENABLE				(1 << 0)
+#define  IPU_PRE_CTRL_BLOCK_EN				(1 << 1)
+#define  IPU_PRE_CTRL_BLOCK_16				(1 << 2)
+#define  IPU_PRE_CTRL_SDW_UPDATE			(1 << 4)
+#define  IPU_PRE_CTRL_VFLIP				(1 << 5)
+#define  IPU_PRE_CTRL_SO				(1 << 6)
+#define  IPU_PRE_CTRL_INTERLACED_FIELD			(1 << 7)
+#define  IPU_PRE_CTRL_HANDSHAKE_EN			(1 << 8)
+#define  IPU_PRE_CTRL_HANDSHAKE_LINE_NUM(v)		((v & 0x3) << 9)
+#define  IPU_PRE_CTRL_HANDSHAKE_ABORT_SKIP_EN		(1 << 11)
+#define  IPU_PRE_CTRL_EN_REPEAT				(1 << 28)
+#define  IPU_PRE_CTRL_TPR_REST_SEL			(1 << 29)
+#define  IPU_PRE_CTRL_CLKGATE				(1 << 30)
+#define  IPU_PRE_CTRL_SFTRST				(1 << 31)
+
+#define IPU_PRE_CUR_BUF					0x030
+
+#define IPU_PRE_NEXT_BUF				0x040
+
+#define IPU_PRE_TPR_CTRL				0x070
+#define  IPU_PRE_TPR_CTRL_TILE_FORMAT(v)		((v & 0xff) << 0)
+#define  IPU_PRE_TPR_CTRL_TILE_FORMAT_MASK		0xff
+
+#define IPU_PRE_PREFETCH_ENG_CTRL			0x080
+#define  IPU_PRE_PREF_ENG_CTRL_PREFETCH_EN		(1 << 0)
+#define  IPU_PRE_PREF_ENG_CTRL_RD_NUM_BYTES(v)		((v & 0x7) << 1)
+#define  IPU_PRE_PREF_ENG_CTRL_INPUT_ACTIVE_BPP(v)	((v & 0x3) << 4)
+#define  IPU_PRE_PREF_ENG_CTRL_INPUT_PIXEL_FORMAT(v)	((v & 0x7) << 8)
+#define  IPU_PRE_PREF_ENG_CTRL_SHIFT_BYPASS		(1 << 11)
+#define  IPU_PRE_PREF_ENG_CTRL_FIELD_INVERSE		(1 << 12)
+#define  IPU_PRE_PREF_ENG_CTRL_PARTIAL_UV_SWAP		(1 << 14)
+#define  IPU_PRE_PREF_ENG_CTRL_TPR_COOR_OFFSET_EN	(1 << 15)
+
+#define IPU_PRE_PREFETCH_ENG_INPUT_SIZE			0x0a0
+#define  IPU_PRE_PREFETCH_ENG_INPUT_SIZE_WIDTH(v)	((v & 0xffff) << 0)
+#define  IPU_PRE_PREFETCH_ENG_INPUT_SIZE_HEIGHT(v)	((v & 0xffff) << 16)
+
+#define IPU_PRE_PREFETCH_ENG_PITCH			0x0d0
+#define  IPU_PRE_PREFETCH_ENG_PITCH_Y(v)		((v & 0xffff) << 0)
+#define  IPU_PRE_PREFETCH_ENG_PITCH_UV(v)		((v & 0xffff) << 16)
+
+#define IPU_PRE_STORE_ENG_CTRL				0x110
+#define  IPU_PRE_STORE_ENG_CTRL_STORE_EN		(1 << 0)
+#define  IPU_PRE_STORE_ENG_CTRL_WR_NUM_BYTES(v)		((v & 0x7) << 1)
+#define  IPU_PRE_STORE_ENG_CTRL_OUTPUT_ACTIVE_BPP(v)	((v & 0x3) << 4)
+
+#define IPU_PRE_STORE_ENG_SIZE				0x130
+#define  IPU_PRE_STORE_ENG_SIZE_INPUT_WIDTH(v)		((v & 0xffff) << 0)
+#define  IPU_PRE_STORE_ENG_SIZE_INPUT_HEIGHT(v)		((v & 0xffff) << 16)
+
+#define IPU_PRE_STORE_ENG_PITCH				0x140
+#define  IPU_PRE_STORE_ENG_PITCH_OUT_PITCH(v)		((v & 0xffff) << 0)
+
+#define IPU_PRE_STORE_ENG_ADDR				0x150
+
+struct ipu_pre {
+	struct list_head	list;
+	struct device		*dev;
+
+	void __iomem		*regs;
+	struct clk		*clk_axi;
+	struct gen_pool		*ocram;
+
+	dma_addr_t		buffer_paddr;
+	void			*buffer_virt;
+	bool			in_use;
+};
+
+static DEFINE_MUTEX(ipu_pre_list_mutex);
+static LIST_HEAD(ipu_pre_list);
+static int available_pres;
+
+int ipu_pre_get_available_count(void)
+{
+	return available_pres;
+}
+
+struct ipu_pre *
+ipu_pre_get_by_prg_device(struct device *dev, int index)
+{
+	struct device_node *pre_node = of_parse_phandle(dev->of_node,
+							"fsl,pres", index);
+	struct ipu_pre *pre;
+
+	mutex_lock(&ipu_pre_list_mutex);
+	list_for_each_entry(pre, &ipu_pre_list, list) {
+		if (pre_node == pre->dev->of_node) {
+			mutex_unlock(&ipu_pre_list_mutex);
+			device_link_add(dev, pre->dev, DL_FLAG_AUTOREMOVE);
+			return pre;
+		}
+	}
+	mutex_unlock(&ipu_pre_list_mutex);
+
+	return NULL;
+}
+
+int ipu_pre_get(struct ipu_pre *pre)
+{
+	u32 val;
+
+	if (pre->in_use)
+		return -EBUSY;
+
+	clk_prepare_enable(pre->clk_axi);
+
+	/* first get the engine out of reset and remove clock gating */
+	writel(0, pre->regs + IPU_PRE_CTRL);
+
+	/* init defaults that should be applied to all streams */
+	val = IPU_PRE_CTRL_HANDSHAKE_ABORT_SKIP_EN |
+	      IPU_PRE_CTRL_HANDSHAKE_EN |
+	      IPU_PRE_CTRL_TPR_REST_SEL |
+	      IPU_PRE_CTRL_BLOCK_16 | IPU_PRE_CTRL_SDW_UPDATE;
+	writel(val, pre->regs + IPU_PRE_CTRL);
+
+	pre->in_use = true;
+	return 0;
+}
+
+void ipu_pre_put(struct ipu_pre *pre)
+{
+	u32 val;
+
+	val = IPU_PRE_CTRL_SFTRST | IPU_PRE_CTRL_CLKGATE;
+	writel(val, pre->regs + IPU_PRE_CTRL);
+
+	clk_disable_unprepare(pre->clk_axi);
+
+	pre->in_use = false;
+}
+
+void ipu_pre_configure(struct ipu_pre *pre, unsigned int width,
+		       unsigned int height, unsigned int stride, u32 format,
+		       unsigned int bufaddr)
+{
+	const struct drm_format_info *info = drm_format_info(format);
+	u32 active_bpp = info->cpp[0] >> 1;
+	u32 val;
+
+	writel(bufaddr, pre->regs + IPU_PRE_CUR_BUF);
+	writel(bufaddr, pre->regs + IPU_PRE_NEXT_BUF);
+
+	val = IPU_PRE_PREF_ENG_CTRL_INPUT_PIXEL_FORMAT(0) |
+	      IPU_PRE_PREF_ENG_CTRL_INPUT_ACTIVE_BPP(active_bpp) |
+	      IPU_PRE_PREF_ENG_CTRL_RD_NUM_BYTES(4) |
+	      IPU_PRE_PREF_ENG_CTRL_SHIFT_BYPASS |
+	      IPU_PRE_PREF_ENG_CTRL_PREFETCH_EN;
+	writel(val, pre->regs + IPU_PRE_PREFETCH_ENG_CTRL);
+
+	val = IPU_PRE_PREFETCH_ENG_INPUT_SIZE_WIDTH(width) |
+	      IPU_PRE_PREFETCH_ENG_INPUT_SIZE_HEIGHT(height);
+	writel(val, pre->regs + IPU_PRE_PREFETCH_ENG_INPUT_SIZE);
+
+	val = IPU_PRE_PREFETCH_ENG_PITCH_Y(stride);
+	writel(val, pre->regs + IPU_PRE_PREFETCH_ENG_PITCH);
+
+	val = IPU_PRE_STORE_ENG_CTRL_OUTPUT_ACTIVE_BPP(active_bpp) |
+	      IPU_PRE_STORE_ENG_CTRL_WR_NUM_BYTES(4) |
+	      IPU_PRE_STORE_ENG_CTRL_STORE_EN;
+	writel(val, pre->regs + IPU_PRE_STORE_ENG_CTRL);
+
+	val = IPU_PRE_STORE_ENG_SIZE_INPUT_WIDTH(width) |
+	      IPU_PRE_STORE_ENG_SIZE_INPUT_HEIGHT(height);
+	writel(val, pre->regs + IPU_PRE_STORE_ENG_SIZE);
+
+	val = IPU_PRE_STORE_ENG_PITCH_OUT_PITCH(stride);
+	writel(val, pre->regs + IPU_PRE_STORE_ENG_PITCH);
+
+	writel(pre->buffer_paddr, pre->regs + IPU_PRE_STORE_ENG_ADDR);
+
+	val = readl(pre->regs + IPU_PRE_CTRL);
+	val |= IPU_PRE_CTRL_EN_REPEAT | IPU_PRE_CTRL_ENABLE |
+	       IPU_PRE_CTRL_SDW_UPDATE;
+	writel(val, pre->regs + IPU_PRE_CTRL);
+}
+
+void ipu_pre_update(struct ipu_pre *pre, unsigned int bufaddr)
+{
+	writel(bufaddr, pre->regs + IPU_PRE_NEXT_BUF);
+	writel(IPU_PRE_CTRL_SDW_UPDATE, pre->regs + IPU_PRE_CTRL_SET);
+}
+
+u32 ipu_pre_get_baddr(struct ipu_pre *pre)
+{
+	return (u32)pre->buffer_paddr;
+}
+
+static int ipu_pre_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	struct ipu_pre *pre;
+
+	pre = devm_kzalloc(dev, sizeof(*pre), GFP_KERNEL);
+	if (!pre)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	pre->regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(pre->regs))
+		return PTR_ERR(pre->regs);
+
+	pre->clk_axi = devm_clk_get(dev, "axi");
+	if (IS_ERR(pre->clk_axi))
+		return PTR_ERR(pre->clk_axi);
+
+	pre->ocram = of_gen_pool_get(dev->of_node, "fsl,ocram", 0);
+	if (!pre->ocram)
+		return -EPROBE_DEFER;
+
+	/*
+	 * Allocate OCRAM buffer with maximum size. This could be made dynamic,
+	 * but as there is no other user of this OCRAM region and we can fit all
+	 * max sized buffers into it, there is no need yet.
+	 */
+	pre->buffer_virt = gen_pool_dma_alloc(pre->ocram, IPU_PRE_MAX_WIDTH *
+					      IPU_PRE_NUM_SCANLINES * 4,
+					      &pre->buffer_paddr);
+	if (!pre->buffer_virt)
+		return -ENOMEM;
+
+	pre->dev = dev;
+	platform_set_drvdata(pdev, pre);
+	mutex_lock(&ipu_pre_list_mutex);
+	list_add(&pre->list, &ipu_pre_list);
+	available_pres++;
+	mutex_unlock(&ipu_pre_list_mutex);
+
+	return 0;
+}
+
+static int ipu_pre_remove(struct platform_device *pdev)
+{
+	struct ipu_pre *pre = platform_get_drvdata(pdev);
+
+	mutex_lock(&ipu_pre_list_mutex);
+	list_del(&pre->list);
+	available_pres--;
+	mutex_unlock(&ipu_pre_list_mutex);
+
+	if (pre->buffer_virt)
+		gen_pool_free(pre->ocram, (unsigned long)pre->buffer_virt,
+			      IPU_PRE_MAX_WIDTH * IPU_PRE_NUM_SCANLINES * 4);
+	return 0;
+}
+
+static const struct of_device_id ipu_pre_dt_ids[] = {
+	{ .compatible = "fsl,imx6qp-pre", },
+	{ /* sentinel */ },
+};
+
+static struct platform_driver ipu_pre_drv = {
+	.probe		= ipu_pre_probe,
+	.remove		= ipu_pre_remove,
+	.driver		= {
+		.name	= "imx-ipu-pre",
+		.of_match_table = ipu_pre_dt_ids,
+	},
+};
+module_platform_driver(ipu_pre_drv);
diff --git a/drivers/gpu/ipu-v3/ipu-prv.h b/drivers/gpu/ipu-v3/ipu-prv.h
index 22e47b68b14a..536a156a5eb6 100644
--- a/drivers/gpu/ipu-v3/ipu-prv.h
+++ b/drivers/gpu/ipu-v3/ipu-prv.h
@@ -168,6 +168,7 @@ struct ipu_ic_priv;
 struct ipu_vdi;
 struct ipu_image_convert_priv;
 struct ipu_smfc_priv;
+struct ipu_pre;
 
 struct ipu_devtype;
 
@@ -259,4 +260,14 @@ void ipu_cpmem_exit(struct ipu_soc *ipu);
 int ipu_smfc_init(struct ipu_soc *ipu, struct device *dev, unsigned long base);
 void ipu_smfc_exit(struct ipu_soc *ipu);
 
+struct ipu_pre *ipu_pre_get_by_prg_device(struct device *dev, int index);
+int ipu_pre_get_available_count(void);
+int ipu_pre_get(struct ipu_pre *pre);
+void ipu_pre_put(struct ipu_pre *pre);
+u32 ipu_pre_get_baddr(struct ipu_pre *pre);
+void ipu_pre_configure(struct ipu_pre *pre, unsigned int width,
+		       unsigned int height,
+		       unsigned int stride, u32 format, unsigned int bufaddr);
+void ipu_pre_update(struct ipu_pre *pre, unsigned int bufaddr);
+
 #endif				/* __IPU_PRV_H__ */
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
