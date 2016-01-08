From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH 2/2] usb: Example for how to use device node at usb device driver
Date: Fri, 08 Jan 2016 09:26:10 +0100
Message-ID: <4231421.FQCAATyWeB@wuerfel>
References: <1452231864-11171-1-git-send-email-peter.chen@freescale.com> <1452231864-11171-3-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452231864-11171-3-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 08 January 2016 13:44:24 Peter Chen wrote:
> +	  u32 duration_us = 0;

> +       of_property_read_u32(hdev->dev.of_node, "delay-duration-us", &duration_us);
> +       if (duration_us > 0) {
> +               usleep_range(duration_us, duration_us + 10);
> +               dev_info(&hdev->dev, "The delay is %d us\n", duration_us);
> +       }
> +

I think especially for an example, it would be better to use error checking and
not initialize the variable:

	u32 duration_us;
	int ret;
...
	ret = of_property_read_u32(hdev->dev.of_node, "delay-duration-us", &duration_us);
	if (!ret && duration_us > 0) {
		...
	}

The effect is the same as the other one.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
