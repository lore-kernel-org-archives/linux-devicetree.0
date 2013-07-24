Return-Path: <devicetree-owner@vger.kernel.org>
Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]:8686
	"EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751803Ab3GXGVb (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Wed, 24 Jul 2013 02:21:31 -0400
From: <hongbo.zhang@freescale.com>
Subject: [PATCH v5 1/4] DMA: Freescale: revise device tree binding document
Date: Wed, 24 Jul 2013 14:21:06 +0800
Message-ID: <1374646870-5162-2-git-send-email-hongbo.zhang@freescale.com>
In-Reply-To: <1374646870-5162-1-git-send-email-hongbo.zhang@freescale.com>
References: <1374646870-5162-1-git-send-email-hongbo.zhang@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: vinod.koul@intel.com, djbw@fb.com, leoli@freescale.com, scottwood@freescale.com, linuxppc-dev@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Hongbo Zhang <hongbo.zhang@freescale.com>
List-ID: <devicetree@vger.kernel.org>

From: Hongbo Zhang <hongbo.zhang@freescale.com>

This patch updates the discription of each type of DMA controller and its
channels, it is preparation for adding another new DMA controller binding, it
also fixes some defects of indent for text alignment at the same time.

Signed-off-by: Hongbo Zhang <hongbo.zhang@freescale.com>
---
 .../devicetree/bindings/powerpc/fsl/dma.txt        |   52 +++++++++-----------
 1 file changed, 24 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/dma.txt b/Documentation/devicetree/bindings/powerpc/fsl/dma.txt
index 2a4b4bc..ed703d9 100644
--- a/Documentation/devicetree/bindings/powerpc/fsl/dma.txt
+++ b/Documentation/devicetree/bindings/powerpc/fsl/dma.txt
@@ -1,33 +1,31 @@
-* Freescale 83xx DMA Controller
+* Freescale DMA Controllers
 
-Freescale PowerPC 83xx have on chip general purpose DMA controllers.
+** Freescale Elo DMA Controller
+   This is a little-endian DMA controller, used in Freescale mpc83xx series
+   chips such as mpc8315, mpc8349, mpc8379 etc.
 
 Required properties:
 
-- compatible        : compatible list, contains 2 entries, first is
-		 "fsl,CHIP-dma", where CHIP is the processor
-		 (mpc8349, mpc8360, etc.) and the second is
-		 "fsl,elo-dma"
+- compatible        : must include "fsl,elo-dma", and a "fsl,CHIP-dma" is
+                      optional, where CHIP is the processor name.
 - reg               : <registers mapping for DMA general status reg>
-- ranges		: Should be defined as specified in 1) to describe the
-		  DMA controller channels.
+- ranges            : describes the mapping between the address space of the
+                      DMA channels and the address space of the DMA controller.
 - cell-index        : controller index.  0 for controller @ 0x8100
 - interrupts        : <interrupt mapping for DMA IRQ>
 - interrupt-parent  : optional, if needed for interrupt mapping
 
-
 - DMA channel nodes:
-        - compatible        : compatible list, contains 2 entries, first is
-			 "fsl,CHIP-dma-channel", where CHIP is the processor
-			 (mpc8349, mpc8350, etc.) and the second is
-			 "fsl,elo-dma-channel". However, see note below.
+        - compatible        : must include "fsl,elo-dma-channel", and a
+                              "fsl,CHIP-dma-channel" is optional, where CHIP is
+                              the processor name, However, see note below.
         - reg               : <registers mapping for channel>
         - cell-index        : dma channel index starts at 0.
 
 Optional properties:
         - interrupts        : <interrupt mapping for DMA channel IRQ>
-			  (on 83xx this is expected to be identical to
-			   the interrupts property of the parent node)
+                              (on 83xx this is expected to be identical to
+                              the interrupts property of the parent node)
         - interrupt-parent  : optional, if needed for interrupt mapping
 
 Example:
@@ -70,27 +68,25 @@ Example:
 		};
 	};
 
-* Freescale 85xx/86xx DMA Controller
-
-Freescale PowerPC 85xx/86xx have on chip general purpose DMA controllers.
+** Freescale EloPlus DMA Controller
+   This is DMA controller with extended addresses and chaining, mainly used in
+   Freescale mpc85xx/86xx, Pxxx and BSC series chips, such as mpc8540, mpc8641
+   p4080, bsc9131 etc.
 
 Required properties:
 
-- compatible        : compatible list, contains 2 entries, first is
-		 "fsl,CHIP-dma", where CHIP is the processor
-		 (mpc8540, mpc8540, etc.) and the second is
-		 "fsl,eloplus-dma"
+- compatible        : must include "fsl,eloplus-dma", and a "fsl,CHIP-dma" is
+                      optional, where CHIP is the processor name.
 - reg               : <registers mapping for DMA general status reg>
 - cell-index        : controller index.  0 for controller @ 0x21000,
                                          1 for controller @ 0xc000
-- ranges		: Should be defined as specified in 1) to describe the
-		  DMA controller channels.
+- ranges            : describes the mapping between the address space of the
+                      DMA channels and the address space of the DMA controller
 
 - DMA channel nodes:
-        - compatible        : compatible list, contains 2 entries, first is
-			 "fsl,CHIP-dma-channel", where CHIP is the processor
-			 (mpc8540, mpc8560, etc.) and the second is
-			 "fsl,eloplus-dma-channel". However, see note below.
+        - compatible        : must include "fsl,eloplus-dma-channel", and a
+                              "fsl,CHIP-dma-channel" is optional, where CHIP is
+                              the processor name, However, see note below.
         - cell-index        : dma channel index starts at 0.
         - reg               : <registers mapping for channel>
         - interrupts        : <interrupt mapping for DMA channel IRQ>
-- 
1.7.9.5



