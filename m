From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH] c6x: dts: Remove leading 0x and 0s from bindings notation
Date: Thu, 14 Dec 2017 17:53:54 +0100
Message-ID: <20171214165354.27954-1-malat@debian.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mathieu Malaterre <malat@debian.org>, Mark Rutland <mark.rutland@arm.com>, Mark Salter <msalter@redhat.com>, Aurelien Jacquiot <jacquiot.aurelien@gmail.com>, devicetree@vger.kernel.org, linux-c6x-dev@linux-c6x.org, linux-kernel@vger.kernel.org
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

Reported-by: David Daney <ddaney@caviumnetworks.com>
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/c6x/boot/dts/dsk6455.dts      | 2 +-
 arch/c6x/boot/dts/tms320c6455.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/c6x/boot/dts/dsk6455.dts b/arch/c6x/boot/dts/dsk6455.dts
index 2b71f800618d..3012f44e9357 100644
--- a/arch/c6x/boot/dts/dsk6455.dts
+++ b/arch/c6x/boot/dts/dsk6455.dts
@@ -55,7 +55,7 @@
 			interrupts = < 69 >;
 		};
 
-		clock-controller@029a0000 {
+		clock-controller@29a0000 {
 			clock-frequency = <50000000>;
 		};
 	};
diff --git a/arch/c6x/boot/dts/tms320c6455.dtsi b/arch/c6x/boot/dts/tms320c6455.dtsi
index 0b21cb30343b..b5c36fb351db 100644
--- a/arch/c6x/boot/dts/tms320c6455.dtsi
+++ b/arch/c6x/boot/dts/tms320c6455.dtsi
@@ -68,7 +68,7 @@
 			ti,dscr-dev-enable = <4>;
 		};
 
-		clock-controller@029a0000 {
+		clock-controller@29a0000 {
 			compatible = "ti,c6455-pll", "ti,c64x+pll";
 			reg = <0x029a0000 0x200>;
 			ti,c64x+pll-bypass-delay = <1440>;
-- 
2.11.0
