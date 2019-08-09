From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v3 13/14] net: phy: adin: add ethtool get_stats support
Date: Fri, 9 Aug 2019 16:35:51 +0300
Message-ID: <20190809133552.21597-14-alexandru.ardelean@analog.com>
References: <20190809133552.21597-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190809133552.21597-1-alexandru.ardelean@analog.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com, andrew@lunn.ch, Alexandru Ardelean <alexandru.ardelean@analog.com>
List-Id: devicetree@vger.kernel.org

This change implements retrieving all the error counters from the PHY.
The PHY supports several error counters/stats. The `Mean Square Errors`
status values are only valie when a link is established, and shouldn't be
accumulated. These values characterize the quality of a signal.

The rest of the error counters are self-clearing on read.
Most of them are reports from the Frame Checker engine that the PHY has.

Not retrieving the `LPI Wake Error Count Register` here, since that is used
by the PHY framework to check for any EEE errors. And that register is
self-clearing when read (as per IEEE spec).

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/net/phy/adin.c | 109 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index fb39104508ff..28424209d9c3 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -154,12 +154,40 @@ static struct adin_clause45_mmd_map adin_clause45_mmd_map[] = {
 	{ MDIO_MMD_PCS, MDIO_PCS_EEE_WK_ERR,	ADIN1300_LPI_WAKE_ERR_CNT_REG },
 };
 
+struct adin_hw_stat {
+	const char *string;
+	u16 reg1;
+	u16 reg2;
+	bool do_not_accumulate;
+};
+
+/* Named just like in the datasheet */
+static struct adin_hw_stat adin_hw_stats[] = {
+	{ "RxErrCnt",		0x0014,	},
+	{ "MseA",		0x8402,	0,	true },
+	{ "MseB",		0x8403,	0,	true },
+	{ "MseC",		0x8404,	0,	true },
+	{ "MseD",		0x8405,	0,	true },
+	{ "FcFrmCnt",		0x940A, 0x940B }, /* FcFrmCntH + FcFrmCntL */
+	{ "FcLenErrCnt",	0x940C },
+	{ "FcAlgnErrCnt",	0x940D },
+	{ "FcSymbErrCnt",	0x940E },
+	{ "FcOszCnt",		0x940F },
+	{ "FcUszCnt",		0x9410 },
+	{ "FcOddCnt",		0x9411 },
+	{ "FcOddPreCnt",	0x9412 },
+	{ "FcDribbleBitsCnt",	0x9413 },
+	{ "FcFalseCarrierCnt",	0x9414 },
+};
+
 /**
  * struct adin_priv - ADIN PHY driver private data
  * edpd_enabled		true if Energy Detect Powerdown mode is enabled
+ * stats		statistic counters for the PHY
  */
 struct adin_priv {
 	bool			edpd_enabled;
+	u64			stats[ARRAY_SIZE(adin_hw_stats)];
 };
 
 static int adin_lookup_reg_value(const struct adin_cfg_reg_map *tbl, int cfg)
@@ -604,6 +632,81 @@ static int adin_reset(struct phy_device *phydev)
 	return adin_subsytem_soft_reset(phydev);
 }
 
+static int adin_get_sset_count(struct phy_device *phydev)
+{
+	return ARRAY_SIZE(adin_hw_stats);
+}
+
+static void adin_get_strings(struct phy_device *phydev, u8 *data)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(adin_hw_stats); i++) {
+		strlcpy(&data[i * ETH_GSTRING_LEN],
+			adin_hw_stats[i].string, ETH_GSTRING_LEN);
+	}
+}
+
+static int adin_read_mmd_stat_regs(struct phy_device *phydev,
+				   struct adin_hw_stat *stat,
+				   u32 *val)
+{
+	int ret;
+
+	ret = phy_read_mmd(phydev, MDIO_MMD_VEND1, stat->reg1);
+	if (ret < 0)
+		return ret;
+
+	*val = (ret & 0xffff);
+
+	if (stat->reg2 == 0)
+		return 0;
+
+	ret = phy_read_mmd(phydev, MDIO_MMD_VEND1, stat->reg2);
+	if (ret < 0)
+		return ret;
+
+	*val <<= 16;
+	*val |= (ret & 0xffff);
+
+	return 0;
+}
+
+static u64 adin_get_stat(struct phy_device *phydev, int i)
+{
+	struct adin_hw_stat *stat = &adin_hw_stats[i];
+	struct adin_priv *priv = phydev->priv;
+	u32 val;
+	int ret;
+
+	if (stat->reg1 > 0x1f) {
+		ret = adin_read_mmd_stat_regs(phydev, stat, &val);
+		if (ret < 0)
+			return (u64)(~0);
+	} else {
+		ret = phy_read(phydev, stat->reg1);
+		if (ret < 0)
+			return (u64)(~0);
+		val = (ret & 0xffff);
+	}
+
+	if (stat->do_not_accumulate)
+		priv->stats[i] = val;
+	else
+		priv->stats[i] += val;
+
+	return priv->stats[i];
+}
+
+static void adin_get_stats(struct phy_device *phydev,
+			   struct ethtool_stats *stats, u64 *data)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(adin_hw_stats); i++)
+		data[i] = adin_get_stat(phydev, i);
+}
+
 static int adin_probe(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
@@ -632,6 +735,9 @@ static struct phy_driver adin_driver[] = {
 		.set_tunable	= adin_set_tunable,
 		.ack_interrupt	= adin_phy_ack_intr,
 		.config_intr	= adin_phy_config_intr,
+		.get_sset_count	= adin_get_sset_count,
+		.get_strings	= adin_get_strings,
+		.get_stats	= adin_get_stats,
 		.resume		= genphy_resume,
 		.suspend	= genphy_suspend,
 		.read_mmd	= adin_read_mmd,
@@ -648,6 +754,9 @@ static struct phy_driver adin_driver[] = {
 		.set_tunable	= adin_set_tunable,
 		.ack_interrupt	= adin_phy_ack_intr,
 		.config_intr	= adin_phy_config_intr,
+		.get_sset_count	= adin_get_sset_count,
+		.get_strings	= adin_get_strings,
+		.get_stats	= adin_get_stats,
 		.resume		= genphy_resume,
 		.suspend	= genphy_suspend,
 		.read_mmd	= adin_read_mmd,
-- 
2.20.1
