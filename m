From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/7] DMA: shdma: Spelling s/controll/control/
Date: Mon,  2 Jun 2014 15:42:06 +0200
Message-ID: <1401716531-29794-3-git-send-email-geert+renesas@glider.be>
References: <1401716531-29794-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1401716531-29794-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New

 Documentation/devicetree/bindings/dma/shdma.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/shdma.txt b/Documentation/devicetree/bindings/dma/shdma.txt
index d26b7065ae94..2b61cab0525c 100644
--- a/Documentation/devicetree/bindings/dma/shdma.txt
+++ b/Documentation/devicetree/bindings/dma/shdma.txt
@@ -73,7 +73,7 @@ Example:
 	};
 
 For r8a7790 and newer implementations, the information for the channel
-controll register is found in the dma phandle and #dma-cells is set to 2.
+control register is found in the dma phandle and #dma-cells is set to 2.
 
 	dma0: dma-mux@0 {
 		compatible = "renesas,shdma-mux";
-- 
1.9.1

