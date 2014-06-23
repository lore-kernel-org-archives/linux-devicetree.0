From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Initial register settings in Device Tree?
Date: Mon, 23 Jun 2014 15:38:40 +0200
Message-ID: <9567058.OVFbhFdhBE@wuerfel>
References: <53A71474.7030704@tronnes.org> <4560059.E2lhedgi9o@wuerfel> <53A72E38.8040307@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53A72E38.8040307-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <notro-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 22 June 2014 21:27:52 Noralf Tr=F8nnes wrote:
> Den 22.06.2014 20:18, skrev Arnd Bergmann:
> > On Sunday 22 June 2014 19:37:56 Noralf Tr=F8nnes wrote:
> >> I see two possibilities:
> >> * add a special marker value to separate the registers, as I do no=
w
> >> * add a flag to indicate a register number. So far I've only seen =
8 and
> >> 16-bit register number widths: register 20h could thus be written =
as
> >> 10000020, 1000020, 100020 or 10020
> >>
> >> Example (skipped state changes from previous example):
> >> <100B1 01 2C 2D
> >>    100B2 01 2C 2D
> >>    100B3 01 2C 2D 01 2C 2D
> >>    100B4 07 C0 A2 02 84
> >>    100C1 C5 C2 0A 00
> >>    100C3 8A 2A
> >>    100C4 8A EE
> >>    100C5 0E
> >>    10020
> >>    10036 C0
> >>    1003A 05
> >>    100E0 0f 1a 0f 18 2f 28 20 22 1f 1b 23 37 00 07 02 10
> >>    100E1 0f 1b 0f 17 33 2c 29 2e 30 30 39 3f 00 07 03 10>
> >>
> >> Is this a viable solution?
> > We normally use high-level descriptions of the timings that the dri=
ver
> > then converts into register-level settings. See
> > Documentation/devicetree/bindings/video/display-timing.txt and
> > other files in that directory for how existing drivers handle this.
> >
> > 	Arnd
> >
> OK, that takes care of the timings. But what about power control, and=
=20
> gamma registers?
>
> The power registers usually have bitfields that map to voltages, fact=
ors=20
> (0.7x, 1x,..) and levels (low,medium,high).
>=20
> Should all these bitfiels have their own property in DT?
> For some controllers this would be 20+ properties.

In some cases, it can make sense to group several values into one
multi-cell property.

> Should the properties have the same name as the register and bitfield=
=20
> from the datasheet?
> st7735r,pwctr1-avdd
> st7735r,pwctr1-vrhp
> st7735r,pwctr1-vrhn
> st7735r,pwctr1-mode
>=20
> Should the value map directly to the bitfield or should a string be u=
sed?
> st7735r,pwctr1-avdd =3D <6> /* 5.1v - Power pin for analog circuits *=
/
> st7735r,pwctr1-avdd =3D "5.1"
>=20
> Or should each register have it's own property?
> st7735r,pwctr1 =3D <C5 C2 0A 00>

Each user-serviceable property should be abstract and use the normal
units that you'd expect to see in a data sheet: milivolts, nanoseconds,
etc. See if some other display controller already has picked names
for these properties, then use the same. If nobody has done this
before, try to use property names that would also make sense on a
different controller. If we get a couple of these, we can split out
the property parsing code into a separate helper module.

> The gamma registers have several values that control a resistor netwo=
rk=20
> that sets grayscale values.
> Would this suffice?
> st7735r,gamma-positive =3D <0f 1a 0f 18 2f 28 20 22 1f 1b 23 37 00 07=
 02 10>
> st7735r,gamma-negative =3D <0f 1b 0f 17 33 2c 29 2e 30 30 39 3f 00 07=
 03 10>
>
> Usually when buying these displays, they come with an initialization=20
> sequence.
> Having register values in the DT, a user will be up and running in=20
> minutes with a new display.
> If one has to read the datasheet and map the register values to=20
> bitfields and properties, it takes a lot of time and not the least, i=
t's=20
> error prone.

Can you describe how this works for arbitrary combinations of controlle=
rs
and displays? Are the initialization sequences specific to some control=
ler?

An alternative to listing all the settings in DT might be to have a lis=
t
of supported displays in the controller driver and pick the display
by name, but that only works if there are a small number of possible
displays that can be connected to each controller.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
