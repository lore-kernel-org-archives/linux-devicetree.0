Return-Path: <SRS0=HlV8=LZ=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 06/10] dt-bindings: clock: renesas: cpg-mssr: Document r8a7744 binding
Date: Tue, 11 Sep 2018 11:12:47 +0100
Message-Id: <1536660771-32278-7-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1536660771-32278-1-git-send-email-biju.das@bp.renesas.com>
References: <1536660771-32278-1-git-send-email-biju.das@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add binding documentation for the RZ/G1N (R8A7744) Clock Pulse
Generator driver.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
index 42d0f83..1b8d484 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
@@ -14,6 +14,7 @@ They provide the following functionalities:
 Required Properties:
   - compatible: Must be one of:
       - "renesas,r8a7743-cpg-mssr" for the r8a7743 SoC (RZ/G1M)
+      - "renesas,r8a7744-cpg-mssr" for the r8a7744 SoC (RZ/G1N)
       - "renesas,r8a7745-cpg-mssr" for the r8a7745 SoC (RZ/G1E)
       - "renesas,r8a77470-cpg-mssr" for the r8a77470 SoC (RZ/G1C)
       - "renesas,r8a774a1-cpg-mssr" for the r8a774a1 SoC (RZ/G2M)
@@ -36,12 +37,12 @@ Required Properties:
   - clocks: References to external parent clocks, one entry for each entry in
     clock-names
   - clock-names: List of external parent clock names. Valid names are:
-      - "extal" (r8a7743, r8a7745, r8a77470, r8a774a1, r8a7790, r8a7791,
-		 r8a7792, r8a7793, r8a7794, r8a7795, r8a7796, r8a77965,
-		 r8a77970, r8a77980, r8a77990, r8a77995)
+      - "extal" (r8a7743, r8a7744, r8a7745, r8a77470, r8a774a1, r8a7790,
+		 r8a7791, r8a7792, r8a7793, r8a7794, r8a7795, r8a7796,
+		 r8a77965, r8a77970, r8a77980, r8a77990, r8a77995)
       - "extalr" (r8a774a1, r8a7795, r8a7796, r8a77965, r8a77970, r8a77980)
-      - "usb_extal" (r8a7743, r8a7745, r8a77470, r8a7790, r8a7791, r8a7793,
-		     r8a7794)
+      - "usb_extal" (r8a7743, r8a7744, r8a7745, r8a77470, r8a7790, r8a7791,
+		     r8a7793, r8a7794)
 
   - #clock-cells: Must be 2
       - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
-- 
2.7.4
