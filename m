From: David Bauer <mail@david-bauer.net>
Subject: [PATCH v3 3/3] net: mdio: rename mdio_device reset to reset_gpio
Date: Wed, 17 Apr 2019 23:59:22 +0200
Message-ID: <20190417215922.30472-4-mail@david-bauer.net>
References: <20190417215922.30472-1-mail@david-bauer.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190417215922.30472-1-mail@david-bauer.net>
Sender: netdev-owner@vger.kernel.org
To: devicetree@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This renames the GPIO reset of mdio devices from 'reset' to
'reset_gpio' to better differentiate between GPIO and
reset-controller driven reset line.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/net/phy/at803x.c      | 2 +-
 drivers/net/phy/mdio_bus.c    | 6 +++---
 drivers/net/phy/mdio_device.c | 6 +++---
 include/linux/mdio.h          | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/at803x.c b/drivers/net/phy/at803x.c
index f3e96191eb6f..16c5a83e2a60 100644
--- a/drivers/net/phy/at803x.c
+++ b/drivers/net/phy/at803x.c
@@ -334,7 +334,7 @@ static void at803x_link_change_notify(struct phy_device *phydev)
 	 * cannot recover from by software.
 	 */
 	if (phydev->state == PHY_NOLINK) {
-		if (phydev->mdio.reset && !priv->phy_reset) {
+		if (phydev->mdio.reset_gpio && !priv->phy_reset) {
 			struct at803x_context context;
 
 			at803x_context_save(phydev, &context);
diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index ba3d2523808b..bd04fe762056 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -56,7 +56,7 @@ static int mdiobus_register_gpiod(struct mdio_device *mdiodev)
 			return PTR_ERR(gpiod);
 	}
 
-	mdiodev->reset = gpiod;
+	mdiodev->reset_gpio = gpiod;
 
 	return 0;
 }
@@ -469,8 +469,8 @@ void mdiobus_unregister(struct mii_bus *bus)
 		if (!mdiodev)
 			continue;
 
-		if (mdiodev->reset)
-			gpiod_put(mdiodev->reset);
+		if (mdiodev->reset_gpio)
+			gpiod_put(mdiodev->reset_gpio);
 
 		mdiodev->device_remove(mdiodev);
 		mdiodev->device_free(mdiodev);
diff --git a/drivers/net/phy/mdio_device.c b/drivers/net/phy/mdio_device.c
index 57668e0f9256..e282600bd83e 100644
--- a/drivers/net/phy/mdio_device.c
+++ b/drivers/net/phy/mdio_device.c
@@ -117,11 +117,11 @@ void mdio_device_reset(struct mdio_device *mdiodev, int value)
 {
 	unsigned int d;
 
-	if (!mdiodev->reset && !mdiodev->reset_ctrl)
+	if (!mdiodev->reset_gpio && !mdiodev->reset_ctrl)
 		return;
 
-	if (mdiodev->reset)
-		gpiod_set_value(mdiodev->reset, value);
+	if (mdiodev->reset_gpio)
+		gpiod_set_value(mdiodev->reset_gpio, value);
 
 	if (mdiodev->reset_ctrl) {
 		if (value)
diff --git a/include/linux/mdio.h b/include/linux/mdio.h
index 6eaf71500ef6..9dc16d5705a1 100644
--- a/include/linux/mdio.h
+++ b/include/linux/mdio.h
@@ -39,7 +39,7 @@ struct mdio_device {
 	/* Bus address of the MDIO device (0-31) */
 	int addr;
 	int flags;
-	struct gpio_desc *reset;
+	struct gpio_desc *reset_gpio;
 	struct reset_control *reset_ctrl;
 	unsigned int reset_assert_delay;
 	unsigned int reset_deassert_delay;
-- 
2.21.0
