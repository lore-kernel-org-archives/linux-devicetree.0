From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 3/6] mfd: dt: Add bindings for the Aspeed LPC Host
 Controller (LPCHC)
Date: Tue, 22 Nov 2016 13:55:45 +1030
Message-ID: <1479785145.2503.20.camel@aj.id.au>
References: <1478097481-14895-1-git-send-email-andrew@aj.id.au>
         <1478097481-14895-4-git-send-email-andrew@aj.id.au>
         <20161118184437.GD19884@dell.home> <20161118184535.GE19884@dell.home>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-A5RHOKktLU8UOxvLUddw"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20161118184535.GE19884@dell.home>
Sender: linux-gpio-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, arnd@arndb.de
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--=-A5RHOKktLU8UOxvLUddw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-11-18 at 18:45 +0000, Lee Jones wrote:
> [Sending Arnd this time!]
>=20
> > Arnd,
> >=20
> > Do you have a preference?
> >=20
> > > The Aspeed LPC Host Controller is presented as a syscon device to
> > > arbitrate access by LPC and pinmux drivers. LPC pinmux configuration =
on
> > > fifth generation SoCs depends on bits in both the System Control Unit
> > > and the LPC Host Controller.
> > >=20
> > > > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > ---
> > > =C2=A0Documentation/devicetree/bindings/mfd/aspeed-lpchc.txt | 17 +++=
++++++++++++++
> >=20
> > Create a new directory in bindings/mfd called 'syscon'.
> >=20
> > Or perhaps 'bindings/syscon'.
> >=20

Sounds good to me. I'll wait for Arnd's feedback.

Note that this patch conflicts with some of the ideas I outlined in

https://www.spinics.net/lists/arm-kernel/msg543233.html

I sent it hoping to get some feedback on the approach to take for these
LPC-related bits. Did you have any suggestions? The problems with
hardware complexity are amplified by the fact that the datasheet is
only available under NDA, but I will do what I can to clarify.

> > > =C2=A01 file changed, 17 insertions(+)
> > > =C2=A0create mode 100644 Documentation/devicetree/bindings/mfd/aspeed=
-lpchc.txt
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpchc.txt b=
/Documentation/devicetree/bindings/mfd/aspeed-lpchc.txt
> > > new file mode 100644
> > > index 000000000000..792651488c3d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpchc.txt
> > > @@ -0,0 +1,17 @@
> > > +* Device tree bindings for the Aspeed LPC Host Controller (LPCHC)
> > > +
> > > +The LPCHC registers configure LPC behaviour between the BMC and the =
host
> > > +system. The LPCHC also participates in pinmux requests on g5 SoCs an=
d is
> > > +therefore considered a syscon device.
> > > +
> > > +Required properties:
> > > > > > +- compatible:		"aspeed,ast2500-lpchc", "syscon"
> > > > > > +- reg:			contains offset/length value of the LPCHC memory
> > > +			region.
> >=20
> > Why not just use a single tab, then you don't have to linewrap?

I'll clean that up.

Cheers,

Andrew

> >=20
> > > +Example:
> > > +
> > > > > > +lpchc: lpchc@1e7890a0 {
> > > > > > +	compatible =3D "aspeed,ast2500-lpchc", "syscon";
> > > > > > +	reg =3D <0x1e7890a0 0xc4>;
> > > +};
>=20
>=20
--=-A5RHOKktLU8UOxvLUddw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYM7q5AAoJEJ0dnzgO5LT5/AAQALId/kZGcu/TY+M/GaFcv8k3
9E+qbnXS7QMLa7mpReY2dlZGVtOvkXt1FHQrnbZPGN/KOKlIbhRYkQAWUuXcnGyT
Gnj3VjTReiLX4kSAv+UInD+cEH9kgL/mqWPV7t+++j9tCj+O4VGtQ5KetKpcC+It
6t8X1BOZCuT312Fv6v9GwpETp8+Zx5z+DNjFBZVKAaAzb0f1e1pO5bIEdBpA2Pjv
gZk9uk1XL7RiE0t/FW5z+WtSUeqpqD3mCO+vXHwccNMnHe20LVTJ4rPYTa8Zhh0o
Wl19j5WxelfZ5yJaVb4KEKFH55DkVPPFnd/Rn9w0Rmvz+LMzMwLOFSjhX597huD0
lKccG9Cdj0q2OK/QZAtRM72hkFnmPyR/qTcTq3YriGHqhk6cQW7u8K19qeXYVZ8Q
dls9RQOWH7KgUoGPyJU3DVZvpudFdSoNzag2a9BVzk4PzSat3SOPA0z5Oho9SRqw
PINTHEkfDZxFE75Zv/3vyOWnSVRrU+Cz2D2zWPhRMxGe/rDYrC9mz2MDD5lE8z9E
77rweUAMiLJ9McBzE7XX4dW33GLS2ZIP1C2fIYtZ/NwFkSxsP6dSvopn/M8BNmVK
eBjousDleqQ5PcH4IkkLyxNrV1rRY5F+Of0J0sgVoCcDXd0FjdZo48A74LTIgoYV
hER6i7afh7C5hFQwXv3+
=pak+
-----END PGP SIGNATURE-----

--=-A5RHOKktLU8UOxvLUddw--

