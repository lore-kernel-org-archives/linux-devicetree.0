From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 0/4] drm/panel: Support for OSD101T2045-53TS and
 OSD101T2587-53TS
Date: Tue, 23 Apr 2019 13:55:06 +0200
Message-ID: <20190423115506.GE23448@ulmo>
References: <20190226075523.28997-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0439596399=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190226075523.28997-1-peter.ujfalusi@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: devicetree@vger.kernel.org, airlied@linux.ie, tomi.valkeinen@ti.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, sam@ravnborg.org
List-Id: devicetree@vger.kernel.org


--===============0439596399==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Yb+qhiCg54lqZFXW"
Content-Disposition: inline


--Yb+qhiCg54lqZFXW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 26, 2019 at 09:55:19AM +0200, Peter Ujfalusi wrote:
> Hi,
>=20
> Changes since v2:
> - Added Reviewed-by from Rob to the binding patches
> - Added help text to Kconfig (osd101t2587-53ts)
> - Print the error values in dev_err/warn
> - Added Reviewed-by from Sam to the osd101t2587-53ts patch
>=20
> Changes since v1 (only panel-osd-osd101t2587-53ts changed):
> - Removed unused members from struct osd101t2587_panel
> - Use backlight_enable/backlight_disable
> - Use devm_of_find_backlight()
> - osd101t2587_of_match table standardized=20
> - osd101t2587_panel_unprepare() added to shutdown and remove callbacks to=
 turn
>   power off
> - Fix probe in case mipi_dsi_attach() would fail
>=20
> Add support for OSD101T2045-53TS and OSD101T2587-53TS from One Stop Displ=
ays.
>=20
> The two panel is similar with one big difference: OSD101T2587-53TS requir=
es the
> MIPI_DSI_TURN_ON_PERIPHERAL message, thus can not be handled by panel-sim=
ple.
>=20
> Regards,
> Peter
> ---
> Peter Ujfalusi (4):
>   dt-bindings: display: Add bindings for OSD101T2045-53TS
>   drm/panel: simple: Add support for OSD101T2045-53TS
>   dt-bindings: display: Add bindings for OSD101T2587-53TS panel
>   drm/panel: Add OSD101T2587-53TS driver
>=20
>  .../display/panel/osd,osd101t2045-53ts.txt    |  11 +
>  .../display/panel/osd,osd101t2587-53ts.txt    |  14 +
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../drm/panel/panel-osd-osd101t2587-53ts.c    | 254 ++++++++++++++++++
>  drivers/gpu/drm/panel/panel-simple.c          |  34 +++
>  6 files changed, 323 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/osd,o=
sd101t2045-53ts.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/osd,o=
sd101t2587-53ts.txt
>  create mode 100644 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c

Applied all four patches. Note that I had to change the osd vendor
string to osddisplays, which is the one that is documented in
vendor-prefixes.txt.

I'm assuming that this is the same vendor, based on the model names. If
this is a different vendor, do let me know.

Thierry

--Yb+qhiCg54lqZFXW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly+/RgACgkQ3SOs138+
s6HwjxAApkyuZ5z3LbF0DqxwC4GvLYSGatYuIbmcjw9GIOXVz64h1/hcQyUPpnNa
Rgkk1YY895dSEKjtUeCMEC20AcCN4HajqeGwcTMghbYQu6IJQPDyZEqHzi4UIVer
B5YfKHNVvbKeLvcP9Ec+d+CCMnXUhcyVyJPCDJ1IdIpSVsNfD9RHL2y+9gPZoWVk
UTjaW4dP31vcXHYz+6ogDnLqBUmyx60r4g+QwGfyUEv67qCEkSdJhwJekj3FrS8w
OKD9WNFtAmATC/0V/5f3XB32xWPqRsnOyoxkwkKihUYiFmFPYMuzoNnjPWSh9ltp
MoOxqGQQwrYfEKQJ1BlSonrRYYF6UTnIHOlXHlZPvsXL0aKJfOyrLwGWQl7j9VuD
Dq5cJvILcasds3u79/gasiDHr4jUFyXrpo+tJPEDMu8aU1+8jHOaGprFwgdrEkl9
7dALPzjTNq0TpbFybE9j5GAt9GZ4mrGReeyltP5J9tn98JeLGWkNjB2tmtcstQUO
GKdOMyxsvu3/YviwkXnB6ZJ4+p3PslJgUJWLhFtYoyAFmqrXEa6DZtrkBRkNhC2U
k2lLxl6V48v48D/Aih42eIBYqfN9B627VZklfns3WAA6cr2I4kqkt3vVPGoAuWX5
SnxEZRZCJhoBrWK/JZHxCJ9BPLP8yariwchttuXeTFviucpqX6g=
=5YDH
-----END PGP SIGNATURE-----

--Yb+qhiCg54lqZFXW--

--===============0439596399==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0439596399==--
