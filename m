From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: add multidomain support to i.MX GPC
 DT binding
Date: Wed, 15 Feb 2017 15:08:32 +0800
Message-ID: <20170215070830.GA8398@dragon>
References: <20170127183728.26701-1-l.stach@pengutronix.de>
 <1486741439.3879.7.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1486741439.3879.7.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 10, 2017 at 04:43:59PM +0100, Lucas Stach wrote:
> Hi Shawn,
> 
> are you willing to take this series through your tree or do you think we
> need to get this in via some other tree?

I'm willing to take it.  But I don't think it's been ready yet.  Since
you insist on keeping the .remove hook for both imx_gpc_driver and
imx_pgc_power_domain_driver, did you actually test it with manually
bind/unbind the drivers?  I tested it a bit and found it doesn't work
well for me.

Also, there is a comment from Andrey that is not responded.

Shawn

> It would be good to queue this up somewhere as a reference, as I have
> some upcoming work for MX6SX and MX6QP, which depends on this series.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
