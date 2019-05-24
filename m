Return-Path: <dinguyen@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH 1/2] dt-bindings: pl330: document the optional resets property
Date: Thu, 23 May 2019 19:28:46 -0500
Message-Id: <20190524002847.30961-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: dmaengine@vger.kernel.org
Cc: dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, vkoul@kernel.org
List-ID: <devicetree@vger.kernel.org>

Add the optional resets property the pl330 dma node.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 Documentation/devicetree/bindings/dma/arm-pl330.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/arm-pl330.txt b/Documentation/devicetree/bindings/dma/arm-pl330.txt
index db7e2260f9c5..2c7fd1941abb 100644
--- a/Documentation/devicetree/bindings/dma/arm-pl330.txt
+++ b/Documentation/devicetree/bindings/dma/arm-pl330.txt
@@ -16,6 +16,9 @@ Optional properties:
   - dma-channels: contains the total number of DMA channels supported by the DMAC
   - dma-requests: contains the total number of DMA requests supported by the DMAC
   - arm,pl330-broken-no-flushp: quirk for avoiding to execute DMAFLUSHP
+  - resets: contains an entry for each entry in reset-names.
+	    See ../reset/reset.txt for details.
+  - reset-names: must contain at least "dma", and optional is "dma-ocp".
 
 Example:
 
-- 
2.20.0
