From: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>
Subject: Re: [PATCH 4/5 v2] input: tc3589x-keypad: support probing from
 device tree
Date: Thu, 14 Nov 2013 00:29:24 +0100
Message-ID: <20131113232923.GB13669@earth.universe>
References: <1384265618-10590-1-git-send-email-linus.walleij@linaro.org>
 <20131112153057.GA9683@earth.universe>
 <CACRpkdb_bryGJo7CKGP5tj3RFGv=Gh+Q5m9ucVKqJ068tjPC2g@mail.gmail.com>
 <20131112200514.GA15413@earth.universe>
 <CACRpkdaAaLjm_b+OLj3tobxBN8YGUcTPnXJ=qtBqd02=FTxhjQ@mail.gmail.com>
 <20131112204013.GA17674@earth.universe>
 <20131113142406.GH21713@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131113142406.GH21713-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 13, 2013 at 02:24:06PM +0000, Mark Rutland wrote:
> > Current suggestions (taken from kernel) are:
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
> Both of those sound valid to me, but I think it may make sense to keep
> the "linux," prefix. As I understand it this is really telling the Linux
> input subsystem to react to a device acting in a certain way, rather
> than describing or configuring the device in a certain way.

That leaves the following two options:

* linux,input-no-autorepeat
* linux,no-autorepeat

Any suggestions for those?

-- Sebastian

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBCAAGBQJShAtTAAoJENju1/PIO/qapIIP/1nOGTKGR/ITDpzrdQBJ7vnG
1607bRwWnJvSOulQXp7XtqeEMz0brrZgamE2d/CHUxxQSQtrJTCZTDB4VDFxVUAq
vzVAZpH54czpN+vA+zS7KJo47VJ83o9lk0G07F4FVVPLr4mCd6CdLVGzeo009gG2
bfXwxvgObOEHsPa7mZoYseSl4fJctTcbrqJmsNLyZ6yO6eowFLX3RR+MJhuhleCm
C1BnbN4WVnqSAnmPAbXGGZx8C7dzZGGjg3qR5osQIgD4gRkJ04ylHhTkgSgfgM6G
Kp14tE8exYm592B5HH3uI/GKvgOsfeUA5o7Af2AP4ol1/BFE3jjYzwbeNYoEu0dN
NbsmD2Hf3QxjGRwhklxXrX/mmYdSHxRWyEtK4uH2h3qdyGx446ZRjq3NqqqBJEj3
ANhAeNJWobFqC9KHO6rJW/a0IUg8v/wUr33P47zetqTDVFppk/AEyMh9iV/mNXCr
e2Fjbmb0wxRhdBcCnv6mFHv0hoYEeaybl+nKvsQ0ELw8wPo6p/B20pQNJJOaSmBb
QYbybQ8XJNQx0L4dMDq4gH6HbOVb+7VAymsM+Xf4Wvq59k3NPlr+W58plA57xDRB
UqBWKHEaWggfeyqizg4Fr8qhqB1ySg2xrk0HvCovr1qlkQgscg6FbnVmwGPH2fnE
/9zrq8KgGJRsQN1LUnzP
=iEj7
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
