From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 09/15] dt-bindings: display: Convert
 tfc,s9700rtwv43tr-01b panel to DT schema
Date: Tue, 25 Jun 2019 09:57:57 +0200
Message-ID: <20190625075757.hmszypzfp6uoch4e@flea>
References: <20190624215649.8939-1-robh@kernel.org>
 <20190624215649.8939-10-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1767275992=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190624215649.8939-10-robh@kernel.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>, Heiko Stuebner <heiko.stuebner@bq.com>
List-Id: devicetree@vger.kernel.org


--===============1767275992==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6oswsdiie6i3dzo4"
Content-Disposition: inline


--6oswsdiie6i3dzo4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 24, 2019 at 03:56:43PM -0600, Rob Herring wrote:
> Convert the tfc,s9700rtwv43tr-01b panel binding to DT schema.
>
> Cc: Heiko Stuebner <heiko.stuebner@bq.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../display/panel/tfc,s9700rtwv43tr-01b.txt   | 15 ----------
>  .../display/panel/tfc,s9700rtwv43tr-01b.yaml  | 30 +++++++++++++++++++
>  2 files changed, 30 insertions(+), 15 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/tfc,s9700rtwv43tr-01b.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/tfc,s9700rtwv43tr-01b.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/panel/tfc,s9700rtwv43tr-01b.txt b/Documentation/devicetree/bindings/display/panel/tfc,s9700rtwv43tr-01b.txt
> deleted file mode 100644
> index dfb572f085eb..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/tfc,s9700rtwv43tr-01b.txt
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -TFC S9700RTWV43TR-01B 7" Three Five Corp 800x480 LCD panel with
> -resistive touch
> -
> -The panel is found on TI AM335x-evm.
> -
> -Required properties:
> -- compatible: should be "tfc,s9700rtwv43tr-01b"
> -- power-supply: See panel-common.txt
> -
> -Optional properties:
> -- enable-gpios: GPIO pin to enable or disable the panel, if there is one
> -- backlight: phandle of the backlight device attached to the panel
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/tfc,s9700rtwv43tr-01b.yaml b/Documentation/devicetree/bindings/display/panel/tfc,s9700rtwv43tr-01b.yaml
> new file mode 100644
> index 000000000000..614f4a8d8403
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/tfc,s9700rtwv43tr-01b.yaml
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/tfc,s9700rtwv43tr-01b.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TFC S9700RTWV43TR-01B 7" Three Five Corp 800x480 LCD panel with resistive touch
> +
> +maintainers:
> +  - Jyri Sarha <jsarha@ti.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +description: |+
> +  The panel is found on TI AM335x-evm.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: tfc,s9700rtwv43tr-01b
> +
> +  enable-gpios: true
> +  backlight: true

There's the same remark than on patch 6. Once figured out,
Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--6oswsdiie6i3dzo4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXRHUBQAKCRDj7w1vZxhR
xSecAQDqKErYh7aZkwXVNAT5hV+bceLec0CBY2P1sXgUXMVl2QEAiZkB70zuoLHW
mVBhETT1uXuxRYOs/+Qq9uTmPvvCigI=
=LEEZ
-----END PGP SIGNATURE-----

--6oswsdiie6i3dzo4--

--===============1767275992==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1767275992==--
