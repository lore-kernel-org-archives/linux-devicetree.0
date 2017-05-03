From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Subject: [PATCH] ARM: dts: imx: add DH2228FV DAC to Gateworks Ventana boards with SPI
Date: Wed,  3 May 2017 08:04:54 -0700
Message-ID: <1493823894-2107-1-git-send-email-tharvey@gateworks.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-gw52xx.dtsi | 6 ++++++
 arch/arm/boot/dts/imx6qdl-gw54xx.dtsi | 6 ++++++
 arch/arm/boot/dts/imx6qdl-gw560x.dtsi | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
index 91991d6..b5c1a8f 100644
--- a/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
@@ -143,6 +143,12 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi3>;
 	status = "okay";
+
+	spidev0: spidev@0 {
+		compatible = "rohm,dh2228fv";
+		reg = <0>;
+		spi-max-frequency = <60000000>;
+	};
 };
 
 &fec {
diff --git a/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
index 968fda9..9d26511 100644
--- a/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
@@ -154,6 +154,12 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi2>;
 	status = "okay";
+
+	spidev0: spidev@0 {
+		compatible = "rohm,dh2228fv";
+		reg = <0>;
+		spi-max-frequency = <60000000>;
+	};
 };
 
 &fec {
diff --git a/arch/arm/boot/dts/imx6qdl-gw560x.dtsi b/arch/arm/boot/dts/imx6qdl-gw560x.dtsi
index d894dde..bfb63e9 100644
--- a/arch/arm/boot/dts/imx6qdl-gw560x.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw560x.dtsi
@@ -208,6 +208,12 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi3>;
 	status = "okay";
+
+	spidev0: spidev@0 {
+		compatible = "rohm,dh2228fv";
+		reg = <0>;
+		spi-max-frequency = <60000000>;
+	};
 };
 
 &can1 {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
