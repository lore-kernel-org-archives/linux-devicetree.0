Return-Path: <SRS0=W1u3=GL=gmail.com=richardcochran@kernel.org>
From: Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH net-next RFC V1 4/5] net: Use the generic MII time stamper when available.
Date: Wed, 21 Mar 2018 11:58:17 -0700
Message-Id: <461dff568dba6ea8c98582c79d16c3155e662cf5.1521656774.git.richardcochran@gmail.com>
In-Reply-To: <cover.1521656774.git.richardcochran@gmail.com>
References: <cover.1521656774.git.richardcochran@gmail.com>
To: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>

Now that the infrastructure is in place, convert the PHY time stamping
logic to use the generic MII device.  This change has the added benefit
of simplifying the code somewhat.

Signed-off-by: Richard Cochran <richardcochran@gmail.com>
---
 drivers/net/phy/phy.c   |  6 ++++--
 net/Kconfig             |  8 ++++----
 net/core/ethtool.c      |  5 ++---
 net/core/timestamping.c | 36 ++++++++++--------------------------
 4 files changed, 20 insertions(+), 35 deletions(-)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index 466bf88053ce..df80c6b14478 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -397,6 +397,7 @@ int phy_mii_ioctl(struct phy_device *phydev, struct ifreq *ifr, int cmd)
 	struct mii_ioctl_data *mii_data = if_mii(ifr);
 	u16 val = mii_data->val_in;
 	bool change_autoneg = false;
+	struct net_device *netdev;
 
 	switch (cmd) {
 	case SIOCGMIIPHY:
@@ -457,8 +458,9 @@ int phy_mii_ioctl(struct phy_device *phydev, struct ifreq *ifr, int cmd)
 		return 0;
 
 	case SIOCSHWTSTAMP:
-		if (phydev->mdio.hwtstamp)
-			return phydev->mdio.hwtstamp(&phydev->mdio, ifr);
+		netdev = phydev->attached_dev;
+		if (netdev->mdiots->hwtstamp)
+			return netdev->mdiots->hwtstamp(netdev->mdiots, ifr);
 		/* fall through */
 
 	default:
diff --git a/net/Kconfig b/net/Kconfig
index 0428f12c25c2..e38403cd010c 100644
--- a/net/Kconfig
+++ b/net/Kconfig
@@ -102,12 +102,12 @@ config NET_PTP_CLASSIFY
 	def_bool n
 
 config NETWORK_PHY_TIMESTAMPING
-	bool "Timestamping in PHY devices"
+	bool "Timestamping in PHY and MII bus devices"
 	select NET_PTP_CLASSIFY
 	help
-	  This allows timestamping of network packets by PHYs with
-	  hardware timestamping capabilities. This option adds some
-	  overhead in the transmit and receive paths.
+	  This allows timestamping of network packets by PHYs or other
+	  MII bus devices with hardware timestamping capabilities. This
+	  option adds some overhead in the transmit and receive paths.
 
 	  If you are unsure how to answer this question, answer N.
 
diff --git a/net/core/ethtool.c b/net/core/ethtool.c
index b4b81eaa15a9..507e56abecb7 100644
--- a/net/core/ethtool.c
+++ b/net/core/ethtool.c
@@ -2213,13 +2213,12 @@ static int ethtool_get_ts_info(struct net_device *dev, void __user *useraddr)
 	int err = 0;
 	struct ethtool_ts_info info;
 	const struct ethtool_ops *ops = dev->ethtool_ops;
-	struct phy_device *phydev = dev->phydev;
 
 	memset(&info, 0, sizeof(info));
 	info.cmd = ETHTOOL_GET_TS_INFO;
 
-	if (phydev && phydev->mdio.ts_info) {
-		err = phydev->mdio.ts_info(&phydev->mdio, &info);
+	if (dev->mdiots && dev->mdiots->ts_info) {
+		err = dev->mdiots->ts_info(dev->mdiots, &info);
 	} else if (ops->get_ts_info) {
 		err = ops->get_ts_info(dev, &info);
 	} else {
diff --git a/net/core/timestamping.c b/net/core/timestamping.c
index b8857028e652..ecb0ecb03740 100644
--- a/net/core/timestamping.c
+++ b/net/core/timestamping.c
@@ -23,44 +23,32 @@
 #include <linux/skbuff.h>
 #include <linux/export.h>
 
-static unsigned int classify(const struct sk_buff *skb)
-{
-	if (likely(skb->dev && skb->dev->phydev &&
-		   skb->dev->phydev->drv))
-		return ptp_classify_raw(skb);
-	else
-		return PTP_CLASS_NONE;
-}
-
 void skb_clone_tx_timestamp(struct sk_buff *skb)
 {
-	struct phy_device *phydev;
 	struct sk_buff *clone;
 	unsigned int type;
 
-	if (!skb->sk)
+	if (!skb->sk || !skb->dev || !skb->dev->mdiots)
 		return;
 
-	type = classify(skb);
+	type = ptp_classify_raw(skb);
+
 	if (type == PTP_CLASS_NONE)
 		return;
 
-	phydev = skb->dev->phydev;
-	if (likely(phydev->mdio.txtstamp)) {
-		clone = skb_clone_sk(skb);
-		if (!clone)
-			return;
-		phydev->mdio.txtstamp(&phydev->mdio, clone, type);
-	}
+	clone = skb_clone_sk(skb);
+	if (!clone)
+		return;
+
+	skb->dev->mdiots->txtstamp(skb->dev->mdiots, clone, type);
 }
 EXPORT_SYMBOL_GPL(skb_clone_tx_timestamp);
 
 bool skb_defer_rx_timestamp(struct sk_buff *skb)
 {
-	struct phy_device *phydev;
 	unsigned int type;
 
-	if (!skb->dev || !skb->dev->phydev || !skb->dev->phydev->drv)
+	if (!skb->dev || !skb->dev->mdiots)
 		return false;
 
 	if (skb_headroom(skb) < ETH_HLEN)
@@ -75,10 +63,6 @@ bool skb_defer_rx_timestamp(struct sk_buff *skb)
 	if (type == PTP_CLASS_NONE)
 		return false;
 
-	phydev = skb->dev->phydev;
-	if (likely(phydev->mdio.rxtstamp))
-		return phydev->mdio.rxtstamp(&phydev->mdio, skb, type);
-
-	return false;
+	return skb->dev->mdiots->rxtstamp(skb->dev->mdiots, skb, type);
 }
 EXPORT_SYMBOL_GPL(skb_defer_rx_timestamp);
-- 
2.11.0
