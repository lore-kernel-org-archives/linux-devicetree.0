From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH v2 3/6] mfd: dt: Add bindings for the Aspeed LPC Host
 Controller (LPCHC)
Date: Fri, 04 Nov 2016 14:15:57 +1030
Message-ID: <1478231157.27396.72.camel@aj.id.au>
References: <1478097481-14895-1-git-send-email-andrew@aj.id.au>
         <1478097481-14895-4-git-send-email-andrew@aj.id.au>
         <CACPK8XezumurK6TStNhmTnHdhoJuZBzkJrS3iOArKz1tf1=nLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-tXmS+8vWBUT1mhXC1E52"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACPK8XezumurK6TStNhmTnHdhoJuZBzkJrS3iOArKz1tf1=nLw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-tXmS+8vWBUT1mhXC1E52
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-11-04 at 09:36 +1030, Joel Stanley wrote:
> On Thu, Nov 3, 2016 at 1:07 AM, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org> wrote:
> >=20
> > The Aspeed LPC Host Controller is presented as a syscon device to
> > arbitrate access by LPC and pinmux drivers. LPC pinmux configuration on
> > fifth generation SoCs depends on bits in both the System Control Unit
> > and the LPC Host Controller.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
> > ---
> > =C2=A0Documentation/devicetree/bindings/mfd/aspeed-lpchc.txt | 17 +++++=
++++++++++++
> > =C2=A01 file changed, 17 insertions(+)
> > =C2=A0create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-l=
pchc.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpchc.txt b/D=
ocumentation/devicetree/bindings/mfd/aspeed-lpchc.txt
> > new file mode 100644
> > index 000000000000..792651488c3d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpchc.txt
> > @@ -0,0 +1,17 @@
> > +* Device tree bindings for the Aspeed LPC Host Controller (LPCHC)
> I had to check the data sheet for that acronym. They call the
> registers LHC. I somewhat prefer that name, but if you're happy with
> it as-is then that's fine.

I had an internal debate about this. I figured LPCHC might give a bit
more context to the acronym. I'm not unhappy with it but I wouldn't
claim I'm happy either. I will change it to LHC since you somewhat
prefer it, and it better aligns with the datasheet.

>=20
> I assume this is not an issue on the g4/ast2400?

Correct, we don't have the issue of pinmux needing to reach into the
LPC IO space on the AST2400. I don't think we've had anything else to
drive us to looking at the host controller space there, so I wasn't
going to add it to the bindings yet.

>=20
> >=20
> > +
> > +The LPCHC registers configure LPC behaviour between the BMC and the ho=
st
> > +system. The LPCHC also participates in pinmux requests on g5 SoCs and =
is
> > +therefore considered a syscon device.
> > +
> > +Required properties:
> > +- compatible:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0"aspeed,ast2500-lpchc", "syscon"
> > +- reg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0contains offset/length value of the =
LPCHC memory
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0region=
.
> > +
> > +Example:
> > +
> > +lpchc: lpchc@1e7890a0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D "aspeed,ast25=
00-lpchc", "syscon";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg =3D <0x1e7890a0 0xc4>;
> Where's the 0xc4 come from? I can see 9 registers, which would mean
> the length should be 0x24?

Yes, it should be 0x24. I can't even claim that 'c' is near '2'. Thanks
for catching that.

Andrew

>=20
> Cheers,
>=20
> Joel
--=-tXmS+8vWBUT1mhXC1E52
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYHAR1AAoJEJ0dnzgO5LT5ERkP/R1u6OEeqrLaQHd2h9UYOQoo
q2zD2IICzEYXaM/hs+1zufwvxLOkHNwzL/pU3AydrAKPETc+02PPwflW38ACgu+w
CYqnLwn5cRnvjEUUBNPYP1KblgrAWwYUs4QvUBx5R1pBIyu69k+zrCscJRhznxXQ
42Yls860sD4F/KU6umkeTXVcKx3Nx6l0J9RgHV5f05hT2m9TlHGy1U8vjV6d1yPt
sPWFYlhP2MbuCN9p5eVAD8P4mB5ZNVGdKetAhk87szXmL1SOgF5B+bGkuy8x1yPd
uSLFbWz7YweYVY/Ui+WBLvY1oVqYtCzkn+KBqp9MS2FlaeprI4LSnmFqDyKkq0uB
1zU2wzgeVsHcuDFntvddR5d+R4gA4I7NjXO6wj6PZuRho1ph06hejveS5Qy7ltiG
GDp5PFhfvPP0fdu8xOOHxzwI7drgSApFhEIKIQzeiyAg/8U37jsSR8Ll5VjubeX/
hJ6axd6GOp5seAhQFb91mUj25P5FnfmWxBBROn/ajUL9fr+XHMR/vc/ygMXlEFqK
W3ipLPnrX50leepfVpHbz4oMOdNH4uDkY6s83p9urfaMaULCgSRj5iPQMi1a8lIB
WFd2L8awFytuiqw3uYoXXk7hu0DksOyS6sNgfmuSS0swgUlPrPU9Me6qHikn09Sn
zeVNScB+e1pbYrnQ3822
=GVxM
-----END PGP SIGNATURE-----

--=-tXmS+8vWBUT1mhXC1E52--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
