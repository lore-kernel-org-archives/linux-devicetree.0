From: Peng Fan <van.freenix@gmail.com>
Subject: [PATCH 2/3] arm: dts: imx6sl: add clocks property for ocotp node
Date: Tue, 19 Apr 2016 16:33:07 +0800
Message-ID: <1461054788-339-2-git-send-email-van.freenix@gmail.com>
References: <1461054788-339-1-git-send-email-van.freenix@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461054788-339-1-git-send-email-van.freenix@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, srinivas.kandagatla@linaro.org, maxime.ripard@free-electrons.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, van.freenix@gmail.com, Sascha Hauer <kernel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Add clocks property for ocotp node.

Signed-off-by: Peng Fan <van.freenix@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>
---
 arch/arm/boot/dts/imx6sl.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index d12b250..b37da94 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -853,6 +853,7 @@
 			ocotp: ocotp@021bc000 {
 				compatible = "fsl,imx6sl-ocotp", "syscon";
 				reg = <0x021bc000 0x4000>;
+				clocks = <&clks IMX6SL_CLK_OCOTP>;
 			};
 
 			audmux: audmux@021d8000 {
-- 
1.8.4.5
