From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH V3 3/4] ARM: dts: imx6sx-sabreauto: add IO expander max7310 support
Date: Wed, 25 Apr 2018 11:30:32 +0800
Message-ID: <1524627033-535-3-git-send-email-Anson.Huang@nxp.com>
References: <1524627033-535-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524627033-535-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

i.MX6SX Sabre Auto board has two max7310 IO expander
on I2C3 bus, add support for them.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
no changes since V2.
 arch/arm/boot/dts/imx6sx-sabreauto.dts | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sx-sabreauto.dts b/arch/arm/boot/dts/imx6sx-sabreauto.dts
index d59084f..812f40b 100644
--- a/arch/arm/boot/dts/imx6sx-sabreauto.dts
+++ b/arch/arm/boot/dts/imx6sx-sabreauto.dts
@@ -82,6 +82,13 @@
 			>;
 		};
 
+		pinctrl_i2c3_2: i2c3grp-2 {
+			fsl,pins = <
+				MX6SX_PAD_KEY_ROW4__I2C3_SDA            0x4001b8b1
+				MX6SX_PAD_KEY_COL4__I2C3_SCL            0x4001b8b1
+			>;
+		};
+
 		pinctrl_uart1: uart1grp {
 			fsl,pins = <
 				MX6SX_PAD_GPIO1_IO04__UART1_TX		0x1b0b1
@@ -272,3 +279,24 @@
 		};
 	};
 };
+
+&i2c3 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3_2>;
+	status = "okay";
+
+	max7310_a: gpio@30 {
+		compatible = "maxim,max7310";
+		reg = <0x30>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	max7310_b: gpio@32 {
+		compatible = "maxim,max7310";
+		reg = <0x32>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
-- 
2.7.4
