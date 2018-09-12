Return-Path: <SRS0=GHC0=L2=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 3/3] dt-bindings: clock: renesas: cpg-mssr: Document r8a774c0
Date: Wed, 12 Sep 2018 11:41:54 +0100
Message-Id: <1536748914-27416-4-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1536748914-27416-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1536748914-27416-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This patch documents RZ/G2E (a.k.a. R8A774C0) bindings for the
Clock Pulse Generator driver.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
index 5e46e6b..1b4ebe3 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
@@ -18,6 +18,7 @@ Required Properties:
       - "renesas,r8a7745-cpg-mssr" for the r8a7745 SoC (RZ/G1E)
       - "renesas,r8a77470-cpg-mssr" for the r8a77470 SoC (RZ/G1C)
       - "renesas,r8a774a1-cpg-mssr" for the r8a774a1 SoC (RZ/G2M)
+      - "renesas,r8a774c0-cpg-mssr" for the r8a774c0 SoC (RZ/G2E)
       - "renesas,r8a7790-cpg-mssr" for the r8a7790 SoC (R-Car H2)
       - "renesas,r8a7791-cpg-mssr" for the r8a7791 SoC (R-Car M2-W)
       - "renesas,r8a7792-cpg-mssr" for the r8a7792 SoC (R-Car V2H)
@@ -37,9 +38,9 @@ Required Properties:
   - clocks: References to external parent clocks, one entry for each entry in
     clock-names
   - clock-names: List of external parent clock names. Valid names are:
-      - "extal" (r7s9210, r8a7743, r8a7745, r8a77470, r8a774a1, r8a7790,
-		 r8a7791, r8a7792, r8a7793, r8a7794, r8a7795, r8a7796, r8a77965,
-		 r8a77970, r8a77980, r8a77990, r8a77995)
+      - "extal" (r7s9210, r8a7743, r8a7745, r8a77470, r8a774a1, r8a774c0,
+		 r8a7790, r8a7791, r8a7792, r8a7793, r8a7794, r8a7795, r8a7796,
+		 r8a77965, r8a77970, r8a77980, r8a77990, r8a77995)
       - "extalr" (r8a774a1, r8a7795, r8a7796, r8a77965, r8a77970, r8a77980)
       - "usb_extal" (r8a7743, r8a7745, r8a77470, r8a7790, r8a7791, r8a7793,
 		     r8a7794)
-- 
2.7.4
