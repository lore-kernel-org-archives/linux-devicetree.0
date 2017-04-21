From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 5/5] ARM: dts: imx7-colibri: add NAND support
Date: Thu, 20 Apr 2017 18:07:55 -0700
Message-ID: <20170421010755.18025-6-stefan@agner.ch>
References: <20170421010755.18025-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170421010755.18025-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@atmel.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, kernel@pengutronix.de, han.xu@nxp.com, fabio.estevam@freescale.com, LW@KARO-electronics.de, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

The Colibri iMX7 modules come with 512MB on-module SLC NAND flash
populated. Make use of it by enabling the GPMI controller.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/imx7-colibri.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi b/arch/arm/boot/dts/imx7-colibri.dtsi
index 2d87489f9105..ad4ce19d455b 100644
--- a/arch/arm/boot/dts/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/imx7-colibri.dtsi
@@ -106,6 +106,15 @@
 	fsl,magic-packet;
 };
 
+&gpmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	fsl,use-minimum-ecc;
+	nand-on-flash-bbt;
+	nand-ecc-mode = "hw";
+	status = "okay";
+};
+
 &i2c1 {
 	clock-frequency = <100000>;
 	pinctrl-names = "default";
-- 
2.12.2
