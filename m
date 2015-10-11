From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/5] Documentation: add the binding file for Freescale
 imx7d ADC driver
Date: Sun, 11 Oct 2015 14:31:35 +0100
Message-ID: <561A64B7.6000006@kernel.org>
References: <1444301948-21721-1-git-send-email-haibo.chen@freescale.com>
 <1444301948-21721-2-git-send-email-haibo.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444301948-21721-2-git-send-email-haibo.chen@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Haibo Chen <haibo.chen@freescale.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, shawnguo@kernel.org, kernel@pengutronix.de, mturquette@baylibre.com, sboyd@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-iio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/10/15 11:59, Haibo Chen wrote:
> The patch adds the binding file for Freescale imx7d ADC driver.
> 
> Signed-off-by: Haibo Chen <haibo.chen@freescale.com>
Couple of trivial typos..  otherwise fine.
> ---
>  .../devicetree/bindings/iio/adc/imx7d-adc.txt      | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/imx7d-adc.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/imx7d-adc.txt b/Documentation/devicetree/bindings/iio/adc/imx7d-adc.txt
> new file mode 100644
> index 0000000..6b21fd27
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/imx7d-adc.txt
> @@ -0,0 +1,26 @@
> +Freescale imx7d ADC bindings
> +
> +The devicetree bingdings are for the nwe ADC driver written for
> +imx7d SoC.
bindings and new
> +
> +Required properties:
> +- compatible: Should be "fsl,imx7d-adc"
> +- reg: Offset and length of the register set for the ADC device
> +- interrupts: The interrupt number for the ADC device
> +- clocks: The root clock of the ADC controller
> +- clock-names: Must contain "adc", matching entry in the clocks property
> +- vref-supply: The regulator supply ADC reference voltage
> +
> +Optional properties:
> +- num-channels: the number of channels used
> +
> +Example:
> +adc1: adc@30610000 {
> +	compatible = "fsl,imx7d-adc";
> +	reg = <0x30610000 0x10000>;
> +	interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks = <&clks IMX7D_ADC_ROOT_CLK>;
> +	clock-names = "adc";
> +	num-channels = <4>;
> +	vref-supply = <&reg_vcc_3v3_mcu>;
> +};
> 
