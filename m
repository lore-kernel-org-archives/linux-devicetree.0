From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v6 5/8] arm: dts: genmai: Add SCIF2 pin group
Date: Thu, 22 Jun 2017 16:54:33 +0200
Message-ID: <1498143276-7976-6-git-send-email-jacopo+renesas@jmondi.org>
References: <1498143276-7976-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1498143276-7976-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, chris.brandt@renesas.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, aisheng.dong@nxp.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add pin configuration subnode for SCIF2 serial debug interface.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r7s72100-genmai.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index 52a7b58..af2083f 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -11,6 +11,7 @@
 
 /dts-v1/;
 #include "r7s72100.dtsi"
+#include <dt-bindings/pinctrl/r7s72100-pinctrl.h>
 
 / {
 	model = "Genmai";
@@ -36,6 +37,14 @@
 	};
 };
 
+&pinctrl {
+
+	scif2_pins: serial2 {
+		/* P3_0 as TxD2; P3_2 as RxD2 */
+		pinmux = <RZA1_PINMUX(3, 0, 6)>, <RZA1_PINMUX(3, 2, 4)>;
+	};
+};
+
 &extal_clk {
 	clock-frequency = <13330000>;
 };
@@ -68,6 +77,9 @@
 };
 
 &scif2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&scif2_pins>;
+
 	status = "okay";
 };
 
-- 
2.7.4
