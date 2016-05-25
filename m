From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 06/20] drm/sun4i: allow dclk to modify its parent rate
Date: Wed, 25 May 2016 14:01:56 +0200
Message-ID: <20160525120156.GA9232@lukather>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
 <1463402840-17062-7-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v65tiUt9FvmJ2RaZdXaAFEznKZZjycO+tZcP-4spOAjObQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v65tiUt9FvmJ2RaZdXaAFEznKZZjycO+tZcP-4spOAjObQ@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Boris Brezillon <boris.brezillon@free-electrons.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2016 at 01:18:44AM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Mon, May 16, 2016 at 8:47 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The pixel clock being only a divider of its parent clock, depending on =
the
> > resolution, it's expected to change its parent rate. Add that flag so t=
hat
> > the clock framework knows it.
>=20
> This should be squashed into the previous patch. Otherwise, the previous =
one
> doesn't really fix things, and probably makes things worse as it assumes =
the
> parent clock would be changed.

Merged the two patches and applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXRZQ0AAoJEBx+YmzsjxAg19EP/A3wXTN8exzOUJG/1v9+Agx6
0ji5nVu8j7VAyWq700vA+6ftaEzFkhNU0/GnP11gkC0DMI6GXMSCGxZmErYSW/PU
gsnE+muMicHvXVjcyEqth6b2281VphetBHa8MYo/Mg41rZZY3M0AZRA0uqQiSYSZ
vkztquzRqlHoCbnVZ5xvEPgH9kx1XXRf3PNdYM0/YIazvpcf2Sc/Vy1JsUdWwPWm
SiQi8sZ6HLN6QgxnridctLD1sHLfZu/cDVt4MdxNSFoMktPm6Brt9+DTRldLFJ0Q
I538QtMDKc8mBmnc8YuqOXDhSLpTCvJA5wF3qfqabW+s/XoxrWXO8Y4RxpAuLWBC
5rje/xUTsDVWhfknWgWo5oT2Lg0FxEZZZEEJMdmiO8oWTv7N8l/DuW9lYddgwYVe
Bxh7EJfYPZjhvxeiLqBpitPkcXXFIQJn+wQ2BlRtKsBKn1oj/mXjHnk+DRqsLLlU
KWVIdKQlC64Itul50iwZFkzdeQI/1/oqiHR9DvgVaOsZgyOqEvdnIPF+hnT6qEkg
SkNg/EgWSK7oMHa4g3Hlu3g7fEbN5g2ww5mgvsscbyc4hxs2r0tks+q9ORl2XRGp
VNOzIuuqBb5/Fn34mYJtTm+2+4mGEOqpqx46KZA+T1JovnTZqjaHv26HWyFyEIXn
cmd+Ls+3X4tVyY0zRnAN
=QByE
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
