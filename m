From: Joshua Clayton <stillcompiling@gmail.com>
Subject: [PATCH v9 3/3] ARM: dts: imx6q-evi: support cyclone-ps-spi
Date: Tue, 24 Jan 2017 14:19:34 -0800
Message-ID: <8466629f15d8c34be20d574012b0e829680a6393.1485295905.git.stillcompiling@gmail.com>
References: <cover.1485295905.git.stillcompiling@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1485295905.git.stillcompiling@gmail.com>
In-Reply-To: <cover.1485295905.git.stillcompiling@gmail.com>
References: <cover.1485295905.git.stillcompiling@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <atull@opensource.altera.com>, Moritz Fischer <moritz.fischer@ettus.com>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Anatolij Gustschin <agust@denx.de>, Joshua Clayton <stillcompiling@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support for Altera cyclone V FPGA connected to an spi port
to the evi devicetree file

Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>
---
 arch/arm/boot/dts/imx6q-evi.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q-evi.dts b/arch/arm/boot/dts/imx6q-evi.dts
index 79a0bd5..e531bf7 100644
--- a/arch/arm/boot/dts/imx6q-evi.dts
+++ b/arch/arm/boot/dts/imx6q-evi.dts
@@ -83,6 +83,15 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi1 &pinctrl_ecspi1cs>;
 	status = "okay";
+
+	fpga_spi: cyclonespi@0 {
+		compatible = "altr,fpga-passive-serial";
+		spi-max-frequency = <20000000>;
+		reg = <0>;
+		pinctrl-0 = <&pinctrl_fpgaspi>;
+		nconfig-gpios = <&gpio4 9 GPIO_ACTIVE_LOW>;
+		nstat-gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &ecspi3 {
@@ -316,6 +325,13 @@
 		>;
 	};
 
+	pinctrl_fpgaspi: fpgaspigrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_ROW1__GPIO4_IO09 0x1b0b0
+			MX6QDL_PAD_KEY_ROW2__GPIO4_IO11 0x1b0b0
+		>;
+	};
+
 	pinctrl_gpminand: gpminandgrp {
 		fsl,pins = <
 			MX6QDL_PAD_NANDF_CLE__NAND_CLE 0xb0b1
-- 
2.9.3
