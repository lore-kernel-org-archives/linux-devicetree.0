From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v1 4/5] clk: mediatek: add clk support for MT6755
Date: Tue, 8 Aug 2017 16:13:33 +0800
Message-ID: <1502180014-7995-5-git-send-email-mars.cheng@mediatek.com>
References: <1502180014-7995-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502180014-7995-1-git-send-email-mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add MT6755 clock support, include topckgen, apmixedsys, infracfg,
and subsystem clocks

Signed-off-by: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/clk/mediatek/Kconfig           |   32 ++
 drivers/clk/mediatek/Makefile          |    5 +
 drivers/clk/mediatek/clk-mt6755-img.c  |   81 ++++
 drivers/clk/mediatek/clk-mt6755-mm.c   |  148 +++++++
 drivers/clk/mediatek/clk-mt6755-vdec.c |   91 +++++
 drivers/clk/mediatek/clk-mt6755-venc.c |   78 ++++
 drivers/clk/mediatek/clk-mt6755.c      |  666 ++++++++++++++++++++++++++++++++
 7 files changed, 1101 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt6755-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt6755-mm.c
 create mode 100644 drivers/clk/mediatek/clk-mt6755-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt6755-venc.c
 create mode 100644 drivers/clk/mediatek/clk-mt6755.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 28739a9..1cc7061 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -50,6 +50,38 @@ config COMMON_CLK_MT2701_BDPSYS
 	---help---
 	  This driver supports Mediatek MT2701 bdpsys clocks.
 
+config COMMON_CLK_MT6755
+       bool "Clock driver for Mediatek MT6755"
+       depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
+       select COMMON_CLK_MEDIATEK
+       default ARCH_MEDIATEK && ARM64
+       ---help---
+         This driver supports Mediatek MT6755 basic clocks.
+
+config COMMON_CLK_MT6755_MMSYS
+       bool "Clock driver for Mediatek MT6755 mmsys"
+       depends on COMMON_CLK_MT6755
+       ---help---
+         This driver supports Mediatek MT6755 mmsys clocks.
+
+config COMMON_CLK_MT6755_IMGSYS
+       bool "Clock driver for Mediatek MT6755 imgsys"
+       depends on COMMON_CLK_MT6755
+       ---help---
+         This driver supports Mediatek MT6755 imgsys clocks.
+
+config COMMON_CLK_MT6755_VDECSYS
+       bool "Clock driver for Mediatek MT6755 vdecsys"
+       depends on COMMON_CLK_MT6755
+       ---help---
+         This driver supports Mediatek MT6755 vdecsys clocks.
+
+config COMMON_CLK_MT6755_VENCSYS
+       bool "Clock driver for Mediatek MT6755 vencsys"
+       depends on COMMON_CLK_MT6755
+       ---help---
+         This driver supports Mediatek MT6755 vencsys clocks.
+
 config COMMON_CLK_MT6797
        bool "Clock driver for Mediatek MT6797"
        depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 2a755b5..ed680fc 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -1,5 +1,10 @@
 obj-$(CONFIG_COMMON_CLK_MEDIATEK) += clk-mtk.o clk-pll.o clk-gate.o clk-apmixed.o clk-cpumux.o
 obj-$(CONFIG_RESET_CONTROLLER) += reset.o
+obj-$(CONFIG_COMMON_CLK_MT6755) += clk-mt6755.o
+obj-$(CONFIG_COMMON_CLK_MT6755_IMGSYS) += clk-mt6755-img.o
+obj-$(CONFIG_COMMON_CLK_MT6755_MMSYS) += clk-mt6755-mm.o
+obj-$(CONFIG_COMMON_CLK_MT6755_VDECSYS) += clk-mt6755-vdec.o
+obj-$(CONFIG_COMMON_CLK_MT6755_VENCSYS) += clk-mt6755-venc.o
 obj-$(CONFIG_COMMON_CLK_MT6797) += clk-mt6797.o
 obj-$(CONFIG_COMMON_CLK_MT6797_IMGSYS) += clk-mt6797-img.o
 obj-$(CONFIG_COMMON_CLK_MT6797_MMSYS) += clk-mt6797-mm.o
diff --git a/drivers/clk/mediatek/clk-mt6755-img.c b/drivers/clk/mediatek/clk-mt6755-img.c
new file mode 100644
index 0000000..b9e6832
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6755-img.c
@@ -0,0 +1,81 @@
+/*
+ * Copyright (c) 2017 MediaTek Inc.
+ * Author: Wendell Lin <wendell.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/mt6755-clk.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+static const struct mtk_gate_regs img_cg_regs = {
+	.set_ofs = 0x0004,
+	.clr_ofs = 0x0008,
+	.sta_ofs = 0x0000,
+};
+
+#define GATE_IMG(_id, _name, _parent, _shift) {		\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &img_cg_regs,			\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+	}
+
+static const struct mtk_gate img_clks[] = {
+	GATE_IMG(CLK_IMG_IMAGE_LARB2_SMI, "img_image_larb2_smi", "mm_sel", 0),
+	GATE_IMG(CLK_IMG_IMAGE_CAM_SMI, "img_image_cam_smi", "mm_sel", 5),
+	GATE_IMG(CLK_IMG_IMAGE_CAM_CAM, "img_image_cam_cam", "mm_sel", 6),
+	GATE_IMG(CLK_IMG_IMAGE_SEN_TG, "img_image_sen_tg", "mm_sel", 7),
+	GATE_IMG(CLK_IMG_IMAGE_SEN_CAM, "img_image_sen_cam", "camtg_sel", 8),
+	GATE_IMG(CLK_IMG_IMAGE_CAM_SV, "img_image_cam_sv", "mm_sel", 9),
+	GATE_IMG(CLK_IMG_IMAGE_SUFOD, "img_image_sufod", "mm_sel", 10),
+	GATE_IMG(CLK_IMG_IMAGE_FD, "img_image_fd", "mm_sel", 11),
+};
+
+static const struct of_device_id of_match_clk_mt6755_img[] = {
+	{ .compatible = "mediatek,mt6755-imgsys", },
+	{}
+};
+
+static int clk_mt6755_img_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	int r;
+	struct device_node *node = pdev->dev.of_node;
+
+	clk_data = mtk_alloc_clk_data(CLK_IMG_NR);
+
+	mtk_clk_register_gates(node, img_clks, ARRAY_SIZE(img_clks),
+			       clk_data);
+
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		dev_err(&pdev->dev,
+			"could not register clock provider: %s: %d\n",
+			pdev->name, r);
+
+	return r;
+}
+
+static struct platform_driver clk_mt6755_img_drv = {
+	.probe = clk_mt6755_img_probe,
+	.driver = {
+		.name = "clk-mt6755-img",
+		.of_match_table = of_match_clk_mt6755_img,
+	},
+};
+
+builtin_platform_driver(clk_mt6755_img_drv);
diff --git a/drivers/clk/mediatek/clk-mt6755-mm.c b/drivers/clk/mediatek/clk-mt6755-mm.c
new file mode 100644
index 0000000..2438b53
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6755-mm.c
@@ -0,0 +1,148 @@
+/*
+ * Copyright (c) 2017 MediaTek Inc.
+ * Author: Wendell Lin <wendell.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/mt6755-clk.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+static const struct mtk_gate_regs disp0_cg_regs = {
+	.set_ofs = 0x0104,
+	.clr_ofs = 0x0108,
+	.sta_ofs = 0x0100,
+};
+
+static const struct mtk_gate_regs disp1_cg_regs = {
+	.set_ofs = 0x0114,
+	.clr_ofs = 0x0118,
+	.sta_ofs = 0x0110,
+};
+
+#define GATE_DISP0(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &disp0_cg_regs,			\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+	}
+
+#define GATE_DISP1(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &disp1_cg_regs,			\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+	}
+
+static const struct mtk_gate mm_clks[] = {
+	GATE_DISP0(CLK_MM_DISP0_SMI_COMMON, "mm_disp0_smi_common",
+		   "mm_sel", 0),
+	GATE_DISP0(CLK_MM_DISP0_SMI_LARB0, "mm_disp0_smi_larb0",
+		   "mm_sel", 1),
+	GATE_DISP0(CLK_MM_DISP0_CAM_MDP, "mm_disp0_cam_mdp",
+		   "mm_sel", 2),
+	GATE_DISP0(CLK_MM_DISP0_MDP_RDMA, "mm_disp0_mdp_rdma",
+		   "mm_sel", 3),
+	GATE_DISP0(CLK_MM_DISP0_MDP_RSZ0, "mm_disp0_mdp_rsz0",
+		   "mm_sel", 4),
+	GATE_DISP0(CLK_MM_DISP0_MDP_RSZ1, "mm_disp0_mdp_rsz1",
+		   "mm_sel", 5),
+	GATE_DISP0(CLK_MM_DISP0_MDP_TDSHP, "mm_disp0_mdp_tdshp",
+		   "mm_sel", 6),
+	GATE_DISP0(CLK_MM_DISP0_MDP_WDMA, "mm_disp0_mdp_wdma",
+		   "mm_sel", 7),
+	GATE_DISP0(CLK_MM_DISP0_MDP_WROT, "mm_disp0_mdp_wrot",
+		   "mm_sel", 8),
+	GATE_DISP0(CLK_MM_DISP0_FAKE_ENG, "mm_disp0_fake_eng",
+		   "mm_sel", 9),
+	GATE_DISP0(CLK_MM_DISP0_DISP_OVL0, "mm_disp0_disp_ovl0",
+		   "mm_sel", 10),
+	GATE_DISP0(CLK_MM_DISP0_DISP_OVL1, "mm_disp0_disp_ovl1",
+		   "mm_sel", 11),
+	GATE_DISP0(CLK_MM_DISP0_DISP_RDMA0, "mm_disp0_disp_rdma0",
+		   "mm_sel", 12),
+	GATE_DISP0(CLK_MM_DISP0_DISP_RDMA1, "mm_disp0_disp_rdma1",
+		   "mm_sel", 13),
+	GATE_DISP0(CLK_MM_DISP0_DISP_WDMA0, "mm_disp0_disp_wdma0",
+		   "mm_sel", 14),
+	GATE_DISP0(CLK_MM_DISP0_DISP_COLOR, "mm_disp0_disp_color",
+		   "mm_sel", 15),
+	GATE_DISP0(CLK_MM_DISP0_DISP_CCORR, "mm_disp0_disp_ccorr",
+		   "mm_sel", 16),
+	GATE_DISP0(CLK_MM_DISP0_DISP_AAL, "mm_disp0_disp_aal",
+		   "mm_sel", 17),
+	GATE_DISP0(CLK_MM_DISP0_DISP_GAMMA, "mm_disp0_disp_gamma",
+		   "mm_sel", 18),
+	GATE_DISP0(CLK_MM_DISP0_DISP_DITHER, "mm_disp0_disp_dither",
+		   "mm_sel", 19),
+	GATE_DISP0(CLK_MM_DISP0_MDP_COLOR, "mm_disp0_mdp_color",
+		   "mm_sel", 20),
+	GATE_DISP0(CLK_MM_DISP0_DISP_UFOE_MOUT, "mm_disp0_ufoe_mout",
+		   "mm_sel", 21),
+	GATE_DISP0(CLK_MM_DISP0_DISP_WDMA1, "mm_disp0_disp_wdma1",
+		   "mm_sel", 22),
+	GATE_DISP0(CLK_MM_DISP0_DISP_2L_OVL0, "mm_disp0_disp_2lovl0",
+		   "mm_sel", 23),
+	GATE_DISP0(CLK_MM_DISP0_DISP_2L_OVL1, "mm_disp0_disp_2lovl1",
+		   "mm_sel", 24),
+	GATE_DISP0(CLK_MM_DISP0_DISP_OVL0_MOUT, "mm_disp0_disp_ovl0mout",
+		   "mm_sel", 25),
+	GATE_DISP1(CLK_MM_DISP1_DSI_ENGINE, "mm_disp1_dsi_engine",
+		   "mm_sel", 0),
+	GATE_DISP1(CLK_MM_DISP1_DSI_DIGITAL, "mm_disp1_dsi_digital",
+		   "mm_sel", 1),
+	GATE_DISP1(CLK_MM_DISP1_DPI_PIXEL, "mm_disp1_dpi_pixel",
+		   "dpi0_sel", 2),
+	GATE_DISP1(CLK_MM_DISP1_DPI_ENGINE, "mm_disp1_dpi_engine",
+		   "mm_sel", 3),
+};
+
+static const struct of_device_id of_match_clk_mt6755_mm[] = {
+	{ .compatible = "mediatek,mt6755-mmsys", },
+	{}
+};
+
+static int clk_mt6755_mm_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	int r;
+	struct device_node *node = pdev->dev.of_node;
+
+	clk_data = mtk_alloc_clk_data(CLK_MM_NR);
+
+	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
+			       clk_data);
+
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		dev_err(&pdev->dev,
+			"could not register clock provider: %s: %d\n",
+			pdev->name, r);
+
+	return r;
+}
+
+static struct platform_driver clk_mt6755_mm_drv = {
+	.probe = clk_mt6755_mm_probe,
+	.driver = {
+		.name = "clk-mt6755-mm",
+		.of_match_table = of_match_clk_mt6755_mm,
+	},
+};
+
+builtin_platform_driver(clk_mt6755_mm_drv);
diff --git a/drivers/clk/mediatek/clk-mt6755-vdec.c b/drivers/clk/mediatek/clk-mt6755-vdec.c
new file mode 100644
index 0000000..f23c949
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6755-vdec.c
@@ -0,0 +1,91 @@
+/*
+ * Copyright (c) 2017 MediaTek Inc.
+ * Author: Wendell Lin <wendell.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt6755-clk.h>
+
+static const struct mtk_gate_regs vdec0_cg_regs = {
+	.set_ofs = 0x0000,
+	.clr_ofs = 0x0004,
+	.sta_ofs = 0x0000,
+};
+
+static const struct mtk_gate_regs vdec1_cg_regs = {
+	.set_ofs = 0x0008,
+	.clr_ofs = 0x000c,
+	.sta_ofs = 0x0008,
+};
+
+#define GATE_VDEC0(_id, _name, _parent, _shift) {	\
+	.id = _id,				\
+	.name = _name,				\
+	.parent_name = _parent,			\
+	.regs = &vdec0_cg_regs,			\
+	.shift = _shift,			\
+	.ops = &mtk_clk_gate_ops_setclr_inv,	\
+}
+
+#define GATE_VDEC1(_id, _name, _parent, _shift) {	\
+	.id = _id,				\
+	.name = _name,				\
+	.parent_name = _parent,			\
+	.regs = &vdec1_cg_regs,			\
+	.shift = _shift,			\
+	.ops = &mtk_clk_gate_ops_setclr_inv,	\
+}
+
+static const struct mtk_gate vdec_clks[] = {
+	GATE_VDEC0(CLK_VDEC0_VDEC, "vdec0_vdec", "vdec_sel", 0),
+	GATE_VDEC1(CLK_VDEC1_LARB, "vdec1_larb", "vdec_sel", 0),
+};
+
+static const struct of_device_id of_match_clk_mt6755_vdec[] = {
+	{ .compatible = "mediatek,mt6755-vdecsys", },
+	{}
+};
+
+static int clk_mt6755_vdec_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	int r;
+	struct device_node *node = pdev->dev.of_node;
+
+	clk_data = mtk_alloc_clk_data(CLK_VDEC_NR);
+
+	mtk_clk_register_gates(node, vdec_clks, ARRAY_SIZE(vdec_clks),
+			       clk_data);
+
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		dev_err(&pdev->dev,
+			"could not register clock provider: %s: %d\n",
+			pdev->name, r);
+
+	return r;
+}
+
+static struct platform_driver clk_mt6755_vdec_drv = {
+	.probe = clk_mt6755_vdec_probe,
+	.driver = {
+		.name = "clk-mt6755-vdec",
+		.of_match_table = of_match_clk_mt6755_vdec,
+	},
+};
+
+builtin_platform_driver(clk_mt6755_vdec_drv);
diff --git a/drivers/clk/mediatek/clk-mt6755-venc.c b/drivers/clk/mediatek/clk-mt6755-venc.c
new file mode 100644
index 0000000..082ae37
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6755-venc.c
@@ -0,0 +1,78 @@
+/*
+ * Copyright (c) 2017 MediaTek Inc.
+ * Author: Wendell Lin <wendell.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt6755-clk.h>
+
+static const struct mtk_gate_regs venc_cg_regs = {
+	.set_ofs = 0x0004,
+	.clr_ofs = 0x0008,
+	.sta_ofs = 0x0000,
+};
+
+#define GATE_VENC(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &venc_cg_regs,			\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_setclr_inv,	\
+	}
+
+static const struct mtk_gate venc_clks[] = {
+	GATE_VENC(CLK_VENC_LARB, "venc_larb", "mm_sel", 0),
+	GATE_VENC(CLK_VENC_VENC, "venc_venc", "mm_sel", 4),
+	GATE_VENC(CLK_VENC_JPGENC, "venc_jpgenc", "mm_sel", 8),
+	GATE_VENC(CLK_VENC_JPGDEC, "venc_jpgdec", "mm_sel", 12),
+};
+
+static const struct of_device_id of_match_clk_mt6755_venc[] = {
+	{ .compatible = "mediatek,mt6755-vencsys", },
+	{}
+};
+
+static int clk_mt6755_venc_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	int r;
+	struct device_node *node = pdev->dev.of_node;
+
+	clk_data = mtk_alloc_clk_data(CLK_VENC_NR);
+
+	mtk_clk_register_gates(node, venc_clks, ARRAY_SIZE(venc_clks),
+			       clk_data);
+
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		dev_err(&pdev->dev,
+			"could not register clock provider: %s: %d\n",
+			pdev->name, r);
+
+	return r;
+}
+
+static struct platform_driver clk_mt6755_venc_drv = {
+	.probe = clk_mt6755_venc_probe,
+	.driver = {
+		.name = "clk-mt6755-venc",
+		.of_match_table = of_match_clk_mt6755_venc,
+	},
+};
+
+builtin_platform_driver(clk_mt6755_venc_drv);
diff --git a/drivers/clk/mediatek/clk-mt6755.c b/drivers/clk/mediatek/clk-mt6755.c
new file mode 100644
index 0000000..30d21c6
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6755.c
@@ -0,0 +1,666 @@
+/*
+ * Copyright (c) 2016 MediaTek Inc.
+ * Author: Wendell Lin <wendell.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt6755-clk.h>
+
+/*
+ * For some clocks, we don't care what their actual rates are. And these
+ * clocks may change their rate on different products or different scenarios.
+ * So we model these clocks' rate as 0, to denote it's not an actual rate.
+ */
+
+static DEFINE_SPINLOCK(mt6755_clk_lock);
+
+static const struct mtk_fixed_factor top_fixed_divs[] = {
+	FACTOR(CLK_TOP_AD_APLL1_CK, "apll1_ck", "apll1", 1, 1),
+	FACTOR(CLK_TOP_AD_APLL2_CK, "apll2_ck", "apll2", 1, 1),
+	FACTOR(CLK_TOP_DMPLL_CK, "dmpll_ck", "clk26m", 1, 1),
+	FACTOR(CLK_TOP_MMPLL_CK, "mmpll_ck", "mmpll", 1, 1),
+	FACTOR(CLK_TOP_OSC_D2, "osc_d2", "clk26m", 1, 1),
+	FACTOR(CLK_TOP_OSC_D4, "osc_d4", "clk26m", 1, 1),
+	FACTOR(CLK_TOP_OSC_D8, "osc_d8", "clk26m", 1, 1),
+	FACTOR(CLK_TOP_MSDCPLL_CK, "msdcpll_ck", "msdcpll", 1, 1),
+	FACTOR(CLK_TOP_MSDCPLL_D16, "msdcpll_d16", "msdcpll", 1, 16),
+	FACTOR(CLK_TOP_MSDCPLL_D2, "msdcpll_d2", "msdcpll", 1, 2),
+	FACTOR(CLK_TOP_MSDCPLL_D4, "msdcpll_d4", "msdcpll", 1, 4),
+	FACTOR(CLK_TOP_MSDCPLL_D8, "msdcpll_d8", "msdcpll", 1, 8),
+	FACTOR(CLK_TOP_SYSPLL_CK, "syspll_ck", "mainpll", 1, 1),
+	FACTOR(CLK_TOP_SYSPLL_D3, "syspll_d3", "mainpll", 1, 3),
+	FACTOR(CLK_TOP_SYSPLL_D3_D3, "syspll_d3_d3", "mainpll", 1, 9),
+	FACTOR(CLK_TOP_SYSPLL_D5, "syspll_d5", "mainpll", 1, 5),
+	FACTOR(CLK_TOP_SYSPLL_D7, "syspll_d7", "mainpll", 1, 7),
+	FACTOR(CLK_TOP_SYSPLL1_CK, "syspll1_ck", "mainpll", 1, 2),
+	FACTOR(CLK_TOP_SYSPLL1_D16, "syspll1_d16", "syspll1_ck", 1, 16),
+	FACTOR(CLK_TOP_SYSPLL1_D2, "syspll1_d2", "syspll1_ck", 1, 2),
+	FACTOR(CLK_TOP_SYSPLL1_D4, "syspll1_d4", "syspll1_ck", 1, 4),
+	FACTOR(CLK_TOP_SYSPLL1_D8, "syspll1_d8", "syspll1_ck", 1, 8),
+	FACTOR(CLK_TOP_SYSPLL2_CK, "syspll2_ck", "mainpll", 1, 3),
+	FACTOR(CLK_TOP_SYSPLL2_D2, "syspll2_d2", "syspll2_ck", 1, 2),
+	FACTOR(CLK_TOP_SYSPLL2_D4, "syspll2_d4", "syspll2_ck", 1, 4),
+	FACTOR(CLK_TOP_SYSPLL3_CK, "syspll3_ck", "mainpll", 1, 5),
+	FACTOR(CLK_TOP_SYSPLL3_D2, "syspll3_d2", "syspll3_ck", 1, 2),
+	FACTOR(CLK_TOP_SYSPLL3_D4, "syspll3_d4", "syspll3_ck", 1, 4),
+	FACTOR(CLK_TOP_SYSPLL4_CK, "syspll4_ck", "mainpll", 1, 7),
+	FACTOR(CLK_TOP_SYSPLL4_D2, "syspll4_d2", "syspll4_ck", 1, 2),
+	FACTOR(CLK_TOP_SYSPLL4_D4, "syspll4_d4", "syspll4_ck", 1, 4),
+	FACTOR(CLK_TOP_TVDPLL_CK, "tvdpll_ck", "tvdpll", 1, 1),
+	FACTOR(CLK_TOP_TVDPLL_D2, "tvdpll_d2", "tvdpll", 1, 2),
+	FACTOR(CLK_TOP_TVDPLL_D4, "tvdpll_d4", "tvdpll", 1, 4),
+	FACTOR(CLK_TOP_TVDPLL_D8, "tvdpll_d8", "tvdpll", 1, 8),
+	FACTOR(CLK_TOP_TVDPLL_D16, "tvdpll_d16", "tvdpll", 1, 16),
+	FACTOR(CLK_TOP_UNIVPLL_CK, "univpll_ck", "univpll", 1, 1),
+	FACTOR(CLK_TOP_UNIVPLL_D26, "univpll_d26", "univpll", 1, 26),
+	FACTOR(CLK_TOP_UNIVPLL_D7, "univpll_d7", "univpll", 1, 7),
+	FACTOR(CLK_TOP_UNIVPLL_D5, "univpll_d5", "univpll", 1, 5),
+	FACTOR(CLK_TOP_UNIVPLL_D3, "univpll_d3", "univpll", 1, 3),
+	FACTOR(CLK_TOP_UNIVPLL_D2, "univpll_d2", "univpll", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL1_CK, "univpll1_ck", "univpll", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL1_D2, "univpll1_d2", "univpll1_ck", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL1_D4, "univpll1_d4", "univpll1_ck", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL1_D8, "univpll1_d8", "univpll1_ck", 1, 8),
+	FACTOR(CLK_TOP_UNIVPLL2_CK, "univpll2_ck", "univpll", 1, 3),
+	FACTOR(CLK_TOP_UNIVPLL2_D2, "univpll2_d2", "univpll2_ck", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL2_D4, "univpll2_d4", "univpll2_ck", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL2_D8, "univpll2_d8", "univpll2_ck", 1, 8),
+	FACTOR(CLK_TOP_UNIVPLL3_CK, "univpll3_ck", "univpll", 1, 5),
+	FACTOR(CLK_TOP_UNIVPLL3_D2, "univpll3_d2", "univpll3_ck", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL3_D4, "univpll3_d4", "univpll3_ck", 1, 4),
+	FACTOR(CLK_TOP_VENCPLL_CK, "vencpll_ck", "vencpll", 1, 1),
+};
+
+static const char * const axi_parents[] = {
+	"clk26m",
+	"syspll1_d4",
+	"syspll2_d2",
+	"osc_d8"
+};
+
+static const char * const mem_parents[] = {
+	"clk26m",
+	"dmpll_ck"
+};
+
+static const char * const ddrphycfg_parents[] = {
+	"clk26m",
+	"syspll1_d8"
+};
+
+static const char * const mm_parents[] = {
+	"clk26m",
+	"syspll_d3",
+	"vencpll_ck",
+	"syspll1_d2",
+	"syspll2_d2",
+	"syspll_d7",
+	"syspll2_d4",
+	"syspll4_d2"
+};
+
+static const char * const pwm_parents[] = {
+	"clk26m",
+	"univpll2_d2",
+	"univpll2_d4"
+};
+
+static const char * const vdec_parents[] = {
+	"clk26m",
+	"univpll1_d2",
+	"vencpll_ck",
+	"univpll_d5",
+	"syspll1_d4"
+};
+
+static const char * const mfg_parents[] = {
+	"clk26m",
+	"mmpll_ck",
+	"univpll_d3",
+	"syspll_d3"
+};
+
+static const char * const camtg_parents[] = {
+	"clk26m",
+	"univpll_d26",
+	"univpll2_d2",
+};
+
+static const char * const uart_parents[] = {
+	"clk26m",
+	"univpll2_d8"
+};
+
+static const char * const spi_parents[] = {
+	"clk26m",
+	"syspll3_d2",
+	"syspll2_d4",
+	"msdcpll_d4"
+};
+
+static const char * const msdc50_0_hclk_parents[] = {
+	"clk26m",
+	"syspll1_d2",
+	"syspll2_d2",
+	"syspll4_d2"
+};
+
+static const char * const msdc50_0_parents[] = {
+	"clk26m",
+	"msdcpll_ck",
+	"msdcpll_d2",
+	"univpll1_d4",
+	"syspll2_d2",
+	"syspll_d7",
+	"msdcpll_d4",
+	"univpll_d2",
+	"univpll1_d2"
+};
+
+static const char * const msdc30_1_parents[] = {
+	"clk26m",
+	"univpll2_d2",
+	"msdcpll_d4",
+	"univpll1_d4",
+	"syspll2_d2",
+	"syspll_d7",
+	"univpll_d7",
+	"msdcpll_d2"
+};
+
+static const char * const msdc30_2_parents[] = {
+	"clk26m",
+	"univpll2_d2",
+	"msdcpll_d4",
+	"univpll1_d4",
+	"syspll2_d2",
+	"syspll_d7",
+	"univpll_d7",
+	"msdcpll_d2"
+};
+
+static const char * const msdc30_3_parents[] = {
+	"clk26m",
+	"msdcpll_d8",
+	"msdcpll_d4",
+	"univpll1_d4",
+	"univpll_d26",
+	"syspll_d7",
+	"univpll_d7",
+	"syspll3_d4",
+	"msdcpll_d16"
+};
+
+static const char * const audio_parents[] = {
+	"clk26m",
+	"syspll3_d4",
+	"syspll4_d4",
+	"syspll1_d16"
+};
+
+static const char * const aud_intbus_parents[] = {
+	"clk26m",
+	"syspll1_d4",
+	"syspll4_d2"
+};
+
+static const char * const pmicspi_parents[] = {
+	"clk26m",
+	"syspll1_d8",
+	"osc_d4"
+};
+
+static const char * const atb_parents[] = {
+	"clk26m",
+	"syspll1_d2",
+	"syspll_d5"
+};
+
+static const char * const dpi0_parents[] = {
+	"clk26m",
+	"tvdpll_d2",
+	"tvdpll_d4",
+	"tvdpll_d8",
+	"tvdpll_d16"
+};
+
+static const char * const scam_parents[] = {
+	"clk26m",
+	"syspll3_d2"
+};
+
+static const char * const aud_1_parents[] = {
+	"clk26m",
+	"apll1_ck"
+};
+
+static const char * const aud_2_parents[] = {
+	"clk26m",
+	"apll2_ck"
+};
+
+static const char * const disppwm_parents[] = {
+	"clk26m",
+	"univpll2_d4",
+	"osc_d2",
+	"osc_d8"
+};
+
+static const char * const ssusb_top_sys_parents[] = {
+	"clk26m",
+	"univpll3_d2"
+};
+
+static const char * const usb_top_parents[] = {
+	"clk26m",
+	"univpll3_d4"
+};
+
+static const char * const spm_parents[] = {
+	"clk26m",
+	"syspll1_d8"
+};
+
+static const char * const bsi_spi_parents[] = {
+	"clk26m",
+	"syspll_d3_d3",
+	"syspll1_d4",
+	"syspll_d7"
+};
+
+static const char * const i2c_parents[] = {
+	"clk26m",
+	"syspll1_d8",
+	"univpll3_d4"
+};
+
+static const char * const dvfsp_parents[] = {
+	"clk26m",
+	"syspll1_d8"
+};
+
+static const struct mtk_composite top_muxes[] = {
+	/* CLK_CFG_0 */
+	MUX_GATE_FLAGS(CLK_TOP_MUX_AXI, "axi_sel", axi_parents,
+		       0x0040, 0, 2, INVALID_MUX_GATE_BIT, CLK_IS_CRITICAL),
+	MUX_GATE_FLAGS(CLK_TOP_MUX_MEM, "mem_sel", mem_parents,
+		       0x0040, 8, 2, INVALID_MUX_GATE_BIT, CLK_IS_CRITICAL),
+	MUX_GATE_FLAGS(CLK_TOP_MUX_DDRPHY, "ddrphycfg_sel", ddrphycfg_parents,
+		       0x0040, 16, 1, INVALID_MUX_GATE_BIT, CLK_IS_CRITICAL),
+	MUX(CLK_TOP_MUX_MM, "mm_sel", mm_parents,
+	    0x0040, 24, 3),
+	/* CLK_CFG_1 */
+	MUX_GATE(CLK_TOP_MUX_PWM, "pwm_sel", pwm_parents,
+		 0x0050, 0, 2, 7),
+	MUX_GATE(CLK_TOP_MUX_VDEC, "vdec_sel", vdec_parents,
+		 0x0050, 8, 3, 15),
+	MUX_GATE(CLK_TOP_MUX_MFG, "mfg_sel", mfg_parents,
+		 0x0050, 24, 2, 31),
+	/* CLK_CFG_2 */
+	MUX_GATE(CLK_TOP_MUX_CAMTG, "camtg_sel", camtg_parents,
+		 0x0060, 0, 2, 7),
+	MUX_GATE(CLK_TOP_MUX_UART, "uart_sel", uart_parents,
+		 0x0060, 8, 1, 15),
+	MUX(CLK_TOP_MUX_SPI, "spi_sel", spi_parents,
+	    0x0060, 16, 2),
+	/* CLK_CFG_3 */
+	MUX(CLK_TOP_MUX_MSDC50_0_HCLK, "msdc50_0_hclk_sel",
+	    msdc50_0_hclk_parents, 0x0070, 8, 2),
+	MUX_GATE(CLK_TOP_MUX_MSDC50_0, "msdc50_0_sel", msdc50_0_parents,
+		 0x0070, 16, 4, 23),
+	MUX_GATE(CLK_TOP_MUX_MSDC30_1, "msdc30_1_sel", msdc30_1_parents,
+		 0x0070, 24, 4, 31),
+	/* CLK_CFG_4 */
+	MUX_GATE(CLK_TOP_MUX_MSDC30_2, "msdc30_2_sel", msdc30_2_parents,
+		 0x0080, 0, 4, 7),
+	MUX_GATE(CLK_TOP_MUX_MSDC30_3, "msdc30_3_sel", msdc30_3_parents,
+		 0x0080, 8, 4, 15),
+	MUX_GATE(CLK_TOP_MUX_AUDIO, "audio_sel", audio_parents,
+		 0x0080, 16, 2, 23),
+	MUX(CLK_TOP_MUX_AUDINTBUS, "aud_intbus_sel", aud_intbus_parents,
+	    0x0080, 24, 2),
+	/* CLK_CFG_5 */
+	MUX(CLK_TOP_MUX_PMICSPI, "pmicspi_sel", pmicspi_parents,
+	    0x0090, 0, 2),
+	MUX(CLK_TOP_MUX_ATB, "atb_sel", atb_parents,
+	    0x0090, 16, 2),
+	/* CLK_CFG_6 */
+	MUX_GATE(CLK_TOP_MUX_DPI0, "dpi0_sel", dpi0_parents,
+		 0x00a0, 0, 3, 7),
+	MUX(CLK_TOP_MUX_SCAM, "scam_sel", scam_parents,
+	    0x00a0, 8, 1),
+	MUX_GATE(CLK_TOP_MUX_AUD1, "aud_1_sel", aud_1_parents,
+		 0x00a0, 16, 1, 23),
+	MUX_GATE(CLK_TOP_MUX_AUD2, "aud_2_sel", aud_2_parents,
+		 0x00a0, 24, 1, 31),
+	/* CLK_CFG_7 */
+	MUX(CLK_TOP_MUX_DISPPWM, "disppwm_sel", disppwm_parents,
+	    0x00b0, 0, 2),
+	MUX(CLK_TOP_MUX_SSUSBTOPSYS, "ssusb_top_sys_sel", ssusb_top_sys_parents,
+	    0x00b0, 8, 1),
+	MUX(CLK_TOP_MUX_USBTOP, "usb_top_sel", usb_top_parents,
+	    0x00b0, 24, 1),
+	/* CLK_CFG_8 */
+	MUX(CLK_TOP_MUX_SPM, "spm_sel", spm_parents,
+	    0x00c0, 0, 1),
+	MUX(CLK_TOP_MUX_BSISPI, "bsi_spi_sel", bsi_spi_parents,
+	    0x00c0, 8, 2),
+	MUX(CLK_TOP_MUX_I2C, "i2c_sel", i2c_parents,
+	    0x00c0, 16, 2),
+	MUX(CLK_TOP_MUX_DVFSP, "dvfsp_sel", dvfsp_parents,
+	    0x00c0, 24, 1),
+};
+
+static int mtk_topckgen_init(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	void __iomem *base;
+	struct device_node *node = pdev->dev.of_node;
+	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	clk_data = mtk_alloc_clk_data(CLK_TOP_NR);
+
+	mtk_clk_register_factors(top_fixed_divs, ARRAY_SIZE(top_fixed_divs),
+				 clk_data);
+
+	mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes),
+				    base, &mt6755_clk_lock, clk_data);
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct mtk_gate_regs infra0_cg_regs = {
+	.set_ofs = 0x0080,
+	.clr_ofs = 0x0084,
+	.sta_ofs = 0x0090,
+};
+
+static const struct mtk_gate_regs infra1_cg_regs = {
+	.set_ofs = 0x0088,
+	.clr_ofs = 0x008c,
+	.sta_ofs = 0x0094,
+};
+
+static const struct mtk_gate_regs infra2_cg_regs = {
+	.set_ofs = 0x00a4,
+	.clr_ofs = 0x00a8,
+	.sta_ofs = 0x00ac,
+};
+
+#define GATE_ICG0(_id, _name, _parent, _shift) {		\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &infra0_cg_regs,			\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+	}
+
+#define GATE_ICG1(_id, _name, _parent, _shift) {		\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &infra1_cg_regs,			\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+	}
+
+#define GATE_ICG2(_id, _name, _parent, _shift) {		\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &infra2_cg_regs,			\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+	}
+
+static const struct mtk_gate infra_clks[] = {
+	/* MODULE_SW_CG_0 */
+	GATE_ICG0(CLK_INFRA_PMIC_TMR, "infra_pmictmr", "clk26m", 0),
+	GATE_ICG0(CLK_INFRA_PMIC_AP, "infra_pmicap", "clk26m", 1),
+	GATE_ICG0(CLK_INFRA_PMIC_MD, "infra_pmicmd", "clk26m", 2),
+	GATE_ICG0(CLK_INFRA_PMIC_CONN, "infra_pmicconn", "clk26m", 3),
+	GATE_ICG0(CLK_INFRA_SEJ, "infra_sej", "clk26m", 5),
+	GATE_ICG0(CLK_INFRA_APXGPT, "infra_apxgpt", "axi_sel", 6),
+	GATE_ICG0(CLK_INFRA_ICUSB, "infra_icusb", "axi_sel", 8),
+	GATE_ICG0(CLK_INFRA_GCE, "infra_gce", "axi_sel", 9),
+	GATE_ICG0(CLK_INFRA_THERM, "infra_therm", "axi_sel", 10),
+	GATE_ICG0(CLK_INFRA_I2C0, "infra_i2c0", "i2c_sel", 11),
+	GATE_ICG0(CLK_INFRA_I2C1, "infra_i2c1", "i2c_sel", 12),
+	GATE_ICG0(CLK_INFRA_I2C2, "infra_i2c2", "i2c_sel", 13),
+	GATE_ICG0(CLK_INFRA_I2C3, "infra_i2c3", "i2c_sel", 14),
+	GATE_ICG0(CLK_INFRA_PWM_HCLK, "infra_pwmhclk", "axi_sel", 15),
+	GATE_ICG0(CLK_INFRA_PWM1, "infra_pwm1", "i2c_sel", 16),
+	GATE_ICG0(CLK_INFRA_PWM2, "infra_pwm2", "i2c_sel", 17),
+	GATE_ICG0(CLK_INFRA_PWM3, "infra_pwm3", "i2c_sel", 18),
+	GATE_ICG0(CLK_INFRA_PWM4, "infra_pwm4", "i2c_sel", 19),
+	GATE_ICG0(CLK_INFRA_PWM, "infra_pwm", "i2c_sel", 21),
+	GATE_ICG0(CLK_INFRA_UART1, "infra_uart1", "uart_sel", 23),
+	GATE_ICG0(CLK_INFRA_UART2, "infra_uart2", "uart_sel", 24),
+	GATE_ICG0(CLK_INFRA_UART3, "infra_uart3", "uart_sel", 25),
+	GATE_ICG0(CLK_INFRA_MD2MD_CCIF0, "infra_md2mdccif0", "axi_sel", 27),
+	GATE_ICG0(CLK_INFRA_MD2MD_CCIF1, "infra_md2mdccif1", "axi_sel", 28),
+	GATE_ICG0(CLK_INFRA_MD2MD_CCIF2, "infra_md2mdccif2", "axi_sel", 29),
+	GATE_ICG0(CLK_INFRA_BTIF, "infra_btif", "axi_sel", 31),
+	/* MODULE_SW_CG_1 */
+	GATE_ICG1(CLK_INFRA_MD2MD_CCIF3, "infra_md2mdccif3", "axi_sel", 0),
+	GATE_ICG1(CLK_INFRA_SPI0, "infra_spi0", "spi_sel", 1),
+	GATE_ICG1(CLK_INFRA_MSDC0, "infra_msdc0", "msdc50_0_sel", 2),
+	GATE_ICG1(CLK_INFRA_MD2MD_CCIF4, "infra_md2mdccif4", "axi_sel", 3),
+	GATE_ICG1(CLK_INFRA_MSDC1, "infra_msdc1", "msdc30_1_sel", 4),
+	GATE_ICG1(CLK_INFRA_MSDC2, "infra_msdc2", "msdc30_2_sel", 5),
+	GATE_ICG1(CLK_INFRA_MSDC3, "infra_msdc3", "msdc30_3_sel", 6),
+	GATE_ICG1(CLK_INFRA_MD2MD_CCIF5, "infra_md2mdccif5", "axi_sel", 7),
+	GATE_ICG1(CLK_INFRA_GCPU, "infra_gcpu", "axi_sel", 8),
+	GATE_ICG1(CLK_INFRA_TRNG, "infra_trng", "axi_sel", 9),
+	GATE_ICG1(CLK_INFRA_AUXADC, "infra_auxadc", "clk26m", 10),
+	GATE_ICG1(CLK_INFRA_CPUM, "infra_cpum", "axi_sel", 11),
+	GATE_ICG1(CLK_INFRA_CCIF1_AP, "infra_ccif1ap", "axi_sel", 12),
+	GATE_ICG1(CLK_INFRA_CCIF1_MD, "infra_ccif1md", "axi_sel", 13),
+	GATE_ICG1(CLK_INFRA_AP_DMA, "infra_apdma", "axi_sel", 18),
+	GATE_ICG1(CLK_INFRA_XIU, "infra_xiu", "axi_sel", 19),
+	GATE_ICG1(CLK_INFRA_DEVICE_APC, "infra_deviceapc", "axi_sel", 20),
+	GATE_ICG1(CLK_INFRA_XIU2AHB, "infra_xiu2ahb", "axi_sel", 21),
+	GATE_ICG1(CLK_INFRA_CCIF_AP, "infra_ccifap", "axi_sel", 23),
+	GATE_ICG1(CLK_INFRA_DEBUGSYS, "infra_debugsys", "axi_sel", 24),
+	GATE_ICG1(CLK_INFRA_AUDIO, "infra_audio", "axi_sel", 25),
+	GATE_ICG1(CLK_INFRA_CCIF_MD, "infra_ccifmd", "axi_sel", 26),
+	/* MODULE_SW_CG_2 */
+	GATE_ICG2(CLK_INFRA_IRTX, "infra_irtx", "clk26m", 0),
+	GATE_ICG2(CLK_INFRA_SSUSB_TOP, "infra_ssusbtop",
+		  "ssusb_top_sys_sel", 1),
+	GATE_ICG2(CLK_INFRA_DISP_PWM, "infra_disppwm", "axi_sel", 2),
+	GATE_ICG2(CLK_INFRA_CLDMA_BCLK, "infra_cldmabclk", "clk26m", 3),
+	GATE_ICG2(CLK_INFRA_AUDIO_26M_BCLK, "infra_audio26mbclk", "clk26m", 4),
+	GATE_ICG2(CLK_INFRA_MD_TEMP_26M_BCLK,
+		  "infra_mdtmp26mbclk", "clk26m", 5),
+	GATE_ICG2(CLK_INFRA_SPI1, "infra_spi1", "spi_sel", 6),
+	GATE_ICG2(CLK_INFRA_I2C4, "infra_i2c4", "i2c_sel", 7),
+	GATE_ICG2(CLK_INFRA_MD_TEMP_SHARE, "infra_mdtmpshare", "clk26m", 8),
+};
+
+static const struct mtk_fixed_factor infra_fixed_divs[] = {
+	FACTOR(CLK_INFRA_CLK_13M, "clk13m", "clk26m", 1, 2),
+};
+
+static struct clk_onecell_data *infra_clk_data;
+
+static void mtk_infrasys_init_early(struct device_node *node)
+{
+	int r, i;
+
+	if (!infra_clk_data) {
+		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
+
+		for (i = 0; i < CLK_INFRA_NR; i++)
+			infra_clk_data->clks[i] = ERR_PTR(-EPROBE_DEFER);
+	}
+
+	mtk_clk_register_factors(infra_fixed_divs, ARRAY_SIZE(infra_fixed_divs),
+				 infra_clk_data);
+
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, infra_clk_data);
+	if (r)
+		pr_err("%s(): could not register clock provider: %d\n",
+		       __func__, r);
+}
+
+CLK_OF_DECLARE_DRIVER(mtk_infra, "mediatek,mt6755-infracfg",
+		      mtk_infrasys_init_early);
+
+static int mtk_infrasys_init(struct platform_device *pdev)
+{
+	int r, i;
+	struct device_node *node = pdev->dev.of_node;
+
+	if (!infra_clk_data) {
+		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
+	} else {
+		for (i = 0; i < CLK_INFRA_NR; i++) {
+			if (infra_clk_data->clks[i] == ERR_PTR(-EPROBE_DEFER))
+				infra_clk_data->clks[i] = ERR_PTR(-ENOENT);
+		}
+	}
+
+	mtk_clk_register_gates(node, infra_clks, ARRAY_SIZE(infra_clks),
+			       infra_clk_data);
+	mtk_clk_register_factors(infra_fixed_divs, ARRAY_SIZE(infra_fixed_divs),
+				 infra_clk_data);
+
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, infra_clk_data);
+	if (r)
+		return r;
+
+	return 0;
+}
+
+#define MT6755_PLL_FMAX		(3000UL * MHZ)
+#define CON0_MT6755_RST_BAR	BIT(24)
+
+#define PLL_B(_id, _name, _reg, _pwr_reg, _en_mask, _flags, _pcwbits,	\
+			_pd_reg, _pd_shift, _tuner_reg, _pcw_reg,	\
+			_pcw_shift, _div_table) {			\
+	.id = _id,						\
+	.name = _name,						\
+	.reg = _reg,						\
+	.pwr_reg = _pwr_reg,					\
+	.en_mask = _en_mask,					\
+	.flags = _flags,					\
+	.rst_bar_mask = CON0_MT6755_RST_BAR,			\
+	.fmax = MT6755_PLL_FMAX,				\
+	.pcwbits = _pcwbits,					\
+	.pd_reg = _pd_reg,					\
+	.pd_shift = _pd_shift,					\
+	.tuner_reg = _tuner_reg,				\
+	.pcw_reg = _pcw_reg,					\
+	.pcw_shift = _pcw_shift,				\
+	.div_table = _div_table,				\
+}
+
+#define PLL(_id, _name, _reg, _pwr_reg, _en_mask, _flags, _pcwbits,	\
+			_pd_reg, _pd_shift, _tuner_reg, _pcw_reg,	\
+			_pcw_shift)					\
+		PLL_B(_id, _name, _reg, _pwr_reg, _en_mask, _flags, _pcwbits, \
+			_pd_reg, _pd_shift, _tuner_reg, _pcw_reg, _pcw_shift, \
+			NULL)
+
+static const struct mtk_pll_data plls[] = {
+	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0220, 0x022C, 0xF0000101,
+	    HAVE_RST_BAR, 21, 0x220, 4, 0x0, 0x224, 0),
+	PLL(CLK_APMIXED_UNIVPLL, "univpll", 0x0230, 0x023C, 0xFC000001,
+	    HAVE_RST_BAR, 7, 0x230, 4, 0x0, 0x234, 14),
+	PLL(CLK_APMIXED_MMPLL, "mmpll", 0x0240, 0x024C, 0x00000001, 0,
+	    21, 0x244, 24, 0x0, 0x244, 0),
+	PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x0250, 0x025C, 0x00000001, 0,
+	    21, 0x250, 4, 0x0, 0x254, 0),
+	PLL(CLK_APMIXED_VENCPLL, "vencpll", 0x0260, 0x026C, 0x00000001, 0,
+	    21, 0x260, 4, 0x0, 0x264, 0),
+	PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x0270, 0x027C, 0x00000001, 0,
+	    21, 0x270, 4, 0x0, 0x274, 0),
+	PLL(CLK_APMIXED_APLL1, "apll1", 0x02A0, 0x02B0, 0x00000001, 0,
+	    31, 0x2a0, 4, 0x2a4, 0x2a4, 0),
+	PLL(CLK_APMIXED_APLL2, "apll2", 0x02B4, 0x02C4, 0x00000001, 0,
+	    31, 0x2b4, 4, 0x2b8, 0x2b8, 0),
+};
+
+static int mtk_apmixedsys_init(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+
+	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR);
+	if (!clk_data)
+		return -ENOMEM;
+
+	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt6755[] = {
+	{
+		.compatible = "mediatek,mt6755-topckgen",
+		.data = mtk_topckgen_init,
+	}, {
+		.compatible = "mediatek,mt6755-infracfg",
+		.data = mtk_infrasys_init,
+	}, {
+		.compatible = "mediatek,mt6755-apmixedsys",
+		.data = mtk_apmixedsys_init,
+	}, {
+		/* sentinel */
+	}
+};
+
+static int clk_mt6755_probe(struct platform_device *pdev)
+{
+	int (*clk_init)(struct platform_device *);
+	int r;
+
+	clk_init = of_device_get_match_data(&pdev->dev);
+	if (!clk_init)
+		return -EINVAL;
+
+	r = clk_init(pdev);
+	if (r)
+		dev_err(&pdev->dev,
+			"could not register clock provider: %s: %d\n",
+			pdev->name, r);
+
+	return r;
+}
+
+static struct platform_driver clk_mt6755_drv = {
+	.probe = clk_mt6755_probe,
+	.driver = {
+		.name = "clk-mt6755",
+		.of_match_table = of_match_clk_mt6755,
+	},
+};
+
+static int __init clk_mt6755_init(void)
+{
+	return platform_driver_register(&clk_mt6755_drv);
+}
+
+arch_initcall(clk_mt6755_init);
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
