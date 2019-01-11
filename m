From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v1 05/11] MIPS: ath79: support setting up clock via DT on all SoC types
Date: Fri, 11 Jan 2019 15:22:34 +0100
Message-ID: <20190111142240.10908-6-o.rempel@pengutronix.de>
References: <20190111142240.10908-1-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111142240.10908-1-o.rempel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Felix Fietkau <nbd@nbd.name>

Use the same functions as the legacy code

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: John Crispin <john@phrozen.org>
---
 arch/mips/ath79/clock.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 6262253622b3..c234818b30e1 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -668,16 +668,6 @@ ath79_get_sys_clk_rate(const char *id)
 
 #ifdef CONFIG_OF
 static void __init ath79_clocks_init_dt(struct device_node *np)
-{
-	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
-}
-
-CLK_OF_DECLARE(ar7100, "qca,ar7100-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar7240, "qca,ar7240-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9340, "qca,ar9340-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9550, "qca,qca9550-pll", ath79_clocks_init_dt);
-
-static void __init ath79_clocks_init_dt_ng(struct device_node *np)
 {
 	struct clk *ref_clk;
 	void __iomem *pll_base;
@@ -692,14 +682,21 @@ static void __init ath79_clocks_init_dt_ng(struct device_node *np)
 		goto err_clk;
 	}
 
-	if (of_device_is_compatible(np, "qca,ar9130-pll"))
+	if (of_device_is_compatible(np, "qca,ar7100-pll"))
+		ar71xx_clocks_init(pll_base);
+	else if (of_device_is_compatible(np, "qca,ar7240-pll") ||
+		 of_device_is_compatible(np, "qca,ar9130-pll"))
 		ar724x_clocks_init(pll_base);
 	else if (of_device_is_compatible(np, "qca,ar9330-pll"))
 		ar933x_clocks_init(pll_base);
-	else {
-		pr_err("%pOF: could not find any appropriate clk_init()\n", np);
-		goto err_iounmap;
-	}
+	else if (of_device_is_compatible(np, "qca,ar9340-pll"))
+		ar934x_clocks_init(pll_base);
+	else if (of_device_is_compatible(np, "qca,qca9530-pll"))
+		qca953x_clocks_init(pll_base);
+	else if (of_device_is_compatible(np, "qca,qca9550-pll"))
+		qca955x_clocks_init(pll_base);
+	else if (of_device_is_compatible(np, "qca,qca9560-pll"))
+		qca956x_clocks_init(pll_base);
 
 	if (of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data)) {
 		pr_err("%pOF: could not register clk provider\n", np);
@@ -714,6 +711,14 @@ static void __init ath79_clocks_init_dt_ng(struct device_node *np)
 err_clk:
 	clk_put(ref_clk);
 }
-CLK_OF_DECLARE(ar9130_clk, "qca,ar9130-pll", ath79_clocks_init_dt_ng);
-CLK_OF_DECLARE(ar9330_clk, "qca,ar9330-pll", ath79_clocks_init_dt_ng);
+
+CLK_OF_DECLARE(ar7100_clk, "qca,ar7100-pll", ath79_clocks_init_dt);
+CLK_OF_DECLARE(ar7240_clk, "qca,ar7240-pll", ath79_clocks_init_dt);
+CLK_OF_DECLARE(ar9130_clk, "qca,ar9130-pll", ath79_clocks_init_dt);
+CLK_OF_DECLARE(ar9330_clk, "qca,ar9330-pll", ath79_clocks_init_dt);
+CLK_OF_DECLARE(ar9340_clk, "qca,ar9340-pll", ath79_clocks_init_dt);
+CLK_OF_DECLARE(ar9530_clk, "qca,qca9530-pll", ath79_clocks_init_dt);
+CLK_OF_DECLARE(ar9550_clk, "qca,qca9550-pll", ath79_clocks_init_dt);
+CLK_OF_DECLARE(ar9560_clk, "qca,qca9560-pll", ath79_clocks_init_dt);
+
 #endif
-- 
2.20.1
