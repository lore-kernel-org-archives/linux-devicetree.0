From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 4/5] usb: usb251xb: Use GPIO descriptor consumer interface
Date: Sat, 16 Sep 2017 02:31:12 +0300
Message-ID: <20170915233113.17855-5-fancer.lancer@gmail.com>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170915233113.17855-1-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.leitner@skidata.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Sergey.Semin@t-platforms.ru, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

The driver used to be developed with legacy GPIO API support. It's
better to use descriptor-based interface for several reasons. First
of all the legacy API doesn't support the ACTIVE_LOW/HIGH flag of dts
nodes, which is essential since different hardware may have different
GPIOs connectivity including the logical value inversion. Secondly,
by requesting the reset GPIO descriptor the driver prevent the other
applications from changing its value. And last but not least the
legacy GPIO interface should be avoided in the new code due to it
obsolescence.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 Documentation/devicetree/bindings/usb/usb251xb.txt |  2 +-
 drivers/usb/misc/usb251xb.c                        | 33 +++++++++-------------
 2 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
index dd59a32e7..7c981d556 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.txt
+++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
@@ -8,10 +8,10 @@ Required properties :
 	"microchip,usb2512b", "microchip,usb2512bi", "microchip,usb2513b",
 	"microchip,usb2513bi", "microchip,usb2514b", "microchip,usb2514bi",
 	"microchip,usb2517", "microchip,usb2517i"
- - reset-gpios : Should specify the gpio for hub reset
  - reg : I2C address on the selected bus (default is <0x2C>)
 
 Optional properties :
+ - reset-gpios : Should specify the gpio for hub reset
  - skip-config : Skip Hub configuration, but only send the USB-Attach command
  - vendor-id : Set USB Vendor ID of the hub (16 bit, default is 0x0424)
  - product-id : Set USB Product ID of the hub (16 bit, default depends on type)
diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index d6a0ff4ec..1d47acd09 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -20,12 +20,11 @@
  */
 
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/nls.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/slab.h>
 
 /* Internal Register Set Addresses & Default Values acc. to DS00001692C */
@@ -127,7 +126,7 @@ struct usb251xb {
 	struct device *dev;
 	struct i2c_client *i2c;
 	u8 skip_config;
-	int gpio_reset;
+	struct gpio_desc *gpio_reset;
 	u16 vendor_id;
 	u16 product_id;
 	u16 device_id;
@@ -235,13 +234,13 @@ static const struct usb251xb_data usb2517i_data = {
 
 static void usb251xb_reset(struct usb251xb *hub, int state)
 {
-	if (!gpio_is_valid(hub->gpio_reset))
+	if (!hub->gpio_reset)
 		return;
 
-	gpio_set_value_cansleep(hub->gpio_reset, state);
+	gpiod_set_value_cansleep(hub->gpio_reset, state);
 
 	/* wait for hub recovery/stabilization */
-	if (state)
+	if (!state)
 		usleep_range(500, 750);	/* >=500us at power on */
 	else
 		usleep_range(1, 10);	/* >=1us at power down */
@@ -260,7 +259,7 @@ static int usb251xb_connect(struct usb251xb *hub)
 		i2c_wb[0] = 0x01;
 		i2c_wb[1] = USB251XB_STATUS_COMMAND_ATTACH;
 
-		usb251xb_reset(hub, 1);
+		usb251xb_reset(hub, 0);
 
 		err = i2c_smbus_write_i2c_block_data(hub->i2c,
 				USB251XB_ADDR_STATUS_COMMAND, 2, i2c_wb);
@@ -310,7 +309,7 @@ static int usb251xb_connect(struct usb251xb *hub)
 	i2c_wb[USB251XB_ADDR_PORT_MAP_7]        = hub->port_map7;
 	i2c_wb[USB251XB_ADDR_STATUS_COMMAND] = USB251XB_STATUS_COMMAND_ATTACH;
 
-	usb251xb_reset(hub, 1);
+	usb251xb_reset(hub, 0);
 
 	/* write registers */
 	for (i = 0; i < (USB251XB_I2C_REG_SZ / USB251XB_I2C_WRITE_SZ); i++) {
@@ -363,19 +362,13 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	else
 		hub->skip_config = 0;
 
-	hub->gpio_reset = of_get_named_gpio(np, "reset-gpios", 0);
-	if (hub->gpio_reset == -EPROBE_DEFER)
+	hub->gpio_reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (PTR_ERR(hub->gpio_reset) == -EPROBE_DEFER) {
 		return -EPROBE_DEFER;
-	if (gpio_is_valid(hub->gpio_reset)) {
-		err = devm_gpio_request_one(dev, hub->gpio_reset,
-					    GPIOF_OUT_INIT_LOW,
-					    "usb251xb reset");
-		if (err) {
-			dev_err(dev,
-				"unable to request GPIO %d as reset pin (%d)\n",
-				hub->gpio_reset, err);
-			return err;
-		}
+	} else if (IS_ERR(hub->gpio_reset)) {
+		err = PTR_ERR(hub->gpio_reset);
+		dev_err(dev, "unable to request GPIO reset pin (%d)\n", err);
+		return err;
 	}
 
 	if (of_property_read_u16_array(np, "vendor-id", &hub->vendor_id, 1))
-- 
2.12.0
