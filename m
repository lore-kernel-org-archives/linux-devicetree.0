From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 03/10] pinctrl: sunxi: add A20 support to
 A10 driver
Date: Fri, 5 May 2017 21:49:01 +0200
Message-ID: <20170505194901.w3el6zucqo6mcoab@lukather>
References: <20170504135006.16483-1-icenowy@aosc.io>
 <20170504135006.16483-4-icenowy@aosc.io>
 <20170504140220.26kguf3trz7ocylv@lukather>
 <83062089-19CD-4805-A6DC-2C25D75621FF@aosc.io>
 <20170504144152.34yzk424aqrizmbu@lukather>
 <52C75207-6F41-4B3F-8953-F4F040358792@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="36cjllx3bwydmei2"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBOFOWPEAKGQE657LTXA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <52C75207-6F41-4B3F-8953-F4F040358792-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--36cjllx3bwydmei2
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2017 at 10:45:11PM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2017=E5=B9=B45=E6=9C=884=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=881=
0:41:52, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=
=B0:
> >On Thu, May 04, 2017 at 10:03:26PM +0800, Icenowy Zheng wrote:
> >>=20
> >>=20
> >> =E4=BA=8E 2017=E5=B9=B45=E6=9C=884=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=8810:02:20, Maxime Ripard
> ><maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0:
> >> >On Thu, May 04, 2017 at 09:49:59PM +0800, Icenowy Zheng wrote:
> >> >>  static const struct of_device_id sun4i_a10_pinctrl_match[] =3D {
> >> >> -	{ .compatible =3D "allwinner,sun4i-a10-pinctrl", },
> >> >> +	{
> >> >> +		.compatible =3D "allwinner,sun4i-a10-pinctrl",
> >> >> +		.data =3D (void *)PINCTRL_SUN4I_A10
> >> >> +	},
> >> >> +	{
> >> >> +		.compatible =3D "allwinner,sun7i-a20-pinctrl",
> >> >> +		.data =3D (void *)PINCTRL_SUN7I_A20
> >> >> +	},
> >> >>  	{}
> >> >>  };
> >> >
> >> >This means you're going to have two drivers probing for the same
> >> >device: this driver, and the old one. This is not ok, and probably
> >> >introduces some corner cases.
> >>=20
> >> The A20 driver is dropped in the next commit.
> >
> >Yes, and that is an issue for bisectability. Anyone that will checkout
> >between those two commits will have a broken kernel, and that is not
> >ok. Any commit should be in a working state.
>=20
> Squash them together?

I would simply remove the A20's def_bool in that patch.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--36cjllx3bwydmei2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZDNctAAoJEBx+YmzsjxAg4xIQAJrW1cgOCctAhrWT1Aohwg00
gwTeYSOfFUWMGtkQMCw7hkbgcKxQ/dWrEiYCXMSvQ+ej6JJ+Kcac68qxgrO1DHlT
1pXuqPC9lJxnKUDKG+bAFlph1Cyp5+C4g33OHORFXqEpWMkkc2WxhQCglN+VGUx/
Rzt2ROZOjJT2wXQWyzllUM+TtitpB3ODHuDwumrYr/S+nY2r7La8wM9wSpF0RePK
sVzHYwJwQh74I4ltW/FDmOXL6eibRFLV5iV2rQuzOctrcfSvcNbZDL0VQNueO33M
oN/5CMe6iGDy0o8BIB9HWSYIZSGo1YvSpeZ6tVdv0Lh2KDI8Pgl0Pu31x6bgV5e1
gpwBh/HM0cQheQ8a0umKKBYv8hAxgubfib5OBYHvb0xer/fiB/7sOQ/B7FvS7lx/
AACc9LT1JSGYQUTYaGvBZD903ghVZz5kk/fX90ddf5Jw+AMyETEV+6B8Nc+TF0BS
j/j900tca+P53qCRmrq29sjeduZEk+eQ6wwOmmQqvNnOaUoj8Ur6lgsooc/Sp3LI
DhBcYxtnye8GeeJSMHsVuXJb2h/aHI1OnFSsIG4yIMBEzlnApd7y9N5phpxj9Bc/
KtAyN1Ajb/HFHVUzSfP0L0b9s7bf+kG/azNjDJM63OVMnYC3klRpZw0+yzjdiYkr
eGVdNViF03Vi+Gv3qKhQ
=yVMq
-----END PGP SIGNATURE-----

--36cjllx3bwydmei2--
