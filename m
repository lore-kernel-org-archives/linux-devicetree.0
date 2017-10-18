From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH usb-next v6 3/3] usb: core: hcd: integrate the PHY roothub
 wrapper
Date: Wed, 18 Oct 2017 10:40:06 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1710181039240.1528-100000@iolanthe.rowland.org>
References: <20171017212100.10544-4-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171017212100.10544-4-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 17 Oct 2017, Martin Blumenstingl wrote:

> This integrates the PHY roothub wrapper into the core hcd
> infrastructure. Multiple PHYs which are part of the roothub devicetree
> node (which is a sub-node of the sysdev's node) are now managed
> (= powered on/off when needed), by the new usb_phy_roothub code.
> 
> One example where this is required is the Amlogic GXL and GXM SoCs:
> They are using a dwc3 USB controller with up to three ports enabled on
> the internal roothub. Using only the top-level "phy" properties does not
> work here since one can only specify one "usb2-phy" and one "usb3-phy",
> while actually at least two "usb2-phy" have to be specified.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
>  drivers/usb/core/hcd.c  | 27 +++++++++++++++++++++++++++
>  include/linux/usb/hcd.h |  1 +
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 67aa3d039b9b..59bb8dac5264 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -50,6 +50,7 @@
>  #include <linux/usb/otg.h>
>  
>  #include "usb.h"
> +#include "phy.h"
>  
>  
>  /*-------------------------------------------------------------------------*/
> @@ -2271,6 +2272,8 @@ int hcd_bus_suspend(struct usb_device *rhdev, pm_message_t msg)
>  		usb_set_device_state(rhdev, USB_STATE_SUSPENDED);
>  		hcd->state = HC_STATE_SUSPENDED;
>  
> +		usb_phy_roothub_power_off(hcd->phy_roothub);
> +
>  		/* Did we race with a root-hub wakeup event? */
>  		if (rhdev->do_remote_wakeup) {
>  			char	buffer[6];
> @@ -2292,6 +2295,7 @@ int hcd_bus_suspend(struct usb_device *rhdev, pm_message_t msg)
>  		dev_dbg(&rhdev->dev, "bus %s fail, err %d\n",
>  				"suspend", status);
>  	}
> +
>  	return status;
>  }

Unnecessary whitespace change.  Otherwise this is okay.

Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
