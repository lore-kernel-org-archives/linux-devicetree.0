Return-Path: <newchief@king.net.pl>
From: Paul Osmialowski <pawelo@king.net.pl>
Subject: [PATCH 6/9] arm: twr-k70f120m: clock source drivers for Kinetis SoC
Date: Tue, 23 Jun 2015 23:19:44 +0200
Message-Id: <1435094387-20146-7-git-send-email-pawelo@king.net.pl>
In-Reply-To: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
To: Andrew Morton <akpm@linux-foundation.org>, Anson Huang <b20788@freescale.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Bhupesh Sharma <bhupesh.sharma@freescale.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Frank Li <Frank.Li@freescale.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Haojian Zhuang <haojian.zhuang@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jingchang Lu <jingchang.lu@freescale.com>, Jiri Slaby <jslaby@suse.cz>, Kees Cook <keescook@chromium.org>, Kumar Gala <galak@codeaurora.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <damm+renesas@opensource.se>, Michael Turquette <mturquette@baylibre.com>, Nathan Lynch <nathan_lynch@mentor.com>, Nicolas Pitre <nico@linaro.org>, Maxime Coquelin stm32 <mcoquelin.stm32@gmail.com>, Olof Johansson <olof@lixom.net>, Paul Bolle <pebolle@tiscali.nl>, Rob Herring <r.herring@freescale.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Shawn Guo <shawn.guo@linaro.org>, Simon Horman <horms+renesas@verge.net.au>, Stefan Agner <stefan@agner.ch>, Stephen Boyd <sboyd@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, Dave Martin <Dave.Martin@arm.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org
Cc: Paul Osmialowski <pawelo@king.net.pl>, Yuri Tikhonov <yur@emcraft.com>, Sergei Poselenov <sposelenov@emcraft.com>, Dmitry Cherkassov <d_cherkasov@emcraft.com>, Alexander Potashev <aspotashev@emcraft.com>
List-ID: <devicetree@vger.kernel.org>

Based on K70P256M150SF3RM.pdf

Signed-off-by: Paul Osmialowski <pawelo@king.net.pl>
---
 .../devicetree/bindings/clock/kinetis-clock.txt    |  25 ++
 .../bindings/timer/fsl,kinetis-pit-timer.txt       |  18 ++
 arch/arm/Kconfig                                   |   1 +
 arch/arm/boot/dts/kinetis-twr-k70f120m.dts         |   4 +
 arch/arm/boot/dts/kinetis.dtsi                     |  50 ++++
 arch/arm/mach-kinetis/include/mach/power.h         |  83 ++++++
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-kinetis.c                          | 226 ++++++++++++++++
 drivers/clocksource/Kconfig                        |   5 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/timer-kinetis.c                | 294 +++++++++++++++++++++
 include/dt-bindings/clock/kinetis-mcg.h            |  10 +
 12 files changed, 718 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/kinetis-clock.txt
 create mode 100644 Documentation/devicetree/bindings/timer/fsl,kinetis-pit-timer.txt
 create mode 100644 arch/arm/mach-kinetis/include/mach/power.h
 create mode 100644 drivers/clk/clk-kinetis.c
 create mode 100644 drivers/clocksource/timer-kinetis.c
 create mode 100644 include/dt-bindings/clock/kinetis-mcg.h

diff --git a/Documentation/devicetree/bindings/clock/kinetis-clock.txt b/Documentation/devicetree/bindings/clock/kinetis-clock.txt
new file mode 100644
index 0000000..9c9c4fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/kinetis-clock.txt
@@ -0,0 +1,25 @@
+* Clock bindings for Freescale Kinetis SoC
+
+Required properties:
+- compatible: Should be "fsl,kinetis-cmu".
+- reg: Address and length of the register set.
+- #clock-cells: Should be <1>.
+
+Example:
+
+mcg: cmu@40064000 {
+	compatible = "fsl,kinetis-cmu";
+	reg = <0x40064000 0x14>;
+	#clock-cells = <1>;
+};
+
+uart1: serial@4006b000 {
+	compatible = "fsl,kinetis-lpuart";
+	reg = <0x4006b000 0x1000>;
+	interrupts = <47>, <48>;
+	interrupt-names = "uart-stat", "uart-err";
+	clocks = <&mcg CLOCK_UART1>;
+	clock-names = "ipg";
+	dmas = <&edma 0 4>;
+	dma-names = "rx";
+};
diff --git a/Documentation/devicetree/bindings/timer/fsl,kinetis-pit-timer.txt b/Documentation/devicetree/bindings/timer/fsl,kinetis-pit-timer.txt
new file mode 100644
index 0000000..49dddf6
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/fsl,kinetis-pit-timer.txt
@@ -0,0 +1,18 @@
+Freescale Kinetis SoC Periodic Interrupt Timer (PIT)
+
+Required properties:
+
+- compatible: Should be "fsl,kinetis-pit-timer".
+- reg: Specifies base physical address and size of the register sets for the
+  clock event device.
+- interrupts: Should be the clock event device interrupt.
+- clocks: The clocks provided by the SoC to drive the timer.
+
+Example:
+
+pit0: timer@40037100 {
+	compatible = "fsl,kinetis-pit-timer";
+	reg = <0x40037100 0x10>;
+	interrupts = <68>;
+	clocks = <&mcg CLOCK_PIT>;
+};
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 747cdea..8630aff 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -979,6 +979,7 @@ config ARCH_KINETIS
 	select CPU_CORTEXM3
 	select ARM_CPU_IDLE_QUIRKS
 	select ARMV7M_SYSTICK
+	select CLKSRC_KINETIS
 	select ZLIB_INFLATE_STACK_SAVING if ZLIB_INFLATE
 	help
 	  This enables support for the Freescale Kinetis MCUs
diff --git a/arch/arm/boot/dts/kinetis-twr-k70f120m.dts b/arch/arm/boot/dts/kinetis-twr-k70f120m.dts
index edccf37..a6efc29 100644
--- a/arch/arm/boot/dts/kinetis-twr-k70f120m.dts
+++ b/arch/arm/boot/dts/kinetis-twr-k70f120m.dts
@@ -14,3 +14,7 @@
 		reg = <0x8000000 0x8000000>;
 	};
 };
+
+&pit0 {
+	status = "ok";
+};
diff --git a/arch/arm/boot/dts/kinetis.dtsi b/arch/arm/boot/dts/kinetis.dtsi
index 93d2a8a..770760f 100644
--- a/arch/arm/boot/dts/kinetis.dtsi
+++ b/arch/arm/boot/dts/kinetis.dtsi
@@ -3,3 +3,53 @@
  *
  */
 #include "armv7-m.dtsi"
+#include "dt-bindings/clock/kinetis-mcg.h"
+
+/ {
+	aliases {
+		pit0 = &pit0;
+		pit1 = &pit1;
+		pit2 = &pit2;
+		pit3 = &pit3;
+	};
+
+	soc {
+		pit0: timer@40037100 {
+			compatible = "fsl,kinetis-pit-timer";
+			reg = <0x40037100 0x10>;
+			interrupts = <68>;
+			clocks = <&mcg CLOCK_PIT>;
+			status = "disabled";
+		};
+
+		pit1: timer@40037110 {
+			compatible = "fsl,kinetis-pit-timer";
+			reg = <0x40037110 0x10>;
+			interrupts = <69>;
+			clocks = <&mcg CLOCK_PIT>;
+			status = "disabled";
+		};
+
+		pit2: timer@40037120 {
+			compatible = "fsl,kinetis-pit-timer";
+			reg = <0x40037120 0x10>;
+			interrupts = <70>;
+			clocks = <&mcg CLOCK_PIT>;
+			status = "disabled";
+		};
+
+		pit3: timer@40037130 {
+			compatible = "fsl,kinetis-pit-timer";
+			reg = <0x40037130 0x10>;
+			interrupts = <71>;
+			clocks = <&mcg CLOCK_PIT>;
+			status = "disabled";
+		};
+
+		mcg: cmu@40064000 {
+			compatible = "fsl,kinetis-cmu";
+			reg = <0x40064000 0x14>;
+			#clock-cells = <1>;
+		};
+	};
+};
diff --git a/arch/arm/mach-kinetis/include/mach/power.h b/arch/arm/mach-kinetis/include/mach/power.h
new file mode 100644
index 0000000..e67bd4e
--- /dev/null
+++ b/arch/arm/mach-kinetis/include/mach/power.h
@@ -0,0 +1,83 @@
+/*
+ * (C) Copyright 2011, 2012
+ * Emcraft Systems, <www.emcraft.com>
+ * Alexander Potashev <aspotashev@emcraft.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation.
+ */
+
+#ifndef _MACH_KINETIS_POWER_H
+#define _MACH_KINETIS_POWER_H
+
+/*
+ * Pack the SIM_SCGC[] register index and the bit index in that register into
+ * a single word. This is similar to the implementation of `dev_t` in
+ * the Linux kernel with its `MAJOR(dev)`, `MINOR(dev)` and
+ * `MKDEV(major,minor)` macros.
+ *
+ * This is useful when you want to have an array of `kinetis_clock_gate_t`s:
+ * you do not have to use a 2-dimensional array or a real structure.
+ */
+typedef u32 kinetis_clock_gate_t;
+#define KINETIS_CG_IDX_BITS	16
+#define KINETIS_CG_IDX_MASK	((1U << KINETIS_CG_IDX_BITS) - 1)
+/*
+ * Extract the register number and the bit index from a `kinetis_clock_gate_t`.
+ * The register number counts from 0,
+ * i.e. the register number for SIM_SCGC7 is 6.
+ */
+#define KINETIS_CG_REG(gate)	((unsigned int) ((gate) >> KINETIS_CG_IDX_BITS))
+#define KINETIS_CG_IDX(gate)	((unsigned int) ((gate) & KINETIS_CG_IDX_MASK))
+/*
+ * Build a `kinetis_clock_gate_t` from a register number and a bit index
+ */
+#define KINETIS_MKCG(reg, idx) \
+	(((kinetis_clock_gate_t)(reg) << KINETIS_CG_IDX_BITS) | \
+	(kinetis_clock_gate_t)(idx))
+
+/*
+ * Clock gates for the modules inside the MCU
+ */
+/* UARTs */
+#define KINETIS_CG_UART0	KINETIS_MKCG(3, 10)	/* SIM_SCGC4[10] */
+#define KINETIS_CG_UART1	KINETIS_MKCG(3, 11)	/* SIM_SCGC4[11] */
+#define KINETIS_CG_UART2	KINETIS_MKCG(3, 12)	/* SIM_SCGC4[12] */
+#define KINETIS_CG_UART3	KINETIS_MKCG(3, 13)	/* SIM_SCGC4[13] */
+#define KINETIS_CG_UART4	KINETIS_MKCG(0, 10)	/* SIM_SCGC1[10] */
+#define KINETIS_CG_UART5	KINETIS_MKCG(0, 11)	/* SIM_SCGC1[11] */
+/* Ports */
+#define KINETIS_CG_PORTA	KINETIS_MKCG(4, 9)	/* SIM_SCGC5[9] */
+#define KINETIS_CG_PORTB	KINETIS_MKCG(4, 10)	/* SIM_SCGC5[10] */
+#define KINETIS_CG_PORTC	KINETIS_MKCG(4, 11)	/* SIM_SCGC5[11] */
+#define KINETIS_CG_PORTD	KINETIS_MKCG(4, 12)	/* SIM_SCGC5[12] */
+#define KINETIS_CG_PORTE	KINETIS_MKCG(4, 13)	/* SIM_SCGC5[13] */
+#define KINETIS_CG_PORTF	KINETIS_MKCG(4, 14)	/* SIM_SCGC5[14] */
+/* ENET */
+#define KINETIS_CG_ENET		KINETIS_MKCG(1, 0)	/* SIM_SCGC2[0] */
+/* Periodic Interrupt Timer (PIT) */
+#define KINETIS_CG_PIT		KINETIS_MKCG(5, 23)	/* SIM_SCGC6[23] */
+/* LCD Controller */
+#define KINETIS_CG_LCDC		KINETIS_MKCG(2, 22)	/* SIM_SCGC3[22] */
+/* DMA controller and DMA request multiplexer */
+#define KINETIS_CG_DMA		KINETIS_MKCG(6, 1)	/* SIM_SCGC7[1] */
+#define KINETIS_CG_DMAMUX0	KINETIS_MKCG(5, 1)	/* SIM_SCGC6[1] */
+#define KINETIS_CG_DMAMUX1	KINETIS_MKCG(5, 2)	/* SIM_SCGC6[2] */
+/* USB High Speed */
+#define KINETIS_CG_USBHS	KINETIS_MKCG(5, 20)	/* SIM_SCGC6[20] */
+/* USB Full Speed */
+#define KINETIS_CG_USBFS	KINETIS_MKCG(3, 18)	/* SIM_SCGC4[18] */
+/* ADC modules */
+#define KINETIS_CG_ADC0		KINETIS_MKCG(5, 27)	/* SIM_SCGC6[27] */
+#define KINETIS_CG_ADC1		KINETIS_MKCG(2, 27)	/* SIM_SCGC3[27] */
+#define KINETIS_CG_ADC2		KINETIS_MKCG(5, 28)	/* SIM_SCGC6[28] */
+#define KINETIS_CG_ADC3		KINETIS_MKCG(2, 28)	/* SIM_SCGC3[28] */
+/* ESDHC */
+#define KINETIS_CG_ESDHC	KINETIS_MKCG(2, 17)	/* SIM_SCGC3[17] */
+/* SPI */
+#define KINETIS_CG_SPI0		KINETIS_MKCG(5, 12)	/* SIM_SCGC6[12] */
+#define KINETIS_CG_SPI1		KINETIS_MKCG(5, 13)	/* SIM_SCGC6[13] */
+#define KINETIS_CG_SPI2		KINETIS_MKCG(2, 12)	/* SIM_SCGC3[12] */
+
+#endif /*_MACH_KINETIS_POWER_H */
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index b241c17..58718ed 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_COMMON_CLK_CDCE706)	+= clk-cdce706.o
 obj-$(CONFIG_ARCH_CLPS711X)		+= clk-clps711x.o
 obj-$(CONFIG_ARCH_EFM32)		+= clk-efm32gg.o
 obj-$(CONFIG_ARCH_HIGHBANK)		+= clk-highbank.o
+obj-$(CONFIG_ARCH_KINETIS)		+= clk-kinetis.o
 obj-$(CONFIG_MACH_LOONGSON32)		+= clk-ls1x.o
 obj-$(CONFIG_COMMON_CLK_MAX_GEN)	+= clk-max-gen.o
 obj-$(CONFIG_COMMON_CLK_MAX77686)	+= clk-max77686.o
diff --git a/drivers/clk/clk-kinetis.c b/drivers/clk/clk-kinetis.c
new file mode 100644
index 0000000..dea1054
--- /dev/null
+++ b/drivers/clk/clk-kinetis.c
@@ -0,0 +1,226 @@
+/*
+ * clk-kinetis.c - Clock driver for Kinetis K70 MCG
+ *
+ * Based on legacy pre-OF code by Alexander Potashev <aspotashev@emcraft.com>
+ *
+ * Copyright (C) 2015 Paul Osmialowski <pawelo@king.net.pl>
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation.
+ */
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/err.h>
+#include <mach/kinetis.h>
+#include <mach/power.h>
+
+#include <dt-bindings/clock/kinetis-mcg.h>
+
+/*
+ * Frequencies on OSC0 (EXTAL0/XTAL0) and OSC1 (EXTAL1/XTAL1)
+ *
+ * These frequencies should be set to the same values as in U-Boot.
+ */
+#define KINETIS_OSC0_RATE	50000000	/* 50 MHz */
+#define KINETIS_OSC1_RATE	12000000	/* 12 MHz */
+
+/*
+ * MCG Control 5 Register
+ */
+/* PLL External Reference Divider */
+#define KINETIS_MCG_C5_PRDIV_BITS	0
+#define KINETIS_MCG_C5_PRDIV_MSK \
+	(((1 << 3) - 1) << KINETIS_MCG_C5_PRDIV_BITS)
+/* PLL Stop Enable */
+#define KINETIS_MCG_C5_PLLSTEN_MSK	(1 << 5)
+/* PLL Clock Enable */
+#define KINETIS_MCG_C5_PLLCLKEN_MSK	(1 << 6)
+/* PLL External Reference Select (for K70@120MHz) */
+#define KINETIS_MCG_C5_PLLREFSEL_BIT	7
+#define KINETIS_MCG_C5_PLLREFSEL_MSK	(1 << KINETIS_MCG_C5_PLLREFSEL_BIT)
+/*
+ * MCG Control 6 Register
+ */
+/* VCO Divider */
+#define KINETIS_MCG_C6_VDIV_BITS	0
+#define KINETIS_MCG_C6_VDIV_MSK \
+	(((1 << 5) - 1) << KINETIS_MCG_C6_VDIV_BITS)
+/* PLL Select */
+#define KINETIS_MCG_C6_PLLS_MSK		(1 << 6)
+/*
+ * MCG Control 11 Register
+ */
+/* PLL1 External Reference Divider */
+#define KINETIS_MCG_C11_PRDIV_BITS	0
+#define KINETIS_MCG_C11_PRDIV_MSK \
+	(((1 << 3) - 1) << KINETIS_MCG_C11_PRDIV_BITS)
+/* PLL Clock Select: PLL0 or PLL1 */
+#define KINETIS_MCG_C11_PLLCS_MSK	(1 << 4)
+/* PLL1 Stop Enable */
+#define KINETIS_MCG_C11_PLLSTEN1_MSK	(1 << 5)
+/* PLL1 Clock Enable */
+#define KINETIS_MCG_C11_PLLCLKEN1_MSK	(1 << 6)
+/* PLL1 External Reference Select (for K70@120MHz) */
+#define KINETIS_MCG_C11_PLLREFSEL1_BIT	7
+#define KINETIS_MCG_C11_PLLREFSEL1_MSK	(1 << KINETIS_MCG_C11_PLLREFSEL1_BIT)
+/*
+ * MCG Control 12 Register
+ */
+/* VCO1 Divider */
+#define KINETIS_MCG_C12_VDIV1_BITS	0
+#define KINETIS_MCG_C12_VDIV1_MSK \
+	(((1 << 5) - 1) << KINETIS_MCG_C12_VDIV1_BITS)
+
+/*
+ * Multipurpose Clock Generator (MCG) register map
+ *
+ * See Chapter 25 of the K70 Reference Manual
+ */
+struct kinetis_mcg_regs {
+	u8 c1;		/* MCG Control 1 Register */
+	u8 c2;		/* MCG Control 2 Register */
+	u8 c3;		/* MCG Control 3 Register */
+	u8 c4;		/* MCG Control 4 Register */
+	u8 c5;		/* MCG Control 5 Register */
+	u8 c6;		/* MCG Control 6 Register */
+	u8 status;	/* MCG Status Register */
+	u8 rsv0;
+	u8 atc;		/* MCG Auto Trim Control Register */
+	u8 rsv1;
+	u8 atcvh;	/* MCG Auto Trim Compare Value High Register */
+	u8 atcvl;	/* MCG Auto Trim Compare Value Low Register */
+	u8 c7;		/* MCG Control 7 Register */
+	u8 c8;		/* MCG Control 8 Register */
+	u8 rsv2;
+	u8 c10;		/* MCG Control 10 Register */
+	u8 c11;		/* MCG Control 11 Register */
+	u8 c12;		/* MCG Control 12 Register */
+	u8 status2;	/* MCG Status 2 Register */
+	u8 rsv3;
+};
+
+#define KINETIS_MCG_PTR(base, reg) \
+	(&(((struct kinetis_mcg_regs *)(base))->reg))
+#define KINETIS_MCG_RD(base, reg) readb_relaxed(KINETIS_MCG_PTR(base, reg))
+#define KINETIS_MCG_WR(base, reg, val) \
+	writeb_relaxed((val), KINETIS_MCG_PTR(base, reg))
+#define KINETIS_MCG_ISSET(base, reg, mask) \
+	(KINETIS_MCG_RD(base, reg) & (mask))
+
+static struct clk *clk[CLOCK_END];
+static struct clk_onecell_data clk_data = {
+	.clks = clk,
+	.clk_num = ARRAY_SIZE(clk),
+};
+
+static void __init kinetis_mcg_init(struct device_node *np)
+{
+	const int vco_div = 2;
+	const int vdiv_min = 16;
+	u32 clock_val[CLOCK_END];
+	int i;
+	void __iomem *base;
+	int pll_sel;
+	int osc_sel;
+	unsigned long mcgout;
+
+	for (i = 0; i < ARRAY_SIZE(clk); ++i)
+		clk[i] = ERR_PTR(-ENOENT);
+
+	base = of_iomap(np, 0);
+	if (!base) {
+		pr_warn("Failed to map address range for kinetis,mcg node\n");
+		return;
+	}
+
+	/*
+	 * Check whether PLL0 or PLL1 is used for MCGOUTCLK
+	 */
+	pll_sel = !!(KINETIS_MCG_ISSET(base, c11, KINETIS_MCG_C11_PLLCS_MSK));
+
+	/*
+	 * Check whether OSC0 or OSC1 is used to source the main PLL
+	 */
+	if (pll_sel)
+		osc_sel = !!(KINETIS_MCG_ISSET(base, c11,
+				KINETIS_MCG_C11_PLLREFSEL1_MSK));
+	else
+		osc_sel = !!(KINETIS_MCG_ISSET(base, c5,
+				KINETIS_MCG_C5_PLLREFSEL_MSK));
+
+	/*
+	 * Start with the MCG input clock
+	 */
+	mcgout = osc_sel ? KINETIS_OSC1_RATE : KINETIS_OSC0_RATE;
+
+	/*
+	 * Apply dividers and multipliers of the selected PLL
+	 */
+	if (pll_sel) {
+		/*
+		 * PLL1 internal divider (PRDIV)
+		 */
+		mcgout /= ((KINETIS_MCG_RD(base, c11) &
+		  KINETIS_MCG_C11_PRDIV_MSK) >> KINETIS_MCG_C11_PRDIV_BITS) + 1;
+		/*
+		 * PLL1 multiplication factor (VDIV)
+		 */
+		mcgout *= ((KINETIS_MCG_RD(base, c12) &
+		  KINETIS_MCG_C12_VDIV1_MSK) >> KINETIS_MCG_C12_VDIV1_BITS) +
+								    vdiv_min;
+	} else {
+		/*
+		 * PLL0 internal divider (PRDIV)
+		 */
+		mcgout /= ((KINETIS_MCG_RD(base, c5) &
+			KINETIS_MCG_C5_PRDIV_MSK) >>
+			KINETIS_MCG_C5_PRDIV_BITS) + 1;
+		/*
+		 * PLL0 multiplication factor (VDIV)
+		 */
+		mcgout *= ((KINETIS_MCG_RD(base, c6) &
+			KINETIS_MCG_C6_VDIV_MSK) >>
+			KINETIS_MCG_C6_VDIV_BITS) + vdiv_min;
+	}
+
+	/*
+	 * Apply the PLL output divider
+	 */
+	mcgout /= vco_div;
+
+	clock_val[CLOCK_MCGOUTCLK] = mcgout;
+
+	clock_val[CLOCK_CCLK] = mcgout /
+		(((KINETIS_SIM_RD(clkdiv1) & KINETIS_SIM_CLKDIV1_OUTDIV1_MSK) >>
+		KINETIS_SIM_CLKDIV1_OUTDIV1_BITS) + 1);
+
+	/*
+	 * Peripheral (bus) clock
+	 */
+	clock_val[CLOCK_PCLK] = mcgout /
+		(((KINETIS_SIM_RD(clkdiv1) & KINETIS_SIM_CLKDIV1_OUTDIV2_MSK) >>
+		KINETIS_SIM_CLKDIV1_OUTDIV2_BITS) + 1);
+
+	clk[CLOCK_MCGOUTCLK] = clk_register_fixed_rate(NULL, "MCGOUTCLK",
+			NULL, CLK_IS_ROOT, clock_val[CLOCK_MCGOUTCLK]);
+
+	clk[CLOCK_CCLK] = clk_register_fixed_rate(NULL, "CCLK", "MCGOUTCLK",
+			0, clock_val[CLOCK_CCLK]);
+
+	clk[CLOCK_PCLK] = clk_register_fixed_rate(NULL, "PCLK", "MCGOUTCLK",
+			0, clock_val[CLOCK_PCLK]);
+
+	clk[CLOCK_PIT] = clk_register_gate(NULL, "PIT", "PCLK", 0,
+			KINETIS_SIM_PTR(scgc[KINETIS_CG_REG(KINETIS_CG_PIT)]),
+			KINETIS_CG_IDX(KINETIS_CG_PIT), 0, NULL);
+
+	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
+}
+
+CLK_OF_DECLARE(kinetis_mcg, "fsl,kinetis-cmu", kinetis_mcg_init);
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 0f1c77e..1d2ecde 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -106,6 +106,11 @@ config CLKSRC_EFM32
 	  Support to use the timers of EFM32 SoCs as clock source and clock
 	  event device.
 
+config CLKSRC_KINETIS
+	bool "Clocksource for Kinetis SoCs"
+	depends on OF && ARM && ARCH_KINETIS
+	select CLKSRC_OF
+
 config CLKSRC_LPC32XX
 	bool
 	select CLKSRC_MMIO
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index f1ae0e7..6da77a8 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_ARCH_NSPIRE)	+= zevio-timer.o
 obj-$(CONFIG_ARCH_BCM_MOBILE)	+= bcm_kona_timer.o
 obj-$(CONFIG_CADENCE_TTC_TIMER)	+= cadence_ttc_timer.o
 obj-$(CONFIG_CLKSRC_EFM32)	+= time-efm32.o
+obj-$(CONFIG_CLKSRC_KINETIS)	+= timer-kinetis.o
 obj-$(CONFIG_CLKSRC_STM32)	+= timer-stm32.o
 obj-$(CONFIG_CLKSRC_EXYNOS_MCT)	+= exynos_mct.o
 obj-$(CONFIG_CLKSRC_LPC32XX)	+= time-lpc32xx.o
diff --git a/drivers/clocksource/timer-kinetis.c b/drivers/clocksource/timer-kinetis.c
new file mode 100644
index 0000000..634f365
--- /dev/null
+++ b/drivers/clocksource/timer-kinetis.c
@@ -0,0 +1,294 @@
+/*
+ * timer-kinetis.c - Timer driver for Kinetis K70
+ *
+ * Based on legacy pre-OF code by Alexander Potashev <aspotashev@emcraft.com>
+ *
+ * Copyright (C) 2015 Paul Osmialowski <pawelo@king.net.pl>
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation.
+ */
+
+#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+
+#include <linux/kernel.h>
+#include <linux/io.h>
+#include <linux/clocksource.h>
+#include <linux/clockchips.h>
+#include <linux/irq.h>
+#include <linux/interrupt.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/clk.h>
+#include <linux/sched.h>
+#include <mach/kinetis.h>
+
+#define KINETIS_PIT_CHANNELS 4
+
+#define KINETIS_PIT0_IRQ 68
+#define KINETIS_PIT1_IRQ 69
+#define KINETIS_PIT2_IRQ 70
+#define KINETIS_PIT3_IRQ 71
+
+/*
+ * PIT Timer Control Register
+ */
+/* Timer Interrupt Enable Bit */
+#define KINETIS_PIT_TCTRL_TIE_MSK	(1 << 1)
+/* Timer Enable Bit */
+#define KINETIS_PIT_TCTRL_TEN_MSK	(1 << 0)
+/*
+ * PIT Timer Flag Register
+ */
+/* Timer Interrupt Flag */
+#define KINETIS_PIT_TFLG_TIF_MSK	(1 << 0)
+
+/*
+ * PIT control registers base
+ */
+#define KINETIS_PIT_BASE		(KINETIS_AIPS0PERIPH_BASE + 0x00037000)
+#define KINETIS_PIT_MCR			IOMEM(KINETIS_PIT_BASE + 0x0)
+
+/*
+ * Periodic Interrupt Timer (PIT) registers
+ */
+struct kinetis_pit_channel_regs {
+	u32 ldval;	/* Timer Load Value Register */
+	u32 cval;	/* Current Timer Value Register */
+	u32 tctrl;	/* Timer Control Register */
+	u32 tflg;	/* Timer Flag Register */
+};
+
+#define KINETIS_PIT_PTR(base, reg) \
+	(&(((struct kinetis_pit_channel_regs *)(base))->reg))
+#define KINETIS_PIT_RD(base, reg) readl(KINETIS_PIT_PTR(base, reg))
+#define KINETIS_PIT_WR(base, reg, val) \
+	writel((val), KINETIS_PIT_PTR(base, reg))
+#define KINETIS_PIT_SET(base, reg, mask) \
+	KINETIS_PIT_WR(base, reg, (KINETIS_PIT_RD(base, reg)) | (mask))
+#define KINETIS_PIT_RESET(base, reg, mask) \
+	KINETIS_PIT_WR(base, reg, (KINETIS_PIT_RD(base, reg)) & (~(mask)))
+
+struct kinetis_clock_event_ddata {
+	struct clock_event_device evtdev;
+	void __iomem *base;
+};
+
+/*
+ * Enable or disable a PIT channel
+ */
+static void kinetis_pit_enable(void __iomem *base, int enable)
+{
+	if (enable)
+		KINETIS_PIT_SET(base, tctrl, KINETIS_PIT_TCTRL_TEN_MSK);
+	else
+		KINETIS_PIT_RESET(base, tctrl, KINETIS_PIT_TCTRL_TEN_MSK);
+}
+
+/*
+ * Initialize a PIT channel, but do not enable it
+ */
+static void kinetis_pit_init(void __iomem *base, u32 ticks)
+{
+	/*
+	 * Enable the PIT module clock
+	 */
+	writel(0, KINETIS_PIT_MCR);
+
+	KINETIS_PIT_WR(base, tctrl, 0);
+	KINETIS_PIT_WR(base, tflg, KINETIS_PIT_TFLG_TIF_MSK);
+	KINETIS_PIT_WR(base, ldval, ticks);
+	KINETIS_PIT_WR(base, cval, 0);
+	KINETIS_PIT_WR(base, tctrl, KINETIS_PIT_TCTRL_TIE_MSK);
+}
+
+/*
+ * Clock event device set mode function
+ */
+static void kinetis_clockevent_tmr_set_mode(
+	enum clock_event_mode mode, struct clock_event_device *clk)
+{
+	struct kinetis_clock_event_ddata *pit =
+		container_of(clk, struct kinetis_clock_event_ddata, evtdev);
+
+	switch (mode) {
+	case CLOCK_EVT_MODE_PERIODIC:
+		kinetis_pit_enable(pit->base, 1);
+		break;
+	case CLOCK_EVT_MODE_ONESHOT:
+	case CLOCK_EVT_MODE_UNUSED:
+	case CLOCK_EVT_MODE_SHUTDOWN:
+	default:
+		kinetis_pit_enable(pit->base, 0);
+	}
+}
+
+/*
+ * Configure the timer to generate an interrupt in the specified amount of ticks
+ */
+static int kinetis_clockevent_tmr_set_next_event(
+	unsigned long delta, struct clock_event_device *c)
+{
+	struct kinetis_clock_event_ddata *pit =
+		container_of(c, struct kinetis_clock_event_ddata, evtdev);
+	unsigned long flags;
+
+	raw_local_irq_save(flags);
+	kinetis_pit_init(pit->base, delta);
+	kinetis_pit_enable(pit->base, 1);
+	raw_local_irq_restore(flags);
+
+	return 0;
+}
+
+static struct kinetis_clock_event_ddata
+		kinetis_clockevent_tmrs[KINETIS_PIT_CHANNELS] = {
+	{
+		.evtdev = {
+			.name		= "fsl,kinetis-pit-timer0",
+			.rating		= 200,
+			.features	=
+			    CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
+			.set_mode	= kinetis_clockevent_tmr_set_mode,
+			.set_next_event	= kinetis_clockevent_tmr_set_next_event,
+		},
+	},
+	{
+		.evtdev = {
+			.name		= "fsl,kinetis-pit-timer1",
+		},
+	},
+	{
+		.evtdev = {
+			.name		= "fsl,kinetis-pit-timer2",
+		},
+	},
+	{
+		.evtdev = {
+			.name		= "fsl,kinetis-pit-timer3",
+		},
+	},
+};
+
+/*
+ * Timer IRQ handler
+ */
+static irqreturn_t kinetis_clockevent_tmr_irq_handler(int irq, void *dev_id)
+{
+	struct kinetis_clock_event_ddata *tmr = dev_id;
+
+	KINETIS_PIT_WR(tmr->base, tflg, KINETIS_PIT_TFLG_TIF_MSK);
+
+	tmr->evtdev.event_handler(&(tmr->evtdev));
+
+	return IRQ_HANDLED;
+}
+
+/*
+ * System timer IRQ action
+ */
+static struct irqaction kinetis_clockevent_irqaction[KINETIS_PIT_CHANNELS] = {
+	{
+		.name = "Kinetis Kernel Time Tick (pit0)",
+		.flags = IRQF_TIMER | IRQF_IRQPOLL,
+		.dev_id = &kinetis_clockevent_tmrs[0],
+		.handler = kinetis_clockevent_tmr_irq_handler,
+	}, {
+		.name = "Kinetis Kernel Time Tick (pit1)",
+		.flags = IRQF_TIMER | IRQF_IRQPOLL,
+		.dev_id = &kinetis_clockevent_tmrs[1],
+		.handler = kinetis_clockevent_tmr_irq_handler,
+	}, {
+		.name = "Kinetis Kernel Time Tick (pit2)",
+		.flags = IRQF_TIMER | IRQF_IRQPOLL,
+		.dev_id = &kinetis_clockevent_tmrs[2],
+		.handler = kinetis_clockevent_tmr_irq_handler,
+	}, {
+		.name = "Kinetis Kernel Time Tick (pit3)",
+		.flags = IRQF_TIMER | IRQF_IRQPOLL,
+		.dev_id = &kinetis_clockevent_tmrs[3],
+		.handler = kinetis_clockevent_tmr_irq_handler,
+	},
+};
+
+static void __init kinetis_clockevent_init(struct device_node *np)
+{
+	const u64 max_delay_in_sec = 5;
+	struct clk *clk;
+	void __iomem *base;
+	unsigned long rate;
+	int irq, chan;
+
+	clk = of_clk_get(np, 0);
+	if (IS_ERR(clk)) {
+		pr_err("failed to get clock for clockevent\n");
+		return;
+	}
+
+	if (clk_prepare_enable(clk)) {
+		pr_err("failed to enable timer clock for clockevent\n");
+		goto err_clk_enable;
+	}
+
+	rate = clk_get_rate(clk);
+	if (!(rate / HZ)) {
+		pr_err("failed to get proper clock rate for clockevent\n");
+		goto err_clk_enable;
+	}
+
+	base = of_iomap(np, 0);
+	if (!base) {
+		pr_err("failed to get map registers for clockevent\n");
+		goto err_iomap;
+	}
+
+	irq = irq_of_parse_and_map(np, 0);
+	if (irq <= 0) {
+		pr_err("failed to get irq for clockevent\n");
+		goto err_get_irq;
+	}
+
+	chan = of_alias_get_id(np, "pit");
+	if ((chan < 0) || (chan >= KINETIS_PIT_CHANNELS)) {
+		pr_err("failed to calculate channel number for clockevent\n");
+		goto err_get_irq;
+	}
+	kinetis_clockevent_tmrs[chan].base = base;
+
+	/*
+	 * Set the fields required for the set_next_event method
+	 * (tickless kernel support)
+	 */
+	clockevents_calc_mult_shift(&(kinetis_clockevent_tmrs[chan].evtdev),
+					rate, max_delay_in_sec);
+	kinetis_clockevent_tmrs[chan].evtdev.max_delta_ns =
+					max_delay_in_sec * NSEC_PER_SEC;
+	kinetis_clockevent_tmrs[chan].evtdev.min_delta_ns =
+			clockevent_delta2ns(0xf,
+				&(kinetis_clockevent_tmrs[chan].evtdev));
+
+	clockevents_register_device(&(kinetis_clockevent_tmrs[chan].evtdev));
+
+	kinetis_pit_init(base, (rate / HZ) - 1);
+	kinetis_pit_enable(base, 1);
+
+	setup_irq(irq, &(kinetis_clockevent_irqaction[chan]));
+
+	return;
+
+err_get_irq:
+
+	iounmap(base);
+err_iomap:
+
+	clk_disable_unprepare(clk);
+err_clk_enable:
+
+	clk_put(clk);
+}
+
+CLOCKSOURCE_OF_DECLARE(kinetis_pit_timer, "fsl,kinetis-pit-timer",
+		       kinetis_clockevent_init);
diff --git a/include/dt-bindings/clock/kinetis-mcg.h b/include/dt-bindings/clock/kinetis-mcg.h
new file mode 100644
index 0000000..681732f
--- /dev/null
+++ b/include/dt-bindings/clock/kinetis-mcg.h
@@ -0,0 +1,10 @@
+#ifndef _DT_BINDINGS_CLOCK_KINETIS_MCG_H
+#define _DT_BINDINGS_CLOCK_KINETIS_MCG_H
+
+#define CLOCK_MCGOUTCLK		 0
+#define CLOCK_CCLK		 1
+#define CLOCK_PCLK		 2
+#define CLOCK_PIT		 3
+#define CLOCK_END		 4
+
+#endif /* _DT_BINDINGS_CLOCK_KINETIS_MCG_H */
-- 
2.3.6
