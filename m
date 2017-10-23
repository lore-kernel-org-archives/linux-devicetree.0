From: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 09/10 v3] usb: usb251xb: Add max power/current dts
 property support
Date: Mon, 23 Oct 2017 23:55:12 +0200
Message-ID: <b6669d20-935f-5d81-7975-cd36518cd0d4@skidata.com>
References: <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20171022203812.9379-1-fancer.lancer@gmail.com>
 <20171022203812.9379-10-fancer.lancer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171022203812.9379-10-fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: de-AT
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,
again some nit-picks below...

On 10/22/2017 10:38 PM, Serge Semin wrote:
> This parameters may be varied in accordance with hardware specifics.
> So lets add the corresponding settings to the usb251xb driver dts
> specification.
> 
> Signed-off-by: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   drivers/usb/misc/usb251xb.c | 24 ++++++++++++++++++++----
>   1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> index 29432fd3b..669b98be2 100644
> --- a/drivers/usb/misc/usb251xb.c
> +++ b/drivers/usb/misc/usb251xb.c
> @@ -500,6 +500,26 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
>   		}
>   	}
>   
> +	hub->max_power_sp = USB251XB_DEF_MAX_POWER_SELF;
> +	if (!of_property_read_u32(np, "sp-max-total-current-microamp",
> +	    &property_u32))

Please match the "correct" (of_property_read_u32) opening parenthesis 
here...

> +		hub->max_power_sp = min_t(u8, property_u32 / 2000, 50);
> +
> +	hub->max_power_bp = USB251XB_DEF_MAX_POWER_BUS;
> +	if (!of_property_read_u32(np, "bp-max-total-current-microamp",
> +	    &property_u32))

... and here ...

> +		hub->max_power_bp = min_t(u8, property_u32 / 2000, 255);
> +
> +	hub->max_current_sp = USB251XB_DEF_MAX_CURRENT_SELF;
> +	if (!of_property_read_u32(np, "sp-max-removable-current-microamp",
> +	    &property_u32))

... and here ...

> +		hub->max_current_sp = min_t(u8, property_u32 / 2000, 50);
> +
> +	hub->max_current_bp = USB251XB_DEF_MAX_CURRENT_BUS;
> +	if (!of_property_read_u32(np, "bp-max-removable-current-microamp",
> +	    &property_u32))

... and here ...

> +		hub->max_current_bp = min_t(u8, property_u32 / 2000, 255);
> +
>   	hub->power_on_time = USB251XB_DEF_POWER_ON_TIME;
>   	if (!of_property_read_u32(np, "power-on-time-ms", &property_u32))
>   		hub->power_on_time = min_t(u8, property_u32 / 2, 255);

Thanks!

kind regards,
Richard.L
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
