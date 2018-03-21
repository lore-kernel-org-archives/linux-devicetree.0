Return-Path: <SRS0=W1u3=GL=gmail.com=richardcochran@kernel.org>
From: Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH net-next RFC V1 2/5] net: phy: Move time stamping interface into the generic mdio layer.
Date: Wed, 21 Mar 2018 11:58:15 -0700
Message-Id: <b032dcdb34684e3831530da1bb198c764e61968b.1521656774.git.richardcochran@gmail.com>
In-Reply-To: <cover.1521656774.git.richardcochran@gmail.com>
References: <cover.1521656774.git.richardcochran@gmail.com>
To: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>

There are different ways of obtaining hardware time stamps on network
packets.  The ingress and egress times can be measured in the MAC, in
the PHY, or by a device listening on the MII bus.  Up until now, the
kernel has support for MAC and PHY time stamping, but not for other
MII bus devices.

This patch moves the PHY time stamping interface into the generic
mdio device in order to support MII time stamping hardware.

Signed-off-by: Richard Cochran <richardcochran@gmail.com>
---
 drivers/net/phy/dp83640.c | 29 ++++++++++++++++++++---------
 drivers/net/phy/phy.c     |  4 ++--
 include/linux/mdio.h      | 23 +++++++++++++++++++++++
 include/linux/phy.h       | 23 -----------------------
 net/core/ethtool.c        |  4 ++--
 net/core/timestamping.c   |  8 ++++----
 6 files changed, 51 insertions(+), 40 deletions(-)

diff --git a/drivers/net/phy/dp83640.c b/drivers/net/phy/dp83640.c
index 654f42d00092..79aeb5eb471a 100644
--- a/drivers/net/phy/dp83640.c
+++ b/drivers/net/phy/dp83640.c
@@ -215,6 +215,10 @@ static LIST_HEAD(phyter_clocks);
 static DEFINE_MUTEX(phyter_clocks_lock);
 
 static void rx_timestamp_work(struct work_struct *work);
+static  int dp83640_ts_info(struct mdio_device *m, struct ethtool_ts_info *i);
+static  int dp83640_hwtstamp(struct mdio_device *m, struct ifreq *i);
+static bool dp83640_rxtstamp(struct mdio_device *m, struct sk_buff *s, int t);
+static void dp83640_txtstamp(struct mdio_device *m, struct sk_buff *s, int t);
 
 /* extended register access functions */
 
@@ -1162,6 +1166,12 @@ static int dp83640_probe(struct phy_device *phydev)
 		list_add_tail(&dp83640->list, &clock->phylist);
 
 	dp83640_clock_put(clock);
+
+	phydev->mdio.ts_info = dp83640_ts_info;
+	phydev->mdio.hwtstamp = dp83640_hwtstamp;
+	phydev->mdio.rxtstamp = dp83640_rxtstamp;
+	phydev->mdio.txtstamp = dp83640_txtstamp;
+
 	return 0;
 
 no_register:
@@ -1288,8 +1298,9 @@ static int dp83640_config_intr(struct phy_device *phydev)
 	}
 }
 
-static int dp83640_hwtstamp(struct phy_device *phydev, struct ifreq *ifr)
+static int dp83640_hwtstamp(struct mdio_device *mdev, struct ifreq *ifr)
 {
+	struct phy_device *phydev = container_of(mdev, struct phy_device, mdio);
 	struct dp83640_private *dp83640 = phydev->priv;
 	struct hwtstamp_config cfg;
 	u16 txcfg0, rxcfg0;
@@ -1397,9 +1408,10 @@ static void rx_timestamp_work(struct work_struct *work)
 		schedule_delayed_work(&dp83640->ts_work, SKB_TIMESTAMP_TIMEOUT);
 }
 
-static bool dp83640_rxtstamp(struct phy_device *phydev,
+static bool dp83640_rxtstamp(struct mdio_device *mdev,
 			     struct sk_buff *skb, int type)
 {
+	struct phy_device *phydev = container_of(mdev, struct phy_device, mdio);
 	struct dp83640_private *dp83640 = phydev->priv;
 	struct dp83640_skb_info *skb_info = (struct dp83640_skb_info *)skb->cb;
 	struct list_head *this, *next;
@@ -1446,9 +1458,10 @@ static bool dp83640_rxtstamp(struct phy_device *phydev,
 	return true;
 }
 
-static void dp83640_txtstamp(struct phy_device *phydev,
+static void dp83640_txtstamp(struct mdio_device *mdev,
 			     struct sk_buff *skb, int type)
 {
+	struct phy_device *phydev = container_of(mdev, struct phy_device, mdio);
 	struct dp83640_private *dp83640 = phydev->priv;
 
 	switch (dp83640->hwts_tx_en) {
@@ -1471,9 +1484,11 @@ static void dp83640_txtstamp(struct phy_device *phydev,
 	}
 }
 
-static int dp83640_ts_info(struct phy_device *dev, struct ethtool_ts_info *info)
+static int dp83640_ts_info(struct mdio_device *mdev,
+			   struct ethtool_ts_info *info)
 {
-	struct dp83640_private *dp83640 = dev->priv;
+	struct phy_device *phydev = container_of(mdev, struct phy_device, mdio);
+	struct dp83640_private *dp83640 = phydev->priv;
 
 	info->so_timestamping =
 		SOF_TIMESTAMPING_TX_HARDWARE |
@@ -1504,10 +1519,6 @@ static struct phy_driver dp83640_driver = {
 	.config_init	= dp83640_config_init,
 	.ack_interrupt  = dp83640_ack_interrupt,
 	.config_intr    = dp83640_config_intr,
-	.ts_info	= dp83640_ts_info,
-	.hwtstamp	= dp83640_hwtstamp,
-	.rxtstamp	= dp83640_rxtstamp,
-	.txtstamp	= dp83640_txtstamp,
 };
 
 static int __init dp83640_init(void)
diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index c2d9027be863..466bf88053ce 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -457,8 +457,8 @@ int phy_mii_ioctl(struct phy_device *phydev, struct ifreq *ifr, int cmd)
 		return 0;
 
 	case SIOCSHWTSTAMP:
-		if (phydev->drv && phydev->drv->hwtstamp)
-			return phydev->drv->hwtstamp(phydev, ifr);
+		if (phydev->mdio.hwtstamp)
+			return phydev->mdio.hwtstamp(&phydev->mdio, ifr);
 		/* fall through */
 
 	default:
diff --git a/include/linux/mdio.h b/include/linux/mdio.h
index 2cfffe586885..70a82c973aed 100644
--- a/include/linux/mdio.h
+++ b/include/linux/mdio.h
@@ -37,6 +37,29 @@ struct mdio_device {
 	void (*device_free)(struct mdio_device *mdiodev);
 	void (*device_remove)(struct mdio_device *mdiodev);
 
+	/* Handles ethtool queries for hardware time stamping. */
+	int (*ts_info)(struct mdio_device *dev, struct ethtool_ts_info *ti);
+
+	/* Handles SIOCSHWTSTAMP ioctl for hardware time stamping. */
+	int  (*hwtstamp)(struct mdio_device *dev, struct ifreq *ifr);
+
+	/*
+	 * Requests a Rx timestamp for 'skb'. If the skb is accepted,
+	 * the mdio device promises to deliver it using netif_rx() as
+	 * soon as a timestamp becomes available. One of the
+	 * PTP_CLASS_ values is passed in 'type'. The function must
+	 * return true if the skb is accepted for delivery.
+	 */
+	bool (*rxtstamp)(struct mdio_device *dev, struct sk_buff *skb, int type);
+
+	/*
+	 * Requests a Tx timestamp for 'skb'. The mdio device promises
+	 * to deliver it using skb_complete_tx_timestamp() as soon as a
+	 * timestamp becomes available. One of the PTP_CLASS_ values
+	 * is passed in 'type'.
+	 */
+	void (*txtstamp)(struct mdio_device *dev, struct sk_buff *skb, int type);
+
 	/* Bus address of the MDIO device (0-31) */
 	int addr;
 	int flags;
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 5a9b1753fdc5..77d3f703b8ce 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -570,29 +570,6 @@ struct phy_driver {
 	 */
 	int (*match_phy_device)(struct phy_device *phydev);
 
-	/* Handles ethtool queries for hardware time stamping. */
-	int (*ts_info)(struct phy_device *phydev, struct ethtool_ts_info *ti);
-
-	/* Handles SIOCSHWTSTAMP ioctl for hardware time stamping. */
-	int  (*hwtstamp)(struct phy_device *phydev, struct ifreq *ifr);
-
-	/*
-	 * Requests a Rx timestamp for 'skb'. If the skb is accepted,
-	 * the phy driver promises to deliver it using netif_rx() as
-	 * soon as a timestamp becomes available. One of the
-	 * PTP_CLASS_ values is passed in 'type'. The function must
-	 * return true if the skb is accepted for delivery.
-	 */
-	bool (*rxtstamp)(struct phy_device *dev, struct sk_buff *skb, int type);
-
-	/*
-	 * Requests a Tx timestamp for 'skb'. The phy driver promises
-	 * to deliver it using skb_complete_tx_timestamp() as soon as a
-	 * timestamp becomes available. One of the PTP_CLASS_ values
-	 * is passed in 'type'.
-	 */
-	void (*txtstamp)(struct phy_device *dev, struct sk_buff *skb, int type);
-
 	/* Some devices (e.g. qnap TS-119P II) require PHY register changes to
 	 * enable Wake on LAN, so set_wol is provided to be called in the
 	 * ethernet driver's set_wol function. */
diff --git a/net/core/ethtool.c b/net/core/ethtool.c
index 157cd9efa4be..b4b81eaa15a9 100644
--- a/net/core/ethtool.c
+++ b/net/core/ethtool.c
@@ -2218,8 +2218,8 @@ static int ethtool_get_ts_info(struct net_device *dev, void __user *useraddr)
 	memset(&info, 0, sizeof(info));
 	info.cmd = ETHTOOL_GET_TS_INFO;
 
-	if (phydev && phydev->drv && phydev->drv->ts_info) {
-		err = phydev->drv->ts_info(phydev, &info);
+	if (phydev && phydev->mdio.ts_info) {
+		err = phydev->mdio.ts_info(&phydev->mdio, &info);
 	} else if (ops->get_ts_info) {
 		err = ops->get_ts_info(dev, &info);
 	} else {
diff --git a/net/core/timestamping.c b/net/core/timestamping.c
index 42689d5c468c..b8857028e652 100644
--- a/net/core/timestamping.c
+++ b/net/core/timestamping.c
@@ -46,11 +46,11 @@ void skb_clone_tx_timestamp(struct sk_buff *skb)
 		return;
 
 	phydev = skb->dev->phydev;
-	if (likely(phydev->drv->txtstamp)) {
+	if (likely(phydev->mdio.txtstamp)) {
 		clone = skb_clone_sk(skb);
 		if (!clone)
 			return;
-		phydev->drv->txtstamp(phydev, clone, type);
+		phydev->mdio.txtstamp(&phydev->mdio, clone, type);
 	}
 }
 EXPORT_SYMBOL_GPL(skb_clone_tx_timestamp);
@@ -76,8 +76,8 @@ bool skb_defer_rx_timestamp(struct sk_buff *skb)
 		return false;
 
 	phydev = skb->dev->phydev;
-	if (likely(phydev->drv->rxtstamp))
-		return phydev->drv->rxtstamp(phydev, skb, type);
+	if (likely(phydev->mdio.rxtstamp))
+		return phydev->mdio.rxtstamp(&phydev->mdio, skb, type);
 
 	return false;
 }
-- 
2.11.0
