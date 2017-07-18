From: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2] ARM: dts: imx6: RIoTboard provide gpio-line-names
Date: Tue, 18 Jul 2017 07:40:22 +0200
Message-ID: <20170718054022.2867-1-o.rempel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

gpio-line-names may help to make work with GPIOs from user space easier.
Following examples are provided with libgpiod
https://github.com/brgl/libgpiod :
|# Toggle a GPIO by name, then wait for the user to press ENTER.
|$ gpioset --mode=wait `gpiofind "USR-LED-2"`=1
|# Pause execution until a single event of any type occurs. Don't print
|# anything. Find the line by name.
|$ gpiomon --num-events=1 --silent `gpiofind "USR-IN"`

Used names was taken from RIoTboard schematics, version 1 (2013.12.07).

Signed-off-by: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6dl-riotboard.dts | 45 ++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/imx6dl-riotboard.dts b/arch/arm/boot/dts/imx6dl-riotboard.dts
index 2cb72824e800..3ecd3913280f 100644
--- a/arch/arm/boot/dts/imx6dl-riotboard.dts
+++ b/arch/arm/boot/dts/imx6dl-riotboard.dts
@@ -101,6 +101,51 @@
 	status = "okay";
 };
 
+&gpio1 {
+	gpio-line-names =
+		"", "", "SD2_WP", "", "SD2_CD", "I2C3_SCL",
+			"I2C3_SDA", "I2C4_SCL",
+		"I2C4_SDA", "", "", "", "", "", "", "",
+		"", "PWM3", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
+&gpio3 {
+	gpio-line-names =
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "USB_OTG_VBUS", "",
+		"UART3_TXD", "UART3_RXD", "", "", "EIM_D28", "", "", "";
+};
+
+&gpio4 {
+	gpio-line-names =
+		"", "", "", "", "", "", "UART4_TXD", "UART4_RXD",
+		"UART5_TXD", "UART5_RXD", "", "", "", "", "", "",
+		"GPIO4_16", "GPIO4_17", "GPIO4_18", "GPIO4_19", "",
+			"CSPI3_CLK", "CSPI3_MOSI", "CSPI3_MISO",
+		"CSPI3_CS0", "CSPI3_CS1", "GPIO4_26", "GPIO4_27",
+			"CSPI3_RDY", "PWM1", "PWM2", "GPIO4_31";
+};
+
+&gpio5 {
+	gpio-line-names =
+		"", "", "EIM_A25", "", "", "GPIO5_05", "GPIO5_06",
+			"GPIO5_07",
+		"GPIO5_08", "CSPI2_CS1", "CSPI2_MOSI", "CSPI2_MISO",
+			"CSPI2_CS0", "CSPI2_CLK", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
+&gpio7 {
+	gpio-line-names =
+		"SD3_CD", "SD3_WP", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
 &hdmi {
 	ddc-i2c-bus = <&i2c2>;
 	status = "okay";
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
