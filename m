From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v3 1/3] dt-bindings: clock: meson8b: describe the embedded reset controller
Date: Fri, 28 Jul 2017 23:13:11 +0200
Message-ID: <20170728211313.10603-2-martin.blumenstingl@googlemail.com>
References: <20170728211313.10603-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170728211313.10603-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Amlogic Meson8/Meson8b/Meson8m2 clock controller provides some reset
lines. These are used for example to boot the secondary CPU cores.

This patch describes the reset controller which is embedded into the
clock controller on these SoCs.
A header file is provided which provides preprocessor macros for each
reset line (to make the .dts files easier to read).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Reviewed-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 .../bindings/clock/amlogic,meson8b-clkc.txt        |  9 +++++++-
 .../dt-bindings/reset/amlogic,meson8b-clkc-reset.h | 27 ++++++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/reset/amlogic,meson8b-clkc-reset.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
index 606da38c0959..c858fd64f680 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
@@ -16,18 +16,25 @@ Required Properties:
 	   mapped region.
 
 - #clock-cells: should be 1.
+- #reset-cells: should be 1.
 
 Each clock is assigned an identifier and client nodes can use this identifier
 to specify the clock which they consume. All available clocks are defined as
 preprocessor macros in the dt-bindings/clock/meson8b-clkc.h header and can be
 used in device tree sources.
 
+Similarly a preprocessor macro for each reset line is defined in
+dt-bindings/reset/amlogic,meson8b-clkc-reset.h (which can be used from the
+device tree sources).
+
+
 Example: Clock controller node:
 
 	clkc: clock-controller@c1104000 {
-		#clock-cells = <1>;
 		compatible = "amlogic,meson8b-clkc";
 		reg = <0xc1108000 0x4>, <0xc1104000 0x460>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
 	};
 
 
diff --git a/include/dt-bindings/reset/amlogic,meson8b-clkc-reset.h b/include/dt-bindings/reset/amlogic,meson8b-clkc-reset.h
new file mode 100644
index 000000000000..1f1b56e57346
--- /dev/null
+++ b/include/dt-bindings/reset/amlogic,meson8b-clkc-reset.h
@@ -0,0 +1,27 @@
+/*
+ * Copyright (c) 2017 Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>.
+ *
+ * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_MESON8B_CLKC_RESET_H
+#define _DT_BINDINGS_AMLOGIC_MESON8B_CLKC_RESET_H
+
+#define CLKC_RESET_L2_CACHE_SOFT_RESET				0
+#define CLKC_RESET_AXI_64_TO_128_BRIDGE_A5_SOFT_RESET		1
+#define CLKC_RESET_SCU_SOFT_RESET				2
+#define CLKC_RESET_CPU0_SOFT_RESET				3
+#define CLKC_RESET_CPU1_SOFT_RESET				4
+#define CLKC_RESET_CPU2_SOFT_RESET				5
+#define CLKC_RESET_CPU3_SOFT_RESET				6
+#define CLKC_RESET_A5_GLOBAL_RESET				7
+#define CLKC_RESET_A5_AXI_SOFT_RESET				8
+#define CLKC_RESET_A5_ABP_SOFT_RESET				9
+#define CLKC_RESET_AXI_64_TO_128_BRIDGE_MMC_SOFT_RESET		10
+#define CLKC_RESET_VID_CLK_CNTL_SOFT_RESET			11
+#define CLKC_RESET_VID_DIVIDER_CNTL_SOFT_RESET_POST		12
+#define CLKC_RESET_VID_DIVIDER_CNTL_SOFT_RESET_PRE		13
+#define CLKC_RESET_VID_DIVIDER_CNTL_RESET_N_POST		14
+#define CLKC_RESET_VID_DIVIDER_CNTL_RESET_N_PRE			15
+
+#endif /* _DT_BINDINGS_AMLOGIC_MESON8B_CLKC_RESET_H */
-- 
2.13.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
