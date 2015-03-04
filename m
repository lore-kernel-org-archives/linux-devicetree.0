From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 07/10 v2] usb: Make sure that DWC2 initializes after the
 power channel mailbox driver.
Date: Tue, 03 Mar 2015 20:24:21 -0700
Message-ID: <54F67AE5.3010406@wwwdotorg.org>
References: <20150303083250.GG6976@x1> <1425414778-30820-1-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425414778-30820-1-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/03/2015 01:32 PM, Eric Anholt wrote:
> This gets USB working on the Raspberry Pi without relying on U-Boot to
> send the power message for us.  Without it, you would get warnings
> about fifo sizes and "dwc2_core_reset() HANG! Soft Reset
> GRSTCTL=80000001" leading to a failed probe.
> 
> v2: Make the export of the has-the-mailbox-driver-loaded bool be
>     through a function call defined in include/linux/platform/
> 
> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> Cc: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> ---
> 
> This would be the first include file in include/linux/platform/.  Is
> that the right place?  I see a few
> arch/arm/mach-*/include/mach/platform.h files -- would that or
> arch/arm/mach-bcm/include/mach/bcm2835-platform.h possibly be the right
> place instead?

include/linux/soc might be better?

Even better would be to make this work through a standard kernel
subsystem API. Then, dwc2's probe would do something like:

// probe:
pd = power_domain_get(&pdev->dev, "power-domain");
if (IS_ERR(pd))
    return PTR_ERR(pd);
// perhaps in probe, or in PM callbacks, etc.
ret = power_domain_on(pd);

That hypothetical function will go out to DT, find the power-domain
property, look at the DT phandle in the property's value, search for a
power domain provider that was instantiated from the DT node the phandle
points at, and obtain a handle to it.

The benefits of this approach are:

a) Uses a standard API rather than something custom.

b) power_domain_get() will return ERR_PTR(-EPROBE_DEFERRED) if the
"power domain provider (driver) instantiated from the DT node the
phandle points at" has not yet probed. In turn this will prevent DWC2
from probing until the power domain can be turned on. The driver core
will call DWC2's probe over and over until it returns something other
than -EPROBE_DEFERRED (i.e. success, or some other failure).

> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c

> @@ -175,6 +176,13 @@ static int dwc2_driver_probe(struct platform_device *dev)
>  		defparams.dma_desc_enable = 0;
>  	}
>  
> +	/*
> +	 * Make sure the platform driver for enabling the power has
> +	 * initialized before we do.
> +	 */
> +	if (params == &params_bcm2835 && !bcm2835_is_usb_powered())
> +		return -EPROBE_DEFER;

This should be something more like:

if dt_property_exists("power-domain") {
  // The power_domain_get code I wrote above
}
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
