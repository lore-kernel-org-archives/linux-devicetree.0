From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: hummingboard: add support for BT/wifi
	where fitted
Date: Wed, 18 Jun 2014 14:44:59 +0100
Message-ID: <20140618134459.GD32514@n2100.arm.linux.org.uk>
References: <E1WufIK-0007yl-2k@rmk-PC.arm.linux.org.uk> <20140618133345.GL8860@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140618133345.GL8860@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 18, 2014 at 09:33:46PM +0800, Shawn Guo wrote:
> On Wed, Jun 11, 2014 at 10:58:12AM +0100, Russell King wrote:
> > Some microsom modules have BT/Wifi fitted for the Hummingboard.  Enable
> > support for this additional hardware; where it isn't present, the SDIO
> > BT/Wifi will not be detected, and no harm will come from having these
> > additional devices enabled.
> > 
> > Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> 
> Applied this one, thanks.

Probably not a good idea - which is why I didn't re-send it with my
recent set.  As we /still/ don't have the story sorted six months down
the line for handling the power and reset signals for the module, we
still don't know what the final bindings are going to look like.

I've more or less given up any hope of that situation being resolved;
I'm intending to maintain Olof's patches locally, publishing them for
Cubox-i users.  At this point, I really couldn't care less what the
dysfunctional mainline kernel community does in respect of this very
necessary feature.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
