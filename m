Return-Path: <SRS0=PHM8=V4=bootlin.com=miquel.raynal@kernel.org>
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] dt-bindings: ata: fix typo in Allwinner R40 reset specific paragraph
Date: Wed, 31 Jul 2019 14:25:35 +0200
Message-Id: <20190731122535.3257-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

"Property" is misspelled, correct it.

Fixes: caf8975b97c1 ("dt-bindings: ata: update ahci_sunxi bindings")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/ata/ahci-platform.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/ata/ahci-platform.txt b/Documentation/devicetree/bindings/ata/ahci-platform.txt
index e30fd106df4f..55c6fab1b373 100644
--- a/Documentation/devicetree/bindings/ata/ahci-platform.txt
+++ b/Documentation/devicetree/bindings/ata/ahci-platform.txt
@@ -45,7 +45,7 @@ Required properties when using sub-nodes:
 - #address-cells    : number of cells to encode an address
 - #size-cells       : number of cells representing the size of an address
 
-For allwinner,sun8i-r40-ahci, the reset propertie must be present.
+For allwinner,sun8i-r40-ahci, the reset property must be present.
 
 Sub-nodes required properties:
 - reg		    : the port number
-- 
2.20.1
