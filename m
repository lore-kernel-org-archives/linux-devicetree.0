From: Jan Kotas <jank@cadence.com>
Subject: [PATCH 1/3] media: dt-bindings: Update bindings for Cadence CSI2RX version 2.1
Date: Thu, 25 Jul 2019 11:26:46 +0100
Message-ID: <20190725102648.13445-2-jank@cadence.com>
References: <20190725102648.13445-1-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725102648.13445-1-jank@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: rafalc@cadence.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kotas <jank@cadence.com>
List-Id: devicetree@vger.kernel.org

This patch adds a DT bindings documentation for
Cadence CSI2RX v2.1 controller.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 Documentation/devicetree/bindings/media/cdns,csi2rx.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.txt b/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
index 6b02a0657..a35bb0aed 100644
--- a/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
+++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
@@ -5,7 +5,9 @@ The Cadence MIPI-CSI2 RX controller is a CSI-2 bridge supporting up to 4 CSI
 lanes in input, and 4 different pixel streams in output.
 
 Required properties:
-  - compatible: must be set to "cdns,csi2rx" and an SoC-specific compatible
+  - compatible: must be set to "cdns,csi2rx" or "cdns,csi2rx-1.3"
+    for version 1.3 of the controller, "cdns,csi2rx-2.1" for v2.1
+    and an SoC-specific compatible
   - reg: base address and size of the memory mapped region
   - clocks: phandles to the clocks driving the controller
   - clock-names: must contain:
-- 
2.15.0
