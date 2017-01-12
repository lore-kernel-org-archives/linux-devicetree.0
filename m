From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH 4/5] ARM: dts: sunxi: add dtsi file for
 V3s SoC
Date: Thu, 12 Jan 2017 17:52:44 +0100
Message-ID: <20170112165244.js3qrgo2nbazycmn@lukather>
References: <20170111065638.uW1SQ7Kq@smtp3m.mail.yandex.net>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qxnx2rqhqsueymlf"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBZ7I33BQKGQEBVE4FYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170111065638.uW1SQ7Kq-jDEamKawf7I0PDqKvflMoHmW9unr2Ajn@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--qxnx2rqhqsueymlf
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 11, 2017 at 11:56:32AM +0800, Icenowy Zheng wrote:
>=20
> 2017=E5=B9=B41=E6=9C=8811=E6=97=A5 02:21=E4=BA=8E Maxime Ripard <maxime.r=
ipard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Tue, Jan 03, 2017 at 11:16:28PM +0800, Icenowy Zheng wrote:=20
> > > + uart0_pins_a: uart0@0 {=20
> > > + pins =3D "PB8", "PB9";=20
> > > + function =3D "uart0";=20
> > > + bias-pull-up;=20
> >
> > Why do you need a pullup here?=20
>=20
> I think TX needs one, but RX do not need.

That's (at best) board specific. So it belongs in the DTS if it's
truely needed.

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

--qxnx2rqhqsueymlf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYd7RcAAoJEBx+YmzsjxAglHsP/1iGJ4qSTY3ycawKuawt3Ia3
0Gk8MiC1+Vd9sy6p02hb3lVaF1zMMH3rXEmAAZSNt5tl+BTu+S9h75uV2t3iZmS3
JjjYLgPnU95IoG1mOGFqoDQieG/EeiADzLl9g1DyNlqJkAQWZw1yNHK+kF9k/sgc
fV5QAQtROl9UFB5vpN9zPeIWHwDheo/gfU+uvKRlWd8YbALSKZq8Lg7T63t5mcCC
pQfnYBJK22EGp0igcDxEn1sFqRpF/Y/mH5+lhexXo+9Leek7oauppDsBBgUJ3d3i
rbxD75j5+cwBzC69QUr0bebizO0YYKoTY4Hwd2KWyV4KN8Qq+uab7jbeNQ5PnRBY
iv6CoTj2xxFgFpBqvG8pCnhASVe7XTcMxCNmfwMiBhP11GXV4WXq8B1P5nh5YEpV
rUVDCNsTNuYDUozRc4oyT8KzOnXvmOYU2ETttweptWjUO3N4H7f/HgkN595cJPXO
68+uaqmhjZ/gMa2oyIhgmwWaksO8SApXoK291Z5/Jj8qFPaZxoScatxK4O0t36yM
aJ+8GBDEWjBp1UWQDHZYftqiDHzqXbIflHsABEMc0SIY17lsto3LxvmT5tZ+urZI
Hxhbj/lPwG/vtkaj4LGX5QXiqxQmW3ASON7WMEDvegyKwSL0yfng2DyWf9JjtA1+
ee73ZDJUxniBuiJq6onZ
=KBl8
-----END PGP SIGNATURE-----

--qxnx2rqhqsueymlf--
