From: Anson.Huang@nxp.com
Subject: [PATCH V5 3/5] clk: imx: Add API for clk unregister when driver probe fail
Date: Wed, 19 Jun 2019 13:52:45 +0800
Message-ID: <20190619055247.35771-3-Anson.Huang@nxp.com>
References: <20190619055247.35771-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190619055247.35771-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, will.deacon@arm.com, maxime.ripard@bootlin.com, olof@lixom.net, horms+renesas@verge.net.au, jagan@amarulasolutions.com, leonard.crestez@nxp.com, bjorn.andersson@linaro.org, dinguyen@kernel.org, enric.balletbo@collabora.com, aisheng.dong@nxp.com, ping.bai@nxp.com, abel.vesa@nxp.com, l.stach@pengutronix.de, peng.fan@nxp.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

For i.MX clock drivers probe fail case, clks should be unregistered
in the return path, this patch adds a common API for i.MX clock
drivers to unregister clocks when fail.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
New patch.
---
 drivers/clk/imx/clk.c | 8 ++++++++
 drivers/clk/imx/clk.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
index f241189..8616967 100644
--- a/drivers/clk/imx/clk.c
+++ b/drivers/clk/imx/clk.c
@@ -13,6 +13,14 @@
 
 DEFINE_SPINLOCK(imx_ccm_lock);
 
+void imx_unregister_clocks(struct clk *clks[], unsigned int count)
+{
+	unsigned int i;
+
+	for (i = 0; i < count; i++)
+		clk_unregister(clks[i]);
+}
+
 void __init imx_mmdc_mask_handshake(void __iomem *ccm_base,
 				    unsigned int chn)
 {
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index 19d7b8b..bb4ec1b 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -12,6 +12,7 @@ void imx_check_clk_hws(struct clk_hw *clks[], unsigned int count);
 void imx_register_uart_clocks(struct clk ** const clks[]);
 void imx_register_uart_clocks_hws(struct clk_hw ** const hws[]);
 void imx_mmdc_mask_handshake(void __iomem *ccm_base, unsigned int chn);
+void imx_unregister_clocks(struct clk *clks[], unsigned int count);
 
 extern void imx_cscmr1_fixup(u32 *val);
 
-- 
2.7.4
