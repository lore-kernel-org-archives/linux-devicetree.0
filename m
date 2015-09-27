From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH v2 2/3] gpiolib: gpiod_hog remove separate name argument
Date: Sun, 27 Sep 2015 16:34:52 +0200
Message-ID: <20150927143452.GF19121@pengutronix.de>
References: <1440920686-6892-1-git-send-email-mpa@pengutronix.de>
 <1440920686-6892-3-git-send-email-mpa@pengutronix.de>
 <CACRpkdZrXEXtkPpgtrcjqP5jD+M0UOj5Wj69o4zYJQKihsY6Xg@mail.gmail.com>
 <20150924063931.GS32203@pengutronix.de>
 <CACRpkdb4EoA_oBSF46eYAZ-fbTEqaf=Q+wsGyKyrQZ9KB2B7cQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/QKKmeG/X/bPShih"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdb4EoA_oBSF46eYAZ-fbTEqaf=Q+wsGyKyrQZ9KB2B7cQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, Chris Read <chrisrfq@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org


--/QKKmeG/X/bPShih
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2015 at 10:52:55AM -0700, Linus Walleij wrote:
> On Wed, Sep 23, 2015 at 11:39 PM, Markus Pargmann <mpa@pengutronix.de> wr=
ote:
>=20
> >> - Fixed that but noted that it just alters the call to gpiod_hog()
> >>   in of_gpiochip_scan_hogs(), there is a local const char *name that
> >>   should be removed too.
> >
> > The local const char *name is temporarily used in
> > of_gpiochip_scan_hogs() to get the name from DT and assign it to the
> > descriptor:
> >         desc =3D of_parse_own_gpio(np, &name, &lflags, &dflags);
> >         ...
> >         else
> >                 desc->name =3D name;
>=20
> OK the problem is that this series is dependent on the
> named GPIOs series. I want this series to stand alone,
> because this series is not as controversial, and I want to
> merge these initvals first.

OK, I think I won't get this completely independent but it shouldn't be
a problem to get this before the controversial patches. Will do that.

Best Regards,

Markus

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--/QKKmeG/X/bPShih
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWB/6MAAoJEEpcgKtcEGQQg/YP/i66SDuiBZyA+U8N69eXvJjU
uM4sUMyvdxgCYdZlBzfmTVTjvaO9Jy6+h9HXaXBhN+52lrG1wpoF+T3EB/gEGWy3
nZmNWFlq5amJ1QjE1Jh5mOewM1+YetEYM0P2mXsGL7g63SUUat+0FahYIWJICJ60
CatBIFH6xIUCY88QMjMUQm5APXkcTFk1rXpnxMwwe/r1H6KRzV/uxA3//OCDQwOc
LPJoaVtz1OINzq6pVTuK2SbkYXPqQYp8IiH5agMVsVjPScHiOiaRBzhokVJVrj2q
MM7ZSfyxfeTsEWYg6GMNOfv7614sO4V9yqNTfswotgjhCIKsSczB2NvkCrMOpIaP
tz8IzlSaLVfjAYKW++FI1TFc0XrLIc6fgcr0ZUMKeC5cg8yfnicac6Uzr1Qs8nNI
k1p53tCeiixSXfA7ypggUbFDAYT/BMVW7c4oHVfILYXSmghTkgqUPwBat0pyAQBV
JML6eHq+WJTGKonYQe7JP/f5AWxKxilSV2Lxo5i6//Y8xbyRb5RbLfxOsz1Upaav
pLDfWeBD0E1jNMqwMCdsikQ4nSSljsJ7lhc4ZtCk74u6l/e1UMinwiA/QduDmsRK
EksJOEKNl9wy8kZpaN6ltYd8IFCKUKukckQH1med5/cDQk1cqSnm+DtthhAj88zu
KQzKqL8WVaULWriji0yl
=yY5W
-----END PGP SIGNATURE-----

--/QKKmeG/X/bPShih--
