From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [RFC PATCH 3/5] gpio: gpiolib: Add chardev support for
 maintaining GPIO values on reset
Date: Fri, 20 Oct 2017 19:32:53 +1030
Message-ID: <1508490173.24322.53.camel@aj.id.au>
References: <20171020033727.21557-1-andrew@aj.id.au>
         <20171020033727.21557-4-andrew@aj.id.au>
         <CACRpkdY4F-ocFxomLEsVyGA0odGooWysQq5MHi9qwUt6E_VDzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-K4mhhnvm7upcPcUWi8ee"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY4F-ocFxomLEsVyGA0odGooWysQq5MHi9qwUt6E_VDzA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Michael Welling <mwelling@emacinc.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


--=-K4mhhnvm7upcPcUWi8ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-10-20 at 09:27 +0200, Linus Walleij wrote:
> I paged Bartosz and Michael on this, they are experts on the use cases fo=
r
> the character device and their opinions are likely more valuable than min=
e.
>=20
> > On Fri, Oct 20, 2017 at 5:37 AM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
> > Similar to devicetree support, add flags and mappings to expose reset
> > tolerance configuration through the chardev interface.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>=20
> (...)
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0* Unconditionally configure reset tolerance, as =
it's possible
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0* that the tolerance flag itself becomes toleran=
t to resets.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0* Thus it could remain set from a previous envir=
onment, but
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0* the current environment may not expect it so.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0ret =3D gpiod_set_reset_tolerant(desc,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0!!(lflags & GPIOHANDLE_REQUEST_RE=
SET_TOLERANT));
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0if (ret < 0)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto o=
ut_free_descs;
>=20
> First, as noted in the first patch, IMO we should just go for persistance=
,
> i.e. you want to flag to the system to keep the line persistent in any ca=
se,
> no matter if the system goes to sleep or resets.
>=20
> So the usecase is going to be a control system or similar, a makerspace
> project, an industrial product of some kind, driving GPIO from userspace.
>=20
> I don't see it as helpful to give userspace control over whether the line
> is persistent or not. It is more reasonable to assume persistance for
> userspace use cases, don't you think? Whether the system goes to sleep
> or the gpiochip resets should not make a door suddenly close or the
> lights in the christmas tree go out, right? I think if the gpiochip suppo=
rts
> persistance of any kind, we should try to use it and not have userspace
> provide flags for that.

Right. I guess the counter argument to your examples is if the gpio is
controlling any active process that we don't want to continue if we've
lost the capacity to monitor some other inputs (some kind of dead-man's=20
switch). But maybe the argument is that should be implemented in the
kernel anyway?

Andrew
--=-K4mhhnvm7upcPcUWi8ee
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ6bu9AAoJEJ0dnzgO5LT5WwcP/3taBkLhJi7NTeYM4U3/kvuZ
pAnUi43H5rLbM7Ynx0eXZ0OHlPHRJBZDpYZmCfqdqSX+8hRELJNIlkj0u7+uXfAd
Dnn9x4LTM/qS56/AedpDePgfkYGffKvG5cWF+0ZSmiuRqlExlyQKPaFXH05B1zq1
ChtLY8WSBJayx46ZwzX3sqCltvjiR878Mo7H5LnpScrzvOwJ3MGOKmRODF2HZ9LR
tnDsSiMPXsbXNGFSMerPhikmdY4vFSjx+eD431PNUfLfeaJbYb6Q2EYvWDel3b0u
Bx8BoVrKXvIcq3kFOK6DrR528GLexI2yhoPRAb2dfu+5jQXQDsm68Q3K7HKhG8ly
H7aqrkEtDdssgtHo+yzEPdJgt8dXkPdr03QyOwQDo7h/cPZvcJ2wpnauYirIhSp/
1Oc6sEYWTc3QXxL6vo5g0cyTBbiiRE454wgvlmg3WXpejBxQm+ITQSCA1Z4h33ZE
WMhYrtnN9aszORegK4nCrasVy5Wrpw1NdEGgWz1bzmkn9LMgmjkM3kdqamHikVL1
Lgcv3Ttk/s9Y43d2T5yVB+lRz491h7wJKULFMc+7oKrB3OkbTvDkyXEWEbIC2eKQ
l6imHChFkNy4KwK/kXXJ0xQkFXDuEDFMdPKk0ktMTkrmOvGJyaIbQ2UUQqUx3xxn
kNO/AZaSuhyVZq8g2BmZ
=WhCU
-----END PGP SIGNATURE-----

--=-K4mhhnvm7upcPcUWi8ee--

