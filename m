Return-Path: <SRS0=2n8j=SD=bootlin.com=miquel.raynal@kernel.org>
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] dt-bindings: connector: Spelling mistake
Date: Mon,  1 Apr 2019 15:09:00 +0200
Message-Id: <20190401130900.6069-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Cosmetic change multpile -> multiple.

Fixes: 593aa2b405f9 ("dt-bindings: add bindings for USB physical connector")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/connector/usb-connector.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.txt b/Documentation/devicetree/bindings/connector/usb-connector.txt
index a9a2f2fc44f2..cef556d4e5ee 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.txt
+++ b/Documentation/devicetree/bindings/connector/usb-connector.txt
@@ -47,7 +47,7 @@ Required properties for usb-c-connector with power delivery support:
 Required nodes:
 - any data bus to the connector should be modeled using the OF graph bindings
   specified in bindings/graph.txt, unless the bus is between parent node and
-  the connector. Since single connector can have multpile data buses every bus
+  the connector. Since single connector can have multiple data buses every bus
   has assigned OF graph port number as follows:
     0: High Speed (HS), present in all connectors,
     1: Super Speed (SS), present in SS capable connectors,
-- 
2.19.1
