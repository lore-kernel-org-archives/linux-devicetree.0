From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: clk: allwinner,
 sun4i-a10-ccu: Correct path in $id
Date: Tue, 23 Jul 2019 17:08:43 -0600
Message-ID: <20190723230843.19922-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The path in the schema '$id' value is wrong. Fix it.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
I can take this via the DT tree.

Rob

 .../devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
index c935405458fe..fa4d143a73de 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/phy/allwinner,sun4i-a10-ccu.yaml#
+$id: http://devicetree.org/schemas/clock/allwinner,sun4i-a10-ccu.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Allwinner Clock Control Unit Device Tree Bindings
-- 
2.20.1
