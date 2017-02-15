From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: add multidomain support to i.MX GPC
 DT binding
Date: Wed, 15 Feb 2017 10:26:05 +0100
Message-ID: <1487150765.2304.65.camel@pengutronix.de>
References: <20170127183728.26701-1-l.stach@pengutronix.de>
         <1486741439.3879.7.camel@pengutronix.de> <20170215070830.GA8398@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170215070830.GA8398@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, den 15.02.2017, 15:08 +0800 schrieb Shawn Guo:
> On Fri, Feb 10, 2017 at 04:43:59PM +0100, Lucas Stach wrote:
> > Hi Shawn,
> > 
> > are you willing to take this series through your tree or do you think we
> > need to get this in via some other tree?
> 
> I'm willing to take it.  But I don't think it's been ready yet.  Since
> you insist on keeping the .remove hook for both imx_gpc_driver and
> imx_pgc_power_domain_driver, did you actually test it with manually
> bind/unbind the drivers?  I tested it a bit and found it doesn't work
> well for me.

It works as well as it could at this point. The driver unloads fine, but
obviously anything that depends on it is broken at that point. Try
unloading a regulator driver, it's the same experience.

This will get better once the functional dependency stuff is far enough
to either block unloading of drivers providing resources to other
devices, or unload the dependent drivers first.

> 
> Also, there is a comment from Andrey that is not responded.

Yes, I'll take care of this. Just didn't want to roll a new version of
this series before we know where it is going.

Regards,
Lucas

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
