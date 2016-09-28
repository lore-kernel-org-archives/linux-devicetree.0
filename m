From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] DT: dma: rcar-dmac: document R8A7743/5 support
Date: Thu, 29 Sep 2016 01:25:48 +0300
Message-ID: <1702913.ppLd1lBExD@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: vinod.koul@intel.com, robh+dt@kernel.org, mark.rutland@arm.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Renesas  RZ/G SoC also have the R-Car gen2/3 compatible DMA controllers.
Document RZ/G1[ME] (also known as R8A774[35]) SoC bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'next' branch of Vinod Koul's 'slave-dma.git' repo.
 
 Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Index: slave-dma/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
===================================================================
--- slave-dma.orig/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
+++ slave-dma/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
@@ -1,4 +1,4 @@
-* Renesas R-Car DMA Controller Device Tree bindings
+* Renesas R-Car (RZ/G) DMA Controller Device Tree bindings
 
 Renesas R-Car Generation 2 SoCs have multiple multi-channel DMA
 controller instances named DMAC capable of serving multiple clients. Channels
@@ -16,6 +16,8 @@ Required Properties:
 
 - compatible: "renesas,dmac-<soctype>", "renesas,rcar-dmac" as fallback.
 	      Examples with soctypes are:
+		- "renesas,dmac-r8a7743" (RZ/G1M)
+		- "renesas,dmac-r8a7745" (RZ/G1E)
 		- "renesas,dmac-r8a7790" (R-Car H2)
 		- "renesas,dmac-r8a7791" (R-Car M2-W)
 		- "renesas,dmac-r8a7792" (R-Car V2H)
