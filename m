From: Andra Danciu <andradanciu1997@gmail.com>
Subject: [PATCH v3 2/2] dt-bindings: arm: fsl: Add the pico-pi-imx8m board
Date: Thu, 18 Jul 2019 15:16:28 +0300
Message-ID: <20190718121628.23991-3-andradanciu1997@gmail.com>
References: <20190718121628.23991-1-andradanciu1997@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190718121628.23991-1-andradanciu1997@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, manivannan.sadhasivam@linaro.org, andrew.smirnov@gmail.com, u.kleine-koenig@pengutronix.de, aisheng.dong@nxp.com, andradanciu1997@gmail.com, leoyang.li@nxp.com, festevam@gmail.com, sriram.dash@nxp.com, l.stach@pengutronix.de, pankaj.bansal@nxp.com, ping.bai@nxp.com, pramod.kumar_1@nxp.com, bhaskar.upadhaya@nxp.com, richard.hu@technexion.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add an entry for TechNexion PICO-PI-IMX8M board based on i.MX8MQ SoC

Cc: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Andra Danciu <andradanciu1997@gmail.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 7294ac36f4c0..54c094341121 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -219,6 +219,7 @@ properties:
           - enum:
               - fsl,imx8mq-evk            # i.MX8MQ EVK Board
               - purism,librem5-devkit     # Purism Librem5 devkit
+              - technexion,pico-pi-imx8m  # TechNexion PICO-PI-8M evk
           - const: fsl,imx8mq
 
       - description: i.MX8QXP based Boards
-- 
2.11.0
