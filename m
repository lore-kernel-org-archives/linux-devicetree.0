From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [RFC usb-next v5 2/3] usb: core: add a wrapper for the USB PHYs
 on the root-hub
Date: Mon, 9 Oct 2017 13:16:03 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1710091314310.6996-100000@netrider.rowland.org>
References: <20171008211713.18696-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171008211713.18696-3-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 8 Oct 2017, Martin Blumenstingl wrote:

> Many SoC platforms have separate devices for the USB PHY which are
> registered through the generic PHY framework. These PHYs have to be
> enabled to make the USB controller actually work. They also have to be
> disabled again on shutdown/suspend.

...

> --- /dev/null
> +++ b/drivers/usb/core/phy.h
> @@ -0,0 +1,7 @@
> +struct usb_phy_roothub;
> +
> +struct usb_phy_roothub *usb_phy_roothub_init(struct device *dev);
> +int usb_phy_roothub_exit(struct usb_phy_roothub *phy_roothub);
> +
> +int usb_phy_roothub_power_on(struct usb_phy_roothub *phy_roothub);
> +int usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub);

Have you considered the possibility that a phy might need three power
states, for on, off, and suspended?

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
