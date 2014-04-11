From: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/3] dts: socfpga: Add bindings for Altera SoC SDRAM
 controller
Date: Fri, 11 Apr 2014 09:21:31 -0500
Message-ID: <1397226091.8304.5.camel@dinh-ubuntu>
References: <1396907649-20212-1-git-send-email-tthayer@altera.com>
	 <1396907649-20212-2-git-send-email-tthayer@altera.com>
	 <20140408133818.GB16054@pengutronix.de>
	 <1396967390.23349.15.camel@dinh-ubuntu>
	 <20140408143327.GC16054@pengutronix.de>
	 <CANk1AXR0bDENDV673M-AVXNWHmGuee5SGc+ZnPqdBdEBwJXQXQ@mail.gmail.com>
	 <CAL_JsqJRweynpCA7LMFU4wfa71XzjGC3b8H9XKJpogf5H93h_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJRweynpCA7LMFU4wfa71XzjGC3b8H9XKJpogf5H93h_A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: delicious quinoa <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2014-04-08 at 13:52 -0500, Rob Herring wrote:
> On Tue, Apr 8, 2014 at 11:02 AM, delicious quinoa
> <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Tue, Apr 8, 2014 at 9:33 AM, Steffen Trumtrar
> > <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> >> On Tue, Apr 08, 2014 at 09:29:50AM -0500, Thor Thayer wrote:
> >>> On Tue, 2014-04-08 at 15:38 +0200, Steffen Trumtrar wrote:
> >>> > Hi!
> >>> >
> >>> > On Mon, Apr 07, 2014 at 04:54:07PM -0500, tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org wrote:
> >>> > > From: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> >>> > >
> >>> > > Addition of the Altera SDRAM controller bindings and device
> >>> > > tree changes to the Altera SoC project.
> >>> > >
> >>> [snip]
> >>> > > +
> >>> > > +Required properties:
> >>> > > +- compatible : "altr,sdr-ctl", "syscon";
> >>> > > +                Note that syscon is invoked for this device to support the FPGA
> >>> > > +         bridge driver, EDAC driver and other devices that share the
> >>> > > +         registers.
> >>> > > +- reg : Should contain 1 register ranges(address and length)
> >>> >
> >>> > I haven't really thought this through, but why would the FPGA bridge driver
> >>> > access the sdram controller? For releasing the resets in fpgaportrst ? Or is
> >>> > there more?
> >>>
> >>> Hi Steffan. No, not for resets. We need to enable the FPGA to SDRAM
> >>> path. Our SDRAM controller allows FPGA master access to the SDRAM.
> >>>
> >>
> >> Yes. But what you have to do to enable the path is let the FPGA port you use
> >> out of reset. And that is it as far as I can see. The rest happens in the
> >> bitstream. Or is there more to enable the path?
> >> The FPGA2SDRAM bridge is the one I didn't use as of yet, so if I miss something
> >> please elaborate.
> >
> > Hi Steffen,
> >
> > The sdram controller is used by two drivers.  That's why we want to
> > specify "syscon" here.  The other driver is the FPGA bridge driver.
> > Its functionality is very separate from what this driver is doing (we
> > are not enabling the bridge in this driver; we are enabling the
> > monitoring and resetting the interrupt bit of the EDAC).  We wanted to
> > specify "syscon" her so that we don't have to have to change it for
> > the other driver.
> 
> But are there actually overlapping registers which are accessed by
> both drivers and need the protection of regmap?
> 
> Perhaps MFD is more appropriate than syscon?

Hi Rob,

We are accessing bits in the SDRAM Controller's Control register which
has other bits that configure the SDRAM controller. Since this main
control register may be accessed by other drivers (more likely for
reading the current SDRAM configuration setup than for writing), the
syscon still seems like an appropriate use.

Thor


> 
> Rob


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
