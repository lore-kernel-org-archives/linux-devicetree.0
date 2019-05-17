From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v5 3/6] dt-bindings: gpu: add bus clock for Mali Midgard GPUs
Date: Fri, 17 May 2019 20:46:56 +0200
Message-ID: <20190517184659.18828-4-peron.clem@gmail.com>
References: <20190517184659.18828-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190517184659.18828-1-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Will Deacon <will.deacon@arm.com>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Neil Armstrong <narmstrong@baylibre.com>, Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, Icenowy Zheng <icenowy@aosc.io>, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Icenowy Zheng <icenowy@aosc.io>

Some SoCs adds a bus clock gate to the Mali Midgard GPU.

Add the binding for the bus clock.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
index 1b1a74129141..2e8bbce35695 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
@@ -31,6 +31,12 @@ Optional properties:
 
 - clocks : Phandle to clock for the Mali Midgard device.
 
+- clock-names : Specify the names of the clocks specified in clocks
+  when multiple clocks are present.
+    * core: clock driving the GPU itself (When only one clock is present,
+      assume it's this clock.)
+    * bus: bus clock for the GPU
+
 - mali-supply : Phandle to regulator for the Mali device. Refer to
   Documentation/devicetree/bindings/regulator/regulator.txt for details.
 
-- 
2.17.1
