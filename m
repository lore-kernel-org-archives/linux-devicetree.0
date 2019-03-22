From: Christian Lamparter <chunkeey@gmail.com>
Subject: [PATCH v4 3/4] net: dsa: qca8k: remove leftover phy accessors
Date: Fri, 22 Mar 2019 01:05:02 +0100
Message-ID: <20190322000503.22431-3-chunkeey@gmail.com>
References: <20190322000503.22431-1-chunkeey@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190322000503.22431-1-chunkeey@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Behun <marek.behun@nic.cz>
List-Id: devicetree@vger.kernel.org

This belated patch implements Andrew Lunn's request of
"remove the phy_read() and phy_write() functions."
<https://lore.kernel.org/patchwork/comment/902734/>

While seemingly harmless, this causes the switch's user
port PHYs to get registered twice. This is because the
DSA subsystem will create a slave mdio-bus not knowing
that the qca8k_phy_(read|write) accessors operate on
the external mdio-bus. So the same "bus" gets effectively
duplicated.

Cc: stable@vger.kernel.org
Fixes: 6b93fb46480a ("net-next: dsa: add new driver for qca8xxx family")
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
This (standalone) patch should be much easier to backport than
the big one.
---
 drivers/net/dsa/qca8k.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/net/dsa/qca8k.c b/drivers/net/dsa/qca8k.c
index 576b37d12a63..14ad78225f07 100644
--- a/drivers/net/dsa/qca8k.c
+++ b/drivers/net/dsa/qca8k.c
@@ -624,22 +624,6 @@ qca8k_adjust_link(struct dsa_switch *ds, int port, struct phy_device *phy)
 	qca8k_port_set_status(priv, port, 1);
 }
 
-static int
-qca8k_phy_read(struct dsa_switch *ds, int phy, int regnum)
-{
-	struct qca8k_priv *priv = (struct qca8k_priv *)ds->priv;
-
-	return mdiobus_read(priv->bus, phy, regnum);
-}
-
-static int
-qca8k_phy_write(struct dsa_switch *ds, int phy, int regnum, u16 val)
-{
-	struct qca8k_priv *priv = (struct qca8k_priv *)ds->priv;
-
-	return mdiobus_write(priv->bus, phy, regnum, val);
-}
-
 static void
 qca8k_get_strings(struct dsa_switch *ds, int port, u32 stringset, uint8_t *data)
 {
@@ -879,8 +863,6 @@ static const struct dsa_switch_ops qca8k_switch_ops = {
 	.setup			= qca8k_setup,
 	.adjust_link            = qca8k_adjust_link,
 	.get_strings		= qca8k_get_strings,
-	.phy_read		= qca8k_phy_read,
-	.phy_write		= qca8k_phy_write,
 	.get_ethtool_stats	= qca8k_get_ethtool_stats,
 	.get_sset_count		= qca8k_get_sset_count,
 	.get_mac_eee		= qca8k_get_mac_eee,
-- 
2.20.1
