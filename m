From: <gabriel.fernandez@st.com>
Subject: [PATCH v7 1/3] clk: nxp: clk-lpc32xx: rename clk_gate_is_enabled()
Date: Wed, 19 Jul 2017 16:25:42 +0200
Message-ID: <1500474344-9832-2-git-send-email-gabriel.fernandez@st.com>
References: <1500474344-9832-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1500474344-9832-1-git-send-email-gabriel.fernandez@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, daniel.thompson@linaro.org, andrea.merello@gmail.com, radoslaw.pietrzyk@gmail.com, Lee Jones <lee.jones@linaro.org>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>
Cc: devicetree@vger.kernel.org, amelie.delaunay@st.com, olivier.bideau@st.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, gabriel.fernandez.st@gmail.com, linux-arm-kernel@lists.infradead.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, gabriel.fernandez@st.com, ludovic.barre@st.com
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez@st.com>

We need to export clk_gate_is_enabled() from clk framework, then
to avoid compilation issue we have to rename clk_gate_is_enabled()
in NXP LPC32xx clock driver.
We changed all gate op with 'lpc32xx_' prefix:
lpc32xx_clk_gate_enable(),
lpc32xx_clk_gate_disable(),
lpc32xx_clk_gate_is_enabled().

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
---
 drivers/clk/nxp/clk-lpc32xx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/nxp/clk-lpc32xx.c b/drivers/clk/nxp/clk-lpc32xx.c
index 5b98ff9..7b359af 100644
--- a/drivers/clk/nxp/clk-lpc32xx.c
+++ b/drivers/clk/nxp/clk-lpc32xx.c
@@ -885,7 +885,7 @@ static unsigned long clk_usb_i2c_recalc_rate(struct clk_hw *hw,
 	.recalc_rate = clk_usb_i2c_recalc_rate,
 };
 
-static int clk_gate_enable(struct clk_hw *hw)
+static int lpc32xx_clk_gate_enable(struct clk_hw *hw)
 {
 	struct lpc32xx_clk_gate *clk = to_lpc32xx_gate(hw);
 	u32 mask = BIT(clk->bit_idx);
@@ -894,7 +894,7 @@ static int clk_gate_enable(struct clk_hw *hw)
 	return regmap_update_bits(clk_regmap, clk->reg, mask, val);
 }
 
-static void clk_gate_disable(struct clk_hw *hw)
+static void lpc32xx_clk_gate_disable(struct clk_hw *hw)
 {
 	struct lpc32xx_clk_gate *clk = to_lpc32xx_gate(hw);
 	u32 mask = BIT(clk->bit_idx);
@@ -903,7 +903,7 @@ static void clk_gate_disable(struct clk_hw *hw)
 	regmap_update_bits(clk_regmap, clk->reg, mask, val);
 }
 
-static int clk_gate_is_enabled(struct clk_hw *hw)
+static int lpc32xx_clk_gate_is_enabled(struct clk_hw *hw)
 {
 	struct lpc32xx_clk_gate *clk = to_lpc32xx_gate(hw);
 	u32 val;
@@ -916,9 +916,9 @@ static int clk_gate_is_enabled(struct clk_hw *hw)
 }
 
 static const struct clk_ops lpc32xx_clk_gate_ops = {
-	.enable = clk_gate_enable,
-	.disable = clk_gate_disable,
-	.is_enabled = clk_gate_is_enabled,
+	.enable = lpc32xx_clk_gate_enable,
+	.disable = lpc32xx_clk_gate_disable,
+	.is_enabled = lpc32xx_clk_gate_is_enabled,
 };
 
 #define div_mask(width)	((1 << (width)) - 1)
-- 
1.9.1
