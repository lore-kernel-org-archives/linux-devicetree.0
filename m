From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 3/8] ARM: dts: imx6qdl-apalis/-colibri: prevent 1.8V modes
Date: Mon,  9 Jul 2018 17:48:43 +0200
Message-ID: <20180709154848.5401-3-stefan@agner.ch>
References: <20180709154848.5401-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180709154848.5401-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, marcel.ziswiler@toradex.com, max.krummenacher@toradex.com, maitysanchayan@gmail.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

Use no-1-8-v device tree property to indicate that the board does
not support 1.8V signaling. The property voltage-ranges seems not
appropriate in our case since we do not have level shifters in
place.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/imx6qdl-apalis.dtsi  | 6 +++---
 arch/arm/boot/dts/imx6qdl-colibri.dtsi | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
index 64fbee61de44..55bcea245df6 100644
--- a/arch/arm/boot/dts/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
@@ -457,7 +457,7 @@
 	pinctrl-0 = <&pinctrl_usdhc1_4bit &pinctrl_usdhc1_8bit>;
 	vqmmc-supply = <&reg_3p3v>;
 	bus-width = <8>;
-	voltage-ranges = <3300 3300>;
+	no-1-8-v;
 	status = "disabled";
 };
 
@@ -467,7 +467,7 @@
 	pinctrl-0 = <&pinctrl_usdhc2>;
 	vqmmc-supply = <&reg_3p3v>;
 	bus-width = <4>;
-	voltage-ranges = <3300 3300>;
+	no-1-8-v;
 	status = "disabled";
 };
 
@@ -477,7 +477,7 @@
 	pinctrl-0 = <&pinctrl_usdhc3>;
 	vqmmc-supply = <&reg_3p3v>;
 	bus-width = <8>;
-	voltage-ranges = <3300 3300>;
+	no-1-8-v;
 	non-removable;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
index 6e937ca20869..bb44829dacbe 100644
--- a/arch/arm/boot/dts/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
@@ -389,7 +389,7 @@
 	cd-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>; /* MMCD */
 	vqmmc-supply = <&reg_3p3v>;
 	bus-width = <4>;
-	voltage-ranges = <3300 3300>;
+	no-1-8-v;
 	status = "disabled";
 };
 
@@ -399,7 +399,7 @@
 	pinctrl-0 = <&pinctrl_usdhc3>;
 	vqmmc-supply = <&reg_3p3v>;
 	bus-width = <8>;
-	voltage-ranges = <3300 3300>;
+	no-1-8-v;
 	non-removable;
 	status = "okay";
 };
-- 
2.18.0
