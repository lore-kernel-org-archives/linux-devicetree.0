From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH v3 4/6] mfd: dt: Add bindings for the Aspeed LPC Host
 Controller (LHC)
Date: Tue, 13 Dec 2016 15:10:00 +1030
Message-ID: <1481604000.3112.30.camel@aj.id.au>
References: <20161206025321.1792-1-andrew@aj.id.au>
         <20161206025321.1792-5-andrew@aj.id.au>
         <20161212153018.lfkicwknikfbzdlf@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-qq3Tfj7JwU7kAgTTQ9z1"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161212153018.lfkicwknikfbzdlf@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-qq3Tfj7JwU7kAgTTQ9z1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-12-12 at 09:30 -0600, Rob Herring wrote:
> On Tue, Dec 06, 2016 at 01:53:19PM +1100, Andrew Jeffery wrote:
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
> > > > =C2=A0	};
> > =C2=A0};
> > =C2=A0
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
> > > > +- compatible:		"aspeed,ast2500-lhc";
> > > > +- reg:			contains offset/length value of the LHC memory
> > +			region.
>=20
> How many regions? Looks like 2.

Yes, two. The first region is registers configuring various LPC host
controller properties. The second region is for configuring the LPC
serial IRQ trigger modes.

Would you like me to say as much in the patch? It's not a completely
clear split of functionality as other serial IRQ properties are also
described in the first region. Maybe describing the datasheet's
register names for the regions (LHCR[0-8] for the first, LHCR[A-B] for
the second) would help?

Cheers,

Andrew

>=20
> > +
> > +Example:
> > +
> > > > +lhc: lhc@20 {
> > > > +	compatible =3D "aspeed,ast2500-lhc";
> > > > +	reg =3D <0x20 0x24 0x48 0x8>;
> > +};
> > --=C2=A0
> > 2.9.3
> >=20
--=-qq3Tfj7JwU7kAgTTQ9z1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYT3ugAAoJEJ0dnzgO5LT53UcQAKPkMw1FYSnd5ExxSfher5i0
Stfou/u6b5IcMwQDxJPXY3iNVxzFHfpvrrxx3fIGELJy45ZtgOq83J1V1+aIOWO/
2MmEmuBfU9Hc7AEaQeIM5kkVvXZRQJGr8RT3u7tnn2af9YbWRpjbwIvhXkZ5rVwf
NM+qL/yBdDl15uplAerPXgutbcBJgQRNtmcsxOhok0Y2fABcNcwx75dMC3ss8U7E
WURYhfCI2tF9tkebi8/4jK0TqtQ94lBxqStNBB8uTDs2dk57IN7PEBrMU1su+Y1M
UIbIcWJf302+3a2ktHW6+k8zEdBM4LyA8r3pbjbK2GzVTQ6aGx90h2iMpk/+cwM9
wO0Smtm7obWXwr2bd1x8kRR3S/5fAkQskkIv3b+f3Bsk13t+N08e62FlQ/bDDMek
rOrDM0oqTx3JSvPDZXEc/KXmYgltIkKDfFBzNlzlWPsfIv6ZRqsYiS7uaOTe0p0L
f03Md2cjgYpcahZUG48XR3l+ojfoB9qC1ZoIBjXmezF0SCtsbnw8TeESiabP2rot
xP4B9Z2IN2W6lX0m+19vZc7hSQew4fo1omPEJ5RrzMTS+F/yDZZGPeYsNd3NXjxi
ZDzQlmwGWddMD62Klvr7pp8+1moapZyBcwVZrqFF27jL7+r9iM1ow9mzutv69NzS
DLbGLk9cZ2otX7fRtDp8
=2X6s
-----END PGP SIGNATURE-----

--=-qq3Tfj7JwU7kAgTTQ9z1--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
