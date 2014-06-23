From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v7 1/2] video: ARM CLCD: Add DT support
Date: Mon, 23 Jun 2014 16:59:46 +0100
Message-ID: <1403539186.3804.46.camel@hornet>
References: <1403018494-10264-1-git-send-email-pawel.moll@arm.com>
	 <20140620170901.GA12059@leverpostej> <1403532837.3804.29.camel@hornet>
	 <CAL_Jsq+6SveWhzWPrtziTJ-tDOFaJV4sXO+r_CEhAZf=tQE6FA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+6SveWhzWPrtziTJ-tDOFaJV4sXO+r_CEhAZf=tQE6FA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2014-06-23 at 16:43 +0100, Rob Herring wrote:
> On Mon, Jun 23, 2014 at 9:13 AM, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org> wrote:
> > On Fri, 2014-06-20 at 18:09 +0100, Mark Rutland wrote:
> >> > +- clocks-names: should contain "clcdclk" and "apb_pclk"
> >>
> >> s/clocks-names/clock-names/
> >
> > Haha - it took quite a few patch revisions to spot this one, thanks!
> 
> Was this tested?

Yes it was. The typo sneaked in the documentation only, dts changes were
fine.

> >> > +- clocks: contains phandle and clock specifier pairs for the entries
> >> > +   in the clock-names property. See
> >> > +   Documentation/devicetree/binding/clock/clock-bindings.txt
> >> > +
> >> > +Optional properties:
> >> > +
> >> > +- arm,pl11x,framebuffer-base: a pair of two 32-bit values, address and size,
> >> > +   defining the framebuffer that must be used; if not present, the
> >> > +   framebuffer may be located anywhere in the memory
> >>
> >> The name is confusing: this is a base _and_ size.
> >
> > True. Can split it into two -base and -size or rename it into
> > framebuffer or video-memory.
> >
> >> When should this be used, and what is valid to point it at?
> >
> > When the hardware design determines the address the memory transactions
> > must be issued at. This is aimed at a situation (allegedly not
> > impossible) when the memory map from the CLCD's point of view is
> > different from the CPU's one (eg. the video memory is mapped at xxx for
> > the CPU and yyy for the CLCD).
> 
> Humm, that sounds like what dma-ranges is for.
> 
> >
> >> How does this play with memory carveouts (CMA, reserved-memory)?
> >
> > It doesn't, and wasn't intended to (the original version of the binding
> > was trying to do something like reserved-memory before it was defined),
> > but someone managed to convince me not to do this, if it's a "low level"
> > feature.
> >
> > I guess I can be re-convinced (again).
> 
> NAK on this property. Convinced?

Sure. Shame you weren't so clear in any of v3 to v6 nor in the
discussions around v2.

> If this is only theoretical, then just drop it for now.
> 
> >> > +- max-memory-bandwidth: maximum bandwidth in bytes per second that the
> >> > +   cell's memory interface can handle
> >>
> >> When should I set this, given it is optional?
> >
> > When there is a (significant) limitation of the bandwidth available for
> > the cell's memory interface. One will either be told by the soc guys or
> > will figure it out in the hard way, as we did :-(
> 
> What are you going to do with this information? b/w is a function of
> screen size and pixel depth. Are you going to refuse certain configs
> based on that? Seems like someone doing their own modes should know
> what they are doing and the limitations.
> 
> Again, drop it until there is a defined need for this.

Yes, there is. Use case: PL111 is wired up to a HDMI formatter, which
will take everything up to 1080p. This is what a DRM driver (what/if
it's ready) will get from the encoder driver (and rightly so). But the
chip interconnect limitations is make the chip being able to get 480p at
60Hz tops. 

Or do you want me to add a subnode with timings for all achievable modes
instead?

Pawel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
