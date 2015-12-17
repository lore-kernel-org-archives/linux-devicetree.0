From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 0/8] Raspberry Pi 2 support.
Date: Thu, 17 Dec 2015 11:26:35 +0100
Message-ID: <3363412.hB2NWDcUxf@wuerfel>
References: <1450310115-22163-1-git-send-email-eric@anholt.net> <874mfhsyem.fsf@eliezer.anholt.net> <567276F9.5070903@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <567276F9.5070903-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 17 December 2015 09:48:57 Stefan Wahren wrote:
> Am 17.12.2015 um 01:37 schrieb Eric Anholt:
> > Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:
> >
> >> On Wednesday 16 December 2015 15:55:07 Eric Anholt wrote:
> >>> This is a major rewrite of the previous Raspberry Pi 2 submission.
> >>> SMP support is now included, and the DT includes are cleaned up to
> >>> avoid massive duplication.
> >>>
> >>> The branch (based on 4.4-rc5, to get the USB regression fixes) can be
> >>> found at:
> >>>
> >>> https://github.com/anholt/linux/tree/bcm2836-4.4
> >> Looks all good to me, but when we get the pull request, I'd strongly
> >> prefer to have that based on -rc3 or earlier.
> >>
> >> What commit is the USB regression fix you refer to above? Is that in a
> >> branch that is -rc3 based? Maybe you can rebase the changes on top
> >> of that branch, to minimize the amount of backmerges?
> > Top 4 commits of drivers/usb/dwc2 for 4.4-rc5 (possibly not all of them
> > are required, but it's what I've been using).  
> >
> 
> Unfortunately all 4 of them are required:
> 
> d0464bcf12af ("usb: dwc2: Make PHY optional")
> 
> 6c2dad69163f ("usb: dwc2: Return errors from PHY")
> 
> 8aa90cf2a286 ("usb: dwc2: make otg clk optional")
> 
> f74875dc3613 ("usb: dwc2: fix kernel oops during driver probe")

Ok, that's good. They are all based on -rc1, so you you can just rebase
on top of f74875dc3613, which was pulled by GregKH.

> But they should apply to -rc3 too.

Please don't rebase them, use the commits that got merged, otherwise we'd
get duplicate commits and that would be worse than the backmerge.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
