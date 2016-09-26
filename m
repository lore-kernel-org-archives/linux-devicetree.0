From: Erin Lo <erin.lo@mediatek.com>
Subject: [PATCH v13 3/4] arm: dts: mt2701: Add clock controller device nodes
Date: Mon, 26 Sep 2016 17:26:30 +0800
Message-ID: <1474881991-17429-4-git-send-email-erin.lo@mediatek.com>
References: <1474881991-17429-1-git-send-email-erin.lo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1474881991-17429-1-git-send-email-erin.lo@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <kernel@pengutronix.de>, Daniel Kurtz <djkurtz@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, ms.chen@mediatek.com, robert.chou@mediatek.com, James Liao <jamesjj.liao@mediatek.com>, Erin Lo <erin.lo@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: James Liao <jamesjj.liao@mediatek.com>

Add clock controller nodes for MT2701, include topckgen, infracfg,
pericfg, apmixedsys, mmsys, imgsys, vdecsys, hifsys, ethsys and
bdpsys. This patch also add two oscillators that provide clocks for
MT2701.

Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
Signed-off-by: Erin Lo <erin.lo@mediatek.com>
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
