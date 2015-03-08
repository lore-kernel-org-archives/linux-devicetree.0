From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: ti-adc128s052: Add DT binding documentation
Date: Sun, 08 Mar 2015 12:36:24 +0000
Message-ID: <54FC4248.3080100@kernel.org>
References: <1424085712-22275-1-git-send-email-angelo.compagnucci@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424085712-22275-1-git-send-email-angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 16/02/15 11:21, Angelo Compagnucci wrote:
> Adding binding documentation for Texas Instruments' ADC128S052 ADC chip.
Patch is fine, but missing a signed-off-by line.
> ---
>  .../devicetree/bindings/iio/adc/ti-adc128s052.txt      | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-adc128s052.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti-adc128s052.txt b/Documentation/devicetree/bindings/iio/adc/ti-adc128s052.txt
> new file mode 100644
> index 0000000..c8d682b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti-adc128s052.txt
> @@ -0,0 +1,18 @@
> +* Texas Instruments' ADC128S052 ADC chip
> +
> +Required properties:
> + - compatible: Should be "ti,adc128s052"
> + - reg: spi chip select number for the device
> + - vref-supply: The regulator supply for ADC reference voltage
> +
> +Recommended properties:
> + - spi-max-frequency: Definition as per
> +		Documentation/devicetree/bindings/spi/spi-bus.txt
> +
> +Example:
> +adc@0 {
> +	compatible = "ti,adc128s052";
> +	reg = <0>;
> +	vref-supply = <&vdd_supply>;
> +	spi-max-frequency = <1000000>;
> +};
> 
