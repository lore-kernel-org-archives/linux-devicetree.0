From: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 6/7] arm: dts: genmai: Add RIIC2 pin group
Date: Mon, 20 Feb 2017 18:13:07 +0100
Message-ID: <1487610788-6939-7-git-send-email-jacopo+renesas@jmondi.org>
References: <1487610788-6939-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487610788-6939-1-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add pin configuration subnode for RIIC2 interface.

Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/r7s72100-genmai.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index f7be440..467a8a1 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -43,6 +43,12 @@
 		renesas,pins = <PIN(3, 0) 6>,
 			       <PIN(3, 2) (4 | INPUT_EN)>;
 	};
+
+	i2c2_pins: i2c2 {
+		/* RIIC2: P1_4 as SCL, P1_5 as SDA */
+		renesas,pins = <PIN(1, 4) (1 | INPUT_EN)>,
+			       <PIN(1, 5) (1 | INPUT_EN)>;
+	};
 };
 
 &extal_clk {
@@ -61,6 +67,9 @@
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
