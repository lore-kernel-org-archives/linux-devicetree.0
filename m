Return-Path: <SRS0=1wp7=R5=linaro.org=rui.silva@kernel.org>
From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v2 1/5] ARM: dts: imx7s: add mipi phy power domain
Date: Tue, 26 Mar 2019 11:02:23 +0000
Message-Id: <20190326110227.7324-2-rui.silva@linaro.org>
In-Reply-To: <20190326110227.7324-1-rui.silva@linaro.org>
References: <20190326110227.7324-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Add power domain index 0 related with mipi-phy to imx7s.

While at it rename pcie power-domain node to remove pgc prefix.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 arch/arm/boot/dts/imx7s.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index e88f53a4c7f4..9a680d3d6424 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -606,7 +606,13 @@
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					pgc_pcie_phy: pgc-power-domain@1 {
+					pgc_mipi_phy: power-domain@0 {
+						#power-domain-cells = <0>;
+						reg = <0>;
+						power-supply = <&reg_1p0d>;
+					};
+
+					pgc_pcie_phy: power-domain@1 {
 						#power-domain-cells = <0>;
 						reg = <1>;
 						power-supply = <&reg_1p0d>;
-- 
2.21.0
