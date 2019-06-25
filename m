From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/4] dt-bindings: iio: frequency: Use dt-schema for
 clock-names
Date: Tue, 25 Jun 2019 10:30:36 +0200
Message-ID: <20190625083036.jrr7kz7f6ks6nqps@flea>
References: <1561389097-26075-1-git-send-email-stefan.popa@analog.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3yps4smao6vtc5y5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1561389097-26075-1-git-send-email-stefan.popa@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Popa <stefan.popa@analog.com>
Cc: jic23@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, Michael.Hennerich@analog.com, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--3yps4smao6vtc5y5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Jun 24, 2019 at 06:11:37PM +0300, Stefan Popa wrote:
> Dt-schema can be used for clock-names property.
>
> Signed-off-by: Stefan Popa <stefan.popa@analog.com>
> ---
>  Documentation/devicetree/bindings/iio/frequency/adf4371.yaml | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml b/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
> index d7adf074..8a2a8f6 100644
> --- a/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
> +++ b/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
> @@ -27,9 +27,8 @@ properties:
>      maxItems: 1
>
>    clock-names:
> -    description:
> -      Must be "clkin"
> -    maxItems: 1
> +    items:
> +      - clkin

You can even just have const: clkin here

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--3yps4smao6vtc5y5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXRHbrAAKCRDj7w1vZxhR
xQZuAQC9jlgQRUnCtCGNePxUg5qP7pF5UA7RwPOekZVZTRmsvwD/c9wseWa2S6Qf
Iz+4hrxBAEEHVy3f/iOqUj5u6guy/AQ=
=k49w
-----END PGP SIGNATURE-----

--3yps4smao6vtc5y5--
