From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v4 17/21] ARM: dtsi: imx6qdl: Add support for MIPI DSI host controller
Date: Tue, 23 Dec 2014 18:02:15 +0800
Message-ID: <1419328939-22758-18-git-send-email-Ying.Liu@freescale.com>
References: <1419328939-22758-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1419328939-22758-1-git-send-email-Ying.Liu@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk, kernel@pengutronix.de, p.zabel@pengutronix.de, thierry.reding@gmail.com, shawn.guo@linaro.org, mturquette@linaro.org, airlied@linux.ie, andyshrk@gmail.com, stefan.wahren@i2se.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds support for MIPI DSI host controller.

Signed-off-by: Liu Ying <Ying.Liu@freescale.com>
---
v3->v4:
 * None.

v2->v3:
 * As suggested by Phillip Zabel, change the clocks and the clock-names
   properties to use the pllref and core_cfg clocks only.

v1->v2:
 * None.

 arch/arm/boot/dts/imx6qdl.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 96bf2a0..7b1c313 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -1006,7 +1006,13 @@
 			mipi_dsi: mipi@021e0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
+				compatible = "fsl,imx6q-mipi-dsi";
 				reg = <0x021e0000 0x4000>;
+				interrupts = <0 102 IRQ_TYPE_LEVEL_HIGH>;
+				gpr = <&gpr>;
+				clocks = <&clks IMX6QDL_CLK_MIPI_CORE_CFG>,
+					 <&clks IMX6QDL_CLK_MIPI_CORE_CFG>;
+				clock-names = "pllref", "core_cfg";
 				status = "disabled";
 
 				ports {
-- 
2.1.0
