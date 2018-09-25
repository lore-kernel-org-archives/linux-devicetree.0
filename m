Return-Path: <SRS0=eZkP=MH=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] dt-bindings: mmc: sh_mmcif: Document r8a7744 DT bindings
Date: Tue, 25 Sep 2018 18:27:24 +0100
Message-Id: <1537896444-42418-1-git-send-email-biju.das@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add support for r8a7744 SoC. Renesas RZ/G1N (R8A7744) MMCIF is identical
to the R-Car Gen2 family.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 Documentation/devicetree/bindings/mmc/renesas,mmcif.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt b/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
index 5ff1e12..c064af5 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
+++ b/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
@@ -12,6 +12,7 @@ Required properties:
 	- "renesas,mmcif-r8a73a4" for the MMCIF found in r8a73a4 SoCs
 	- "renesas,mmcif-r8a7740" for the MMCIF found in r8a7740 SoCs
 	- "renesas,mmcif-r8a7743" for the MMCIF found in r8a7743 SoCs
+	- "renesas,mmcif-r8a7744" for the MMCIF found in r8a7744 SoCs
 	- "renesas,mmcif-r8a7745" for the MMCIF found in r8a7745 SoCs
 	- "renesas,mmcif-r8a7778" for the MMCIF found in r8a7778 SoCs
 	- "renesas,mmcif-r8a7790" for the MMCIF found in r8a7790 SoCs
@@ -23,7 +24,8 @@ Required properties:
 - interrupts: Some SoCs have only 1 shared interrupt, while others have either
   2 or 3 individual interrupts (error, int, card detect). Below is the number
   of interrupts for each SoC:
-    1: r8a73a4, r8a7743, r8a7745, r8a7778, r8a7790, r8a7791, r8a7793, r8a7794
+    1: r8a73a4, r8a7743, r8a7744, r8a7745, r8a7778, r8a7790, r8a7791, r8a7793,
+       r8a7794
     2: r8a7740, sh73a0
     3: r7s72100
 
-- 
2.7.4
