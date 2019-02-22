From: Christophe Roullier <christophe.roullier@st.com>
Subject: [PATCH V2 5/8] net: ethernet: stmmac: update to be compatible with MCU family (stm32f4, stm32h7)
Date: Fri, 22 Feb 2019 09:28:06 +0100
Message-ID: <1550824089-19961-6-git-send-email-christophe.roullier@st.com>
References: <1550824089-19961-1-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1550824089-19961-1-git-send-email-christophe.roullier@st.com>
Sender: netdev-owner@vger.kernel.org
To: robh@kernel.org, davem@davemloft.net, joabreu@synopsys.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, christophe.roullier@st.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

Update glue codes to be compatible with MCU family.

Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 51 ++++++++++++++++++-----
 1 file changed, 41 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 8d5150a..66d95c2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -6,7 +6,6 @@
  * License terms:  GNU General Public License (GPL), version 2
  *
  */
-
 #include <linux/clk.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
@@ -119,12 +118,6 @@ static int stm32_dwmac_init(struct plat_stmmacenet_data *plat_dat)
 	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
 	int ret;
 
-	if (dwmac->ops->set_mode) {
-		ret = dwmac->ops->set_mode(plat_dat);
-		if (ret)
-			return ret;
-	}
-
 	ret = clk_prepare_enable(dwmac->clk_tx);
 	if (ret)
 		return ret;
@@ -139,13 +132,26 @@ static int stm32_dwmac_init(struct plat_stmmacenet_data *plat_dat)
 
 	if (dwmac->ops->clk_prepare) {
 		ret = dwmac->ops->clk_prepare(dwmac, true);
+		if (ret)
+			goto err_clk_disable;
+	}
+
+	if (dwmac->ops->set_mode) {
+		ret = dwmac->ops->set_mode(plat_dat);
 		if (ret) {
-			clk_disable_unprepare(dwmac->clk_rx);
-			clk_disable_unprepare(dwmac->clk_tx);
+			if (dwmac->ops->clk_prepare)
+				dwmac->ops->clk_prepare(dwmac, false);
+			goto err_clk_disable;
 		}
 	}
 
 	return ret;
+
+err_clk_disable:
+	clk_disable_unprepare(dwmac->clk_rx);
+	clk_disable_unprepare(dwmac->clk_tx);
+
+	return ret;
 }
 
 static int stm32mp1_clk_prepare(struct stm32_dwmac *dwmac, bool prepare)
@@ -243,7 +249,19 @@ static int stm32mcu_set_mode(struct plat_stmmacenet_data *plat_dat)
 	}
 
 	return regmap_update_bits(dwmac->regmap, reg,
-				 dwmac->ops->syscfg_eth_mask, val);
+				 dwmac->ops->syscfg_eth_mask, val << 23);
+}
+
+static int stm32mcu_clk_prepare(struct stm32_dwmac *dwmac, bool prepare)
+{
+	int ret = 0;
+
+	if (prepare)
+		ret = clk_prepare_enable(dwmac->syscfg_clk);
+	else
+		clk_disable_unprepare(dwmac->syscfg_clk);
+
+	return ret;
 }
 
 static void stm32_dwmac_clk_disable(struct stm32_dwmac *dwmac)
@@ -350,6 +368,17 @@ static int stm32mp1_parse_data(struct stm32_dwmac *dwmac,
 	return err;
 }
 
+static int stm32mcu_parse_data(struct stm32_dwmac *dwmac,
+			       struct device *dev)
+{
+	/*  Clock for sysconfig */
+	dwmac->syscfg_clk = devm_clk_get(dev, "syscfg-clk");
+	if (IS_ERR(dwmac->syscfg_clk))
+		dev_warn(dev, "No syscfg clock provided...\n");
+
+	return 0;
+}
+
 static int stm32_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -496,7 +525,9 @@ static SIMPLE_DEV_PM_OPS(stm32_dwmac_pm_ops,
 
 static struct stm32_ops stm32mcu_dwmac_data = {
 	.set_mode = stm32mcu_set_mode,
+	.clk_prepare = stm32mcu_clk_prepare,
 	.suspend = stm32mcu_suspend,
+	.parse_data = stm32mcu_parse_data,
 	.syscfg_eth_mask = SYSCFG_MCU_ETH_MASK
 };
 
-- 
2.7.4
