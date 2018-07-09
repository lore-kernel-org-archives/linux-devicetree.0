Return-Path: <SRS0=UTzV=JZ=atomide.com=tony@kernel.org>
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 5/5] ARM: dts: omap4: Add l4 ranges for 4460
Date: Sun,  8 Jul 2018 23:36:12 -0700
Message-Id: <20180709063612.12025-6-tony@atomide.com>
In-Reply-To: <20180709063612.12025-1-tony@atomide.com>
References: <20180709063612.12025-1-tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Rob Herring <robh+dt@kernel.org>, Tero Kristo <t-kristo@ti.com>
List-ID: <devicetree@vger.kernel.org>

Compared to 4430, 4460 and 4470 just have slightly different
l4 cfg ranges.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-l4.dtsi |  4 ++--
 arch/arm/boot/dts/omap4460.dtsi | 36 +++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -888,7 +888,7 @@
 		#size-cells = <1>;
 	};
 
-	segment@300000 {					/* 0x4a300000 */
+	l4_cfg_segment_300000: segment@300000 {			/* 0x4a300000 */
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -904,7 +904,7 @@
 			 <0x0002a000 0x0032a000 0x002000>,	/* ap 90 */
 			 <0x0002c000 0x0032c000 0x004000>;	/* ap 91 */
 
-		target-module@0 {			/* 0x4a300000, ap 67 14.0 */
+		l4_cfg_target_0: target-module@0 {	/* 0x4a300000, ap 67 14.0 */
 			compatible = "ti,sysc";
 			status = "disabled";
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/omap4460.dtsi b/arch/arm/boot/dts/omap4460.dtsi
--- a/arch/arm/boot/dts/omap4460.dtsi
+++ b/arch/arm/boot/dts/omap4460.dtsi
@@ -92,4 +92,40 @@
 	coefficients = <348 (-9301)>;
 };
 
+/* Only some L4 CFG interconnect ranges are different on 4460 */
+&l4_cfg_segment_300000 {
+	ranges = <0x00000000 0x00300000 0x020000>,	/* ap 67 */
+		 <0x00040000 0x00340000 0x001000>,	/* ap 68 */
+		 <0x00020000 0x00320000 0x004000>,	/* ap 71 */
+		 <0x00024000 0x00324000 0x002000>,	/* ap 72 */
+		 <0x00026000 0x00326000 0x001000>,	/* ap 73 */
+		 <0x00027000 0x00327000 0x001000>,	/* ap 74 */
+		 <0x00028000 0x00328000 0x001000>,	/* ap 75 */
+		 <0x00029000 0x00329000 0x001000>,	/* ap 76 */
+		 <0x00030000 0x00330000 0x010000>,	/* ap 77 */
+		 <0x0002a000 0x0032a000 0x002000>,	/* ap 90 */
+		 <0x0002c000 0x0032c000 0x004000>,	/* ap 91 */
+		 <0x00010000 0x00310000 0x008000>,	/* ap 92 */
+		 <0x00018000 0x00318000 0x004000>,	/* ap 93 */
+		 <0x0001c000 0x0031c000 0x002000>,	/* ap 94 */
+		 <0x0001e000 0x0031e000 0x002000>;	/* ap 95 */
+};
+
+&l4_cfg_target_0 {
+	ranges = <0x00000000 0x00000000 0x00010000>,
+		 <0x00010000 0x00010000 0x00008000>,
+		 <0x00018000 0x00018000 0x00004000>,
+		 <0x0001c000 0x0001c000 0x00002000>,
+		 <0x0001e000 0x0001e000 0x00002000>,
+		 <0x00020000 0x00020000 0x00004000>,
+		 <0x00024000 0x00024000 0x00002000>,
+		 <0x00026000 0x00026000 0x00001000>,
+		 <0x00027000 0x00027000 0x00001000>,
+		 <0x00028000 0x00028000 0x00001000>,
+		 <0x00029000 0x00029000 0x00001000>,
+		 <0x0002a000 0x0002a000 0x00002000>,
+		 <0x0002c000 0x0002c000 0x00004000>,
+		 <0x00030000 0x00030000 0x00010000>;
+};
+
 /include/ "omap446x-clocks.dtsi"
-- 
2.17.1
