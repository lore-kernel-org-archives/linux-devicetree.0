From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 0/6] SolidRun Hummingboard/Cubox-i DT updates
Date: Mon, 25 Aug 2014 14:29:32 +0800
Message-ID: <20140825062930.GA6928@dragon>
References: <20140823091058.GO30401@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140823091058.GO30401-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Aug 23, 2014 at 10:10:58AM +0100, Russell King - ARM Linux wrote:
> Here's a set of patches updating the Cubox-i/Hummingboard DT files.
> 
> The first two are fairly important fixes, so should at least go in
> for -rc kernels.
> 
> The SPDIF patch is something which could go in -rc as well as it's a
> cosmetic patch, changing the name displayed in (eg) pulseaudio for the
> SPDIF output from the developer-centric "imx-spdif" to "Integrated SPDIF".

I will sent the first 3 for -rc.  But I second Iain's comment that the
first patch should have a better commit log to explain why it's an
important fix.

> 
> Patch 4 updates the Hummingboard support as SolidRun now have a Dual
> version of this platform, which needs imx6q.dtsi instead of imx6dl.dtsi,
> and also has mSATA support.

Though it's mostly just a DTS split, the diff stat looks too scary to
be a material of -rc.

> 
> Patch 5 adds the mSATA support for the Dual version of the Hummingboard.
> 
> Patch 6 is the first patch which breaks something on the initial version
> of the Hummingboard, aka Carrier1, specifically the IrDA receiver.  In
> hindsight, we should not have used the name "Hummingboard" for the
> Carrier1.  The Carrier1 is obsolete, and people are being encouraged to
> dispose of the C1 hardware.
> 
> Out of these, I think it would be worth getting the first five patches
> in for 3.17 (even though we're in -rc), but patch 6 should certainly
> wait for the next merge window.

Patches 4 ~ 6 are not fixes in any way, so I prefer to queue them for
the next merge window.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
