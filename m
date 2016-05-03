From: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 2/2] ARM: OMAP2+: Update GPMC and NAND DT binding documentation
Date: Tue,  3 May 2016 12:50:06 -0500
Message-ID: <1462297806-11555-3-git-send-email-fcooper@ti.com>
References: <1462297806-11555-1-git-send-email-fcooper@ti.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462297806-11555-1-git-send-email-fcooper-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: "Cooper Jr., Franklin" <fcooper-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "Cooper Jr., Franklin" <fcooper-l0cyMroinI0@public.gmane.org>

Add additional details to the GPMC NAND documentation to clarify
what is needed to enable NAND DMA prefetch.

Signed-off-by: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt | 7 ++++++-
 Documentation/devicetree/bindings/mtd/gpmc-nand.txt                | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt b/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
index 21055e2..c1359f4 100644
--- a/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
@@ -46,6 +46,10 @@ Required properties:
 			0 maps to GPMC_WAIT0 pin.
  - gpio-cells:		Must be set to 2
 
+Required properties when using NAND prefetch dma:
+ - dmas			GPMC NAND prefetch dma channel
+ - dma-names		Must be set to "rxtx"
+
 Timing properties for child nodes. All are optional and default to 0.
 
  - gpmc,sync-clk-ps:	Minimum clock period for synchronous mode, in picoseconds
@@ -137,7 +141,8 @@ Example for an AM33xx board:
 		ti,hwmods = "gpmc";
 		reg = <0x50000000 0x2000>;
 		interrupts = <100>;
-
+		dmas = <&edma 52 0>;
+		dma-names = "rxtx";
 		gpmc,num-cs = <8>;
 		gpmc,num-waitpins = <2>;
 		#address-cells = <2>;
diff --git a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
index 3ee7e20..174f68c 100644
--- a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
@@ -39,7 +39,7 @@ Optional properties:
 
 		"prefetch-polled"	Prefetch polled mode (default)
 		"polled"		Polled mode, without prefetch
-		"prefetch-dma"		Prefetch enabled sDMA mode
+		"prefetch-dma"		Prefetch enabled DMA mode
 		"prefetch-irq"		Prefetch enabled irq mode
 
  - elm_id:	<deprecated> use "ti,elm-id" instead
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
