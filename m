From: tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org
Subject: [PATCH v1 2/6] ARM: dts: imx7d-cl-som: add nodes for usbh, and usbotg2
Date: Tue,  5 Dec 2017 14:27:03 -0800
Message-ID: <20171205222707.11302-3-tyler@opensourcefoundries.com>
References: <20171205222707.11302-1-tyler@opensourcefoundries.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171205222707.11302-1-tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, Tyler Baker <tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Tyler Baker <tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org>

Add device tree nodes for the USB hub, and USB OTG. i2c2 on this
platform supports low state retention power state so lets use it.

Signed-off-by: Tyler Baker <tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org>
---
 arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 34 ++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
index ae45af1..49bd371 100644
--- a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
+++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
@@ -30,6 +30,16 @@
 		gpio = <&gpio1 5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	reg_usbh_nreset: regulator-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb_host_nreset";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pca9555 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
 };
 
 &cpu0 {
@@ -199,6 +209,16 @@
 	status = "okay";
 };
 
+&usbotg2 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usbh {
+	vbus-supply = <&reg_usbh_nreset>;
+	status = "okay";
+};
+
 &usdhc3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usdhc3>;
@@ -247,13 +267,6 @@
 		>;
 	};
 
-	pinctrl_i2c2: i2c2grp {
-		fsl,pins = <
-			MX7D_PAD_I2C2_SDA__I2C2_SDA		0x4000007f
-			MX7D_PAD_I2C2_SCL__I2C2_SCL		0x4000007f
-		>;
-	};
-
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX7D_PAD_UART1_TX_DATA__UART1_DCE_TX	0x79
@@ -284,4 +297,11 @@
 			MX7D_PAD_LPSR_GPIO1_IO05__GPIO1_IO5	0x14 /* OTG PWREN */
 		>;
 	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO07__I2C2_SDA		0x4000000f
+			MX7D_PAD_LPSR_GPIO1_IO06__I2C2_SCL		0x4000000f
+		>;
+	};
 };
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
