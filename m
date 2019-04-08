From: Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH 2/6] dt-bindings: media: sun6i-csi: Add compatible string for
 A83T variant
Date: Tue,  9 Apr 2019 00:57:40 +0800
Message-ID: <20190408165744.11672-3-wens@kernel.org>
References: <20190408165744.11672-1-wens@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190408165744.11672-1-wens@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

The A83T SoC has a camera sensor interface (known as CSI in Allwinner
lingo), which is similar to the one found on the A64 and H3. The only
difference seems to be that support of MIPI CSI through a connected
MIPI CSI-2 bridge.

Add a compatible string for this variant.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 Documentation/devicetree/bindings/media/sun6i-csi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/sun6i-csi.txt b/Documentation/devicetree/bindings/media/sun6i-csi.txt
index 0dd540bb03db..a2e3e56f0257 100644
--- a/Documentation/devicetree/bindings/media/sun6i-csi.txt
+++ b/Documentation/devicetree/bindings/media/sun6i-csi.txt
@@ -6,6 +6,7 @@ Allwinner V3s SoC features a CSI module(CSI1) with parallel interface.
 Required properties:
   - compatible: value must be one of:
     * "allwinner,sun6i-a31-csi"
+    * "allwinner,sun8i-a83t-csi"
     * "allwinner,sun8i-h3-csi"
     * "allwinner,sun8i-v3s-csi"
     * "allwinner,sun50i-a64-csi"
-- 
2.20.1
