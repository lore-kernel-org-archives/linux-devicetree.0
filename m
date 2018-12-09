From: Lukasz Majewski <lukma@denx.de>
Subject: [PATCH v2] ARM: dts: vf610-bk4: Provide support for reading ID code from MVB device
Date: Sun,  9 Dec 2018 22:50:56 +0100
Message-ID: <20181209215056.22027-1-lukma@denx.de>
References: <20181113121213.14296-1-lukma@denx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181113121213.14296-1-lukma@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Stefan Agner <stefan@agner.ch>, Fabio Estevam <festevam@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, Lukasz Majewski <lukma@denx.de>
List-Id: devicetree@vger.kernel.org

The procedure to read this ID value is as follows:

rmmod spi_fsl_dspi
insmod spi-gpio.ko

echo 504 > /sys/class/gpio/export
cat /sys/class/gpio/gpio504/value
...
echo 511 > /sys/class/gpio/export
cat /sys/class/gpio/gpio511/value

rmmod spi-gpio.ko
insmod spi_fsl_dspi

Signed-off-by: Lukasz Majewski <lukma@denx.de>

---
Changes for v2:
- Add 'vf610-bk4:' to mail topic
- Change spi_gpio -> spi-gpio node name
- Change '72xx165' -> 'gpio' as described in
Documentation/devicetree/bindings/gpio/gpio-pisosr.txt
---
 arch/arm/boot/dts/vf610-bk4.dts | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/vf610-bk4.dts b/arch/arm/boot/dts/vf610-bk4.dts
index cab95714c058..c59a8922ccd5 100644
--- a/arch/arm/boot/dts/vf610-bk4.dts
+++ b/arch/arm/boot/dts/vf610-bk4.dts
@@ -59,6 +59,29 @@
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
+
+	spi-gpio {
+		compatible = "spi-gpio";
+		pinctrl-0 = <&pinctrl_gpio_spi>;
+		pinctrl-names = "default";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		/* PTD12 ->RPIO[91] */
+		sck-gpios  = <&gpio2 27 GPIO_ACTIVE_LOW>;
+		/* PTD10 ->RPIO[89] */
+		miso-gpios = <&gpio2 25 GPIO_ACTIVE_HIGH>;
+		num-chipselects = <0>;
+
+		gpio@0 {
+			compatible = "pisosr-gpio";
+			reg = <0>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			/* PTB18 -> RGPIO[40] */
+			load-gpios  = <&gpio1 8 GPIO_ACTIVE_LOW>;
+			spi-max-frequency = <100000>;
+		};
+	};
 };
 
 &adc0 {
@@ -430,6 +453,14 @@
 		>;
 	};
 
+	pinctrl_gpio_spi: pinctrl-gpio-spi {
+		fsl,pins = <
+			VF610_PAD_PTB18__GPIO_40        0x1183
+			VF610_PAD_PTD10__GPIO_89        0x1183
+			VF610_PAD_PTD12__GPIO_91        0x1183
+		>;
+	};
+
 	pinctrl_i2c2: i2c2grp {
 		fsl,pins = <
 			VF610_PAD_PTA22__I2C2_SCL               0x34df
-- 
2.11.0
