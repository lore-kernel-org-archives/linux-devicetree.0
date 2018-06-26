Return-Path: <SRS0=y08W=JM=gmail.com=festevam@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] dt-bindings: sram: Add 'clocks' as an optional property
Date: Tue, 26 Jun 2018 20:07:33 -0300
Message-Id: <1530054453-10393-1-git-send-email-festevam@gmail.com>
To: robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, vz@mleia.com, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

From: Fabio Estevam <fabio.estevam@nxp.com>

Some SoCs (like i.MX53) need to specify the SRAM clock in the
device tree via the clocks property.

Add an entry to the optional property section.

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Add space before : and use the more common "list of phandle
and clock specifier pairs" term - Vladimir

 Documentation/devicetree/bindings/sram/sram.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.txt b/Documentation/devicetree/bindings/sram/sram.txt
index 267da44..ae6ca34 100644
--- a/Documentation/devicetree/bindings/sram/sram.txt
+++ b/Documentation/devicetree/bindings/sram/sram.txt
@@ -50,6 +50,8 @@ Optional properties in the area nodes:
 		 manipulation of the page attributes.
 - label : the name for the reserved partition, if omitted, the label
           is taken from the node name excluding the unit address.
+- clocks : a list of phandle and clock specifier pairs that controls the
+	   SRAM clock.
 
 Example:
 
-- 
2.7.4
