From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v6 12/22] dt-bindings: sun6i-dsi: Add VCC-DSI supply
 property
Date: Fri, 25 Jan 2019 16:47:28 +0100
Message-ID: <20190125154728.v555gwwmramamm32@flea>
References: <20190124195900.22620-1-jagan@amarulasolutions.com>
 <20190124195900.22620-13-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rxheysiip7de6ngo"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190124195900.22620-13-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, Michael Trimarchi <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--rxheysiip7de6ngo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2019 at 01:28:50AM +0530, Jagan Teki wrote:
> Most of the Allwinner MIPI DSI controllers are supply with
> VCC-DSI pin. which need to supply for some of the boards to
> trigger the power.
>=20
> So, document the supply property so-that the required board
> can eable it via device tree.
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.tx=
t b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
> index 6a6cf5de08b0..69e233e8fad1 100644
> --- a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
> +++ b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
> @@ -27,6 +27,9 @@ Required properties:
>      first port should be the input endpoint, usually coming from the
>      associated TCON.
> =20
> +Optional properties:
> +  - vcc-dsi-supply: the VCC-DSI power supply of the DSI encoder
> +

It looks like the VCC power rail is found on all the Allwinner SoCs,
so it should be made mandatory.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--rxheysiip7de6ngo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXEsvkAAKCRDj7w1vZxhR
xf/OAP0WFHQ2cdrPgixtVKbGRa8+3plVbGmUXVqKYzSxl+m8RgD+MLbJ/e6QTJxZ
Qeh6FvUCYWAnW67OMEHzja+FQr7BAgY=
=RBpI
-----END PGP SIGNATURE-----

--rxheysiip7de6ngo--
