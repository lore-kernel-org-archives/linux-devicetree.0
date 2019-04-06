From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH 7/9] dt-bindings: power: avs: Add support for CPR
 (Core Power Reduction)
Date: Sat, 06 Apr 2019 01:07:26 -0500
Message-ID: <5ca84220.1c69fb81.2daad.3164@mx.google.com>
References: <20190404050931.9812-1-niklas.cassel@linaro.org>
 <20190404050931.9812-8-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190404050931.9812-8-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 04, 2019 at 07:09:28AM +0200, Niklas Cassel wrote:
> Add DT bindings to describe the CPR HW found on certain Qualcomm SoCs.
> 
> Co-developed-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> ---
>  .../bindings/power/avs/qcom,cpr.txt           | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
> 
> diff --git a/Documentation/devicetree/bindings/power/avs/qcom,cpr.txt b/Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
> new file mode 100644
> index 000000000000..541c9b31cd3b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
> @@ -0,0 +1,119 @@
> +QCOM CPR (Core Power Reduction)
> +
> +CPR (Core Power Reduction) is a technology to reduce core power on a CPU
> +or other device. Each OPP of a device corresponds to a "corner" that has
> +a range of valid voltages for a particular frequency. While the device is
> +running at a particular frequency, CPR monitors dynamic factors such as
> +temperature, etc. and suggests adjustments to the voltage to save power
> +and meet silicon characteristic requirements.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be "qcom,cpr"

Needs to be SoC specific.

> +
> +- reg:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: base address and size of the rbcpr register region
> +
> +- interrupts:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: list of three interrupts in order of irq0, irq1, irq2

Does each irq have some defined meaning/function?

> +
> +- acc-syscon:
> +	Usage: optional
> +	Value type: <phandle>
> +	Definition: phandle to syscon for writing ACC settings
> +
> +- nvmem:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: phandle to nvmem provider containing efuse settings
> +
> +- nvmem-names:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be "qfprom"
> +
> +vdd-mx-supply = <&pm8916_l3>;
> +
> +- qcom,cpr-ref-clk:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: rate of reference clock in kHz

Can't you use the clock binding for this?

> +
> +- qcom,cpr-timer-delay-us:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: delay in uS for the timer interval
> +
> +- qcom,cpr-timer-cons-up:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: Consecutive number of timer intervals, or units of
> +		    qcom,cpr-timer-delay-us, that occur before issuing an up
> +		    interrupt
> +
> +- qcom,cpr-timer-cons-down:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: Consecutive number of timer intervals, or units of
> +		    qcom,cpr-timer-delay-us, that occur before issuing a down
> +		    interrupt
> +
> +- qcom,cpr-up-threshold:
> +	Usage: optional
> +	Value type: <u32>
> +	Definition: The threshold for CPR to issue interrupt when error_steps
> +		    is greater than it when stepping up
> +
> +- qcom,cpr-down-threshold:
> +	Usage: optional
> +	Value type: <u32>
> +	Definition: The threshold for CPR to issue interrdownt when error_steps

typo

> +		    is greater than it when stepping down
> +
> +- qcom,cpr-down-threshold:
> +	Usage: optional
> +	Value type: <u32>
> +	Definition: Idle clock cycles ring oscillator can be in
> +
> +- qcom,cpr-gcnt-us:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: The time for gate count in uS
> +
> +- qcom,vdd-apc-step-up-limit:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: Limit of vdd-apc-supply steps for scaling up

# of steps or a voltage?

> +
> +- qcom,vdd-apc-step-down-limit:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: Limit of vdd-apc-supply steps for scaling down
> +
> +Example:
> +
> +	avs@b018000 {
> +		compatible = "qcom,cpr";
> +		reg = <0xb018000 0x1000>;
> +		interrupts = <0 15 1>, <0 16 1>, <0 17 1>;
> +		vdd-mx-supply = <&pm8916_l3>;
> +		acc-syscon = <&tcsr>;
> +		nvmem = <&qfprom>;
> +		nvmem-names = "qfprom";
> +
> +		qcom,cpr-ref-clk = <19200>;
> +		qcom,cpr-timer-delay-us = <5000>;
> +		qcom,cpr-timer-cons-up = <0>;
> +		qcom,cpr-timer-cons-down = <2>;
> +		qcom,cpr-up-threshold = <0>;
> +		qcom,cpr-down-threshold = <2>;
> +		qcom,cpr-idle-clocks = <15>;
> +		qcom,cpr-gcnt-us = <1>;
> +		qcom,vdd-apc-step-up-limit = <1>;
> +		qcom,vdd-apc-step-down-limit = <1>;
> +	};
> -- 
> 2.20.1
> 
