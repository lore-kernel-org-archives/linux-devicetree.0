From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v1 11/11] MIPS: ath79: drop !OF clock code
Date: Fri, 11 Jan 2019 15:22:40 +0100
Message-ID: <20190111142240.10908-12-o.rempel@pengutronix.de>
References: <20190111142240.10908-1-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111142240.10908-1-o.rempel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: John Crispin <john@phrozen.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Felix Fietkau <nbd@nbd.name>
List-Id: devicetree@vger.kernel.org

From: John Crispin <john@phrozen.org>

With the target now being fully OF based, we can drop the legacy clock
registration code. All clocks are now probed via devicetree.

Signed-off-by: John Crispin <john@phrozen.org>
---
 arch/mips/ath79/clock.c  | 56 ----------------------------------------
 arch/mips/ath79/common.h |  3 ---
 2 files changed, 59 deletions(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index aea9590bf353..d4ca97e2ec6c 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -617,60 +617,6 @@ static void __init qca956x_clocks_init(void __iomem *pll_base)
 	ath79_set_clk(ATH79_CLK_AHB, ahb_rate);
 }
 
-void __init ath79_clocks_init(void)
-{
-	const char *wdt;
-	const char *uart;
-
-	if (soc_is_ar71xx())
-		ar71xx_clocks_init(ath79_pll_base);
-	else if (soc_is_ar724x() || soc_is_ar913x())
-		ar724x_clocks_init(ath79_pll_base);
-	else if (soc_is_ar933x())
-		ar933x_clocks_init(ath79_pll_base);
-	else if (soc_is_ar934x())
-		ar934x_clocks_init(ath79_pll_base);
-	else if (soc_is_qca953x())
-		qca953x_clocks_init(ath79_pll_base);
-	else if (soc_is_qca955x())
-		qca955x_clocks_init(ath79_pll_base);
-	else if (soc_is_qca956x() || soc_is_tp9343())
-		qca956x_clocks_init(ath79_pll_base);
-	else
-		BUG();
-
-	if (soc_is_ar71xx() || soc_is_ar724x() || soc_is_ar913x()) {
-		wdt = "ahb";
-		uart = "ahb";
-	} else if (soc_is_ar933x()) {
-		wdt = "ahb";
-		uart = "ref";
-	} else {
-		wdt = "ref";
-		uart = "ref";
-	}
-
-	clk_add_alias("wdt", NULL, wdt, NULL);
-	clk_add_alias("uart", NULL, uart, NULL);
-}
-
-unsigned long __init
-ath79_get_sys_clk_rate(const char *id)
-{
-	struct clk *clk;
-	unsigned long rate;
-
-	clk = clk_get(NULL, id);
-	if (IS_ERR(clk))
-		panic("unable to get %s clock, err=%d", id, (int) PTR_ERR(clk));
-
-	rate = clk_get_rate(clk);
-	clk_put(clk);
-
-	return rate;
-}
-
-#ifdef CONFIG_OF
 static void __init ath79_clocks_init_dt(struct device_node *np)
 {
 	struct clk *ref_clk;
@@ -727,5 +673,3 @@ CLK_OF_DECLARE(ar9340_clk, "qca,ar9340-pll", ath79_clocks_init_dt);
 CLK_OF_DECLARE(ar9530_clk, "qca,qca9530-pll", ath79_clocks_init_dt);
 CLK_OF_DECLARE(ar9550_clk, "qca,qca9550-pll", ath79_clocks_init_dt);
 CLK_OF_DECLARE(ar9560_clk, "qca,qca9560-pll", ath79_clocks_init_dt);
-
-#endif
diff --git a/arch/mips/ath79/common.h b/arch/mips/ath79/common.h
index 77dd989e5ce0..25b96f59e8e8 100644
--- a/arch/mips/ath79/common.h
+++ b/arch/mips/ath79/common.h
@@ -19,9 +19,6 @@
 #define ATH79_MEM_SIZE_MIN	(2 * 1024 * 1024)
 #define ATH79_MEM_SIZE_MAX	(256 * 1024 * 1024)
 
-void ath79_clocks_init(void);
-unsigned long ath79_get_sys_clk_rate(const char *id);
-
 void ath79_ddr_ctrl_init(void);
 
 #endif /* __ATH79_COMMON_H */
-- 
2.20.1
