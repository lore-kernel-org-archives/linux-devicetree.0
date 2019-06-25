From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 06/15] dt-bindings: display: Convert dlc,dlc0700yzg-1
 panel to DT schema
Date: Tue, 25 Jun 2019 09:55:42 +0200
Message-ID: <20190625075542.u5kzex4cbrcss5ga@flea>
References: <20190624215649.8939-1-robh@kernel.org>
 <20190624215649.8939-7-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0476283286=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190624215649.8939-7-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>
List-Id: devicetree@vger.kernel.org


--===============0476283286==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="frjixve4rb2lda6m"
Content-Disposition: inline


--frjixve4rb2lda6m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Jun 24, 2019 at 03:56:40PM -0600, Rob Herring wrote:
> Convert the dlc,dlc0700yzg-1 panel binding to DT schema.
>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../display/panel/dlc,dlc0700yzg-1.txt        | 13 ---------
>  .../display/panel/dlc,dlc0700yzg-1.yaml       | 28 +++++++++++++++++++
>  2 files changed, 28 insertions(+), 13 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.txt b/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.txt
> deleted file mode 100644
> index bf06bb025b08..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.txt
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -DLC Display Co. DLC0700YZG-1 7.0" WSVGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "dlc,dlc0700yzg-1"
> -- power-supply: See simple-panel.txt
> -
> -Optional properties:
> -- reset-gpios: See panel-common.txt
> -- enable-gpios: See simple-panel.txt
> -- backlight: See simple-panel.txt
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml b/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml
> new file mode 100644
> index 000000000000..1b0b63d46f3e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml
> @@ -0,0 +1,28 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/dlc,dlc0700yzg-1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: DLC Display Co. DLC0700YZG-1 7.0" WSVGA TFT LCD panel
> +
> +maintainers:
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: dlc,dlc0700yzg-1
> +
> +  reset-gpios: true
> +  enable-gpios: true
> +  backlight: true

Do we need to list them?

Since we don't have additionalItems, it doesn't really change anything
since it will be validated by panel-common.

Either way, it should be consistent between your patches, and the
previous patches in this series didn't list all the properties in the
binding.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--frjixve4rb2lda6m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXRHTfgAKCRDj7w1vZxhR
xckbAP9haADI6iVzGhwqdxZYMaptx5O2GF8fzxwrKHZAZdAcJwEA3R3Tmk1C/okO
mASJ6FAiJiVOZxzo24B0UCtOmozocA0=
=EraD
-----END PGP SIGNATURE-----

--frjixve4rb2lda6m--

--===============0476283286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0476283286==--
