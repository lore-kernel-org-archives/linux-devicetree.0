From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 03/17] clk: ingenic: support PLLs with no bypass bit
Date: Tue, 20 Jun 2017 17:18:41 +0200
Message-ID: <20170620151855.19399-3-paul@crapouillou.net>
References: <20170607200439.24450-2-paul@crapouillou.net>
 <20170620151855.19399-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170620151855.19399-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Maarten ter Huurne <maarten@treewalker.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
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

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index eb9002ccf3fc..75b083ba294c 100644
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
index da448b0cac18..21420b455985 100644
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
