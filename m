From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: hummingboard: Setup pwm lines
Date: Mon, 30 Mar 2015 11:54:03 +0800
Message-ID: <20150330035402.GM28410@dragon>
References: <E1YSWZL-0002Aw-B5@rmk-PC.arm.linux.org.uk>
 <1425379336.3146.38.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425379336.3146.38.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rabeeh Khoury <rabeeh-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 03, 2015 at 11:42:16AM +0100, Philipp Zabel wrote:
> > +&pwm3 {
> > +	status = "disabled";
> > +};
> > +
> > +&pwm4 {
> > +	status = "disabled";
> > +};
> 
> I wanted to point out these two are superfluous since pwm3/4 are
> disabled in the dtsi by default, but I just learned they aren't.
> 
> Should we add status = "disabled" to unusable (because not externally
> connected) PWMs, and if so, shouldn't that be done in the dtsi already?

Thanks Philipp for your patch "ARM: dts: imx6qdl: disable PWMs by
default".  Therefore I dropped pwm3/4 and applied the patch.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
