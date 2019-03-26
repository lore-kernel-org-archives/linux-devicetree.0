Return-Path: <SRS0=1wp7=R5=linaro.org=rui.silva@kernel.org>
From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v2 4/5] ARM: dts: imx7s-warp: add csi and mipi_csi node
Date: Tue, 26 Mar 2019 11:02:26 +0000
Message-Id: <20190326110227.7324-5-rui.silva@linaro.org>
In-Reply-To: <20190326110227.7324-1-rui.silva@linaro.org>
References: <20190326110227.7324-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Add and enable csi and mipi_csi nodes.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 arch/arm/boot/dts/imx7s-warp.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s-warp.dts b/arch/arm/boot/dts/imx7s-warp.dts
index b1e956205e9a..0063fabfcd30 100644
--- a/arch/arm/boot/dts/imx7s-warp.dts
+++ b/arch/arm/boot/dts/imx7s-warp.dts
@@ -77,6 +77,10 @@
 	assigned-clock-rates = <884736000>;
 };
 
+&csi {
+	status = "okay";
+};
+
 &i2c1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c1>;
@@ -213,6 +217,12 @@
 	};
 };
 
+&mipi_csi {
+	clock-frequency = <166000000>;
+	fsl,csis-hs-settle = <3>;
+	status = "okay";
+};
+
 &sai1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai1>;
-- 
2.21.0
