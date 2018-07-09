From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 0/2] gpu: drm/panel: Add DLC DLC0700YZG-1 support
Date: Mon, 9 Jul 2018 19:29:45 +0200
Message-ID: <20180709172945.GI26651@ulmo>
References: <20180523092504.5142-1-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1580242300=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180523092504.5142-1-m.felsch@pengutronix.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============1580242300==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oxV4ZoPwBLqAyY+a"
Content-Disposition: inline


--oxV4ZoPwBLqAyY+a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 23, 2018 at 11:25:02AM +0200, Marco Felsch wrote:
> This serie adds support for the DLC Display Co. DLC0700YZG-1 7.0" WSVGA
> TFT LCD panel. The customer isn't listed as vendor so we have to add the
> vendor prefix too.
>=20
> Philipp Zabel (2):
>   dt-bindings: Add vendor prefix for DLC Display Co., Ltd.
>   gpu: drm/panel: Add DLC DLC0700YZG-1 panel
>=20
>  .../display/panel/dlc,dlc0700yzg-1.txt        |  7 ++++
>  .../devicetree/bindings/vendor-prefixes.txt   |  1 +
>  drivers/gpu/drm/panel/panel-simple.c          | 32 +++++++++++++++++++
>  3 files changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/dlc,d=
lc0700yzg-1.txt

Applied, thanks.

Thierry

--oxV4ZoPwBLqAyY+a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltDm4kACgkQ3SOs138+
s6Gbsg//fjB1Vkwd0crJtULTnh5WZcBe2bjB7Z1iIle+LQAtK/UeOj/glLMEbazp
ZN31LHwEZjb4S9A3k5SbquT17G/gQwW4rGNBUBH0i1derAW55yhV16xuiKRDItBr
JmL0XBjZiF+BmegBlWP1oOMXygFIeHHI/OcPp6DxltSPm8505rG0Zw2L5yWUprhK
VCZzenkX734iLEkGR05ocvCK5HJVBcHBgF0bz+FYESkuN7Av9Q5xHcgKnb7RI8gZ
EyLc9W++DAPt2OYHmgagIsLPSbhnkSzBE7mhMU4dIuVrsLO0vtQRGEeyb/M/0ari
QI7CD8QXLLgZXQEIpfAncySyleJxIcv/HtDnrSJPJxI5rSrtstbBhSFXVtelWY3R
bZl3uSYoKkjzyxbcLIBGXDsGXy3fM5YkiyF3bDw45joP3vt2I+L2yA4hZ0vEN8Em
nJSYmXS7SKVKJbRWzWhKpjFGqSQGzHuZdW+sb/XPHUxqGbyS3MeUCo8FswWhiG4m
uQeskDC/Bl/RHtRiyRxOoW9ELGExTur1sZ7YNgNoRrRC0MX+vodfE6Pgv8IbVG1o
HwHXf+VB12Bv/PYT8PvzT7hUkLxOXzXNT74IBPuwQL1LmrIsxYsziPQ1HyPgrk6H
H3ZVDAAqUt3wdU8pMLMxeDeTR6apa0OR7u705CypjNCxumXtAGQ=
=o5D5
-----END PGP SIGNATURE-----

--oxV4ZoPwBLqAyY+a--

--===============1580242300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1580242300==--
