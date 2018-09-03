Return-Path: <SRS0=8Gze=LR=linux-m68k.org=geert@kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] spi: sh-msiof: Document R-Car D3 support
Date: Mon,  3 Sep 2018 19:25:11 +0200
Message-Id: <20180903172512.6242-2-geert+renesas@glider.be>
In-Reply-To: <20180903172512.6242-1-geert+renesas@glider.be>
References: <20180903172512.6242-1-geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ulrich Hecht <uli+renesas@fpond.eu>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

From: Ulrich Hecht <uli+renesas@fpond.eu>

Document support for the MSIOF module in the Renesas R-Car D3 (r8a77995)
SoC.

No driver update is needed.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
As per SPI subsystem policy, the "spi: sh-msiof:" prefix is used.

 Documentation/devicetree/bindings/spi/sh-msiof.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/sh-msiof.txt b/Documentation/devicetree/bindings/spi/sh-msiof.txt
index bfbc2035fb6bfaf6..fd157155f219bb17 100644
--- a/Documentation/devicetree/bindings/spi/sh-msiof.txt
+++ b/Documentation/devicetree/bindings/spi/sh-msiof.txt
@@ -11,6 +11,7 @@ Required properties:
 			 "renesas,msiof-r8a7795" (R-Car H3)
 			 "renesas,msiof-r8a7796" (R-Car M3-W)
 			 "renesas,msiof-r8a77965" (R-Car M3-N)
+			 "renesas,msiof-r8a77995" (R-Car D3)
 			 "renesas,msiof-sh73a0" (SH-Mobile AG5)
 			 "renesas,sh-mobile-msiof" (generic SH-Mobile compatibile device)
 			 "renesas,rcar-gen2-msiof" (generic R-Car Gen2 and RZ/G1 compatible device)
-- 
2.17.1
