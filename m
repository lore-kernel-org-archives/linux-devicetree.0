From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 01/13 v2] ARM: add some L220 DT settings
Date: Mon, 16 Nov 2015 18:02:11 +0000
Message-ID: <20151116180210.GV8644@n2100.arm.linux.org.uk>
References: <1445521493-21509-1-git-send-email-linus.walleij@linaro.org>
 <20151116174825.GA14634@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151116174825.GA14634@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 16, 2015 at 11:48:25AM -0600, Rob Herring wrote:
> On Thu, Oct 22, 2015 at 03:44:53PM +0200, Linus Walleij wrote:
> > The RealView ARM11MPCore enables parity, eventmon and shared
> > override in the cache controller through its current boardfile,
> > but the code and DT bindings for the ARM L220 is currently
> > lacking the ability to set this up from DT. Add the required
> > bool parameters for parity and shared override, but keep
> > eventmon out of it: this should be enabled by the event
> > monitor code.
> > 
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> > ChangeLog v1->v2:
> > - Drop event monitor setup.
> > - Support both parity enable and disable: could be useful.
> > ---
> >  Documentation/devicetree/bindings/arm/l2cc.txt | 10 ++++++----
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Thanks Rob, this has been in the patch system since the 27th October,
but as DT people hadn't acked it, I didn't take it into my tree.  We're
now too late for this merge window, so it's going to wait for the 4.5
window.

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
