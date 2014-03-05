From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v5 4/5] ARM: dts: imx6sl: Add power-domain information
 to gpc node
Date: Wed, 05 Mar 2014 10:37:24 +0100
Message-ID: <1394012244.16929.2.camel@paszta.hi.pengutronix.de>
References: <1393603427-6199-1-git-send-email-p.zabel@pengutronix.de>
	 <1393603427-6199-5-git-send-email-p.zabel@pengutronix.de>
	 <20140305070009.GK8784@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140305070009.GK8784-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, den 05.03.2014, 15:00 +0800 schrieb Shawn Guo:
> On Fri, Feb 28, 2014 at 05:03:46PM +0100, Philipp Zabel wrote:
> > The PGC that is part of GPC controls isolation and power sequencing of the
> > power domains. The PU power domain will be handled by the generic pm domain
> > framework. It needs a phandle to the PU regulator to turn off power when
> > the domain is disabled and a list of clocks to be enabled during powerup
> > for reset propagation.
> > 
> > Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> > Changes since v4:
> >  - Use OF power domain bindings
> >  - Added reset clocks
> > ---
> >  arch/arm/boot/dts/imx6sl.dtsi | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
> > index 28558f1..0e61262 100644
> > --- a/arch/arm/boot/dts/imx6sl.dtsi
> > +++ b/arch/arm/boot/dts/imx6sl.dtsi
> > @@ -529,9 +529,13 @@
> >  			};
> >  
> >  			gpc: gpc@020dc000 {
> > -				compatible = "fsl,imx6sl-gpc", "fsl,imx6q-gpc";
> > +				compatible = "fsl,imx6sl-gpc";
> 
> This change will break function imx_gpc_init(), which looks up
> "fsl,imx6q-gpc" even on imx6sl.

Sorry, I'll drop this change.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
