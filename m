From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/1] Add driver for smsc usb251x i2c configuration
Date: Tue, 2 Aug 2016 15:48:10 +0100
Message-ID: <20160802144810.GC20134@leverpostej>
References: <1470148324-27428-1-git-send-email-fabien.lahoudere@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470148324-27428-1-git-send-email-fabien.lahoudere-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabien Lahoudere <fabien.lahoudere-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:USB SUBSYSTEM" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Aug 02, 2016 at 04:31:54PM +0200, Fabien Lahoudere wrote:
> This driver copy the configuration of the controller EEPROM via i2c.
> Configuration information is available in Documentation/usb/usb251x.txt
> 
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/usb251x.txt |  27 +++
>  drivers/usb/misc/Kconfig                          |   9 +
>  drivers/usb/misc/Makefile                         |   1 +
>  drivers/usb/misc/usb251x.c                        | 265 ++++++++++++++++++++++
>  4 files changed, 302 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb251x.txt
>  create mode 100644 drivers/usb/misc/usb251x.c
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb251x.txt b/Documentation/devicetree/bindings/usb/usb251x.txt
> new file mode 100644
> index 0000000..2b0863a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/usb251x.txt
> @@ -0,0 +1,27 @@
> +SMSC USB 2.0 Hi-Speed Hub Controller
> +
> +Required properties:
> +- compatible = "smsc,usb251x";

Please us specific compatible strings rather than wildcards.

> +- reg = <0x2c>;
> +
> +Optional properties:
> +- smsc,usb251x-cfg-data1 : u8, set configuration data 1 (byte 0x06)
> +- smsc,usb251x-cfg-data2 : u8, set configuration data 2 (byte 0x07)
> +- smsc,usb251x-cfg-data3 : u8, set configuration data 3 (byte 0x08)
> +- smsc,usb251x-portmap12 : u8, set port mapping for ports 1 and 2 (byte 0xfb)
> +- smsc,usb251x-portmap34 : u8, set port mapping for ports 3 and 4 (byte 0xfc)
> +- smsc,usb251x-portmap56 : u8, set port mapping for ports 5 and 6 (byte 0xfd)
> +- smsc,usb251x-portmap7 : u8, set port mapping for port 7 (byte 0xfe)
> +- smsc,usb251x-status-command : u8, configure smbus behaviour (byte 0xff)

For device tree bindings we generally shy away from encoding raw values
in this manner. I'm very much not keen on this as-is.

What exactly do these values represent?

Why must these be configured through DT? When should a dts author
provide them?

I have more comments on the representation below.

> +
> +Example:
> +
> +	usb251x: usb251x@2c {
> +		compatible = "smsc,usb251x";
> +		reg = <0x2c>;
> +		smsc,usb251x-cfg-data3 = <0x09>;
> +		smsc,usb251x-portmap12 = <0x21>;
> +		smsc,usb251x-portmap12 = <0x43>;
> +		smsc,usb251x-status-command = <0x1>;
> +	};

Above these were describes as u8 values, but here they're treated as u32
due to the lack of a /bits/ 8 prefix on the values. Trying to store them
as u8 saves no space whatsoever, given values are always padded to 32
bits.

[...]

> +static unsigned char default_init_table[USB251X_ADDR_SZ] = {
> +	0x24, 0x04, 0x14, 0x25, 0xa0, 0x0b, 0x9b, 0x20,	/* 00 - 07 */
> +	0x02, 0x00, 0x00, 0x00, 0x01, 0x32, 0x01, 0x32,	/* 08 - 0F */
> +	0x32, 0x00, 0x00, 4, 30, 0x00, 'S', 0x00,	/* 10 - 17 */
> +	'M', 0x00, 'S', 0x00, 'C', 0x00, 0x00, 0x00,	/* 18 - 1F */
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* 20 - 27 */
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* 28 - 2F */
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* 30 - 37 */
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* 38 - 3F */
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* 40 - 47 */
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* 48 - 4F */
> +	0x00, 0x00, 0x00, 0x00, 'U', 0x00, 'S', 0x00,	/* 50 - 57 */
> +	'B', 0x00, ' ', 0x00, '2', 0x00, '.', 0x00,	/* 58 - 5F */
> +	'0', 0x00, ' ', 0x00, 'H', 0x00, 'i', 0x00,	/* 60 - 67 */
> +	'-', 0x00, 'S', 0x00, 'p', 0x00, 'e', 0x00,	/* 68 - 6F */
> +	'e', 0x00, 'd', 0x00, ' ', 0x00, 'H', 0x00,	/* 70 - 77 */
> +	'u', 0x00, 'b', 0x00, ' ', 0x00, 'C', 0x00,	/* 78 - 7F */
> +	'o', 0x00, 'n', 0x00, 't', 0x00, 'r', 0x00,	/* 80 - 87 */
> +	'o', 0x00, 'l', 0x00, 'l', 0x00, 'e', 0x00,	/* 88 - 8F */
> +	'r', 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* 90 - 97 */
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* 98 - 9F */
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* A0 - A7 */
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* A8 - AF */
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* B0 - B7 */
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* B8 - BF */
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* C0 - C7 */
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* C8 - CF */
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* D0 - D7 */
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* D8 - DF */
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* E0 - E7 */
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* E8 - EF */
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* F0 - F7 */
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00	/* F8 - FF */
> +};

What exactly is this? Is this a FW blob? Is it a series of commands?

How has this been derived?

A comment would be very helpful.

[...]

> +static void usb251x_set_config_from_of(const struct device_node *node,
> +				       unsigned char *table,
> +				       const char *pname, u8 offset)
> +{
> +	int ret;
> +	unsigned char value;
> +
> +	ret = of_property_read_u8(node, pname, &value);
> +	if (ret == 0)
> +		table[offset] = value;
> +}

This doesn't match your example, which used u32 values, due to lack of a
/bits/ 8 prefix. For those properties, of_property_read_u8() would
always return the value 0.

How was this been tested?

Thanks,
Mark
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
