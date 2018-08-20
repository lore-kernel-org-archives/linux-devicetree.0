Return-Path: <robherring2@gmail.com>
Date: Mon, 20 Aug 2018 13:18:59 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: i2c: Add binding for Qualcomm CCI
 I2C controller
Message-ID: <20180820181859.GA3439@bogus>
References: <20180820063953.6866-1-vkoul@kernel.org>
 <20180820063953.6866-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180820063953.6866-2-vkoul@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Aug 20, 2018 at 12:09:52PM +0530, Vinod Koul wrote:
> From: Todor Tomov <todor.tomov@linaro.org>
> 
> Add DT binding document for Qualcomm Camera Control Interface (CCI)
> I2C controller.
> 
> Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/i2c/i2c-qcom-cci.txt       | 83 ++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> new file mode 100644
> index 000000000000..b7f4240ce5c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> @@ -0,0 +1,83 @@
> +Qualcomm Camera Control Interface (CCI) I2C controller
> +
> +PROPERTIES:
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be one of:
> +		"qcom,msm-8916-cci"
> +		"qcom,msm-8996-cci"

I think everywhere else is 'msm8916' and 'msm8996'.

> +
> +- reg
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: base address CCI I2C controller and length of memory
> +		    mapped region.
> +
> +- interrupts:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: specifies the CCI I2C interrupt. The format of the
> +		    specifier is defined by the binding document describing
> +		    the node's interrupt parent.
> +
> +- clocks:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: a list of phandle, should contain an entry for each
> +		    entries in clock-names.
> +
> +- clock-names
> +	Usage: required
> +	Value type: <string>
> +	Definition: a list of clock names, must include these entries:
> +		"mmss_mmagic_ahb" - on "qcom,msm-8996-cci" only;
> +		"camss_top_ahb";
> +		"cci_ahb";
> +		"cci";
> +		"camss_ahb";
> +
> +- power-domains
> +	Usage: required for "qcom,msm-8996-cci"
> +	Value type: <prop-encoded-array>
> +	Definition:
> +
> +SUBNODES:
> +
> +The CCI provides I2C masters for one or two i2c busses, described as
> +subdevices named "i2c-bus0" and "i2c-bus1".

Use a unit-address and reg property with 0 and 1 here.

With those fixed,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +PROPERTIES:
> +
> +- clock-frequency:
> +	Usage: optional
> +	Value type: <u32>
> +	Definition: Desired I2C bus clock frequency in Hz, defaults to 100
> +		    kHz if omitted.
> +
> +Example:
> +
> +	cci@a0c000 {
> +		compatible = "qcom,msm-8996-cci";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0xa0c000 0x1000>;
> +		interrupts = <GIC_SPI 295 IRQ_TYPE_EDGE_RISING>;
> +		clocks = <&mmcc MMSS_MMAGIC_AHB_CLK>,
> +                <&mmcc CAMSS_TOP_AHB_CLK>,
> +                <&mmcc CAMSS_CCI_AHB_CLK>,
> +                <&mmcc CAMSS_CCI_CLK>,
> +                <&mmcc CAMSS_AHB_CLK>;
> +		clock-names = "mmss_mmagic_ahb",
> +			"camss_top_ahb",
> +			"cci_ahb",
> +			"cci",
> +			"camss_ahb";
> +		i2c-bus0 {
> +			clock-frequency = <400000>;
> +		};
> +		i2c-bus1 {
> +			clock-frequency = <400000>;
> +		};
> +	};
> -- 
> 2.14.4
> 
