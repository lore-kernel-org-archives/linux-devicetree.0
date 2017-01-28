From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: adc: Add Renesas GyroADC bindings
Date: Sat, 28 Jan 2017 11:36:37 +0000
Message-ID: <b1ee3630-bc07-6321-7eef-e16dc8a5d75a@kernel.org>
References: <20170127230837.9322-1-marek.vasut@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170127230837.9322-1-marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 27/01/17 23:08, Marek Vasut wrote:
> From: Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Add DT bindings for the Renesas RCar GyroADC block. This block is
> a simple 4/8-channel ADC which samples 12/15/24 bits of data every
> cycle from all channels.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> Cc: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
> Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks,

Jonathan
> ---
> V8: - Sync the version with the 2/2 driver patch
>     - Drop status prop from example
>     - Add GyroADC block description
>     - Enumerate the compatible string values
>     - Make subnodes mandatory
> V9: - Replace &adc with adc@e6e54000
>     - Add Rob's ACK
> ---
>  .../bindings/iio/adc/renesas,gyroadc.txt           | 99 ++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/renesas,gyroadc.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/renesas,gyroadc.txt b/Documentation/devicetree/bindings/iio/adc/renesas,gyroadc.txt
> new file mode 100644
> index 000000000000..f5b0adae6010
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/renesas,gyroadc.txt
> @@ -0,0 +1,99 @@
> +* Renesas RCar GyroADC device driver
> +
> +The GyroADC block is a reduced SPI block with up to 8 chipselect lines,
> +which supports the SPI protocol of a selected few SPI ADCs. The SPI ADCs
> +are sampled by the GyroADC block in a round-robin fashion and the result
> +presented in the GyroADC registers.
> +
> +Required properties:
> +- compatible:	Should be "<soc-specific>", "renesas,rcar-gyroadc".
> +                The <soc-specific> should be one of:
> +		renesas,r8a7791-gyroadc - for the GyroADC block present
> +					  in r8a7791 SoC
> +		renesas,r8a7792-gyroadc - for the GyroADC with interrupt
> +					  block present in r8a7792 SoC
> +- reg:		Address and length of the register set for the device
> +- clocks:	References to all the clocks specified in the clock-names
> +		property as specified in
> +		Documentation/devicetree/bindings/clock/clock-bindings.txt.
> +- clock-names:	Shall contain "fck" and "if". The "fck" is the GyroADC block
> +		clock, the "if" is the interface clock.
> +- power-domains: Must contain a reference to the PM domain, if available.
> +- #address-cells: Should be <1> (setting for the subnodes) for all ADCs
> +		except for "fujitsu,mb88101a". Should be <0> (setting for
> +		only subnode) for "fujitsu,mb88101a".
> +- #size-cells:	Should be <0> (setting for the subnodes)
> +
> +Sub-nodes:
> +You must define subnode(s) which select the connected ADC type and reference
> +voltage for the GyroADC channels.
> +
> +Required properties for subnodes:
> +- compatible:	Should be either of:
> +		"fujitsu,mb88101a"
> +			- Fujitsu MB88101A compatible mode,
> +			  12bit sampling, up to 4 channels can be sampled in
> +			  round-robin fashion. One Fujitsu chip supplies four
> +			  GyroADC channels with data as it contains four ADCs
> +			  on the chip and thus for 4-channel operation, single
> +			  MB88101A is required. The Cx chipselect lines of the
> +			  MB88101A connect directly to two CHS lines of the
> +			  GyroADC, no demuxer is required. The data out line
> +			  of each MB88101A connects to a shared input pin of
> +			  the GyroADC.
> +		"ti,adcs7476" or "ti,adc121" or "adi,ad7476"
> +			- TI ADCS7476 / TI ADC121 / ADI AD7476 compatible mode,
> +			  15bit sampling, up to 8 channels can be sampled in
> +			  round-robin fashion. One TI/ADI chip supplies single
> +			  ADC channel with data, thus for 8-channel operation,
> +			  8 chips are required. A 3:8 chipselect demuxer is
> +			  required to connect the nCS line of the TI/ADI chips
> +			  to the GyroADC, while MISO line of each TI/ADI ADC
> +			  connects to a shared input pin of the GyroADC.
> +		"maxim,max1162" or "maxim,max11100"
> +			- Maxim MAX1162 / Maxim MAX11100 compatible mode,
> +			  16bit sampling, up to 8 channels can be sampled in
> +			  round-robin fashion. One Maxim chip supplies single
> +			  ADC channel with data, thus for 8-channel operation,
> +			  8 chips are required. A 3:8 chipselect demuxer is
> +			  required to connect the nCS line of the MAX chips
> +			  to the GyroADC, while MISO line of each Maxim ADC
> +			  connects to a shared input pin of the GyroADC.
> +- reg:		Should be the number of the analog input. Should be present
> +		for all ADCs except "fujitsu,mb88101a".
> +- vref-supply:	Reference to the channel reference voltage regulator.
> +
> +Example:
> +	vref_max1162: regulator-vref-max1162 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "MAX1162 Vref";
> +		regulator-min-microvolt = <4096000>;
> +		regulator-max-microvolt = <4096000>;
> +	};
> +
> +	adc@e6e54000 {
> +		compatible = "renesas,r8a7791-gyroadc", "renesas,rcar-gyroadc";
> +		reg = <0 0xe6e54000 0 64>;
> +		clocks = <&mstp9_clks R8A7791_CLK_GYROADC>, <&clk_65m>;
> +		clock-names = "fck", "if";
> +		power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
> +
> +		pinctrl-0 = <&adc_pins>;
> +		pinctrl-names = "default";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		adc@0 {
> +			reg = <0>;
> +			compatible = "maxim,max1162";
> +			vref-supply = <&vref_max1162>;
> +		};
> +
> +		adc@1 {
> +			reg = <1>;
> +			compatible = "maxim,max1162";
> +			vref-supply = <&vref_max1162>;
> +		};
> +	};
> 
