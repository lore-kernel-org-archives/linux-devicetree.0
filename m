From: Alex Gonzalez <alex.gonzalez@digi.com>
Subject: [PATCH 2/2] ARM: dts: ccimx6ulsbcpro: Add support for Goodix touch controller
Date: Mon, 22 Oct 2018 12:33:19 +0200
Message-ID: <1540204399-12982-3-git-send-email-alex.gonzalez@digi.com>
References: <1540204399-12982-1-git-send-email-alex.gonzalez@digi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540204399-12982-1-git-send-email-alex.gonzalez@digi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alex.gonzalez@digi.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alex Gonzalez <alex.gonzalez@digi.com>
---
 arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts | 19 +++++++++++++++++++
 arch/arm/configs/imx_v6_v7_defconfig        |  1 +
 2 files changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts b/arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts
index ac9ae4ac77ba..2e7927930d4f 100644
--- a/arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts
+++ b/arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts
@@ -105,6 +105,19 @@
 	};
 };
 
+&i2c1 {
+	touchscreen@14 {
+		compatible = "goodix,gt911";
+		reg = <0x14>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_goodix_touch>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <2 IRQ_TYPE_EDGE_RISING>;
+		irq-gpios = <&gpio5 2 GPIO_ACTIVE_HIGH>;
+		status = "okay";
+	};
+};
+
 &lcdif {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lcdif_dat0_17
@@ -297,6 +310,12 @@
 		>;
 	};
 
+	pinctrl_goodix_touch: goodixgrp{
+		fsl,pins = <
+			MX6UL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1020
+		>;
+	};
+
 	pinctrl_lcdif_dat0_17: lcdifdatgrp0-17 {
 		fsl,pins = <
 			MX6UL_PAD_LCD_DATA00__LCDIF_DATA00	0x79
diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 7eca43ff69bb..d6e947307d67 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -170,6 +170,7 @@ CONFIG_MOUSE_PS2_ELANTECH=y
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ADS7846=y
 CONFIG_TOUCHSCREEN_EGALAX=y
+CONFIG_TOUCHSCREEN_GOODIX=y
 CONFIG_TOUCHSCREEN_MAX11801=y
 CONFIG_TOUCHSCREEN_IMX6UL_TSC=y
 CONFIG_TOUCHSCREEN_EDT_FT5X06=y
