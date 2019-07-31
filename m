From: Harini Katakam <harini.katakam@xilinx.com>
Subject: [RFC PATCH 2/2] net: macb: Add SGMII poll thread
Date: Wed, 31 Jul 2019 15:10:33 +0530
Message-ID: <1564566033-676-3-git-send-email-harini.katakam@xilinx.com>
References: <1564566033-676-1-git-send-email-harini.katakam@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564566033-676-1-git-send-email-harini.katakam@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@microchip.com, davem@davemloft.net, claudiu.beznea@microchip.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, michal.simek@xilinx.com, harinikatakamlinux@gmail.com, harini.katakam@xilinx.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The internal SGMII mode in PS GEM on ZynqMP can be used without any
external PHY on board. In this case, the phy framework doesn't kick
in to monitor the link status. Hence do the same in macb driver.

Signed-off-by: Harini Katakam <harini.katakam@xilinx.com>
Signed-off-by: Kester Aernoudt <kester.aernoudt@xilinx.com>
---
 drivers/net/ethernet/cadence/macb.h      |  8 ++++
 drivers/net/ethernet/cadence/macb_main.c | 65 ++++++++++++++++++++++++++++++--
 2 files changed, 69 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index 03983bd..b07284a 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -155,6 +155,7 @@
 #define GEM_PEFTN		0x01f4 /* PTP Peer Event Frame Tx Ns */
 #define GEM_PEFRSL		0x01f8 /* PTP Peer Event Frame Rx Sec Low */
 #define GEM_PEFRN		0x01fc /* PTP Peer Event Frame Rx Ns */
+#define GEM_PCSSTATUS		0x0204 /* PCS Status */
 #define GEM_DCFG1		0x0280 /* Design Config 1 */
 #define GEM_DCFG2		0x0284 /* Design Config 2 */
 #define GEM_DCFG3		0x0288 /* Design Config 3 */
@@ -455,6 +456,10 @@
 #define MACB_REV_OFFSET				0
 #define MACB_REV_SIZE				16
 
+/* Bitfields in PCSSTATUS */
+#define GEM_PCSLINK_OFFSET			2
+#define GEM_PCSLINK_SIZE			1
+
 /* Bitfields in DCFG1. */
 #define GEM_IRQCOR_OFFSET			23
 #define GEM_IRQCOR_SIZE				1
@@ -1232,6 +1237,9 @@ struct macb {
 	u32	rx_intr_mask;
 
 	struct macb_pm_data pm_data;
+
+	int internal_pcspma;
+	struct task_struct *sgmii_poll_task;
 };
 
 #ifdef CONFIG_MACB_USE_HWSTAMP
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 5ca17e6..ae1f18d 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -36,6 +36,7 @@
 #include <linux/tcp.h>
 #include <linux/iopoll.h>
 #include <linux/pm_runtime.h>
+#include <linux/kthread.h>
 #include "macb.h"
 
 /* This structure is only used for MACB on SiFive FU540 devices */
@@ -2418,8 +2419,10 @@ static int macb_open(struct net_device *dev)
 	/* carrier starts down */
 	netif_carrier_off(dev);
 
-	/* if the phy is not yet register, retry later*/
-	if (!dev->phydev) {
+	/* if the phy is not yet registered and internal SGMII is not used,
+	 * retry later
+	 */
+	if (!bp->internal_pcspma && !dev->phydev) {
 		err = -EAGAIN;
 		goto pm_exit;
 	}
@@ -2441,7 +2444,8 @@ static int macb_open(struct net_device *dev)
 	macb_init_hw(bp);
 
 	/* schedule a link state check */
-	phy_start(dev->phydev);
+	if (!bp->internal_pcspma)
+		phy_start(dev->phydev);
 
 	netif_tx_start_all_queues(dev);
 
@@ -2468,7 +2472,7 @@ static int macb_close(struct net_device *dev)
 	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue)
 		napi_disable(&queue->napi);
 
-	if (dev->phydev)
+	if (!bp->internal_pcspma && dev->phydev)
 		phy_stop(dev->phydev);
 
 	spin_lock_irqsave(&bp->lock, flags);
@@ -3187,6 +3191,49 @@ static const struct ethtool_ops gem_ethtool_ops = {
 	.set_rxnfc			= gem_set_rxnfc,
 };
 
+int gem_sgmii_status_poll(void *data)
+{
+	struct net_device *dev = data;
+	struct macb *bp = netdev_priv(dev);
+	int status, prev_status = 0;
+	u32 reg;
+
+	while (!kthread_should_stop()) {
+		status = gem_readl(bp, PCSSTATUS) & GEM_BIT(PCSLINK);
+		reg = macb_readl(bp, NCR);
+		if (!(reg & MACB_BIT(RE)) || !(reg & MACB_BIT(TE)) ||
+		    (!netif_carrier_ok(dev) && prev_status))
+			status = 0;
+
+		if (status != prev_status) {
+			if (status) {
+				reg = macb_readl(bp, NCFGR);
+				reg |= MACB_BIT(FD);
+				reg |= GEM_BIT(GBE);
+
+				macb_or_gem_writel(bp, NCFGR, reg);
+
+				bp->speed = SPEED_1000;
+				bp->duplex = DUPLEX_FULL;
+				bp->link = 1;
+				macb_set_tx_clk(bp->tx_clk, SPEED_1000, dev);
+
+				netif_carrier_on(dev);
+				netdev_info(dev, "link up (%d/%s)\n",
+					    SPEED_1000, "Full");
+			} else {
+				netif_carrier_off(dev);
+				netdev_info(dev, "link down\n");
+			}
+
+			prev_status = status;
+		}
+		schedule_timeout_uninterruptible(HZ);
+	}
+
+	return 0;
+}
+
 static int macb_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 {
 	struct phy_device *phydev = dev->phydev;
@@ -4344,6 +4391,12 @@ static int macb_probe(struct platform_device *pdev)
 		    macb_is_gem(bp) ? "GEM" : "MACB", macb_readl(bp, MID),
 		    dev->base_addr, dev->irq, dev->dev_addr);
 
+	bp->internal_pcspma = of_property_read_bool(np, "is-internal-pcspma");
+
+	if (bp->internal_pcspma)
+		bp->sgmii_poll_task = kthread_run(gem_sgmii_status_poll, dev,
+						  "gem_sgmii_status_poll");
+
 	pm_runtime_mark_last_busy(&bp->pdev->dev);
 	pm_runtime_put_autosuspend(&bp->pdev->dev);
 
@@ -4384,6 +4437,10 @@ static int macb_remove(struct platform_device *pdev)
 
 	if (dev) {
 		bp = netdev_priv(dev);
+
+		if (bp->internal_pcspma)
+			kthread_stop(bp->sgmii_poll_task);
+
 		if (dev->phydev)
 			phy_disconnect(dev->phydev);
 		mdiobus_unregister(bp->mii_bus);
-- 
2.7.4
