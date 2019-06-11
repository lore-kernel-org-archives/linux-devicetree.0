From: Anson.Huang@nxp.com
Subject: [PATCH 3/3] arm64: dts: imx8qxp: Add fallback compatible string for RTC node
Date: Tue, 11 Jun 2019 14:33:33 +0800
Message-ID: <20190611063333.48501-3-Anson.Huang@nxp.com>
References: <20190611063333.48501-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190611063333.48501-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com, aisheng.dong@nxp.com, ulf.hansson@linaro.org, peng.fan@nxp.com, daniel.baluta@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

The i.MX system controller RTC driver uses generic compatible
string to support all i.MX SoCs with system controller inside,
this patch adds the generic system controller RTC compatible
string as fallback compatible string accordingly.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 12044be..40811a2 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -162,7 +162,7 @@
 		};
 
 		rtc: rtc {
-			compatible = "fsl,imx8qxp-sc-rtc";
+			compatible = "fsl,imx8qxp-sc-rtc", "fsl,imx-sc-rtc";
 		};
 
 		watchdog {
-- 
2.7.4
