From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 2/7] drm/panel: simple: Add ability to override
 typical timing
Date: Sat, 29 Jun 2019 01:49:46 +0200
Message-ID: <20190628234946.GB1189@mithrandir>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-3-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1960720911=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190401171724.215780-3-dianders@chromium.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, Jeffy Chen <jeffy.chen@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Boris Brezillon <boris.brezillon@collabora.com>, Sean Paul <seanpaul@chromium.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>, Enric =?utf-8?B?QmFsbGV0YsOy?= <enric.balletbo@collabora.com>, Rob Herring <robh+dt@kernel.org>, Ezequiel Garcia <ezequiel@collabora.com>, mka@chromium.org
List-Id: devicetree@vger.kernel.org


--===============1960720911==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline


--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 01, 2019 at 10:17:19AM -0700, Douglas Anderson wrote:
> From: Sean Paul <seanpaul@chromium.org>
>=20
> This patch adds the ability to override the typical display timing for a
> given panel. This is useful for devices which have timing constraints
> that do not apply across the entire display driver (eg: to avoid
> crosstalk between panel and digitizer on certain laptops). The rules are
> as follows:
>=20
> - panel must not specify fixed mode (since the override mode will
>   either be the same as the fixed mode, or we'll be unable to
>   check the bounds of the overried)
> - panel must specify at least one display_timing range which will be
>   used to ensure the override mode fits within its bounds
>=20
> Changes in v2:
>  - Parse the full display-timings node (using the native-mode) (Rob)
> Changes in v3:
>  - No longer parse display-timings subnode, use panel-timing (Rob)
> Changes in v4:
>  - Don't add mode from timing if override was specified (Thierry)
>  - Add warning if timing and fixed mode was specified (Thierry)
>  - Don't add fixed mode if timing was specified (Thierry)
>  - Refactor/rename a bit to avoid extra indentation from "if" tests
>  - i should be unsigned (Thierry)
>  - Add annoying WARN_ONs for some cases (Thierry)
>  - Simplify 'No display_timing found' handling (Thierry)
>  - Rename to panel_simple_parse_override_mode() (Thierry)
> Changes in v5:
>  - Added Heiko's Tested-by
>=20
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Jeffy Chen <jeffy.chen@rock-chips.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: St=C3=A9phane Marchesin <marcheu@chromium.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> ---
>=20
>  drivers/gpu/drm/panel/panel-simple.c | 109 +++++++++++++++++++++++++--
>  1 file changed, 104 insertions(+), 5 deletions(-)

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Wp5oACgkQ3SOs138+
s6HkOA//aJRj++gDyHqyv+35Dnz1qJOb04MLQT25wHlW53LhiXm6APFDfKgu6GY1
jEhdqsfBT7y0c+yM8SQRwJx44H4QN8YbkqpH0jFsvLli7S8oalKWtu6ti1nRv1XB
oW2oTzn340rTKD1zeqQL1A26GF7G3COyKIOBhW+yHNAGA4gqi3XMi3RwKP0tLYWa
1zpI7ZMQw8kwprzPZZbsEnfRYj1R5YUfBO1252HaixMStJbJGj5vfhKFE2H7wTJv
zCz0JlxX6kepkO7aHmrwOWHYgnvrcCaphJy8YBWMhsBRN7UdOlLjjcBtvqGidKbc
5bBZucu8NOKSBVKP9V7HlWgQjoCI4uPXSJ+Z9G+NemzcqFtLOYAgGezKiTVjnw1T
AvEbEQ2ed9MPm2Yt93ozVgR0fvTqeJu0t5ybGaVhUXqevtek7HTCDbCiY+oFLBGs
ubaXXPCJaYls415YuHWxeIOBuyuyAkSihPy9JB2SZ5jZbXgRiXFrppGI+/zcTklX
InfVw9QwQMMHay+FhcnET0HkWiD47kvEnVBmaeHoMEnYKrE3p1IVZMXlzQsLqefL
ADaFGSl0UIS5kyS6yB/b82C2XkyuyFqG40ohDu3qpa2ShzY7iovd1rJBRFmI22/3
05j4j/3dS0eGTqoVVM1zpmdAaIvHaw7GbVjIEsd0BtG+51TIhW4=
=P4R1
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--

--===============1960720911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1960720911==--
