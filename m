From: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 1/2] mips: dts: Remove leading 0x and 0s from bindings notation
Date: Wed, 24 Jan 2018 12:42:07 +0100
Message-ID: <20180124114210.26457-1-malat@debian.org>
References: <20171214165358.28058-1-malat@debian.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171214165358.28058-1-malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hogan <jhogan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Paul Burton <paul.burton-8NJIiSa5LzA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kate Stewart <kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
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
 arch/mips/boot/dts/img/boston.dts   | 2 +-
 arch/mips/boot/dts/ingenic/ci20.dts | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/boot/dts/img/boston.dts b/arch/mips/boot/dts/img/boston.dts
index 2cd49b60e030..1bd105428f61 100644
--- a/arch/mips/boot/dts/img/boston.dts
+++ b/arch/mips/boot/dts/img/boston.dts
@@ -157,7 +157,7 @@
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					rtc@0x68 {
+					rtc@68 {
 						compatible = "st,m41t81s";
 						reg = <0x68>;
 					};
diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index a4cc52214dbd..7d5e49e40b0d 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -110,22 +110,22 @@
 					reg = <0x0 0x0 0x0 0x800000>;
 				};
 
-				partition@0x800000 {
+				partition@800000 {
 					label = "u-boot";
 					reg = <0x0 0x800000 0x0 0x200000>;
 				};
 
-				partition@0xa00000 {
+				partition@a00000 {
 					label = "u-boot-env";
 					reg = <0x0 0xa00000 0x0 0x200000>;
 				};
 
-				partition@0xc00000 {
+				partition@c00000 {
 					label = "boot";
 					reg = <0x0 0xc00000 0x0 0x4000000>;
 				};
 
-				partition@0x8c00000 {
+				partition@8c00000 {
 					label = "system";
 					reg = <0x0 0x4c00000 0x1 0xfb400000>;
 				};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
