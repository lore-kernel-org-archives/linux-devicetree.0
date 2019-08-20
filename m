From: megous@megous.com
Subject: [PATCH 3/6] net: stmmac: sun8i: Use devm_regulator_get for PHY regulator
Date: Tue, 20 Aug 2019 16:53:40 +0200
Message-ID: <20190820145343.29108-4-megous@megous.com>
References: <20190820145343.29108-1-megous@megous.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820145343.29108-1-megous@megous.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Ondrej Jirman <megous@megous.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

Use devm_regulator_get instead of devm_regulator_get_optional and rely
on dummy supply. This avoids NULL checks before regulator_enable/disable
calls.

This path also improves error reporting, because we now report both
use of dummy supply and error during registration with more detail,
instead of generic info level message "No regulator found" that
was reported previously on errors and lack of regulator property in DT.

Finally, we'll be adding further optional regulators, and the overall
code will be simpler.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 23 ++++++++-----------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 4083019c547a..3e951a11aec3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -528,12 +528,10 @@ static int sun8i_dwmac_init(struct platform_device *pdev, void *priv)
 	struct sunxi_priv_data *gmac = priv;
 	int ret;
 
-	if (gmac->regulator) {
-		ret = regulator_enable(gmac->regulator);
-		if (ret) {
-			dev_err(&pdev->dev, "Fail to enable regulator\n");
-			return ret;
-		}
+	ret = regulator_enable(gmac->regulator);
+	if (ret) {
+		dev_err(&pdev->dev, "Fail to enable regulator\n");
+		return ret;
 	}
 
 	ret = clk_prepare_enable(gmac->tx_clk);
@@ -992,8 +990,7 @@ static void sun8i_dwmac_exit(struct platform_device *pdev, void *priv)
 
 	clk_disable_unprepare(gmac->tx_clk);
 
-	if (gmac->regulator)
-		regulator_disable(gmac->regulator);
+	regulator_disable(gmac->regulator);
 }
 
 static void sun8i_dwmac_set_mac_loopback(void __iomem *ioaddr, bool enable)
@@ -1129,12 +1126,12 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	}
 
 	/* Optional regulator for PHY */
-	gmac->regulator = devm_regulator_get_optional(dev, "phy");
+	gmac->regulator = devm_regulator_get(dev, "phy");
 	if (IS_ERR(gmac->regulator)) {
-		if (PTR_ERR(gmac->regulator) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		dev_info(dev, "No regulator found\n");
-		gmac->regulator = NULL;
+		ret = PTR_ERR(gmac->regulator);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get PHY regulator (%d)\n", ret);
+		return ret;
 	}
 
 	/* The "GMAC clock control" register might be located in the
-- 
2.22.1
