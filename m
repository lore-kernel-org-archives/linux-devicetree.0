From: Arun Parameswaran <arun.parameswaran@broadcom.com>
Subject: [PATCH 3/3] net: phy: Add support for Broadcom Omega internal Combo GPHY
Date: Tue,  7 Aug 2018 10:02:44 -0700
Message-ID: <1533661364-15381-4-git-send-email-arun.parameswaran@broadcom.com>
References: <1533661364-15381-1-git-send-email-arun.parameswaran@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533661364-15381-1-git-send-email-arun.parameswaran@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Arun Parameswaran <arun.parameswaran@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add support for the Broadcom Omega SoC internal Combo Ethernet
GPHY to the bcm7xxx phy driver.

Signed-off-by: Arun Parameswaran <arun.parameswaran@broadcom.com>
---
 drivers/net/phy/bcm7xxx.c | 2 ++
 include/linux/brcmphy.h   | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/net/phy/bcm7xxx.c b/drivers/net/phy/bcm7xxx.c
index 01d2ff2f..b2b6307 100644
--- a/drivers/net/phy/bcm7xxx.c
+++ b/drivers/net/phy/bcm7xxx.c
@@ -229,6 +229,7 @@ static int bcm7xxx_28nm_config_init(struct phy_device *phydev)
 	phy_read(phydev, MII_BMSR);
 
 	switch (rev) {
+	case 0xa0:
 	case 0xb0:
 		ret = bcm7xxx_28nm_b0_afe_config_init(phydev);
 		break;
@@ -659,6 +660,7 @@ static int bcm7xxx_28nm_probe(struct phy_device *phydev)
 	BCM7XXX_28NM_GPHY(PHY_ID_BCM7439, "Broadcom BCM7439"),
 	BCM7XXX_28NM_GPHY(PHY_ID_BCM7439_2, "Broadcom BCM7439 (2)"),
 	BCM7XXX_28NM_GPHY(PHY_ID_BCM7445, "Broadcom BCM7445"),
+	BCM7XXX_28NM_GPHY(PHY_ID_BCM_OMEGA, "Broadcom Omega Combo GPHY"),
 	BCM7XXX_40NM_EPHY(PHY_ID_BCM7346, "Broadcom BCM7346"),
 	BCM7XXX_40NM_EPHY(PHY_ID_BCM7362, "Broadcom BCM7362"),
 	BCM7XXX_40NM_EPHY(PHY_ID_BCM7425, "Broadcom BCM7425"),
diff --git a/include/linux/brcmphy.h b/include/linux/brcmphy.h
index daa9234..949e9af 100644
--- a/include/linux/brcmphy.h
+++ b/include/linux/brcmphy.h
@@ -45,6 +45,7 @@
 #define PHY_ID_BCM7445			0x600d8510
 
 #define PHY_ID_BCM_CYGNUS		0xae025200
+#define PHY_ID_BCM_OMEGA		0xae025100
 
 #define PHY_BCM_OUI_MASK		0xfffffc00
 #define PHY_BCM_OUI_1			0x00206000
-- 
1.9.1
