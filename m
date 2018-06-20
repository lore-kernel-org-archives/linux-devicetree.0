Return-Path: <SRS0=H8ko=JG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:42040 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750982AbeFTMBn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Jun 2018 08:01:43 -0400
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH resend] dmaengine: rcar-dmac: Document R8A77990 bindings
Date: Wed, 20 Jun 2018 14:01:37 +0200
Message-Id: <1529496097-10629-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: horms@verge.net.au, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, vinod.koul@linaro.org, Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
List-ID: <devicetree@vger.kernel.org>

From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>

Renesas R-Car E3 (R8A77990) SoC also has the R-Car gen2/3 compatible DMA
controllers, so document the SoC specific binding.

Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This didn't apply for Vinod before, but now it seems to. If it still does
not, please tell me what tree to base this on.

CU
Uli


 Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
index b1ba6395..946229c 100644
--- a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
+++ b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
@@ -29,6 +29,7 @@ Required Properties:
 		- "renesas,dmac-r8a77965" (R-Car M3-N)
 		- "renesas,dmac-r8a77970" (R-Car V3M)
 		- "renesas,dmac-r8a77980" (R-Car V3H)
+		- "renesas,dmac-r8a77990" (R-Car E3)
 		- "renesas,dmac-r8a77995" (R-Car D3)
 
 - reg: base address and length of the registers block for the DMAC
-- 
2.7.4

