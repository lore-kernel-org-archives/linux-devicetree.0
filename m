From: Peng Fan <van.freenix@gmail.com>
Subject: [PATCH 2/3] arm: dts: imx6ul: add ocotp node
Date: Tue, 19 Apr 2016 16:59:13 +0800
Message-ID: <1461056354-973-2-git-send-email-van.freenix@gmail.com>
References: <1461056354-973-1-git-send-email-van.freenix@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461056354-973-1-git-send-email-van.freenix@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, maxime.ripard@free-electrons.com, robh+dt@kernel.org, shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, van.freenix@gmail.com, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Add ocotp node for i.MX6UL

Signed-off-by: Peng Fan <van.freenix@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>
---
 arch/arm/boot/dts/imx6ul.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 7177899..aebd607 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -839,6 +839,12 @@
 				reg = <0x021b0000 0x4000>;
 			};
 
+			ocotp: ocotp@021bc000 {
+				compatible = "fsl,imx6ul-ocotp", "syscon";
+				reg = <0x021bc000 0x4000>;
+				clocks = <&clks IMX6UL_CLK_OCOTP>;
+			};
+
 			lcdif: lcdif@021c8000 {
 				compatible = "fsl,imx6ul-lcdif", "fsl,imx28-lcdif";
 				reg = <0x021c8000 0x4000>;
-- 
1.8.4.5
