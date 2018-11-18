From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 4/7] net: phy: icplus: use the BIT macro where possible
Date: Sun, 18 Nov 2018 22:23:56 +0100
Message-ID: <20181118212359.32414-5-martin.blumenstingl@googlemail.com>
References: <20181118212359.32414-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181118212359.32414-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, andrew@lunn.ch, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

This makes the code consistent by using the BIT() macro instead of
manual bit-shifting for some of the fields. No functional changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/icplus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/icplus.c b/drivers/net/phy/icplus.c
index 3d3e9134c762..3ec470adde3d 100644
--- a/drivers/net/phy/icplus.c
+++ b/drivers/net/phy/icplus.c
@@ -36,11 +36,11 @@ MODULE_LICENSE("GPL");
 
 /* IP101A/G - IP1001 */
 #define IP10XX_SPEC_CTRL_STATUS		16	/* Spec. Control Register */
-#define IP1001_RXPHASE_SEL		(1<<0)	/* Add delay on RX_CLK */
-#define IP1001_TXPHASE_SEL		(1<<1)	/* Add delay on TX_CLK */
+#define IP1001_RXPHASE_SEL		BIT(0)	/* Add delay on RX_CLK */
+#define IP1001_TXPHASE_SEL		BIT(1)	/* Add delay on TX_CLK */
 #define IP1001_SPEC_CTRL_STATUS_2	20	/* IP1001 Spec. Control Reg 2 */
 #define IP1001_APS_ON			11	/* IP1001 APS Mode  bit */
-#define IP101A_G_APS_ON			2	/* IP101A/G APS Mode bit */
+#define IP101A_G_APS_ON			BIT(1)	/* IP101A/G APS Mode bit */
 #define IP101A_G_IRQ_CONF_STATUS	0x11	/* Conf Info IRQ & Status Reg */
 #define	IP101A_G_IRQ_PIN_USED		BIT(15) /* INTR pin used */
 #define	IP101A_G_NO_IRQ			BIT(11) /* IRQ's inactive */
-- 
2.19.1
