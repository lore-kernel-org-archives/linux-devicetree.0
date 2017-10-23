From: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 03/10 v3] usb: usb251xb: Add USB251x specific port count
 setting
Date: Mon, 23 Oct 2017 23:36:03 +0200
Message-ID: <d5c834d3-e868-0b40-2734-d410cd3db860@skidata.com>
References: <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20171022203812.9379-1-fancer.lancer@gmail.com>
 <20171022203812.9379-4-fancer.lancer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171022203812.9379-4-fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: de-AT
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/22/2017 10:38 PM, Serge Semin wrote:
> USB251xb as well as USB2517 datasheet states, that all these
> hubs differ by number of ports declared as the last digit in the
> model name. So USB2512 got two ports, USB2513 - three, and so on.
> Such setting must be reflected in the device specific data
> structure and corresponding dts property should be checked whether
> it doesn't get out of available ports.
> 
> Signed-off-by: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   drivers/usb/misc/usb251xb.c | 24 +++++++++++++++++++++---
>   1 file changed, 21 insertions(+), 3 deletions(-)

...
> @@ -422,8 +431,11 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
>   		for (i = 0; i < len / sizeof(u32); i++) {
>   			u32 port = be32_to_cpu(cproperty_u32[i]);
>   
> -			if ((port >= 1) && (port <= 4))
> +			if ((port >= 1) && (port <= data->port_cnt))
>   				hub->non_rem_dev |= BIT(port);
> +			else
> +				dev_warn(dev, "NRD port %u doesn't exist\n",
> +					port);

Please match the alignment of the second line with the open parenthesis.

>   		}
>   	}
>   
> @@ -433,8 +445,11 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
>   		for (i = 0; i < len / sizeof(u32); i++) {
>   			u32 port = be32_to_cpu(cproperty_u32[i]);
>   
> -			if ((port >= 1) && (port <= 4))
> +			if ((port >= 1) && (port <= data->port_cnt))
>   				hub->port_disable_sp |= BIT(port);
> +			else
> +				dev_warn(dev, "PDS port %u doesn't exist\n",
> +					port);

... same here ...

>   		}
>   	}
>   
> @@ -444,8 +459,11 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
>   		for (i = 0; i < len / sizeof(u32); i++) {
>   			u32 port = be32_to_cpu(cproperty_u32[i]);
>   
> -			if ((port >= 1) && (port <= 4))
> +			if ((port >= 1) && (port <= data->port_cnt))
>   				hub->port_disable_bp |= BIT(port);
> +			else
> +				dev_warn(dev, "PDB port %u doesn't exist\n",
> +					port);

... and here.

>   		}
>   	}

Otherwise feel free to add:

Acked-by: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>

regards,
Richard.L
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
