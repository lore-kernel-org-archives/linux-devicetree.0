From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 1/8] ARM: dts: imx6q-apalis: add chosen node
Date: Mon,  9 Jul 2018 17:48:41 +0200
Message-ID: <20180709154848.5401-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, marcel.ziswiler@toradex.com, max.krummenacher@toradex.com, maitysanchayan@gmail.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

Add Apalis UART1 as default serial console.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/imx6q-apalis-eval.dts       | 4 ++++
 arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts | 4 ++++
 arch/arm/boot/dts/imx6q-apalis-ixora.dts      | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q-apalis-eval.dts b/arch/arm/boot/dts/imx6q-apalis-eval.dts
index aa0e631f3c0a..621d9709effa 100644
--- a/arch/arm/boot/dts/imx6q-apalis-eval.dts
+++ b/arch/arm/boot/dts/imx6q-apalis-eval.dts
@@ -62,6 +62,10 @@
 		rtc1 = &snvs_rtc;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts b/arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts
index e8dccf552122..4e1c8feaef82 100644
--- a/arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts
+++ b/arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts
@@ -63,6 +63,10 @@
 		rtc1 = &snvs_rtc;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/imx6q-apalis-ixora.dts b/arch/arm/boot/dts/imx6q-apalis-ixora.dts
index 6831dfd24cc1..469e3d0e2827 100644
--- a/arch/arm/boot/dts/imx6q-apalis-ixora.dts
+++ b/arch/arm/boot/dts/imx6q-apalis-ixora.dts
@@ -62,6 +62,10 @@
 		rtc1 = &snvs_rtc;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
-- 
2.18.0
