From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: irq: add binding for Freescale IRQSTEER
 multiplexer
Date: Thu, 25 Oct 2018 09:35:04 -0500
Message-ID: <20181025143504.GA9673@bogus>
References: <20181016164218.3736-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181016164218.3736-1-l.stach@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, patchwork-lst@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Tue, Oct 16, 2018 at 06:42:17PM +0200, Lucas Stach wrote:
> This adds the DT binding for the Freescale IRQSTEER interrupt
> multiplexer found in the i.MX8 familiy SoCs.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../interrupt-controller/fsl,irqsteer.txt     | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
> new file mode 100644
> index 000000000000..ed2b18165591
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
> @@ -0,0 +1,39 @@
> +Freescale IRQSTEER Interrupt multiplexer
> +
> +Required properties:
> +
> +- compatible: should be:
> +	- "fsl,imx8m-irqsteer"
> +	- "fsl,imx-irqsteer"
> +- reg: Physical base address and size of registers.
> +- interrupts: Should contain the parent interrupt line used to multiplex the
> +  input interrupts.
> +- clocks: Should contain one clock for entry in clock-names
> +  see Documentation/devicetree/bindings/clock/clock-bindings.txt
> +- clock-names:
> +   - "ipg": main logic clock
> +- interrupt-controller: Identifies the node as an interrupt controller.
> +- #interrupt-cells: Specifies the number of cells needed to encode an
> +  interrupt source. The value must be 2.
> +
> +Optional properties:
> +- fsl,channel: Number of channels managed by this controller. Each channel
> +  contains up to 32 interrupt sources. If absent defaults to 1.

What's a channel? Why isn't this implied by the compatible?

> +- fsl,endian:

The standard property for endianness doesn't work for you?

> +  0: controller registers are little endian
> +  1: controller registers are big endian
> +  If absent defaults to 0.
> +
> +Example:
> +
> +	interrupt-controller@32e2d000 {
> +		compatible = "fsl,imx8m-irqsteer", "fsl,imx-irqsteer";
> +		reg = <0x32e2d000 0x1000>;
> +		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
> +		clock-names = "ipg";
> +		fsl,channel = <2>;
> +		fsl,endian = <1>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> -- 
> 2.19.0
> 
