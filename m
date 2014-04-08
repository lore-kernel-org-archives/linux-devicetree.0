From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/3] dts: socfpga: Add bindings for Altera SoC SDRAM
 controller
Date: Tue, 8 Apr 2014 16:33:27 +0200
Message-ID: <20140408143327.GC16054@pengutronix.de>
References: <1396907649-20212-1-git-send-email-tthayer@altera.com>
 <1396907649-20212-2-git-send-email-tthayer@altera.com>
 <20140408133818.GB16054@pengutronix.de>
 <1396967390.23349.15.camel@dinh-ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1396967390.23349.15.camel@dinh-ubuntu>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Cc: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 08, 2014 at 09:29:50AM -0500, Thor Thayer wrote:
> On Tue, 2014-04-08 at 15:38 +0200, Steffen Trumtrar wrote:
> > Hi!
> > 
> > On Mon, Apr 07, 2014 at 04:54:07PM -0500, tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org wrote:
> > > From: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> > > 
> > > Addition of the Altera SDRAM controller bindings and device
> > > tree changes to the Altera SoC project.
> > > 
> [snip]
> > > +
> > > +Required properties:
> > > +- compatible : "altr,sdr-ctl", "syscon";
> > > +                Note that syscon is invoked for this device to support the FPGA
> > > +		bridge driver, EDAC driver and other devices that share the
> > > +		registers.
> > > +- reg : Should contain 1 register ranges(address and length)
> > 
> > I haven't really thought this through, but why would the FPGA bridge driver
> > access the sdram controller? For releasing the resets in fpgaportrst ? Or is
> > there more?
> 
> Hi Steffan. No, not for resets. We need to enable the FPGA to SDRAM
> path. Our SDRAM controller allows FPGA master access to the SDRAM.
>

Yes. But what you have to do to enable the path is let the FPGA port you use
out of reset. And that is it as far as I can see. The rest happens in the
bitstream. Or is there more to enable the path?
The FPGA2SDRAM bridge is the one I didn't use as of yet, so if I miss something
please elaborate.

> > Wouldn't it be more appropriate to represent those bits as a reset-controller to
> > some hypothetical IP core driver?
> > Then you could have something like
> > 
> > 	hps2fpga@c0000000 {
> > 		ipcore@0 {
> > 			resets = <&sdr 1>;
> > 			reset-names = "foo";
> > 			resets = <&rst 96>;
> > 			reset-names = "bar";
> > 			(...)
> > 		};
> > 
> > 		ipcore@1000 {
> > 			resets = <&rst 96>;
> > 			reset-names = "baz";
> > 			(...)
> > 		};
> > 	};
> > 
> > And you would always have the correct bridges released out of reset for your
> > IP core. Does the FPGA bridge driver do more? I think that is basically it.
> > Where we maybe could run into problems though is the early_init stuff.
> > 
> > I think syscon is nice for some things, but we should try not to overuse it.
> 
> Understood. In this case, syscon seems to be appropriate.

I'm not convinced yet.

Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
