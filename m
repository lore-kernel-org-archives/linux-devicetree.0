From: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH RESEND 1/1] ARM: dts: AM33XX: Add LCDC info into am335x-evm
Date: Wed, 26 Jun 2013 17:13:26 -0500
Message-ID: <20130626221326.GA11798@uda0270506>
References: <1372105967-26669-1-git-send-email-bparrot@ti.com>
 <1372143043.4488.50.camel@coredoba.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1372143043.4488.50.camel-oeorZI7ca7Kzss5je/eYgj6d/iTt6vPThC4ANOJQIlc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jan =?iso-8859-1?Q?L=FCbbe?= <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 25, 2013 at 08:50:43AM +0200, Jan L=FCbbe wrote:
> On Mon, 2013-06-24 at 15:32 -0500, Benoit Parrot wrote:
> > Add LCDC device node in DT for am33xx
> > Add LCDC and Panel info in DT for am335x-evm
> =

> > diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335=
x-evm.dts
> > index 0423298..40d7a3f 100644
> > --- a/arch/arm/boot/dts/am335x-evm.dts
> > +++ b/arch/arm/boot/dts/am335x-evm.dts
> > @@ -102,6 +136,16 @@
> >  				reg =3D <0x48>;
> >  			};
> >  		};
> > +
> > +		lcdc {
> > +			compatible =3D "ti,am33xx-tilcdc";
> > +			reg =3D <0x4830e000 0x1000>;
> > +			interrupt-parent =3D <&intc>;
> > +			interrupts =3D <36>;
> > +			ti,hwmods =3D "lcdc";
> > +			ti,allow-non-reduced-blanking-modes;
> > +			status =3D "okay";
> > +		};
> >  	};
> >  =

> >  	vbat: fixedregulator@0 {
> >  /include/ "tps65910.dtsi"
> > diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.d=
tsi
> > index 8e1248f..05b2c4a 100644
> > --- a/arch/arm/boot/dts/am33xx.dtsi
> > +++ b/arch/arm/boot/dts/am33xx.dtsi
> > @@ -415,5 +415,14 @@
> >  			#size-cells =3D <1>;
> >  			status =3D "disabled";
> >  		};
> > +
> > +		lcdc: lcdc@4830e000 {
> > +			compatible =3D "ti,am33xx-tilcdc";
> > +			reg =3D <0x4830e000 0x1000>;
> > +			interrupt-parent =3D <&intc>;
> > +			interrupts =3D <36>;
> > +			ti,hwmods =3D "lcdc";
> > +			status =3D "disabled";
> > +		};
> >  	};
> >  };
> =

> am335x-evm.dts includes am33xx.dtsi, so you shouldn't need to provide
> all SoC-specific settings again in the board dts. The way it's done
> here, you get two nodes ("lcdc" and "lcdc@4830e000") for the same HW
> module.
> =

> It seems you just need status and maybe
> ti,allow-non-reduced-blanking-modes (for which I didn't see either the
> binding or the driver code yet).
> =


Thanks for the feedback. I did miss these cut-paste induced mistake.
I'll update the patch and resubmit.

> Regards,
> Jan
> -- =

> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> =
