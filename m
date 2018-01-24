From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH RFC 2/4] dt-bindings/interrupt-controller: pdc: descibe
 PDC device binding
Date: Wed, 24 Jan 2018 14:24:04 +0000
Message-ID: <5f067a1b-a13e-580b-f1c4-57e5b558d710@arm.com>
References: <20180123175656.11942-1-ilina@codeaurora.org>
 <20180123175656.11942-3-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180123175656.11942-3-ilina@codeaurora.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>, tglx@linutronix.de, jason@lakedaemon.net
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, sboyd@codeaurora.org, rnayak@codeaurora.org, asathyak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 23/01/18 17:56, Lina Iyer wrote:
> From: Archana Sathyakumar <asathyak@codeaurora.org>
> 
> Add device binding documentation for the PDC Interrupt controller on
> QCOM SoC's like the SDM845. The interrupt-controller can be used to
> sense edge low interrupts and wakeup interrupts when the GIC is
> non-operational.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Archana Sathyakumar <asathyak@codeaurora.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
>  .../bindings/interrupt-controller/qcom,pdc.txt     | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> new file mode 100644
> index 000000000000..c4592bbf678d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> @@ -0,0 +1,55 @@
> +PDC interrupt controller
> +
> +Qualcomm Technologies Inc. SoCs based on the RPM Hardened archicture have a
nit: architecture

> +Power Domain Controller (PDC) that is on always-on domain. In addition to
> +providing power control for the power domains, the hardware also has an
> +interrupt controller that can be used to help detect edge low interrupts as
> +well detect interrupts when the GIC is non-operational.
> +
> +GIC is parent interrupt controller at the highest level. Platform interrupt
> +controller PDC is next in hierarchy, followed by others. This driver only
> +configures the interrupts, does not handle them.
> +
> +Properties:
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: Should contain "qcom,pdc" and "qcom,pdc-<target>"
> +		    - "qcom,pdc-sdm845": For sdm845 pin data
> +
> +- reg:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: Specifies the base physical address for PDC hardware.
> +
> +- interrupt-cells:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: Specifies the number of cells needed to encode an interrupt
> +		    source.
> +		    Value must be 3.
> +		    The encoding of these cells are same as described in [1].

The GICv3 binding allows for more cells (at least 4), so you'll have to
adapt both in the binding and in the driver.

> +
> +- interrupt-parent:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: Specifies the interrupt parent necessary for hierarchical
> +		    domain to operate.
> +
> +- interrupt-controller:
> +	Usage: required
> +	Value type: <bool>
> +	Definition: Identifies the node as an interrupt controller.
> +
> +Example:
> +
> +	pdc: interrupt-controller@b220000 {
> +		compatible = "qcom,pdc", "qcom,pdc-sdm845";
> +		reg = <0xb220000 0x30000>;
> +		#interrupt-cells = <3>;
> +		interrupt-parent = <&intc>;
> +		interrupt-controller;
> +	};
> +
> +[1]. Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
> 

You'll also have to specify the ranges for the pin to SPI mapping.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
