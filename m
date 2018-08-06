Return-Path: <SRS0=6rqM=KV=linaro.org=bjorn.andersson@kernel.org>
Date: Mon, 6 Aug 2018 11:03:37 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: Add binding for Qualcomm CCI
 I2C controller
Message-ID: <20180806180337.GB21235@tuxbook-pro>
References: <20180806110416.4288-1-vkoul@kernel.org>
 <20180806110416.4288-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180806110416.4288-2-vkoul@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Mon 06 Aug 04:04 PDT 2018, Vinod Koul wrote:

> From: Todor Tomov <todor.tomov@linaro.org>
> 
> Add DT binding document for Qualcomm Camera Control Interface (CCI)
> I2C controller.
> 
> Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/i2c/i2c-qcom-cci.txt       | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> new file mode 100644
> index 000000000000..977978dd4444
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> @@ -0,0 +1,55 @@
> +Qualcomm Camera Control Interface (CCI) I2C controller
> +
> +Required properties:
> + - compatible: Should be one of:
> +   - "qcom,cci-v1.0.8" for 8916;
> +   - "qcom,cci-v1.4.0" for 8996.

As pointed out by Rob previously we should either use version numbers or
platform numbers, not both.

So this should either be:

	- "qcom,cci-v1.0.8"
	- "qcom,cci-v1.4.0"

or:

	- "qcom,msm8916-cci"
	- "qcom,msm8996-cci"

> + - #address-cells: Should be <1>.
> + - #size-cells: Should be <0>.
> + - reg: Base address of the I2C controller and length of memory mapped region.
> + - interrupts: Specifier for CCI I2C interrupt.
> + - clocks: List of clock specifiers, one for each entry in clock-names.
> + - clock-names: Should contain:
> +   - "mmss_mmagic_ahb" - on qcom,cci-v1.4.0 only;
> +   - "camss_top_ahb";
> +   - "cci_ahb";
> +   - "cci";
> +   - "camss_ahb".
> +
> +Required subnodes:
> + - i2c-bus instances:
> +	 Mandatory i2c-bus0 subnode
> +	 Mandatory i2c-bus1 for qcom,cci-v1.4.0

Rather than a bullet list, the subnodes are probably better described in
text. I think most versions have two masters, so in order to not have to
update this every time we add a new compatible we could probably write
this in a more generic fashion.

E.g.

Required subnodes:

The CCI provides I2C masters for one or two i2c busses, described as
subdevices named "i2c-bus0" and "i2c-bus1".

> + - Optional properties:

"Optional properties for subnodes"

> +	- clock-frequency: Desired I2C bus clock frequency
> +	  in Hz, defaults to 100 kHz if omitted.
> +
> +Required properties on qcom,cci-v1.4.0:
> + - power-domains: Power domain specifier.

Properties has to come before any subnodes in the dts, so move this
above the subnode definition as well.

> +
> +Example:
> +
> +                cci@a0c000 {
> +                        compatible = "qcom,cci-v1.4.0";
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +                        reg = <0xa0c000 0x1000>;
> +                        interrupts = <GIC_SPI 295 IRQ_TYPE_EDGE_RISING>;
> +                        power-domains = <&mmcc CAMSS_GDSC>;
> +                        clocks = <&mmcc MMSS_MMAGIC_AHB_CLK>,
> +                                        <&mmcc CAMSS_TOP_AHB_CLK>,
> +                                        <&mmcc CAMSS_CCI_AHB_CLK>,
> +                                        <&mmcc CAMSS_CCI_CLK>,
> +                                        <&mmcc CAMSS_AHB_CLK>;
> +                        clock-names = "mmss_mmagic_ahb",
> +                                        "camss_top_ahb",
> +                                        "cci_ahb",
> +                                        "cci",
> +                                        "camss_ahb";

Seems lines above this is indented with space and the following with
tabs.

> +			i2c-bus0 {
> +	                        clock-frequency = <400000>;
> +			};
> +			i2c-bus1 {
> +				clock-frequency = <400000>;
> +			};
> +                };

Regards,
Bjorn
