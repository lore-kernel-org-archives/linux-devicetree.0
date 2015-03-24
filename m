From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/panel: simple: Add support for Innolux ZJ070NA-01P
Date: Tue, 24 Mar 2015 11:59:27 +0100
Message-ID: <20150324105926.GJ18115@ulmo.nvidia.com>
References: <1426764164-30045-1-git-send-email-m.grzeschik@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0316390766=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1426764164-30045-1-git-send-email-m.grzeschik@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============0316390766==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OX7PPUk8qMPP4++R"
Content-Disposition: inline


--OX7PPUk8qMPP4++R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2015 at 12:22:44PM +0100, Michael Grzeschik wrote:
> The Innolux ZJ070NA-01P is a 7.0" TFT LCD panel with an integrated LED
> backlight unit.
>=20
> This panel is used on the Technexion Toucan.
>=20
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  .../bindings/panel/innolux,zj070na-01p.txt         |  7 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 26 ++++++++++++++++=
++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/innolux,zj070=
na-01p.txt

Applied, thanks.
Thierry

--OX7PPUk8qMPP4++R
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVEUOOAAoJEN0jrNd/PrOhBT8P/2JnWed98YjzJfM642i7b9oq
VuklX4/tBqSVwObLDNViQ6a4RtDypU6l42dR6X7gNeRUDMfcazs0tbHh1btBibrW
I64ymmgpI7QYCuoiAc+ydW9KY1bnIzYb/iyfJ/MOn23vO8CaBUO8xAk0NkcVnuIJ
m8YoXqCuvVkXCf3cXyAQUniw99iSxONU7bDESa4srcuuJqHGwCZVbbwXCPzkEhHS
sEva50pTEJL8h/kMUg/jK7CoGGnLOpSnQngWrs3QiaMIkRaiFJRgvA8IH7fF1M3b
RUvN+9hqipAE53+PzZoTTc8scVYQYHGTBS2h3FulqfLhCKbfLfTD7fv1wdt+Prvy
0T10MrZScjkxgf7ds4KbEBL6Dz4syeS+wbq2P0Vo3lumXAebZs/1Vr3B9AHCC13b
7FawNNykPfGA+WHLYrtyWSb14NPys3fJf9R/gTUfOZsgudNiBIaeo/TKzWJxEm8h
mw7GR4zte2qB+IZM6jzCfARcJP2R5n8kX9tvzLEtJ4DT+SGYh5JPIbON3f01kzJ/
yWz3QFxyjX28b9jubuQBI5+NcPpdiAeHdlj58sl2KtQulV2/49nkTdxySIvhAbUE
zgYfu5w1dcAEV8ggQKU53MQ4zBbAjBDBVN/NGAn6m41EUnCCSmdRxUgHzr3rgykN
scr4nM1+5rFj21d+B2yA
=LYz+
-----END PGP SIGNATURE-----

--OX7PPUk8qMPP4++R--

--===============0316390766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0316390766==--
