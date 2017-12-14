From: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] metag: dts: Remove leading 0x and 0s from bindings notation
Date: Thu, 14 Dec 2017 17:53:55 +0100
Message-ID: <20171214165355.28006-1-malat@debian.org>
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, James Hogan <jhogan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Improve the DTS files by removing all the leading "0x" and zeros to fix the
following dtc warnings:

Warning (unit_address_format): Node /XXX unit name should not have leading "0x"

and

Warning (unit_address_format): Node /XXX unit name should not have leading 0s

Converted using the following command:

find . -type f \( -iname *.dts -o -iname *.dtsi \) -exec sed -E -i -e "s/@0x([0-9a-fA-F\.]+)\s?\{/@\L\1 \{/g" -e "s/@0+([0-9a-fA-F\.]+)\s?\{/@\L\1 \{/g" {} +

For simplicity, two sed expressions were used to solve each warnings separately.

To make the regex expression more robust a few other issues were resolved,
namely setting unit-address to lower case, and adding a whitespace before the
the opening curly brace:

https://elinux.org/Device_Tree_Linux#Linux_conventions

This is a follow up to commit 4c9847b7375a ("dt-bindings: Remove leading 0x from bindings notation")

Reported-by: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Suggested-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
 arch/metag/boot/dts/tz1090.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/metag/boot/dts/tz1090.dtsi b/arch/metag/boot/dts/tz1090.dtsi
index 24ea7d2e9138..a3a3be7796f1 100644
--- a/arch/metag/boot/dts/tz1090.dtsi
+++ b/arch/metag/boot/dts/tz1090.dtsi
@@ -28,7 +28,7 @@
 		#size-cells = <1>;
 		ranges;
 
-		pdc: pdc@0x02006000 {
+		pdc: pdc@2006000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 
@@ -44,19 +44,19 @@
 			             <31 IRQ_TYPE_LEVEL_HIGH>; /* Perip 2 (WDT) */
 		};
 
-		pinctrl: pinctrl@02005800 {
+		pinctrl: pinctrl@2005800 {
 			#gpio-range-cells = <3>;
 			compatible = "img,tz1090-pinctrl";
 			reg = <0x02005800 0xe4>;
 		};
 
-		pdc_pinctrl: pinctrl@02006500 {
+		pdc_pinctrl: pinctrl@2006500 {
 			#gpio-range-cells = <3>;
 			compatible = "img,tz1090-pdc-pinctrl";
 			reg = <0x02006500 0x100>;
 		};
 
-		gpios: gpios@02005800 {
+		gpios: gpios@2005800 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "img,tz1090-gpio";
@@ -91,7 +91,7 @@
 			};
 		};
 
-		pdc_gpios: gpios@02006500 {
+		pdc_gpios: gpios@2006500 {
 			gpio-controller;
 			#gpio-cells = <2>;
 
-- 
2.11.0
