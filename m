From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 0/2] DT updates for Cubox-i
Date: Tue, 17 Jun 2014 16:15:17 +0100
Message-ID: <20140617151517.GL23430@n2100.arm.linux.org.uk>
References: <20140617134016.GK23430@n2100.arm.linux.org.uk> <20140617135919.GG8860@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140617135919.GG8860@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 17, 2014 at 09:59:20PM +0800, Shawn Guo wrote:
> On Tue, Jun 17, 2014 at 02:40:16PM +0100, Russell King - ARM Linux wrote:
> > Shawn,
> > 
> > These are two updates to the Cubox-i which I'd prefer to get into -rc.
> > They were omitted from the merge window because their dependent changes
> > were not merged, but have now been merged.
> > 
> > The only real functional change for the Cubox-i in this set is that it
> > is now possible to control the front panel LED.  The other patch is
> > solely about moving some DT configuration to where it belongs.
> > 
> > Can we please get these in?
> 
> Okay, I will send them together with the fixes I queued for -rc.

Thanks.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
