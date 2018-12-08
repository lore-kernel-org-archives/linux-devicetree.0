From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/5] dt-bindings: gpu: mali-utgard: add Amlogic Meson8 and Meson8b compatible
Date: Sat,  8 Dec 2018 18:12:43 +0100
Message-ID: <20181208171247.22238-2-martin.blumenstingl@googlemail.com>
References: <20181208171247.22238-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181208171247.22238-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, jbrunet@baylibre.com, narmstrong@baylibre.com, khilman@baylibre.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, sboyd@kernel.org, mturquette@baylibre.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

Add a compatible string for the Mali-450 GPU on Amlogic Meson8 and
Meson8b SoCs. Meson8 uses an "MP6" variant with six pixel processors
while Meson8b (as cost-reduced SoC) uses an "MP2" variant with two pixel
processors. Both have a reset line to bring the GPU into a well-defined
state.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
index 63cd91176a68..efa1077a90cb 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
@@ -12,6 +12,8 @@ Required properties:
       + allwinner,sun7i-a20-mali
       + allwinner,sun8i-h3-mali
       + allwinner,sun50i-h5-mali
+      + amlogic,meson8-mali
+      + amlogic,meson8b-mali
       + amlogic,meson-gxbb-mali
       + amlogic,meson-gxl-mali
       + rockchip,rk3036-mali
@@ -77,6 +79,10 @@ to specify one more vendor-specific compatible, among:
     Required properties:
       * resets: phandle to the reset line for the GPU
 
+  - amlogic,meson8-mali and amlogic,meson8b-mali
+    Required properties:
+      * resets: phandle to the reset line for the GPU
+
   - Rockchip variants:
     Required properties:
       * resets: phandle to the reset line for the GPU
-- 
2.19.2
