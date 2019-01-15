Return-Path: <SRS0=RXyf=PX=pengutronix.de=mfe@kernel.org>
Date: Tue, 15 Jan 2019 13:04:22 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2 2/2] usb: usb251xb: add usb data lane port swap feature
Message-ID: <20190115120422.zgrlcauakhsikwyb@pengutronix.de>
References: <20190115115018.27143-1-m.felsch@pengutronix.de>
 <20190115115018.27143-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190115115018.27143-2-m.felsch@pengutronix.de>
To: richard.leitner@skidata.com, robh@kernel.org, fancer.lancer@gmail.com
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hi,

On 19-01-15 12:50, Marco Felsch wrote:
> The HW can swap the USB differential-pair (D+/D-) for each port
> separately. So the USB signals can be re-aligned with a misplaced
> USB connector on the PCB.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Changes:
> v2:
>  - rename property s/sw-dx-lanes-ports/swap-dx-lanes
>  - add commentar for future users
> 
>  drivers/usb/misc/usb251xb.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> index a6efb9a72939..ec649046688d 100644
> --- a/drivers/usb/misc/usb251xb.c
> +++ b/drivers/usb/misc/usb251xb.c
> @@ -337,10 +337,12 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
>  	struct device *dev = hub->dev;
>  	struct device_node *np = dev->of_node;
>  	int len, err, i;
> -	u32 property_u32 = 0;
> +	u32 port, property_u32 = 0;
>  	const u32 *cproperty_u32;
>  	const char *cproperty_char;
>  	char str[USB251XB_STRING_BUFSIZE / 2];
> +	struct property *prop;
> +	const __be32 *p;
>  
>  	if (!np) {
>  		dev_err(dev, "failed to get ofdata\n");
> @@ -539,6 +541,16 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
>  			      (wchar_t *)hub->serial,
>  			      USB251XB_STRING_BUFSIZE);
> 
> +	/*
> +	 * The datasheet documents the register as 'Port Swap' but the register
> +	 * controls the USB DP/DM signal swapping
> +	 */

Sorry for the noise, unfortunately I forgot to update the patch..
Richard can you fix the commentar inline to:

8<----------------------------------------------------------------------------
+       /*
+        * The datasheet documents the register as 'Port Swap' but in real the
+        * register controls the USB DP/DM signal swapping for each port.
+        */
8<----------------------------------------------------------------------------

> +	hub->port_swap = USB251XB_DEF_PORT_SWAP;
> +	of_property_for_each_u32(np, "swap-dx-lanes", prop, p, port) {
> +		if ((port >= 0) && (port <= data->port_cnt))
> +			hub->port_swap |= BIT(port);
> +	}
> +
>  	/* The following parameters are currently not exposed to devicetree, but
>  	 * may be as soon as needed.
>  	 */
> @@ -546,7 +558,6 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
>  	hub->boost_up = USB251XB_DEF_BOOST_UP;
>  	hub->boost_57 = USB251XB_DEF_BOOST_57;
>  	hub->boost_14 = USB251XB_DEF_BOOST_14;
> -	hub->port_swap = USB251XB_DEF_PORT_SWAP;
>  	hub->port_map12 = USB251XB_DEF_PORT_MAP_12;
>  	hub->port_map34 = USB251XB_DEF_PORT_MAP_34;
>  	hub->port_map56 = USB251XB_DEF_PORT_MAP_56;
> -- 
> 2.20.1
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
