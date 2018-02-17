From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 02/15] arm64: dts: mt7622: add clock controller device nodes
Date: Sun, 18 Feb 2018 03:54:37 +0800
Message-ID: <816b712599b2da8b13fb6f6baed98cd7da872610.1518895232.git.sean.wang@mediatek.com>
References: <cover.1518895232.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1518895232.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Add clock controller nodes for MT7622 and include header for topckgen,
infracfg, pericfg, apmixedsys, ethsys, sgmiisys, pciesys and ssusbsys
for those devices nodes to be added afterwards.

In addition, provides an oscillator node for the source of PLLs and dummy
clock for PWARP to complement missing support of clock gate for the
wrapper circuit in the driver.

Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 76 ++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index b111fec..73e5d62 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -8,6 +8,8 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/mt7622-clk.h>
+#include <dt-bindings/reset/mt7622-reset.h>
 
 / {
 	compatible = "mediatek,mt7622";
@@ -48,6 +50,19 @@
 		clock-frequency = <280000000>;
 	};
 
+	pwrap_clk: dummy40m {
+		compatible = "fixed-clock";
+		clock-frequency = <40000000>;
+		#clock-cells = <0>;
+	};
+
+	clk25m: oscillator {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+		clock-output-names = "clkxtal";
+	};
+
 	psci {
 		compatible  = "arm,psci-0.2";
 		method      = "smc";
@@ -78,6 +93,22 @@
 			      IRQ_TYPE_LEVEL_HIGH)>;
 	};
 
+	infracfg: infracfg@10000000 {
+		compatible = "mediatek,mt7622-infracfg",
+			     "syscon";
+		reg = <0 0x10000000 0 0x1000>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+	};
+
+	pericfg: pericfg@10002000 {
+		compatible = "mediatek,mt7622-pericfg",
+			     "syscon";
+		reg = <0 0x10002000 0 0x1000>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+	};
+
 	sysirq: interrupt-controller@10200620 {
 		compatible = "mediatek,mt7622-sysirq",
 			     "mediatek,mt6577-sysirq";
@@ -87,6 +118,20 @@
 		reg = <0 0x10200620 0 0x20>;
 	};
 
+	apmixedsys: apmixedsys@10209000 {
+		compatible = "mediatek,mt7622-apmixedsys",
+			     "syscon";
+		reg = <0 0x10209000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	topckgen: topckgen@10210000 {
+		compatible = "mediatek,mt7622-topckgen",
+			     "syscon";
+		reg = <0 0x10210000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
 	gic: interrupt-controller@10300000 {
 		compatible = "arm,gic-400";
 		interrupt-controller;
@@ -107,4 +152,35 @@
 		clock-names = "baud", "bus";
 		status = "disabled";
 	};
+
+	ssusbsys: ssusbsys@1a000000 {
+		compatible = "mediatek,mt7622-ssusbsys",
+			     "syscon";
+		reg = <0 0x1a000000 0 0x1000>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+	};
+
+	pciesys: pciesys@1a100800 {
+		compatible = "mediatek,mt7622-pciesys",
+			     "syscon";
+		reg = <0 0x1a100800 0 0x1000>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+	};
+
+	ethsys: syscon@1b000000 {
+		compatible = "mediatek,mt7622-ethsys",
+			     "syscon";
+		reg = <0 0x1b000000 0 0x1000>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+	};
+
+	sgmiisys: sgmiisys@1b128000 {
+		compatible = "mediatek,mt7622-sgmiisys",
+			     "syscon";
+		reg = <0 0x1b128000 0 0x1000>;
+		#clock-cells = <1>;
+	};
 };
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
