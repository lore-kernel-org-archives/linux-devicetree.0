From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 15/16] ARM: dts: lpc4350-hitex-eval: add i2c0 and devices
Date: Thu,  1 Oct 2015 22:54:52 +0200
Message-ID: <1443732893-17145-16-git-send-email-manabian@gmail.com>
References: <1443732893-17145-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443732893-17145-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>

Add the I2C0 bus and the some of the I2C devices on the Hitex
LPC4350 eval board.

Signed-off-by: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/lpc4350-hitex-eval.dts | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/lpc4350-hitex-eval.dts b/arch/arm/boot/dts/lpc4350-hitex-eval.dts
index c1dd76e5fc45..5c529f45947b 100644
--- a/arch/arm/boot/dts/lpc4350-hitex-eval.dts
+++ b/arch/arm/boot/dts/lpc4350-hitex-eval.dts
@@ -186,6 +186,14 @@
 		};
 	};
 
+	i2c0_pins: i2c0-pins {
+		i2c0_pins_cfg {
+			pins = "i2c0_scl", "i2c0_sda";
+			function = "i2c0";
+			input-enable;
+		};
+	};
+
 	spifi_pins: spifi-pins {
 		spifi_clk_cfg {
 			pins = "p3_3";
@@ -300,6 +308,31 @@
 	clock-frequency = <25000000>;
 };
 
+&i2c0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	clock-frequency = <400000>;
+
+	/* NXP SE97BTP with temperature sensor + eeprom */
+	sensor@18 {
+		compatible = "nxp,jc42";
+		reg = <0x18>;
+	};
+
+	eeprom@50 {
+		compatible = "nxp,24c02";
+		reg = <0x50>;
+	};
+
+	pca_gpio: gpio@24 {
+		compatible = "nxp,pca9673";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
 &mac {
 	status = "okay";
 	phy-mode = "mii";
-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
