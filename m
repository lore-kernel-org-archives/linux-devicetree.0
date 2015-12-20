From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 1/2 v2] ARM: l2x0: make it possible to disable outer sync
 from DT
Date: Sun, 20 Dec 2015 16:11:49 +0000
Message-ID: <20151220161149.GU8644@n2100.arm.linux.org.uk>
References: <1450126385-14517-1-git-send-email-linus.walleij@linaro.org>
 <20151220033924.GK9883@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151220033924.GK9883@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Dec 19, 2015 at 09:39:24PM -0600, Rob Herring wrote:
> On Mon, Dec 14, 2015 at 09:53:05PM +0100, Linus Walleij wrote:
> > According to commit 2503a5ecd86c002506001eba432c524ea009fe7f
> > "ARM: 6201/1: RealView: Do not use outer_sync() on ARM11MPCore
> > boards with L220" Some PB11MPCore RealView core tiles have broken
> > outer_sync.
> > 
> > We got rid of the custom barriers from the machine by disabling
> > outer sync, but that was just for the boardfile case. We have
> > to be able to do the same in the device tree case.
> > 
> > Since __l2c_init() is cloning and copying the L2C vtable,
> > we pass an argument to this function to optionally numb
> > the outer sync operation if desired, before initializing
> > the cache.
> > 
> > After this we can set up the cache correctly on the RealView
> > PB11MPCore. This was tested on a PB11MPCore known to have the
> > issue. Before this, spurious crashes would occur if we try to
> > set up the cache properly, after this it boots rock solid.
> > 
> > Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> > Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> > ChangeLog v2->v3:
> > - Update description, reference Catalins initial commit in the
> >   commit blurb.
> > ---
> >  Documentation/devicetree/bindings/arm/l2cc.txt |  3 +++
> >  arch/arm/mm/cache-l2x0.c                       | 13 ++++++++++---
> >  2 files changed, 13 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/l2cc.txt b/Documentation/devicetree/bindings/arm/l2cc.txt
> > index d181b7c4c522..416864e9dc92 100644
> > --- a/Documentation/devicetree/bindings/arm/l2cc.txt
> > +++ b/Documentation/devicetree/bindings/arm/l2cc.txt
> > @@ -75,6 +75,9 @@ Optional properties:
> >    specified to indicate that such transforms are precluded.
> >  - arm,parity-enable : enable parity checking on the L2 cache (L220 or PL310).
> >  - arm,parity-disable : disable parity checking on the L2 cache (L220 or PL310).
> > +- arm,outer-sync-disable : disable the outer sync operation on the L2 cache.
> > +  Some core tiles, especially ARM PB11MPCore have a faulty L220 cache that
> > +  will randomly hang unless outer sync operations are disabled.
> 
> This is also useful on Highbank as a feature where all DMA goes thru the 
> ACP port and there should not be a need to flush the L2 write buffer. 
> But I already optimized the performance critical register accesses with 
> _relaxed variants, so it doesn't really matter. I don't think any other 
> platform cares, therefore:
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Thanks.

It would be nice to have a faster response though, because Linus Walleij
put this in the patch system on the 15th December, and I could have
applied it without waiting for DT people to comment.  The good thing is
that I _have_ the patch system, which allows me to temporarily ignore
patches (provided I remember) while people chew the cud on stuff like
this.

However, I'd _much_ rather prefer the authors to hold back the patches
until they get "approved" *before* sending them there, so I don't have
to find and remember to track the status of each patch on the mailing
list.

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
