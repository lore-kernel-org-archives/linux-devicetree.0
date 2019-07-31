From: Harini Katakam <harini.katakam@xilinx.com>
Subject: [RFC PATCH 1/2] dt-bindings: net: macb: Add new property for PS SGMII only
Date: Wed, 31 Jul 2019 15:10:32 +0530
Message-ID: <1564566033-676-2-git-send-email-harini.katakam@xilinx.com>
References: <1564566033-676-1-git-send-email-harini.katakam@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564566033-676-1-git-send-email-harini.katakam@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@microchip.com, davem@davemloft.net, claudiu.beznea@microchip.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, michal.simek@xilinx.com, harinikatakamlinux@gmail.com, harini.katakam@xilinx.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a new property to indicate when PS SGMII is used with NO
external PHY on board.

Signed-off-by: Harini Katakam <harini.katakam@xilinx.com>
---
 Documentation/devicetree/bindings/net/macb.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/macb.txt b/Documentation/devicetree/bindings/net/macb.txt
index 63c73fa..ae1b109 100644
--- a/Documentation/devicetree/bindings/net/macb.txt
+++ b/Documentation/devicetree/bindings/net/macb.txt
@@ -38,6 +38,10 @@ Optional properties for PHY child node:
   up via magic packet.
 - phy-handle : see ethernet.txt file in the same directory
 
+Optional properties:
+- is-internal-pcspma: Add when GEM's internal SGMII support is used without
+  any external SGMII PHY.
+
 Examples:
 
 	macb0: ethernet@fffc4000 {
-- 
2.7.4
