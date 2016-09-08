From: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/8] ARM: dts: bcm283x: Define standard pinctrl groups
 in the gpio node.
Date: Thu, 08 Sep 2016 09:48:48 +0200
Message-ID: <1473320928.6698.28.camel@redhat.com>
References: <1473244289-20728-1-git-send-email-kraxel@redhat.com>
         <1473244289-20728-2-git-send-email-kraxel@redhat.com>
         <1564766913.23457.026b1e4b-e35d-48e6-9394-7eeea0ff9add.open-xchange@email.1und1.de>
         <87bmzzr1bg.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87bmzzr1bg.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mi, 2016-09-07 at 11:50 -0700, Eric Anholt wrote:
> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:
> 
> > Hi Gerd,
> >
> >> Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> hat am 7. September 2016 um 12:31
> >> geschrieben:
> >> 
> >> 
> >> From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> >> 
> >> The BCM2835-ARM-Peripherals.pdf documentation specifies what the
> >> function selects do for the pins, and there are a bunch of obvious
> >> groupings to be made.  With these created, we'll be able to replace
> >> bcm2835-rpi.dtsi's main "set all of these pins to alt0" with
> >> references to specific groups we want enabled.
> >
> > on IMX/MXS platform it's unwanted to add all possible muxes in the dtsi file. So
> > i would suggest to add only the actually used muxes. That makes it easier to
> > maintain.
> 
> On the other hand, I find that having to go back to the docs for
> determining the fsels is worse than just verifying and defining them
> here all at once.

Agreeing here.  IMO it is nice to have them all even if unused for
documentation purposes.

> Maintaining has also gotten harder because our DTs
> are split across 32 and 64-bit ARM, so rpi3 changes that require adding
> one of these pinmux definitions back to the dtsi would require painful
> cross-branch merges.

It'll also easily cause merge conflicts.

cheers,
  Gerd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
