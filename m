Return-Path: <SRS0=v4++=QC=gmail.com=festevam@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: spi: imx: Add an entry for the i.MX8QM compatible
Date: Sat, 26 Jan 2019 19:30:11 -0200
Message-Id: <20190126213011.15738-1-festevam@gmail.com>
To: broonie@kernel.org
Cc: robh+dt@kernel.org, shawnguo@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Add an entry for the "fsl,imx8mq-ecspi" compatible to describe
the ECSPI version present on i.MX8M.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/spi/fsl-imx-cspi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl-imx-cspi.txt b/Documentation/devicetree/bindings/spi/fsl-imx-cspi.txt
index e3c48b20b1a6..2d3264140cc5 100644
--- a/Documentation/devicetree/bindings/spi/fsl-imx-cspi.txt
+++ b/Documentation/devicetree/bindings/spi/fsl-imx-cspi.txt
@@ -10,6 +10,7 @@ Required properties:
   - "fsl,imx35-cspi" for SPI compatible with the one integrated on i.MX35
   - "fsl,imx51-ecspi" for SPI compatible with the one integrated on i.MX51
   - "fsl,imx53-ecspi" for SPI compatible with the one integrated on i.MX53 and later Soc
+  - "fsl,imx8mq-ecspi" for SPI compatible with the one integrated on i.MX8M
 - reg : Offset and length of the register set for the device
 - interrupts : Should contain CSPI/eCSPI interrupt
 - clocks : Clock specifiers for both ipg and per clocks.
-- 
2.17.1
