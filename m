Return-Path: <SRS0=z2TU=TJ=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 12/17] ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC Watchdog
Date: Thu,  9 May 2019 17:58:29 +0200
Message-Id: <20190509155834.22838-13-m.felsch@pengutronix.de>
In-Reply-To: <20190509155834.22838-1-m.felsch@pengutronix.de>
References: <20190509155834.22838-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, shawnguo@kernel.org, linux-imx@nxp.com
Cc: Stefan.Nickl@kontron.com, Gilles.Buloz@kontron.com, Michael.Brunner@kontron.com, thomas.schaefer@kontron.com, frieder.schrempf@kontron.de, kernel@pengutronix.de, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add support according the SMARC Spec 1.1 [1] and provided schematics.

Kontron connected the pin to the SoM CPLD too. The CPLD performs after a
30s timeout so we need to enable the watchdog per default.

[1] https://sget.org/standards/smarc

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi b/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
index 1b2764a9ba7f..e62f349a351a 100644
--- a/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
@@ -691,6 +691,12 @@
 			MX6QDL_PAD_SD4_DAT7__SD4_DATA7 0x17059
 		>;
 	};
+
+	pinctrl_wdog1: wdog1rp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_9__WDOG1_B	0x1b0b0
+		>;
+	};
 };
 
 &mipi_csi {
@@ -770,3 +776,10 @@
 	no-1-8-v;
 	non-removable;
 };
+
+&wdog1 {
+	/* CPLD is feeded by watchdog (hardwired) */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog1>;
+	status = "okay";
+};
-- 
2.20.1
