From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH v2 2/3] gpiolib: gpiod_hog remove separate name argument
Date: Thu, 24 Sep 2015 08:39:31 +0200
Message-ID: <20150924063931.GS32203@pengutronix.de>
References: <1440920686-6892-1-git-send-email-mpa@pengutronix.de>
 <1440920686-6892-3-git-send-email-mpa@pengutronix.de>
 <CACRpkdZrXEXtkPpgtrcjqP5jD+M0UOj5Wj69o4zYJQKihsY6Xg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uX7BrQs69PbBafpd"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZrXEXtkPpgtrcjqP5jD+M0UOj5Wj69o4zYJQKihsY6Xg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, chrisrfq@gmail.com, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org


--uX7BrQs69PbBafpd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 21, 2015 at 04:28:48PM -0700, Linus Walleij wrote:
> On Sun, Aug 30, 2015 at 12:44 AM, Markus Pargmann <mpa@pengutronix.de> wr=
ote:
>=20
> > The gpio name is now stored in the gpio descriptor, so we can simply use
> > that instead of an argument to the function.
> >
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
>=20
> Several problems with this patch:
>=20
> - Does not apply to v4.3-rc1

Yes, a bit older already, will rebase it.

> - Fixed that but noted that it just alters the call to gpiod_hog()
>   in of_gpiochip_scan_hogs(), there is a local const char *name that
>   should be removed too.

The local const char *name is temporarily used in
of_gpiochip_scan_hogs() to get the name from DT and assign it to the
descriptor:
	desc =3D of_parse_own_gpio(np, &name, &lflags, &dflags);
	...
	else
		desc->name =3D name;

> - Looking at of_get_gpio_hog() it is unclear to me that .name
>   is set in the gpio_desc as desired. Please check this.
>=20
>   Crucial code looks like this:
>=20
>     if (name && of_property_read_string(np, "line-name", name))
>         *name =3D np->name;

of_get_gpio_hog() only parses the properties of the DT. It does not
assign any properties to the descriptor itself. So I kept it this way
and added the code for assignment to of_gpiochip_scan_gpios.

>=20
>   i.e. is the line-name really propagated to gpiod->name?
>   Are you sure you have tested this with a DTS using line-name
>   and verified that it propagates properly?

Yes this is tested and works for me. I am using the two series together
without problems.

Best Regards,

Markus

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--uX7BrQs69PbBafpd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWA5qjAAoJEEpcgKtcEGQQe+IQAKMhnx6JVErrpVjo1CSVs9TR
vxpCBI6ct18jD/4Q3L+jO2QoSfLx+ei/knQqrZ1oOwwDvG0TOcCU/hI2VqeqwB0U
qOm5LP14HQXUPoPCa7Gj96FmDpw+ROHL0VGKyhbmizl1206vzJej+OmUNoUZBfHN
A96OdI5CgPi7D+iQY6nTgNS4mMlNp+y93z9qMmPaPPAcXKpaMF0dH31zUUqQ1fAG
yDFSFeux4nqlT9xCcrhDMqMoj62+xkDJJY8pASHQtN8v81zedxtPwLur+3Lupv0x
OymTgn7gNLh0NFvg2nk/BTVJFc8ngEjjQhseElOpqwrisoG75wIJYSWFzkI0ROiM
ab7AL6/s3EZxXZ5KPKIm+XYbCenEOvDRgxAQgjd7QCEgAygrKOx+oJ8aqWOb0tDC
larrL4Cx/M4Vv0DnuVoQhj6Fj25voko4F+F7E16fhvsZuznejuIoRt8DHQRjYtdz
BaCoP+Tspyx9BBSRDsr3iedT/EMNaH+F34yAaeqfourqj5u4kxwAS/2xaZwsRlFF
NHB/gyJEmgUVG0p5wSWNa9SBcx4Dpca0aGfjyirhFXf3/Jc8SXgYaJIzd+t/11nG
3MzQINFDAA08BVW4ONy7l77Qh14Bp+iSZ90fx339JQbL7TwLuaykXbnZ27/zge9c
+MDKQRJcsGdzJzeT4clW
=Mst7
-----END PGP SIGNATURE-----

--uX7BrQs69PbBafpd--
