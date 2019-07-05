From: Anson.Huang@nxp.com
Subject: [PATCH V4 2/2] arm64: dts: imx8mm: Add "fsl,imx8mq-src" as src's fallback compatible
Date: Fri,  5 Jul 2019 16:54:06 +0800
Message-ID: <20190705085406.22483-2-Anson.Huang@nxp.com>
References: <20190705085406.22483-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705085406.22483-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com, viresh.kumar@linaro.org, daniel.baluta@nxp.com, ping.bai@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

i.MX8MM can reuse i.MX8MQ's src driver, add "fsl,imx8mq-src" as
src's fallback compatible to enable it.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
No changes.
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 9db8efd..da5ee11 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -502,7 +502,7 @@
 			};
 
 			src: reset-controller@30390000 {
-				compatible = "fsl,imx8mm-src", "syscon";
+				compatible = "fsl,imx8mm-src", "fsl,imx8mq-src", "syscon";
 				reg = <0x30390000 0x10000>;
 				interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
 				#reset-cells = <1>;
-- 
2.7.4
