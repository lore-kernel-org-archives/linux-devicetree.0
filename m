From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 12/26] drm/sun4i: Add support for
 multiple DW HDMI PHY clock parents
Date: Fri, 18 May 2018 17:26:51 +0200
Message-ID: <20180518152651.lfymc3kj7npj5tww@flea>
References: <20180518094536.17201-1-jagan@amarulasolutions.com>
 <20180518094536.17201-13-jagan@amarulasolutions.com>
 <20180518100116.4bf2qcffg7ekxa7u@flea>
 <4909574.Q3IFWM0xt6@jernej-laptop>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tvit4m5thudok37l"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBRXB7PLQKGQEIONRZUA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <4909574.Q3IFWM0xt6@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--tvit4m5thudok37l
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 18, 2018 at 04:46:41PM +0200, Jernej =C5=A0krabec wrote:
> > And this is a bit sloppy, since if phy_clk_num =3D=3D 3, you won't try =
to
> > lookup pll-2 either.
>=20
> It is highly unlikely this will be higher than 2, at least for this HDMI =
PHY,=20
> since it has only 1 bit reserved for parent selection. But since I have t=
o fix=20
> it, I'll add ">=3D 2"

If we're only going to have two parents at most, ever, why don't we
had just a single other boolean. This would be less intrusive, and we
wouldn't have to check for those corner cases.

> BTW, I'll resend fixed version of this patch for my R40 HDMI series, sinc=
e=20
> there is nothing to hold it back, unlike for this.

Awesome, thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--tvit4m5thudok37l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlr+8LoACgkQ0rTAlCFN
r3RbhhAAiPiS0oBKrE4SXuEZWn62ARBw1jMOVxivZlxbDkKSK+fpfxr2hAVKYxtZ
nIpt5ribBWn98C2K5oqbwIg/Xino6lGKP3AGTKm6468rtHviVT5YnyRk5xSP1PRi
IDL9CdfCK+G5GMmC14Ht1OIxqenqQjPcT0UAkftjV+gkwPzipIVy7Tgff5Uz7BOk
wRaiMpxrc2DAa2B/xDdrQkwP+wkuXLkYR52NYBJMsQsxl69v/qjwaKK1svb1ewKm
qyi7Bebtfwh77scOWahjAIjCKInqqLn8uMYmoe/GqeH6TThyeDNBJTmyi8Eo3sxc
8YY1yvNc1aSfQ6ds8H0bNweRLxI3aigqLeRaPczL6pILNMXQOZciVAezqhtZ3U7P
b7wNfC4aoXdveVy60vLpTo2hWKQdgmixvV8VBILgvct4Zq1IJytet/7+mFvcL7Eh
VXJOCYNXy+VOser93hcWdKSouvAj5oBSD+f9Nhoi6iv8ezKeQBhXsMeyhe/7rhDt
fAIeLBPJtRyEoM8aMWYDmtCWj6jITYZ+ZOsbe0fCMVbJqsAHOQK7e8BSlcKceC81
Iw5Vi9Cbz/ZE4fADrt/HxlJy9o4WCqswPJBroq4s43gRXz8SYC3bq72+GrLojGp1
TX98j3eQKkYQDp3C3nVJS16JTF0TEb/907K2lSavyIhu4JmLl2M=
=AUyt
-----END PGP SIGNATURE-----

--tvit4m5thudok37l--
