From: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/3] dts: socfpga: Add bindings for Altera SoC SDRAM
 controller
Date: Tue, 8 Apr 2014 09:29:50 -0500
Message-ID: <1396967390.23349.15.camel@dinh-ubuntu>
References: <1396907649-20212-1-git-send-email-tthayer@altera.com>
	 <1396907649-20212-2-git-send-email-tthayer@altera.com>
	 <20140408133818.GB16054@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140408133818.GB16054-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2014-04-08 at 15:38 +0200, Steffen Trumtrar wrote:
> Hi!
> 
> On Mon, Apr 07, 2014 at 04:54:07PM -0500, tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org wrote:
> > From: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> > 
> > Addition of the Altera SDRAM controller bindings and device
> > tree changes to the Altera SoC project.
> > 
[snip]
> > +
> > +Required properties:
> > +- compatible : "altr,sdr-ctl", "syscon";
> > +                Note that syscon is invoked for this device to support the FPGA
> > +		bridge driver, EDAC driver and other devices that share the
> > +		registers.
> > +- reg : Should contain 1 register ranges(address and length)
> 
> I haven't really thought this through, but why would the FPGA bridge driver
> access the sdram controller? For releasing the resets in fpgaportrst ? Or is
> there more?

Hi Steffan. No, not for resets. We need to enable the FPGA to SDRAM
path. Our SDRAM controller allows FPGA master access to the SDRAM.

> Wouldn't it be more appropriate to represent those bits as a reset-controller to
> some hypothetical IP core driver?
> Then you could have something like
> 
> 	hps2fpga@c0000000 {
> 		ipcore@0 {
> 			resets = <&sdr 1>;
> 			reset-names = "foo";
> 			resets = <&rst 96>;
> 			reset-names = "bar";
> 			(...)
> 		};
> 
> 		ipcore@1000 {
> 			resets = <&rst 96>;
> 			reset-names = "baz";
> 			(...)
> 		};
> 	};
> 
> And you would always have the correct bridges released out of reset for your
> IP core. Does the FPGA bridge driver do more? I think that is basically it.
> Where we maybe could run into problems though is the early_init stuff.
> 
> I think syscon is nice for some things, but we should try not to overuse it.

Understood. In this case, syscon seems to be appropriate.
> 
> Regards,
> Steffen
> 
> > +Example:
> > +	sdrctl@ffc25000 {
> > +		compatible = "altr,sdr-ctl", "syscon";
> > +		reg = <0xffc25000 0x1000>;
> > +	};
> > diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
> > index df43702..6ce912e 100644
> > --- a/arch/arm/boot/dts/socfpga.dtsi
> > +++ b/arch/arm/boot/dts/socfpga.dtsi
> > @@ -676,6 +676,11 @@
> >  			clocks = <&l4_sp_clk>;
> >  		};
> >  
> > +		sdrctl@ffc25000 {
> > +			compatible = "altr,sdr-ctl", "syscon";
> > +			reg = <0xffc25000 0x1000>;
> > +		};
> > +
> >  		rstmgr@ffd05000 {
> >  			compatible = "altr,rst-mgr";
> >  			reg = <0xffd05000 0x1000>;
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
