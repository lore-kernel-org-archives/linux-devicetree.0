From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel: simple: Add Evervision VGG804821 panel
 support
Date: Tue, 23 Apr 2019 14:26:30 +0200
Message-ID: <20190423122630.GO23448@ulmo>
References: <20190416100645.21689-1-m.felsch@pengutronix.de>
 <20190416100645.21689-4-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1818855684=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190416100645.21689-4-m.felsch@pengutronix.de>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, kernel@pengutronix.de, sam@ravnborg.org
List-Id: devicetree@vger.kernel.org


--===============1818855684==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OAiy6VLsECigG9dy"
Content-Disposition: inline


--OAiy6VLsECigG9dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2019 at 12:06:45PM +0200, Marco Felsch wrote:
> Add support the Evervision VGG804821 800x480 5.0" WVGA TFT panel.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> v2:
> - pixel data should be driven on neg. edge since the panel applies
>   the data on positiv edge.
>=20
>  drivers/gpu/drm/panel/panel-simple.c | 30 ++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)

Applied, thanks.

Thierry

--OAiy6VLsECigG9dy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly/BHYACgkQ3SOs138+
s6Gu+xAAiEnnEvKgob77G4Gtxj5uLewX3FUPMhEk2d3Ou5Ns/bdnTuDhtqsRx+/o
WFdhRXl2G1abmQ5v9DwVmzPbeqmDoFuBfOq/ye9tNoqIVtWwjGVyiq1OHKBsr+Qb
MK1IAQzAEICcNqCicca9TkDH0hYeZ5y+3XD1jy6eCtqw3UfTNPfxSo4LpANChKPe
pMljrhULlpXxV4OCGJSknyg31QjC8Xsk4eCS7bTc4eHn62dWFYgarTltkDYlPAMc
Tie8+7DisnuGj7KrmqISadB8PzVa7lbZxc+rpk8pqfLrNlmqergMxzc5ylPfZY4/
ZiGkHaCN1ZK9EFVZkI9FRFIDXqA/jifwWrN06QFhPccxv/Yzioplu1lcJGjMU9or
LCNKubLjBDpP8Z7b0m1LtQBa4OBd3RPmmBpukCHCUW9UIgXPLO6037Mrg2NArMrc
dvhwzjBzu/AiiiyFb3gooZEIG8JjiwTy7advmqa0Ljywc5jS7rsNouzYP76ZprPM
mUMM4Ch6uWLJqFkoTwotTTYRYQgdJTS82rFWacnFJbPuG7G0yGuof4IIkrpYCFjs
Mw1Q2kC6yOW3e0i8Eujo5uTebju5GeMogC7Twws2WrgfnuRJvi/zr0tAP5KqsvSN
egEZOY1jS0Sd5Mv5V1AtKNjo7XoTYZyDhKOfJ2zjSAaq3N+CU9c=
=qD7f
-----END PGP SIGNATURE-----

--OAiy6VLsECigG9dy--

--===============1818855684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1818855684==--
