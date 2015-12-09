From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Wed, 9 Dec 2015 09:50:05 +0100
Message-ID: <20151209085005.GR11966@pengutronix.de>
References: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
 <1858873.xsM5XHIlTX@wuerfel>
 <CALAqxLU4y6+AsKcZSPUaJQ2BgcAWoT8OPcYO6EYfOz+-7r8FTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CALAqxLU4y6+AsKcZSPUaJQ2BgcAWoT8OPcYO6EYfOz+-7r8FTQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Android Kernel Team <kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 08, 2015 at 04:13:35PM -0800, John Stultz wrote:
> On Tue, Dec 8, 2015 at 1:52 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> >
> > On Tuesday 08 December 2015 13:29:22 John Stultz wrote:
> >
> > > diff --git a/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
> > > index 5183d18..ee5dcb7 100644
> > > --- a/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
> > > +++ b/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
> > > @@ -282,6 +282,15 @@
> > >                       };
> > >               };
> > >
> > > +             reboot_reason: reboot_reason@2a03f65c {
> > > +                     compatible              = "reboot_reason";
> >
> > This is not a good compatible string. There should generally be a vendor
> > name associated with it (use "linux," if nothing else, and you should have
> > '-' instead of '_'.
> 
> 
> Ack.
> 
> 
> >
> >
> > > +                     reg                     = <0x2A03F65C 0x4>;
> >
> > This may easily conflict with the device it is part of. We should have
> > non-overlapping register areas in general. For the example you are
> > looking at, which register block is this?
> 
> So Bjorn says its IMEM, but I was assuming it was just a reserved
> magic phys addr from the bootloader.
> 
> Ideally I'm hoping to use this same driver for another device, which
> plans to reserve a page from memory that the bootloader won't clear.
> 
> 
> > > +/* Types of reasons */
> > > +static enum {
> > > +     NONE,
> > > +     BOOTLOADER,
> > > +     RECOVERY,
> > > +     OEM,
> > > +     MAX_REASONS
> > > +} __maybe_unused reason_types;
> >
> > The variable seems to always be unused, not just "__maybe_unused". Maybe remove it?
> 
> 
> Yea. I initially just had the empty enum, but the compiler was giving
> me "useless class storage specifier in empty declaration" warnings. So
> I added a variable to it, but then I got unused variable warnings. So
> I ended up with this. :P
> 
> Is there a better way? Are enums for array indexes out of fashion?

They are not, but you have declared a variable (reason_types) which you
don't use. You probably meant to create a enum named reason_types, like
this:

enum reason_types {
	NONE,
	BOOTLOADER,
	RECOVERY,
	OEM,
	MAX_REASONS
};

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
