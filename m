From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
Subject: [PATCH 07/12] ARM: dts: imx7d: cl-som-imx7: add/enable SPI flash on spi1
Date: Mon, 26 Aug 2019 16:37:55 +0100
Message-ID: <20190826153800.35400-7-git@andred.net>
References: <20190826153800.35400-1-git@andred.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190826153800.35400-1-git@andred.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>, Ilya Ledvich <ilya@compulab.co.il>, Igor Grinberg <grinberg@compulab.co.il>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

add/enable SPI flash on spi1 using the default vendor's
partition layout as per downstream kernel

Signed-off-by: André Draszik <git@andred.net>
Cc: Ilya Ledvich <ilya@compulab.co.il>
Cc: Igor Grinberg <grinberg@compulab.co.il>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 45 +++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
index ca3c5d95d6c3..d4637a8ca223 100644
--- a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
+++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
@@ -28,6 +28,36 @@
 	cpu-supply = <&sw1a_reg>;
 };
 
+&ecspi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi1 &pinctrl_ecspi1_cs>;
+	cs-gpios = <&gpio4 19 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+
+	flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "jedec,spi-nor";
+		spi-max-frequency = <20000000>;
+		reg = <0>;
+
+		partition@0 {
+			label = "uboot";
+			reg = <0x0 0xc0000>;
+		};
+
+		partition@c0000 {
+			label = "uboot environment";
+			reg = <0xc0000 0x40000>;
+		};
+
+		partition@100000 {
+			label = "splash";
+			reg = <0x100000 0x100000>;
+		};
+	};
+};
+
 &fec1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_enet1 &pinctrl_enet1phy>;
@@ -214,6 +244,21 @@
 };
 
 &iomuxc {
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX7D_PAD_ECSPI1_MOSI__ECSPI1_MOSI		0xf
+			MX7D_PAD_ECSPI1_MISO__ECSPI1_MISO		0xf
+			MX7D_PAD_ECSPI1_SCLK__ECSPI1_SCLK		0xf
+		>;
+	};
+
+	pinctrl_ecspi1_cs: ecspi1_cs_grp {
+		fsl,pins = <
+			/* SPI flash chipselect */
+			MX7D_PAD_ECSPI1_SS0__GPIO4_IO19			0x34
+		>;
+	};
+
 	pinctrl_enet1: enet1grp {
 		fsl,pins = <
 			MX7D_PAD_SD2_CD_B__ENET1_MDIO			0x30
-- 
2.23.0.rc1
