From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH 1/4] ARM: dts: mxs: add missing reg properties for GPIO banks
Date: Sun,  5 Jun 2016 13:49:27 +0000
Message-ID: <1465134567-13421-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds the missing reg properties for the MXS GPIO banks
in order to fix the dtc warnings.

Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
---
 arch/arm/boot/dts/imx23.dtsi |    3 +++
 arch/arm/boot/dts/imx28.dtsi |    5 +++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/imx23.dtsi b/arch/arm/boot/dts/imx23.dtsi
index 302d116..1bfa533 100644
--- a/arch/arm/boot/dts/imx23.dtsi
+++ b/arch/arm/boot/dts/imx23.dtsi
@@ -111,6 +111,7 @@
 
 				gpio0: gpio@0 {
 					compatible = "fsl,imx23-gpio", "fsl,mxs-gpio";
+					reg = <0>;
 					interrupts = <16>;
 					gpio-controller;
 					#gpio-cells = <2>;
@@ -120,6 +121,7 @@
 
 				gpio1: gpio@1 {
 					compatible = "fsl,imx23-gpio", "fsl,mxs-gpio";
+					reg = <1>;
 					interrupts = <17>;
 					gpio-controller;
 					#gpio-cells = <2>;
@@ -129,6 +131,7 @@
 
 				gpio2: gpio@2 {
 					compatible = "fsl,imx23-gpio", "fsl,mxs-gpio";
+					reg = <2>;
 					interrupts = <18>;
 					gpio-controller;
 					#gpio-cells = <2>;
diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
index 74aa151..0ad893b 100644
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -165,6 +165,7 @@
 
 				gpio0: gpio@0 {
 					compatible = "fsl,imx28-gpio", "fsl,mxs-gpio";
+					reg = <0>;
 					interrupts = <127>;
 					gpio-controller;
 					#gpio-cells = <2>;
@@ -174,6 +175,7 @@
 
 				gpio1: gpio@1 {
 					compatible = "fsl,imx28-gpio", "fsl,mxs-gpio";
+					reg = <1>;
 					interrupts = <126>;
 					gpio-controller;
 					#gpio-cells = <2>;
@@ -183,6 +185,7 @@
 
 				gpio2: gpio@2 {
 					compatible = "fsl,imx28-gpio", "fsl,mxs-gpio";
+					reg = <2>;
 					interrupts = <125>;
 					gpio-controller;
 					#gpio-cells = <2>;
@@ -192,6 +195,7 @@
 
 				gpio3: gpio@3 {
 					compatible = "fsl,imx28-gpio", "fsl,mxs-gpio";
+					reg = <3>;
 					interrupts = <124>;
 					gpio-controller;
 					#gpio-cells = <2>;
@@ -201,6 +205,7 @@
 
 				gpio4: gpio@4 {
 					compatible = "fsl,imx28-gpio", "fsl,mxs-gpio";
+					reg = <4>;
 					interrupts = <123>;
 					gpio-controller;
 					#gpio-cells = <2>;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
