From: Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH 4/4] clk: mediatek: Add MT6797 clock support
Date: Thu, 8 Sep 2016 18:49:53 +0800
Message-ID: <1473331794-27542-5-git-send-email-mars.cheng@mediatek.com>
References: <1473331794-27542-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473331794-27542-1-git-send-email-mars.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Erin Lo <erin.lo@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>
Cc: linux-clk@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>, Loda Choui <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Scott Shu <scott.shu@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, Mars Cheng <mars.cheng@mediatek.com>
List-Id: devicetree@vger.kernel.org

Add MT6797 clock support, include topckgen, apmixedsys,
infracfg and subsystem clocks.

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt6797.dtsi |   66 ++-
 drivers/clk/mediatek/Kconfig             |   36 ++
 drivers/clk/mediatek/Makefile            |    5 +
 drivers/clk/mediatek/clk-mt6797-img.c    |   87 ++++
 drivers/clk/mediatek/clk-mt6797-mm.c     |  146 ++++++
 drivers/clk/mediatek/clk-mt6797-vdec.c   |  102 +++++
 drivers/clk/mediatek/clk-mt6797-venc.c   |   86 ++++
 drivers/clk/mediatek/clk-mt6797.c        |  716 ++++++++++++++++++++++++++++++
 include/dt-bindings/clock/mt6797-clk.h   |  281 ++++++++++++
 9 files changed, 1514 insertions(+), 11 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-mt6797-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt6797-mm.c
 create mode 100644 drivers/clk/mediatek/clk-mt6797-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt6797-venc.c
 create mode 100644 drivers/clk/mediatek/clk-mt6797.c
 create mode 100644 include/dt-bindings/clock/mt6797-clk.h

diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index 66f6442..75d3877 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -10,6 +10,7 @@
  * GNU General Public License for more details.
  */
 
+#include <dt-bindings/clock/mt6797-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
@@ -113,12 +114,6 @@
 		clock-output-names = "clk32k";
 	};
 
-	uart_clk: dummy26m {
-		compatible = "fixed-clock";
-		clock-frequency = <26000000>;
-		#clock-cells = <0>;
-	};
-
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&gic>;
@@ -132,6 +127,24 @@
 			     (GIC_CPU_MASK_SIMPLE(10) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	topckgen: topckgen@10000000 {
+		compatible = "mediatek,mt6797-topckgen";
+		reg = <0 0x10000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	infrasys: infracfg_ao@10001000 {
+		compatible = "mediatek,mt6797-infracfg", "syscon";
+		reg = <0 0x10001000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	apmixedsys: apmixed@1000c000 {
+		compatible = "mediatek,mt6797-apmixedsys";
+		reg = <0 0x1000c000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
 	sysirq: intpol-controller@10200620 {
 		compatible = "mediatek,mt6797-sysirq",
 			     "mediatek,mt6577-sysirq";
@@ -148,7 +161,9 @@
 			     "mediatek,mt6577-uart";
 		reg = <0 0x11002000 0 0x400>;
 		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&uart_clk>;
+		clocks = <&infrasys CLK_INFRA_UART0>,
+			 <&infrasys CLK_INFRA_AP_DMA>;
+		clock-names = "baud", "bus";
 		status = "disabled";
 	};
 
@@ -157,7 +172,9 @@
 			     "mediatek,mt6577-uart";
 		reg = <0 0x11003000 0 0x400>;
 		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&uart_clk>;
+		clocks = <&infrasys CLK_INFRA_UART1>,
+			 <&infrasys CLK_INFRA_AP_DMA>;
+		clock-names = "baud", "bus";
 		status = "disabled";
 	};
 
@@ -166,7 +183,9 @@
 			     "mediatek,mt6577-uart";
 		reg = <0 0x11004000 0 0x400>;
 		interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&uart_clk>;
+		clocks = <&infrasys CLK_INFRA_UART2>,
+			 <&infrasys CLK_INFRA_AP_DMA>;
+		clock-names = "baud", "bus";
 		status = "disabled";
 	};
 
@@ -175,10 +194,36 @@
 			     "mediatek,mt6577-uart";
 		reg = <0 0x11005000 0 0x400>;
 		interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&uart_clk>;
+		clocks = <&infrasys CLK_INFRA_UART3>,
+			 <&infrasys CLK_INFRA_AP_DMA>;
+		clock-names = "baud", "bus";
 		status = "disabled";
 	};
 
+	mmsys: mmsys_config@14000000 {
+		compatible = "mediatek,mt6797-mmsys", "syscon";
+		reg = <0 0x14000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	imgsys: imgsys_config@15000000  {
+		compatible = "mediatek,mt6797-imgsys", "syscon";
+		reg = <0 0x15000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	vdecsys: vdec_gcon@16000000 {
+		compatible = "mediatek,mt6797-vdecsys", "syscon";
+		reg = <0 0x16000000 0 0x10000>;
+		#clock-cells = <1>;
+	};
+
+	vencsys: venc_gcon@17000000 {
+		compatible = "mediatek,mt6797-vencsys", "syscon";
+		reg = <0 0x17000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
 	gic: interrupt-controller@19000000 {
 		compatible = "arm,gic-v3";
 		#interrupt-cells = <3>;
@@ -189,5 +234,4 @@
 		      <0 0x19200000 0 0x200000>,   /* GICR */
 		      <0 0x10240000 0 0x2000>;     /* GICC */
 	};
-
 };
diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 5aa6204..ce91ecb 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -56,6 +56,42 @@ config COMMON_CLK_MT2701_BDPSYS
 	---help---
 	  This driver supports Mediatek MT2701 bdpsys clocks.
 
+config COMMON_CLK_MT6797
+	bool "Clock driver for Mediatek MT6797"
+	depends on COMMON_CLK
+	select COMMON_CLK_MEDIATEK
+	default ARCH_MEDIATEK
+	---help---
+	  This driver supports Mediatek MT6797 basic clocks.
+
+config COMMON_CLK_MT6797_MMSYS
+	bool "Clock driver for Mediatek MT6797 mmsys"
+	depends on COMMON_CLK
+	select COMMON_CLK_MT6797
+	---help---
+	  This driver supports Mediatek MT6797 mmsys clocks.
+
+config COMMON_CLK_MT6797_IMGSYS
+	bool "Clock driver for Mediatek MT6797 imgsys"
+	depends on COMMON_CLK
+	select COMMON_CLK_MT6797
+	---help---
+	  This driver supports Mediatek MT6797 imgsys clocks.
+
+config COMMON_CLK_MT6797_VDECSYS
+	bool "Clock driver for Mediatek MT6797 vdecsys"
+	depends on COMMON_CLK
+	select COMMON_CLK_MT6797
+	---help---
+	  This driver supports Mediatek MT6797 vdecsys clocks.
+
+config COMMON_CLK_MT6797_VENCSYS
+	bool "Clock driver for Mediatek MT6797 vencsys"
+	depends on COMMON_CLK
+	select COMMON_CLK_MT6797
+	---help---
+	  This driver supports Mediatek MT6797 vencsys clocks.
+
 config COMMON_CLK_MT8135
 	bool "Clock driver for Mediatek MT8135"
 	depends on COMMON_CLK
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 19ae7ef..a5bae28d 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -7,5 +7,10 @@ obj-$(CONFIG_COMMON_CLK_MT2701_HIFSYS) += clk-mt2701-hif.o
 obj-$(CONFIG_COMMON_CLK_MT2701_IMGSYS) += clk-mt2701-img.o
 obj-$(CONFIG_COMMON_CLK_MT2701_MMSYS) += clk-mt2701-mm.o
 obj-$(CONFIG_COMMON_CLK_MT2701_VDECSYS) += clk-mt2701-vdec.o
+obj-$(CONFIG_COMMON_CLK_MT6797) += clk-mt6797.o
+obj-$(CONFIG_COMMON_CLK_MT6797_IMGSYS) += clk-mt6797-img.o
+obj-$(CONFIG_COMMON_CLK_MT6797_MMSYS) += clk-mt6797-mm.o
+obj-$(CONFIG_COMMON_CLK_MT6797_VDECSYS) += clk-mt6797-vdec.o
+obj-$(CONFIG_COMMON_CLK_MT6797_VENCSYS) += clk-mt6797-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8135) += clk-mt8135.o
 obj-$(CONFIG_COMMON_CLK_MT8173) += clk-mt8173.o
diff --git a/drivers/clk/mediatek/clk-mt6797-img.c b/drivers/clk/mediatek/clk-mt6797-img.c
new file mode 100644
index 0000000..4ecd201
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6797-img.c
@@ -0,0 +1,87 @@
+/* Copyright (c) 2016 MediaTek Inc.
+ * Author: Kevin Chen <kevin-cw.chen@mediatek.com>
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
+#include <linux/clk.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/mt6797-clk.h>
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
+	GATE_IMG(CLK_IMG_FDVT, "img_fdvt", "mm_sel", 11),
+	GATE_IMG(CLK_IMG_DPE, "img_dpe", "mm_sel", 10),
+	GATE_IMG(CLK_IMG_DIP, "img_dip", "mm_sel", 6),
+	GATE_IMG(CLK_IMG_LARB6, "img_larb6", "mm_sel", 0),
+};
+
+static int mtk_imgsys_init(struct device *dev)
+{
+	struct clk_onecell_data *clk_data;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_IMG_NR);
+	if (!clk_data) {
+		pr_err("%s: alloc failed\n", __func__);
+		goto alloc_err;
+	}
+
+	mtk_clk_register_gates(dev->of_node, img_clks, ARRAY_SIZE(img_clks),
+			       clk_data);
+
+	r = of_clk_add_provider(dev->of_node, of_clk_src_onecell_get,
+				clk_data);
+	if (r)
+		pr_err("%s: could not register clock provider: %d\n",
+		       __func__, r);
+
+	return r;
+
+alloc_err:
+	return -ENOMEM;
+}
+
+static const struct of_device_id of_match_clk_mt6797_img[] = {
+	{ .compatible = "mediatek,mt6797-imgsys", },
+	{}
+};
+
+static int clk_mt6797_img_probe(struct platform_device *pdev)
+{
+	return mtk_imgsys_init(&pdev->dev);
+}
+
+static struct platform_driver clk_mt6797_img_drv = {
+	.probe = clk_mt6797_img_probe,
+	.driver = {
+		.name = "clk-mt6797-img",
+		.of_match_table = of_match_clk_mt6797_img,
+	},
+};
+
+builtin_platform_driver(clk_mt6797_img_drv);
diff --git a/drivers/clk/mediatek/clk-mt6797-mm.c b/drivers/clk/mediatek/clk-mt6797-mm.c
new file mode 100644
index 0000000..77f0342
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6797-mm.c
@@ -0,0 +1,146 @@
+/*
+ * Copyright (c) 2016 MediaTek Inc.
+ * Author: Kevin Chen <kevin-cw.chen@mediatek.com>
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
+#include <linux/clk.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/mt6797-clk.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+static const struct mtk_gate_regs mm0_cg_regs = {
+	.set_ofs = 0x0104,
+	.clr_ofs = 0x0108,
+	.sta_ofs = 0x0100,
+};
+
+static const struct mtk_gate_regs mm1_cg_regs = {
+	.set_ofs = 0x0114,
+	.clr_ofs = 0x0118,
+	.sta_ofs = 0x0110,
+};
+
+#define GATE_MM0(_id, _name, _parent, _shift) {			\
+	.id = _id,					\
+	.name = _name,					\
+	.parent_name = _parent,				\
+	.regs = &mm0_cg_regs,				\
+	.shift = _shift,				\
+	.ops = &mtk_clk_gate_ops_setclr,		\
+}
+
+#define GATE_MM1(_id, _name, _parent, _shift) {			\
+	.id = _id,					\
+	.name = _name,					\
+	.parent_name = _parent,				\
+	.regs = &mm1_cg_regs,				\
+	.shift = _shift,				\
+	.ops = &mtk_clk_gate_ops_setclr,		\
+}
+
+static const struct mtk_gate mm_clks[] = {
+	GATE_MM0(CLK_MM_SMI_COMMON, "mm_smi_common", "mm_sel", 0),
+	GATE_MM0(CLK_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 1),
+	GATE_MM0(CLK_MM_SMI_LARB5, "mm_smi_larb5", "mm_sel", 2),
+	GATE_MM0(CLK_MM_CAM_MDP, "mm_cam_mdp", "mm_sel", 3),
+	GATE_MM0(CLK_MM_MDP_RDMA0, "mm_mdp_rdma0", "mm_sel", 4),
+	GATE_MM0(CLK_MM_MDP_RDMA1, "mm_mdp_rdma1", "mm_sel", 5),
+	GATE_MM0(CLK_MM_MDP_RSZ0, "mm_mdp_rsz0", "mm_sel", 6),
+	GATE_MM0(CLK_MM_MDP_RSZ1, "mm_mdp_rsz1", "mm_sel", 7),
+	GATE_MM0(CLK_MM_MDP_RSZ2, "mm_mdp_rsz2", "mm_sel", 8),
+	GATE_MM0(CLK_MM_MDP_TDSHP, "mm_mdp_tdshp", "mm_sel", 9),
+	GATE_MM0(CLK_MM_MDP_COLOR, "mm_mdp_color", "mm_sel", 10),
+	GATE_MM0(CLK_MM_MDP_WDMA, "mm_mdp_wdma", "mm_sel", 11),
+	GATE_MM0(CLK_MM_MDP_WROT0, "mm_mdp_wrot0", "mm_sel", 12),
+	GATE_MM0(CLK_MM_MDP_WROT1, "mm_mdp_wrot1", "mm_sel", 13),
+	GATE_MM0(CLK_MM_FAKE_ENG, "mm_fake_eng", "mm_sel", 14),
+	GATE_MM0(CLK_MM_DISP_OVL0, "mm_disp_ovl0", "mm_sel", 15),
+	GATE_MM0(CLK_MM_DISP_OVL1, "mm_disp_ovl1", "mm_sel", 16),
+	GATE_MM0(CLK_MM_DISP_OVL0_2L, "mm_disp_ovl0_2l", "mm_sel", 17),
+	GATE_MM0(CLK_MM_DISP_OVL1_2L, "mm_disp_ovl1_2l", "mm_sel", 18),
+	GATE_MM0(CLK_MM_DISP_RDMA0, "mm_disp_rdma0", "mm_sel", 19),
+	GATE_MM0(CLK_MM_DISP_RDMA1, "mm_disp_rdma1", "mm_sel", 20),
+	GATE_MM0(CLK_MM_DISP_WDMA0, "mm_disp_wdma0", "mm_sel", 21),
+	GATE_MM0(CLK_MM_DISP_WDMA1, "mm_disp_wdma1", "mm_sel", 22),
+	GATE_MM0(CLK_MM_DISP_COLOR, "mm_disp_color", "mm_sel", 23),
+	GATE_MM0(CLK_MM_DISP_CCORR, "mm_disp_ccorr", "mm_sel", 24),
+	GATE_MM0(CLK_MM_DISP_AAL, "mm_disp_aal", "mm_sel", 25),
+	GATE_MM0(CLK_MM_DISP_GAMMA, "mm_disp_gamma", "mm_sel", 26),
+	GATE_MM0(CLK_MM_DISP_OD, "mm_disp_od", "mm_sel", 27),
+	GATE_MM0(CLK_MM_DISP_DITHER, "mm_disp_dither", "mm_sel", 28),
+	GATE_MM0(CLK_MM_DISP_UFOE, "mm_disp_ufoe", "mm_sel", 29),
+	GATE_MM0(CLK_MM_DISP_DSC, "mm_disp_dsc", "mm_sel", 30),
+	GATE_MM0(CLK_MM_DISP_SPLIT, "mm_disp_split", "mm_sel", 31),
+	GATE_MM1(CLK_MM_DSI0_MM_CLOCK, "mm_dsi0_mm_clock", "mm_sel", 0),
+	GATE_MM1(CLK_MM_DSI1_MM_CLOCK, "mm_dsi1_mm_clock", "mm_sel", 2),
+	GATE_MM1(CLK_MM_DPI_MM_CLOCK, "mm_dpi_mm_clock", "mm_sel", 4),
+	GATE_MM1(CLK_MM_DPI_INTERFACE_CLOCK, "mm_dpi_interface_clock",
+		 "dpi0_sel", 5),
+	GATE_MM1(CLK_MM_LARB4_AXI_ASIF_MM_CLOCK, "mm_larb4_axi_asif_mm_clock",
+		 "mm_sel", 6),
+	GATE_MM1(CLK_MM_LARB4_AXI_ASIF_MJC_CLOCK, "mm_larb4_axi_asif_mjc_clock",
+		 "mjc_sel", 7),
+	GATE_MM1(CLK_MM_DISP_OVL0_MOUT_CLOCK, "mm_disp_ovl0_mout_clock",
+		 "mm_sel", 8),
+	GATE_MM1(CLK_MM_FAKE_ENG2, "mm_fake_eng2", "mm_sel", 9),
+	GATE_MM1(CLK_MM_DSI0_INTERFACE_CLOCK, "mm_dsi0_interface_clock",
+		 "clk26m", 1),
+	GATE_MM1(CLK_MM_DSI1_INTERFACE_CLOCK, "mm_dsi1_interface_clock",
+		 "clk26m", 3),
+};
+
+static void mtk_mmsys_init(struct device *dev)
+{
+	struct clk_onecell_data *clk_data;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_MM_NR);
+	if (!clk_data) {
+		pr_err("%s: alloc failed\n", __func__);
+		goto alloc_err;
+	}
+
+	mtk_clk_register_gates(dev->of_node, mm_clks, ARRAY_SIZE(mm_clks),
+			       clk_data);
+
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		pr_err("%s: could not register clock provider: %d\n",
+		       __func__, r);
+
+	return r;
+
+alloc_err:
+	return -ENOMEM;
+}
+
+static const struct of_device_id of_match_clk_mt6797_mm[] = {
+	{ .compatible = "mediatek,mt6797-mmsys", },
+	{}
+};
+
+static int clk_mt6797_mm_probe(struct platform_device *pdev)
+{
+	return mtk_mmsys_init(&pdev->dev);
+}
+
+static struct platform_driver clk_mt6797_mm_drv = {
+	.probe = clk_mt6797_mm_probe,
+	.driver = {
+		.name = "clk-mt6797-mm",
+		.of_match_table = of_match_clk_mt6797_mm,
+	},
+};
+
+builtin_platform_driver(clk_mt6797_mm_drv);
diff --git a/drivers/clk/mediatek/clk-mt6797-vdec.c b/drivers/clk/mediatek/clk-mt6797-vdec.c
new file mode 100644
index 0000000..48cba6b
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6797-vdec.c
@@ -0,0 +1,102 @@
+/*
+ * Copyright (c) 2016 MediaTek Inc.
+ * Author: Kevin-CW Chen <kevin-cw.chen@mediatek.com>
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
+#include <linux/clk.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt6797-clk.h>
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
+#define GATE_VDEC0(_id, _name, _parent, _shift) {		\
+	.id = _id,					\
+	.name = _name,					\
+	.parent_name = _parent,				\
+	.regs = &vdec0_cg_regs,				\
+	.shift = _shift,				\
+	.ops = &mtk_clk_gate_ops_setclr_inv,		\
+}
+
+#define GATE_VDEC1(_id, _name, _parent, _shift) {		\
+	.id = _id,					\
+	.name = _name,					\
+	.parent_name = _parent,				\
+	.regs = &vdec1_cg_regs,				\
+	.shift = _shift,				\
+	.ops = &mtk_clk_gate_ops_setclr_inv,		\
+}
+
+static const struct mtk_gate vdec_clks[] = {
+	GATE_VDEC0(CLK_VDEC_CKEN_ENG, "vdec_cken_eng", "vdec_sel", 8),
+	GATE_VDEC0(CLK_VDEC_ACTIVE, "vdec_active", "vdec_sel", 4),
+	GATE_VDEC0(CLK_VDEC_CKEN, "vdec_cken", "vdec_sel", 0),
+	GATE_VDEC1(CLK_VDEC_LARB1_CKEN, "vdec_larb1_cken", "mm_sel", 0),
+};
+
+static void mtk_vdecsys_init(struct device *dev)
+{
+	struct clk_onecell_data *clk_data;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_VDEC_NR);
+	if (!clk_data) {
+		pr_err("%s: alloc failed\n", __func__);
+		goto alloc_err;
+	}
+
+	mtk_clk_register_gates(dev->of_node, vdec_clks, ARRAY_SIZE(vdec_clks),
+			       clk_data);
+
+	r = of_clk_add_provider(dev->of_node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		pr_err("%s: could not register clock provider: %d\n",
+		       __func__, r);
+	return r;
+
+alloc_err:
+	return -ENOMEM;
+}
+
+static const struct of_device_id of_match_clk_mt6797_vdec[] = {
+	{ .compatible = "mediatek,mt6797-vdecsys", },
+	{}
+};
+
+static int clk_mt6797_vdec_probe(struct platform_device *pdev)
+{
+	return mtk_vdecsys_init(&pdev->dev);
+}
+
+static struct platform_driver clk_mt6797_vdec_drv = {
+	.probe = clk_mt6797_vdec_probe,
+	.driver = {
+		.name = "clk-mt6797-vdec",
+		.of_match_table = of_match_clk_mt6797_vdec,
+	},
+};
+
+builtin_platform_driver(clk_mt6797_vdec_drv);
diff --git a/drivers/clk/mediatek/clk-mt6797-venc.c b/drivers/clk/mediatek/clk-mt6797-venc.c
new file mode 100644
index 0000000..787e010
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6797-venc.c
@@ -0,0 +1,86 @@
+/*
+ * Copyright (c) 2016 MediaTek Inc.
+ * Author: Kevin Chen <kevin-cw.chen@mediatek.com>
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
+#include <linux/clk.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt6797-clk.h>
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
+	GATE_VENC(CLK_VENC_0, "venc_0", "mm_sel", 0),
+	GATE_VENC(CLK_VENC_1, "venc_1", "venc_sel", 4),
+	GATE_VENC(CLK_VENC_2, "venc_2", "venc_sel", 8),
+	GATE_VENC(CLK_VENC_3, "venc_3", "venc_sel", 12),
+};
+
+static void mtk_vencsys_init(struct device_node *node)
+{
+	struct clk_onecell_data *clk_data;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_VENC_NR);
+	if (!clk_data) {
+		pr_err("%s: alloc failed\n", __func__);
+		goto alloc_err;
+	}
+
+	mtk_clk_register_gates(node, venc_clks, ARRAY_SIZE(venc_clks),
+			       clk_data);
+
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		pr_err("%s: could not register clock provider: %d\n",
+		       __func__, r);
+	return r;
+alloc_err:
+	return -ENOMEM;
+}
+
+static const struct of_device_id of_match_clk_mt6797_venc[] = {
+	{ .compatible = "mediatek,mt6797-vencsys", },
+	{}
+};
+
+static int clk_mt6797_venc_probe(struct platform_device *pdev)
+{
+	return mtk_vencsys_init(pdev->dev.of_node);
+}
+
+static struct platform_driver clk_mt6797_venc_drv = {
+	.probe = clk_mt6797_venc_probe,
+	.driver = {
+		.name = "clk-mt6797-venc",
+		.of_match_table = of_match_clk_mt6797_venc,
+	},
+};
+
+builtin_platform_driver(clk_mt6797_venc_drv);
diff --git a/drivers/clk/mediatek/clk-mt6797.c b/drivers/clk/mediatek/clk-mt6797.c
new file mode 100644
index 0000000..a851d0f
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6797.c
@@ -0,0 +1,716 @@
+/*
+ * Copyright (c) 2016 MediaTek Inc.
+ * Author: Kevin Chen <kevin-cw.chen@mediatek.com>
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
+#include <linux/clk.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt6797-clk.h>
+
+/*
+ * For some clocks, we don't care what their actual rates are. And these
+ * clocks may change their rate on different products or different scenarios.
+ * So we model these clocks' rate as 0, to denote it's not an actual rate.
+ */
+
+static DEFINE_SPINLOCK(mt6797_clk_lock);
+
+static const struct mtk_fixed_factor top_divs[] = {
+	FACTOR(CLK_TOP_SYSPLL_CK, "syspll_ck", "mainpll", 1, 1),
+	FACTOR(CLK_TOP_SYSPLL_D2, "syspll_d2", "mainpll", 1, 2),
+	FACTOR(CLK_TOP_SYSPLL1_D2, "syspll1_d2", "syspll_d2", 1, 2),
+	FACTOR(CLK_TOP_SYSPLL1_D4, "syspll1_d4", "syspll_d2", 1, 4),
+	FACTOR(CLK_TOP_SYSPLL1_D8, "syspll1_d8", "syspll_d2", 1, 8),
+	FACTOR(CLK_TOP_SYSPLL1_D16, "syspll1_d16", "syspll_d2", 1, 16),
+	FACTOR(CLK_TOP_SYSPLL_D3, "syspll_d3", "mainpll", 1, 3),
+	FACTOR(CLK_TOP_SYSPLL_D3_D3, "syspll_d3_d3", "syspll_d3", 1, 3),
+	FACTOR(CLK_TOP_SYSPLL2_D2, "syspll2_d2", "syspll_d3", 1, 2),
+	FACTOR(CLK_TOP_SYSPLL2_D4, "syspll2_d4", "syspll_d3", 1, 4),
+	FACTOR(CLK_TOP_SYSPLL2_D8, "syspll2_d8", "syspll_d3", 1, 8),
+	FACTOR(CLK_TOP_SYSPLL_D5, "syspll_d5", "mainpll", 1, 5),
+	FACTOR(CLK_TOP_SYSPLL3_D2, "syspll3_d2", "syspll_d5", 1, 2),
+	FACTOR(CLK_TOP_SYSPLL3_D4, "syspll3_d4", "syspll_d5", 1, 4),
+	FACTOR(CLK_TOP_SYSPLL_D7, "syspll_d7", "mainpll", 1, 7),
+	FACTOR(CLK_TOP_SYSPLL4_D2, "syspll4_d2", "syspll_d7", 1, 2),
+	FACTOR(CLK_TOP_SYSPLL4_D4, "syspll4_d4", "syspll_d7", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL_CK, "univpll_ck", "univpll", 1, 1),
+	FACTOR(CLK_TOP_UNIVPLL_D7, "univpll_d7", "univpll", 1, 7),
+	FACTOR(CLK_TOP_UNIVPLL_D26, "univpll_d26", "univpll", 1, 26),
+	FACTOR(CLK_TOP_SSUSB_PHY_48M_CK, "ssusb_phy_48m_ck", "univpll", 1, 1),
+	FACTOR(CLK_TOP_USB_PHY48M_CK, "usb_phy48m_ck", "univpll", 1, 1),
+	FACTOR(CLK_TOP_UNIVPLL_D2, "univpll_d2", "univpll", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL1_D2, "univpll1_d2", "univpll_d2", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL1_D4, "univpll1_d4", "univpll_d2", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL1_D8, "univpll1_d8", "univpll_d2", 1, 8),
+	FACTOR(CLK_TOP_UNIVPLL_D3, "univpll_d3", "univpll", 1, 3),
+	FACTOR(CLK_TOP_UNIVPLL2_D2, "univpll2_d2", "univpll", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL2_D4, "univpll2_d4", "univpll", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL2_D8, "univpll2_d8", "univpll", 1, 8),
+	FACTOR(CLK_TOP_UNIVPLL_D5, "univpll_d5", "univpll", 1, 5),
+	FACTOR(CLK_TOP_UNIVPLL3_D2, "univpll3_d2", "univpll_d5", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL3_D4, "univpll3_d4", "univpll_d5", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL3_D8, "univpll3_d8", "univpll_d5", 1, 8),
+	FACTOR(CLK_TOP_ULPOSC_CK_ORG, "ulposc_ck_org", "ulposc", 1, 1),
+	FACTOR(CLK_TOP_ULPOSC_CK, "ulposc_ck", "ulposc_ck_org", 1, 3),
+	FACTOR(CLK_TOP_ULPOSC_D2, "ulposc_d2", "ulposc_ck", 1, 2),
+	FACTOR(CLK_TOP_ULPOSC_D3, "ulposc_d3", "ulposc_ck", 1, 4),
+	FACTOR(CLK_TOP_ULPOSC_D4, "ulposc_d4", "ulposc_ck", 1, 8),
+	FACTOR(CLK_TOP_ULPOSC_D8, "ulposc_d8", "ulposc_ck", 1, 10),
+	FACTOR(CLK_TOP_ULPOSC_D10, "ulposc_d10", "ulposc_ck_org", 1, 1),
+	FACTOR(CLK_TOP_APLL1_CK, "apll1_ck", "apll1", 1, 1),
+	FACTOR(CLK_TOP_APLL2_CK, "apll2_ck", "apll2", 1, 1),
+	FACTOR(CLK_TOP_MFGPLL_CK, "mfgpll_ck", "mfgpll", 1, 1),
+	FACTOR(CLK_TOP_MFGPLL_D2, "mfgpll_d2", "mfgpll_ck", 1, 2),
+	FACTOR(CLK_TOP_IMGPLL_CK, "imgpll_ck", "imgpll", 1, 1),
+	FACTOR(CLK_TOP_IMGPLL_D2, "imgpll_d2", "imgpll_ck", 1, 2),
+	FACTOR(CLK_TOP_IMGPLL_D4, "imgpll_d4", "imgpll_ck", 1, 4),
+	FACTOR(CLK_TOP_CODECPLL_CK, "codecpll_ck", "codecpll", 1, 1),
+	FACTOR(CLK_TOP_CODECPLL_D2, "codecpll_d2", "codecpll_ck", 1, 2),
+	FACTOR(CLK_TOP_VDECPLL_CK, "vdecpll_ck", "vdecpll", 1, 1),
+	FACTOR(CLK_TOP_TVDPLL_CK, "tvdpll_ck", "tvdpll", 1, 1),
+	FACTOR(CLK_TOP_TVDPLL_D2, "tvdpll_d2", "tvdpll_ck", 1, 2),
+	FACTOR(CLK_TOP_TVDPLL_D4, "tvdpll_d4", "tvdpll_ck", 1, 4),
+	FACTOR(CLK_TOP_TVDPLL_D8, "tvdpll_d8", "tvdpll_ck", 1, 8),
+	FACTOR(CLK_TOP_TVDPLL_D16, "tvdpll_d16", "tvdpll_ck", 1, 16),
+	FACTOR(CLK_TOP_MSDCPLL_CK, "msdcpll_ck", "msdcpll", 1, 1),
+	FACTOR(CLK_TOP_MSDCPLL_D2, "msdcpll_d2", "msdcpll_ck", 1, 2),
+	FACTOR(CLK_TOP_MSDCPLL_D4, "msdcpll_d4", "msdcpll_ck", 1, 4),
+	FACTOR(CLK_TOP_MSDCPLL_D8, "msdcpll_d8", "msdcpll_ck", 1, 8),
+};
+
+static const char * const axi_parents[] = {
+	"clk26m",
+	"syspll_d7",
+	"ulposc_axi_ck_mux",
+};
+
+static const char * const ulposc_axi_ck_mux_parents[] = {
+	"syspll1_d4",
+	"ulposc_axi_ck_mux_pre",
+};
+
+static const char * const ulposc_axi_ck_mux_pre_parents[] = {
+	"ulposc_d2",
+	"ulposc_d3",
+};
+
+static const char * const ddrphycfg_parents[] = {
+	"clk26m",
+	"syspll3_d2",
+	"syspll2_d4",
+	"syspll1_d8",
+};
+
+static const char * const mm_parents[] = {
+	"clk26m",
+	"imgpll_ck",
+	"univpll1_d2",
+	"syspll1_d2",
+};
+
+static const char * const pwm_parents[] = {
+	"clk26m",
+	"univpll2_d4",
+	"ulposc_d2",
+	"ulposc_d3",
+	"ulposc_d8",
+	"ulposc_d10",
+	"ulposc_d4",
+};
+
+static const char * const vdec_parents[] = {
+	"clk26m",
+	"vdecpll_ck",
+	"imgpll_ck",
+	"syspll_d3",
+	"univpll_d5",
+	"clk26m",
+	"clk26m",
+};
+
+static const char * const venc_parents[] = {
+	"clk26m",
+	"codecpll_ck",
+	"syspll_d3",
+};
+
+static const char * const mfg_parents[] = {
+	"clk26m",
+	"mfgpll_ck",
+	"syspll_d3",
+	"univpll_d3",
+};
+
+static const char * const camtg[] = {
+	"clk26m",
+	"univpll_d26",
+	"univpll2_d2",
+};
+
+static const char * const uart_parents[] = {
+	"clk26m",
+	"univpll2_d8",
+};
+
+static const char * const spi_parents[] = {
+	"clk26m",
+	"syspll3_d2",
+	"syspll2_d4",
+	"ulposc_spi_ck_mux",
+};
+
+static const char * const ulposc_spi_ck_mux_parents[] = {
+	"ulposc_d2",
+	"ulposc_d3",
+};
+
+static const char * const usb20_parents[] = {
+	"clk26m",
+	"univpll1_d8",
+	"syspll4_d2",
+};
+
+static const char * const msdc50_0_hclk_parents[] = {
+	"clk26m",
+	"syspll1_d2",
+	"syspll2_d2",
+	"syspll4_d2",
+};
+
+static const char * const msdc50_0_parents[] = {
+	"clk26m",
+	"msdcpll",
+	"syspll_d3",
+	"univpll1_d4",
+	"syspll2_d2",
+	"syspll_d7",
+	"msdcpll_d2",
+	"univpll1_d2",
+	"univpll_d3",
+};
+
+static const char * const msdc30_1_parents[] = {
+	"clk26m",
+	"univpll2_d2",
+	"msdcpll_d2",
+	"univpll1_d4",
+	"syspll2_d2",
+	"syspll_d7",
+	"univpll_d7",
+};
+
+static const char * const msdc30_2_parents[] = {
+	"clk26m",
+	"univpll2_d8",
+	"syspll2_d8",
+	"syspll1_d8",
+	"msdcpll_d8",
+	"syspll3_d4",
+	"univpll_d26",
+};
+
+static const char * const audio_parents[] = {
+	"clk26m",
+	"syspll3_d4",
+	"syspll4_d4",
+	"syspll1_d16",
+};
+
+static const char * const aud_intbus_parents[] = {
+	"clk26m",
+	"syspll1_d4",
+	"syspll4_d2",
+};
+
+static const char * const pmicspi_parents[] = {
+	"clk26m",
+	"univpll_d26",
+	"syspll3_d4",
+	"syspll1_d8",
+	"ulposc_d4",
+	"ulposc_d8",
+	"syspll2_d8",
+};
+
+static const char * const scp_parents[] = {
+	"clk26m",
+	"syspll_d3",
+	"ulposc_ck",
+	"univpll_d5",
+};
+
+static const char * const atb_parents[] = {
+	"clk26m",
+	"syspll1_d2",
+	"syspll_d5",
+};
+
+static const char * const mjc_parents[] = {
+	"clk26m",
+	"imgpll_ck",
+	"univpll_d5",
+	"syspll1_d2",
+};
+
+static const char * const dpi0_parents[] = {
+	"clk26m",
+	"tvdpll_d2",
+	"tvdpll_d4",
+	"tvdpll_d8",
+	"tvdpll_d16",
+	"clk26m",
+	"clk26m",
+};
+
+static const char * const aud_1_parents[] = {
+	"clk26m",
+	"apll1_ck",
+};
+
+static const char * const aud_2_parents[] = {
+	"clk26m",
+	"apll2_ck",
+};
+
+static const char * const ssusb_top_sys_parents[] = {
+	"clk26m",
+	"univpll3_d2",
+};
+
+static const char * const spm_parents[] = {
+	"clk26m",
+	"syspll1_d8",
+};
+
+static const char * const bsi_spi_parents[] = {
+	"clk26m",
+	"syspll_d3_d3",
+	"syspll1_d4",
+	"syspll_d7",
+};
+
+static const char * const audio_h_parents[] = {
+	"clk26m",
+	"apll2_ck",
+	"apll1_ck",
+	"univpll_d7",
+};
+
+static const char * const mfg_52m_parents[] = {
+	"clk26m",
+	"univpll2_d8",
+	"univpll2_d4",
+	"univpll2_d4",
+};
+
+static const char * const anc_md32_parents[] = {
+	"clk26m",
+	"syspll1_d2",
+	"univpll_d5",
+};
+
+static const struct mtk_composite top_muxes[] = {
+	MUX_GATE(CLK_TOP_MUX_ULPOSC_AXI_CK_MUX_PRE, "ulposc_axi_ck_mux_pre",
+		 ulposc_axi_ck_mux_pre_parents, 0x0040, 3, 1,
+		 INVALID_MUX_GATE_BIT),
+	MUX_GATE(CLK_TOP_MUX_ULPOSC_AXI_CK_MUX, "ulposc_axi_ck_mux",
+		 ulposc_axi_ck_mux_parents, 0x0040, 2, 1, INVALID_MUX_GATE_BIT),
+	MUX_GATE(CLK_TOP_MUX_AXI, "axi_sel", axi_parents,
+		 0x0040, 0, 2, INVALID_MUX_GATE_BIT),
+	MUX_GATE(CLK_TOP_MUX_DDRPHYCFG, "ddrphycfg_sel", ddrphycfg_parents,
+		 0x0040, 16, 2, INVALID_MUX_GATE_BIT),
+	MUX_GATE(CLK_TOP_MUX_MM, "mm_sel", mm_parents,
+		 0x0040, 24, 2, INVALID_MUX_GATE_BIT),
+	MUX_GATE(CLK_TOP_MUX_PWM, "pwm_sel", pwm_parents, 0x0050, 0, 3, 7),
+	MUX_GATE(CLK_TOP_MUX_VDEC, "vdec_sel", vdec_parents, 0x0050, 8, 3, 15),
+	MUX_GATE(CLK_TOP_MUX_VENC, "venc_sel", venc_parents, 0x0050, 16, 2, 23),
+	MUX_GATE(CLK_TOP_MUX_MFG, "mfg_sel", mfg_parents, 0x0050, 24, 2, 31),
+	MUX_GATE(CLK_TOP_MUX_CAMTG, "camtg_sel", camtg, 0x0060, 0, 2, 7),
+	MUX_GATE(CLK_TOP_MUX_UART, "uart_sel", uart_parents, 0x0060, 8, 1, 15),
+	MUX_GATE(CLK_TOP_MUX_SPI, "spi_sel", spi_parents, 0x0060, 16, 2, 23),
+	MUX_GATE(CLK_TOP_MUX_ULPOSC_SPI_CK_MUX, "ulposc_spi_ck_mux",
+		 ulposc_spi_ck_mux_parents, 0x0060, 18, 1,
+		 INVALID_MUX_GATE_BIT),
+	MUX_GATE(CLK_TOP_MUX_USB20, "usb20_sel", usb20_parents,
+		 0x0060, 24, 2, 31),
+	MUX_GATE(CLK_TOP_MUX_MSDC50_0_HCLK, "msdc50_0_hclk_sel",
+		 msdc50_0_hclk_parents, 0x0070, 8, 2, INVALID_MUX_GATE_BIT),
+	MUX_GATE(CLK_TOP_MUX_MSDC50_0, "msdc50_0_sel", msdc50_0_parents,
+		 0x0070, 16, 4, 23),
+	MUX_GATE(CLK_TOP_MUX_MSDC30_1, "msdc30_1_sel", msdc30_1_parents,
+		 0x0070, 24, 3, 31),
+	MUX_GATE(CLK_TOP_MUX_MSDC30_2, "msdc30_2_sel", msdc30_2_parents,
+		 0x0080, 0, 3, 7),
+	MUX_GATE(CLK_TOP_MUX_AUDIO, "audio_sel", audio_parents,
+		 0x0080, 16, 2, 23),
+	MUX_GATE(CLK_TOP_MUX_AUD_INTBUS, "aud_intbus_sel", aud_intbus_parents,
+		 0x0080, 24, 2, INVALID_MUX_GATE_BIT),
+	MUX_GATE(CLK_TOP_MUX_PMICSPI, "pmicspi_sel", pmicspi_parents,
+		 0x0090, 0, 3, INVALID_MUX_GATE_BIT),
+	MUX_GATE(CLK_TOP_MUX_SCP, "scp_sel", scp_parents,
+		 0x0090, 8, 2, INVALID_MUX_GATE_BIT),
+	MUX_GATE(CLK_TOP_MUX_ATB, "atb_sel", atb_parents,
+		 0x0090, 16, 2, INVALID_MUX_GATE_BIT),
+	MUX_GATE(CLK_TOP_MUX_MJC, "mjc_sel", mjc_parents, 0x0090, 24, 2, 31),
+	MUX_GATE(CLK_TOP_MUX_DPI0, "dpi0_sel", dpi0_parents, 0x00A0, 0, 3, 7),
+	MUX_GATE(CLK_TOP_MUX_AUD_1, "aud_1_sel", aud_1_parents,
+		 0x00A0, 16, 1, 23),
+	MUX_GATE(CLK_TOP_MUX_AUD_2, "aud_2_sel", aud_2_parents,
+		 0x00A0, 24, 1, 31),
+	MUX_GATE(CLK_TOP_MUX_SSUSB_TOP_SYS, "ssusb_top_sys_sel",
+		 ssusb_top_sys_parents, 0x00B0, 8, 1, INVALID_MUX_GATE_BIT),
+	MUX_GATE(CLK_TOP_MUX_SPM, "spm_sel", spm_parents,
+		 0x00C0, 0, 1, INVALID_MUX_GATE_BIT),
+	MUX_GATE(CLK_TOP_MUX_BSI_SPI, "bsi_spi_sel", bsi_spi_parents,
+		 0x00C0, 8, 2, INVALID_MUX_GATE_BIT),
+	MUX_GATE(CLK_TOP_MUX_AUDIO_H, "audio_h_sel", audio_h_parents,
+		 0x00C0, 16, 2, 23),
+	MUX_GATE(CLK_TOP_MUX_ANC_MD32, "anc_md32_sel", anc_md32_parents,
+		 0x00C0, 24, 2, 31),
+	MUX_GATE(CLK_TOP_MUX_MFG_52M, "mfg_52m_sel", mfg_52m_parents,
+		 0x0104, 1, 2, INVALID_MUX_GATE_BIT),
+};
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
+	.set_ofs = 0x00a8,
+	.clr_ofs = 0x00ac,
+	.sta_ofs = 0x00b0,
+};
+
+#define GATE_ICG0(_id, _name, _parent, _shift) {	\
+	.id = _id,					\
+	.name = _name,					\
+	.parent_name = _parent,				\
+	.regs = &infra0_cg_regs,			\
+	.shift = _shift,				\
+	.ops = &mtk_clk_gate_ops_setclr,		\
+}
+
+#define GATE_ICG1(_id, _name, _parent, _shift) {	\
+	.id = _id,					\
+	.name = _name,					\
+	.parent_name = _parent,				\
+	.regs = &infra1_cg_regs,			\
+	.shift = _shift,				\
+	.ops = &mtk_clk_gate_ops_setclr,		\
+}
+
+#define GATE_ICG2(_id, _name, _parent, _shift) {	\
+	.id = _id,					\
+	.name = _name,					\
+	.parent_name = _parent,				\
+	.regs = &infra2_cg_regs,			\
+	.shift = _shift,				\
+	.ops = &mtk_clk_gate_ops_setclr,		\
+}
+
+static const struct mtk_gate infra_gates[] = {
+	GATE_ICG0(CLK_INFRA_PMIC_TMR, "infra_pmic_tmr", "ulposc", 0),
+	GATE_ICG0(CLK_INFRA_PMIC_AP, "infra_pmic_ap", "pmicspi_sel", 1),
+	GATE_ICG0(CLK_INFRA_PMIC_MD, "infra_pmic_md", "pmicspi_sel", 2),
+	GATE_ICG0(CLK_INFRA_PMIC_CONN, "infra_pmic_conn", "pmicspi_sel", 3),
+	GATE_ICG0(CLK_INFRA_SCP, "infra_scp", "scp_sel", 4),
+	GATE_ICG0(CLK_INFRA_SEJ, "infra_sej", "axi_sel", 5),
+	GATE_ICG0(CLK_INFRA_APXGPT, "infra_apxgpt", "axi_sel", 6),
+	GATE_ICG0(CLK_INFRA_SEJ_13M, "infra_sej_13m", "clk26m", 7),
+	GATE_ICG0(CLK_INFRA_ICUSB, "infra_icusb", "usb20_sel", 8),
+	GATE_ICG0(CLK_INFRA_GCE, "infra_gce", "axi_sel", 9),
+	GATE_ICG0(CLK_INFRA_THERM, "infra_therm", "axi_sel", 10),
+	GATE_ICG0(CLK_INFRA_I2C0, "infra_i2c0", "axi_sel", 11),
+	GATE_ICG0(CLK_INFRA_I2C1, "infra_i2c1", "axi_sel", 12),
+	GATE_ICG0(CLK_INFRA_I2C2, "infra_i2c2", "axi_sel", 13),
+	GATE_ICG0(CLK_INFRA_I2C3, "infra_i2c3", "axi_sel", 14),
+	GATE_ICG0(CLK_INFRA_PWM_HCLK, "infra_pwm_hclk", "axi_sel", 15),
+	GATE_ICG0(CLK_INFRA_PWM1, "infra_pwm1", "axi_sel", 16),
+	GATE_ICG0(CLK_INFRA_PWM2, "infra_pwm2", "axi_sel", 17),
+	GATE_ICG0(CLK_INFRA_PWM3, "infra_pwm3", "axi_sel", 18),
+	GATE_ICG0(CLK_INFRA_PWM4, "infra_pwm4", "axi_sel", 19),
+	GATE_ICG0(CLK_INFRA_PWM, "infra_pwm", "axi_sel", 21),
+	GATE_ICG0(CLK_INFRA_UART0, "infra_uart0", "uart_sel", 22),
+	GATE_ICG0(CLK_INFRA_UART1, "infra_uart1", "uart_sel", 23),
+	GATE_ICG0(CLK_INFRA_UART2, "infra_uart2", "uart_sel", 24),
+	GATE_ICG0(CLK_INFRA_UART3, "infra_uart3", "uart_sel", 25),
+	GATE_ICG0(CLK_INFRA_MD2MD_CCIF_0, "infra_md2md_ccif_0", "axi_sel", 27),
+	GATE_ICG0(CLK_INFRA_MD2MD_CCIF_1, "infra_md2md_ccif_1", "axi_sel", 28),
+	GATE_ICG0(CLK_INFRA_MD2MD_CCIF_2, "infra_md2md_ccif_2", "axi_sel", 29),
+	GATE_ICG0(CLK_INFRA_FHCTL, "infra_fhctl", "clk26m", 30),
+	GATE_ICG0(CLK_INFRA_BTIF, "infra_btif", "axi_sel", 31),
+	GATE_ICG1(CLK_INFRA_MD2MD_CCIF_3, "infra_md2md_ccif_3", "axi_sel", 0),
+	GATE_ICG1(CLK_INFRA_SPI, "infra_spi", "spi_sel", 1),
+	GATE_ICG1(CLK_INFRA_MSDC0, "infra_msdc0", "msdc50_0_sel", 2),
+	GATE_ICG1(CLK_INFRA_MD2MD_CCIF_4, "infra_md2md_ccif_4", "axi_sel", 3),
+	GATE_ICG1(CLK_INFRA_MSDC1, "infra_msdc1", "msdc30_1_sel", 4),
+	GATE_ICG1(CLK_INFRA_MSDC2, "infra_msdc2", "msdc30_2_sel", 5),
+	GATE_ICG1(CLK_INFRA_MD2MD_CCIF_5, "infra_md2md_ccif_5", "axi_sel", 7),
+	GATE_ICG1(CLK_INFRA_GCPU, "infra_gcpu", "axi_sel", 8),
+	GATE_ICG1(CLK_INFRA_TRNG, "infra_trng", "axi_sel", 9),
+	GATE_ICG1(CLK_INFRA_AUXADC, "infra_auxadc", "clk26m", 10),
+	GATE_ICG1(CLK_INFRA_CPUM, "infra_cpum", "axi_sel", 11),
+	GATE_ICG1(CLK_INFRA_AP_C2K_CCIF_0, "infra_ap_c2k_ccif_0",
+		  "axi_sel", 12),
+	GATE_ICG1(CLK_INFRA_AP_C2K_CCIF_1, "infra_ap_c2k_ccif_1",
+		  "axi_sel", 13),
+	GATE_ICG1(CLK_INFRA_CLDMA, "infra_cldma", "axi_sel", 16),
+	GATE_ICG1(CLK_INFRA_DISP_PWM, "infra_disp_pwm", "pwm_sel", 17),
+	GATE_ICG1(CLK_INFRA_AP_DMA, "infra_ap_dma", "axi_sel", 18),
+	GATE_ICG1(CLK_INFRA_DEVICE_APC, "infra_device_apc", "axi_sel", 20),
+	GATE_ICG1(CLK_INFRA_L2C_SRAM, "infra_l2c_sram", "mm_sel", 22),
+	GATE_ICG1(CLK_INFRA_CCIF_AP, "infra_ccif_ap", "axi_sel", 23),
+	GATE_ICG1(CLK_INFRA_AUDIO, "infra_audio", "axi_sel", 25),
+	GATE_ICG1(CLK_INFRA_CCIF_MD, "infra_ccif_md", "axi_sel", 26),
+	GATE_ICG1(CLK_INFRA_DRAMC_F26M, "infra_dramc_f26m", "clk26m", 31),
+	GATE_ICG2(CLK_INFRA_I2C4, "infra_i2c4", "axi_sel", 0),
+	GATE_ICG2(CLK_INFRA_I2C_APPM, "infra_i2c_appm", "axi_sel", 1),
+	GATE_ICG2(CLK_INFRA_I2C_GPUPM, "infra_i2c_gpupm", "axi_sel", 2),
+	GATE_ICG2(CLK_INFRA_I2C2_IMM, "infra_i2c2_imm", "axi_sel", 3),
+	GATE_ICG2(CLK_INFRA_I2C2_ARB, "infra_i2c2_arb", "axi_sel", 4),
+	GATE_ICG2(CLK_INFRA_I2C3_IMM, "infra_i2c3_imm", "axi_sel", 5),
+	GATE_ICG2(CLK_INFRA_I2C3_ARB, "infra_i2c3_arb", "axi_sel", 6),
+	GATE_ICG2(CLK_INFRA_I2C5, "infra_i2c5", "axi_sel", 7),
+	GATE_ICG2(CLK_INFRA_SYS_CIRQ, "infra_sys_cirq", "axi_sel", 8),
+	GATE_ICG2(CLK_INFRA_SPI1, "infra_spi1", "spi_sel", 10),
+	GATE_ICG2(CLK_INFRA_DRAMC_B_F26M, "infra_dramc_b_f26m", "clk26m", 11),
+	GATE_ICG2(CLK_INFRA_ANC_MD32, "infra_anc_md32", "anc_md32_sel", 12),
+	GATE_ICG2(CLK_INFRA_ANC_MD32_32K, "infra_anc_md32_32k", "clk26m", 13),
+	GATE_ICG2(CLK_INFRA_DVFS_SPM1, "infra_dvfs_spm1", "axi_sel", 15),
+	GATE_ICG2(CLK_INFRA_AES_TOP0, "infra_aes_top0", "axi_sel", 16),
+	GATE_ICG2(CLK_INFRA_AES_TOP1, "infra_aes_top1", "axi_sel", 17),
+	GATE_ICG2(CLK_INFRA_SSUSB_BUS, "infra_ssusb_bus", "axi_sel", 18),
+	GATE_ICG2(CLK_INFRA_SPI2, "infra_spi2", "spi_sel", 19),
+	GATE_ICG2(CLK_INFRA_SPI3, "infra_spi3", "spi_sel", 20),
+	GATE_ICG2(CLK_INFRA_SPI4, "infra_spi4", "spi_sel", 21),
+	GATE_ICG2(CLK_INFRA_SPI5, "infra_spi5", "spi_sel", 22),
+	GATE_ICG2(CLK_INFRA_IRTX, "infra_irtx", "spi_sel", 23),
+	GATE_ICG2(CLK_INFRA_SSUSB_SYS, "infra_ssusb_sys",
+		  "ssusb_top_sys_sel", 24),
+	GATE_ICG2(CLK_INFRA_SSUSB_REF, "infra_ssusb_ref", "clk26m", 9),
+	GATE_ICG2(CLK_INFRA_AUDIO_26M, "infra_audio_26m", "clk26m", 26),
+	GATE_ICG2(CLK_INFRA_AUDIO_26M_PAD_TOP, "infra_audio_26m_pad_top",
+		  "clk26m", 27),
+	GATE_ICG2(CLK_INFRA_MODEM_TEMP_SHARE, "infra_modem_temp_share",
+		  "axi_sel", 28),
+	GATE_ICG2(CLK_INFRA_VAD_WRAP_SOC, "infra_vad_wrap_soc", "axi_sel", 29),
+	GATE_ICG2(CLK_INFRA_DRAMC_CONF, "infra_dramc_conf", "axi_sel", 30),
+	GATE_ICG2(CLK_INFRA_DRAMC_B_CONF, "infra_dramc_b_conf", "axi_sel", 31),
+	GATE_ICG1(CLK_INFRA_MFG_VCG, "infra_mfg_vcg", "mfg_52m_sel", 14),
+};
+
+static const struct mtk_fixed_factor infra_divs[] = {
+	FACTOR(CLK_INFRA_13M, "clk13m", "clk26m", 1, 2),
+};
+
+#define MT6797_PLL_FMAX		(3000UL * MHZ)
+
+#define CON0_MT6797_RST_BAR	BIT(24)
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
+	.rst_bar_mask = CON0_MT6797_RST_BAR,			\
+	.fmax = MT6797_PLL_FMAX,				\
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
+	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0220, 0x022C, 0xF0000101, 0, 21,
+	    0x220, 4, 0x0, 0x224, 0),
+	PLL(CLK_APMIXED_UNIVPLL, "univpll", 0x0230, 0x023C, 0xFE000011, 0, 7,
+	    0x230, 4, 0x0, 0x234, 14),
+	PLL(CLK_APMIXED_MFGPLL, "mfgpll", 0x0240, 0x024C, 0x00000101, 0, 21,
+	    0x244, 24, 0x0, 0x244, 0),
+	PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x0250, 0x025C, 0x00000121, 0, 21,
+	    0x250, 4, 0x0, 0x254, 0),
+	PLL(CLK_APMIXED_IMGPLL, "imgpll", 0x0260, 0x026C, 0x00000121, 0, 21,
+	    0x260, 4, 0x0, 0x264, 0),
+	PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x0270, 0x027C, 0xC0000121, 0, 21,
+	    0x270, 4, 0x0, 0x274, 0),
+	PLL(CLK_APMIXED_CODECPLL, "codecpll", 0x0290, 0x029C, 0x00000121, 0, 21,
+	    0x290, 4, 0x0, 0x294, 0),
+	PLL(CLK_APMIXED_VDECPLL, "vdecpll", 0x02E4, 0x02F0, 0x00000121, 0, 21,
+	    0x2E4, 4, 0x0, 0x2E8, 0),
+	PLL(CLK_APMIXED_APLL1, "apll1", 0x02A0, 0x02B0, 0x00000131, 0, 31,
+	    0x2A0, 4, 0x2A8, 0x2A4, 0),
+	PLL(CLK_APMIXED_APLL2, "apll2", 0x02B4, 0x02C4, 0x00000131, 0, 31,
+	    0x2B4, 4, 0x2BC, 0x2B8, 0),
+};
+
+static struct clk_onecell_data * __init mtk_topckgen_init(struct device *dev)
+{
+	struct clk_onecell_data *clk_data;
+	struct resource mem;
+	void __iomem *base;
+
+	if (of_address_to_resource(dev->of_node, 0, &mem)) {
+		pr_err("%s: get resource failed\n", __func__);
+		goto res_err;
+	}
+
+	base = devm_ioremap(dev, mem.start, resource_size(&mem));
+	if (!base) {
+		pr_err("%s: ioremap failed\n", __func__);
+		goto ioremap_err;
+	}
+
+	clk_data = mtk_alloc_clk_data(CLK_TOP_NR);
+	if (!clk_data) {
+		pr_err("%s: alloc failed\n", __func__);
+		goto alloc_err;
+	}
+
+	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
+	mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base,
+				    &mt6797_clk_lock, clk_data);
+
+	return clk_data;
+
+alloc_err:
+	devm_iounmap(dev, base);
+res_err:
+ioremap_err:
+	return NULL;
+}
+
+static struct clk_onecell_data * __init mtk_infrasys_init(struct device *dev)
+{
+	struct clk_onecell_data *clk_data;
+
+	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
+	if (!clk_data) {
+		pr_err("%s: alloc failed\n", __func__);
+		goto alloc_err;
+	}
+
+	mtk_clk_register_gates(dev->of_node, infra_gates,
+			       ARRAY_SIZE(infra_gates), clk_data);
+	mtk_clk_register_factors(infra_divs, ARRAY_SIZE(infra_divs), clk_data);
+
+	return clk_data;
+
+alloc_err:
+	return NULL;
+}
+
+static struct clk_onecell_data * __init mtk_apmixedsys_init(struct device *dev)
+{
+	struct clk_onecell_data *clk_data;
+
+	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR);
+	if (!clk_data) {
+		pr_err("%s: alloc failed\n", __func__);
+		goto alloc_err;
+	}
+
+	mtk_clk_register_plls(dev->of_node, plls, ARRAY_SIZE(plls), clk_data);
+
+	return clk_data;
+
+alloc_err:
+	return NULL;
+}
+
+static const struct of_device_id of_match_clk_mt6797[] = {
+	{
+		.compatible = "mediatek,mt6797-topckgen",
+		.data = mtk_topckgen_init,
+	}, {
+		.compatible = "mediatek,mt6797-infracfg",
+		.data = mtk_infrasys_init,
+	}, {
+		.compatible = "mediatek,mt6797-apmixedsys",
+		.data = mtk_apmixedsys_init,
+	}, {
+		/* sentinel */
+	}
+};
+
+static int clk_mt6797_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data * (*clk_init)(struct device *);
+	struct clk_onecell_data *clk_data;
+	int r;
+
+	clk_init = of_device_get_match_data(&pdev->dev);
+	if (!clk_init) {
+		pr_err("%s: matched clk not found\n", __func__);
+		return -EINVAL;
+	}
+
+	clk_data = clk_init(&pdev->dev);
+	if (!clk_data) {
+		pr_err("%s: clk init failed\n", __func__);
+		return -EINVAL;
+	}
+
+	r = of_clk_add_provider(pdev->dev.of_node, of_clk_src_onecell_get,
+				clk_data);
+	if (r) {
+		pr_err("%s: could not register clock provider: %d\n",
+		       __func__, r);
+		return r;
+	}
+
+	return 0;
+}
+
+static struct platform_driver clk_mt6797_drv = {
+	.probe = clk_mt6797_probe,
+	.driver = {
+		.name = "clk-mt6797",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_clk_mt6797,
+	},
+};
+
+static int __init clk_mt6797_init(void)
+{
+	return platform_driver_register(&clk_mt6797_drv);
+}
+
+arch_initcall(clk_mt6797_init);
diff --git a/include/dt-bindings/clock/mt6797-clk.h b/include/dt-bindings/clock/mt6797-clk.h
new file mode 100644
index 0000000..6f32e6b
--- /dev/null
+++ b/include/dt-bindings/clock/mt6797-clk.h
@@ -0,0 +1,281 @@
+/*
+* Copyright (c) 2016 MediaTek Inc.
+* Author: Kevin Chen <kevin-cw.chen@mediatek.com>
+*
+* This program is free software; you can redistribute it and/or modify
+* it under the terms of the GNU General Public License version 2 as
+* published by the Free Software Foundation.
+*
+* This program is distributed in the hope that it will be useful,
+* but WITHOUT ANY WARRANTY; without even the implied warranty of
+* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+* GNU General Public License for more details.
+*/
+
+#ifndef _DT_BINDINGS_CLK_MT6797_H
+#define _DT_BINDINGS_CLK_MT6797_H
+
+/* TOPCKGEN */
+#define	CLK_TOP_MUX_ULPOSC_AXI_CK_MUX_PRE	1
+#define	CLK_TOP_MUX_ULPOSC_AXI_CK_MUX	2
+#define	CLK_TOP_MUX_AXI	3
+#define	CLK_TOP_MUX_MEM	4
+#define	CLK_TOP_MUX_DDRPHYCFG	5
+#define	CLK_TOP_MUX_MM	6
+#define	CLK_TOP_MUX_PWM	7
+#define	CLK_TOP_MUX_VDEC	8
+#define	CLK_TOP_MUX_VENC	9
+#define	CLK_TOP_MUX_MFG	10
+#define	CLK_TOP_MUX_CAMTG	11
+#define	CLK_TOP_MUX_UART	12
+#define	CLK_TOP_MUX_SPI	13
+#define	CLK_TOP_MUX_ULPOSC_SPI_CK_MUX	14
+#define	CLK_TOP_MUX_USB20	15
+#define	CLK_TOP_MUX_MSDC50_0_HCLK	16
+#define	CLK_TOP_MUX_MSDC50_0	17
+#define	CLK_TOP_MUX_MSDC30_1	18
+#define	CLK_TOP_MUX_MSDC30_2	19
+#define	CLK_TOP_MUX_AUDIO	20
+#define	CLK_TOP_MUX_AUD_INTBUS	21
+#define	CLK_TOP_MUX_PMICSPI	22
+#define	CLK_TOP_MUX_SCP	23
+#define	CLK_TOP_MUX_ATB	24
+#define	CLK_TOP_MUX_MJC	25
+#define	CLK_TOP_MUX_DPI0	26
+#define	CLK_TOP_MUX_AUD_1	27
+#define	CLK_TOP_MUX_AUD_2	28
+#define	CLK_TOP_MUX_SSUSB_TOP_SYS	29
+#define	CLK_TOP_MUX_SPM	30
+#define	CLK_TOP_MUX_BSI_SPI	31
+#define	CLK_TOP_MUX_AUDIO_H	32
+#define	CLK_TOP_MUX_ANC_MD32	33
+#define	CLK_TOP_MUX_MFG_52M	34
+#define	CLK_TOP_SYSPLL_CK	35
+#define	CLK_TOP_SYSPLL_D2	36
+#define	CLK_TOP_SYSPLL1_D2	37
+#define	CLK_TOP_SYSPLL1_D4	38
+#define	CLK_TOP_SYSPLL1_D8	39
+#define	CLK_TOP_SYSPLL1_D16	40
+#define	CLK_TOP_SYSPLL_D3	41
+#define	CLK_TOP_SYSPLL_D3_D3	42
+#define	CLK_TOP_SYSPLL2_D2	43
+#define	CLK_TOP_SYSPLL2_D4	44
+#define	CLK_TOP_SYSPLL2_D8	45
+#define	CLK_TOP_SYSPLL_D5	46
+#define	CLK_TOP_SYSPLL3_D2	47
+#define	CLK_TOP_SYSPLL3_D4	48
+#define	CLK_TOP_SYSPLL_D7	49
+#define	CLK_TOP_SYSPLL4_D2	50
+#define	CLK_TOP_SYSPLL4_D4	51
+#define	CLK_TOP_UNIVPLL_CK	52
+#define	CLK_TOP_UNIVPLL_D7	53
+#define	CLK_TOP_UNIVPLL_D26	54
+#define	CLK_TOP_SSUSB_PHY_48M_CK	55
+#define	CLK_TOP_USB_PHY48M_CK	56
+#define	CLK_TOP_UNIVPLL_D2	57
+#define	CLK_TOP_UNIVPLL1_D2	58
+#define	CLK_TOP_UNIVPLL1_D4	59
+#define	CLK_TOP_UNIVPLL1_D8	60
+#define	CLK_TOP_UNIVPLL_D3	61
+#define	CLK_TOP_UNIVPLL2_D2	62
+#define	CLK_TOP_UNIVPLL2_D4	63
+#define	CLK_TOP_UNIVPLL2_D8	64
+#define	CLK_TOP_UNIVPLL_D5	65
+#define	CLK_TOP_UNIVPLL3_D2	66
+#define	CLK_TOP_UNIVPLL3_D4	67
+#define	CLK_TOP_UNIVPLL3_D8	68
+#define	CLK_TOP_ULPOSC_CK_ORG	69
+#define	CLK_TOP_ULPOSC_CK	70
+#define	CLK_TOP_ULPOSC_D2	71
+#define	CLK_TOP_ULPOSC_D3	72
+#define	CLK_TOP_ULPOSC_D4	73
+#define	CLK_TOP_ULPOSC_D8	74
+#define	CLK_TOP_ULPOSC_D10	75
+#define	CLK_TOP_APLL1_CK	76
+#define	CLK_TOP_APLL2_CK	77
+#define	CLK_TOP_MFGPLL_CK	78
+#define	CLK_TOP_MFGPLL_D2	79
+#define	CLK_TOP_IMGPLL_CK	80
+#define	CLK_TOP_IMGPLL_D2	81
+#define	CLK_TOP_IMGPLL_D4	82
+#define	CLK_TOP_CODECPLL_CK	83
+#define	CLK_TOP_CODECPLL_D2	84
+#define	CLK_TOP_VDECPLL_CK	85
+#define	CLK_TOP_TVDPLL_CK	86
+#define	CLK_TOP_TVDPLL_D2	87
+#define	CLK_TOP_TVDPLL_D4	88
+#define	CLK_TOP_TVDPLL_D8	89
+#define	CLK_TOP_TVDPLL_D16	90
+#define	CLK_TOP_MSDCPLL_CK	91
+#define	CLK_TOP_MSDCPLL_D2	92
+#define	CLK_TOP_MSDCPLL_D4	93
+#define	CLK_TOP_MSDCPLL_D8	94
+#define CLK_TOP_NR		95
+
+/* APMIXED_SYS */
+#define CLK_APMIXED_MAINPLL	1
+#define CLK_APMIXED_UNIVPLL 2
+#define CLK_APMIXED_MFGPLL	3
+#define CLK_APMIXED_MSDCPLL	4
+#define CLK_APMIXED_IMGPLL	5
+#define CLK_APMIXED_TVDPLL	6
+#define CLK_APMIXED_CODECPLL	7
+#define CLK_APMIXED_VDECPLL	8
+#define CLK_APMIXED_APLL1	9
+#define CLK_APMIXED_APLL2	10
+#define CLK_APMIXED_NR	11
+
+/* INFRA_SYS */
+#define	CLK_INFRA_PMIC_TMR	1
+#define	CLK_INFRA_PMIC_AP	2
+#define	CLK_INFRA_PMIC_MD	3
+#define	CLK_INFRA_PMIC_CONN	4
+#define	CLK_INFRA_SCP	5
+#define	CLK_INFRA_SEJ	6
+#define	CLK_INFRA_APXGPT	7
+#define	CLK_INFRA_SEJ_13M	8
+#define	CLK_INFRA_ICUSB	9
+#define	CLK_INFRA_GCE	10
+#define	CLK_INFRA_THERM	11
+#define	CLK_INFRA_I2C0	12
+#define	CLK_INFRA_I2C1	13
+#define	CLK_INFRA_I2C2	14
+#define	CLK_INFRA_I2C3	15
+#define	CLK_INFRA_PWM_HCLK	16
+#define	CLK_INFRA_PWM1	17
+#define	CLK_INFRA_PWM2	18
+#define	CLK_INFRA_PWM3	19
+#define	CLK_INFRA_PWM4	20
+#define	CLK_INFRA_PWM	21
+#define	CLK_INFRA_UART0	22
+#define	CLK_INFRA_UART1	23
+#define	CLK_INFRA_UART2	24
+#define	CLK_INFRA_UART3	25
+#define	CLK_INFRA_MD2MD_CCIF_0	26
+#define	CLK_INFRA_MD2MD_CCIF_1	27
+#define	CLK_INFRA_MD2MD_CCIF_2	28
+#define	CLK_INFRA_FHCTL	29
+#define	CLK_INFRA_BTIF	30
+#define	CLK_INFRA_MD2MD_CCIF_3	31
+#define	CLK_INFRA_SPI	32
+#define	CLK_INFRA_MSDC0	33
+#define	CLK_INFRA_MD2MD_CCIF_4	34
+#define	CLK_INFRA_MSDC1	35
+#define	CLK_INFRA_MSDC2	36
+#define	CLK_INFRA_MD2MD_CCIF_5	37
+#define	CLK_INFRA_GCPU	38
+#define	CLK_INFRA_TRNG	39
+#define	CLK_INFRA_AUXADC	40
+#define	CLK_INFRA_CPUM	41
+#define	CLK_INFRA_AP_C2K_CCIF_0	42
+#define	CLK_INFRA_AP_C2K_CCIF_1	43
+#define	CLK_INFRA_CLDMA	44
+#define	CLK_INFRA_DISP_PWM	45
+#define	CLK_INFRA_AP_DMA	46
+#define	CLK_INFRA_DEVICE_APC	47
+#define	CLK_INFRA_L2C_SRAM	48
+#define	CLK_INFRA_CCIF_AP	49
+#define	CLK_INFRA_AUDIO	50
+#define	CLK_INFRA_CCIF_MD	51
+#define	CLK_INFRA_DRAMC_F26M	52
+#define	CLK_INFRA_I2C4	53
+#define	CLK_INFRA_I2C_APPM	54
+#define	CLK_INFRA_I2C_GPUPM	55
+#define	CLK_INFRA_I2C2_IMM	56
+#define	CLK_INFRA_I2C2_ARB	57
+#define	CLK_INFRA_I2C3_IMM	58
+#define	CLK_INFRA_I2C3_ARB	59
+#define	CLK_INFRA_I2C5	60
+#define	CLK_INFRA_SYS_CIRQ	61
+#define	CLK_INFRA_SPI1	62
+#define	CLK_INFRA_DRAMC_B_F26M	63
+#define	CLK_INFRA_ANC_MD32	64
+#define	CLK_INFRA_ANC_MD32_32K	65
+#define	CLK_INFRA_DVFS_SPM1	66
+#define	CLK_INFRA_AES_TOP0	67
+#define	CLK_INFRA_AES_TOP1	68
+#define	CLK_INFRA_SSUSB_BUS	69
+#define	CLK_INFRA_SPI2	70
+#define	CLK_INFRA_SPI3	71
+#define	CLK_INFRA_SPI4	72
+#define	CLK_INFRA_SPI5	73
+#define	CLK_INFRA_IRTX	74
+#define	CLK_INFRA_SSUSB_SYS	75
+#define	CLK_INFRA_SSUSB_REF	76
+#define	CLK_INFRA_AUDIO_26M	77
+#define	CLK_INFRA_AUDIO_26M_PAD_TOP	78
+#define	CLK_INFRA_MODEM_TEMP_SHARE	79
+#define	CLK_INFRA_VAD_WRAP_SOC	80
+#define	CLK_INFRA_DRAMC_CONF	81
+#define	CLK_INFRA_DRAMC_B_CONF	82
+#define CLK_INFRA_MFG_VCG 83
+#define CLK_INFRA_13M 84
+#define CLK_INFRA_NR 85
+
+/* IMG_SYS */
+#define	CLK_IMG_FDVT	1
+#define	CLK_IMG_DPE	2
+#define	CLK_IMG_DIP	3
+#define	CLK_IMG_LARB6	4
+#define CLK_IMG_NR	5
+
+/* MM_SYS */
+#define	CLK_MM_SMI_COMMON	1
+#define	CLK_MM_SMI_LARB0	2
+#define	CLK_MM_SMI_LARB5	3
+#define	CLK_MM_CAM_MDP	4
+#define	CLK_MM_MDP_RDMA0	5
+#define	CLK_MM_MDP_RDMA1	6
+#define	CLK_MM_MDP_RSZ0	7
+#define	CLK_MM_MDP_RSZ1	8
+#define	CLK_MM_MDP_RSZ2	9
+#define	CLK_MM_MDP_TDSHP	10
+#define	CLK_MM_MDP_COLOR	11
+#define	CLK_MM_MDP_WDMA	12
+#define	CLK_MM_MDP_WROT0	13
+#define	CLK_MM_MDP_WROT1	14
+#define	CLK_MM_FAKE_ENG	15
+#define	CLK_MM_DISP_OVL0	16
+#define	CLK_MM_DISP_OVL1	17
+#define	CLK_MM_DISP_OVL0_2L	18
+#define	CLK_MM_DISP_OVL1_2L	19
+#define	CLK_MM_DISP_RDMA0	20
+#define	CLK_MM_DISP_RDMA1	21
+#define	CLK_MM_DISP_WDMA0	22
+#define	CLK_MM_DISP_WDMA1	23
+#define	CLK_MM_DISP_COLOR	24
+#define	CLK_MM_DISP_CCORR	25
+#define	CLK_MM_DISP_AAL	26
+#define	CLK_MM_DISP_GAMMA	27
+#define	CLK_MM_DISP_OD	28
+#define	CLK_MM_DISP_DITHER	29
+#define	CLK_MM_DISP_UFOE	30
+#define	CLK_MM_DISP_DSC	31
+#define	CLK_MM_DISP_SPLIT	32
+#define	CLK_MM_DSI0_MM_CLOCK	33
+#define	CLK_MM_DSI1_MM_CLOCK	34
+#define	CLK_MM_DPI_MM_CLOCK	35
+#define	CLK_MM_DPI_INTERFACE_CLOCK	36
+#define	CLK_MM_LARB4_AXI_ASIF_MM_CLOCK	37
+#define	CLK_MM_LARB4_AXI_ASIF_MJC_CLOCK	38
+#define	CLK_MM_DISP_OVL0_MOUT_CLOCK	39
+#define	CLK_MM_FAKE_ENG2	40
+#define	CLK_MM_DSI0_INTERFACE_CLOCK	41
+#define	CLK_MM_DSI1_INTERFACE_CLOCK	42
+#define CLK_MM_NR		43
+
+/* VDEC_SYS */
+#define	CLK_VDEC_CKEN_ENG	1
+#define	CLK_VDEC_ACTIVE	2
+#define	CLK_VDEC_CKEN	3
+#define	CLK_VDEC_LARB1_CKEN	4
+#define CLK_VDEC_NR		5
+
+/* VENC_SYS */
+#define	CLK_VENC_0	1
+#define	CLK_VENC_1	2
+#define	CLK_VENC_2	3
+#define	CLK_VENC_3	4
+#define CLK_VENC_NR	5
+
+#endif	/* _DT_BINDINGS_CLK_MT6797_H */
-- 
1.7.9.5
