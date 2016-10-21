From: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v14 3/4] arm: dts: mt2701: Add clock controller device nodes
Date: Fri, 21 Oct 2016 11:32:21 +0800
Message-ID: <1477020742-13889-4-git-send-email-erin.lo@mediatek.com>
References: <1477020742-13889-1-git-send-email-erin.lo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477020742-13889-1-git-send-email-erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ms.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, robert.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Add clock controller nodes for MT2701, include topckgen, infracfg,
pericfg, apmixedsys, mmsys, imgsys, vdecsys, hifsys, ethsys and
bdpsys. This patch also add two oscillators that provide clocks for
MT2701.

Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/mt2701.dtsi | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index 18596a2..c9a8dbf 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -12,8 +12,10 @@
  * GNU General Public License for more details.
  */
 
+#include <dt-bindings/clock/mt2701-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/mt2701-resets.h>
 #include "skeleton64.dtsi"
 #include "mt2701-pinfunc.h"
 
@@ -77,6 +79,20 @@
 		#clock-cells = <0>;
 	};
 
+	clk26m: oscillator@0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+		clock-output-names = "clk26m";
+	};
+
+	rtc32k: oscillator@1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32000>;
+		clock-output-names = "rtc32k";
+	};
+
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupt-parent = <&gic>;
@@ -104,6 +120,26 @@
 		reg = <0 0x10005000 0 0x1000>;
 	};
 
+	topckgen: syscon@10000000 {
+		compatible = "mediatek,mt2701-topckgen", "syscon";
+		reg = <0 0x10000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	infracfg: syscon@10001000 {
+		compatible = "mediatek,mt2701-infracfg", "syscon";
+		reg = <0 0x10001000 0 0x1000>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+	};
+
+	pericfg: syscon@10003000 {
+		compatible = "mediatek,mt2701-pericfg", "syscon";
+		reg = <0 0x10003000 0 0x1000>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+	};
+
 	watchdog: watchdog@10007000 {
 		compatible = "mediatek,mt2701-wdt",
 			     "mediatek,mt6589-wdt";
@@ -128,6 +164,12 @@
 		reg = <0 0x10200100 0 0x1c>;
 	};
 
+	apmixedsys: syscon@10209000 {
+		compatible = "mediatek,mt2701-apmixedsys", "syscon";
+		reg = <0 0x10209000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
 	gic: interrupt-controller@10211000 {
 		compatible = "arm,cortex-a7-gic";
 		interrupt-controller;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
