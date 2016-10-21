From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 23/23] clk: renesas: rcar-gen2: Remove obsolete
 rcar_gen2_clocks_init()
Date: Fri, 21 Oct 2016 15:17:37 +0200
Message-ID: <1477055857-17936-24-git-send-email-geert+renesas@glider.be>
References: <1477055857-17936-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1477055857-17936-1-git-send-email-geert+renesas@glider.be>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The R-Car Gen2 board code no longer calls rcar_gen2_clocks_init().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Dirk Behme <dirk.behme@de.bosch.com>
---
v4:
  - Add Acked-by,

v3:
  - Rebased,

v2:
  - No changes.
---
 drivers/clk/renesas/clk-rcar-gen2.c | 7 -------
 include/linux/clk/renesas.h         | 2 --
 2 files changed, 9 deletions(-)

diff --git a/drivers/clk/renesas/clk-rcar-gen2.c b/drivers/clk/renesas/clk-rcar-gen2.c
index 3291fd430ad4e215..f39519edc645ca87 100644
--- a/drivers/clk/renesas/clk-rcar-gen2.c
+++ b/drivers/clk/renesas/clk-rcar-gen2.c
@@ -445,10 +445,3 @@ static void __init rcar_gen2_cpg_clocks_init(struct device_node *np)
 }
 CLK_OF_DECLARE(rcar_gen2_cpg_clks, "renesas,rcar-gen2-cpg-clocks",
 	       rcar_gen2_cpg_clocks_init);
-
-void __init rcar_gen2_clocks_init(u32 mode)
-{
-	cpg_mode = mode;
-
-	of_clk_init(NULL);
-}
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index 9e969941f3f62878..9ebf1f8243bb57af 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -20,8 +20,6 @@
 struct device_node;
 struct generic_pm_domain;
 
-void rcar_gen2_clocks_init(u32 mode);
-
 void cpg_mstp_add_clk_domain(struct device_node *np);
 #ifdef CONFIG_CLK_RENESAS_CPG_MSTP
 int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev);
-- 
1.9.1
