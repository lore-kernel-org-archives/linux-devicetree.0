From: Anson.Huang@nxp.com
Subject: [PATCH] dt-bindings: clock: imx8mn: Fix tab indentation for yaml file
Date: Thu, 25 Jul 2019 10:05:51 +0800
Message-ID: <20190725020551.27034-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

YAML file can NOT contain tab as indentation, fix it.

Fixes: 6d6062553e3d ("dt-bindings: imx: Add clock binding doc for i.MX8MN")
Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 Documentation/devicetree/bindings/clock/imx8mn-clock.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8mn-clock.yaml b/Documentation/devicetree/bindings/clock/imx8mn-clock.yaml
index 454c5b4..622f365 100644
--- a/Documentation/devicetree/bindings/clock/imx8mn-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8mn-clock.yaml
@@ -71,7 +71,7 @@ examples:
         compatible = "fixed-clock";
         #clock-cells = <0>;
         clock-frequency = <32768>;
-	clock-output-names = "osc_32k";
+        clock-output-names = "osc_32k";
     };
 
     osc_24m: clock-osc-24m {
-- 
2.7.4
