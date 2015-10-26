From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2 2/3] regulator: arizona: Add regulator specific
 device tree binding document
Date: Mon, 26 Oct 2015 11:28:20 +0000
Message-ID: <20151026112820.GI10520@ck-lbox>
References: <1444916828-8965-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1444916828-8965-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20151022124449.GH8232@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151022124449.GH8232-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 22, 2015 at 01:44:49PM +0100, Mark Brown wrote:
> On Thu, Oct 15, 2015 at 02:47:07PM +0100, Charles Keepax wrote:
> 
> > +This document lists regulator specific bindings, see the primary binding
> > +document:
> > +  ../mfd/arizona.txt
> > +
> > +Required properties:
> > +
> > +  - AVDD-supply, DBVDD1-supply, CPVDD-supply : Power supplies for the device,
> > +    as covered in regulator.txt
> > +
> > +  - DBVDD2-supply, DBVDD3-supply : Additional databus power supplies (wm5102,
> > +    wm5110, wm8280, wm8998, wm1814)
> > +
> > +  - SPKVDDL-supply, SPKVDDR-supply : Speaker driver power supplies (wm5102,
> > +    wm5110, wm8280, wm8998, wm1814)
> > +
> > +  - SPKVDD-supply : Speaker driver power supply (wm8997)
> > +
> 
> I'd expect these to be on the MFD since they're (with the exception of
> AVDD which supplies the regulators IIRC) not part of the regulator
> component of the device and are core for bringing it online.

Yeah, fair enough I will move those back into the MFD part.

> 
> > +Optional properties:
> > +  - wlf,ldoena : GPIO specifier for the GPIO controlling LDOENA
> > +
> > +Optional subnodes:
> > +  - ldo1 : Initial data for the LDO1 regulator, as covered in
> > +    Documentation/devicetree/bindings/regulator/regulator.txt
> > +  - micvdd : Initial data for the MICVDD regulator, as covered in
> > +    Documentation/devicetree/bindings/regulator/regulator.txt
> 
> These are the properties for the regulator itself.
> 
> > +++ b/MAINTAINERS
> > @@ -11381,6 +11381,7 @@ W:	http://opensource.wolfsonmicro.com/content/linux-drivers-wolfson-devices
> >  S:	Supported
> >  F:	Documentation/hwmon/wm83??
> >  F:	Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> > +F:	Documentation/devicetree/bindings/regulator/arizona-regulator.txt
> >  F:	arch/arm/mach-s3c64xx/mach-crag6410*
> >  F:	drivers/clk/clk-wm83*.c
> >  F:	drivers/extcon/extcon-arizona.c
> 
> I'd suggest moving this to a separate patch which adds all the new files
> together to make it easier to merge things.

Yeah no problem with making that a seperate patch.

Thanks,
Charles
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
