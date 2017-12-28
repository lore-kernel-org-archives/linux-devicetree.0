From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v4 03/15] clk: ingenic: support PLLs with no bypass bit
Date: Thu, 28 Dec 2017 14:56:22 +0100
Message-ID: <20171228135634.30000-4-paul@crapouillou.net>
References: <20170702163016.6714-2-paul@crapouillou.net>
 <20171228135634.30000-1-paul@crapouillou.net>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20171228135634.30000-1-paul@crapouillou.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, Maarten ter Huurne <maarten@treewalker.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The second PLL of the JZ4770 does not have a bypass bit.
This commit makes it possible to support it with the current common CGU
code.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/clk/ingenic/cgu.c | 3 ++-
 drivers/clk/ingenic/cgu.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

 v2: No change
 v3: No change
 v4: No change

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index a2e73a6d60fd..381c4a17a1fc 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -100,7 +100,8 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	n += pll_info->n_offset;
 	od_enc = ctl >> pll_info->od_shift;
 	od_enc &= GENMASK(pll_info->od_bits - 1, 0);
-	bypass = !!(ctl & BIT(pll_info->bypass_bit));
+	bypass = !pll_info->no_bypass_bit &&
+		 !!(ctl & BIT(pll_info->bypass_bit));
 	enable = !!(ctl & BIT(pll_info->enable_bit));
 
 	if (bypass)
diff --git a/drivers/clk/ingenic/cgu.h b/drivers/clk/ingenic/cgu.h
index f1527cf75b3f..9da34910bd80 100644
--- a/drivers/clk/ingenic/cgu.h
+++ b/drivers/clk/ingenic/cgu.h
@@ -48,6 +48,7 @@
  * @bypass_bit: the index of the bypass bit in the PLL control register
  * @enable_bit: the index of the enable bit in the PLL control register
  * @stable_bit: the index of the stable bit in the PLL control register
+ * @no_bypass_bit: if set, the PLL has no bypass functionality
  */
 struct ingenic_cgu_pll_info {
 	unsigned reg;
@@ -58,6 +59,7 @@ struct ingenic_cgu_pll_info {
 	u8 bypass_bit;
 	u8 enable_bit;
 	u8 stable_bit;
+	bool no_bypass_bit;
 };
 
 /**
-- 
2.11.0
