Return-Path: <robherring2@gmail.com>
Date: Tue, 23 Oct 2018 10:43:19 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 2/2] doc:devicetree: Add AD7949 device tree bindings
 in documentation
Message-ID: <20181023154319.GA17996@bogus>
References: <20181022210243.837-1-charles-antoine.couret@essensium.com>
 <20181022210243.837-2-charles-antoine.couret@essensium.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181022210243.837-2-charles-antoine.couret@essensium.com>
To: Charles-Antoine Couret <charles-antoine.couret@essensium.com>
Cc: linux-iio@vger.kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Oct 22, 2018 at 11:02:43PM +0200, Charles-Antoine Couret wrote:
> Description how to invoke ad7949 driver from device tree file.

Use subject prefixes that match the subsystem (i.e run git log --oneline 
<dir> to see). Something like this would be better:

dt-bindings: iio: adc: Add Analog Devices AD7949, AD7682 and AD7689

> 
> Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@essensium.com>
> ---
> V1 to V3:
> * Add prefix vendor
> * Improve patch description
> 
>  .../devicetree/bindings/iio/adc/ad7949.txt     | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/ad7949.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/ad7949.txt b/Documentation/devicetree/bindings/iio/adc/ad7949.txt
> new file mode 100644
> index 000000000000..f1c3af53f5cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ad7949.txt
> @@ -0,0 +1,18 @@
> +* Analog Devices AD7949/AD7682/AD7689
> +
> +Required properties:
> + - compatible: Should be one of
> +	* "adi,ad7949"
> +	* "adi,ad7682"
> +	* "adi,ad7689"
> + - reg: spi chip select number for the device
> + - vref-supply: The regulator supply for ADC reference voltage
> + - spi-max-frequency: Max SPI frequency to use (< 33000000)

This should be optional and only be needed if the frequency needs to be 
limited below what the host and device can support. IOW, a board 
limitation. The host and device drivers already need to know their 
maximum frequencies to validate this value.

> +
> +Example:
> +adc@0 {
> +	compatible = "adi,ad7949";
> +	reg = <0>;
> +	vref-supply = <&vdd_supply>;
> +	spi-max-frequency = <200000>;
> +};
> -- 
> 2.19.1
> 
