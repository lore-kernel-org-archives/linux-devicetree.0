From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [patch 2/2] dt-bindings Help for MCP ADCs
Date: Thu, 12 Mar 2015 10:18:36 +0000
Message-ID: <550167FC.6010904@kernel.org>
References: <1426022097.5476.39.camel@sanws1.rosetechnology.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426022097.5476.39.camel-rRCAEZI4IAEDelDkmA0sXqLhmOlAk3PJ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U8O4cmVuIEFuZGVyc2Vu?= <san-KGKi0rHxN0fKWSuBa/xFvVpr/1R2p/CL@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Applied to the togreg branch of iio.git. Initially pushed out as
testing for the autobuilders to play.

Thanks

Jonathan
On 10/03/15 21:14, S=C3=B8ren Andersen wrote:
> Signed-off-by: Soeren Andersen <san at rosetechnology.dk>
> ---
> Documentation/devicetree/bindings/iio/adc/mcp320x.txt | 30 ++++++++++=
++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/iio/adc/mcp320x.txt b/=
Documentation/devicetree/bindings/iio/adc/mcp320x.txt
> new file mode 100644
> index 0000000..b851843
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/mcp320x.txt
> @@ -0,0 +1,30 @@
> +* Microchip Analog to Digital Converter (ADC)
> +
> +The node for this driver must be a child node of a SPI controller, h=
ence
> +all mandatory properties described in
> +
> +        Documentation/devicetree/bindings/spi/spi-bus.txt
> +
> +must be specified.
> +
> +Required properties:
> +	- compatible:  	Must be one of the following, depending on the
> +			model:
> +				"mcp3001"
> +				"mcp3002"
> +				"mcp3004"
> +				"mcp3008"
> +				"mcp3201"
> +				"mcp3202"
> +				"mcp3204"
> +				"mcp3208"
> +
> +
> +Examples:
> +spi_controller {
> +	mcp3x0x@0 {
> +		compatible =3D "mcp3002";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <1000000>;
> +	};
> +};
>=20
>=20
