Return-Path: <SRS0=lk34=JJ=gmail.com=festevam@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: sram: Add 'clocks' as an optional property
Date: Sat, 23 Jun 2018 12:22:19 -0300
Message-Id: <1529767339-12539-1-git-send-email-festevam@gmail.com>
To: robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

From: Fabio Estevam <fabio.estevam@nxp.com>

Some SoCs (like i.MX53) need to specify the SRAM clock in the
device tree via the clocks property.

Add an entry to the optional property section.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 Documentation/devicetree/bindings/sram/sram.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.txt b/Documentation/devicetree/bindings/sram/sram.txt
index 267da44..05689c1 100644
--- a/Documentation/devicetree/bindings/sram/sram.txt
+++ b/Documentation/devicetree/bindings/sram/sram.txt
@@ -50,6 +50,7 @@ Optional properties in the area nodes:
 		 manipulation of the page attributes.
 - label : the name for the reserved partition, if omitted, the label
           is taken from the node name excluding the unit address.
+- clocks: the clock specifier that controls the SRAM clock.
 
 Example:
 
-- 
2.7.4
