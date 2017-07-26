From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 1/2] remoteproc: dt: Provide bindings for iMX6SX/7D
 Remote Processor Controller driver
Date: Wed, 26 Jul 2017 10:11:55 -0700
Message-ID: <20170726171155.GE20643@builder>
References: <20170710144220.31594-1-o.rempel@pengutronix.de>
 <20170710144220.31594-2-o.rempel@pengutronix.de>
 <20170710221408.GD1618@tuxbook>
 <91bfe236-0410-b26e-7ef6-73d14ebf120d@pengutronix.de>
 <20170718163814.GD20973@minitux>
 <ebaaf7ba-e177-0b90-bb0a-9371923bce44@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ebaaf7ba-e177-0b90-bb0a-9371923bce44-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Cc: Oleksij Rempel <ore-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun 23 Jul 22:56 PDT 2017, Oleksij Rempel wrote:

> Am 18.07.2017 um 18:38 schrieb Bjorn Andersson:
> > On Tue 18 Jul 01:45 PDT 2017, Oleksij Rempel wrote:
> >> On 11.07.2017 00:14, Bjorn Andersson wrote:
[..]
> >>> Also, as you warn about the user needing to pick the values for "ddr",
> >>> does that mean that it's a carveout of System RAM?
> >>
> >> Yes, it is a part of System RAM.
> >>
> > 
> > Then there will be an associated reserved-memory region for the
> > region(s), you should add a label to this and use "memory-region" to get
> > hold of the addresses instead.
> 
> Ok. Should only system memory region be assigned over reserved-memory or
> all of named regions?
> 

You can do it either way, but unless you see a strong reason against it
I would recommend just having a single region, for simplicity.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
