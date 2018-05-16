Return-Path: <SRS0=lpWp=ID=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:34578 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752272AbeEPNGZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 16 May 2018 09:06:25 -0400
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 2/2] dmaengine: rcar-dmac: Document R8A77990 bindings
Date: Wed, 16 May 2018 15:06:19 +0200
Message-Id: <1526475979-13891-2-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1526475979-13891-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1526475979-13891-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: horms@verge.net.au, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
List-ID: <devicetree@vger.kernel.org>

From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>

Renesas R-Car E3 (R8A77990) SoC also has the R-Car gen2/3 compatible DMA
controllers, so document the SoC specific binding.

Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
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

