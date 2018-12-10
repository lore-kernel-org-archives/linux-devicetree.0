From: Marek Vasut <marex@denx.de>
Subject: [PATCH V2 RESEND 2/2] net: dsa: ksz: Add reset GPIO handling
Date: Mon, 10 Dec 2018 14:43:06 +0100
Message-ID: <20181210134306.8786-3-marex@denx.de>
References: <20181210134306.8786-1-marex@denx.de>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181210134306.8786-1-marex@denx.de>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, andrew@lunn.ch, Woojung.Huh@microchip.com, UNGLinuxDriver@microchip.com, devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>, Woojung Huh <woojung.huh@microchip.com>, "David S . Miller" <davem@davemloft.net>, Tristram Ha <Tristram.Ha@microchip.com>
List-Id: devicetree@vger.kernel.org

Add code to handle optional reset GPIO in the KSZ switch driver. The switch
has a reset GPIO line which can be controlled by the CPU, so make sure it is
configured correctly in such setups.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: Woojung Huh <woojung.huh@microchip.com>
Cc: David S. Miller <davem@davemloft.net>
Cc: Tristram Ha <Tristram.Ha@microchip.com>
---
V2: Switch to devm_gpiod_get_optional()
---
 drivers/net/dsa/microchip/ksz_common.c | 17 +++++++++++++++++
 drivers/net/dsa/microchip/ksz_priv.h   |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/drivers/net/dsa/microchip/ksz_common.c b/drivers/net/dsa/microchip/ksz_common.c
index 9705808c3af7a..3b12e2dcff31b 100644
--- a/drivers/net/dsa/microchip/ksz_common.c
+++ b/drivers/net/dsa/microchip/ksz_common.c
@@ -8,12 +8,14 @@
 #include <linux/delay.h>
 #include <linux/export.h>
 #include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_data/microchip-ksz.h>
 #include <linux/phy.h>
 #include <linux/etherdevice.h>
 #include <linux/if_bridge.h>
+#include <linux/of_gpio.h>
 #include <linux/of_net.h>
 #include <net/dsa.h>
 #include <net/switchdev.h>
@@ -294,6 +296,17 @@ int ksz_switch_register(struct ksz_device *dev,
 	if (dev->pdata)
 		dev->chip_id = dev->pdata->chip_id;
 
+	dev->reset_gpio = devm_gpiod_get_optional(dev->dev, "reset",
+						  GPIOD_OUT_LOW);
+	if (IS_ERR(dev->reset_gpio))
+		return PTR_ERR(dev->reset_gpio);
+
+	if (dev->reset_gpio) {
+		gpiod_set_value(dev->reset_gpio, 1);
+		mdelay(10);
+		gpiod_set_value(dev->reset_gpio, 0);
+	}
+
 	mutex_init(&dev->reg_mutex);
 	mutex_init(&dev->stats_mutex);
 	mutex_init(&dev->alu_mutex);
@@ -329,6 +342,10 @@ void ksz_switch_remove(struct ksz_device *dev)
 {
 	dev->dev_ops->exit(dev);
 	dsa_unregister_switch(dev->ds);
+
+	if (dev->reset_gpio)
+		gpiod_set_value(dev->reset_gpio, 1);
+
 }
 EXPORT_SYMBOL(ksz_switch_remove);
 
diff --git a/drivers/net/dsa/microchip/ksz_priv.h b/drivers/net/dsa/microchip/ksz_priv.h
index a38ff0841ed4e..60b49010904bf 100644
--- a/drivers/net/dsa/microchip/ksz_priv.h
+++ b/drivers/net/dsa/microchip/ksz_priv.h
@@ -59,6 +59,8 @@ struct ksz_device {
 
 	void *priv;
 
+	struct gpio_desc *reset_gpio;	/* Optional reset GPIO */
+
 	/* chip specific data */
 	u32 chip_id;
 	int num_vlans;
-- 
2.18.0
