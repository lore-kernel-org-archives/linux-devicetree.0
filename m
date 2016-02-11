From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 01/14] pinctrl: sunxi: Add A83T R_PIO controller support
Date: Thu, 11 Feb 2016 16:12:46 +0100
Message-ID: <20160211151246.GO31506@lukather>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
 <1454203266-4450-2-git-send-email-vishnupatekar0510@gmail.com>
 <CACRpkdbCgOBQw28d=qc1fAURY3x8UdoWqiMtXMZ=uWLaQj-nbg@mail.gmail.com>
 <20160211123648.GN31506@lukather>
 <CACRpkdaGZ4-S1A9zUUaBXXEazyJf_uZ4ESiBhw-CpozXMxfDHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+YNiMqYexvphW3UE"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaGZ4-S1A9zUUaBXXEazyJf_uZ4ESiBhw-CpozXMxfDHg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Vishnu Patekar <vishnupatekar0510@gmail.com>, Rob Herring <robh+dt@kernel.org>, Jon Corbet <corbet@lwn.net>, =?utf-8?B?UGF3ZcWC?= Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Emilio Lopez <emilio@elopez.com.ar>, Jens Kuske <jenskuske@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Reinder
List-Id: devicetree@vger.kernel.org


--+YNiMqYexvphW3UE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, Feb 11, 2016 at 02:47:57PM +0100, Linus Walleij wrote:
> On Thu, Feb 11, 2016 at 1:36 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Thu, Feb 11, 2016 at 12:59:47PM +0100, Linus Walleij wrote:
> >> On Sun, Jan 31, 2016 at 2:20 AM, Vishnu Patekar
> >> <vishnupatekar0510@gmail.com> wrote:
> >>
> >> > The A83T has R_PIO pin controller, it's same as A23, execpt A83T
> >> > interrupt bit is 6th and A83T has one extra pin PL12.
> >> >
> >> > Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
> >>
> >> Maxime, can you look at this patch?
> >
> > Chen-Yu had one minor comment on it,
>=20
> OK waiting for a new version.
>=20
> > and he's also the Allwinner
> > maintainer now, so you can trust his Acked-by just like you would
> > trust mine ;)
>=20
> Can you guys supply a MAINTAINERS entry for the sunxi
> stuff?

We have one, and Chen-Yu is listed as co-maintainer:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/MAINTA=
INERS#n911

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--+YNiMqYexvphW3UE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWvKTuAAoJEBx+YmzsjxAgI0oQAIqHjXick2u1KTOB6PP8ozIJ
ZvmbTi6IOs0gARACE1vWvjQb/O7MOJhtac0SuexaT7UmhnhNoz/7/OryQVpR/fDj
C4+xjMIKF1lgssJToZIu2gLGMpP/Hv3HLjLAPs+XYl2doSEI5IqKrQ7KIobeQZYH
ZMOsReY3lYrHPO+7FGga6PGfEbCSEBM7HguSZOdFJ1uZTr4LBACA1KEICUN2w3eG
6b5xOTLnm6QfWJFz8EvHdd74NTpf5AAlnp7htWwGVwXGRDtPHz2xPitQQuDybNZ6
zmwUs5iC2CriCLjgsEE9K8aJvYLBI0mLQblUhrKaoUxa/B6KX73fflJO2uQ3PKsc
L2JWxbN1eB0EOO+BznNNg5QdVN4LCnT51F8+QCGbCnP4gnw+EYOidYXN2JbLKGkr
BvIs2HCvNN0UDmTzOYYT8YkMqF0rjQP8O8hIXpE9oapzmPkVH4dRlr1B20N7TZiK
Zx5fYYJxNfa16I7oKoVSMM9gesMUptsYLJL7Dee61PR29s34mpTL9XUqgcIdx9PR
tLCZgBIIvtuXdUDj1SC4laseUq0JbN1dtjaQXRVvLmZ0lIE6w7oIfMF8XfqwnTwS
zDOToDejT5QU7EdxFQzgyW2PzHB3lB+ea/a5/X8jWvG/DCyAgNwvNn/91k02WkK1
oeixhHgt1Fv8YVX9E1Ty
=kvZl
-----END PGP SIGNATURE-----

--+YNiMqYexvphW3UE--
