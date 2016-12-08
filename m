From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH v3 4/6] mfd: dt: Add bindings for the Aspeed LPC Host
 Controller (LHC)
Date: Thu, 08 Dec 2016 22:38:26 +1030
Message-ID: <1481198906.3112.4.camel@aj.id.au>
References: <20161206025321.1792-1-andrew@aj.id.au>
         <20161206025321.1792-5-andrew@aj.id.au>
         <CACPK8XfuZ14Ud3Kginut7f0-_-UjTB-=Pma-9WwNecF93k0Ktg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-3Dr7ZSlHC7l36VekEiIU"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACPK8XfuZ14Ud3Kginut7f0-_-UjTB-=Pma-9WwNecF93k0Ktg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-3Dr7ZSlHC7l36VekEiIU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-12-08 at 12:42 +1030, Joel Stanley wrote:
> > On Tue, Dec 6, 2016 at 1:23 PM, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org> wrote:
> > The LPC bus pinmux configuration on fifth generation Aspeed SoCs depend=
s
> > on bits in both the System Control Unit and the LPC Host Controller.
> >=20
> > The Aspeed LPC Host Controller is described as a child node of the
> > LPC host-range syscon device for arbitration of access by the host
> > controller and pinmux drivers.
> >=20
> > > > Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
> > ---
> > =C2=A0.../devicetree/bindings/mfd/aspeed-lpc.txt=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 22 ++++++++++++++++++++++
> > =C2=A01 file changed, 22 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Doc=
umentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > index a97131aba446..9de318ef72da 100644
> > --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > > > @@ -109,3 +109,25 @@ lpc: lpc@1e789000 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> > =C2=A0};
> >=20
> > +Host Node Children
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +LPC Host Controller
> > +-------------------
> > +
> > +The Aspeed LPC Host Controller configures the Low Pin Count (LPC) bus =
behaviour
> > +between the host and the baseboard management controller. The register=
s exist
> > +in the "host" portion of the Aspeed LPC controller, which must be the =
parent of
> > +the LPC host controller node.
> > +
> > +Required properties:
> > +- compatible:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0"aspeed,ast2500-lhc";
>=20
> Can you remind me why this binding doesn't cover the ast2400?

Partly that we haven't yet needed the LHC for the AST2400.

Mostly that I overlooked it.

If there are other problems with series I'll address this issue, but if
not we can add it when we need it down the track.

Andrew

>=20
> Cheers,
>=20
> Joel
>=20
> > +- reg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0contains offset/length value of the =
LHC memory
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0region=
.
> > +
> > +Example:
> > +
> > > > +lhc: lhc@20 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D "aspeed,ast25=
00-lhc";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg =3D <0x20 0x24 0x48 0x8>=
;
> > +};
> > --
> > 2.9.3
> >=20
--=-3Dr7ZSlHC7l36VekEiIU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYSU06AAoJEJ0dnzgO5LT5wvUQAK0QlkMewBtFa3YJOtJ4G7n5
C6YARdhQyF7544dR5lg3S1UDTyxb29kQ0n9cimKoCFuL1gY5ias8MpnzIGZbdlko
daMD39x8/kXuZAvTNC+p2cn0nPKnsXBbcjU2LTL980DVWWpBNS4FZ9qfw1X1N1/Q
L5vXeMLJNTze8aJsoPfI/c9ccALUvp8h0JY0WFdqqPI9m4AoMEdQ7eSC3tCN/GR4
Az+1fibOQj+iBVWrxupALQTifwWJlKcfQZnPKr2PGC67hvwKm72se4VLo2mr8Sib
qgx/LJ7kPZHYdeAQqWuRlTkF9coW4mmsf1iAY1/U4JrpR2HzBtzomdI8Evdksfuo
mh8al6Rh24v348zZoOwBksGJHPHzkumRDlgHgvfQayPgBQA0CyaSK8YtJk0Xdn7r
UhZ2ZsFb2zyAsu45nJwDEZ/aecJogJ/IuLBuHNZVwpevOrtH66H1e66N+d4U0gFo
sPpzGMBVBtDzOawYazos6j4RrIvt+j6n9xCC1V6DJB3B0fo3RpTtYiu7Y/rRL6uL
YkuI5ZQbo7kphfazgp5zQCxYVM5TQ8FqeJVZitbTOOdnaVlrHWMTpcbCyAwE6OKd
wkfBVTT9RH2WmnPtpGBJ4WXzPXQdvseqbmeADi+3jwFpI6l6nV79FUg9br+wu3VZ
3zWmb0QElnjnEBM64Xp2
=AhjT
-----END PGP SIGNATURE-----

--=-3Dr7ZSlHC7l36VekEiIU--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
