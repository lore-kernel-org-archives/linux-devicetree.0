From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v1 06/11] MIPS: ath79: export switch MDIO reference clock
Date: Fri, 11 Jan 2019 15:22:35 +0100
Message-ID: <20190111142240.10908-7-o.rempel@pengutronix.de>
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

On AR934x, the MDIO reference clock can be configured to a fixed 100 MHz
clock. If that feature is not used, it defaults to the main reference
clock, like on all other SoC.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: John Crispin <john@phrozen.org>
---
 arch/mips/ath79/clock.c               | 8 ++++++++
 include/dt-bindings/clock/ath79-clk.h | 3 ++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index c234818b30e1..699f00f096cb 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -42,6 +42,7 @@ static const char * const clk_names[ATH79_CLK_END] = {
 	[ATH79_CLK_DDR] = "ddr",
 	[ATH79_CLK_AHB] = "ahb",
 	[ATH79_CLK_REF] = "ref",
+	[ATH79_CLK_MDIO] = "mdio",
 };
 
 static const char * __init ath79_clk_name(int type)
@@ -342,6 +343,10 @@ static void __init ar934x_clocks_init(void __iomem *pll_base)
 	ath79_set_clk(ATH79_CLK_DDR, ddr_rate);
 	ath79_set_clk(ATH79_CLK_AHB, ahb_rate);
 
+	clk_ctrl = __raw_readl(pll_base + AR934X_PLL_SWITCH_CLOCK_CONTROL_REG);
+	if (clk_ctrl & AR934X_PLL_SWITCH_CLOCK_CONTROL_MDIO_CLK_SEL)
+		ath79_set_clk(ATH79_CLK_MDIO, 100 * 1000 * 1000);
+
 	iounmap(dpll_base);
 }
 
@@ -698,6 +703,9 @@ static void __init ath79_clocks_init_dt(struct device_node *np)
 	else if (of_device_is_compatible(np, "qca,qca9560-pll"))
 		qca956x_clocks_init(pll_base);
 
+	if (!clks[ATH79_CLK_MDIO])
+		clks[ATH79_CLK_MDIO] = clks[ATH79_CLK_REF];
+
 	if (of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data)) {
 		pr_err("%pOF: could not register clk provider\n", np);
 		goto err_iounmap;
diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
index 262d7c5eb248..dcc679a7ad85 100644
--- a/include/dt-bindings/clock/ath79-clk.h
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -14,7 +14,8 @@
 #define ATH79_CLK_DDR		1
 #define ATH79_CLK_AHB		2
 #define ATH79_CLK_REF		3
+#define ATH79_CLK_MDIO		4
 
-#define ATH79_CLK_END		4
+#define ATH79_CLK_END		5
 
 #endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.20.1
