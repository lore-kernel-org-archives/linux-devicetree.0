From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: panel: Add YAML schemas for the
 Ronbo RB070D30 panel
Date: Tue, 23 Apr 2019 13:21:01 +0200
Message-ID: <20190423112101.GD23448@ulmo>
References: <cover.5ac8e6ed5381ceb14a2e5d64671228f665a08d43.1550650810.git-series.maxime.ripard@bootlin.com>
 <c05b961302ec4a2af32ea6c215ec0749b1a9cff7.1550650810.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1936751938=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <c05b961302ec4a2af32ea6c215ec0749b1a9cff7.1550650810.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org, bbrezillon@kernel.org, dri-devel@lists.freedesktop.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1936751938==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JwB53PgKC5A7+0Ej"
Content-Disposition: inline


--JwB53PgKC5A7+0Ej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 20, 2019 at 09:21:55AM +0100, Maxime Ripard wrote:
> The Ronbo RB070D30 panel is a 1024x600 MIPI-DSI panel.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml | 52=
 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ronbo=
,rb070d30.yaml

I was doing some patchwork maintenance and noticed that this patch and
patch 1 of this series were not marked as accepted while patch 3 was. I
looked at the tree and then noticed that all three had been applied. So
while I appreciate you marking this as accepted when you've applied it,
please make sure to mark all patches that you've applied as such.

I've now marked these as accepted for consistency, but in the future,
please make always solicit review from device tree maintainers before
applying device tree binding patches.

I would've especially liked a pair of eyes on this as they use the YAML
schema that are still fairly new.

Thierry

>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d=
30.yaml b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.ya=
ml
> new file mode 100644
> index 000000000000..a0e6fa1559cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR X11)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/ronbo,rb070d30.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ronbo RB070D30 DSI Display Panel
> +
> +maintainers:
> +  - Maxime Ripard <maxime.ripard@bootlin.com>
> +
> +properties:
> +  compatible:
> +    const: ronbo,rb070d30
> +
> +  reg:
> +    description: MIPI-DSI virtual channel
> +
> +  power-gpios:
> +    description: GPIO used for the power pin
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: GPIO used for the reset pin
> +    maxItems: 1
> +
> +  shlr-gpios:
> +    description: GPIO used for the shlr pin (horizontal flip)
> +    maxItems: 1
> +
> +  updn-gpios:
> +    description: GPIO used for the updn pin (vertical flip)
> +    maxItems: 1
> +
> +  vcc-lcd-supply:
> +    description: Power regulator
> +
> +  backlight:
> +    description: Backlight used by the panel
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +
> +required:
> +  - compatible
> +  - power-gpios
> +  - reg
> +  - reset-gpios
> +  - shlr-gpios
> +  - updn-gpios
> +  - vcc-lcd-supply
> +
> +additionalProperties: false
> + =20
> --=20
> git-series 0.9.1
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--JwB53PgKC5A7+0Ej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly+9RkACgkQ3SOs138+
s6Gv+w/8DQ+/lTury6epTn1RaFI0w903CVv9sVpsKUFKwiQ+E4dHZI7Gg18k6UuT
f0lVmBZ7iz600AzxfMOdrN2oGiTDWsTuySY5SPlyqoujLDqMxmw2mtIth56EKSwb
trPrpRYxmLp3tUgOHTb4ZCaPzha9ApX+NeJDIqTvXgWgxlgGW4i+O4ppDKOYobjJ
pB+m+89USCAsnW6RhvEpTCmyciIaQCUtNLzFliYuZvjS94xDA+9mp+PQdyOETK+s
hwiG3VwjWQ/BPpTxiNgR9umyvqdvAv+kXN5xBZSxtwyi9+OSeRp27JOoVG+hhqL6
gvfzO+Bk1oSKiq26IuR0KlgvDnJRWDN69DYoNGbGhukr2teRU8xjezMvTsrIJVFr
tSsxpprygWcwPEE817QK7X9bH1zU5HiDP/TRPK1XyfbjQPsiJx9/rR5qhJ5Gqo/n
wRZBsTjm5X7MBjjhsck9xrdAO+2Fkv2UmOGIQkx+9DJBMDDSHxJqK+ZHQlRZYHmW
oWy2ocH+N01mJEthqoMgDrcpBVasSqy6MfZNA6FnyD+pJ1NFadAAJgT994Y30bAR
9bh7dyY7dRXwe7CqWtI7UDHvhyymHqY9tksZDQEqamzOaFDqYHLMN0Bli0CgL969
uI7Q3jrd4VG9xSV0ti9vIZBKM3s8X+9NhAG5380NHpb0FoAA554=
=QgJ0
-----END PGP SIGNATURE-----

--JwB53PgKC5A7+0Ej--

--===============1936751938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1936751938==--
