From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2] dmaengine: rcar-dmac: document R8A77970 bindings
Date: Thu, 31 Aug 2017 23:59:24 +0300
Message-ID: <20170831205936.865765713@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline; filename=dmaengine-rcar-dmac-document-R8A77970-bindings-v2.patch
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Renesas R-Car V3M (R8A77970) SoC also has the R-Car gen2/3 compatible DMA
controllers, so document the SoC specific binding.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
The patch is against the 'next' branch of Vinod Koul's 'slave-dma.git' repo.
 
Changes in version 2:
- changed R8A7797 to R8A77970 everywhere.

 Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt |    1 +
 1 file changed, 1 insertion(+)

Index: slave-dma/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
===================================================================
--- slave-dma.orig/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
+++ slave-dma/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
@@ -25,6 +25,7 @@ Required Properties:
 		- "renesas,dmac-r8a7794" (R-Car E2)
 		- "renesas,dmac-r8a7795" (R-Car H3)
 		- "renesas,dmac-r8a7796" (R-Car M3-W)
+		- "renesas,dmac-r8a77970" (R-Car V3M)
 
 - reg: base address and length of the registers block for the DMAC
 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
