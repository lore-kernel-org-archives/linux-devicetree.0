From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel: simple: add support for PDA
 91-00156-A0 panel
Date: Mon, 28 Jan 2019 17:18:07 +0100
Message-ID: <20190128161807.GI26200@ulmo>
References: <1547458584-29548-1-git-send-email-eugen.hristev@microchip.com>
 <1547458584-29548-4-git-send-email-eugen.hristev@microchip.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1877382306=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1547458584-29548-4-git-send-email-eugen.hristev@microchip.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Eugen.Hristev@microchip.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Nicolas.Ferre@microchip.com, robh+dt@kernel.org, Cristian.Birsan@microchip.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1877382306==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PMULwz+zIGJzpDN9"
Content-Disposition: inline


--PMULwz+zIGJzpDN9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 14, 2019 at 09:43:31AM +0000, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
>=20
> PDA 91-00156-A0 5.0 is a 5.0" WVGA TFT LCD panel.
> This panel with backlight is found in PDA 5" LCD screen (TM5000 series or
> AC320005-5).
>=20
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)

Applied to drm-misc-next, thanks.

Thierry

--PMULwz+zIGJzpDN9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxPKz4ACgkQ3SOs138+
s6GQ7A/6A40zNnOUXXz3Y+lz+5v+ncu7xHRZ6n0q11nJJ83TduEbkoCTQgLkqKy7
makLAI2kCDJsHqW+fdxxLNPEBV2njIPhSPzwLBEdbom+bGGICO2+3aGCuXQLe7wB
mNeTziTe529E7CCdC0SatoNzkRY1mph5jzX6mzvgLdIJ8NBrSOBJAriMc8LCi2ih
re6hNFdF/OpVxwn8t3mwGJL4Tl6PKUf/NGkEujoxzokEAv9+5J3Jv0nYkctDVFLj
KpkT8cAHaa2l4h+CMakmbk9kQmfr6138SSZcrH+KY2u9GihXQB1cntXnzTks/GAZ
1yGcHPqGhlG7fn94Lbyw03AvrFPkKYi9fUQdit9X6AIHg3OUZ9atgMt85ekr7Jzm
ZM9ohgrgAUGZ1FaGoOPAXLFE/EKFvQg6CZ3ji9eXaLceFHiisZzFu0JzfZL0YrQg
+TmoUNF8Y7cXbKfBMXTo0vt9aJaeo4HIkDl1+uUvjYZo+a+4cHEOQkzS45k3hXnX
Pif7g3C7fpWwF6avcPMHhZ9E8RXcaNYeisY4QiaWkNoidcZshTs1FOqVpeWm9owI
p42ah6cQLYtMj9xsKH61a4kWi9djQ0JzicWZUWfL366thRKXv4KYQ8wYKqsYCsV+
fxFtKD4ZHngM9siOCbWeG/wVatEx42nxF9Sl+zwf5DPtWVdX0ag=
=e/Qf
-----END PGP SIGNATURE-----

--PMULwz+zIGJzpDN9--

--===============1877382306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1877382306==--
