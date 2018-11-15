Return-Path: <SRS0=V+0x=N2=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH resend] dmaengine: rcar-dmac: Document R8A774A1 bindings
Date: Thu, 15 Nov 2018 11:58:29 +0000
Message-Id: <1542283109-8322-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Renesas' RZ/G2M (R8A774A1) SoC has DMA controllers compatible
with this driver, therefore document RZ/G2M specific bindings.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---

 Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
index a5a7c3f..cdf32b2 100644
--- a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
+++ b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
@@ -1,6 +1,6 @@
 * Renesas R-Car (RZ/G) DMA Controller Device Tree bindings
 
-Renesas R-Car Generation 2 SoCs have multiple multi-channel DMA
+Renesas R-Car (Gen 2/3) and RZ/G SoCs have multiple multi-channel DMA
 controller instances named DMAC capable of serving multiple clients. Channels
 can be dedicated to specific clients or shared between a large number of
 clients.
@@ -20,6 +20,7 @@ Required Properties:
 		- "renesas,dmac-r8a7744" (RZ/G1N)
 		- "renesas,dmac-r8a7745" (RZ/G1E)
 		- "renesas,dmac-r8a77470" (RZ/G1C)
+		- "renesas,dmac-r8a774a1" (RZ/G2M)
 		- "renesas,dmac-r8a7790" (R-Car H2)
 		- "renesas,dmac-r8a7791" (R-Car M2-W)
 		- "renesas,dmac-r8a7792" (R-Car V2H)
-- 
2.7.4
