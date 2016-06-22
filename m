From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 2/2] ARM: sun5i: Allow PLL3 2x fixed factor clock to change
 PLL3 rate
Date: Wed, 22 Jun 2016 11:15:55 +0200
Message-ID: <20160622091555.18415-2-maxime.ripard@free-electrons.com>
References: <20160622091555.18415-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160622091555.18415-1-maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Jongsung Kim <neidhard.kim@lge.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

In order to be able to properly generate its pixel clock, the pll3-2x fixed
factor needs to be able to change the PLL3 rate too.

Add the needed extra compatible so that it behaves that way.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/boot/dts/sun5i.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index 0840612b5ed6..e374f4fc8073 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -130,7 +130,7 @@
 		};
 
 		pll3x2: pll3x2_clk {
-			compatible = "fixed-factor-clock";
+			compatible = "allwinner,sun4i-a10-pll3-2x-clk", "fixed-factor-clock";
 			#clock-cells = <0>;
 			clock-div = <1>;
 			clock-mult = <2>;
-- 
2.9.0
