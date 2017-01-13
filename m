From: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 2/6] arm: dts: mt2701: Add iommu/smi device node
Date: Fri, 13 Jan 2017 16:42:54 +0800
Message-ID: <1484296978-18572-3-git-send-email-erin.lo@mediatek.com>
References: <1484296978-18572-1-git-send-email-erin.lo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1484296978-18572-1-git-send-email-erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
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
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Add the device node of iommu and smi for MT2701.

Signed-off-by: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/mt2701.dtsi | 54 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index eb4c6fd..87be52c 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -17,6 +17,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/mt2701-resets.h>
+#include <dt-bindings/memory/mt2701-larb-port.h>
 #include "skeleton64.dtsi"
 #include "mt2701-pinfunc.h"
 
@@ -161,6 +162,16 @@
 		clock-names = "system-clk", "rtc-clk";
 	};
 
+	smi_common: smi@1000c000 {
+		compatible = "mediatek,mt2701-smi-common";
+		reg = <0 0x1000c000 0 0x1000>;
+		clocks = <&infracfg CLK_INFRA_SMI>,
+			 <&mmsys CLK_MM_SMI_COMMON>,
+			 <&infracfg CLK_INFRA_SMI>;
+		clock-names = "apb", "smi", "async";
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
+	};
+
 	sysirq: interrupt-controller@10200100 {
 		compatible = "mediatek,mt2701-sysirq",
 			     "mediatek,mt6577-sysirq";
@@ -170,6 +181,16 @@
 		reg = <0 0x10200100 0 0x1c>;
 	};
 
+	iommu: mmsys_iommu@10205000 {
+		compatible = "mediatek,mt2701-m4u";
+		reg = <0 0x10205000 0 0x1000>;
+		interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&infracfg CLK_INFRA_M4U>;
+		clock-names = "bclk";
+		mediatek,larbs = <&larb0 &larb1 &larb2>;
+		#iommu-cells = <1>;
+	};
+
 	apmixedsys: syscon@10209000 {
 		compatible = "mediatek,mt2701-apmixedsys", "syscon";
 		reg = <0 0x10209000 0 0x1000>;
@@ -272,18 +293,51 @@
 		#clock-cells = <1>;
 	};
 
+	larb0: larb@14010000 {
+		compatible = "mediatek,mt2701-smi-larb";
+		reg = <0 0x14010000 0 0x1000>;
+		mediatek,smi = <&smi_common>;
+		mediatek,larbidx = <0>;
+		clocks = <&mmsys CLK_MM_SMI_LARB0>,
+			 <&mmsys CLK_MM_SMI_LARB0>;
+		clock-names = "apb", "smi";
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
+	};
+
 	imgsys: syscon@15000000 {
 		compatible = "mediatek,mt2701-imgsys", "syscon";
 		reg = <0 0x15000000 0 0x1000>;
 		#clock-cells = <1>;
 	};
 
+	larb2: larb@15001000 {
+		compatible = "mediatek,mt2701-smi-larb";
+		reg = <0 0x15001000 0 0x1000>;
+		mediatek,smi = <&smi_common>;
+		mediatek,larbidx = <2>;
+		clocks = <&imgsys CLK_IMG_SMI_COMM>,
+			 <&imgsys CLK_IMG_SMI_COMM>;
+		clock-names = "apb", "smi";
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
+	};
+
 	vdecsys: syscon@16000000 {
 		compatible = "mediatek,mt2701-vdecsys", "syscon";
 		reg = <0 0x16000000 0 0x1000>;
 		#clock-cells = <1>;
 	};
 
+	larb1: larb@16010000 {
+		compatible = "mediatek,mt2701-smi-larb";
+		reg = <0 0x16010000 0 0x1000>;
+		mediatek,smi = <&smi_common>;
+		mediatek,larbidx = <1>;
+		clocks = <&vdecsys CLK_VDEC_CKGEN>,
+			 <&vdecsys CLK_VDEC_LARB>;
+		clock-names = "apb", "smi";
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_VDEC>;
+	};
+
 	hifsys: syscon@1a000000 {
 		compatible = "mediatek,mt2701-hifsys", "syscon";
 		reg = <0 0x1a000000 0 0x1000>;
-- 
1.9.1
