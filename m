From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 0/7] primecell: make correct clock parsing possible
Date: Tue, 11 Feb 2014 13:59:02 +0000
Message-ID: <20140211135902.GA12476@e106331-lin.cambridge.arm.com>
References: <1392118632-11312-1-git-send-email-mark.rutland@arm.com>
 <20140211123356.GH26684@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140211123356.GH26684-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 11, 2014 at 12:33:56PM +0000, Russell King - ARM Linux wrote:
> On Tue, Feb 11, 2014 at 11:37:05AM +0000, Mark Rutland wrote:
> > These patches attempt to harmonize the bindings and the drivers with what's in
> > use today, in a backwards compatible fashion, relieving us of our present
> > Kafkaesque nightmare. Each peripheral's clock(s) are given explicit names which
> > can be used, though code will fall back to the existing behaviour if said names
> > are not provided. Additionally the currently unmet ordering requirement of
> > apb_pclk is dropped, given all existing that code requires this to be named
> > anyway.
> 
> The reason why these clocks ended up with NULL names was to force the
> issue that clocks shall not be named solely by their connection IDs,
> which was a major problem before DT.  Now that we have DT, I'm happier
> to reinstate the names, but I think we should just reinstate the names
> we had previously.  That should be in the git history.

Good to know, that sounds fine to me.

> 
> The down-side is those names are all in capitals - but they were named
> after the signal name(s) given in the Primecell documentation.

As long as we have standardised names I'm not too worried about which
case they happen to be in, and matching the documentation seems
sensible. The pl050 driver expects "KMIREFCLK" already, so it would be
in keeping with (as far as I can tell) the only Primecell driver
currently requesting a clock by name.

I'll prepare a v2 shortly.

Cheers,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
