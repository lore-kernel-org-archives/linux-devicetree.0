From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 2/4] arm: dts: gr-peach: Add SCIF2 pin group
Date: Thu, 24 Aug 2017 10:48:41 +0200
Message-ID: <1503564523-31899-3-git-send-email-jacopo+renesas@jmondi.org>
References: <1503564523-31899-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1503564523-31899-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add pin configuration subnode for SCIF2 serial debug interface.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm/boot/dts/r7s72100-gr-peach.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-gr-peach.dts b/arch/arm/boot/dts/r7s72100-gr-peach.dts
index 1c40a1a..bcfa644 100644
--- a/arch/arm/boot/dts/r7s72100-gr-peach.dts
+++ b/arch/arm/boot/dts/r7s72100-gr-peach.dts
@@ -11,6 +11,7 @@
 
 /dts-v1/;
 #include "r7s72100.dtsi"
+#include <dt-bindings/pinctrl/r7s72100-pinctrl.h>
 
 / {
 	model = "GR-Peach";
@@ -52,6 +53,13 @@
 	};
 };
 
+&pinctrl {
+	scif2_pins: serial2 {
+		/* P6_2 as RxD2; P6_3 as TxD2 */
+		pinmux = <RZA1_PINMUX(6, 2, 7)>, <RZA1_PINMUX(6, 3, 7)>;
+	};
+};
+
 &extal_clk {
 	clock-frequency = <13333000>;
 };
@@ -61,5 +69,8 @@
 };
 
 &scif2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&scif2_pins>;
+
 	status = "okay";
 };
-- 
2.7.4
