From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v3 6/7] arm: dts: genmai: Add RIIC2 pin group
Date: Fri, 24 Mar 2017 16:22:13 +0100
Message-ID: <1490368934-12494-7-git-send-email-jacopo+renesas@jmondi.org>
References: <1490368934-12494-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1490368934-12494-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, chris.brandt@renesas.com, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add pin configuration subnode for RIIC2 interface.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r7s72100-genmai.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index 569c86a..30992b1 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -44,6 +44,12 @@
 		renesas,pins = <PIN(3, 0) 6>,
 			       <PIN(3, 2) 4>;
 	};
+
+	i2c2_pins: i2c2 {
+		/* RIIC2: P1_4 as SCL, P1_5 as SDA */
+		renesas,pins = <PIN(1, 4) (1 | BI_DIR)>,
+			       <PIN(1, 5) (1 | BI_DIR)>;
+	};
 };
 
 &extal_clk {
@@ -62,6 +68,9 @@
 	status = "okay";
 	clock-frequency = <400000>;
 
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+
 	eeprom@50 {
 		compatible = "renesas,24c128";
 		reg = <0x50>;
-- 
2.7.4
