Return-Path: <SRS0=8b4q=MK=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] dt-bindings: spi: sh-msiof: Add r8a7744 support
Date: Fri, 28 Sep 2018 14:01:49 +0100
Message-Id: <1538139709-17707-1-git-send-email-biju.das@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Document RZ/G1N (R8A7744) SoC bindings.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 Documentation/devicetree/bindings/spi/sh-msiof.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/sh-msiof.txt b/Documentation/devicetree/bindings/spi/sh-msiof.txt
index 27b48f0..49fd806 100644
--- a/Documentation/devicetree/bindings/spi/sh-msiof.txt
+++ b/Documentation/devicetree/bindings/spi/sh-msiof.txt
@@ -2,6 +2,7 @@ Renesas MSIOF spi controller
 
 Required properties:
 - compatible           : "renesas,msiof-r8a7743" (RZ/G1M)
+			 "renesas,msiof-r8a7744" (RZ/G1N)
 			 "renesas,msiof-r8a7745" (RZ/G1E)
 			 "renesas,msiof-r8a774a1" (RZ/G2M)
 			 "renesas,msiof-r8a7790" (R-Car H2)
-- 
2.7.4
