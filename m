From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: iio: dac: ti-dac082s085: Document new
 driver
Date: Sun, 10 Sep 2017 16:12:11 +0100
Message-ID: <20170910161211.617f241f@archlinux>
References: <cceeb1a985343d36dc90d2708371f3e1a73264f6.1504602350.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cceeb1a985343d36dc90d2708371f3e1a73264f6.1504602350.git.lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Mathias Duckeck <m.duckeck-XB/JSsFECOqzQB+pC5nmwQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 5 Sep 2017 11:27:00 +0200
Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org> wrote:

> Add device tree bindings for Texas Instruments 8/10/12-bit 2/4-channel
> DAC driver.
> 
> Cc: Mathias Duckeck <m.duckeck-XB/JSsFECOqzQB+pC5nmwQ@public.gmane.org>
> Signed-off-by: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>

Looks good for me.  Lets see what Mark / Rob think.

Thanks,

Jonathan

> ---
>  .../devicetree/bindings/iio/dac/ti-dac082s085.txt  | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/dac/ti-dac082s085.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/dac/ti-dac082s085.txt b/Documentation/devicetree/bindings/iio/dac/ti-dac082s085.txt
> new file mode 100644
> index 000000000000..9cb0e10df704
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/ti-dac082s085.txt
> @@ -0,0 +1,34 @@
> +Texas Instruments 8/10/12-bit 2/4-channel DAC driver
> +
> +Required properties:
> + - compatible:		Must be one of:
> +			"ti,dac082s085"
> +			"ti,dac102s085"
> +			"ti,dac122s085"
> +			"ti,dac084s085"
> +			"ti,dac104s085"
> +			"ti,dac124s085"
> + - reg: 		Chip select number.
> + - spi-cpha, spi-cpol:	SPI mode (0,1) or (1,0) must be used, so specify
> +			either spi-cpha or spi-cpol (but not both).
> + - vref-supply: 	Phandle to the external reference voltage supply.
> +
> +For other required and optional properties of SPI slave nodes please refer to
> +../../spi/spi-bus.txt.
> +
> +Example:
> +	vref_2v5_reg: regulator-vref {
> +		compatible = "regulator-fixed";
> +		regulator-name = "2v5";
> +		regulator-min-microvolt = <2500000>;
> +		regulator-max-microvolt = <2500000>;
> +		regulator-always-on;
> +	};
> +
> +	dac@0 {
> +		compatible = "ti,dac082s085";
> +		reg = <0>;
> +		spi-max-frequency = <40000000>;
> +		spi-cpol;
> +		vref-supply = <&vref_2v5_reg>;
> +	};
