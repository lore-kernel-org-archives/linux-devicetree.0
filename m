Return-Path: <SRS0=RcEj=LO=gmail.com=festevam@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2] dt-bindings: imx-lpi2c: Remove mx8dv compatible entry
Date: Fri, 31 Aug 2018 10:24:14 -0300
Message-Id: <1535721855-5595-1-git-send-email-festevam@gmail.com>
To: wsa@the-dreams.de
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-imx@nxp.com, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

From: Fabio Estevam <fabio.estevam@nxp.com>

mx8dv never entered into production and there is no other place
in the kernel referring to this SoC, so remove it from the
dt bindings documentation.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt
index 00e4365..091c8df 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt
@@ -3,7 +3,6 @@
 Required properties:
 - compatible :
   - "fsl,imx7ulp-lpi2c" for LPI2C compatible with the one integrated on i.MX7ULP soc
-  - "fsl,imx8dv-lpi2c" for LPI2C compatible with the one integrated on i.MX8DV soc
 - reg : address and length of the lpi2c master registers
 - interrupts : lpi2c interrupt
 - clocks : lpi2c clock specifier
@@ -11,7 +10,7 @@ Required properties:
 Examples:
 
 lpi2c7: lpi2c7@40a50000 {
-	compatible = "fsl,imx8dv-lpi2c";
+	compatible = "fsl,imx7ulp-lpi2c";
 	reg = <0x40A50000 0x10000>;
 	interrupt-parent = <&intc>;
 	interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.7.4
