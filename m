From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 0/6] SolidRun Hummingboard/Cubox-i DT updates
Date: Mon, 25 Aug 2014 19:19:30 +0800
Message-ID: <20140825111929.GC6928@dragon>
References: <20140823091058.GO30401@n2100.arm.linux.org.uk>
 <20140825062930.GA6928@dragon>
 <20140825095106.GS30401@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140825095106.GS30401-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 25, 2014 at 10:51:07AM +0100, Russell King - ARM Linux wrote:
> On Mon, Aug 25, 2014 at 02:29:32PM +0800, Shawn Guo wrote:
> > On Sat, Aug 23, 2014 at 10:10:58AM +0100, Russell King - ARM Linux wrote:
> > > Here's a set of patches updating the Cubox-i/Hummingboard DT files.
> > > 
> > > The first two are fairly important fixes, so should at least go in
> > > for -rc kernels.
> > > 
> > > The SPDIF patch is something which could go in -rc as well as it's a
> > > cosmetic patch, changing the name displayed in (eg) pulseaudio for the
> > > SPDIF output from the developer-centric "imx-spdif" to "Integrated SPDIF".
> > 
> > I will sent the first 3 for -rc.  But I second Iain's comment that the
> > first patch should have a better commit log to explain why it's an
> > important fix.
> 
> I still have no answer for that, so I suggest dropping it until Rabeeh
> can write a better commit log.

Okay.  #2 and #3 applied on imx/fixes, and #4~6 applied on imx/dt.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
