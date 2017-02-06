From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 10/10] arm64: dts: mediatek: add clk nodes for MT6797
Date: Mon, 6 Feb 2017 20:15:36 +0800
Message-ID: <1486383336-16892-11-git-send-email-mars.cheng@mediatek.com>
References: <1486383336-16892-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1486383336-16892-1-git-send-email-mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Loda Chou <loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jades Shih <jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Kevin-CW Chen <kevin-cw.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, My Chuang <my.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chieh-Jay Liu <Chieh-Jay.Liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds clk nodes for MT6797

Signed-off-by: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Kevin-CW Chen <kevin-cw.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt6797.dtsi |   71 ++++++++++++++++++++++++++++--
 1 file changed, 67 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index da3a6ff..eca2376 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -11,6 +11,8 @@
  * GNU General Public License for more details.
  */
 
+#include <dt-bindings/clock/mt6797-clk.h>
+#include <dt-bindings/power/mt6797-power.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
@@ -127,6 +129,35 @@
 			     (GIC_CPU_MASK_SIMPLE(10) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	topckgen: topckgen@10000000 {
+		compatible = "mediatek,mt6797-topckgen";
+		reg = <0 0x10000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	infrasys: infracfg_ao@10001000 {
+		compatible = "mediatek,mt6797-infracfg", "syscon";
+		reg = <0 0x10001000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	scpsys: scpsys@10006000 {
+		compatible = "mediatek,mt6797-scpsys";
+		#power-domain-cells = <1>;
+		reg = <0 0x10006000 0 0x1000>;
+		clocks = <&topckgen CLK_TOP_MUX_MFG>,
+			 <&topckgen CLK_TOP_MUX_MM>,
+			 <&topckgen CLK_TOP_MUX_VDEC>;
+		clock-names = "mfg", "mm", "vdec";
+		infracfg = <&infrasys>;
+	};
+
+	apmixedsys: apmixed@1000c000 {
+		compatible = "mediatek,mt6797-apmixedsys";
+		reg = <0 0x1000c000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
 	sysirq: intpol-controller@10200620 {
 		compatible = "mediatek,mt6797-sysirq",
 			     "mediatek,mt6577-sysirq";
@@ -143,7 +174,9 @@
 			     "mediatek,mt6577-uart";
 		reg = <0 0x11002000 0 0x400>;
 		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&clk26m>;
+		clocks = <&infrasys CLK_INFRA_UART0>,
+			 <&infrasys CLK_INFRA_AP_DMA>;
+		clock-names = "baud", "bus";
 		status = "disabled";
 	};
 
@@ -152,7 +185,9 @@
 			     "mediatek,mt6577-uart";
 		reg = <0 0x11003000 0 0x400>;
 		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&clk26m>;
+		clocks = <&infrasys CLK_INFRA_UART1>,
+			 <&infrasys CLK_INFRA_AP_DMA>;
+		clock-names = "baud", "bus";
 		status = "disabled";
 	};
 
@@ -161,7 +196,9 @@
 			     "mediatek,mt6577-uart";
 		reg = <0 0x11004000 0 0x400>;
 		interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&clk26m>;
+		clocks = <&infrasys CLK_INFRA_UART2>,
+			 <&infrasys CLK_INFRA_AP_DMA>;
+		clock-names = "baud", "bus";
 		status = "disabled";
 	};
 
@@ -170,10 +207,36 @@
 			     "mediatek,mt6577-uart";
 		reg = <0 0x11005000 0 0x400>;
 		interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&clk26m>;
+		clocks = <&infrasys CLK_INFRA_UART3>,
+			 <&infrasys CLK_INFRA_AP_DMA>;
+		clock-names = "baud", "bus";
 		status = "disabled";
 	};
 
+	mmsys: mmsys_config@14000000 {
+		compatible = "mediatek,mt6797-mmsys", "syscon";
+		reg = <0 0x14000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	imgsys: imgsys_config@15000000  {
+		compatible = "mediatek,mt6797-imgsys", "syscon";
+		reg = <0 0x15000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	vdecsys: vdec_gcon@16000000 {
+		compatible = "mediatek,mt6797-vdecsys", "syscon";
+		reg = <0 0x16000000 0 0x10000>;
+		#clock-cells = <1>;
+	};
+
+	vencsys: venc_gcon@17000000 {
+		compatible = "mediatek,mt6797-vencsys", "syscon";
+		reg = <0 0x17000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
 	gic: interrupt-controller@19000000 {
 		compatible = "arm,gic-v3";
 		#interrupt-cells = <3>;
-- 
1.7.9.5
