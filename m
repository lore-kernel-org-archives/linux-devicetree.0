From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RFC 05/14] dt-bindings/interrupt-controller: pdc: add SPI
 config register
Date: Mon, 02 Sep 2019 14:38:57 +0100
Message-ID: <5d6d1b72.1c69fb81.ee88.efcf@mx.google.com>
References: <20190829181203.2660-1-ilina@codeaurora.org>
 <20190829181203.2660-6-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190829181203.2660-6-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>
Cc: swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, mkshah@codeaurora.org, linux-gpio@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 29, 2019 at 12:11:54PM -0600, Lina Iyer wrote:
> In addition to configuring the PDC, additional registers that interface
> the GIC have to be configured to match the GPIO type. The registers on
> some QCOM SoCs are access restricted, while on other SoCs are not. They
> SoCs with access restriction to these SPI registers need to be written

Took me a minute to figure out this is GIC SPI interrupts, not SPI bus.

> from the firmware using the SCM interface. Add a flag to indicate if the
> register is to be written using SCM interface.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
>  .../bindings/interrupt-controller/qcom,pdc.txt           | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> index 8e0797cb1487..852fcba98ea6 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> @@ -50,15 +50,22 @@ Properties:
>  		    The second element is the GIC hwirq number for the PDC port.
>  		    The third element is the number of interrupts in sequence.
>  
> +- qcom,scm-spi-cfg:
> +	Usage: optional
> +	Value type: <bool>
> +	Definition: Specifies if the SPI configuration registers have to be
> +		    written from the firmware.
> +
>  Example:
>  
>  	pdc: interrupt-controller@b220000 {
>  		compatible = "qcom,sdm845-pdc";
> -		reg = <0xb220000 0x30000>;
> +		reg = <0xb220000 0x30000>, <0x179900f0 0x60>;

There needs to be a description for reg updated. These aren't GIC 
registers are they? Because those go in the GIC node.

>  		qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
>  		#interrupt-cells = <2>;
>  		interrupt-parent = <&intc>;
>  		interrupt-controller;
> +		qcom,scm-spi-cfg;
>  	};
>  
>  DT binding of a device that wants to use the GIC SPI 514 as a wakeup
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
