From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 4/4] ARM: dts: imx6qdl: Add PU power-domain
 information to gpc node
Date: Wed, 12 Feb 2014 19:15:51 +0800
Message-ID: <20140212111549.GC24834@S2101-09.ap.freescale.net>
References: <1392125231-28387-1-git-send-email-p.zabel@pengutronix.de>
 <1392125231-28387-5-git-send-email-p.zabel@pengutronix.de>
 <20140212072510.GI31484@S2101-09.ap.freescale.net>
 <1392200455.5536.36.camel@pizza.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392200455.5536.36.camel-/rZezPiN1rtR6QfukMTsflXZhhPuCNm+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 12, 2014 at 11:20:55AM +0100, Philipp Zabel wrote:
> > > @@ -598,9 +598,17 @@
> > >  			};
> > >  
> > >  			gpc: gpc@020dc000 {
> > > +				#address-cells = <1>;
> > > +				#size-cells = <1>;
> > >  				compatible = "fsl,imx6q-gpc";
> > >  				reg = <0x020dc000 0x4000>;
> > >  				interrupts = <0 89 0x04 0 90 0x04>;
> > > +				pu-supply = <&reg_pu>;
> > > +
> > > +				pd_pu: power-domain@020dc260 {
> > > +					compatible = "fsl,power-domain";
> > > +					reg = <0x020dc260 0x10>;
> > > +				};
> > 
> > It's time to have a binding doc for gpc/pgc?
> 
> Yes, I'll add one for the next version.
> 
> > And I'm not sure
> > "fsl,power-domain" is a good compatible as it's so generic.
> 
> fsl,imx6q-power-domain ?

It looks good to me.

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
