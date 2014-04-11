From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 2/4] ARM: dts: imx6: define input clocks to CCM block
Date: Fri, 11 Apr 2014 16:04:05 +0800
Message-ID: <1397203447-22965-3-git-send-email-shawn.guo@freescale.com>
References: <1397203447-22965-1-git-send-email-shawn.guo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397203447-22965-1-git-send-email-shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Inspired by commit 1771b10 (clk: respect the clock dependencies in
of_clk_init), we should define the input clocks to CCM block to reflect
the dependencies on those fixed rate clocks.

Signed-off-by: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl.dtsi | 8 +++++---
 arch/arm/boot/dts/imx6sl.dtsi  | 6 ++++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 8ee6361..2a35b08 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -57,19 +57,19 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		ckil {
+		ckil: ckil {
 			compatible = "fsl,imx-ckil", "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <32768>;
 		};
 
-		ckih1 {
+		ckih1: ckih1 {
 			compatible = "fsl,imx-ckih1", "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <0>;
 		};
 
-		osc {
+		osc: osc {
 			compatible = "fsl,imx-osc", "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <24000000>;
@@ -483,6 +483,8 @@
 				interrupts = <0 87 IRQ_TYPE_LEVEL_HIGH>,
 					     <0 88 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
+				clocks = <&ckil>, <&ckih1>, <&osc>;
+				clock-names = "ckil", "ckih1", "osc";
 			};
 
 			anatop: anatop@020c8000 {
diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index ebaad63..a6d3afb 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -79,13 +79,13 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		ckil {
+		ckil: ckil {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <32768>;
 		};
 
-		osc {
+		osc: osc {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <24000000>;
@@ -427,6 +427,8 @@
 				interrupts = <0 87 IRQ_TYPE_LEVEL_HIGH>,
 					     <0 88 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
+				clocks = <&ckil>, <&osc>;
+				clock-names = "ckil", "osc";
 			};
 
 			anatop: anatop@020c8000 {
-- 
1.8.3.2


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
