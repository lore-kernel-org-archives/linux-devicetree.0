Return-Path: <SRS0=pfTY=L7=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 1/2] dt-bindings: apmu: Document r8a77470 support
Date: Mon, 17 Sep 2018 09:44:09 +0100
Message-Id: <1537173850-5310-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1537173850-5310-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1537173850-5310-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms+renesas@verge.net.au>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Document APMU and SMP enable method for RZ/G1C (also known as
r8a77470) SoC.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/power/renesas,apmu.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/renesas,apmu.txt b/Documentation/devicetree/bindings/power/renesas,apmu.txt
index f747f95..e6f47c9 100644
--- a/Documentation/devicetree/bindings/power/renesas,apmu.txt
+++ b/Documentation/devicetree/bindings/power/renesas,apmu.txt
@@ -9,6 +9,7 @@ Required properties:
 	      Examples with soctypes are:
 		- "renesas,r8a7743-apmu" (RZ/G1M)
 		- "renesas,r8a7745-apmu" (RZ/G1E)
+		- "renesas,r8a77470-apmu" (RZ/G1C)
 		- "renesas,r8a7790-apmu" (R-Car H2)
 		- "renesas,r8a7791-apmu" (R-Car M2-W)
 		- "renesas,r8a7792-apmu" (R-Car V2H)
-- 
2.7.4
