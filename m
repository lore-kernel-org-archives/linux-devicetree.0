From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v4] usb: misc: add USB251xB/xBi Hi-Speed Hub Controller
 Driver
Date: Wed, 08 Feb 2017 15:21:08 +0200
Message-ID: <1486560068.2133.395.camel@linux.intel.com>
References: <1486543976-28006-1-git-send-email-richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1486543976-28006-1-git-send-email-richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2017-02-08 at 09:52 +0100, Richard Leitner wrote:
> From: Richard Leitner <dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org>

If you want to fix the above you have to fix your Git configuration.


> This patch adds a driver for configuration of the Microchip
> USB251xB/xBi
> USB 2.0 hub controller series with USB 2.0 upstream connectivity,
> SMBus
> configuration interface and two to four USB 2.0 downstream ports.
> 
> Furthermore add myself as a maintainer for this driver.
> 
> The datasheet can be found at the manufacturers website, see [1]. All
> device-tree exposed configuration features have been tested on a i.MX6
> platform with a USB2512B hub.

> +++ b/drivers/usb/misc/usb251xb.c
> @@ -0,0 +1,674 @@

> +#include <linux/i2c.h>
> +#include <linux/gpio.h>
> +#include <linux/delay.h>
> +#include <linux/slab.h>
> +#include <linux/module.h>
> +#include <linux/of_gpio.h>
> +#include <linux/of_device.h>
> +#include <linux/nls.h>

Alphabetical order?

> +
> +/* Internal Register Set Addresses & Default Values acc. to
> DS00001692C */
> +#define USB251XB_ADDR_VENDOR_ID_LSB 0x00
> +#define USB251XB_ADDR_VENDOR_ID_MSB 0x01
> +#define USB251XB_DEF_VENDOR_ID 0x0424
> +
> +#define USB251XB_ADDR_PRODUCT_ID_LSB 0x02
> +#define USB251XB_ADDR_PRODUCT_ID_MSB 0x03
> +#define USB251XB_DEF_PRODUCT_ID_12 0x2512 /* USB2512B/12Bi */
> +#define USB251XB_DEF_PRODUCT_ID_13 0x2513 /* USB2513B/13Bi */
> +#define USB251XB_DEF_PRODUCT_ID_14 0x2514 /* USB2514B/14Bi */
> +
> +#define USB251XB_ADDR_DEVICE_ID_LSB 0x04
> +#define USB251XB_ADDR_DEVICE_ID_MSB 0x05
> +#define USB251XB_DEF_DEVICE_ID 0x0BB3
> +
> +#define USB251XB_ADDR_CONFIG_DATA_1 0x06
> +#define USB251XB_DEF_CONFIG_DATA_1 0x9B
> +#define USB251XB_ADDR_CONFIG_DATA_2 0x07
> +#define USB251XB_DEF_CONFIG_DATA_2 0x20
> +#define USB251XB_ADDR_CONFIG_DATA_3 0x08
> +#define USB251XB_DEF_CONFIG_DATA_3 0x02
> +
> +#define USB251XB_ADDR_NON_REMOVABLE_DEVICES 0x09
> +#define USB251XB_DEF_NON_REMOVABLE_DEVICES 0x00
> +
> +#define USB251XB_ADDR_PORT_DISABLE_SELF 0x0A
> +#define USB251XB_DEF_PORT_DISABLE_SELF 0x00
> +#define USB251XB_ADDR_PORT_DISABLE_BUS 0x0B
> +#define USB251XB_DEF_PORT_DISABLE_BUS 0x00
> +
> +#define USB251XB_ADDR_MAX_POWER_SELF 0x0C
> +#define USB251XB_DEF_MAX_POWER_SELF 0x01
> +#define USB251XB_ADDR_MAX_POWER_BUS 0x0D
> +#define USB251XB_DEF_MAX_POWER_BUS 0x32
> +
> +#define USB251XB_ADDR_MAX_CURRENT_SELF 0x0E
> +#define USB251XB_DEF_MAX_CURRENT_SELF 0x01
> +#define USB251XB_ADDR_MAX_CURRENT_BUS 0x0F
> +#define USB251XB_DEF_MAX_CURRENT_BUS 0x32
> +
> +#define USB251XB_ADDR_POWER_ON_TIME 0x10
> +#define USB251XB_DEF_POWER_ON_TIME 0x32
> +
> +#define USB251XB_ADDR_LANGUAGE_ID_HIGH 0x11
> +#define USB251XB_ADDR_LANGUAGE_ID_LOW 0x12
> +#define USB251XB_DEF_LANGUAGE_ID 0x0000
> +
> +#define USB251XB_STRING_BUFSIZE 62
> +#define USB251XB_ADDR_MANUFACTURER_STRING_LEN 0x13
> +#define USB251XB_ADDR_MANUFACTURER_STRING 0x16
> +#define USB251XB_DEF_MANUFACTURER_STRING "Microchip"
> +
> +#define USB251XB_ADDR_PRODUCT_STRING_LEN 0x14
> +#define USB251XB_ADDR_PRODUCT_STRING 0x54
> +#define USB251XB_DEF_PRODUCT_STRING "USB251xB/xBi"
> +
> +#define USB251XB_ADDR_SERIAL_STRING_LEN 0x15
> +#define USB251XB_ADDR_SERIAL_STRING 0x92
> +#define USB251XB_DEF_SERIAL_STRING ""
> +
> +#define USB251XB_ADDR_BATTERY_CHARGING_ENABLE 0xD0
> +#define USB251XB_DEF_BATTERY_CHARGING_ENABLE 0x00
> +
> +#define USB251XB_ADDR_BOOST_UP 0xF6
> +#define USB251XB_DEF_BOOST_UP 0x00
> +#define USB251XB_ADDR_BOOST_X 0xF8
> +#define USB251XB_DEF_BOOST_X 0x00
> +
> +#define USB251XB_ADDR_PORT_SWAP 0xFA
> +#define USB251XB_DEF_PORT_SWAP 0x00
> +
> +#define USB251XB_ADDR_PORT_MAP_12 0xFB
> +#define USB251XB_DEF_PORT_MAP_12 0x00
> +#define USB251XB_ADDR_PORT_MAP_34 0xFC
> +#define USB251XB_DEF_PORT_MAP_34 0x00 /* USB2513B/13Bi &
> USB2514B/14Bi only */
> +
> +#define USB251XB_ADDR_STATUS_COMMAND 0xFF
> +#define USB251XB_STATUS_COMMAND_SMBUS_DOWN 0x04
> +#define USB251XB_STATUS_COMMAND_RESET 0x02
> +#define USB251XB_STATUS_COMMAND_ATTACH 0x01
> +
> +#define USB251XB_I2C_REG_SZ 0x100
> +#define USB251XB_I2C_WRITE_SZ 0x10
> +
> +#define DRIVER_NAME "usb251xb"
> +#define DRIVER_DESC "Microchip USB 2.0 Hi-Speed Hub Controller"
> +#define DRIVER_VERSION "1.0"

Is it my MUA, or all above indentations are broken?


> +static inline void set_bit_in_byte(u8 bit, u8 *val)
> +{
> +	if (bit < 8)
> +		*val |= (1 << bit);
> +}
> +
> +static inline void clr_bit_in_byte(u8 bit, u8 *val)
> +{
> +	if (bit < 8)
> +		*val &= ~(1 << bit);
> +}

Above doesn't make much sense. Why not to use

| BIT(bit) 

and

& ~BIT(bit)

in place?

> +static void usb251xb_reset(struct usb251xb *hub, int state)
> +{

> +	if (!gpio_is_valid(hub->gpio_reset))
> +		return;

Is it possible to have it called with no gpio set?

> +
> +	gpio_set_value_cansleep(hub->gpio_reset, state);
> +
> +	/* wait for hub recovery/stabilization */
> +	if (state)
> +		usleep_range(500, 750);	/* >=500us at power on
> */
> +	else
> +		usleep_range(1, 10);	/* >=1us at power down */
> +}
> +

> +		/* the first data byte transferred tells the hub how
> many data
> +		 * bytes will follow (byte count)
> +		 */

I'm not sure this is good formatted comment for USB subsystem.

> +		wbuf[0] = USB251XB_I2C_WRITE_SZ;
> +		memcpy(&wbuf[1], &i2c_wb[offset],
> USB251XB_I2C_WRITE_SZ);
> +
> +		dev_dbg(dev, "writing %d byte block %d to 0x%02X\n",
> +			USB251XB_I2C_WRITE_SZ, i, offset);
> +
> +		err = i2c_smbus_write_i2c_block_data(hub->i2c,
> offset,
> +						     USB251XB_I2C_WRI
> TE_SZ + 1,
> +						     wbuf);
> +		if (err)
> +			goto out_err;
> +	}
> +
> +	dev_info(dev, "Hub configuration was successful.\n");
> +	return 0;
> +
> +out_err:
> +	dev_err(dev, "configuring block %d failed: %d\n", i, err);
> +	return err;
> +}
> +
> +#ifdef CONFIG_OF
> +static int usb251xb_get_ofdata(struct usb251xb *hub,
> +			       struct usb251xb_data *data)
> +{
> +	struct device *dev = hub->dev;
> +	struct device_node *np = dev->of_node;
> +	int len, err, i;
> +	const u32 *property_u32;
> +	const char *property_char;
> +	char str[USB251XB_STRING_BUFSIZE / 2];
> +
> +	if (!np) {
> +		dev_err(dev, "failed to get ofdata\n");
> +		return -ENODEV;
> +	}
> +
> +	if (of_get_property(np, "skip-config", NULL))
> +		hub->skip_config = 1;
> +	else
> +		hub->skip_config = 0;
> +
> +	hub->gpio_reset = of_get_named_gpio(np, "reset-gpios", 0);
> +	if (hub->gpio_reset == -EPROBE_DEFER)
> +		return -EPROBE_DEFER;
> +	if (gpio_is_valid(hub->gpio_reset)) {
> +		err = devm_gpio_request_one(dev, hub->gpio_reset,
> +					    GPIOF_OUT_INIT_LOW,
> +					    "usb251xb reset");
> +		if (err) {
> +			dev_err(dev,
> +				"unable to request GPIO %d as reset
> pin (%d)\n",
> +				hub->gpio_reset, err);
> +			return err;
> +		}
> +	}
> +
> +	if (of_property_read_u16_array(np, "vendor-id", &hub-
> >vendor_id, 1))
> +		hub->vendor_id = USB251XB_DEF_VENDOR_ID;
> +
> +	if (of_property_read_u16_array(np, "product-id",
> +				       &hub->product_id, 1))
> +		hub->product_id = data->product_id;
> +
> +	if (of_property_read_u16_array(np, "device-id", &hub-
> >device_id, 1))
> +		hub->device_id = USB251XB_DEF_DEVICE_ID;
> +
> +	hub->conf_data1 = USB251XB_DEF_CONFIG_DATA_1;
> +	if (of_get_property(np, "self-powered", NULL)) {
> +		set_bit_in_byte(7, &hub->conf_data1);
> +
> +		/* Configure Over-Current sens when self-powered */
> +		clr_bit_in_byte(2, &hub->conf_data1);
> +		if (of_get_property(np, "ganged-sensing", NULL))
> +			clr_bit_in_byte(1, &hub->conf_data1);
> +		else if (of_get_property(np, "individual-sensing",
> NULL))
> +			set_bit_in_byte(1, &hub->conf_data1);
> +	} else if (of_get_property(np, "bus-powered", NULL)) {
> +		clr_bit_in_byte(7, &hub->conf_data1);
> +
> +		/* Disable Over-Current sense when bus-powered */
> +		set_bit_in_byte(2, &hub->conf_data1);
> +	}
> +
> +	if (of_get_property(np, "disable-hi-speed", NULL))
> +		set_bit_in_byte(5, &hub->conf_data1);
> +
> +	if (of_get_property(np, "multi-tt", NULL))
> +		set_bit_in_byte(4, &hub->conf_data1);
> +	else if (of_get_property(np, "single-tt", NULL))
> +		clr_bit_in_byte(4, &hub->conf_data1);
> +
> +	if (of_get_property(np, "disable-eop", NULL))
> +		set_bit_in_byte(3, &hub->conf_data1);
> +
> +	if (of_get_property(np, "individual-port-switching", NULL))
> +		set_bit_in_byte(0, &hub->conf_data1);
> +	else if (of_get_property(np, "ganged-port-switching", NULL))
> +		clr_bit_in_byte(0, &hub->conf_data1);
> +
> +	hub->conf_data2 = USB251XB_DEF_CONFIG_DATA_2;
> +	if (of_get_property(np, "dynamic-power-switching", NULL))
> +		set_bit_in_byte(7, &hub->conf_data2);
> +
> +	if (of_get_property(np, "oc-delay-100us", NULL)) {
> +		clr_bit_in_byte(5, &hub->conf_data2);
> +		clr_bit_in_byte(4, &hub->conf_data2);
> +	} else if (of_get_property(np, "oc-delay-4ms", NULL)) {
> +		clr_bit_in_byte(5, &hub->conf_data2);
> +		set_bit_in_byte(4, &hub->conf_data2);
> +	} else if (of_get_property(np, "oc-delay-8ms", NULL)) {
> +		set_bit_in_byte(5, &hub->conf_data2);
> +		clr_bit_in_byte(4, &hub->conf_data2);
> +	} else if (of_get_property(np, "oc-delay-16ms", NULL)) {
> +		set_bit_in_byte(5, &hub->conf_data2);
> +		set_bit_in_byte(4, &hub->conf_data2);
> +	}
> +
> +	if (of_get_property(np, "compound-device", NULL))
> +		set_bit_in_byte(3, &hub->conf_data2);
> +
> +	hub->conf_data3 = USB251XB_DEF_CONFIG_DATA_3;
> +	if (of_get_property(np, "port-mapping-mode", NULL))
> +		set_bit_in_byte(3, &hub->conf_data3);
> +
> +	if (of_get_property(np, "string-support", NULL))
> +		set_bit_in_byte(0, &hub->conf_data3);
> +
> +	hub->non_rem_dev = USB251XB_DEF_NON_REMOVABLE_DEVICES;
> +	property_u32 = of_get_property(np, "non-removable-ports",
> &len);
> +	if (property_u32 && (len / sizeof(u32)) > 0) {
> +		for (i = 0; i < len / sizeof(u32); i++) {
> +			u32 port = be32_to_cpu(property_u32[i]);
> +
> +			if ((port >= 1) && (port <= 4))
> +				set_bit_in_byte(port, &hub-
> >non_rem_dev);
> +		}
> +	}
> +
> +	hub->port_disable_sp = USB251XB_DEF_PORT_DISABLE_SELF;
> +	property_u32 = of_get_property(np, "sp-disabled-ports",
> &len);
> +	if (property_u32 && (len / sizeof(u32)) > 0) {
> +		for (i = 0; i < len / sizeof(u32); i++) {
> +			u32 port = be32_to_cpu(property_u32[i]);
> +
> +			if ((port >= 1) && (port <= 4))
> +				set_bit_in_byte(port, &hub-
> >port_disable_sp);
> +		}
> +	}
> +
> +	hub->port_disable_bp = USB251XB_DEF_PORT_DISABLE_BUS;
> +	property_u32 = of_get_property(np, "bp-disabled-ports",
> &len);
> +	if (property_u32 && (len / sizeof(u32)) > 0) {
> +		for (i = 0; i < len / sizeof(u32); i++) {
> +			u32 port = be32_to_cpu(property_u32[i]);
> +
> +			if ((port >= 1) && (port <= 4))
> +				set_bit_in_byte(port, &hub-
> >port_disable_bp);
> +		}
> +	}
> +
> +	hub->max_power_sp = USB251XB_DEF_MAX_POWER_SELF;
> +	property_u32 = of_get_property(np, "max-sp-power", NULL);
> +	if (property_u32) {
> +		u32 curr = be32_to_cpu(*property_u32) / 2;
> +
> +		if (curr > 250)
> +			curr = 250;
> +		hub->max_power_sp = (curr & 0xFF);
> +	}
> +
> +	hub->max_power_bp = USB251XB_DEF_MAX_POWER_BUS;
> +	property_u32 = of_get_property(np, "max-bp-power", NULL);
> +	if (property_u32) {
> +		u32 curr = be32_to_cpu(*property_u32) / 2;
> +
> +		if (curr > 250)
> +			curr = 250;
> +		hub->max_power_bp = (curr & 0xFF);
> +	}
> +
> +	hub->max_current_sp = USB251XB_DEF_MAX_CURRENT_SELF;
> +	property_u32 = of_get_property(np, "max-sp-current", NULL);

Why not of_property_read_u32()?

> +	if (property_u32) {

> +		u32 curr = be32_to_cpu(*property_u32) / 2;
> +
> +		if (curr > 250)
> +			curr = 250;

u8 curr = min_t(u8, be32_to_cpu(*property_u32) / 2, 250);

> +		hub->max_current_sp = (curr & 0xFF);

...and thus & 0xFF is redundant.

> +	}
> +
> +	hub->max_current_bp = USB251XB_DEF_MAX_CURRENT_BUS;
> +	property_u32 = of_get_property(np, "max-bp-current", NULL);
> +	if (property_u32) {
> +		u32 curr = be32_to_cpu(*property_u32) / 2;
> +
> +		if (curr > 250)
> +			curr = 250;
> +		hub->max_current_bp = (curr & 0xFF);
> +	}
> +
> +	hub->power_on_time = USB251XB_DEF_POWER_ON_TIME;
> +	property_u32 = of_get_property(np, "power-on-time", NULL);
> +	if (property_u32) {
> +		u32 curr = be32_to_cpu(*property_u32) / 2;
> +
> +		if (curr > 255)
> +			curr = 255;
> +		hub->power_on_time = (curr & 0xFF);
> +	}
> +
> +	if (of_property_read_u16_array(np, "language-id", &hub-
> >lang_id, 1))
> +		hub->lang_id = USB251XB_DEF_LANGUAGE_ID;
> +
> +	property_char = of_get_property(np, "manufacturer", NULL);

> +	if (property_char)
> +		strncpy(str, property_char, sizeof(str));
> +	else
> +		strncpy(str, USB251XB_DEF_MANUFACTURER_STRING,
> sizeof(str));

I would use strlcpy and ternary operator.

> +	hub->manufacturer_len = strlen(str) & 0xFF;
> +	memset(hub->manufacturer, 0, USB251XB_STRING_BUFSIZE);
> 

> +	len = min((size_t)USB251XB_STRING_BUFSIZE / 2, strlen(str));

min_t()

> +	len = utf8s_to_utf16s(str, len, UTF16_LITTLE_ENDIAN,
> +			      (wchar_t *)hub->manufacturer,
> +			      USB251XB_STRING_BUFSIZE);
> +
> +	property_char = of_get_property(np, "product", NULL);

> +	if (property_char)
> +		strncpy(str, property_char, sizeof(str));
> +	else
> +		strncpy(str, data->product_str, sizeof(str));

I would use strlcpy and ternary operator.

> +	hub->product_len = strlen(str) & 0xFF;
> +	memset(hub->product, 0, USB251XB_STRING_BUFSIZE);
> 

> +	len = min((size_t)USB251XB_STRING_BUFSIZE / 2, strlen(str));

min_t()

> +	len = utf8s_to_utf16s(str, len, UTF16_LITTLE_ENDIAN,
> +			      (wchar_t *)hub->product,
> +			      USB251XB_STRING_BUFSIZE);
> +
> +	property_char = of_get_property(np, "serial", NULL);

> +	if (property_char)
> +		strncpy(str, property_char, sizeof(str));
> +	else
> +		strncpy(str, USB251XB_DEF_SERIAL_STRING,
> sizeof(str));

strlcpy()

> +	hub->serial_len = strlen(str) & 0xFF;
> +	memset(hub->serial, 0, USB251XB_STRING_BUFSIZE);

> +	len = min((size_t)USB251XB_STRING_BUFSIZE / 2, strlen(str));

min_t()

> +	len = utf8s_to_utf16s(str, len, UTF16_LITTLE_ENDIAN,
> +			      (wchar_t *)hub->serial,
> +			      USB251XB_STRING_BUFSIZE);
> +

> +	/* the following parameters are currently not exposed to
> devicetree, but
> +	 * may be as soon as needed
> +	 */

Style of multi-line comment.

> +	hub->bat_charge_en = USB251XB_DEF_BATTERY_CHARGING_ENABLE;
> +	hub->boost_up = USB251XB_DEF_BOOST_UP;
> +	hub->boost_x = USB251XB_DEF_BOOST_X;
> +	hub->port_swap = USB251XB_DEF_PORT_SWAP;
> +	hub->port_map12 = USB251XB_DEF_PORT_MAP_12;
> +	hub->port_map34 = USB251XB_DEF_PORT_MAP_34;
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id usb251xb_of_match[] = {
> +	{
> +		.compatible = "microchip,usb2512b",
> +		.data = &usb2512b_data,
> +	}, {
> +		.compatible = "microchip,usb2512bi",
> +		.data = &usb2512bi_data,
> +	}, {
> +		.compatible = "microchip,usb2513b",
> +		.data = &usb2513b_data,
> +	}, {
> +		.compatible = "microchip,usb2513bi",
> +		.data = &usb2513bi_data,
> +	}, {
> +		.compatible = "microchip,usb2514b",
> +		.data = &usb2514b_data,
> +	}, {
> +		.compatible = "microchip,usb2514bi",
> +		.data = &usb2514bi_data,
> +	}, {
> +		/* sentinel */
> +	}
> +};
> +MODULE_DEVICE_TABLE(of, usb251xb_of_match);
> 

> +#else /* CONFIG_OF */
> +static int usb251xb_get_ofdata(struct usb251xb *hub,
> +			       struct usb251xb_data *data)
> +{
> +	return 0;
> +}
> +#endif /* CONFIG_OF */

I don't think it's a good idea to have those ugly #ifdef.

> +
> +static int usb251xb_probe(struct usb251xb *hub)
> +{
> +	struct device *dev = hub->dev;
> +	struct device_node *np = dev->of_node;
> +	const struct of_device_id *of_id =
> of_match_device(usb251xb_of_match,
> +							   dev);
> +	int err;
> +

> +	dev_info(dev, DRIVER_DESC " " DRIVER_NAME "\n");

Useless.

> +
> +	if (np) {
> +		err = usb251xb_get_ofdata(hub,
> +					  (struct usb251xb_data
> *)of_id->data);
> +		if (err) {
> +			dev_err(dev, "failed to get ofdata: %d\n",
> err);
> +			return err;
> +		}
> +	}
> +
> +	err = usb251xb_connect(hub);
> +	if (err) {

> +		dev_err(dev, "Failed to connect " DRIVER_NAME "
> (%d)\n", err);

Are you sure DRIVER_NAME is anyhow useful here?

> +		return err;
> +	}
> +

> +	dev_info(dev, "%s: probed successfully\n", __func__);

__func__ is redundant. If someone needs to trace we have
"initcall_debug".

> +
> +	return 0;
> +}
> 


> +static int usb251xb_i2c_remove(struct i2c_client *client)
> +{
> +	return 0;
> +}

I'm not sure you need this, check if unbind works if there is no
->remove() function defined.

> +static int __init usb251xb_init(void)
> +{
> +	int err;
> +
> +	err = i2c_add_driver(&usb251xb_i2c_driver);
> +	if (err) {
> +		pr_err(DRIVER_NAME ": Failed to register I2C driver
> %d\n", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +module_init(usb251xb_init);
> +
> +static void __exit usb251xb_exit(void)
> +{
> +	i2c_del_driver(&usb251xb_i2c_driver);
> +}
> +module_exit(usb251xb_exit);
> 

Just use module_i2c_driver();

-- 
Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Intel Finland Oy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
