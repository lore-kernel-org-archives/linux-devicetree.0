Return-Path: <SRS0=PCtB=IU=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH v3 1/2] dts: clk: add devicetree bindings for MAX9485
Date: Sat,  2 Jun 2018 13:15:30 +0200
Message-Id: <20180602111531.32143-2-daniel@zonque.org>
In-Reply-To: <20180602111531.32143-1-daniel@zonque.org>
References: <20180602111531.32143-1-daniel@zonque.org>
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

This patch adds the devicetree bindings for MAX9485, a programmable audio
clock generator.

Signed-off-by: Daniel Mack <daniel@zonque.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/maxim,max9485.txt    | 59 ++++++++++++++++++++++
 include/dt-bindings/clock/maxim,max9485.h          | 18 +++++++
 2 files changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/maxim,max9485.txt
 create mode 100644 include/dt-bindings/clock/maxim,max9485.h

diff --git a/Documentation/devicetree/bindings/clock/maxim,max9485.txt b/Documentation/devicetree/bindings/clock/maxim,max9485.txt
new file mode 100644
index 000000000000..61bec1100a94
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/maxim,max9485.txt
@@ -0,0 +1,59 @@
+Devicetree bindings for Maxim MAX9485 Programmable Audio Clock Generator
+
+This device exposes 4 clocks in total:
+
+- MAX9485_MCLKOUT: 	A gated, buffered output of the input clock of 27 MHz
+- MAX9485_CLKOUT:	A PLL that can be configured to 16 different discrete
+			frequencies
+- MAX9485_CLKOUT[1,2]:	Two gated outputs for MAX9485_CLKOUT
+
+MAX9485_CLKOUT[1,2] are children of MAX9485_CLKOUT which upchain all rate set
+requests.
+
+Required properties:
+- compatible:	"maxim,max9485"
+- clocks:	Input clock, must provice 27.000 MHz
+- clock-names:	Must be set to "xclk"
+- #clock-cells: From common clock binding; shall be set to 1
+
+Optional properties:
+- reset-gpios:		GPIO descriptor connected to the #RESET input pin
+- vdd-supply:		A regulator node for Vdd
+- clock-output-names:	Name of output clocks, as defined in common clock
+			bindings
+
+If not explicitly set, the output names are "mclkout", "clkout", "clkout1"
+and "clkout2".
+
+Clocks are defined as preprocessor macros in the dt-binding header.
+
+Example:
+
+	#include <dt-bindings/clock/maxim,max9485.h>
+
+	xo-27mhz: xo-27mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <27000000>;
+	};
+
+	&i2c0 {
+		max9485: audio-clock@63 {
+			reg = <0x63>;
+			compatible = "maxim,max9485";
+			clock-names = "xclk";
+			clocks = <&xo-27mhz>;
+			reset-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+			vdd-supply = <&3v3-reg>;
+			#clock-cells = <1>;
+		};
+	};
+
+	// Clock consumer node
+
+	foo@0 {
+		compatible = "bar,foo";
+		/* ... */
+		clock-names = "foo-input-clk";
+		clocks = <&max9485 MAX9485_CLKOUT1>;
+	};
diff --git a/include/dt-bindings/clock/maxim,max9485.h b/include/dt-bindings/clock/maxim,max9485.h
new file mode 100644
index 000000000000..185b09ce1869
--- /dev/null
+++ b/include/dt-bindings/clock/maxim,max9485.h
@@ -0,0 +1,18 @@
+/*
+ * Copyright (C) 2018 Daniel Mack
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#ifndef __DT_BINDINGS_MAX9485_CLK_H
+#define __DT_BINDINGS_MAX9485_CLK_H
+
+#define MAX9485_MCLKOUT	0
+#define MAX9485_CLKOUT	1
+#define MAX9485_CLKOUT1	2
+#define MAX9485_CLKOUT2	3
+
+#endif /* __DT_BINDINGS_MAX9485_CLK_H */
-- 
2.14.3
