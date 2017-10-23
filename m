From: Weiyi Lu <weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v6 4/9] arm: dts: mt2712: Add clock controller device nodes
Date: Mon, 23 Oct 2017 12:10:35 +0800
Message-ID: <1508731840-4231-5-git-send-email-weiyi.lu@mediatek.com>
References: <1508731840-4231-1-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1508731840-4231-1-git-send-email-weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Weiyi Lu <weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fan Chen <fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add clock controller nodes for MT2712, include topckgen, infracfg,
pericfg, mcucfg and apmixedsys. This patch also add six oscillators that
provide clocks for MT2712.

Signed-off-by: Weiyi Lu <weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 115 ++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index 57d0396..d2ee3cd 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -5,6 +5,7 @@
  * SPDX-License-Identifier: (GPL-2.0 OR MIT)
  */
 
+#include <dt-bindings/clock/mt2712-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
@@ -73,6 +74,48 @@
 		#clock-cells = <0>;
 	};
 
+	clk26m: oscillator@0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+		clock-output-names = "clk26m";
+	};
+
+	clk32k: oscillator@1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "clk32k";
+	};
+
+	clkfpc: oscillator@2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <50000000>;
+		clock-output-names = "clkfpc";
+	};
+
+	clkaud_ext_i_0: oscillator@3 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <6500000>;
+		clock-output-names = "clkaud_ext_i_0";
+	};
+
+	clkaud_ext_i_1: oscillator@4 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <196608000>;
+		clock-output-names = "clkaud_ext_i_1";
+	};
+
+	clkaud_ext_i_2: oscillator@5 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <180633600>;
+		clock-output-names = "clkaud_ext_i_2";
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&gic>;
@@ -86,6 +129,24 @@
 			      (GIC_CPU_MASK_RAW(0x13) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	topckgen: syscon@10000000 {
+		compatible = "mediatek,mt2712-topckgen", "syscon";
+		reg = <0 0x10000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	infracfg: syscon@10001000 {
+		compatible = "mediatek,mt2712-infracfg", "syscon";
+		reg = <0 0x10001000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	pericfg: syscon@10003000 {
+		compatible = "mediatek,mt2712-pericfg", "syscon";
+		reg = <0 0x10003000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
 	uart5: serial@1000f000 {
 		compatible = "mediatek,mt2712-uart",
 			     "mediatek,mt6577-uart";
@@ -96,6 +157,18 @@
 		status = "disabled";
 	};
 
+	apmixedsys: syscon@10209000 {
+		compatible = "mediatek,mt2712-apmixedsys", "syscon";
+		reg = <0 0x10209000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	mcucfg: syscon@10220000 {
+		compatible = "mediatek,mt2712-mcucfg", "syscon";
+		reg = <0 0x10220000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
 	sysirq: interrupt-controller@10220a80 {
 		compatible = "mediatek,mt2712-sysirq",
 			     "mediatek,mt6577-sysirq";
@@ -167,5 +240,47 @@
 		clock-names = "baud", "bus";
 		status = "disabled";
 	};
+
+	mfgcfg: syscon@13000000 {
+		compatible = "mediatek,mt2712-mfgcfg", "syscon";
+		reg = <0 0x13000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	mmsys: syscon@14000000 {
+		compatible = "mediatek,mt2712-mmsys", "syscon";
+		reg = <0 0x14000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	imgsys: syscon@15000000 {
+		compatible = "mediatek,mt2712-imgsys", "syscon";
+		reg = <0 0x15000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	bdpsys: syscon@15010000 {
+		compatible = "mediatek,mt2712-bdpsys", "syscon";
+		reg = <0 0x15010000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	vdecsys: syscon@16000000 {
+		compatible = "mediatek,mt2712-vdecsys", "syscon";
+		reg = <0 0x16000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	vencsys: syscon@18000000 {
+		compatible = "mediatek,mt2712-vencsys", "syscon";
+		reg = <0 0x18000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	jpgdecsys: syscon@19000000 {
+		compatible = "mediatek,mt2712-jpgdecsys", "syscon";
+		reg = <0 0x19000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
 };
 
-- 
1.9.1
