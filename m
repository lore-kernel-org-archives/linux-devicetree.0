From: Anson.Huang@nxp.com
Subject: [PATCH 1/3] dt-bindings: fsl: scu: Update RTC compatible string
Date: Tue, 11 Jun 2019 14:33:31 +0800
Message-ID: <20190611063333.48501-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com, aisheng.dong@nxp.com, ulf.hansson@linaro.org, peng.fan@nxp.com, daniel.baluta@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Update RTC compatible string to make system controller RTC
driver more generic for all i.MX SoCs with system controller
inside.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
This patch should be based on below patch which is already picked by
watchdog maintainer:
https://patchwork.kernel.org/patch/10962183/
---
 Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
index fc3844e..7ca20a1 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
@@ -131,7 +131,9 @@ RTC bindings based on SCU Message Protocol
 ------------------------------------------------------------
 
 Required properties:
-- compatible: should be "fsl,imx8qxp-sc-rtc";
+- compatible: should be:
+              "fsl,imx8qxp-sc-rtc"
+              followed by "fsl,imx-sc-rtc";
 
 OCOTP bindings based on SCU Message Protocol
 ------------------------------------------------------------
@@ -226,7 +228,7 @@ firmware {
 		};
 
 		rtc: rtc {
-			compatible = "fsl,imx8qxp-sc-rtc";
+			compatible = "fsl,imx8qxp-sc-rtc", "fsl,imx-sc-rtc";
 		};
 
 		watchdog {
-- 
2.7.4
