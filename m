From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 6/7] net: phy: icplus: implement .did_interrupt for IP101A/G
Date: Sat, 17 Nov 2018 19:20:06 +0100
Message-ID: <20181117182007.14791-7-martin.blumenstingl@googlemail.com>
References: <20181117182007.14791-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181117182007.14791-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, andrew@lunn.ch, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

The IP101A_G_IRQ_CONF_STATUS register has bits to detect which
interrupts have fired. Implement the .did_interrupt callback to let the
PHY core know whether the interrupt was for this specific PHY.

This is useful for debugging interrupt problems with 32-pin IP101GR PHYs
where the interrupt line is shared with the RX_ERR (receive error
status) signal. The default values are:
- RX_ERR is enabled by default (LOW means that there is no receive
  error)
- the PHY's interrupt line is configured "active low" by default

Without any additional changes there is a flood of interrupts if the
RX_ERR/INTR32 signal is configured in RX_ERR mode (which is the
default). Having a did_interrupt ensures that the PHY core returns
IRQ_NONE instead of endlessly triggering the PHY state machine.
Additionally the kernel will report this after a while:
  irq 28: nobody cared (try booting with the "irqpoll" option)

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/phy/icplus.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/phy/icplus.c b/drivers/net/phy/icplus.c
index c9489ec77cef..3dc8bbbe746b 100644
--- a/drivers/net/phy/icplus.c
+++ b/drivers/net/phy/icplus.c
@@ -44,6 +44,9 @@ MODULE_LICENSE("GPL");
 #define IP101A_G_IRQ_CONF_STATUS	0x11	/* Conf Info IRQ & Status Reg */
 #define	IP101A_G_IRQ_PIN_USED		BIT(15) /* INTR pin used */
 #define IP101A_G_IRQ_ALL_MASK		BIT(11) /* IRQ's inactive */
+#define IP101A_G_IRQ_SPEED_CHANGE	BIT(2)
+#define IP101A_G_IRQ_DUPLEX_CHANGE	BIT(1)
+#define IP101A_G_IRQ_LINK_CHANGE	BIT(0)
 
 static int ip175c_config_init(struct phy_device *phydev)
 {
@@ -209,6 +212,18 @@ static int ip101a_g_config_intr(struct phy_device *phydev)
 	return phy_write(phydev, IP101A_G_IRQ_CONF_STATUS, val);
 }
 
+static int ip101a_g_did_interrupt(struct phy_device *phydev)
+{
+	int val = phy_read(phydev, IP101A_G_IRQ_CONF_STATUS);
+
+	if (val < 0)
+		return 0;
+
+	return val & (IP101A_G_IRQ_SPEED_CHANGE |
+		      IP101A_G_IRQ_DUPLEX_CHANGE |
+		      IP101A_G_IRQ_LINK_CHANGE);
+}
+
 static int ip101a_g_ack_interrupt(struct phy_device *phydev)
 {
 	int err = phy_read(phydev, IP101A_G_IRQ_CONF_STATUS);
@@ -243,6 +258,7 @@ static struct phy_driver icplus_driver[] = {
 	.phy_id_mask	= 0x0ffffff0,
 	.features	= PHY_BASIC_FEATURES,
 	.config_intr	= ip101a_g_config_intr,
+	.did_interrupt	= ip101a_g_did_interrupt,
 	.ack_interrupt	= ip101a_g_ack_interrupt,
 	.config_init	= &ip101a_g_config_init,
 	.suspend	= genphy_suspend,
-- 
2.19.1
