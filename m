From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 2/4] macb: Kill PHY reset code
Date: Mon,  4 Dec 2017 11:34:50 +0100
Message-ID: <1512383692-14009-3-git-send-email-geert+renesas@glider.be>
References: <1512383692-14009-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512383692-14009-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Richard Leitner <richard.leitner@skidata.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

With the phylib now being aware of the "reset-gpios" PHY node property,
there should be no need to frob the PHY reset in this driver anymore...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - Add Reviewed-by,

v3:
  - Resolve rejects due to the file being renamed, refresh the patch,
  - Add code to reset PHY on probe error,
  - Edit patch description,
  - Take over from Sergei,
  - Add Acked-by,

v2:
  - No changes.
---
 drivers/net/ethernet/cadence/macb.h      |  1 -
 drivers/net/ethernet/cadence/macb_main.c | 21 ---------------------
 2 files changed, 22 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index 3165c2ba58f97744..c50c5ec49b1dc585 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -1171,7 +1171,6 @@ struct macb {
 	unsigned int		dma_burst_length;
 
 	phy_interface_t		phy_interface;
-	struct gpio_desc	*reset_gpio;
 
 	/* AT91RM9200 transmit */
 	struct sk_buff *skb;			/* holds skb until xmit interrupt completes */
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index c5fa87cdc6c401a7..3f0dfb20fdbcf936 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -3803,7 +3803,6 @@ static int macb_probe(struct platform_device *pdev)
 					      = macb_config->clk_init;
 	int (*init)(struct platform_device *) = macb_config->init;
 	struct device_node *np = pdev->dev.of_node;
-	struct device_node *phy_node;
 	struct clk *pclk, *hclk = NULL, *tx_clk = NULL, *rx_clk = NULL;
 	unsigned int queue_mask, num_queues;
 	struct macb_platform_data *pdata;
@@ -3909,18 +3908,6 @@ static int macb_probe(struct platform_device *pdev)
 	else
 		macb_get_hwaddr(bp);
 
-	/* Power up the PHY if there is a GPIO reset */
-	phy_node =  of_get_next_available_child(np, NULL);
-	if (phy_node) {
-		int gpio = of_get_named_gpio(phy_node, "reset-gpios", 0);
-
-		if (gpio_is_valid(gpio)) {
-			bp->reset_gpio = gpio_to_desc(gpio);
-			gpiod_direction_output(bp->reset_gpio, 1);
-		}
-	}
-	of_node_put(phy_node);
-
 	err = of_get_phy_mode(np);
 	if (err < 0) {
 		pdata = dev_get_platdata(&pdev->dev);
@@ -3967,10 +3954,6 @@ static int macb_probe(struct platform_device *pdev)
 		of_phy_deregister_fixed_link(np);
 	mdiobus_free(bp->mii_bus);
 
-	/* Shutdown the PHY if there is a GPIO reset */
-	if (bp->reset_gpio)
-		gpiod_set_value(bp->reset_gpio, 0);
-
 err_out_free_netdev:
 	free_netdev(dev);
 
@@ -4001,10 +3984,6 @@ static int macb_remove(struct platform_device *pdev)
 		dev->phydev = NULL;
 		mdiobus_free(bp->mii_bus);
 
-		/* Shutdown the PHY if there is a GPIO reset */
-		if (bp->reset_gpio)
-			gpiod_set_value(bp->reset_gpio, 0);
-
 		unregister_netdev(dev);
 		clk_disable_unprepare(bp->tx_clk);
 		clk_disable_unprepare(bp->hclk);
-- 
2.7.4
