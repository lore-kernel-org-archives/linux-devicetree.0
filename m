From: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] nios2: dts: Remove leading 0x and 0s from bindings notation
Date: Thu, 14 Dec 2017 17:53:59 +0100
Message-ID: <20171214165359.28112-1-malat@debian.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nios2-dev-g9ZBwUv/Ih/yUk5EbOjzuce+I+R0W71w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
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
 arch/nios2/boot/dts/3c120_devboard.dts | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/nios2/boot/dts/3c120_devboard.dts b/arch/nios2/boot/dts/3c120_devboard.dts
index 36ccdf05837d..56f4b5df6d65 100644
--- a/arch/nios2/boot/dts/3c120_devboard.dts
+++ b/arch/nios2/boot/dts/3c120_devboard.dts
@@ -29,7 +29,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu: cpu@0x0 {
+		cpu: cpu@0 {
 			device_type = "cpu";
 			compatible = "altr,nios2-1.0";
 			reg = <0x00000000>;
@@ -69,7 +69,7 @@
 		compatible = "altr,avalon", "simple-bus";
 		bus-frequency = <125000000>;
 
-		pb_cpu_to_io: bridge@0x8000000 {
+		pb_cpu_to_io: bridge@8000000 {
 			compatible = "simple-bus";
 			reg = <0x08000000 0x00800000>;
 			#address-cells = <1>;
@@ -83,7 +83,7 @@
 				<0x00008000 0x08008000 0x00000020>,
 				<0x00400000 0x08400000 0x00000020>;
 
-			timer_1ms: timer@0x400000 {
+			timer_1ms: timer@400000 {
 				compatible = "altr,timer-1.0";
 				reg = <0x00400000 0x00000020>;
 				interrupt-parent = <&cpu>;
@@ -91,7 +91,7 @@
 				clock-frequency = <125000000>;
 			};
 
-			timer_0: timer@0x8000 {
+			timer_0: timer@8000 {
 				compatible = "altr,timer-1.0";
 				reg = < 0x00008000 0x00000020 >;
 				interrupt-parent = < &cpu >;
@@ -99,14 +99,14 @@
 				clock-frequency = < 125000000 >;
 			};
 
-			jtag_uart: serial@0x4d50 {
+			jtag_uart: serial@4d50 {
 				compatible = "altr,juart-1.0";
 				reg = <0x00004d50 0x00000008>;
 				interrupt-parent = <&cpu>;
 				interrupts = <1>;
 			};
 
-			tse_mac: ethernet@0x4000 {
+			tse_mac: ethernet@4000 {
 				compatible = "altr,tse-1.0";
 				reg = <0x00004000 0x00000400>,
 					<0x00004400 0x00000040>,
@@ -133,7 +133,7 @@
 				};
 			};
 
-			uart: serial@0x4c80 {
+			uart: serial@4c80 {
 				compatible = "altr,uart-1.0";
 				reg = <0x00004c80 0x00000020>;
 				interrupt-parent = <&cpu>;
@@ -143,7 +143,7 @@
 			};
 		};
 
-		cfi_flash_64m: flash@0x0 {
+		cfi_flash_64m: flash@0 {
 			compatible = "cfi-flash";
 			reg = <0x00000000 0x04000000>;
 			bank-width = <2>;
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
