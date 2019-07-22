From: Jan Kotas <jank@cadence.com>
Subject: [PATCH v2 1/4] media: dt-bindings: Update bindings for Cadence CSI2TX version 2.1
Date: Mon, 22 Jul 2019 09:22:20 +0100
Message-ID: <20190722082223.18693-2-jank@cadence.com>
References: <20190722082223.18693-1-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722082223.18693-1-jank@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: rafalc@cadence.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kotas <jank@cadence.com>
List-Id: devicetree@vger.kernel.org

This patch adds a DT bindings documentation for
Cadence CSI2TX v2.1 controller.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 Documentation/devicetree/bindings/media/cdns,csi2tx.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/cdns,csi2tx.txt b/Documentation/devicetree/bindings/media/cdns,csi2tx.txt
index 459c6e332..751b9edf1 100644
--- a/Documentation/devicetree/bindings/media/cdns,csi2tx.txt
+++ b/Documentation/devicetree/bindings/media/cdns,csi2tx.txt
@@ -5,7 +5,8 @@ The Cadence MIPI-CSI2 TX controller is a CSI-2 bridge supporting up to
 4 CSI lanes in output, and up to 4 different pixel streams in input.
 
 Required properties:
-  - compatible: must be set to "cdns,csi2tx"
+  - compatible: must be set to "cdns,csi2tx" or "cdns,csi2tx-1.3"
+    for version 1.3 of the controller, "cdns,csi2tx-2.1" for v2.1
   - reg: base address and size of the memory mapped region
   - clocks: phandles to the clocks driving the controller
   - clock-names: must contain:
-- 
2.15.0
