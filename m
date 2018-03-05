From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 1/4] dt-bindings: media: sun6i: Add A31 and H3 compatibles
Date: Mon,  5 Mar 2018 11:04:29 +0100
Message-ID: <20180305100432.15009-2-maxime.ripard@bootlin.com>
References: <20180305100432.15009-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180305100432.15009-1-maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Yong Deng <yong.deng@magewell.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Mylene Josserand <mylene.josserand@bootlin.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The H3 has a slightly different CSI controller (no BT656, no CCI) which
looks a lot like the original A31 controller. Add a compatible for the A31,
and more specific compatible the for the H3 to be used in combination for
the A31.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/media/sun6i-csi.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/sun6i-csi.txt b/Documentation/devicetree/bindings/media/sun6i-csi.txt
index 2ff47a9507a6..18a5b3068b25 100644
--- a/Documentation/devicetree/bindings/media/sun6i-csi.txt
+++ b/Documentation/devicetree/bindings/media/sun6i-csi.txt
@@ -5,7 +5,10 @@ Allwinner V3s SoC features two CSI module. CSI0 is used for MIPI CSI-2
 interface and CSI1 is used for parallel interface.
 
 Required properties:
-  - compatible: value must be "allwinner,sun8i-v3s-csi"
+  - compatible: value must be one of:
+    * "allwinner,sun6i-a31-csi", along with, optionally:
+      + "allwinner,sun8i-h3-csi"
+    * "allwinner,sun8i-v3s-csi"
   - reg: base address and size of the memory-mapped region.
   - interrupts: interrupt associated to this IP
   - clocks: phandles to the clocks feeding the CSI
-- 
2.14.3
