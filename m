Return-Path: <SRS0=z2TU=TJ=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 14/17] ARCH: arm: dts: imx6qdl-kontron-samx6i: add boot spi-nor
Date: Thu,  9 May 2019 17:58:31 +0200
Message-Id: <20190509155834.22838-15-m.felsch@pengutronix.de>
In-Reply-To: <20190509155834.22838-1-m.felsch@pengutronix.de>
References: <20190509155834.22838-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, shawnguo@kernel.org, linux-imx@nxp.com
Cc: Stefan.Nickl@kontron.com, Gilles.Buloz@kontron.com, Michael.Brunner@kontron.com, thomas.schaefer@kontron.com, frieder.schrempf@kontron.de, kernel@pengutronix.de, devicetree@vger.kernel.org, Michael Grzeschik <m.grzeschik@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

From: Michael Grzeschik <m.grzeschik@pengutronix.de>

Since Kontron still uses silicon version below 1.3 they have add a
spi-nor to implement Workaround #1 of erratum ERR006282.

Sigend-off-by; Michael Grzeschik <m.grzeschik@pengutronix.de>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi b/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
index 0b45b3062358..7e60142f09c1 100644
--- a/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
@@ -255,6 +255,14 @@
 	pinctrl-0 = <&pinctrl_ecspi4>;
 	cs-gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>,
 		   <&gpio3 29 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+
+	/* default boot source: workaround #1 for errata ERR006282 */
+	m25p80@0 {
+		compatible = "winbond,w25q16dw", "jedec,spi-nor";
+		spi-max-frequency = <20000000>;
+		reg = <0>;
+	};
 };
 
 /* GBE */
-- 
2.20.1
