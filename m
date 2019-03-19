Return-Path: <SRS0=/J0V=RW=linaro.org=rui.silva@kernel.org>
From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 4/5] ARM: dts: imx7s-warp: add csi and mipi_csi node
Date: Tue, 19 Mar 2019 17:00:02 +0000
Message-Id: <20190319170003.21261-5-rui.silva@linaro.org>
In-Reply-To: <20190319170003.21261-1-rui.silva@linaro.org>
References: <20190319170003.21261-1-rui.silva@linaro.org>
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
index 23431faecaf4..5158c2d958a7 100644
--- a/arch/arm/boot/dts/imx7s-warp.dts
+++ b/arch/arm/boot/dts/imx7s-warp.dts
@@ -277,6 +277,16 @@
 	status = "okay";
 };
 
+&csi {
+	status = "okay";
+};
+
+&mipi_csi {
+	clock-frequency = <166000000>;
+	status = "okay";
+	fsl,csis-hs-settle = <3>;
+};
+
 &wdog1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wdog>;
-- 
2.21.0
