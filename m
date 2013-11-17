From: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>
Subject: Re: [PATCH 4/5 v2] input: tc3589x-keypad: support probing from
 device tree
Date: Sun, 17 Nov 2013 19:03:30 +0000
Message-ID: <20131117190330.GA21421@earth.universe>
References: <1384265618-10590-1-git-send-email-linus.walleij@linaro.org>
 <20131112153057.GA9683@earth.universe>
 <CACRpkdb_bryGJo7CKGP5tj3RFGv=Gh+Q5m9ucVKqJ068tjPC2g@mail.gmail.com>
 <20131112200514.GA15413@earth.universe>
 <CACRpkdaAaLjm_b+OLj3tobxBN8YGUcTPnXJ=qtBqd02=FTxhjQ@mail.gmail.com>
 <20131112204013.GA17674@earth.universe>
 <20131117182845.GB30012@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131117182845.GB30012-5NIqAleC692hcjWhqY66xCZi+YwRKgec@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 17, 2013 at 07:28:45PM +0100, Pavel Machek wrote:
> Hi!
>=20
> > > > I could find two boards using "gpio-matrix-keypad" in the mainline
> > > > kernel and not a single instance of "linux,no-autorepeat":
> > >=20
> > > In things connected to GPIO, I don't expect the in-kernel
> > > device trees to be a good way so survey the usage of these
> > > bindings. Anyone doing device trees on any system with a
> > > few GPIOs can be using this.
> > >=20
> > > But maybe we're lucky and won't break anyone's setup if
> > > we change this?
> >=20
> > AFAIK Device Tree property names are considered as ABI, so existing
> > property names must not be removed.
> >=20
> > But I guess we can add the standardized property name in addition
> > to the deprecated one. New drivers can use the standardized property
> > name from the beginning.
> >=20
> > Thus I guess we should not use the name, which has the most adopters
> > in kernel (or out of kernel). Instead the most fitting name should
> > be used. Current suggestions (taken from kernel) are:
> >=20
> > * <<vendor>>,no-autorepeat
> > * keypad,autorepeat
> > * linux,keypad-no-autorepeat
> > * linux,input-no-autorepeat
> > * linux,no-autorepeat
> > * autorepeat
> >=20
> > I do not really care, which one is chosen, except for two things:
> >=20
> > * <<vendor>> seems wrong. This is not vendor specific.
> > * I would prefer "input-" over "keypad-", since then the same name
> >   can be used for single keys, buttons, etc.
>=20
> Hmm, and it is not Linux-specific, either. So can we stick with simple "a=
utorepeat"?

The advantage of the negated form is, that autorepeat is enabled by
default. So what do you think about

input-no-autorepeat

-- Sebastian

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBCAAGBQJSiRMCAAoJENju1/PIO/qaE8gP+wRClLh+IbZioK4iZOjpWxhg
4Mw9nAnpmjsbxjrwiyWzj08fziAENCxJn5wQmFTDC1yq+qCN2vlmRVNydlp1zYlU
WtWE+DnoAHpZkAMNyIjB3/Z4iwA7Oc80N4dgH4xHMiXR73o6prwNNzlpvncBGHN5
OryE7zq6kMlLvdjmQslKlW6GrhlRmVhqsS3IVmUB0/+E2cfVtasfxz+hiVaAf5rz
RoRwmUFduDIKNB2e6g2Q6SXrZbOT7oyzqdMe9NPjqmttK9u7HT6eQ/j5fDeBzA5k
dmfjx1299xlGdEi0fvqBFd2AHCLIlZZ1cd8IvfugflC8CdJLwxTYvdcvCZnJ18ig
V67zTWTWb7kJRW7Qef17iBSg4Ee0C7BOVycNIp4gZM3eWFuKt5kleJkv0+UdFwZ5
s9bCxYAG9GrKFLIG9Ms5G7NrGWATJ4RhR6+fqUF77QBtMtwZDYPhareoG3I2O0Vy
GkR5zcKld2RcL9JOIzIVpr6/fy5alQCdAzf7BYvAyEalfh5QGxIJPdibZoKDKnJT
O2om+d1vmf93tEJxqMU8oqUM5VGSuGP1cOK9I/EYFNqoD+FPFZvEuvTQF4Ik9g/U
Ur8NHXpuJEgZGJXe0DgbOxRtLKeJY9nuToaNkRvVZlv0DyNcsVWbIg3JMLHl9rOB
lHNZJxWgwqeMyViVugvj
=w6p0
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
