From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 4/9] clk: sunxi-ng: mux: Add support for mux tables
Date: Wed, 27 Jul 2016 08:59:34 +0200
Message-ID: <20160727065934.GD6560@lukather>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
 <1469516671-19377-5-git-send-email-wens@csie.org>
 <20160726194306.9b6aadd3d1669bd6f5a54d99@free.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zS7rBR6csb6tI2e1"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160726194306.9b6aadd3d1669bd6f5a54d99@free.fr>
Sender: linux-clk-owner@vger.kernel.org
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, dev@linux-sunxi.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--zS7rBR6csb6tI2e1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2016 at 07:43:06PM +0200, Jean-Francois Moine wrote:
> On Tue, 26 Jul 2016 15:04:26 +0800
> Chen-Yu Tsai <wens@csie.org> wrote:
>=20
> > Some clock muxes have holes, i.e. invalid or unconnected inputs,
> > between parent mux values.
> >=20
> > Add support for specifying a mux table to map clock parents to
> > mux values.
>=20
> Putting empty strings in the holes should work. No?
> Ex:
>=20
> static const char * const csi_mclk_parents[] =3D
> 	{ "pll-video0", "pll-video1", "", "", "", "osc24M" };

Not really. The clock would be declared as orphan, while it's really
not.

Parenting functions would also not work as expected,
clk_hw_get_parent_by_index being the obvious example, in that case
returning the empty string for an invalid parent, while it should
really return NULL.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--zS7rBR6csb6tI2e1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXmFvWAAoJEBx+YmzsjxAgvxoQAL5zKe1dkPf+ASL5YxDfh3dq
uu42e+QySoseFwGW+eTm/v5wwkJyotF1ck5IF3fWwfMmZ+jGPSQDK5SDsGbzcdh4
V8bRqe7CjiYK1zHBHluk6QiIpFuIHIavwA5hr0y2weI6TLBhQKn129Y4KXXcs9Zn
Xy0sUfejEICEflyZLtJN+XRPJEPjLop88pKCW84NiLGEnLtz7iCjFezbF5QXfMih
d6uPnGcKqbfigysxgl9ai0ROV6LQfP6wpXOXrOHLWK9NX7YNDd3sEV2AWDTHH0V2
fyA8nNPfVdKUEpwTHB0AhS4B4oPkz7ZW+nYnyTQf5wMqiIj3jJKryJJyl3pcZ+vC
F2CyFE2jgCtaz0vA9/yV5BOmLr87Uf+gbEl1MXDYJLB317ItPeb4r2KbyHui7feg
hiS84k4U/2PdhkgTco47//VzwWD1zr6zrRrkTJx0H24lmEWcyX0EMYKz3cgsR+DI
PZf74WSdm43vow/+c9NIfPpn7F2Q+Z4oxfs3soHHOwxf/B2x+/epzQCbjZ/s5h38
+i1JJK0xPfmI0js4uU/uuYEtWeL7Xz8FOJ2v0welSzhaOc23ZYEnOsBtg1/U9nJK
A1Q9/c+NeDRghZeV1frFNUNCJxD1SmUvb0wJzo4VhFJBRWjhtLVGv37BAQvR5YTH
3UcbuGkUOjgthhEyZLrV
=CCPA
-----END PGP SIGNATURE-----

--zS7rBR6csb6tI2e1--
