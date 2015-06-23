From: Paul Osmialowski <pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>
Subject: [PATCH 8/9] arm: twr-k70f120m: extend Freescale eDMA driver with ability to support Kinetis SoC
Date: Tue, 23 Jun 2015 23:19:46 +0200
Message-ID: <1435094387-20146-9-git-send-email-pawelo@king.net.pl>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435094387-20146-1-git-send-email-pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Nathan Lynch <nathan_lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Nicolas
Cc: Paul Osmialowski <pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>, Yuri Tikhonov <yur-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Sergei Poselenov <sposelenov-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Dmitry Cherkassov <d_cherkasov-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Alexander Potashev <aspotashev-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Surprisingly small amount of work was required in order to extend already
existing eDMA driver with the support for Kinetis SoC architecture.

Note that <mach/memory.h> is needed (which is denoted by
CONFIG_NEED_MACH_MEMORY_H) as it provides macros required for proper
operation of DMA allocation functions.

Signed-off-by: Paul Osmialowski <pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>
---
 Documentation/devicetree/bindings/dma/fsl-edma.txt | 38 +++++++++-
 arch/arm/Kconfig                                   |  4 ++
 arch/arm/boot/dts/kinetis.dtsi                     | 34 +++++++++
 arch/arm/mach-kinetis/include/mach/memory.h        | 61 ++++++++++++++++
 drivers/clk/clk-kinetis.c                          | 15 ++++
 drivers/dma/fsl-edma.c                             | 81 +++++++++++++++++++++-
 include/dt-bindings/clock/kinetis-mcg.h            |  5 +-
 7 files changed, 235 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/mach-kinetis/include/mach/memory.h

diff --git a/Documentation/devicetree/bindings/dma/fsl-edma.txt b/Documentation/devicetree/bindings/dma/fsl-edma.txt
index 191d7bd..e1ee406 100644
--- a/Documentation/devicetree/bindings/dma/fsl-edma.txt
+++ b/Documentation/devicetree/bindings/dma/fsl-edma.txt
@@ -9,6 +9,7 @@ group, DMAMUX0 or DMAMUX1, but not both.
 Required properties:
 - compatible :
 	- "fsl,vf610-edma" for eDMA used similar to that on Vybrid vf610 SoC
+	- "fsl,kinetis-edma" for eDMA used similar to that on Kinetis SoC
 - reg : Specifies base physical address(s) and size of the eDMA registers.
 	The 1st region is eDMA control register's address and size.
 	The 2nd and the 3rd regions are programmable channel multiplexing
@@ -16,7 +17,8 @@ Required properties:
 - interrupts : A list of interrupt-specifiers, one for each entry in
 	interrupt-names.
 - interrupt-names : Should contain:
-	"edma-tx" - the transmission interrupt
+	"edma-tx" - the transmission interrupt (Vybrid)
+	"edma-tx-n,m" - interrupt for channels n (0-15) and m (16-31) (Kinetis)
 	"edma-err" - the error interrupt
 - #dma-cells : Must be <2>.
 	The 1st cell specifies the DMAMUX(0 for DMAMUX0 and 1 for DMAMUX1).
@@ -28,6 +30,7 @@ Required properties:
 - clock-names : A list of channel group clock names. Should contain:
 	"dmamux0" - clock name of mux0 group
 	"dmamux1" - clock name of mux1 group
+	"edma"    - clock gate for whole controller (Kinetis only)
 - clocks : A list of phandle and clock-specifier pairs, one for each entry in
 	clock-names.
 
@@ -54,6 +57,39 @@ edma0: dma-controller@40018000 {
 		<&clks VF610_CLK_DMAMUX1>;
 };
 
+edma: dma-controller@40008000 {
+	compatible = "fsl,kinetis-edma";
+	reg = <0x40008000 0x2000>, /* DMAC */
+		<0x40021000 0x1000>, /* DMAMUX0 */
+		<0x40022000 0x1000>; /* DMAMUX1 */
+	#dma-cells = <2>;
+	dma-channels = <32>;
+	interrupts =	 <0>,  <1>,  <2>,  <3>,
+			 <4>,  <5>,  <6>,  <7>,
+			 <8>,  <9>, <10>, <11>,
+			<12>, <13>, <14>, <15>,
+			<16>;
+	interrupt-names = "edma-tx-0,16",
+			  "edma-tx-1,17",
+			  "edma-tx-2,18",
+			  "edma-tx-3,19",
+			  "edma-tx-4,20",
+			  "edma-tx-5,21",
+			  "edma-tx-6,22",
+			  "edma-tx-7,23",
+			  "edma-tx-8,24",
+			  "edma-tx-9,25",
+			  "edma-tx-10,26",
+			  "edma-tx-11,27",
+			  "edma-tx-12,28",
+			  "edma-tx-13,29",
+			  "edma-tx-14,30",
+			  "edma-tx-15,31",
+			  "edma-err";
+	clocks = <&mcg CLOCK_EDMA>,
+		 <&mcg CLOCK_DMAMUX0>, <&mcg CLOCK_DMAMUX1>;
+	clock-names = "edma", "dmamux0", "dmamux1";
+};
 
 * DMA clients
 DMA client drivers that uses the DMA function must use the format described
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 662447c..154436a 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -981,6 +981,10 @@ config ARCH_KINETIS
 	select ARMV7M_SYSTICK
 	select CLKSRC_KINETIS
 	select PINCTRL
+	select DMADEVICES
+	select FSL_EDMA
+	select DMA_OF
+	select NEED_MACH_MEMORY_H
 	select ZLIB_INFLATE_STACK_SAVING if ZLIB_INFLATE
 	help
 	  This enables support for the Freescale Kinetis MCUs
diff --git a/arch/arm/boot/dts/kinetis.dtsi b/arch/arm/boot/dts/kinetis.dtsi
index f3f22b5..7638103 100644
--- a/arch/arm/boot/dts/kinetis.dtsi
+++ b/arch/arm/boot/dts/kinetis.dtsi
@@ -20,6 +20,40 @@
 	};
 
 	soc {
+		edma: dma-controller@40008000 {
+			compatible = "fsl,kinetis-edma";
+			reg = <0x40008000 0x2000>, /* DMAC */
+				<0x40021000 0x1000>, /* DMAMUX0 */
+				<0x40022000 0x1000>; /* DMAMUX1 */
+			#dma-cells = <2>;
+			dma-channels = <32>;
+			interrupts =	 <0>,  <1>,  <2>,  <3>,
+					 <4>,  <5>,  <6>,  <7>,
+					 <8>,  <9>, <10>, <11>,
+					<12>, <13>, <14>, <15>,
+					<16>;
+			interrupt-names = "edma-tx-0,16",
+					  "edma-tx-1,17",
+					  "edma-tx-2,18",
+					  "edma-tx-3,19",
+					  "edma-tx-4,20",
+					  "edma-tx-5,21",
+					  "edma-tx-6,22",
+					  "edma-tx-7,23",
+					  "edma-tx-8,24",
+					  "edma-tx-9,25",
+					  "edma-tx-10,26",
+					  "edma-tx-11,27",
+					  "edma-tx-12,28",
+					  "edma-tx-13,29",
+					  "edma-tx-14,30",
+					  "edma-tx-15,31",
+					  "edma-err";
+			clocks = <&mcg CLOCK_EDMA>,
+				 <&mcg CLOCK_DMAMUX0>, <&mcg CLOCK_DMAMUX1>;
+			clock-names = "edma", "dmamux0", "dmamux1";
+		};
+
 		portA: pinmux@40049000 {
 			compatible = "fsl,kinetis-padconf";
 			reg = <0x40049000 0x1000>;
diff --git a/arch/arm/mach-kinetis/include/mach/memory.h b/arch/arm/mach-kinetis/include/mach/memory.h
new file mode 100644
index 0000000..8bad034
--- /dev/null
+++ b/arch/arm/mach-kinetis/include/mach/memory.h
@@ -0,0 +1,61 @@
+/*
+ * Based on original code by Alexander Potashev <aspotashev-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>
+ *
+ * (C) Copyright 2011, 2012
+ * Emcraft Systems, <www.emcraft.com>
+ * Alexander Potashev <aspotashev-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>
+ *
+ * Copyright (C) 2015 Paul Osmialowski <pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation.
+ */
+
+#ifndef _MACH_KINETIS_MEMORY_H
+#define _MACH_KINETIS_MEMORY_H
+
+#ifndef __ASSEMBLY__
+
+/*
+ * On Kinetis K70, consistent DMA memory resides in a special
+ * DDRAM alias region (non-cacheable DDRAM at 0x80000000).
+ *
+ */
+#define KINETIS_PHYS_DMA_OFFSET UL(0x80000000)
+
+/*
+ * Mask of the field used to distinguish DDRAM aliases
+ */
+#define KINETIS_DRAM_ALIAS_MASK UL(0xf8000000)
+
+/*
+ * This macro converts an address in the kernel run-time memory
+ * to an alias in the non-cacheable memory region
+ */
+#define KINETIS_DMA_ALIAS_ADDR(addr)					\
+		(((unsigned long)(addr) & ~KINETIS_DRAM_ALIAS_MASK) |	\
+		(KINETIS_PHYS_DMA_OFFSET & KINETIS_DRAM_ALIAS_MASK))
+
+/*
+ * This macro converts an address in the kernel code or
+ * in the non-cacheable DMA region to an alias in
+ * the run-time kernel memory region
+ */
+#define KINETIS_PHYS_ALIAS_ADDR(addr) \
+		((unsigned long)(addr) & ~KINETIS_DRAM_ALIAS_MASK)
+
+#define __arch_dma_to_pfn(dev, addr) __phys_to_pfn(addr)
+
+#define __arch_pfn_to_dma(dev, pfn) \
+		((dma_addr_t)KINETIS_DMA_ALIAS_ADDR(__pfn_to_phys(pfn)))
+
+#define __arch_dma_to_virt(dev, addr) \
+		((void *)KINETIS_PHYS_ALIAS_ADDR(addr))
+
+#define __arch_virt_to_dma(dev, addr) \
+		((dma_addr_t)KINETIS_DMA_ALIAS_ADDR(addr))
+
+#endif /* __ASSEMBLY__ */
+
+#endif /*_MACH_KINETIS_MEMORY_H */
diff --git a/drivers/clk/clk-kinetis.c b/drivers/clk/clk-kinetis.c
index b6620c0..454096c 100644
--- a/drivers/clk/clk-kinetis.c
+++ b/drivers/clk/clk-kinetis.c
@@ -248,6 +248,21 @@ static void __init kinetis_mcg_init(struct device_node *np)
 			KINETIS_SIM_PTR(scgc[KINETIS_CG_REG(KINETIS_CG_PORTF)]),
 			KINETIS_CG_IDX(KINETIS_CG_PORTF), 0, NULL);
 
+	/*
+	 * DMA clock gates, see K70 Sub-Family Reference Manual, Rev. 3 pg. 223:
+	 */
+	clk[CLOCK_EDMA] = clk_register_gate(NULL, "EDMA", "CCLK", 0,
+		KINETIS_SIM_PTR(scgc[KINETIS_CG_REG(KINETIS_CG_DMA)]),
+		KINETIS_CG_IDX(KINETIS_CG_DMA), 0, NULL);
+
+	clk[CLOCK_DMAMUX0] = clk_register_gate(NULL, "DMAMUX0", "PCLK", 0,
+		KINETIS_SIM_PTR(scgc[KINETIS_CG_REG(KINETIS_CG_DMAMUX0)]),
+		KINETIS_CG_IDX(KINETIS_CG_DMAMUX0), 0, NULL);
+
+	clk[CLOCK_DMAMUX1] = clk_register_gate(NULL, "DMAMUX1", "PCLK", 0,
+		KINETIS_SIM_PTR(scgc[KINETIS_CG_REG(KINETIS_CG_DMAMUX1)]),
+		KINETIS_CG_IDX(KINETIS_CG_DMAMUX1), 0, NULL);
+
 	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
 }
 
diff --git a/drivers/dma/fsl-edma.c b/drivers/dma/fsl-edma.c
index 915eec3..655d819 100644
--- a/drivers/dma/fsl-edma.c
+++ b/drivers/dma/fsl-edma.c
@@ -161,14 +161,42 @@ struct fsl_edma_desc {
 	struct fsl_edma_sw_tcd		tcd[];
 };
 
+#ifdef CONFIG_ARCH_KINETIS
+static const char * const txirq_names[] = {
+	"edma-tx-0,16",
+	"edma-tx-1,17",
+	"edma-tx-2,18",
+	"edma-tx-3,19",
+	"edma-tx-4,20",
+	"edma-tx-5,21",
+	"edma-tx-6,22",
+	"edma-tx-7,23",
+	"edma-tx-8,24",
+	"edma-tx-9,25",
+	"edma-tx-10,26",
+	"edma-tx-11,27",
+	"edma-tx-12,28",
+	"edma-tx-13,29",
+	"edma-tx-14,30",
+	"edma-tx-15,31",
+};
+#endif
+
 struct fsl_edma_engine {
 	struct dma_device	dma_dev;
 	void __iomem		*membase;
+#ifdef CONFIG_ARCH_KINETIS
+	struct clk		*clk;
+#endif
 	void __iomem		*muxbase[DMAMUX_NR];
 	struct clk		*muxclk[DMAMUX_NR];
 	struct mutex		fsl_edma_mutex;
 	u32			n_chans;
+#ifdef CONFIG_ARCH_KINETIS
+	int			txirq[ARRAY_SIZE(txirq_names)];
+#else
 	int			txirq;
+#endif
 	int			errirq;
 	bool			big_endian;
 	struct fsl_edma_chan	chans[];
@@ -709,6 +737,7 @@ static irqreturn_t fsl_edma_err_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+#ifndef CONFIG_ARCH_KINETIS
 static irqreturn_t fsl_edma_irq_handler(int irq, void *dev_id)
 {
 	if (fsl_edma_tx_handler(irq, dev_id) == IRQ_HANDLED)
@@ -716,6 +745,7 @@ static irqreturn_t fsl_edma_irq_handler(int irq, void *dev_id)
 
 	return fsl_edma_err_handler(irq, dev_id);
 }
+#endif
 
 static void fsl_edma_issue_pending(struct dma_chan *chan)
 {
@@ -788,15 +818,29 @@ static void fsl_edma_free_chan_resources(struct dma_chan *chan)
 }
 
 static int
-fsl_edma_irq_init(struct platform_device *pdev, struct fsl_edma_engine *fsl_edma)
+fsl_edma_irq_init(struct platform_device *pdev,
+		  struct fsl_edma_engine *fsl_edma)
 {
 	int ret;
+#ifdef CONFIG_ARCH_KINETIS
+	int i;
 
+	for (i = 0; i < ARRAY_SIZE(txirq_names); i++) {
+		fsl_edma->txirq[i] = platform_get_irq_byname(pdev,
+					txirq_names[i]);
+		if (fsl_edma->txirq[i] < 0) {
+			dev_err(&pdev->dev, "Can't get %s irq.\n",
+						txirq_names[i]);
+			return fsl_edma->txirq[i];
+		}
+	}
+#else
 	fsl_edma->txirq = platform_get_irq_byname(pdev, "edma-tx");
 	if (fsl_edma->txirq < 0) {
 		dev_err(&pdev->dev, "Can't get edma-tx irq.\n");
 		return fsl_edma->txirq;
 	}
+#endif
 
 	fsl_edma->errirq = platform_get_irq_byname(pdev, "edma-err");
 	if (fsl_edma->errirq < 0) {
@@ -804,6 +848,16 @@ fsl_edma_irq_init(struct platform_device *pdev, struct fsl_edma_engine *fsl_edma
 		return fsl_edma->errirq;
 	}
 
+#ifdef CONFIG_ARCH_KINETIS
+	for (i = 0; i < ARRAY_SIZE(txirq_names); i++) {
+		ret = devm_request_irq(&pdev->dev, fsl_edma->txirq[i],
+			fsl_edma_tx_handler, 0, txirq_names[i], fsl_edma);
+		if (ret) {
+			dev_err(&pdev->dev, "Can't register eDMA tx IRQ.\n");
+			return  ret;
+		}
+	}
+#else
 	if (fsl_edma->txirq == fsl_edma->errirq) {
 		ret = devm_request_irq(&pdev->dev, fsl_edma->txirq,
 				fsl_edma_irq_handler, 0, "eDMA", fsl_edma);
@@ -818,6 +872,7 @@ fsl_edma_irq_init(struct platform_device *pdev, struct fsl_edma_engine *fsl_edma
 			dev_err(&pdev->dev, "Can't register eDMA tx IRQ.\n");
 			return  ret;
 		}
+#endif
 
 		ret = devm_request_irq(&pdev->dev, fsl_edma->errirq,
 				fsl_edma_err_handler, 0, "eDMA err", fsl_edma);
@@ -825,7 +880,9 @@ fsl_edma_irq_init(struct platform_device *pdev, struct fsl_edma_engine *fsl_edma
 			dev_err(&pdev->dev, "Can't register eDMA err IRQ.\n");
 			return  ret;
 		}
+#ifndef CONFIG_ARCH_KINETIS
 	}
+#endif
 
 	return 0;
 }
@@ -858,6 +915,20 @@ static int fsl_edma_probe(struct platform_device *pdev)
 	if (IS_ERR(fsl_edma->membase))
 		return PTR_ERR(fsl_edma->membase);
 
+#ifdef CONFIG_ARCH_KINETIS
+	fsl_edma->clk = devm_clk_get(&pdev->dev, "edma");
+	if (IS_ERR(fsl_edma->clk)) {
+		dev_err(&pdev->dev, "Missing EDMA clock.\n");
+		return PTR_ERR(fsl_edma->clk);
+	}
+
+	ret = clk_prepare_enable(fsl_edma->clk);
+	if (ret) {
+		dev_err(&pdev->dev, "EDMA clk failed.\n");
+		return ret;
+	}
+#endif
+
 	for (i = 0; i < DMAMUX_NR; i++) {
 		char clkname[32];
 
@@ -956,11 +1027,19 @@ static int fsl_edma_remove(struct platform_device *pdev)
 	for (i = 0; i < DMAMUX_NR; i++)
 		clk_disable_unprepare(fsl_edma->muxclk[i]);
 
+#ifdef CONFIG_ARCH_KINETIS
+	clk_disable_unprepare(fsl_edma->clk);
+#endif
+
 	return 0;
 }
 
 static const struct of_device_id fsl_edma_dt_ids[] = {
+#ifdef CONFIG_ARCH_KINETIS
+	{ .compatible = "fsl,kinetis-edma", },
+#else
 	{ .compatible = "fsl,vf610-edma", },
+#endif
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_edma_dt_ids);
diff --git a/include/dt-bindings/clock/kinetis-mcg.h b/include/dt-bindings/clock/kinetis-mcg.h
index 5eaeeec..d853c3c 100644
--- a/include/dt-bindings/clock/kinetis-mcg.h
+++ b/include/dt-bindings/clock/kinetis-mcg.h
@@ -11,6 +11,9 @@
 #define CLOCK_PORTD		 7
 #define CLOCK_PORTE		 8
 #define CLOCK_PORTF		 9
-#define CLOCK_END		10
+#define CLOCK_EDMA		10
+#define CLOCK_DMAMUX0		11
+#define CLOCK_DMAMUX1		12
+#define CLOCK_END		13
 
 #endif /* _DT_BINDINGS_CLOCK_KINETIS_MCG_H */
-- 
2.3.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
