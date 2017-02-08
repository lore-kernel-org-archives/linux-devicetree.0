From: Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH v4] usb: misc: add USB251xB/xBi Hi-Speed Hub Controller Driver
Date: Wed, 8 Feb 2017 09:52:56 +0100
Message-ID: <1486543976-28006-1-git-send-email-richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, andriy.shevchenko@linux.intel.com, stern@rowland.harvard.edu, dev@g0hl1n.net, Richard Leitner <richard.leitner@skidata.com>
List-Id: devicetree@vger.kernel.org

From: Richard Leitner <dev@g0hl1n.net>

This patch adds a driver for configuration of the Microchip USB251xB/xBi
USB 2.0 hub controller series with USB 2.0 upstream connectivity, SMBus
configuration interface and two to four USB 2.0 downstream ports.

Furthermore add myself as a maintainer for this driver.

The datasheet can be found at the manufacturers website, see [1]. All
device-tree exposed configuration features have been tested on a i.MX6
platform with a USB2512B hub.

[1] http://ww1.microchip.com/downloads/en/DeviceDoc/00001692C.pdf

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
CHANGES v4:
	- use utf8s_to_utf16s() instead of ascii2utf16le()
	- remove ascii2utf16le() in lib/string.c again
	- remove changes in drivers/usb/core/hcd.c again
	  (I will post a separate patch for using utf8s_to_utf16s()
	  in there too)

CHANGES v3:
	- move ascii2utf16le() to lib/string.c and also use it also for
		ascii2desc in drivers/usb/core/hcd.c
	- remove platform data support from usb251xb driver

CHANGES v2:
	- fix max-{b,s}p-current property name
	- add descriptor string handling from platform_data
	- fix non-dt handling
---
 Documentation/devicetree/bindings/usb/usb251xb.txt |  83 +++
 MAINTAINERS                                        |   8 +
 drivers/usb/misc/Kconfig                           |   9 +
 drivers/usb/misc/Makefile                          |   1 +
 drivers/usb/misc/usb251xb.c                        | 674 +++++++++++++++++++++
 5 files changed, 775 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/usb251xb.txt
 create mode 100644 drivers/usb/misc/usb251xb.c

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
new file mode 100644
index 0000000..0c065f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
@@ -0,0 +1,83 @@
+Microchip USB 2.0 Hi-Speed Hub Controller
+
+The device node for the configuration of a Microchip USB251xB/xBi USB 2.0
+Hi-Speed Controller.
+
+Required properties :
+ - compatible : Should be "microchip,usb251xb" or one of the specific types:
+	"microchip,usb2512b", "microchip,usb2512bi", "microchip,usb2513b",
+	"microchip,usb2513bi", "microchip,usb2514b", "microchip,usb2514bi"
+ - hub-reset-gpios : Should specify the gpio for hub reset
+
+Optional properties :
+ - reg : I2C address on the selected bus (default is <0x2C>)
+ - skip-config : Skip Hub configuration, but only send the USB-Attach command
+ - vendor-id : USB Vendor ID of the hub (16 bit, default is 0x0424)
+ - product-id : USB Product ID of the hub (16 bit, default depends on type)
+ - device-id : USB Device ID of the hub (16 bit, default is 0x0bb3)
+ - language-id : USB Language ID (16 bit, default is 0x0000)
+ - manufacturer : USB Manufacturer string (max 31 characters long)
+ - product : USB Product string (max 31 characters long)
+ - serial : USB Serial string (max 31 characters long)
+ - {bus,self}-powered : selects between self- and bus-powered operation (default
+	is self-powered)
+ - disable-hi-speed : disable USB Hi-Speed support
+ - {multi,single}-tt : selects between multi- and single-transaction-translator
+	(default is multi-tt)
+ - disable-eop : disable End of Packet generation in full-speed mode
+ - {ganged,individual}-sensing : select over-current sense type in self-powered
+	mode (default is individual)
+ - {ganged,individual}-port-switching : select port power switching mode
+	(default is individual)
+ - dynamic-power-switching : enable auto-switching from self- to bus-powered
+	operation if the local power source is removed or unavailable
+ - oc-delay-{100us,4ms,8ms,16ms} : set over current timer delay (default is 8ms)
+ - compound-device : indicated the hub is part of a compound device
+ - port-mapping-mode : enable port mapping mode
+ - string-support : enable string descriptor support (required for manufacturer,
+	product and serial string configuration)
+ - non-removable-ports : Should specify the ports which have a non-removable
+	device connected.
+ - sp-disabled-ports : Specifies the ports which will be self-power disabled
+ - bp-disabled-ports : Specifies the ports which will be bus-power disabled
+ - max-sp-power : Specifies the maximum current the hub consumes from an
+	upstream port when operating as self-powered hub including the power
+	consumption of a permanently attached peripheral if the hub is
+	configured as a compound device. The value is given in mA in a 0 - 500
+	range (default is 2).
+ - max-bp-power : Specifies the maximum current the hub consumes from an
+	upstream port when operating as bus-powered hub including the power
+	consumption of a permanently attached peripheral if the hub is
+	configured as a compound device. The value is given in mA in a 0 - 500
+	range (default is 100).
+ - max-sp-current : Specifies the maximum current the hub consumes from an
+	upstream port when operating as self-powered hub EXCLUDING the power
+	consumption of a permanently attached peripheral if the hub is
+	configured as a compound device. The value is given in mA in a 0 - 500
+	range (default is 2).
+ - max-bp-current : Specifies the maximum current the hub consumes from an
+	upstream port when operating as bus-powered hub EXCLUDING the power
+	consumption of a permanently attached peripheral if the hub is
+	configured as a compound device. The value is given in mA in a 0 - 500
+	range (default is 100).
+ - power-on-time : Specifies the time it takes from the time the host initiates
+	the power-on sequence to a port until the port has adequate power. The
+	value is given in ms in a 0 - 510 range (default is 100ms).
+
+Examples:
+	usb2512b@2c {
+		compatible = "microchip,usb2512b";
+		hub-reset-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
+	};
+
+	usb2514b@2c {
+		compatible = "microchip,usb2514b";
+		reg = <0x2c>;
+		reset-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
+		vendor-id = /bits/ 16 <0x0000>;
+		product-id = /bits/ 16 <0x0000>;
+		string-support;
+		manufacturer = "Foo";
+		product = "Foo-Bar";
+		serial = "1234567890A";
+	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 187b961..cd705bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8201,6 +8201,14 @@ F:	drivers/media/platform/atmel/atmel-isc.c
 F:	drivers/media/platform/atmel/atmel-isc-regs.h
 F:	devicetree/bindings/media/atmel-isc.txt
 
+MICROCHIP USB251XB DRIVER
+M:	Richard Leitner <richard.leitner@skidata.com>
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	drivers/usb/misc/usb251xb.c
+F:	include/linux/platform_data/usb251xb.h
+F:	Documentation/devicetree/bindings/usb/usb251xb.txt
+
 MICROSOFT SURFACE PRO 3 BUTTON DRIVER
 M:	Chen Yu <yu.c.chen@intel.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index 47b3577..1d1d70d 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -233,6 +233,15 @@ config USB_EZUSB_FX2
 	  Say Y here if you need EZUSB device support.
 	  (Cypress FX/FX2/FX2LP microcontrollers)
 
+config USB_HUB_USB251XB
+	tristate "USB251XB Hub Controller Configuration Driver"
+	depends on I2C
+	help
+	  This option enables support for configuration via SMBus of the
+	  Microchip USB251xB/xBi USB 2.0 Hub Controller series.
+	  Configuration parameters may be set in devicetree or platform data.
+	  Say Y or M here if you need to configure such a device via SMBus.
+
 config USB_HSIC_USB3503
        tristate "USB3503 HSIC to USB20 Driver"
        depends on I2C
diff --git a/drivers/usb/misc/Makefile b/drivers/usb/misc/Makefile
index 3d19927..f6ac6c9 100644
--- a/drivers/usb/misc/Makefile
+++ b/drivers/usb/misc/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_USB_TRANCEVIBRATOR)	+= trancevibrator.o
 obj-$(CONFIG_USB_USS720)		+= uss720.o
 obj-$(CONFIG_USB_SEVSEG)		+= usbsevseg.o
 obj-$(CONFIG_USB_YUREX)			+= yurex.o
+obj-$(CONFIG_USB_HUB_USB251XB)		+= usb251xb.o
 obj-$(CONFIG_USB_HSIC_USB3503)		+= usb3503.o
 obj-$(CONFIG_USB_HSIC_USB4604)		+= usb4604.o
 obj-$(CONFIG_USB_CHAOSKEY)		+= chaoskey.o
diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
new file mode 100644
index 0000000..a00ba2a
--- /dev/null
+++ b/drivers/usb/misc/usb251xb.c
@@ -0,0 +1,674 @@
+/*
+ * Driver for Microchip USB251xB USB 2.0 Hi-Speed Hub Controller
+ * Configuration via SMBus.
+ *
+ * Copyright (c) 2017 SKIDATA AG
+ *
+ * This work is based on the USB3503 driver by Dongjin Kim and
+ * a not-accepted patch by Fabien Lahoudere, see:
+ * https://patchwork.kernel.org/patch/9257715/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/i2c.h>
+#include <linux/gpio.h>
+#include <linux/delay.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/of_gpio.h>
+#include <linux/of_device.h>
+#include <linux/nls.h>
+
+/* Internal Register Set Addresses & Default Values acc. to DS00001692C */
+#define USB251XB_ADDR_VENDOR_ID_LSB 0x00
+#define USB251XB_ADDR_VENDOR_ID_MSB 0x01
+#define USB251XB_DEF_VENDOR_ID 0x0424
+
+#define USB251XB_ADDR_PRODUCT_ID_LSB 0x02
+#define USB251XB_ADDR_PRODUCT_ID_MSB 0x03
+#define USB251XB_DEF_PRODUCT_ID_12 0x2512 /* USB2512B/12Bi */
+#define USB251XB_DEF_PRODUCT_ID_13 0x2513 /* USB2513B/13Bi */
+#define USB251XB_DEF_PRODUCT_ID_14 0x2514 /* USB2514B/14Bi */
+
+#define USB251XB_ADDR_DEVICE_ID_LSB 0x04
+#define USB251XB_ADDR_DEVICE_ID_MSB 0x05
+#define USB251XB_DEF_DEVICE_ID 0x0BB3
+
+#define USB251XB_ADDR_CONFIG_DATA_1 0x06
+#define USB251XB_DEF_CONFIG_DATA_1 0x9B
+#define USB251XB_ADDR_CONFIG_DATA_2 0x07
+#define USB251XB_DEF_CONFIG_DATA_2 0x20
+#define USB251XB_ADDR_CONFIG_DATA_3 0x08
+#define USB251XB_DEF_CONFIG_DATA_3 0x02
+
+#define USB251XB_ADDR_NON_REMOVABLE_DEVICES 0x09
+#define USB251XB_DEF_NON_REMOVABLE_DEVICES 0x00
+
+#define USB251XB_ADDR_PORT_DISABLE_SELF 0x0A
+#define USB251XB_DEF_PORT_DISABLE_SELF 0x00
+#define USB251XB_ADDR_PORT_DISABLE_BUS 0x0B
+#define USB251XB_DEF_PORT_DISABLE_BUS 0x00
+
+#define USB251XB_ADDR_MAX_POWER_SELF 0x0C
+#define USB251XB_DEF_MAX_POWER_SELF 0x01
+#define USB251XB_ADDR_MAX_POWER_BUS 0x0D
+#define USB251XB_DEF_MAX_POWER_BUS 0x32
+
+#define USB251XB_ADDR_MAX_CURRENT_SELF 0x0E
+#define USB251XB_DEF_MAX_CURRENT_SELF 0x01
+#define USB251XB_ADDR_MAX_CURRENT_BUS 0x0F
+#define USB251XB_DEF_MAX_CURRENT_BUS 0x32
+
+#define USB251XB_ADDR_POWER_ON_TIME 0x10
+#define USB251XB_DEF_POWER_ON_TIME 0x32
+
+#define USB251XB_ADDR_LANGUAGE_ID_HIGH 0x11
+#define USB251XB_ADDR_LANGUAGE_ID_LOW 0x12
+#define USB251XB_DEF_LANGUAGE_ID 0x0000
+
+#define USB251XB_STRING_BUFSIZE 62
+#define USB251XB_ADDR_MANUFACTURER_STRING_LEN 0x13
+#define USB251XB_ADDR_MANUFACTURER_STRING 0x16
+#define USB251XB_DEF_MANUFACTURER_STRING "Microchip"
+
+#define USB251XB_ADDR_PRODUCT_STRING_LEN 0x14
+#define USB251XB_ADDR_PRODUCT_STRING 0x54
+#define USB251XB_DEF_PRODUCT_STRING "USB251xB/xBi"
+
+#define USB251XB_ADDR_SERIAL_STRING_LEN 0x15
+#define USB251XB_ADDR_SERIAL_STRING 0x92
+#define USB251XB_DEF_SERIAL_STRING ""
+
+#define USB251XB_ADDR_BATTERY_CHARGING_ENABLE 0xD0
+#define USB251XB_DEF_BATTERY_CHARGING_ENABLE 0x00
+
+#define USB251XB_ADDR_BOOST_UP 0xF6
+#define USB251XB_DEF_BOOST_UP 0x00
+#define USB251XB_ADDR_BOOST_X 0xF8
+#define USB251XB_DEF_BOOST_X 0x00
+
+#define USB251XB_ADDR_PORT_SWAP 0xFA
+#define USB251XB_DEF_PORT_SWAP 0x00
+
+#define USB251XB_ADDR_PORT_MAP_12 0xFB
+#define USB251XB_DEF_PORT_MAP_12 0x00
+#define USB251XB_ADDR_PORT_MAP_34 0xFC
+#define USB251XB_DEF_PORT_MAP_34 0x00 /* USB2513B/13Bi & USB2514B/14Bi only */
+
+#define USB251XB_ADDR_STATUS_COMMAND 0xFF
+#define USB251XB_STATUS_COMMAND_SMBUS_DOWN 0x04
+#define USB251XB_STATUS_COMMAND_RESET 0x02
+#define USB251XB_STATUS_COMMAND_ATTACH 0x01
+
+#define USB251XB_I2C_REG_SZ 0x100
+#define USB251XB_I2C_WRITE_SZ 0x10
+
+#define DRIVER_NAME "usb251xb"
+#define DRIVER_DESC "Microchip USB 2.0 Hi-Speed Hub Controller"
+#define DRIVER_VERSION "1.0"
+
+struct usb251xb {
+	struct device *dev;
+	struct i2c_client *i2c;
+	u8 skip_config;
+	int gpio_reset;
+	u16 vendor_id;
+	u16 product_id;
+	u16 device_id;
+	u8  conf_data1;
+	u8  conf_data2;
+	u8  conf_data3;
+	u8  non_rem_dev;
+	u8  port_disable_sp;
+	u8  port_disable_bp;
+	u8  max_power_sp;
+	u8  max_power_bp;
+	u8  max_current_sp;
+	u8  max_current_bp;
+	u8  power_on_time;
+	u16 lang_id;
+	u8 manufacturer_len;
+	u8 product_len;
+	u8 serial_len;
+	char manufacturer[USB251XB_STRING_BUFSIZE];
+	char product[USB251XB_STRING_BUFSIZE];
+	char serial[USB251XB_STRING_BUFSIZE];
+	u8  bat_charge_en;
+	u8  boost_up;
+	u8  boost_x;
+	u8  port_swap;
+	u8  port_map12;
+	u8  port_map34;
+	u8  status;
+};
+
+struct usb251xb_data {
+	u16 product_id;
+	char product_str[USB251XB_STRING_BUFSIZE / 2]; /* ASCII string */
+};
+
+static const struct usb251xb_data usb2512b_data = {
+	.product_id = 0x2512,
+	.product_str = "USB2512B",
+};
+
+static const struct usb251xb_data usb2512bi_data = {
+	.product_id = 0x2512,
+	.product_str = "USB2512Bi",
+};
+
+static const struct usb251xb_data usb2513b_data = {
+	.product_id = 0x2513,
+	.product_str = "USB2513B",
+};
+
+static const struct usb251xb_data usb2513bi_data = {
+	.product_id = 0x2513,
+	.product_str = "USB2513Bi",
+};
+
+static const struct usb251xb_data usb2514b_data = {
+	.product_id = 0x2514,
+	.product_str = "USB2514B",
+};
+
+static const struct usb251xb_data usb2514bi_data = {
+	.product_id = 0x2514,
+	.product_str = "USB2514Bi",
+};
+
+static inline void set_bit_in_byte(u8 bit, u8 *val)
+{
+	if (bit < 8)
+		*val |= (1 << bit);
+}
+
+static inline void clr_bit_in_byte(u8 bit, u8 *val)
+{
+	if (bit < 8)
+		*val &= ~(1 << bit);
+}
+
+static void usb251xb_reset(struct usb251xb *hub, int state)
+{
+	if (!gpio_is_valid(hub->gpio_reset))
+		return;
+
+	gpio_set_value_cansleep(hub->gpio_reset, state);
+
+	/* wait for hub recovery/stabilization */
+	if (state)
+		usleep_range(500, 750);	/* >=500us at power on */
+	else
+		usleep_range(1, 10);	/* >=1us at power down */
+}
+
+static int usb251xb_connect(struct usb251xb *hub)
+{
+	struct device *dev = hub->dev;
+	int err, i;
+	char i2c_wb[USB251XB_I2C_REG_SZ];
+
+	memset(i2c_wb, 0, USB251XB_I2C_REG_SZ);
+
+	if (hub->skip_config) {
+		dev_info(dev, "Skip hub configuration, only attach.\n");
+		i2c_wb[0] = 0x01;
+		i2c_wb[1] = USB251XB_STATUS_COMMAND_ATTACH;
+
+		usb251xb_reset(hub, 1);
+
+		err = i2c_smbus_write_i2c_block_data(hub->i2c,
+				USB251XB_ADDR_STATUS_COMMAND, 2, i2c_wb);
+		if (err) {
+			dev_err(dev, "attaching hub failed: %d\n", err);
+			return err;
+		}
+		return 0;
+	}
+
+	i2c_wb[USB251XB_ADDR_VENDOR_ID_MSB]     = (hub->vendor_id >> 8) & 0xFF;
+	i2c_wb[USB251XB_ADDR_VENDOR_ID_LSB]     = hub->vendor_id & 0xFF;
+	i2c_wb[USB251XB_ADDR_PRODUCT_ID_MSB]    = (hub->product_id >> 8) & 0xFF;
+	i2c_wb[USB251XB_ADDR_PRODUCT_ID_LSB]    = hub->product_id & 0xFF;
+	i2c_wb[USB251XB_ADDR_DEVICE_ID_MSB]     = (hub->device_id >> 8) & 0xFF;
+	i2c_wb[USB251XB_ADDR_DEVICE_ID_LSB]     = hub->device_id & 0xFF;
+	i2c_wb[USB251XB_ADDR_CONFIG_DATA_1]     = hub->conf_data1;
+	i2c_wb[USB251XB_ADDR_CONFIG_DATA_2]     = hub->conf_data2;
+	i2c_wb[USB251XB_ADDR_CONFIG_DATA_3]     = hub->conf_data3;
+	i2c_wb[USB251XB_ADDR_NON_REMOVABLE_DEVICES] = hub->non_rem_dev;
+	i2c_wb[USB251XB_ADDR_PORT_DISABLE_SELF] = hub->port_disable_sp;
+	i2c_wb[USB251XB_ADDR_PORT_DISABLE_BUS]  = hub->port_disable_bp;
+	i2c_wb[USB251XB_ADDR_MAX_POWER_SELF]    = hub->max_power_sp;
+	i2c_wb[USB251XB_ADDR_MAX_POWER_BUS]     = hub->max_power_bp;
+	i2c_wb[USB251XB_ADDR_MAX_CURRENT_SELF]  = hub->max_current_sp;
+	i2c_wb[USB251XB_ADDR_MAX_CURRENT_BUS]   = hub->max_current_bp;
+	i2c_wb[USB251XB_ADDR_POWER_ON_TIME]     = hub->power_on_time;
+	i2c_wb[USB251XB_ADDR_LANGUAGE_ID_HIGH]  = (hub->lang_id >> 8) & 0xFF;
+	i2c_wb[USB251XB_ADDR_LANGUAGE_ID_LOW]   = hub->lang_id & 0xFF;
+	i2c_wb[USB251XB_ADDR_MANUFACTURER_STRING_LEN] = hub->manufacturer_len;
+	i2c_wb[USB251XB_ADDR_PRODUCT_STRING_LEN]      = hub->product_len;
+	i2c_wb[USB251XB_ADDR_SERIAL_STRING_LEN]       = hub->serial_len;
+	memcpy(&i2c_wb[USB251XB_ADDR_MANUFACTURER_STRING], hub->manufacturer,
+	       USB251XB_STRING_BUFSIZE);
+	memcpy(&i2c_wb[USB251XB_ADDR_SERIAL_STRING], hub->serial,
+	       USB251XB_STRING_BUFSIZE);
+	memcpy(&i2c_wb[USB251XB_ADDR_PRODUCT_STRING], hub->product,
+	       USB251XB_STRING_BUFSIZE);
+	i2c_wb[USB251XB_ADDR_BATTERY_CHARGING_ENABLE] = hub->bat_charge_en;
+	i2c_wb[USB251XB_ADDR_BOOST_UP]          = hub->boost_up;
+	i2c_wb[USB251XB_ADDR_BOOST_X]           = hub->boost_x;
+	i2c_wb[USB251XB_ADDR_PORT_SWAP]         = hub->port_swap;
+	i2c_wb[USB251XB_ADDR_PORT_MAP_12]       = hub->port_map12;
+	i2c_wb[USB251XB_ADDR_PORT_MAP_34]       = hub->port_map34;
+	i2c_wb[USB251XB_ADDR_STATUS_COMMAND] = USB251XB_STATUS_COMMAND_ATTACH;
+
+	usb251xb_reset(hub, 1);
+
+	/* write registers */
+	for (i = 0; i < (USB251XB_I2C_REG_SZ / USB251XB_I2C_WRITE_SZ); i++) {
+		int offset = i * USB251XB_I2C_WRITE_SZ;
+		char wbuf[USB251XB_I2C_WRITE_SZ + 1];
+
+		/* the first data byte transferred tells the hub how many data
+		 * bytes will follow (byte count)
+		 */
+		wbuf[0] = USB251XB_I2C_WRITE_SZ;
+		memcpy(&wbuf[1], &i2c_wb[offset], USB251XB_I2C_WRITE_SZ);
+
+		dev_dbg(dev, "writing %d byte block %d to 0x%02X\n",
+			USB251XB_I2C_WRITE_SZ, i, offset);
+
+		err = i2c_smbus_write_i2c_block_data(hub->i2c, offset,
+						     USB251XB_I2C_WRITE_SZ + 1,
+						     wbuf);
+		if (err)
+			goto out_err;
+	}
+
+	dev_info(dev, "Hub configuration was successful.\n");
+	return 0;
+
+out_err:
+	dev_err(dev, "configuring block %d failed: %d\n", i, err);
+	return err;
+}
+
+#ifdef CONFIG_OF
+static int usb251xb_get_ofdata(struct usb251xb *hub,
+			       struct usb251xb_data *data)
+{
+	struct device *dev = hub->dev;
+	struct device_node *np = dev->of_node;
+	int len, err, i;
+	const u32 *property_u32;
+	const char *property_char;
+	char str[USB251XB_STRING_BUFSIZE / 2];
+
+	if (!np) {
+		dev_err(dev, "failed to get ofdata\n");
+		return -ENODEV;
+	}
+
+	if (of_get_property(np, "skip-config", NULL))
+		hub->skip_config = 1;
+	else
+		hub->skip_config = 0;
+
+	hub->gpio_reset = of_get_named_gpio(np, "reset-gpios", 0);
+	if (hub->gpio_reset == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+	if (gpio_is_valid(hub->gpio_reset)) {
+		err = devm_gpio_request_one(dev, hub->gpio_reset,
+					    GPIOF_OUT_INIT_LOW,
+					    "usb251xb reset");
+		if (err) {
+			dev_err(dev,
+				"unable to request GPIO %d as reset pin (%d)\n",
+				hub->gpio_reset, err);
+			return err;
+		}
+	}
+
+	if (of_property_read_u16_array(np, "vendor-id", &hub->vendor_id, 1))
+		hub->vendor_id = USB251XB_DEF_VENDOR_ID;
+
+	if (of_property_read_u16_array(np, "product-id",
+				       &hub->product_id, 1))
+		hub->product_id = data->product_id;
+
+	if (of_property_read_u16_array(np, "device-id", &hub->device_id, 1))
+		hub->device_id = USB251XB_DEF_DEVICE_ID;
+
+	hub->conf_data1 = USB251XB_DEF_CONFIG_DATA_1;
+	if (of_get_property(np, "self-powered", NULL)) {
+		set_bit_in_byte(7, &hub->conf_data1);
+
+		/* Configure Over-Current sens when self-powered */
+		clr_bit_in_byte(2, &hub->conf_data1);
+		if (of_get_property(np, "ganged-sensing", NULL))
+			clr_bit_in_byte(1, &hub->conf_data1);
+		else if (of_get_property(np, "individual-sensing", NULL))
+			set_bit_in_byte(1, &hub->conf_data1);
+	} else if (of_get_property(np, "bus-powered", NULL)) {
+		clr_bit_in_byte(7, &hub->conf_data1);
+
+		/* Disable Over-Current sense when bus-powered */
+		set_bit_in_byte(2, &hub->conf_data1);
+	}
+
+	if (of_get_property(np, "disable-hi-speed", NULL))
+		set_bit_in_byte(5, &hub->conf_data1);
+
+	if (of_get_property(np, "multi-tt", NULL))
+		set_bit_in_byte(4, &hub->conf_data1);
+	else if (of_get_property(np, "single-tt", NULL))
+		clr_bit_in_byte(4, &hub->conf_data1);
+
+	if (of_get_property(np, "disable-eop", NULL))
+		set_bit_in_byte(3, &hub->conf_data1);
+
+	if (of_get_property(np, "individual-port-switching", NULL))
+		set_bit_in_byte(0, &hub->conf_data1);
+	else if (of_get_property(np, "ganged-port-switching", NULL))
+		clr_bit_in_byte(0, &hub->conf_data1);
+
+	hub->conf_data2 = USB251XB_DEF_CONFIG_DATA_2;
+	if (of_get_property(np, "dynamic-power-switching", NULL))
+		set_bit_in_byte(7, &hub->conf_data2);
+
+	if (of_get_property(np, "oc-delay-100us", NULL)) {
+		clr_bit_in_byte(5, &hub->conf_data2);
+		clr_bit_in_byte(4, &hub->conf_data2);
+	} else if (of_get_property(np, "oc-delay-4ms", NULL)) {
+		clr_bit_in_byte(5, &hub->conf_data2);
+		set_bit_in_byte(4, &hub->conf_data2);
+	} else if (of_get_property(np, "oc-delay-8ms", NULL)) {
+		set_bit_in_byte(5, &hub->conf_data2);
+		clr_bit_in_byte(4, &hub->conf_data2);
+	} else if (of_get_property(np, "oc-delay-16ms", NULL)) {
+		set_bit_in_byte(5, &hub->conf_data2);
+		set_bit_in_byte(4, &hub->conf_data2);
+	}
+
+	if (of_get_property(np, "compound-device", NULL))
+		set_bit_in_byte(3, &hub->conf_data2);
+
+	hub->conf_data3 = USB251XB_DEF_CONFIG_DATA_3;
+	if (of_get_property(np, "port-mapping-mode", NULL))
+		set_bit_in_byte(3, &hub->conf_data3);
+
+	if (of_get_property(np, "string-support", NULL))
+		set_bit_in_byte(0, &hub->conf_data3);
+
+	hub->non_rem_dev = USB251XB_DEF_NON_REMOVABLE_DEVICES;
+	property_u32 = of_get_property(np, "non-removable-ports", &len);
+	if (property_u32 && (len / sizeof(u32)) > 0) {
+		for (i = 0; i < len / sizeof(u32); i++) {
+			u32 port = be32_to_cpu(property_u32[i]);
+
+			if ((port >= 1) && (port <= 4))
+				set_bit_in_byte(port, &hub->non_rem_dev);
+		}
+	}
+
+	hub->port_disable_sp = USB251XB_DEF_PORT_DISABLE_SELF;
+	property_u32 = of_get_property(np, "sp-disabled-ports", &len);
+	if (property_u32 && (len / sizeof(u32)) > 0) {
+		for (i = 0; i < len / sizeof(u32); i++) {
+			u32 port = be32_to_cpu(property_u32[i]);
+
+			if ((port >= 1) && (port <= 4))
+				set_bit_in_byte(port, &hub->port_disable_sp);
+		}
+	}
+
+	hub->port_disable_bp = USB251XB_DEF_PORT_DISABLE_BUS;
+	property_u32 = of_get_property(np, "bp-disabled-ports", &len);
+	if (property_u32 && (len / sizeof(u32)) > 0) {
+		for (i = 0; i < len / sizeof(u32); i++) {
+			u32 port = be32_to_cpu(property_u32[i]);
+
+			if ((port >= 1) && (port <= 4))
+				set_bit_in_byte(port, &hub->port_disable_bp);
+		}
+	}
+
+	hub->max_power_sp = USB251XB_DEF_MAX_POWER_SELF;
+	property_u32 = of_get_property(np, "max-sp-power", NULL);
+	if (property_u32) {
+		u32 curr = be32_to_cpu(*property_u32) / 2;
+
+		if (curr > 250)
+			curr = 250;
+		hub->max_power_sp = (curr & 0xFF);
+	}
+
+	hub->max_power_bp = USB251XB_DEF_MAX_POWER_BUS;
+	property_u32 = of_get_property(np, "max-bp-power", NULL);
+	if (property_u32) {
+		u32 curr = be32_to_cpu(*property_u32) / 2;
+
+		if (curr > 250)
+			curr = 250;
+		hub->max_power_bp = (curr & 0xFF);
+	}
+
+	hub->max_current_sp = USB251XB_DEF_MAX_CURRENT_SELF;
+	property_u32 = of_get_property(np, "max-sp-current", NULL);
+	if (property_u32) {
+		u32 curr = be32_to_cpu(*property_u32) / 2;
+
+		if (curr > 250)
+			curr = 250;
+		hub->max_current_sp = (curr & 0xFF);
+	}
+
+	hub->max_current_bp = USB251XB_DEF_MAX_CURRENT_BUS;
+	property_u32 = of_get_property(np, "max-bp-current", NULL);
+	if (property_u32) {
+		u32 curr = be32_to_cpu(*property_u32) / 2;
+
+		if (curr > 250)
+			curr = 250;
+		hub->max_current_bp = (curr & 0xFF);
+	}
+
+	hub->power_on_time = USB251XB_DEF_POWER_ON_TIME;
+	property_u32 = of_get_property(np, "power-on-time", NULL);
+	if (property_u32) {
+		u32 curr = be32_to_cpu(*property_u32) / 2;
+
+		if (curr > 255)
+			curr = 255;
+		hub->power_on_time = (curr & 0xFF);
+	}
+
+	if (of_property_read_u16_array(np, "language-id", &hub->lang_id, 1))
+		hub->lang_id = USB251XB_DEF_LANGUAGE_ID;
+
+	property_char = of_get_property(np, "manufacturer", NULL);
+	if (property_char)
+		strncpy(str, property_char, sizeof(str));
+	else
+		strncpy(str, USB251XB_DEF_MANUFACTURER_STRING, sizeof(str));
+	hub->manufacturer_len = strlen(str) & 0xFF;
+	memset(hub->manufacturer, 0, USB251XB_STRING_BUFSIZE);
+	len = min((size_t)USB251XB_STRING_BUFSIZE / 2, strlen(str));
+	len = utf8s_to_utf16s(str, len, UTF16_LITTLE_ENDIAN,
+			      (wchar_t *)hub->manufacturer,
+			      USB251XB_STRING_BUFSIZE);
+
+	property_char = of_get_property(np, "product", NULL);
+	if (property_char)
+		strncpy(str, property_char, sizeof(str));
+	else
+		strncpy(str, data->product_str, sizeof(str));
+	hub->product_len = strlen(str) & 0xFF;
+	memset(hub->product, 0, USB251XB_STRING_BUFSIZE);
+	len = min((size_t)USB251XB_STRING_BUFSIZE / 2, strlen(str));
+	len = utf8s_to_utf16s(str, len, UTF16_LITTLE_ENDIAN,
+			      (wchar_t *)hub->product,
+			      USB251XB_STRING_BUFSIZE);
+
+	property_char = of_get_property(np, "serial", NULL);
+	if (property_char)
+		strncpy(str, property_char, sizeof(str));
+	else
+		strncpy(str, USB251XB_DEF_SERIAL_STRING, sizeof(str));
+	hub->serial_len = strlen(str) & 0xFF;
+	memset(hub->serial, 0, USB251XB_STRING_BUFSIZE);
+	len = min((size_t)USB251XB_STRING_BUFSIZE / 2, strlen(str));
+	len = utf8s_to_utf16s(str, len, UTF16_LITTLE_ENDIAN,
+			      (wchar_t *)hub->serial,
+			      USB251XB_STRING_BUFSIZE);
+
+	/* the following parameters are currently not exposed to devicetree, but
+	 * may be as soon as needed
+	 */
+	hub->bat_charge_en = USB251XB_DEF_BATTERY_CHARGING_ENABLE;
+	hub->boost_up = USB251XB_DEF_BOOST_UP;
+	hub->boost_x = USB251XB_DEF_BOOST_X;
+	hub->port_swap = USB251XB_DEF_PORT_SWAP;
+	hub->port_map12 = USB251XB_DEF_PORT_MAP_12;
+	hub->port_map34 = USB251XB_DEF_PORT_MAP_34;
+
+	return 0;
+}
+
+static const struct of_device_id usb251xb_of_match[] = {
+	{
+		.compatible = "microchip,usb2512b",
+		.data = &usb2512b_data,
+	}, {
+		.compatible = "microchip,usb2512bi",
+		.data = &usb2512bi_data,
+	}, {
+		.compatible = "microchip,usb2513b",
+		.data = &usb2513b_data,
+	}, {
+		.compatible = "microchip,usb2513bi",
+		.data = &usb2513bi_data,
+	}, {
+		.compatible = "microchip,usb2514b",
+		.data = &usb2514b_data,
+	}, {
+		.compatible = "microchip,usb2514bi",
+		.data = &usb2514bi_data,
+	}, {
+		/* sentinel */
+	}
+};
+MODULE_DEVICE_TABLE(of, usb251xb_of_match);
+#else /* CONFIG_OF */
+static int usb251xb_get_ofdata(struct usb251xb *hub,
+			       struct usb251xb_data *data)
+{
+	return 0;
+}
+#endif /* CONFIG_OF */
+
+static int usb251xb_probe(struct usb251xb *hub)
+{
+	struct device *dev = hub->dev;
+	struct device_node *np = dev->of_node;
+	const struct of_device_id *of_id = of_match_device(usb251xb_of_match,
+							   dev);
+	int err;
+
+	dev_info(dev, DRIVER_DESC " " DRIVER_NAME "\n");
+
+	if (np) {
+		err = usb251xb_get_ofdata(hub,
+					  (struct usb251xb_data *)of_id->data);
+		if (err) {
+			dev_err(dev, "failed to get ofdata: %d\n", err);
+			return err;
+		}
+	}
+
+	err = usb251xb_connect(hub);
+	if (err) {
+		dev_err(dev, "Failed to connect " DRIVER_NAME " (%d)\n", err);
+		return err;
+	}
+
+	dev_info(dev, "%s: probed successfully\n", __func__);
+
+	return 0;
+}
+
+static int usb251xb_i2c_probe(struct i2c_client *i2c,
+			      const struct i2c_device_id *id)
+{
+	struct usb251xb *hub;
+
+	hub = devm_kzalloc(&i2c->dev, sizeof(struct usb251xb), GFP_KERNEL);
+	if (!hub)
+		return -ENOMEM;
+
+	i2c_set_clientdata(i2c, hub);
+	hub->dev = &i2c->dev;
+	hub->i2c = i2c;
+
+	return usb251xb_probe(hub);
+}
+
+static int usb251xb_i2c_remove(struct i2c_client *client)
+{
+	return 0;
+}
+
+static const struct i2c_device_id usb251xb_id[] = {
+	{ "usb2512b", 0 },
+	{ "usb2512bi", 0 },
+	{ "usb2513b", 0 },
+	{ "usb2513bi", 0 },
+	{ "usb2514b", 0 },
+	{ "usb2514bi", 0 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, usb251xb_id);
+
+static struct i2c_driver usb251xb_i2c_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table = of_match_ptr(usb251xb_of_match),
+	},
+	.probe    = usb251xb_i2c_probe,
+	.remove   = usb251xb_i2c_remove,
+	.id_table = usb251xb_id,
+};
+
+static int __init usb251xb_init(void)
+{
+	int err;
+
+	err = i2c_add_driver(&usb251xb_i2c_driver);
+	if (err) {
+		pr_err(DRIVER_NAME ": Failed to register I2C driver %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+module_init(usb251xb_init);
+
+static void __exit usb251xb_exit(void)
+{
+	i2c_del_driver(&usb251xb_i2c_driver);
+}
+module_exit(usb251xb_exit);
+
+MODULE_AUTHOR("Richard Leitner <richard.leitner@skidata.com>");
+MODULE_DESCRIPTION("USB251xB/xBi USB 2.0 Hub Controller Driver");
+MODULE_LICENSE("GPL");
-- 
2.1.4
