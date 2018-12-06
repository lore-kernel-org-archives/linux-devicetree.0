From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 1/3] dt-bindings: media: sun6i: Add A64 CSI compatible (w/ H3 fallback)
Date: Thu,  6 Dec 2018 18:53:04 +0530
Message-ID: <20181206132306.11843-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, Michael Trimarchi <michael@amarulasolutions.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Allwinner A64 CSI has single channel time-multiplexed BT.656
CMOS sensor interface like H3.

Add a compatible string for it with H3 fallback compatible string,
in this case the H3 driver can be used.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- none

 Documentation/devicetree/bindings/media/sun6i-csi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/sun6i-csi.txt b/Documentation/devicetree/bindings/media/sun6i-csi.txt
index eb5a14b828d9..5fb6fd4e2c7d 100644
--- a/Documentation/devicetree/bindings/media/sun6i-csi.txt
+++ b/Documentation/devicetree/bindings/media/sun6i-csi.txt
@@ -7,6 +7,7 @@ Required properties:
   - compatible: value must be one of:
     * "allwinner,sun6i-a31-csi"
     * "allwinner,sun8i-h3-csi"
+    * "allwinner,sun50i-a64-csi", "allwinner,sun8i-h3-csi"
     * "allwinner,sun8i-v3s-csi"
   - reg: base address and size of the memory-mapped region.
   - interrupts: interrupt associated to this IP
-- 
2.18.0.321.gffc6fa0e3
