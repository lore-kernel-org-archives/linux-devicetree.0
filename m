Return-Path: <SRS0=dgl5=GR=linux-m68k.org=geert@kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] spi: sh-msiof: Document R-Car M3-N support
Date: Tue, 27 Mar 2018 15:04:25 +0200
Message-Id: <1522155865-1129-1-git-send-email-geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

Document support for the MSIOF module in the Renesas M3-N (r8a77965) SoC.

No driver update is needed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2:
  - Add Reviewed-by.
---
 Documentation/devicetree/bindings/spi/sh-msiof.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/sh-msiof.txt b/Documentation/devicetree/bindings/spi/sh-msiof.txt
index 80710f0f04489174..39806329c19396f6 100644
--- a/Documentation/devicetree/bindings/spi/sh-msiof.txt
+++ b/Documentation/devicetree/bindings/spi/sh-msiof.txt
@@ -10,6 +10,7 @@ Required properties:
 			 "renesas,msiof-r8a7794" (R-Car E2)
 			 "renesas,msiof-r8a7795" (R-Car H3)
 			 "renesas,msiof-r8a7796" (R-Car M3-W)
+			 "renesas,msiof-r8a77965" (R-Car M3-N)
 			 "renesas,msiof-sh73a0" (SH-Mobile AG5)
 			 "renesas,sh-mobile-msiof" (generic SH-Mobile compatibile device)
 			 "renesas,rcar-gen2-msiof" (generic R-Car Gen2 and RZ/G1 compatible device)
-- 
2.7.4
