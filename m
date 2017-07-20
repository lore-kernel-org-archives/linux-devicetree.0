From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 1/4] arm: dts: rskrza1: Add SCIF2 pin group
Date: Thu, 20 Jul 2017 13:20:16 -0500
Message-ID: <20170720182019.85075-2-chris.brandt@renesas.com>
References: <20170720182019.85075-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170720182019.85075-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Add pin configuration for SCIF2 serial console interface.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s72100-rskrza1.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
index 72df20a04320..5fac0f82d742 100644
--- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
@@ -10,6 +10,7 @@
 
 /dts-v1/;
 #include "r7s72100.dtsi"
+#include <dt-bindings/pinctrl/r7s72100-pinctrl.h>
 
 / {
 	model = "RSKRZA1";
@@ -47,6 +48,15 @@
 	clock-frequency = <32768>;
 };
 
+&pinctrl {
+
+	/* Serial Console */
+	scif2_pins: serial2 {
+		pinmux = <RZA1_PINMUX(3, 0, 6)>,	/* TxD2 */
+			 <RZA1_PINMUX(3, 2, 4)>;	/* RxD2 */
+	};
+};
+
 &mtu2 {
 	status = "okay";
 };
@@ -78,5 +88,7 @@
 };
 
 &scif2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&scif2_pins>;
 	status = "okay";
 };
-- 
2.13.0
