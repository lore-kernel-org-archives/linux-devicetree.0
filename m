From: David Bauer <mail@david-bauer.net>
Subject: [PATCH 3/3] net: mdio: rename mdio_device reset to reset_gpio
Date: Mon, 15 Apr 2019 14:38:40 +0200
Message-ID: <20190415123840.31407-3-mail@david-bauer.net>
References: <20190415123840.31407-1-mail@david-bauer.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190415123840.31407-1-mail@david-bauer.net>
Sender: netdev-owner@vger.kernel.org
To: devicetree@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This renames the GPIO reset of mdio devices from 'reset' to
'reset_gpio' to better differentiate between GPIO and
reset-controller driven reset line.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/net/phy/mdio_bus.c    | 6 +++---
 drivers/net/phy/mdio_device.c | 6 +++---
 include/linux/mdio.h          | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index 7590645f19ef..d1087bd24c83 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -56,7 +56,7 @@ static int mdiobus_register_gpiod(struct mdio_device *mdiodev)
 			return PTR_ERR(gpiod);
 	}
 
-	mdiodev->reset = gpiod;
+	mdiodev->reset_gpio = gpiod;
 
 	/* Assert the reset signal again */
 	mdio_device_reset(mdiodev, 1);
@@ -471,8 +471,8 @@ void mdiobus_unregister(struct mii_bus *bus)
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
