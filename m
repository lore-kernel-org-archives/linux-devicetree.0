From: Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 01/13] dt-bindings: add binding for the Allwinner DE2 CCU
Date: Thu,  4 May 2017 19:41:56 +0800
Message-ID: <20170504114208.8524-1-icenowy@aosc.io>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

Allwinner "Display Engine 2.0" contains some clock controls in it.

In order to add them as clock drivers, we need a device tree binding.
Add the binding here.

Also add the device tree binding headers.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/sun8i-de2.txt        | 30 ++++++++++++++++++++++
 include/dt-bindings/clock/sun8i-de2.h              | 18 +++++++++++++
 include/dt-bindings/reset/sun8i-de2.h              | 14 ++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sun8i-de2.txt
 create mode 100644 include/dt-bindings/clock/sun8i-de2.h
 create mode 100644 include/dt-bindings/reset/sun8i-de2.h

diff --git a/Documentation/devicetree/bindings/clock/sun8i-de2.txt b/Documentation/devicetree/bindings/clock/sun8i-de2.txt
new file mode 100644
index 000000000000..d710c0111cd3
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sun8i-de2.txt
@@ -0,0 +1,30 @@
+Allwinner Display Engine 2.0 Clock Control Binding
+--------------------------------------------------
+
+Required properties :
+- compatible: must contain one of the following compatibles:
+		- "allwinner,sun8i-a83t-de2-clk"
+		- "allwinner,sun50i-h5-de2-clk"
+
+- reg: Must contain the registers base address and length
+- clocks: phandle to the clocks feeding the display engine subsystem.
+	  Three are needed:
+  - "mod": the display engine module clock
+  - "bus": the bus clock for the whole display engine subsystem
+- clock-names: Must contain the clock names described just above
+- resets: phandle to the reset control for the display engine subsystem.
+- #clock-cells : must contain 1
+- #reset-cells : must contain 1
+
+Example:
+de2_clocks: clock@1000000 {
+	compatible = "allwinner,sun8i-a83t-de2-clk";
+	reg = <0x01000000 0x100000>;
+	clocks = <&ccu CLK_DE>,
+		 <&ccu CLK_BUS_DE>;
+	clock-names = "mod",
+		      "bus";
+	resets = <&ccu RST_BUS_DE>;
+	#clock-cells = <1>;
+	#reset-cells = <1>;
+};
diff --git a/include/dt-bindings/clock/sun8i-de2.h b/include/dt-bindings/clock/sun8i-de2.h
new file mode 100644
index 000000000000..3bed63b524aa
--- /dev/null
+++ b/include/dt-bindings/clock/sun8i-de2.h
@@ -0,0 +1,18 @@
+/*
+ * Copyright (C) 2016 Icenowy Zheng <icenowy@aosc.io>
+ *
+ * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_SUN8I_DE2_H_
+#define _DT_BINDINGS_CLOCK_SUN8I_DE2_H_
+
+#define CLK_BUS_MIXER0		0
+#define CLK_BUS_MIXER1		1
+#define CLK_BUS_WB		2
+
+#define CLK_MIXER0		6
+#define CLK_MIXER1		7
+#define CLK_WB			8
+
+#endif /* _DT_BINDINGS_CLOCK_SUN8I_DE2_H_ */
diff --git a/include/dt-bindings/reset/sun8i-de2.h b/include/dt-bindings/reset/sun8i-de2.h
new file mode 100644
index 000000000000..9526017432f0
--- /dev/null
+++ b/include/dt-bindings/reset/sun8i-de2.h
@@ -0,0 +1,14 @@
+/*
+ * Copyright (C) 2016 Icenowy Zheng <icenowy@aosc.io>
+ *
+ * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ */
+
+#ifndef _DT_BINDINGS_RESET_SUN8I_DE2_H_
+#define _DT_BINDINGS_RESET_SUN8I_DE2_H_
+
+#define RST_MIXER0	0
+#define RST_MIXER1	1
+#define RST_WB		2
+
+#endif /* _DT_BINDINGS_RESET_SUN8I_DE2_H_ */
-- 
2.12.2

