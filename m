From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v11 4/7] dt-bindings: sun6i-dsi: Add VCC-DSI supply
 property
Date: Thu, 3 Oct 2019 13:47:33 +0200
Message-ID: <20191003114733.56mlar666l76uoyb@gilmour>
References: <20191003064527.15128-1-jagan@amarulasolutions.com>
 <20191003064527.15128-5-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="abhaj7rlytqkllsn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191003064527.15128-5-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, michael@amarulasolutions.com, Icenowy Zheng <icenowy@aosc.io>, linux-sunxi <linux-sunxi@googlegroups.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--abhaj7rlytqkllsn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 03, 2019 at 12:15:24PM +0530, Jagan Teki wrote:
> Allwinner MIPI DSI controllers are supplied with SoC DSI
> power rails via VCC-DSI pin.
>
> Some board still work without supplying this but give more
> faith on datasheet and hardware schematics and document this
> supply property in required property list.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Tested-by: Merlijn Wajer <merlijn@wizzup.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  .../bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml         | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> index 47950fced28d..9d4c25b104f6 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> @@ -36,6 +36,9 @@ properties:
>    resets:
>      maxItems: 1
>
> +  vcc-dsi-supply:
> +    description: VCC-DSI power supply of the DSI encoder
> +

The driver treats it as mandatory, so I've added it to the binding, as
suggested by the commit log.

Maxime

--abhaj7rlytqkllsn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZXf1QAKCRDj7w1vZxhR
xQpxAP98mYp2+COHS85N0R4A/9rdJqX3YHaZ0XyYCj2Ihb0iVQD/QWC0ZaUcuku4
nKva2ZQhgqqxhRK3v8jH9MrfregJmAE=
=CYoo
-----END PGP SIGNATURE-----

--abhaj7rlytqkllsn--
