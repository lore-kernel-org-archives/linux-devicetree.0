From: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/9 v2] usb: usb251xb: Add USB251x specific port count
 setting
Date: Wed, 4 Oct 2017 09:27:14 +0200
Message-ID: <1e473b53-f031-fa86-9c2d-5b4c8bba8a28@skidata.com>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
 <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20170916104220.3742-3-fancer.lancer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170916104220.3742-3-fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On 09/16/2017 12:42 PM, Serge Semin wrote:
> USB251xb as well as USB2517 datasheet states, that all these
> hubs differ by number of ports declared as the last digit in the
> model name. So USB2512 got two ports, USB2513 - three, and so on.
> Such setting must be reflected in the device specific data
> structure and corresponding dts property should be checked whether
> it doesn't get out of available ports.
> 
> Signed-off-by: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/usb/misc/usb251xb.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> index 96a8c20ac..5cb0e5570 100644
> --- a/drivers/usb/misc/usb251xb.c
> +++ b/drivers/usb/misc/usb251xb.c

...

>  
> @@ -422,8 +431,10 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
>  		for (i = 0; i < len / sizeof(u32); i++) {
>  			u32 port = be32_to_cpu(cproperty_u32[i]);
>  
> -			if ((port >= 1) && (port <= 4))
> +			if ((port >= 1) && (port <= data->port_cnt))
>  				hub->non_rem_dev |= BIT(port);
> +			else
> +				dev_warn(dev, "port %u doesn't exist\n", port);

I'd prefer to add the (invalid) property trying to be set in this
warning messages. So someone is able to find the invalid dt setting
faster. Something like;

	dev_warn(dev, "requested NRD port %u doesn't exist\n", port);

>  		}
>  	}
>  
> @@ -433,8 +444,10 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
>  		for (i = 0; i < len / sizeof(u32); i++) {
>  			u32 port = be32_to_cpu(cproperty_u32[i]);
>  
> -			if ((port >= 1) && (port <= 4))
> +			if ((port >= 1) && (port <= data->port_cnt))
>  				hub->port_disable_sp |= BIT(port);
> +			else
> +				dev_warn(dev, "port %u doesn't exist\n", port);

... same as above. For example:

	dev_warn(dev, "requested PDS port %u doesn't exist\n", port);

>  		}
>  	}
>  
> @@ -444,8 +457,10 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
>  		for (i = 0; i < len / sizeof(u32); i++) {
>  			u32 port = be32_to_cpu(cproperty_u32[i]);
>  
> -			if ((port >= 1) && (port <= 4))
> +			if ((port >= 1) && (port <= data->port_cnt))
>  				hub->port_disable_bp |= BIT(port);
> +			else
> +				dev_warn(dev, "port %u doesn't exist\n", port);

... same as above. For example:

	dev_warn(dev, "requested PDB port %u doesn't exist\n", port);


Apart from that this patch looks fine for me. Thanks for the spot of the
hardcoded max ports check.

regards,
Richard.L
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
