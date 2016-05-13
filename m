From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: clps711x: Add basic Cirrus Logic CDB89712 Development board
Date: Fri, 13 May 2016 15:41:11 +0200
Message-ID: <6057172.X40sTfvRlk@wuerfel>
References: <1463138788-5390-1-git-send-email-shc_work@mail.ru> <9407200.bOeiVUkGKT@wuerfel> <1463142623.38124260@f381.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463142623.38124260-rm3phx5KyK5sdVUOrk1QfQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 13 May 2016 15:30:23 Alexander Shiyan wrote:
> Hello.
>=20
> > =D0=9F=D1=8F=D1=82=D0=BD=D0=B8=D1=86=D0=B0, 13 =D0=BC=D0=B0=D1=8F 2=
016, 15:00 +03:00 =D0=BE=D1=82 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> >=20
> > On Friday 13 May 2016 14:26:28 Alexander Shiyan wrote:
> ...
> > > +	soc {
> > > +		#address-cells =3D <1>;
> > > +		#size-cells =3D <1>;
> > > +		compatible =3D "simple-bus";
> > > +		interrupt-parent =3D <&intc>;
> > > +		ranges;
> >=20
> > All child devices seem to be in the 0x80000000-0x90000000
> > range, maybe set the ranges property accordingly?
>=20
> I do not quite understand that you want to change here.

I meant using the ranges property to describe the bus addresses
without the 0x80000000 offset, like

	ranges =3D <0 0x8000000 0xc000>;

and then adapting the registers under the node to be based
on the bus address.


> > > +		clks: clks@80000000 {
> > > +			#clock-cells =3D <1>;
> > > +			compatible =3D "cirrus,clps711x-clk";
> > > +			reg =3D <0x80000000 0xc000>;
> > > +			startup-frequency =3D <73728000>;
> > > +		};
> ...
> > > +		intc: intc@80000000 {
> > > +			compatible =3D "cirrus,clps711x-intc";
> > > +			reg =3D <0x80000000 0x4000>;
> > > +			interrupt-controller;
> > > +			#interrupt-cells =3D <1>;
> > > +		};
> >=20
> > Better make the register ranges non-overlapping. This appears
> > to start at the same place as the 'clks' node.
>=20
> CLK driver uses:
> #define CLPS711X_SYSCON1 (0x0100)
> #define CLPS711X_SYSCON2 (0x1100)
> ...
> #define CLPS711X_PLLR (0xa5a8)
>=20
> IRQCHIP driver uses:
> #define CLPS711X_INTSR1 (0x0240)
> ...
> #define CLPS711X_INTSR2 (0x1240)
> ...
> #define CLPS711X_INTMR3 (0x2280)
>=20
> So there is no way to do any else.

It sounds like what you have is a large system controller that
has registers everywhere. Could you use syscon to access the
individual registers instead?

> > > +		porta: gpio@80000000 {
> > > +			compatible =3D "cirrus,clps711x-gpio";
> > > +			reg =3D <0x80000000 0x1 0x80000040 0x1>;
> > > +			gpio-controller;
> > > +			#gpio-cells =3D <2>;
> > > +		};
> > > +
> > > +		portb: gpio@80000001 {
> > > +			compatible =3D "cirrus,clps711x-gpio";
> > > +			reg =3D <0x80000001 0x1 0x80000041 0x1>;
> > > +			gpio-controller;
> > > +			#gpio-cells =3D <2>;
> > > +		};
> > > +
> > > +		portc: gpio@80000002 {
> > > +			compatible =3D "cirrus,clps711x-gpio";
> > > +			reg =3D <0x80000002 0x1 0x80000042 0x1>;
> > > +			gpio-controller;
> > > +			#gpio-cells =3D <2>;
> > > +			status =3D "disabled";
> > > +		};
> > > +
> > > +		portd: gpio@80000003 {
> > > +			compatible =3D "cirrus,clps711x-gpio";
> > > +			reg =3D <0x80000003 0x1 0x80000043 0x1>;
> > > +			gpio-controller;
> > > +			#gpio-cells =3D <2>;
> > > +		};
> >=20
> > These are all just single bytes. My guess is that there is
> > actually one IP block that contains all the gpios, not
> > four identical blocks.
>=20
> These is a 8-bit registers with different properties, which parses in=
 the
> GPIO driver depending of alias (GPIO count, inverted logic etc.).

The alias should not influence the interpretation of the registers.
If each byte in there behaves differently, it would be better to
have separate "compatible" strings instead. I still don't see why
you can't just have one device node for all the registers and
then create multiple gpio_chip instances from that though.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
