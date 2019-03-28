Return-Path: <SRS0=pEqb=R7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33715 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfC1OZb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 Mar 2019 10:25:31 -0400
Received: by mail-wr1-f65.google.com with SMTP id q1so23178704wrp.0
        for <devicetree@vger.kernel.org>; Thu, 28 Mar 2019 07:25:30 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v3 3/5] ARM: dts: imx7s: Add video mux, csi and mipi_csi
Date: Thu, 28 Mar 2019 14:25:14 +0000
Message-Id: <20190328142516.30372-4-rui.silva@linaro.org>
In-Reply-To: <20190328142516.30372-1-rui.silva@linaro.org>
References: <20190328142516.30372-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Add device tree nodes for csi, video multiplexer and mipi-csi.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 arch/arm/boot/dts/imx7s.dtsi | 75 ++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 792efcd2caa1..3286838105c6 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/imx7-reset.h>
 #include "imx7d-pinfunc.h"
 
 / {
@@ -506,6 +507,34 @@
 					#mux-control-cells = <0>;
 					mux-reg-masks = <0x14 0x00000010>;
 				};
+
+				video_mux: csi-mux {
+					compatible = "video-mux";
+					mux-controls = <&mux 0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					status = "disabled";
+
+					port@0 {
+						reg = <0>;
+					};
+
+					port@1 {
+						reg = <1>;
+
+						csi_mux_from_mipi_vc0: endpoint {
+							remote-endpoint = <&mipi_vc0_to_csi_mux>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						csi_mux_to_csi: endpoint {
+							remote-endpoint = <&csi_from_csi_mux>;
+						};
+					};
+				};
 			};
 
 			ocotp: ocotp-ctrl@30350000 {
@@ -709,6 +738,23 @@
 				status = "disabled";
 			};
 
+			csi: csi@30710000 {
+				compatible = "fsl,imx7-csi";
+				reg = <0x30710000 0x10000>;
+				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX7D_CLK_DUMMY>,
+					 <&clks IMX7D_CSI_MCLK_ROOT_CLK>,
+					 <&clks IMX7D_CLK_DUMMY>;
+				clock-names = "axi", "mclk", "dcic";
+				status = "disabled";
+
+				port {
+					csi_from_csi_mux: endpoint {
+						remote-endpoint = <&csi_mux_to_csi>;
+					};
+				};
+			};
+
 			lcdif: lcdif@30730000 {
 				compatible = "fsl,imx7d-lcdif", "fsl,imx28-lcdif";
 				reg = <0x30730000 0x10000>;
@@ -718,6 +764,35 @@
 				clock-names = "pix", "axi";
 				status = "disabled";
 			};
+
+			mipi_csi: mipi-csi@30750000 {
+				compatible = "fsl,imx7-mipi-csi2";
+				reg = <0x30750000 0x10000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX7D_IPG_ROOT_CLK>,
+					 <&clks IMX7D_MIPI_CSI_ROOT_CLK>,
+					 <&clks IMX7D_MIPI_DPHY_ROOT_CLK>;
+				clock-names = "pclk", "wrap", "phy";
+				power-domains = <&pgc_mipi_phy>;
+				phy-supply = <&reg_1p0d>;
+				resets = <&src IMX7_RESET_MIPI_PHY_MRST>;
+				reset-names = "mrst";
+				status = "disabled";
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_vc0_to_csi_mux: endpoint {
+						remote-endpoint = <&csi_mux_from_mipi_vc0>;
+					};
+				};
+			};
 		};
 
 		aips3: aips-bus@30800000 {
-- 
2.21.0
