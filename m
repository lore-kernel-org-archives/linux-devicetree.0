Return-Path: <SRS0=L7Fd=RW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55502 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbfCSRA2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Mar 2019 13:00:28 -0400
Received: by mail-wm1-f67.google.com with SMTP id 4so17593974wmf.5
        for <devicetree@vger.kernel.org>; Tue, 19 Mar 2019 10:00:27 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 5/5] ARM: dts: imx7s-warp: add ov2680 sensor node
Date: Tue, 19 Mar 2019 17:00:03 +0000
Message-Id: <20190319170003.21261-6-rui.silva@linaro.org>
In-Reply-To: <20190319170003.21261-1-rui.silva@linaro.org>
References: <20190319170003.21261-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Warp7 comes with a Omnivision OV2680 sensor, add the node here to make
complete the camera data path for this system. Add the needed regulator
to the analog voltage supply, the port and endpoints in mipi_csi node
and the pinctrl for the reset gpio.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 arch/arm/boot/dts/imx7s-warp.dts | 45 ++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s-warp.dts b/arch/arm/boot/dts/imx7s-warp.dts
index 5158c2d958a7..6ca68ab33b61 100644
--- a/arch/arm/boot/dts/imx7s-warp.dts
+++ b/arch/arm/boot/dts/imx7s-warp.dts
@@ -55,6 +55,14 @@
 		regulator-always-on;
 	};
 
+	reg_peri_3p15v: regulator-peri-3p15v {
+		compatible = "regulator-fixed";
+		regulator-name = "peri_3p15v_reg";
+		regulator-min-microvolt = <3150000>;
+		regulator-max-microvolt = <3150000>;
+		regulator-always-on;
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "imx7-sgtl5000";
@@ -178,6 +186,27 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
+
+	ov2680: camera@36 {
+		compatible = "ovti,ov2680";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ov2680>;
+		reg = <0x36>;
+		clocks = <&osc>;
+		clock-names = "xvclk";
+		reset-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
+		DOVDD-supply = <&sw2_reg>;
+		DVDD-supply = <&sw2_reg>;
+		AVDD-supply = <&reg_peri_3p15v>;
+
+		port {
+			ov2680_to_mipi: endpoint {
+				remote-endpoint = <&mipi_from_sensor>;
+				clock-lanes = <0>;
+				data-lanes = <1>;
+			};
+		};
+	};
 };
 
 &i2c3 {
@@ -285,6 +314,16 @@
 	clock-frequency = <166000000>;
 	status = "okay";
 	fsl,csis-hs-settle = <3>;
+
+	port@0 {
+		reg = <0>;
+
+		mipi_from_sensor: endpoint {
+			remote-endpoint = <&ov2680_to_mipi>;
+			data-lanes = <1>;
+		};
+
+	};
 };
 
 &wdog1 {
@@ -341,6 +380,12 @@
 		>;
 	};
 
+	pinctrl_ov2680: ov2660grp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO03__GPIO1_IO3	0x14
+		>;
+	};
+
 	pinctrl_sai1: sai1grp {
 		fsl,pins = <
 			MX7D_PAD_SAI1_RX_DATA__SAI1_RX_DATA0	0x1f
-- 
2.21.0
