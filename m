From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: interrupt-controller: Actions
 external interrupt controller
Date: Mon, 13 Aug 2018 13:44:53 -0600
Message-ID: <20180813194453.GA30702@rob-hp-laptop>
References: <20180812122215.1079590-1-pn@denx.de>
 <20180812122215.1079590-2-pn@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180812122215.1079590-2-pn@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Parthiban Nallathambi <pn@denx.de>
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, mark.rutland@arm.com, afaerber@suse.de, catalin.marinas@arm.com, will.deacon@arm.com, manivannan.sadhasivam@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sravanhome@gmail.com, thomas.liau@actions-semi.com, mp-cs@actions-semi.com, linux@cubietech.com, edgar.righi@lsitec.org.br, laisa.costa@lsitec.org.br, guilherme.simoes@lsitec.org.br, mkzuffo@lsi.usp.br
List-Id: devicetree@vger.kernel.org

On Sun, Aug 12, 2018 at 02:22:13PM +0200, Parthiban Nallathambi wrote:
> Actions Semi OWL family SoC's provides support for external interrupt
> controller to be connected and controlled using SIRQ pins. S500, S700
> and S900 provides 3 SIRQ lines and works independently for 3 external
> interrupt controllers.
> 
> Signed-off-by: Parthiban Nallathambi <pn@denx.de>
> Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>
> ---
>  .../interrupt-controller/actions,owl-sirq.txt      | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.txt b/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.txt
> new file mode 100644
> index 000000000000..4b8437751331
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.txt
> @@ -0,0 +1,46 @@
> +Actions Semi Owl SoCs SIRQ interrupt controller
> +
> +S500, S700 and S900 SoC's from Actions provides 3 SPI's from GIC,
> +in which external interrupt controller can be connected. 3 SPI's
> +45, 46, 47 from GIC are directly exposed as SIRQ. It has
> +the following properties:
> +
> +- inputs three interrupt signal from external interrupt controller
> +
> +Required properties:
> +
> +- compatible: should be "actions,owl-sirq"
> +- reg: physical base address of the controller and length of memory mapped.
> +- interrupt-controller: identifies the node as an interrupt controller
> +- #interrupt-cells: specifies the number of cells needed to encode an interrupt
> +  source, should be 2.

> +- actions,sirq-shared-reg: Applicable for S500 and S700 where SIRQ register
> +  details are maintained at same offset/register.
> +- actions,sirq-offset: register offset for SIRQ interrupts. When registers are
> +  shared, all the three offsets will be same (S500 and S700).

You should have more specific compatible strings if there are 
differences and these settings can be implied by them.

> +- actions,sirq-clk-sel: external interrupt controller can be either
> +  connected to 32Khz or 24Mhz external/internal clock. This needs
> +  to be configured for per SIRQ line. Failing defaults to 32Khz clock.

What are the valid values?

> +
> +Example for S900:
> +
> +sirq: interrupt-controller@e01b0000 {
> +	compatible = "actions,owl-sirq";
> +	reg = <0 0xe01b0000 0 0x1000>;
> +	interrupt-controller;
> +	#interrupt-cells = <2>;
> +	actions,sirq-clk-sel = <0 0 0>;

If 0 is 32khz, then having this is pointless. But I can't tell what the 
values correspond to.

> +	actions,sirq-offset = <0x200 0x528 0x52c>;
> +};
> +
> +Example for S500 and S700:
> +
> +sirq: interrupt-controller@e01b0000 {
> +	compatible = "actions,owl-sirq";
> +	reg = <0 0xe01b0000 0 0x1000>;
> +	interrupt-controller;
> +	#interrupt-cells = <2>;
> +	actions,sirq-shared-reg;
> +	actions,sirq-clk-sel = <0 0 0>;
> +	actions,sirq-offset = <0x200 0x200 0x200>;
> +};
> -- 
> 2.14.4
> 
