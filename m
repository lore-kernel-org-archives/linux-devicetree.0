From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 4/4] ARM: dts: imx6: use generic name for fixed-clock nodes
Date: Fri, 11 Apr 2014 16:04:07 +0800
Message-ID: <1397203447-22965-5-git-send-email-shawn.guo@freescale.com>
References: <1397203447-22965-1-git-send-email-shawn.guo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397203447-22965-1-git-send-email-shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Per device tree spec, we should use generic name for device node when
possible.  Let's do that for the fixed-clock nodes, and use property
clock-output-names to define the name for clock.

While at it, let's drop those unneeded imx specific compatible string
for these fixed rate clocks.

Signed-off-by: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl.dtsi | 18 ++++++++++++------
 arch/arm/boot/dts/imx6sl.dtsi  |  8 ++++++--
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 2a35b08..400f75c 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -57,22 +57,28 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		ckil: ckil {
-			compatible = "fsl,imx-ckil", "fixed-clock";
+		ckil: clock@0 {
+			compatible = "fixed-clock";
+			reg = <0>;
 			#clock-cells = <0>;
 			clock-frequency = <32768>;
+			clock-output-names = "ckil";
 		};
 
-		ckih1: ckih1 {
-			compatible = "fsl,imx-ckih1", "fixed-clock";
+		ckih1: clock@1 {
+			compatible = "fixed-clock";
+			reg = <1>;
 			#clock-cells = <0>;
 			clock-frequency = <0>;
+			clock-output-names = "ckih1";
 		};
 
-		osc: osc {
-			compatible = "fsl,imx-osc", "fixed-clock";
+		osc: clock@2 {
+			compatible = "fixed-clock";
+			reg = <2>;
 			#clock-cells = <0>;
 			clock-frequency = <24000000>;
+			clock-output-names = "osc";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index a6d3afb..275eb30 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -79,16 +79,20 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		ckil: ckil {
+		ckil: clock@0 {
 			compatible = "fixed-clock";
+			reg = <0>;
 			#clock-cells = <0>;
 			clock-frequency = <32768>;
+			clock-output-names = "ckil";
 		};
 
-		osc: osc {
+		osc: clock@1 {
 			compatible = "fixed-clock";
+			reg = <1>;
 			#clock-cells = <0>;
 			clock-frequency = <24000000>;
+			clock-output-names = "osc";
 		};
 	};
 
-- 
1.8.3.2


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
