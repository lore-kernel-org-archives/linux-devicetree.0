From: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: clps711x: Add basic Cirrus Logic CDB89712
 Development board
Date: Sun, 15 May 2016 09:07:48 +0300
Message-ID: <20160515090748.05db9e6cdff743f26bd6c1fb@mail.ru>
References: <1463138788-5390-1-git-send-email-shc_work@mail.ru>
	<9407200.bOeiVUkGKT@wuerfel>
	<1463142623.38124260@f381.i.mail.ru>
	<6057172.X40sTfvRlk@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6057172.X40sTfvRlk@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 13 May 2016 15:41:11 +0200
Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:

> On Friday 13 May 2016 15:30:23 Alexander Shiyan wrote:
> > Hello.
> >=20
> > > =F0=D1=D4=CE=C9=C3=C1, 13 =CD=C1=D1 2016, 15:00 +03:00 =CF=D4 Arn=
d Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> > >=20
> > > On Friday 13 May 2016 14:26:28 Alexander Shiyan wrote:
> > ...
=2E..
> > > > +		clks: clks@80000000 {
> > > > +			#clock-cells =3D <1>;
> > > > +			compatible =3D "cirrus,clps711x-clk";
> > > > +			reg =3D <0x80000000 0xc000>;
> > > > +			startup-frequency =3D <73728000>;
> > > > +		};
> > ...
> > > > +		intc: intc@80000000 {
> > > > +			compatible =3D "cirrus,clps711x-intc";
> > > > +			reg =3D <0x80000000 0x4000>;
> > > > +			interrupt-controller;
> > > > +			#interrupt-cells =3D <1>;
> > > > +		};
> > >=20
> > > Better make the register ranges non-overlapping. This appears
> > > to start at the same place as the 'clks' node.
> >=20
> > CLK driver uses:
> > #define CLPS711X_SYSCON1 (0x0100)
> > #define CLPS711X_SYSCON2 (0x1100)
> > ...
> > #define CLPS711X_PLLR (0xa5a8)
> >=20
> > IRQCHIP driver uses:
> > #define CLPS711X_INTSR1 (0x0240)
> > ...
> > #define CLPS711X_INTSR2 (0x1240)
> > ...
> > #define CLPS711X_INTMR3 (0x2280)
> >=20
> > So there is no way to do any else.
>=20
> It sounds like what you have is a large system controller that
> has registers everywhere. Could you use syscon to access the
> individual registers instead?

There are several problems:
- The syscon driver must be initialized before any other devices,
  including the interrupt controller and clk/clocksource subsystems.
- A slight performance impact will be observed in the interrupt handler=
=2E
- SYSCON (regmap) is designed to use with equal the width of registers,
  while we need to use different widths (8/16/32) for some subsystems.

--=20
Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
