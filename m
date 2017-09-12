From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 10/11] staging: typec: fusb302: Hook up mux support
 using tcpc_gen_mux support
Date: Tue, 12 Sep 2017 17:20:27 -0500
Message-ID: <20170912222027.hzpejmmxkwbw6seu@rob-hp-laptop>
References: <20170905164221.11266-1-hdegoede@redhat.com>
 <20170905164221.11266-11-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170905164221.11266-11-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 05, 2017 at 06:42:20PM +0200, Hans de Goede wrote:
> Add mux support to the fusb302 driver, call devm_tcpc_gen_mux_create()
> to let the generic tcpc_mux_dev code create a tcpc_mux_dev for us.
> 
> Also document the mux-names used by the generic tcpc_mux_dev code in
> our devicetree bindings.
> 
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/fcs,fusb302.txt |  3 +++
>  drivers/staging/typec/fusb302/fusb302.c               | 11 ++++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/fcs,fusb302.txt b/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
> index 472facfa5a71..63d639eadacd 100644
> --- a/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
> +++ b/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
> @@ -6,6 +6,9 @@ Required properties :
>  - interrupts             : Interrupt specifier
>  
>  Optional properties :
> +- mux-controls           : List of mux-ctrl-specifiers containing 1 or 2 muxes
> +- mux-names              : "type-c-mode-mux" when using 1 mux, or
> +                           "type-c-mode-mux", "usb-role-mux" when using 2 muxes

I'm not sure this is the right place for this. The mux is outside the 
FUSB302. In a type-C connector node or USB phy node would make more 
sense to me.

>  - fcs,max-sink-microvolt : Maximum voltage to negotiate when configured as sink
>  - fcs,max-sink-microamp  : Maximum current to negotiate when configured as sink
>  - fcs,max-sink-microwatt : Maximum power to negotiate when configured as sink
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
