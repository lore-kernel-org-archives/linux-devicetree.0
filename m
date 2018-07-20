Return-Path: <robherring2@gmail.com>
Date: Fri, 20 Jul 2018 12:03:18 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: Add binding document for
 Qualcomm CCI
Message-ID: <20180720180318.GA14573@rob-hp-laptop>
References: <20180717125729.23045-1-vkoul@kernel.org>
 <20180717125729.23045-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180717125729.23045-2-vkoul@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-i2c@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jul 17, 2018 at 06:27:28PM +0530, Vinod Koul wrote:
> From: Todor Tomov <todor.tomov@linaro.org>
> 
> Add DT binding document for Qualcomm Camera Control Interface device
> 
> Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/i2c/i2c-qcom-cci.txt       | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> new file mode 100644
> index 000000000000..cb1fe158fba3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> @@ -0,0 +1,46 @@
> +Qualcomm Camera Control Interface controller
> +
> +Required properties:
> + - compatible: Should be one of:
> +   - "qcom,cci-v1.0.8" for 8916;
> +   - "qcom,cci-v1.4.0" for 8996.

It's not very convincing to use version numbers instead of normal SoC 
part# convention when there is a 1-1 mapping.

> + - #address-cells: Should be <1>.
> + - #size-cells: Should be <0>.
> + - reg: Base address of the controller and length of memory mapped region.
> + - interrupts: Specifier for CCI interrupt.
> + - clocks: List of clock specifiers, one for each entry in clock-names.
> + - clock-names: Should contain:
> +   - "mmss_mmagic_ahb" - on 8996 only;
> +   - "camss_top_ahb";
> +   - "cci_ahb";
> +   - "cci";
> +   - "camss_ahb".
> +
> +Required properties on 8996:

Rather than '8996', use the compatible string.

> + - power-domains: Power domain specifier.
> +
> +Optional:
> + - clock-frequency: Desired I2C bus clock frequency in Hz, defaults to 100 kHz
> +   if omitted.

This is the only place that says this block is or has a I2C controller. 
Please make that more explicit (including what ever else this block 
does). I'm guessing there's more given how many clocks and that it has a 
power domain.

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
> +                        clock-frequency = <400000>;
> +                };
> -- 
> 2.14.4
> 
