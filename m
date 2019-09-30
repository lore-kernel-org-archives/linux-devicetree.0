From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v4 1/3] dt-bindings: dmaengine: dma-common: Change dma-channel-mask to uint32-array
Date: Mon, 30 Sep 2019 14:40:53 +0300
Message-ID: <20190930114055.29315-2-peter.ujfalusi@ti.com>
References: <20190930114055.29315-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190930114055.29315-1-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, robh+dt@kernel.org
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, dan.j.williams@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Make the dma-channel-mask to be usable for controllers with more than 32
channels.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 Documentation/devicetree/bindings/dma/dma-common.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/dma-common.yaml b/Documentation/devicetree/bindings/dma/dma-common.yaml
index ed0a49a6f020..02a34ba2b49b 100644
--- a/Documentation/devicetree/bindings/dma/dma-common.yaml
+++ b/Documentation/devicetree/bindings/dma/dma-common.yaml
@@ -25,11 +25,18 @@ properties:
       Used to provide DMA controller specific information.
 
   dma-channel-mask:
-    $ref: /schemas/types.yaml#definitions/uint32
     description:
       Bitmask of available DMA channels in ascending order that are
       not reserved by firmware and are available to the
       kernel. i.e. first channel corresponds to LSB.
+      The first item in the array is for channels 0-31, the second is for
+      channels 32-63, etc.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      minItems: 1
+      # Should be enough
+      maxItems: 255
 
   dma-channels:
     $ref: /schemas/types.yaml#definitions/uint32
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
