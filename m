From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v2] usb: misc: add USB251xB/xBi Hi-Speed Hub Controller
 Driver
Date: Sun, 5 Feb 2017 08:42:16 +0100
Message-ID: <20170205074216.GA314@kroah.com>
References: <1486119324-9362-1-git-send-email-richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1486119324-9362-1-git-send-email-richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 03, 2017 at 11:55:24AM +0100, Richard Leitner wrote:
> +/**
> + * ascii2utf16le() - Helper routine for producing UTF-16LE string descriptors
> + * @s: Null-terminated ASCII (actually ISO-8859-1) string
> + * @buf: Buffer for UTF-16LE string
> + * @len: Length (in bytes; may be odd) of UTF-16LE buffer.
> + *
> + * Return: The number of bytes filled in: 2*strlen(s) or @len, whichever is less
> + *
> + * Note:
> + * The UTF-16LE USB String descriptors can contain at most 31 characters (as
> + * specified in the datasheet); input strings longer than that are truncated.
> + *
> + * Based on ascii2desc from drivers/usb/core/hcd.c
> + */
> +static unsigned int ascii2utf16le(char const *s, u8 *buf, unsigned int len)
> +{
> +	unsigned int n, t = 2 * strlen(s);
> +
> +	if (t > USB251XB_STRING_BUFSIZE)
> +		t = USB251XB_STRING_BUFSIZE;
> +	if (len > t)
> +		len = t;
> +	n = len;
> +	while (n--) {
> +		t = (unsigned char)*s++;
> +		*buf++ = t;
> +		if (!n--)
> +			break;
> +		*buf++ = t >> 8;
> +	}
> +	return len;
> +}

Don't we have a kernel function for this already?  If we need to export
ascii2desc() from the USB core, we can do that, or better yet, move both
of them to a string library function in the core part of the kernel.  We
shouldn't have to duplicate this type of thin in an individual driver.

> --- /dev/null
> +++ b/include/linux/platform_data/usb251xb.h
> @@ -0,0 +1,33 @@
> +#ifndef __USB251XB_H__
> +#define __USB251XB_H__
> +
> +struct usb251xb_platform_data {
> +	int gpio_reset;
> +	u16 vendor_id;
> +	u16 product_id;
> +	u16 device_id;
> +	u8 conf_data1;
> +	u8 conf_data2;
> +	u8 conf_data3;
> +	u8 non_rem_dev;
> +	u8 port_disable_sp;
> +	u8 port_disable_bp;
> +	u8 max_power_sp;
> +	u8 max_power_bp;
> +	u8 max_current_sp;
> +	u8 max_current_bp;
> +	u8 power_on_time;
> +	u16 lang_id;
> +	char manufacturer[31];	/* NULL terminated ASCII string */
> +	char product[31];	/* NULL terminated ASCII string */
> +	char serial[31];	/* NULL terminated ASCII string */
> +	u8 bat_charge_en;
> +	u8 boost_up;
> +	u8 boost_x;
> +	u8 port_swap;
> +	u8 port_map12;
> +	u8 port_map34;
> +	u8 status;
> +};

Do you need a platform data structure here?  Shouldn't we be only using
DT now?

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
