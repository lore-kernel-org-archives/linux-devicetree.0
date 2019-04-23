From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: drm/panel: simple: add Evervision
 VGG804821
Date: Tue, 23 Apr 2019 14:25:07 +0200
Message-ID: <20190423122507.GM23448@ulmo>
References: <20190416100645.21689-1-m.felsch@pengutronix.de>
 <20190416100645.21689-3-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0060542757=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190416100645.21689-3-m.felsch@pengutronix.de>
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


--===============0060542757==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uwB7x3tnyrZQfZJI"
Content-Disposition: inline


--uwB7x3tnyrZQfZJI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2019 at 12:06:44PM +0200, Marco Felsch wrote:
> Add support for the Evervision VG804821 800x480 5.0" LCD TFT parallel
> panel to DRM simple panel driver.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/display/panel/evervision,vgg804821.txt  | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/everv=
ision,vgg804821.txt

Applied, and fixed up the commit message because that's no longer
accurate.

Thierry

>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/evervision,v=
gg804821.txt b/Documentation/devicetree/bindings/display/panel/evervision,v=
gg804821.txt
> new file mode 100644
> index 000000000000..82d22e191ac3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/evervision,vgg80482=
1.txt
> @@ -0,0 +1,12 @@
> +Evervision Electronics Co. Ltd. VGG804821 5.0" WVGA TFT LCD Panel
> +
> +Required properties:
> +- compatible: should be "evervision,vgg804821"
> +- power-supply: See simple-panel.txt
> +
> +Optional properties:
> +- backlight: See simple-panel.txt
> +- enable-gpios: See simple-panel.txt
> +
> +This binding is compatible with the simple-panel binding, which is speci=
fied
> +in simple-panel.txt in this directory.
> --=20
> 2.20.1
>=20

--uwB7x3tnyrZQfZJI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly/BCMACgkQ3SOs138+
s6EnAg/+NdcFmbeTEy+a2xGEyTzAgBzS9xtaIhTM/LPYScq5EAlv3benSWp9Eu1j
lKFRp8mh2GojVLdik8M/O4O4SaQOpejpGrDyTNpzFF77wk+3Ce85ZSWfjnXmUuAM
sdmPengFNN96AzuP7Mx16Bv7msEfoP0QLptqyxp2Wm+ST15s7zFrgWZv3oJc+nTE
NOV0u2bsA/Aro9+yotAMIx1UPj7uPC/bG25WNMJ0egYAvexgHTMz/emUeAmcppSn
Jxrc1m79WdL7M9P7pAs5Gu21iYjKvtG57094ybRi+PzleOk1ew9Y/5l38Jsi8DV4
Dl+ZddImeQSisNhZANoAdvt0vlOQ84BtLj06+HEQ5NvD8UPi92mToCajVQABUPsl
lnVw2io1NahxE+MEIZI9rn69nE0HZVTztplm9o+blc2lkKFgQzKCbNJsLKR60zUQ
eYZ5Lg0tPTngmC90fKv8tPckKf6K4+lBD7LU1/kSGV7CD8VDpfPKct3uk5e/thTM
3BAlU61SxqK7y0SBMvrk1bGOxNozqfbZFQSghlSGfg6/H70G5txlnGTY6WwR4zjR
ipjH/BY2/zRXgRsuvI66+HM7CBZi/MsJ7ooe54vzCMNr72mn2IAJgFECATBzX1ha
lSycTofXoOpp1IYLdV8zFFaEVxM/55pdJRmCvFRNMLVzsLwNkAA=
=+fDG
-----END PGP SIGNATURE-----

--uwB7x3tnyrZQfZJI--

--===============0060542757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0060542757==--
