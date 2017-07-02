From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 01/18] clk: ingenic: Use const pointer to clk_ops in struct
Date: Sun,  2 Jul 2017 18:29:59 +0200
Message-ID: <20170702163016.6714-2-paul@crapouillou.net>
References: <20170607200439.24450-2-paul@crapouillou.net>
 <20170702163016.6714-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170702163016.6714-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Maarten ter Huurne <maarten@treewalker.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The CGU common code does not modify the pointed clk_ops structure, so it
should be marked as const.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/clk/ingenic/cgu.h        | 2 +-
 drivers/clk/ingenic/jz4780-cgu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

 v2: New patch in this series
 v3: No change

diff --git a/drivers/clk/ingenic/cgu.h b/drivers/clk/ingenic/cgu.h
index 09700b2c555d..da448b0cac18 100644
--- a/drivers/clk/ingenic/cgu.h
+++ b/drivers/clk/ingenic/cgu.h
@@ -120,7 +120,7 @@ struct ingenic_cgu_gate_info {
  * @clk_ops: custom clock operation callbacks
  */
 struct ingenic_cgu_custom_info {
-	struct clk_ops *clk_ops;
+	const struct clk_ops *clk_ops;
 };
 
 /**
diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
index b35d6d9dd5aa..a21698fb202c 100644
--- a/drivers/clk/ingenic/jz4780-cgu.c
+++ b/drivers/clk/ingenic/jz4780-cgu.c
@@ -203,7 +203,7 @@ static int jz4780_otg_phy_set_rate(struct clk_hw *hw, unsigned long req_rate,
 	return 0;
 }
 
-static struct clk_ops jz4780_otg_phy_ops = {
+static const struct clk_ops jz4780_otg_phy_ops = {
 	.get_parent = jz4780_otg_phy_get_parent,
 	.set_parent = jz4780_otg_phy_set_parent,
 
-- 
2.11.0
