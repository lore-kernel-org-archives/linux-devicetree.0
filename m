From: Christian Lamparter <chunkeey@gmail.com>
Subject: [PATCH v3 3/3] net: dsa: qca8k: extend slave-bus implementations
Date: Tue, 19 Mar 2019 20:54:19 +0100
Message-ID: <20190319195419.12746-3-chunkeey@gmail.com>
References: <20190319195419.12746-1-chunkeey@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190319195419.12746-1-chunkeey@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

This patch implements accessors for the QCA8337 MDIO access
through the MDIO_MASTER register, which makes it possible to
access the PHYs on slave-bus through the switch. In cases
where the switch ports are already mapped via external
"phy-phandles", the internal mdio-bus is disabled in order to
prevent a duplicated discovery and enumeration of the same
PHYs. Don't use mixed external and internal mdio-bus
configurations, as this is not supported by the hardware.

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
Changes from v2:
 - Make it compatible with existing configurations
 - make it clear that's sadly a either external or
   internal mdio bus access.

Changes from v1:
 - drop DT port <-> phy mapping
 - added register definitions for the MDIO control register
 - implemented new slave-mdio bus accessors
 - DT-binding: fix switch's PSEUDO_PHY address. It's 0x10 not 0.

Old patch (+ discussion) for reference:
<https://patchwork.ozlabs.org/patch/1036309/>

Tested on a Compex WPQ864 (IPQ8064 + QCA8337N)
internal bus:
qca8k 37000000.mdio-mii:10 lan1 (uninitialized): PHY [!mdio@37000000!switch@10:01] driver [Generic PHY]
qca8k 37000000.mdio-mii:10 lan2 (uninitialized): PHY [!mdio@37000000!switch@10:02] driver [Generic PHY]
qca8k 37000000.mdio-mii:10 lan3 (uninitialized): PHY [!mdio@37000000!switch@10:03] driver [Generic PHY]
qca8k 37000000.mdio-mii:10 lan4 (uninitialized): PHY [!mdio@37000000!switch@10:04] driver [Generic PHY]
qca8k 37000000.mdio-mii:10 wan (uninitialized): PHY [!mdio@37000000!switch@10:05] driver [Generic PHY]

external bus:
qca8k 37000000.mdio-mii:10 lan1 (uninitialized): PHY [37000000.mdio-mii:00] driver [Generic PHY]
qca8k 37000000.mdio-mii:10 lan2 (uninitialized): PHY [37000000.mdio-mii:01] driver [Generic PHY]
qca8k 37000000.mdio-mii:10 lan3 (uninitialized): PHY [37000000.mdio-mii:02] driver [Generic PHY]
qca8k 37000000.mdio-mii:10 lan4 (uninitialized): PHY [37000000.mdio-mii:03] driver [Generic PHY]
qca8k 37000000.mdio-mii:10 wan (uninitialized): PHY [37000000.mdio-mii:04] driver [Generic PHY]
---
 drivers/net/dsa/qca8k.c | 203 ++++++++++++++++++++++++++++++++++++----
 drivers/net/dsa/qca8k.h |  13 +++
 2 files changed, 197 insertions(+), 19 deletions(-)

diff --git a/drivers/net/dsa/qca8k.c b/drivers/net/dsa/qca8k.c
index 576b37d12a63..26af1036a4ec 100644
--- a/drivers/net/dsa/qca8k.c
+++ b/drivers/net/dsa/qca8k.c
@@ -481,6 +481,184 @@ qca8k_port_set_status(struct qca8k_priv *priv, int port, int enable)
 		qca8k_reg_clear(priv, QCA8K_REG_PORT_STATUS(port), mask);
 }
 
+static int
+qca8k_port_to_phy(int port)
+{
+	if (port < 1 || port > QCA8K_MDIO_MASTER_MAX_PORTS)
+		return -EINVAL;
+
+	return port - 1;
+}
+
+static int
+qca8k_mdio_write(struct qca8k_priv *priv, int port, int regnum, u16 data)
+{
+	u32 val;
+	int phy;
+
+	phy = qca8k_port_to_phy(port);
+	if (phy < 0 || (regnum < 0 || regnum >= QCA8K_MDIO_MASTER_MAX_REG))
+		return -EINVAL;
+
+	val = QCA8K_MDIO_MASTER_BUSY | QCA8K_MDIO_MASTER_EN |
+	      QCA8K_MDIO_MASTER_WRITE | QCA8K_MDIO_MASTER_PHY_ADDR(phy) |
+	      QCA8K_MDIO_MASTER_REG_ADDR(regnum) |
+	      QCA8K_MDIO_MASTER_DATA(data);
+
+	qca8k_write(priv, QCA8K_MDIO_MASTER_CTRL, val);
+
+	return qca8k_busy_wait(priv, QCA8K_MDIO_MASTER_CTRL,
+		QCA8K_MDIO_MASTER_BUSY);
+}
+
+static int
+qca8k_mdio_read(struct qca8k_priv *priv, int port, int regnum)
+{
+	u32 val;
+	int phy;
+
+	phy = qca8k_port_to_phy(port);
+	if (phy < 0 || (regnum < 0 || regnum >= QCA8K_MDIO_MASTER_MAX_REG))
+		return -EINVAL;
+
+	val = QCA8K_MDIO_MASTER_BUSY | QCA8K_MDIO_MASTER_EN |
+	      QCA8K_MDIO_MASTER_READ | QCA8K_MDIO_MASTER_PHY_ADDR(phy) |
+	      QCA8K_MDIO_MASTER_REG_ADDR(regnum);
+
+	qca8k_write(priv, QCA8K_MDIO_MASTER_CTRL, val);
+
+	if (qca8k_busy_wait(priv, QCA8K_MDIO_MASTER_CTRL,
+			    QCA8K_MDIO_MASTER_BUSY)) {
+		return -ETIMEDOUT;
+	}
+
+	val = (qca8k_read(priv, QCA8K_MDIO_MASTER_CTRL) &
+		QCA8K_MDIO_MASTER_DATA_MASK);
+
+	return val;
+}
+
+static int
+qca8k_slave_phy_read(struct mii_bus *bus, int addr, int reg)
+{
+	struct qca8k_priv *priv = bus->priv;
+
+	if (priv->ds->phys_mii_mask & BIT(addr)) {
+		int ret = qca8k_mdio_read(priv, addr, reg);
+
+		if (ret >= 0)
+			return ret;
+	}
+
+	return 0xffff;
+}
+
+static int
+qca8k_slave_phy_write(struct mii_bus *bus, int addr, int reg, u16 val)
+{
+	struct qca8k_priv *priv = bus->priv;
+
+	if (priv->ds->phys_mii_mask & BIT(addr))
+		qca8k_mdio_write(priv, addr, reg, val);
+
+	return 0;
+}
+
+static int
+qca8k_phy_write(struct dsa_switch *ds, int port, int regnum, u16 data)
+{
+	struct qca8k_priv *priv = ds->priv;
+	int ret = -EIO;
+
+	if (ds->slave_mii_bus->phy_mask & BIT(port))
+		ret = qca8k_mdio_write(priv, port, regnum, data);
+
+	return ret;
+}
+
+static int
+qca8k_phy_read(struct dsa_switch *ds, int port, int regnum)
+{
+	struct qca8k_priv *priv = ds->priv;
+	int ret = -EIO;
+
+	if (ds->slave_mii_bus->phy_mask & BIT(port))
+		ret = qca8k_mdio_read(priv, port, regnum);
+
+	return ret;
+}
+
+static int
+qca8k_setup_mdio_bus(struct qca8k_priv *priv)
+{
+	struct device_node *ports, *port;
+	struct mii_bus *bus;
+	u32 internal_mdio_mask = 0;
+	u32 external_mdio_mask = 0;
+	u32 reg;
+	int err;
+
+	ports = of_get_child_by_name(priv->dev->of_node, "ports");
+	if (!ports)
+		return -EINVAL;
+
+	for_each_available_child_of_node(ports, port) {
+		err = of_property_read_u32(port, "reg", &reg);
+		if (err)
+			return err;
+
+		if (dsa_is_user_port(priv->ds, reg)) {
+			if (of_property_read_bool(port, "phy-handle"))
+				external_mdio_mask |= BIT(reg);
+			else
+				internal_mdio_mask |= BIT(reg);
+		}
+	}
+
+	if (!external_mdio_mask && !internal_mdio_mask) {
+		dev_err(priv->dev, "no PHYs are defined.\n");
+		return -EINVAL;
+	}
+
+	/* The QCA8K_MDIO_MASTER_EN Bit, which grants access to PHYs through
+	 * the MDIO_MASTER register also _disconnects_ the external MDC
+	 * passthrough to the internal PHYs. It's not possible to use both
+	 * configurations at the same time!
+	 */
+	if (external_mdio_mask && internal_mdio_mask) {
+		dev_err(priv->dev, "either internal or external mdio bus configuration is supported.\n");
+		return -EINVAL;
+	}
+
+	if (external_mdio_mask) {
+		/* Make sure to disable the internal mdio bus in cases
+		 * a dt-overlay and driver reload changed the configuration
+		 */
+
+		qca8k_reg_clear(priv, QCA8K_MDIO_MASTER_CTRL,
+				QCA8K_MDIO_MASTER_EN);
+		return 0;
+	}
+
+	bus = devm_mdiobus_alloc_size(priv->dev, sizeof(priv));
+	if (!bus)
+		return -ENOMEM;
+	bus->priv = (void *)priv;
+
+	bus->name = priv->dev->of_node->full_name;
+	snprintf(bus->id, MII_BUS_ID_SIZE, "%pOF", priv->dev->of_node);
+
+	bus->read = qca8k_slave_phy_read;
+	bus->write = qca8k_slave_phy_write;
+	bus->parent = priv->dev;
+	bus->phy_mask = ~internal_mdio_mask;
+	priv->ds->slave_mii_bus = bus;
+	priv->ops.phy_read = qca8k_phy_read;
+	priv->ops.phy_write = qca8k_phy_write;
+
+	return mdiobus_register(bus);
+}
+
 static int
 qca8k_setup(struct dsa_switch *ds)
 {
@@ -502,6 +680,10 @@ qca8k_setup(struct dsa_switch *ds)
 	if (IS_ERR(priv->regmap))
 		pr_warn("regmap initialization failed");
 
+	ret = qca8k_setup_mdio_bus(priv);
+	if (ret)
+		return ret;
+
 	/* Initialize CPU port pad mode (xMII type, delays...) */
 	phy_mode = of_get_phy_mode(ds->ports[QCA8K_CPU_PORT].dn);
 	if (phy_mode < 0) {
@@ -624,22 +806,6 @@ qca8k_adjust_link(struct dsa_switch *ds, int port, struct phy_device *phy)
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
@@ -879,8 +1045,6 @@ static const struct dsa_switch_ops qca8k_switch_ops = {
 	.setup			= qca8k_setup,
 	.adjust_link            = qca8k_adjust_link,
 	.get_strings		= qca8k_get_strings,
-	.phy_read		= qca8k_phy_read,
-	.phy_write		= qca8k_phy_write,
 	.get_ethtool_stats	= qca8k_get_ethtool_stats,
 	.get_sset_count		= qca8k_get_sset_count,
 	.get_mac_eee		= qca8k_get_mac_eee,
@@ -923,7 +1087,8 @@ qca8k_sw_probe(struct mdio_device *mdiodev)
 		return -ENOMEM;
 
 	priv->ds->priv = priv;
-	priv->ds->ops = &qca8k_switch_ops;
+	priv->ops = qca8k_switch_ops;
+	priv->ds->ops = &priv->ops;
 	mutex_init(&priv->reg_mutex);
 	dev_set_drvdata(&mdiodev->dev, priv);
 
diff --git a/drivers/net/dsa/qca8k.h b/drivers/net/dsa/qca8k.h
index d146e54c8a6c..249fd62268e5 100644
--- a/drivers/net/dsa/qca8k.h
+++ b/drivers/net/dsa/qca8k.h
@@ -49,6 +49,18 @@
 #define   QCA8K_MIB_FLUSH				BIT(24)
 #define   QCA8K_MIB_CPU_KEEP				BIT(20)
 #define   QCA8K_MIB_BUSY				BIT(17)
+#define QCA8K_MDIO_MASTER_CTRL				0x3c
+#define   QCA8K_MDIO_MASTER_BUSY			BIT(31)
+#define   QCA8K_MDIO_MASTER_EN				BIT(30)
+#define   QCA8K_MDIO_MASTER_READ			BIT(27)
+#define   QCA8K_MDIO_MASTER_WRITE			0
+#define   QCA8K_MDIO_MASTER_SUP_PRE			BIT(26)
+#define   QCA8K_MDIO_MASTER_PHY_ADDR(x)			((x) << 21)
+#define   QCA8K_MDIO_MASTER_REG_ADDR(x)			((x) << 16)
+#define   QCA8K_MDIO_MASTER_DATA(x)			(x)
+#define   QCA8K_MDIO_MASTER_DATA_MASK			GENMASK(15, 0)
+#define   QCA8K_MDIO_MASTER_MAX_PORTS			5
+#define   QCA8K_MDIO_MASTER_MAX_REG			32
 #define QCA8K_GOL_MAC_ADDR0				0x60
 #define QCA8K_GOL_MAC_ADDR1				0x64
 #define QCA8K_REG_PORT_STATUS(_i)			(0x07c + (_i) * 4)
@@ -169,6 +181,7 @@ struct qca8k_priv {
 	struct dsa_switch *ds;
 	struct mutex reg_mutex;
 	struct device *dev;
+	struct dsa_switch_ops ops;
 };
 
 struct qca8k_mib_desc {
-- 
2.20.1
