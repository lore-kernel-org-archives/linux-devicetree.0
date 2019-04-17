From: David Bauer <mail@david-bauer.net>
Subject: [PATCH v3 2/3] net: phy: add support for reset-controller
Date: Wed, 17 Apr 2019 23:59:21 +0200
Message-ID: <20190417215922.30472-3-mail@david-bauer.net>
References: <20190417215922.30472-1-mail@david-bauer.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190417215922.30472-1-mail@david-bauer.net>
Sender: netdev-owner@vger.kernel.org
To: devicetree@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This commit adds support for PHY reset pins handled by a reset controller.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/net/phy/mdio_bus.c    | 27 +++++++++++++++++++++++++--
 drivers/net/phy/mdio_device.c | 13 +++++++++++--
 include/linux/mdio.h          |  1 +
 3 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index 4be4cc09eb90..ba3d2523808b 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -24,6 +24,7 @@
 #include <linux/of_gpio.h>
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
+#include <linux/reset.h>
 #include <linux/skbuff.h>
 #include <linux/spinlock.h>
 #include <linux/mm.h>
@@ -57,8 +58,23 @@ static int mdiobus_register_gpiod(struct mdio_device *mdiodev)
 
 	mdiodev->reset = gpiod;
 
-	/* Assert the reset signal again */
-	mdio_device_reset(mdiodev, 1);
+	return 0;
+}
+
+static int mdiobus_register_reset(struct mdio_device *mdiodev)
+{
+	struct reset_control *reset = NULL;
+
+	if (mdiodev->dev.of_node)
+		reset = devm_reset_control_get_exclusive(&mdiodev->dev,
+							 "phy");
+	if (PTR_ERR(reset) == -ENOENT ||
+	    PTR_ERR(reset) == -ENOTSUPP)
+		reset = NULL;
+	else if (IS_ERR(reset))
+		return PTR_ERR(reset);
+
+	mdiodev->reset_ctrl = reset;
 
 	return 0;
 }
@@ -74,6 +90,13 @@ int mdiobus_register_device(struct mdio_device *mdiodev)
 		err = mdiobus_register_gpiod(mdiodev);
 		if (err)
 			return err;
+
+		err = mdiobus_register_reset(mdiodev);
+		if (err)
+			return err;
+
+		/* Assert the reset signal */
+		mdio_device_reset(mdiodev, 1);
 	}
 
 	mdiodev->bus->mdio_map[mdiodev->addr] = mdiodev;
diff --git a/drivers/net/phy/mdio_device.c b/drivers/net/phy/mdio_device.c
index 887076292e50..57668e0f9256 100644
--- a/drivers/net/phy/mdio_device.c
+++ b/drivers/net/phy/mdio_device.c
@@ -16,6 +16,7 @@
 #include <linux/mii.h>
 #include <linux/module.h>
 #include <linux/phy.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/unistd.h>
@@ -116,10 +117,18 @@ void mdio_device_reset(struct mdio_device *mdiodev, int value)
 {
 	unsigned int d;
 
-	if (!mdiodev->reset)
+	if (!mdiodev->reset && !mdiodev->reset_ctrl)
 		return;
 
-	gpiod_set_value(mdiodev->reset, value);
+	if (mdiodev->reset)
+		gpiod_set_value(mdiodev->reset, value);
+
+	if (mdiodev->reset_ctrl) {
+		if (value)
+			reset_control_assert(mdiodev->reset_ctrl);
+		else
+			reset_control_deassert(mdiodev->reset_ctrl);
+	}
 
 	d = value ? mdiodev->reset_assert_delay : mdiodev->reset_deassert_delay;
 	if (d)
diff --git a/include/linux/mdio.h b/include/linux/mdio.h
index 3e99ae3ed87f..6eaf71500ef6 100644
--- a/include/linux/mdio.h
+++ b/include/linux/mdio.h
@@ -40,6 +40,7 @@ struct mdio_device {
 	int addr;
 	int flags;
 	struct gpio_desc *reset;
+	struct reset_control *reset_ctrl;
 	unsigned int reset_assert_delay;
 	unsigned int reset_deassert_delay;
 };
-- 
2.21.0
