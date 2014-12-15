From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 1/2] iio: document ti-dac8554 devicetree bindings
Date: Mon, 15 Dec 2014 13:02:48 +0000
Message-ID: <20141215130248.GA8264@leverpostej>
References: <1418643605-15554-1-git-send-email-nikolaus.schulz@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1418643605-15554-1-git-send-email-nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikolaus Schulz <nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 15, 2014 at 11:39:56AM +0000, Nikolaus Schulz wrote:
> Signed-off-by: Nikolaus Schulz <nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/dac/ti-dac8554.txt     | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/dac/ti-dac8554.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/dac/ti-dac8554.txt b/Documentation/devicetree/bindings/iio/dac/ti-dac8554.txt
> new file mode 100644
> index 0000000..32e96859
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/ti-dac8554.txt
> @@ -0,0 +1,22 @@
> +TI DAC8554 Digital to Analog Converter
> +
> +This driver supports the SPI bus.

The binding need not refer to the driver, this sentence can go. It might
be worth adding "(SPI)" to the first line.

> +
> +Required properties:
> +	- compatible: must be "ti,dac8554"
> +	- vref-supply: the vref power supply
> +	- ti,address: the additional 2-bit chip address
> +
> +For required properties on SPI, please consult
> +Documentation/devicetree/bindings/spi/spi-bus.txt
> +
> +Example:
> +
> +	dac8554@0 {
> +		compatible = "ti,dac8554";
> +		reg = <0>;
> +		spi-max-frequency = <50000000>;
> +
> +		vref-supply = <&vdd_vref>;
> +		ti,address = <0>;

What's this property used for?

> +	};

Otherwise this looks sane to me.

Mark.
