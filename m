Return-Path: <SRS0=KxQt=R7=linaro.org=rui.silva@kernel.org>
From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v3 4/5] ARM: dts: imx7s-warp: add csi and mipi_csi node
Date: Thu, 28 Mar 2019 14:25:15 +0000
Message-Id: <20190328142516.30372-5-rui.silva@linaro.org>
In-Reply-To: <20190328142516.30372-1-rui.silva@linaro.org>
References: <20190328142516.30372-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Add and enable csi and mipi_csi nodes.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 arch/arm/boot/dts/imx7s-warp.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s-warp.dts b/arch/arm/boot/dts/imx7s-warp.dts
index b1e956205e9a..2d1a0105e6a6 100644
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
@@ -279,6 +289,10 @@
 	status = "okay";
 };
 
+&video_mux {
+	status = "okay";
+};
+
 &wdog1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wdog>;
-- 
2.21.0
