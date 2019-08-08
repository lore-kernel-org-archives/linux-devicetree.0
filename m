From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v2 02/15] net: phy: adin: hook genphy_read_abilities() to get_features
Date: Thu, 8 Aug 2019 15:30:13 +0300
Message-ID: <20190808123026.17382-3-alexandru.ardelean@analog.com>
References: <20190808123026.17382-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190808123026.17382-1-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com, andrew@lunn.ch, Alexandru Ardelean <alexandru.ardelean@analog.com>
List-Id: devicetree@vger.kernel.org

The ADIN PHYs can operate with Clause 45, however they are not typical for
how phylib considers Clause 45 PHYs.

If the `features` field & the `get_features` hook are unspecified, and the
device wants to operate via Clause 45, it would also try to read features
via the `genphy_c45_pma_read_abilities()`, which will try to read PMA regs
that are unsupported.

Hooking the `genphy_read_abilities()` function to the `get_features` hook
will ensure that this does not happen and the PHY features are read
correctly regardless of Clause 22 or Clause 45 operation.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/net/phy/adin.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index 6d7af4743957..879797d076e0 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -26,6 +26,7 @@ static struct phy_driver adin_driver[] = {
 		.config_init	= adin_config_init,
 		.config_aneg	= genphy_config_aneg,
 		.read_status	= genphy_read_status,
+		.get_features	= genphy_read_abilities,
 	},
 	{
 		PHY_ID_MATCH_MODEL(PHY_ID_ADIN1300),
@@ -33,6 +34,7 @@ static struct phy_driver adin_driver[] = {
 		.config_init	= adin_config_init,
 		.config_aneg	= genphy_config_aneg,
 		.read_status	= genphy_read_status,
+		.get_features	= genphy_read_abilities,
 	},
 };
 
-- 
2.20.1
