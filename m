From: Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 2/2] dt-bindings: gpu: add Allwinner H6 Mali Midgard binding
Date: Tue, 27 Nov 2018 15:42:49 +0800
Message-ID: <20181127074249.15204-2-icenowy@aosc.io>
References: <20181127074249.15204-1-icenowy@aosc.io>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181127074249.15204-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@siol.net>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

Allwinner H6 SoC uses a Mali T720 GPU, which is one of the GPUs in the
Midgard GPU product line.

Add binding for the H6 Mali Midgard GPU.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 .../devicetree/bindings/gpu/arm,mali-midgard.txt    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
index 02f870cd60e6..c897dd7be48f 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
@@ -18,6 +18,7 @@ Required properties:
     + "amlogic,meson-gxm-mali"
     + "rockchip,rk3288-mali"
     + "rockchip,rk3399-mali"
+    + "allwinner,sun50i-h6-mali"
 
 - reg : Physical base address of the device and length of the register area.
 
@@ -44,6 +45,18 @@ Optional properties:
   for details.
 
 
+Vendor-specific bindings
+------------------------
+
+The Mali GPU is integrated very differently from one SoC to
+another. In order to accomodate those differences, you have the option
+to specify one more vendor-specific compatible, among:
+
+  - allwinner,sun50i-h6-mali
+    Required properties:
+      * resets: phandle to the reset line for the GPU
+
+
 Example for a Mali-T760:
 
 gpu@ffa30000 {
-- 
2.18.1
