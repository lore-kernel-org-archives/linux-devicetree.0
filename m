From: "=?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?=" <vokac.m@gmail.com>
Subject: [PATCH net-next v2 5/7] net: dsa: qca8k: Allow overwriting CPU port setting
Date: Tue, 22 May 2018 13:16:30 +0200
Message-ID: <1526987792-56861-6-git-send-email-michal.vokac@ysoft.com>
References: <1526987792-56861-1-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526987792-56861-1-git-send-email-michal.vokac@ysoft.com>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, andrew@lunn.ch, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net, michal.vokac@ysoft.com
List-Id: devicetree@vger.kernel.org

Implement adjust_link function that allows to overwrite default CPU port
setting using fixed-link device tree subnode.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes in v2:
 - Add "Reviewed-by" tags from Andrew and Florian.

 drivers/net/dsa/qca8k.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 drivers/net/dsa/qca8k.h |  1 +
 2 files changed, 44 insertions(+)

diff --git a/drivers/net/dsa/qca8k.c b/drivers/net/dsa/qca8k.c
index 14a108b38..7eba987 100644
--- a/drivers/net/dsa/qca8k.c
+++ b/drivers/net/dsa/qca8k.c
@@ -636,6 +636,47 @@ qca8k_setup(struct dsa_switch *ds)
 	return 0;
 }
 
+static void
+qca8k_adjust_link(struct dsa_switch *ds, int port, struct phy_device *phy)
+{
+	struct qca8k_priv *priv = ds->priv;
+	u32 reg;
+
+	/* Force fixed-link setting for CPU port, skip others. */
+	if (!phy_is_pseudo_fixed_link(phy))
+		return;
+
+	/* Set port speed */
+	switch (phy->speed) {
+	case 10:
+		reg = QCA8K_PORT_STATUS_SPEED_10;
+		break;
+	case 100:
+		reg = QCA8K_PORT_STATUS_SPEED_100;
+		break;
+	case 1000:
+		reg = QCA8K_PORT_STATUS_SPEED_1000;
+		break;
+	default:
+		dev_dbg(priv->dev, "port%d link speed %dMbps not supported.\n",
+			port, phy->speed);
+		return;
+	}
+
+	/* Set duplex mode */
+	if (phy->duplex == DUPLEX_FULL)
+		reg |= QCA8K_PORT_STATUS_DUPLEX;
+
+	/* Force flow control */
+	if (dsa_is_cpu_port(ds, port))
+		reg |= QCA8K_PORT_STATUS_RXFLOW | QCA8K_PORT_STATUS_TXFLOW;
+
+	/* Force link down before changing MAC options */
+	qca8k_port_set_status(priv, port, 0);
+	qca8k_write(priv, QCA8K_REG_PORT_STATUS(port), reg);
+	qca8k_port_set_status(priv, port, 1);
+}
+
 static int
 qca8k_phy_read(struct dsa_switch *ds, int phy, int regnum)
 {
@@ -909,6 +950,7 @@ qca8k_get_tag_protocol(struct dsa_switch *ds, int port)
 static const struct dsa_switch_ops qca8k_switch_ops = {
 	.get_tag_protocol	= qca8k_get_tag_protocol,
 	.setup			= qca8k_setup,
+	.adjust_link            = qca8k_adjust_link,
 	.get_strings		= qca8k_get_strings,
 	.phy_read		= qca8k_phy_read,
 	.phy_write		= qca8k_phy_write,
@@ -942,6 +984,7 @@ qca8k_sw_probe(struct mdio_device *mdiodev)
 		return -ENOMEM;
 
 	priv->bus = mdiodev->bus;
+	priv->dev = &mdiodev->dev;
 
 	/* read the switches ID register */
 	id = qca8k_read(priv, QCA8K_REG_MASK_CTRL);
diff --git a/drivers/net/dsa/qca8k.h b/drivers/net/dsa/qca8k.h
index 5bda165..613fe5c5 100644
--- a/drivers/net/dsa/qca8k.h
+++ b/drivers/net/dsa/qca8k.h
@@ -167,6 +167,7 @@ struct qca8k_priv {
 	struct ar8xxx_port_status port_sts[QCA8K_NUM_PORTS];
 	struct dsa_switch *ds;
 	struct mutex reg_mutex;
+	struct device *dev;
 };
 
 struct qca8k_mib_desc {
-- 
2.1.4
