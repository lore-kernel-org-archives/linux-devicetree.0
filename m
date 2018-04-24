Return-Path: <SRS0=BJ8a=HN=vergenet.net=horms@kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v4] dmaengine: rcar-dmac: Document R-Car D3 bindings
Date: Tue, 24 Apr 2018 10:51:06 +0200
Message-Id: <20180424085106.11907-1-horms+renesas@verge.net.au>
To: Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

R8A77995's SYS-DMAC is R-Car Gen3-compatible.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
[simon: rebased]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Based on v4.17-rc1
---
 Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
index aadfb236d53a..11796d43740a 100644
--- a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
+++ b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
@@ -28,6 +28,7 @@ Required Properties:
 		- "renesas,dmac-r8a7796" (R-Car M3-W)
 		- "renesas,dmac-r8a77970" (R-Car V3M)
 		- "renesas,dmac-r8a77980" (R-Car V3H)
+		- "renesas,dmac-r8a77995" (R-Car D3)
 
 - reg: base address and length of the registers block for the DMAC
 
-- 
2.11.0
