From: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Subject: [RFC PATCH] usb: misc: add USB251xB/xBi Hi-Speed Hub Controller Driver
Date: Thu, 2 Feb 2017 14:44:29 +0100
Message-ID: <1486043069-1575-1-git-send-email-richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds a driver for configuration of the Microchip USB251xB/xBi
USB 2.0 hub controller series with USB 2.0 upstream connectivity, SMBus
configuration interface and two to four USB 2.0 downstream ports.

Furthermore add myself as a maintainer for this driver.

The datasheet can be found at the manufacturers website, see [1]. All
device-tree exposed configuration features have been tested on a i.MX6
platform with a USB2512B hub.

[1] http://ww1.microchip.com/downloads/en/DeviceDoc/00001692C.pdf

Signed-off-by: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/usb251xb.txt |  83 +++
 MAINTAINERS                                        |   8 +
 drivers/usb/misc/Kconfig                           |   9 +
 drivers/usb/misc/Makefile                          |   1 +
 drivers/usb/misc/usb251xb.c                        | 757 +++++++++++++++++++++
 include/linux/platform_data/usb251xb.h             |  33 +
 6 files changed, 891 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/usb251xb.txt
 create mode 100644 drivers/usb/misc/usb251xb.c
 create mode 100644 include/linux/platform_data/usb251xb.h

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
new file mode 100644
index 0000000..9496b06
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
+ - max-sp-power : Specifies the maximum current the hub consumes from an
+	upstream port when operating as self-powered hub EXCLUDING the power
+	consumption of a permanently attached peripheral if the hub is
+	configured as a compound device. The value is given in mA in a 0 - 500
+	range (default is 2).
+ - max-bp-power : Specifies the maximum current the hub consumes from an
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
index 3960e7f..76b003a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8201,6 +8201,14 @@ F:	drivers/media/platform/atmel/atmel-isc.c
 F:	drivers/media/platform/atmel/atmel-isc-regs.h
 F:	devicetree/bindings/media/atmel-isc.txt
 
+MICROCHIP USB251XB DRIVER
+M:	Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
+L:	linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+S:	Maintained
+F:	drivers/usb/misc/usb251xb.c
+F:	include/linux/platform_data/usb251xb.h
+F:	Documentation/devicetree/bindings/usb/usb251xb.txt
+
 MICROSOFT SURFACE PRO 3 BUTTON DRIVER
 M:	Chen Yu <yu.c.chen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
 L:	platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index 47b3577..794184c 100644
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
index 0000000..f9b42c4
--- /dev/null
+++ b/drivers/usb/misc/usb251xb.c
@@ -0,0 +1,757 @@
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
+#include <linux/platform_device.h>
+#include <linux/platform_data/usb251xb.h>
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
+/**
+ * ascii2utf16le() - Helper routine for producing UTF-16LE string descriptors
+ * @s: Null-terminated ASCII (actually ISO-8859-1) string
+ * @buf: Buffer for UTF-16LE string
+ * @len: Length (in bytes; may be odd) of UTF-16LE buffer.
+ *
+ * Return: The number of bytes filled in: 2*strlen(s) or @len, whichever is less
+ *
+ * Note:
+ * The UTF-16LE USB String descriptors can contain at most 31 characters (as
+ * specified in the datasheet); input strings longer than that are truncated.
+ *
+ * Based on ascii2desc from drivers/usb/core/hcd.c
+ */
+static unsigned int ascii2utf16le(char const *s, u8 *buf, unsigned int len)
+{
+	unsigned int n, t = 2 * strlen(s);
+
+	if (t > USB251XB_STRING_BUFSIZE)
+		t = USB251XB_STRING_BUFSIZE;
+	if (len > t)
+		len = t;
+	n = len;
+	while (n--) {
+		t = (unsigned char)*s++;
+		*buf++ = t;
+		if (!n--)
+			break;
+		*buf++ = t >> 8;
+	}
+	return len;
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
+		u32 curr = be32_to_cpu(property_u32) / 2;
+
+		if (curr > 250)
+			curr = 250;
+		hub->max_power_sp = (curr & 0xFF);
+	}
+
+	hub->max_power_bp = USB251XB_DEF_MAX_POWER_BUS;
+	property_u32 = of_get_property(np, "max-bp-power", NULL);
+	if (property_u32) {
+		u32 curr = be32_to_cpu(property_u32) / 2;
+
+		if (curr > 250)
+			curr = 250;
+		hub->max_power_bp = (curr & 0xFF);
+	}
+
+	hub->max_current_sp = USB251XB_DEF_MAX_CURRENT_SELF;
+	property_u32 = of_get_property(np, "max-sp-current", NULL);
+	if (property_u32) {
+		u32 curr = be32_to_cpu(property_u32) / 2;
+
+		if (curr > 250)
+			curr = 250;
+		hub->max_current_sp = (curr & 0xFF);
+	}
+
+	hub->max_current_bp = USB251XB_DEF_MAX_CURRENT_BUS;
+	property_u32 = of_get_property(np, "max-bp-current", NULL);
+	if (property_u32) {
+		u32 curr = be32_to_cpu(property_u32) / 2;
+
+		if (curr > 250)
+			curr = 250;
+		hub->max_current_bp = (curr & 0xFF);
+	}
+
+	hub->power_on_time = USB251XB_DEF_POWER_ON_TIME;
+	property_u32 = of_get_property(np, "power-on-time", NULL);
+	if (property_u32) {
+		u32 curr = be32_to_cpu(property_u32) / 2;
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
+	ascii2utf16le(str, hub->manufacturer, USB251XB_STRING_BUFSIZE);
+
+	property_char = of_get_property(np, "product", NULL);
+	if (property_char)
+		strncpy(str, property_char, sizeof(str));
+	else
+		strncpy(str, data->product_str, sizeof(str));
+	hub->product_len = strlen(str) & 0xFF;
+	memset(hub->product, 0, USB251XB_STRING_BUFSIZE);
+	ascii2utf16le(str, hub->product, USB251XB_STRING_BUFSIZE);
+
+	property_char = of_get_property(np, "serial", NULL);
+	if (property_char)
+		strncpy(str, property_char, sizeof(str));
+	else
+		strncpy(str, USB251XB_DEF_SERIAL_STRING, sizeof(str));
+	hub->serial_len = strlen(str) & 0xFF;
+	memset(hub->serial, 0, USB251XB_STRING_BUFSIZE);
+	ascii2utf16le(str, hub->serial, USB251XB_STRING_BUFSIZE);
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
+			       struct usb251xb_data *data) {
+{ }
+#endif /* CONFIG_OF */
+
+static int usb251xb_probe(struct usb251xb *hub)
+{
+	struct device *dev = hub->dev;
+	struct usb251xb_platform_data *pdata = dev_get_platdata(dev);
+	struct device_node *np = dev->of_node;
+	const struct of_device_id *of_id = of_match_device(usb251xb_of_match,
+							   dev);
+	int err;
+
+	dev_info(dev, DRIVER_DESC " " DRIVER_NAME "\n");
+
+	if (pdata) {
+		hub->gpio_reset		= pdata->gpio_reset;
+		hub->vendor_id		= pdata->vendor_id;
+		hub->product_id		= pdata->product_id;
+		hub->device_id		= pdata->device_id;
+		hub->conf_data1		= pdata->conf_data1;
+		hub->conf_data2		= pdata->conf_data2;
+		hub->conf_data3		= pdata->conf_data3;
+		hub->non_rem_dev	= pdata->non_rem_dev;
+		hub->port_disable_sp	= pdata->port_disable_sp;
+		hub->port_disable_bp	= pdata->port_disable_bp;
+		hub->max_power_sp	= pdata->max_power_sp;
+		hub->max_power_bp	= pdata->max_power_bp;
+		hub->max_current_sp	= pdata->max_current_sp;
+		hub->max_current_bp	= pdata->max_current_bp;
+		hub->power_on_time	= pdata->power_on_time;
+		hub->lang_id		= pdata->lang_id;
+		hub->bat_charge_en	= pdata->bat_charge_en;
+		hub->boost_up		= pdata->boost_up;
+		hub->boost_x		= pdata->boost_x;
+		hub->port_swap		= pdata->port_swap;
+		hub->port_map12		= pdata->port_map12;
+		hub->port_map34		= pdata->port_map34;
+	} else if (np) {
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
+static int usb251xb_platform_probe(struct platform_device *pdev)
+{
+	struct usb251xb *hub;
+
+	hub = devm_kzalloc(&pdev->dev, sizeof(struct usb251xb), GFP_KERNEL);
+	if (!hub)
+		return -ENOMEM;
+	hub->dev = &pdev->dev;
+	platform_set_drvdata(pdev, hub);
+
+	return usb251xb_probe(hub);
+}
+
+static int usb251xb_platform_remove(struct platform_device *pdev)
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
+static struct platform_driver usb251xb_platform_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table = of_match_ptr(usb251xb_of_match),
+	},
+	.probe  = usb251xb_platform_probe,
+	.remove = usb251xb_platform_remove,
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
+	err = platform_driver_register(&usb251xb_platform_driver);
+	if (err) {
+		pr_err(DRIVER_NAME ": Failed to register platform driver %d\n",
+		       err);
+		i2c_del_driver(&usb251xb_i2c_driver);
+		return err;
+	}
+
+	return 0;
+}
+module_init(usb251xb_init);
+
+static void __exit usb251xb_exit(void)
+{
+	platform_driver_unregister(&usb251xb_platform_driver);
+	i2c_del_driver(&usb251xb_i2c_driver);
+}
+module_exit(usb251xb_exit);
+
+MODULE_AUTHOR("Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>");
+MODULE_DESCRIPTION("USB251xB/xBi USB 2.0 Hub Controller Driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/platform_data/usb251xb.h b/include/linux/platform_data/usb251xb.h
new file mode 100644
index 0000000..113fd74
--- /dev/null
+++ b/include/linux/platform_data/usb251xb.h
@@ -0,0 +1,33 @@
+#ifndef __USB251XB_H__
+#define __USB251XB_H__
+
+struct usb251xb_platform_data {
+	int gpio_reset;
+	u16 vendor_id;
+	u16 product_id;
+	u16 device_id;
+	u8 conf_data1;
+	u8 conf_data2;
+	u8 conf_data3;
+	u8 non_rem_dev;
+	u8 port_disable_sp;
+	u8 port_disable_bp;
+	u8 max_power_sp;
+	u8 max_power_bp;
+	u8 max_current_sp;
+	u8 max_current_bp;
+	u8 power_on_time;
+	u16 lang_id;
+	char manufacturer[62];
+	char product[62];
+	char serial[62];
+	u8 bat_charge_en;
+	u8 boost_up;
+	u8 boost_x;
+	u8 port_swap;
+	u8 port_map12;
+	u8 port_map34;
+	u8 status;
+};
+
+#endif
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
