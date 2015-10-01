From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 13/16] ARM: dts: lpc4357-ea4357: add i2c0 and devices
Date: Thu,  1 Oct 2015 22:54:50 +0200
Message-ID: <1443732893-17145-14-git-send-email-manabian@gmail.com>
References: <1443732893-17145-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443732893-17145-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add I2C0 and some of the I2C devices on the EA4357 dev kit.

Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/lpc4357-ea4357-devkit.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts b/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts
index 4d2d74a064c4..391121d24daa 100644
--- a/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts
+++ b/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts
@@ -332,6 +332,14 @@
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
 	sdmmc_pins: sdmmc-pins {
 		sdmmc_clk_cfg {
 			pins = "pc_0";
@@ -453,6 +461,23 @@
 	};
 };
 
+&i2c0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	clock-frequency = <400000>;
+
+	lm75@48 {
+		compatible = "nxp,lm75";
+		reg = <0x48>;
+	};
+
+	eeprom@57 {
+		compatible = "microchip,24c64";
+		reg = <0x57>;
+	};
+};
+
 &emc {
 	status = "okay";
 	pinctrl-names = "default";
-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
