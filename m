From: Christophe Roullier <christophe.roullier@st.com>
Subject: [PATCH V3 1/6] net: ethernet: stmmac: manage Ethernet WoL for stm32mp157c.
Date: Tue, 5 Mar 2019 09:29:23 +0100
Message-ID: <1551774568-11732-2-git-send-email-christophe.roullier@st.com>
References: <1551774568-11732-1-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1551774568-11732-1-git-send-email-christophe.roullier@st.com>
Sender: netdev-owner@vger.kernel.org
To: robh@kernel.org, davem@davemloft.net, joabreu@synopsys.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, christophe.roullier@st.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

Add glue codes to support magic packet on stm32mp157c

Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 30 ++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 7e2e79d..d1cf145 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -42,6 +42,7 @@ struct stm32_dwmac {
 	struct clk *clk_ethstp;
 	struct clk *syscfg_clk;
 	bool int_phyclk;	/* Clock from RCC to drive PHY */
+	int irq_pwr_wakeup;
 	u32 mode_reg;		/* MAC glue-logic mode register */
 	struct regmap *regmap;
 	u32 speed;
@@ -232,7 +233,9 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
 static int stm32mp1_parse_data(struct stm32_dwmac *dwmac,
 			       struct device *dev)
 {
+	struct platform_device *pdev = to_platform_device(dev);
 	struct device_node *np = dev->of_node;
+	int err = 0;
 
 	dwmac->int_phyclk = of_property_read_bool(np, "st,int-phyclk");
 
@@ -260,7 +263,26 @@ static int stm32mp1_parse_data(struct stm32_dwmac *dwmac,
 		return PTR_ERR(dwmac->syscfg_clk);
 	}
 
-	return 0;
+	/* Get IRQ information early to have an ability to ask for deferred
+	 * probe if needed before we went too far with resource allocation.
+	 */
+	dwmac->irq_pwr_wakeup = platform_get_irq_byname(pdev,
+							"stm32_pwr_wakeup");
+	if (!dwmac->int_phyclk && dwmac->irq_pwr_wakeup >= 0) {
+		err = device_init_wakeup(&pdev->dev, true);
+		if (err) {
+			dev_err(&pdev->dev, "Failed to init wake up irq\n");
+			return err;
+		}
+		err = dev_pm_set_dedicated_wake_irq(&pdev->dev,
+						    dwmac->irq_pwr_wakeup);
+		if (err) {
+			dev_err(&pdev->dev, "Failed to set wake up irq\n");
+			device_init_wakeup(&pdev->dev, false);
+		}
+		device_set_wakeup_enable(&pdev->dev, false);
+	}
+	return err;
 }
 
 static int stm32_dwmac_probe(struct platform_device *pdev)
@@ -326,9 +348,15 @@ static int stm32_dwmac_remove(struct platform_device *pdev)
 	struct net_device *ndev = platform_get_drvdata(pdev);
 	struct stmmac_priv *priv = netdev_priv(ndev);
 	int ret = stmmac_dvr_remove(&pdev->dev);
+	struct stm32_dwmac *dwmac = priv->plat->bsp_priv;
 
 	stm32_dwmac_clk_disable(priv->plat->bsp_priv);
 
+	if (dwmac->irq_pwr_wakeup >= 0) {
+		dev_pm_clear_wake_irq(&pdev->dev);
+		device_init_wakeup(&pdev->dev, false);
+	}
+
 	return ret;
 }
 
-- 
2.7.4
