From: Lars Persson <lars.persson@axis.com>
Subject: [PATCH v5 1/2] clk: add device tree binding for Artpec-6 clock controller
Date: Thu, 31 Mar 2016 20:02:50 +0200
Message-ID: <3d38a3e4b2595c5bb3003d0b02200506c414d4da.1459447089.git.larper@axis.com>
References: <cover.1459447089.git.larper@axis.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1459447089.git.larper@axis.com>
In-Reply-To: <cover.1459447089.git.larper@axis.com>
References: <cover.1459447089.git.larper@axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, Lars Persson <larper@axis.com>
List-Id: devicetree@vger.kernel.org

Add device tree documentation for the main clock controller in the
Artpec-6 SoC.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Lars Persson <larper@axis.com>
---
 .../devicetree/bindings/clock/artpec6.txt          | 41 ++++++++++++++++++++++
 include/dt-bindings/clock/axis,artpec6-clkctrl.h   | 38 ++++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/artpec6.txt
 create mode 100644 include/dt-bindings/clock/axis,artpec6-clkctrl.h

diff --git a/Documentation/devicetree/bindings/clock/artpec6.txt b/Documentation/devicetree/bindings/clock/artpec6.txt
new file mode 100644
index 0000000..9ba9bd0
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/artpec6.txt
@@ -0,0 +1,41 @@
+* Clock bindings for Axis ARTPEC-6 chip
+
+The bindings are based on the clock provider binding in
+Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+External clocks:
+----------------
+
+There are two external inputs to the main clock controller which should be
+provided using the common clock bindings.
+- "sys_refclk": External 50 Mhz oscillator (required)
+- "i2s_refclk": Alternate audio reference clock (optional).
+
+Main clock controller
+---------------------
+
+Required properties:
+- #clock-cells: Should be <1>
+  See dt-bindings/clock/axis,artpec6-clkctrl.h for the list of valid identifiers.
+- compatible: Should be "axis,artpec6-clkctrl"
+- reg: Must contain the base address and length of the system controller
+- clocks:  Must contain a phandle entry for each clock in clock-names
+- clock-names: Must include the external oscillator ("sys_refclk"). Optional
+  ones are the audio reference clock ("i2s_refclk") and the audio fractional
+  dividers ("frac_clk0" and "frac_clk1").
+
+Examples:
+
+ext_clk: ext_clk {
+	#clock-cells = <0>;
+	compatible = "fixed-clock";
+	clock-frequency = <50000000>;
+};
+
+clkctrl: clkctrl {
+	#clock-cells = <1>;
+	compatible = "axis,artpec6-clkctrl";
+	reg = <0xf8000000 0x48>;
+	clocks = <&ext_clk>;
+	clock-names = "sys_refclk";
+};
diff --git a/include/dt-bindings/clock/axis,artpec6-clkctrl.h b/include/dt-bindings/clock/axis,artpec6-clkctrl.h
new file mode 100644
index 0000000..f9f04dc
--- /dev/null
+++ b/include/dt-bindings/clock/axis,artpec6-clkctrl.h
@@ -0,0 +1,38 @@
+/*
+ * ARTPEC-6 clock controller indexes
+ *
+ * Copyright 2016 Axis Comunications AB.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef DT_BINDINGS_CLK_ARTPEC6_CLKCTRL_H
+#define DT_BINDINGS_CLK_ARTPEC6_CLKCTRL_H
+
+#define ARTPEC6_CLK_CPU			0
+#define ARTPEC6_CLK_CPU_PERIPH		1
+#define ARTPEC6_CLK_NAND_CLKA		2
+#define ARTPEC6_CLK_NAND_CLKB		3
+#define ARTPEC6_CLK_ETH_ACLK		4
+#define ARTPEC6_CLK_DMA_ACLK		5
+#define ARTPEC6_CLK_PTP_REF		6
+#define ARTPEC6_CLK_SD_PCLK		7
+#define ARTPEC6_CLK_SD_IMCLK		8
+#define ARTPEC6_CLK_I2S_HST		9
+#define ARTPEC6_CLK_I2S0_CLK		10
+#define ARTPEC6_CLK_I2S1_CLK		11
+#define ARTPEC6_CLK_UART_PCLK		12
+#define ARTPEC6_CLK_UART_REFCLK		13
+#define ARTPEC6_CLK_I2C			14
+#define ARTPEC6_CLK_SPI_PCLK		15
+#define ARTPEC6_CLK_SPI_SSPCLK		16
+#define ARTPEC6_CLK_SYS_TIMER		17
+#define ARTPEC6_CLK_FRACDIV_IN		18
+#define ARTPEC6_CLK_DBG_PCLK		19
+
+/* This must be the highest clock index plus one. */
+#define ARTPEC6_CLK_NUMCLOCKS		20
+
+#endif
-- 
2.1.4
