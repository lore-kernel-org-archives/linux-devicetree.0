From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 5/7] net: phy: icplus: rename IP101A_G_NO_IRQ to IP101A_G_IRQ_ALL_MASK
Date: Sat, 17 Nov 2018 19:20:05 +0100
Message-ID: <20181117182007.14791-6-martin.blumenstingl@googlemail.com>
References: <20181117182007.14791-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181117182007.14791-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, andrew@lunn.ch, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

The datasheet uses the name "All Mask" for this bit. Change the name of
our #define to be consistent with the datasheet. While here also replace
the tab between the #define and IP101A_G_IRQ_ALL_MASK with a space.
No functional changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/phy/icplus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/icplus.c b/drivers/net/phy/icplus.c
index 3ec470adde3d..c9489ec77cef 100644
--- a/drivers/net/phy/icplus.c
+++ b/drivers/net/phy/icplus.c
@@ -43,7 +43,7 @@ MODULE_LICENSE("GPL");
 #define IP101A_G_APS_ON			BIT(1)	/* IP101A/G APS Mode bit */
 #define IP101A_G_IRQ_CONF_STATUS	0x11	/* Conf Info IRQ & Status Reg */
 #define	IP101A_G_IRQ_PIN_USED		BIT(15) /* INTR pin used */
-#define	IP101A_G_NO_IRQ			BIT(11) /* IRQ's inactive */
+#define IP101A_G_IRQ_ALL_MASK		BIT(11) /* IRQ's inactive */
 
 static int ip175c_config_init(struct phy_device *phydev)
 {
@@ -204,7 +204,7 @@ static int ip101a_g_config_intr(struct phy_device *phydev)
 		/* INTR pin used: Speed/link/duplex will cause an interrupt */
 		val = IP101A_G_IRQ_PIN_USED;
 	else
-		val = IP101A_G_NO_IRQ;
+		val = IP101A_G_IRQ_ALL_MASK;
 
 	return phy_write(phydev, IP101A_G_IRQ_CONF_STATUS, val);
 }
-- 
2.19.1
