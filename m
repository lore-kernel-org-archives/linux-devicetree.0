From: <sean.wang@mediatek.com>
Subject: [PATCH v1 1/4] dt-bindings: gpu: mali-utgard: add mediatek,mt7623-mali compatible
Date: Wed, 18 Apr 2018 18:24:53 +0800
Message-ID: <831e85ebdfdaba3c7b05ac8407a1584c20ba4a86.1524044917.git.sean.wang@mediatek.com>
References: <cover.1524044917.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1524044917.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, airlied@linux.ie, matthias.bgg@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

The MediaTek MT7623 SoC contains a Mali-450, so add a compatible for it
and define its own vendor-specific properties.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
index c1f65d1..e149995 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
@@ -20,6 +20,7 @@ Required properties:
       + rockchip,rk3228-mali
       + rockchip,rk3328-mali
       + stericsson,db8500-mali
+      + mediatek,mt7623-mali
 
   - reg: Physical base address and length of the GPU registers
 
@@ -86,6 +87,14 @@ to specify one more vendor-specific compatible, among:
       * interrupt-names and interrupts:
         + combined: combined interrupt of all of the above lines
 
+  - mediatek,mt7623-mali
+     Required properties:
+      * resets: phandle to the reset line for the GPU
+      * mediatek,larb: phandle pointed to the local arbiter used to control the
+	access to external memory on the SoC.
+	see Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+	for details
+
 Example:
 
 mali: gpu@1c40000 {
-- 
2.7.4
