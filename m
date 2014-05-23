From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH trivial] of: dma: Grammar s/requests/request/, s/used required/required/
Date: Fri, 23 May 2014 10:34:35 +0200
Message-ID: <1400834075-21278-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <trivial@kernel.org>
Cc: devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/dma/dma.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/dma.txt b/Documentation/devicetree/bindings/dma/dma.txt
index 8f504e6bae14..82104271e754 100644
--- a/Documentation/devicetree/bindings/dma/dma.txt
+++ b/Documentation/devicetree/bindings/dma/dma.txt
@@ -14,7 +14,7 @@ Required property:
 
 Optional properties:
 - dma-channels: 	Number of DMA channels supported by the controller.
-- dma-requests: 	Number of DMA requests signals supported by the
+- dma-requests: 	Number of DMA request signals supported by the
 			controller.
 
 Example:
@@ -44,7 +44,7 @@ Required property:
 			  #dma-cells property in the node referenced by phandle
 			  containing DMA controller specific information. This
 			  typically contains a DMA request line number or a
-			  channel number, but can contain any data that is used
+			  channel number, but can contain any data that is
 			  required for configuring a channel.
 - dma-names: 		Contains one identifier string for each DMA specifier in
 			the dmas property. The specific strings that can be used
-- 
1.9.1
