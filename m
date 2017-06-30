From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: aspeed: g4: Add USB functions to pinctrl
 bindings
Date: Fri, 30 Jun 2017 10:43:16 +0930
Message-ID: <1498785196.5203.9.camel@aj.id.au>
References: <20170627021214.23323-1-andrew@aj.id.au>
         <20170627021214.23323-2-andrew@aj.id.au>
         <1498535619.3651.29.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-J5t6610CdQ0yWCH/97E/"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498535619.3651.29.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, ryan_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-J5t6610CdQ0yWCH/97E/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-06-26 at 22:53 -0500, Benjamin Herrenschmidt wrote:
> On Tue, 2017-06-27 at 11:42 +0930, Andrew Jeffery wrote:
> > The AST2400 contains several USB controllers:
> >=20
> > * USB 1.1 Host Controller
> > * USB 2.0 Host Controller
> > * Combined USB 2.0 Virtual Hub and USB 1.1 HID Controller
>=20
> There's also a USB1.1 HID-only device-controller, but it's a legacy
> piece of IP that we may never support.

Yes, I'll fix that - there's a block diagram in the datasheet that
suggests they're combined, but the memory map says otherwise. I'll
separate them out in the commit message.

>  It might be worth mentioning its
> existence and Ryan might want it supported in the bindings at least no
> ?

Unless I've missed something this just amounts to a change in the
commit message, both above to split the Hub/HID description and below
in the table to say "HID" instead of just "Device". The bindings as
they stand in this patch completely describe the mux behaviour for USB
as documented in the datasheet's Multifunction Pins Mapping and Control
table.

>=20
> > Pins for three ports are routed to the three controllers such that:
> >=20
> > * Port 1 is a dedicated USB 1.1 host port
> > * Port 2 is shared between the USB 1.1 host and HID controllers
> > * Port 3 is shared between the USB 2.0 host and Hub controllers
> >=20
> > As the pins for port 1 are fixed function there is no associated mux
> > function or group described in the bindings. Ports 2 and 3 are muxed as
> > above, and the table below describes the mapping between pinmux functio=
n
> > names and ports:
> >=20
> > Port=C2=A0=C2=A0| USB Version=C2=A0=C2=A0| USB Mode=C2=A0=C2=A0| Mux Fu=
nction
> > ------|--------------|-----------|-------------
> > 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0| Host=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| -
> > 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0| Host=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| USB1=
1H2
> > 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0| Device=C2=A0=C2=A0=C2=A0=C2=A0| USB11D1

                           ^~~~~~
                           Should be "HID" for clarity

Cheers,

Andrew

> > 3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 2.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0| Host=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| USB2=
H1
> > 3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 2.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0| Device=C2=A0=C2=A0=C2=A0=C2=A0| USB2D1
> >=20
> > > > Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
> > ---
> > =C2=A0Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt | 5 =
+++--
> > =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.t=
xt b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
> > index ca01710ee29a..09142dab47db 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
> > +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
> > @@ -69,8 +69,9 @@ PWM1 PWM2 PWM3 PWM4 PWM5 PWM6 PWM7 RGMII1 RGMII2 RMII=
1 RMII2 ROM16 ROM8 ROMCS1
> > =C2=A0ROMCS2 ROMCS3 ROMCS4 RXD1 RXD2 RXD3 RXD4 SALT1 SALT2 SALT3 SALT4 =
SD1 SD2 SGPMCK
> > =C2=A0SGPMI SGPMLD SGPMO SGPSCK SGPSI0 SGPSI1 SGPSLD SIOONCTRL SIOPBI S=
IOPBO SIOPWREQ
> > =C2=A0SIOPWRGD SIOS3 SIOS5 SIOSCI SPI1 SPI1DEBUG SPI1PASSTHRU SPICS1 TI=
MER3 TIMER4
> > -TIMER5 TIMER6 TIMER7 TIMER8 TXD1 TXD2 TXD3 TXD4 UART6 USBCKI VGABIOS_R=
OM VGAHS
> > -VGAVS VPI18 VPI24 VPI30 VPO12 VPO24 WDTRST1 WDTRST2
> > +TIMER5 TIMER6 TIMER7 TIMER8 TXD1 TXD2 TXD3 TXD4 UART6 USB11D1 USB11H2 =
USB2D1
> > +USB2H1 USBCKI VGABIOS_ROM VGAHS VGAVS VPI18 VPI24 VPI30 VPO12 VPO24 WD=
TRST1
> > +WDTRST2
> > =C2=A0
> > =C2=A0aspeed,ast2500-pinctrl, aspeed,g5-pinctrl:
> > =C2=A0
--=-J5t6610CdQ0yWCH/97E/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZVaWtAAoJEJ0dnzgO5LT5bccP/2do0ciuUgP0lUih1s/+jGFv
W0hQ3D9yeVa0JM7yTEoHiIkcZsXw6hoyfJgd8ux68i8hZ53bnXQH3fr6Uo6KJD50
SzFG+t4RJ2jA52A/ewvaosacVrR4BDTQdDVBuCPp1Tw81qWmxPi8/Ar2sKgEddcZ
lPM8U7/+USnKR+Cv/CbxkEgOO2ML3QKBBO3u9od+xN6CJ/U8rgUfJKOeETdppu6j
tNajUQbeHvyIgRAGJ6Tg1XWWRVyBa49bzEbwsIr3wvGAA/mIlLra5q1RBvc26pjx
VfzbbMxWWJ2aIF2e3ItAV+3PHhkDaNv819PRi2Cf1VH+bqiW2rWyDAbV7r8EyRcA
f3hFn9tsCKdbIBX/AY8yhNnjIUIdEo3CtO0rT73LBSdFL+9z7TMd4v4jYc5QPQbT
V1bTcmpNgMinOq3AlOvjfq6Dn+KyNo1Cp3/J9ul6Aa4wIaj1/lvkDNXbAYPNIutG
d0DffZwIbMQt9qDB8lXsdVy1rbSXbBtSh9SvCPYtp3CmWyl0QpFkYrlze73+oH91
07f4OmqhbQP3CTm6OG0M5Zu0yhSD4U799LgmrI4nhb/dOdCXPWhiV1GuY48f7i5j
/McUhltXjFeXbprifkvraBLJZIbjN5w38rYwGEh4XxVBAU8diwfgUPJD0kZ44v8Y
bFSsdhuAxpGrTfkMdIbW
=k4yG
-----END PGP SIGNATURE-----

--=-J5t6610CdQ0yWCH/97E/--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
