Return-Path: <SRS0=eZkP=MH=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] dt-bindings: mmc: renesas_sdhi: Add r8a7744 support
Date: Tue, 25 Sep 2018 18:23:07 +0100
Message-Id: <1537896187-35013-1-git-send-email-biju.das@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add support for r8a7744 SoC. Renesas RZ/G1N (R8A7744) SDHI is identical
to the R-Car Gen2 family.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
index 8f3a113..21d671a 100644
--- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
@@ -16,6 +16,7 @@ Required properties:
 		"renesas,sdhi-r8a73a4" - SDHI IP on R8A73A4 SoC
 		"renesas,sdhi-r8a7740" - SDHI IP on R8A7740 SoC
 		"renesas,sdhi-r8a7743" - SDHI IP on R8A7743 SoC
+		"renesas,sdhi-r8a7744" - SDHI IP on R8A7744 SoC
 		"renesas,sdhi-r8a7745" - SDHI IP on R8A7745 SoC
 		"renesas,sdhi-r8a77470" - SDHI IP on R8A77470 SoC
 		"renesas,sdhi-r8a7778" - SDHI IP on R8A7778 SoC
-- 
2.7.4
