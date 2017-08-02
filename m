From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] dmaengine: usb-dmac: Add soctype for R-Car M3-W
Date: Wed,  2 Aug 2017 20:33:34 +0900
Message-ID: <1501673614-6633-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: vinod.koul@intel.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch adds R-Car M3-W device tree bindings for usb-dmac driver.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
index e7780a1..1be6941 100644
--- a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
+++ b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
@@ -8,6 +8,7 @@ Required Properties:
 	  - "renesas,r8a7793-usb-dmac" (R-Car M2-N)
 	  - "renesas,r8a7794-usb-dmac" (R-Car E2)
 	  - "renesas,r8a7795-usb-dmac" (R-Car H3)
+	  - "renesas,r8a7796-usb-dmac" (R-Car M3-W)
 - reg: base address and length of the registers block for the DMAC
 - interrupts: interrupt specifiers for the DMAC, one for each entry in
   interrupt-names.
-- 
1.9.1
