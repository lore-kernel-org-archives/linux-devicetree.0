Return-Path: <SRS0=lpWp=ID=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:42291 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752100AbeEPNGX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 16 May 2018 09:06:23 -0400
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 1/2] dmaengine: usb-dmac: Document R8A7799{0,5} bindings
Date: Wed, 16 May 2018 15:06:18 +0200
Message-Id: <1526475979-13891-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: horms@verge.net.au, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
List-ID: <devicetree@vger.kernel.org>

From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>

Renesas R-Car D3 (R8A77995) and E3 (R8A77990) SoCs also have the R-Car
gen2/3 compatible DMA controllers, so document the SoC specific binding.

Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
[uli: squashed]
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
index 9dc935e..482e543 100644
--- a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
+++ b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
@@ -12,6 +12,8 @@ Required Properties:
 	  - "renesas,r8a7795-usb-dmac" (R-Car H3)
 	  - "renesas,r8a7796-usb-dmac" (R-Car M3-W)
 	  - "renesas,r8a77965-usb-dmac" (R-Car M3-N)
+	  - "renesas,r8a77990-usb-dmac" (R-Car E3)
+	  - "renesas,r8a77995-usb-dmac" (R-Car D3)
 - reg: base address and length of the registers block for the DMAC
 - interrupts: interrupt specifiers for the DMAC, one for each entry in
   interrupt-names.
-- 
2.7.4

