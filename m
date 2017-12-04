From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 1/4] phylib: Add device reset GPIO support
Date: Mon,  4 Dec 2017 11:34:49 +0100
Message-ID: <1512383692-14009-2-git-send-email-geert+renesas@glider.be>
References: <1512383692-14009-1-git-send-email-geert+renesas@glider.be>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1512383692-14009-1-git-send-email-geert+renesas@glider.be>
Sender: netdev-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Richard Leitner <richard.leitner@skidata.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

The PHY devices sometimes do have their reset signal (maybe even power
supply?) tied to some GPIO and sometimes it also does happen that a boot
loader does not leave it deasserted. So far this issue has been attacked
from (as I believe) a wrong angle: by teaching the MAC driver to manipulate
the GPIO in question; that solution, when applied to the device trees, led
to adding the PHY reset GPIO properties to the MAC device node, with one
exception: Cadence MACB driver which could handle the "reset-gpios" prop
in a PHY device subnode. I believe that the correct approach is to teach
the 'phylib' to get the MDIO device reset GPIO from the device tree node
corresponding to this device -- which this patch is doing...

Note that I had to modify the AT803x PHY driver as it would stop working
otherwise -- it made use of the reset GPIO for its own purposes...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Acked-by: Rob Herring <robh@kernel.org>
[geert: Propagate actual errors from fwnode_get_named_gpiod()]
[geert: Avoid destroying initial setup]
[geert: Consolidate GPIO descriptor acquiring code]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - Remove Florian's Acked-by,
  - Add missing #include <linux/gpio/consumer.h>,
  - Re-add the gpiod check, as the dummy gpiod_set_value() for !GPIOLIB
    does not ignore NULL, and calls WARN_ON(1),
  - Do not reassert the reset signal if {mdio,phy}_probe() or
    phy_device_register() succeeded, as that may destroy initial setup,
  - Do not deassert the reset signal in {mdio,phy}_remove(), as it
    should already be deasserted,
  - Bring the PHY back into reset state in phy_device_remove(),
  - Move/consolidate GPIO descriptor acquiring code from
    of_mdiobus_register_phy() and of_mdiobus_register_device() to
    mdiobus_register_device().
    Note that this changes behavior slightly, in that the reset signal
    is now also asserted when called from of_mdiobus_register_device().

v3:
  - Fix fwnode_get_named_gpiod() call due to added parameters (which
    allowed to eliminate the gpiod_direction_output() call),
  - Undelete one blank line in the AT803x driver,
  - Resolve rejects, refresh patch,
  - Reword/reformat changelog,
  - Take over from Sergei,
  - Add Acked-by,
  - Remove unneeded gpiod check, as gpiod_set_value() handles NULL fine,
  - Handle fwnode_get_named_gpiod() errors correctly:
      - -ENOENT is ignored (the GPIO is optional), and turned into NULL,
	which allowed to remove all later !IS_ERR() checks,
      - Other errors (incl. -EPROBE_DEFER) are propagated [*],

v2:
  - Reformat changelog,
  - Resolve rejects, refresh patch.
---
 Documentation/devicetree/bindings/net/phy.txt |  2 ++
 drivers/net/phy/at803x.c                      | 18 +++------------
 drivers/net/phy/mdio_bus.c                    | 21 ++++++++++++++++++
 drivers/net/phy/mdio_device.c                 | 25 +++++++++++++++++++--
 drivers/net/phy/phy_device.c                  | 32 +++++++++++++++++++++++++--
 include/linux/mdio.h                          |  3 +++
 include/linux/phy.h                           |  5 +++++
 7 files changed, 87 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/phy.txt b/Documentation/devicetree/bindings/net/phy.txt
index 77d0b2a61ffa96fc..c05479f5ac7cc837 100644
--- a/Documentation/devicetree/bindings/net/phy.txt
+++ b/Documentation/devicetree/bindings/net/phy.txt
@@ -53,6 +53,8 @@ Optional Properties:
   to ensure the integrated PHY is used. The absence of this property indicates
   the muxers should be configured so that the external PHY is used.
 
+- reset-gpios: The GPIO phandle and specifier for the PHY reset signal.
+
 Example:
 
 ethernet-phy@0 {
diff --git a/drivers/net/phy/at803x.c b/drivers/net/phy/at803x.c
index de7dd6566df7a364..29da7a3c7a3761c0 100644
--- a/drivers/net/phy/at803x.c
+++ b/drivers/net/phy/at803x.c
@@ -71,7 +71,6 @@ MODULE_LICENSE("GPL");
 
 struct at803x_priv {
 	bool phy_reset:1;
-	struct gpio_desc *gpiod_reset;
 };
 
 struct at803x_context {
@@ -254,22 +253,11 @@ static int at803x_probe(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
 	struct at803x_priv *priv;
-	struct gpio_desc *gpiod_reset;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	if (phydev->drv->phy_id != ATH8030_PHY_ID)
-		goto does_not_require_reset_workaround;
-
-	gpiod_reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(gpiod_reset))
-		return PTR_ERR(gpiod_reset);
-
-	priv->gpiod_reset = gpiod_reset;
-
-does_not_require_reset_workaround:
 	phydev->priv = priv;
 
 	return 0;
@@ -343,14 +331,14 @@ static void at803x_link_change_notify(struct phy_device *phydev)
 	 * cannot recover from by software.
 	 */
 	if (phydev->state == PHY_NOLINK) {
-		if (priv->gpiod_reset && !priv->phy_reset) {
+		if (phydev->mdio.reset && !priv->phy_reset) {
 			struct at803x_context context;
 
 			at803x_context_save(phydev, &context);
 
-			gpiod_set_value(priv->gpiod_reset, 1);
+			phy_device_reset(phydev, 1);
 			msleep(1);
-			gpiod_set_value(priv->gpiod_reset, 0);
+			phy_device_reset(phydev, 0);
 			msleep(1);
 
 			at803x_context_restore(phydev, &context);
diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index 2df7b62c1a36811e..c97d55cd6679412e 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -38,6 +38,7 @@
 #include <linux/phy.h>
 #include <linux/io.h>
 #include <linux/uaccess.h>
+#include <linux/gpio/consumer.h>
 
 #include <asm/irq.h>
 
@@ -48,9 +49,26 @@
 
 int mdiobus_register_device(struct mdio_device *mdiodev)
 {
+	struct gpio_desc *gpiod;
+
 	if (mdiodev->bus->mdio_map[mdiodev->addr])
 		return -EBUSY;
 
+	/* Deassert the optional reset signal */
+	if (mdiodev->dev.of_node)
+		gpiod = fwnode_get_named_gpiod(&mdiodev->dev.of_node->fwnode,
+					       "reset-gpios", 0, GPIOD_OUT_LOW,
+					       "PHY reset");
+	if (PTR_ERR(gpiod) == -ENOENT)
+		gpiod = NULL;
+	else if (IS_ERR(gpiod))
+		return PTR_ERR(gpiod);
+
+	mdiodev->reset = gpiod;
+
+	/* Assert the reset signal again */
+	mdio_device_reset(mdiodev, 1);
+
 	mdiodev->bus->mdio_map[mdiodev->addr] = mdiodev;
 
 	return 0;
@@ -420,6 +438,9 @@ void mdiobus_unregister(struct mii_bus *bus)
 		if (!mdiodev)
 			continue;
 
+		if (mdiodev->reset)
+			gpiod_put(mdiodev->reset);
+
 		mdiodev->device_remove(mdiodev);
 		mdiodev->device_free(mdiodev);
 	}
diff --git a/drivers/net/phy/mdio_device.c b/drivers/net/phy/mdio_device.c
index e24f28924af8953d..75d97dd9fb281704 100644
--- a/drivers/net/phy/mdio_device.c
+++ b/drivers/net/phy/mdio_device.c
@@ -12,6 +12,8 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/errno.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -114,6 +116,13 @@ void mdio_device_remove(struct mdio_device *mdiodev)
 }
 EXPORT_SYMBOL(mdio_device_remove);
 
+void mdio_device_reset(struct mdio_device *mdiodev, int value)
+{
+	if (mdiodev->reset)
+		gpiod_set_value(mdiodev->reset, value);
+}
+EXPORT_SYMBOL(mdio_device_reset);
+
 /**
  * mdio_probe - probe an MDIO device
  * @dev: device to probe
@@ -128,8 +137,16 @@ static int mdio_probe(struct device *dev)
 	struct mdio_driver *mdiodrv = to_mdio_driver(drv);
 	int err = 0;
 
-	if (mdiodrv->probe)
+	if (mdiodrv->probe) {
+		/* Deassert the reset signal */
+		mdio_device_reset(mdiodev, 0);
+
 		err = mdiodrv->probe(mdiodev);
+		if (err) {
+			/* Assert the reset signal */
+			mdio_device_reset(mdiodev, 1);
+		}
+	}
 
 	return err;
 }
@@ -140,9 +157,13 @@ static int mdio_remove(struct device *dev)
 	struct device_driver *drv = mdiodev->dev.driver;
 	struct mdio_driver *mdiodrv = to_mdio_driver(drv);
 
-	if (mdiodrv->remove)
+	if (mdiodrv->remove) {
 		mdiodrv->remove(mdiodev);
 
+		/* Assert the reset signal */
+		mdio_device_reset(mdiodev, 1);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 8154fb706751e8ad..1de5e242b8b4cda3 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -632,6 +632,9 @@ int phy_device_register(struct phy_device *phydev)
 	if (err)
 		return err;
 
+	/* Deassert the reset signal */
+	phy_device_reset(phydev, 0);
+
 	/* Run all of the fixups for this PHY */
 	err = phy_scan_fixups(phydev);
 	if (err) {
@@ -650,6 +653,9 @@ int phy_device_register(struct phy_device *phydev)
 	return 0;
 
  out:
+	/* Assert the reset signal */
+	phy_device_reset(phydev, 1);
+
 	mdiobus_unregister_device(&phydev->mdio);
 	return err;
 }
@@ -666,6 +672,10 @@ EXPORT_SYMBOL(phy_device_register);
 void phy_device_remove(struct phy_device *phydev)
 {
 	device_del(&phydev->mdio.dev);
+
+	/* Assert the reset signal */
+	phy_device_reset(phydev, 1);
+
 	mdiobus_unregister_device(&phydev->mdio);
 }
 EXPORT_SYMBOL(phy_device_remove);
@@ -849,6 +859,9 @@ int phy_init_hw(struct phy_device *phydev)
 {
 	int ret = 0;
 
+	/* Deassert the reset signal */
+	phy_device_reset(phydev, 0);
+
 	if (!phydev->drv || !phydev->drv->config_init)
 		return 0;
 
@@ -1126,6 +1139,9 @@ void phy_detach(struct phy_device *phydev)
 	put_device(&phydev->mdio.dev);
 	if (ndev_owner != bus->owner)
 		module_put(bus->owner);
+
+	/* Assert the reset signal */
+	phy_device_reset(phydev, 1);
 }
 EXPORT_SYMBOL(phy_detach);
 
@@ -1811,8 +1827,16 @@ static int phy_probe(struct device *dev)
 	/* Set the state to READY by default */
 	phydev->state = PHY_READY;
 
-	if (phydev->drv->probe)
+	if (phydev->drv->probe) {
+		/* Deassert the reset signal */
+		phy_device_reset(phydev, 0);
+
 		err = phydev->drv->probe(phydev);
+		if (err) {
+			/* Assert the reset signal */
+			phy_device_reset(phydev, 1);
+		}
+	}
 
 	mutex_unlock(&phydev->lock);
 
@@ -1829,8 +1853,12 @@ static int phy_remove(struct device *dev)
 	phydev->state = PHY_DOWN;
 	mutex_unlock(&phydev->lock);
 
-	if (phydev->drv && phydev->drv->remove)
+	if (phydev->drv && phydev->drv->remove) {
 		phydev->drv->remove(phydev);
+
+		/* Assert the reset signal */
+		phy_device_reset(phydev, 1);
+	}
 	phydev->drv = NULL;
 
 	return 0;
diff --git a/include/linux/mdio.h b/include/linux/mdio.h
index ca08ab16ecdc9b78..92d4e55ffe675637 100644
--- a/include/linux/mdio.h
+++ b/include/linux/mdio.h
@@ -12,6 +12,7 @@
 #include <uapi/linux/mdio.h>
 #include <linux/mod_devicetable.h>
 
+struct gpio_desc;
 struct mii_bus;
 
 /* Multiple levels of nesting are possible. However typically this is
@@ -39,6 +40,7 @@ struct mdio_device {
 	/* Bus address of the MDIO device (0-31) */
 	int addr;
 	int flags;
+	struct gpio_desc *reset;
 };
 #define to_mdio_device(d) container_of(d, struct mdio_device, dev)
 
@@ -71,6 +73,7 @@ void mdio_device_free(struct mdio_device *mdiodev);
 struct mdio_device *mdio_device_create(struct mii_bus *bus, int addr);
 int mdio_device_register(struct mdio_device *mdiodev);
 void mdio_device_remove(struct mdio_device *mdiodev);
+void mdio_device_reset(struct mdio_device *mdiodev, int value);
 int mdio_driver_register(struct mdio_driver *drv);
 void mdio_driver_unregister(struct mdio_driver *drv);
 int mdio_device_bus_match(struct device *dev, struct device_driver *drv);
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 4962af37722ac2ea..6106ed915841c97e 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -841,6 +841,11 @@ int phy_aneg_done(struct phy_device *phydev);
 int phy_stop_interrupts(struct phy_device *phydev);
 int phy_restart_aneg(struct phy_device *phydev);
 
+static inline void phy_device_reset(struct phy_device *phydev, int value)
+{
+	mdio_device_reset(&phydev->mdio, value);
+}
+
 #define phydev_err(_phydev, format, args...)	\
 	dev_err(&_phydev->mdio.dev, format, ##args)
 
-- 
2.7.4
