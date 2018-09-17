From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: sun8i: dts: drop A64 HDMI PHY
 fallback compatible from R40 DT
Date: Mon, 17 Sep 2018 16:54:52 +0200
Message-ID: <20180917145452.ewfuqkrxjjosbawd@flea>
References: <20180907072234.48282-1-icenowy@aosc.io>
 <20180907072234.48282-6-icenowy@aosc.io>
 <20180910142354.5ldexkvnan6ohz4x@flea>
 <1926288.mXGsSvSKgU@jernej-laptop>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ujjjku5u3trhfpa5"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBR4A77OAKGQEFI56Q7I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1926288.mXGsSvSKgU@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ujjjku5u3trhfpa5
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 10, 2018 at 04:32:30PM +0200, Jernej =C5=A0krabec wrote:
> Dne ponedeljek, 10. september 2018 ob 16:23:54 CEST je Maxime Ripard=20
> napisal(a):
> > On Fri, Sep 07, 2018 at 03:22:34PM +0800, Icenowy Zheng wrote:
> > > The R40 HDMI PHY seems to be different to the A64 one, the A64 one
> > > has no input mux, but the R40 one has.
> > >=20
> > > Drop the A64 fallback compatible from the HDMI PHY node in R40 DT.
> > >=20
> > > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > > ---
> > >=20
> > >  arch/arm/boot/dts/sun8i-r40.dtsi | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >=20
> > > diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi
> > > b/arch/arm/boot/dts/sun8i-r40.dtsi index ffd9f00f74a4..5f547c161baf
> > > 100644
> > > --- a/arch/arm/boot/dts/sun8i-r40.dtsi
> > > +++ b/arch/arm/boot/dts/sun8i-r40.dtsi
> > > @@ -800,8 +800,7 @@
> > >=20
> > >  		};
> > >  	=09
> > >  		hdmi_phy: hdmi-phy@1ef0000 {
> > >=20
> > > -			compatible =3D "allwinner,sun8i-r40-hdmi-phy",
> > > -				     "allwinner,sun50i-a64-hdmi-phy";
> > > +			compatible =3D "allwinner,sun8i-r40-hdmi-phy";
> >=20
> > If you could use the A64 phy before, you can still use it now.
>=20
> Not exactly. Given that we don't know how to switch between HDMI PHY cloc=
k=20
> parents on A64 (if it is actually connected at all, there is no informati=
on=20
> about that in manual and AW didn't answered our questions, despite asking=
 them=20
> through different channels), A64 compatible will be associated with quirk=
,=20
> which will tell that only one clock parent is usable.
>=20
> However, R40 HDMI PHY has definetly two clock parents, as it was tested b=
y me=20
> and Icenowy and we know how to switch between them without issues.=20
> Technically, we could have A64 compatible there, but that would mean only=
=20
> single PHY parent is considered instead of two.

The DT change above would mean that you can't operate the R40 phy in
the same way than the A64's. From what you're telling me now, this
isn't exactly what is going on: you can operate the R40 phy just like
the A64: with a single PLL instead of two. You operate in a degraded
and non-optimal mode, but it still works.

And it's exactly what the DT is already saying.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--ujjjku5u3trhfpa5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlufwDsACgkQ0rTAlCFN
r3QWaA//dPrmhPFXEjb96GM60VBvSnsdszdH8uRdbbz3VtOabA8Uf25Zs9kBoemE
UYXS9GyHNaQnt9CEgRUJPZfLh8t480eXVIVD4U5whNXhjEYui6OXJnYgYjOrDGPX
Br2YQxTkWPZ+JoaSbKMZsqe4fYUlSwkG6i4h+zioMudRTFmwqhUsf8DuBYkmGiL6
AjLnflWl+wt7EoIhUXk4KYEjBZuhWBp+TdQzS4MybVjP21AcjJZYx4jbZWGdtYtD
TECZQV5QysUZZALTcxKj4zztN63K6yOyfFCua6IRI5FjoNATw23ZWMuwWsr/ne9d
ELEPxeI00swW/24mcmQ3EEL+Lvl3DXu3sQBUE91tj5AQbXYhNwDsuYm/gtQrhBV/
7ZZqFSNWs8f1wQ0nt4UA/FYObPEZHWP2qPuMoHR+AjKh/Vk6LsCI9HmHv2cddIqY
e4mz1AwMe8iclk640i2H4xOOqdIwEtEWG1cHAW50sO8RqtjVBr3LVn6N3kEHPHLW
leWFSXCFPLbun7N3jxGduRQEZVdLLG8+IWbewYXvHzt/uNDVwZ7+dvBc2wQCxmvq
xICwqWzKr9dwsNQEz8DDB6jvOvVhNsrRkbgkzYzQHihzo4LKTRchjF4EJ6G5qC9V
FJCE188MzuTaE4202hN/ztOka+VdOmzu32KMOgHIvafwpq/6AKc=
=MnaS
-----END PGP SIGNATURE-----

--ujjjku5u3trhfpa5--
