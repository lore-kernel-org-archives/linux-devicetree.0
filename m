From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH 2/2] arm64: dts: imx8mn: Use "fsl,imx8mm-ocotp" as ocotp's fallback compatible
Date: Wed, 11 Sep 2019 10:24:47 -0400
Message-ID: <1568211887-19318-2-git-send-email-Anson.Huang@nxp.com>
References: <1568211887-19318-1-git-send-email-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568211887-19318-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com, daniel.lezcano@linaro.org, ping.bai@nxp.com, daniel.baluta@nxp.com, jun.li@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

Use "fsl,imx8mm-ocotp" as i.MX8MN ocotp's fallback compatible instead
of "fsl,imx7d-ocotp" to support SoC UID read, as i.MX8MN reuses
i.MX8MM's SoC ID driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index e4efe8d..6cb6c9c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -337,7 +337,7 @@
 			};
 
 			ocotp: ocotp-ctrl@30350000 {
-				compatible = "fsl,imx8mn-ocotp", "fsl,imx7d-ocotp", "syscon";
+				compatible = "fsl,imx8mn-ocotp", "fsl,imx8mm-ocotp", "syscon";
 				reg = <0x30350000 0x10000>;
 				clocks = <&clk IMX8MN_CLK_OCOTP_ROOT>;
 				#address-cells = <1>;
-- 
2.7.4
