Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] dt-bindings: dmaengine: dma-common: Fix the dma-channel-mask property
Date: Wed, 28 Aug 2019 19:30:23 +0900
Message-Id: <1566988223-14657-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
To: vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

The commit b37e3534ac42 ("dt-bindings: dmaengine: Add YAML schemas
for the generic DMA bindings") changed the property from
dma-channel-mask to dma-channel-masks. So, this patch fixes it.

Fixes: b37e3534ac42 ("dt-bindings: dmaengine: Add YAML schemas for the generic DMA bindings")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Changes from v1:
 - s/Revise/Fix/ in the subject and s/revises/fixes/ the commit log.
 https://patchwork.kernel.org/patch/11117885/

 Documentation/devicetree/bindings/dma/dma-common.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/dma-common.yaml b/Documentation/devicetree/bindings/dma/dma-common.yaml
index 0141af0..ed0a49a 100644
--- a/Documentation/devicetree/bindings/dma/dma-common.yaml
+++ b/Documentation/devicetree/bindings/dma/dma-common.yaml
@@ -24,7 +24,7 @@ properties:
     description:
       Used to provide DMA controller specific information.
 
-  dma-channel-masks:
+  dma-channel-mask:
     $ref: /schemas/types.yaml#definitions/uint32
     description:
       Bitmask of available DMA channels in ascending order that are
-- 
2.7.4
