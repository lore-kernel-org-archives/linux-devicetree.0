From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH] ARM: dts: imx6sx: add pu power domain support
Date: Tue, 23 Jan 2018 23:12:23 +0800
Message-ID: <1516720343-21933-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, aisheng.dong@nxp.com, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add PU power domain support, GPU is the only
module inside PU power domain, and PU power
is supplied by LDO_SOC.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6sx.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index fd78793..42ef4c6 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -188,6 +188,7 @@
 				 <&clks IMX6SX_CLK_GPU>,
 				 <&clks IMX6SX_CLK_GPU>;
 			clock-names = "bus", "core", "shader";
+			power-domains = <&pd_pu>;
 		};
 
 		dma_apbh: dma-apbh@1804000 {
@@ -767,6 +768,13 @@
 					#address-cells = <1>;
 					#size-cells = <0>;
 
+					pd_pu: power-domain@1 {
+						reg = <1>;
+						#power-domain-cells = <0>;
+						power-supply = <&reg_soc>;
+						clocks = <&clks IMX6SX_CLK_GPU>;
+					};
+
 					pd_pci: power-domain@3 {
 						reg = <3>;
 						#power-domain-cells = <0>;
-- 
2.7.4
