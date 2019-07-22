Return-Path: <robherring2@gmail.com>
Date: Mon, 22 Jul 2019 17:09:35 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [RESEND PATCH 1/3] dt-bindings: power: Add power domain binding
 for i.mx8m family
Message-ID: <20190722230935.GA12833@bogus>
References: <20190702100832.29718-1-ping.bai@nxp.com>
 <20190702100832.29718-2-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702100832.29718-2-ping.bai@nxp.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jul 02, 2019 at 10:03:41AM +0000, Jacky Bai wrote:
> Add the binding doc of power domain for i.MX8M SOC family.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  .../bindings/power/fsl,imx8m-genpd.txt        | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/fsl,imx8m-genpd.txt
> 
> diff --git a/Documentation/devicetree/bindings/power/fsl,imx8m-genpd.txt b/Documentation/devicetree/bindings/power/fsl,imx8m-genpd.txt
> new file mode 100644
> index 000000000000..a92a7103de38
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/fsl,imx8m-genpd.txt
> @@ -0,0 +1,46 @@
> +Device Tree Bindings for Freescale i.MX8M Generic Power Domain
> +==============================================================
> +The binding for the i.MX8M Generic power Domain[1].
> +
> +[1] Documentation/devicetree/bindings/power/power_domain.txt
> +
> +Required properties:
> +
> + - compatible: should be of:
> +	- "fsl,imx8m-power-domain"
> + - #power-domain-cells: Number of cells in a PM domain Specifier, must be 0
> + - domain-index: should be the domain index number need to pass to TF-A
> + - domain-name: the name of this pm domain
> +
> +Optional properties:
> + - clocks: a number of phandles to clocks that need to be enabled during
> +   domain power-up sequence to ensure reset propagation into devices
> +   located inside this power domain

Isn't that firmware's problem?

> + - power-supply: Power supply used to power the domain
> + - parent-domains: the phandle to the parent power domain
> +
> +example:
> +	vpu_g1_pd: vpug1-pd {

What's this a child of?

Use generic node names.

> +		compatible = "fsl,imx8mm-pm-domain";
> +		#power-domain-cells = <0>;

I'm usually not a fan when I see a single domain per provider. Why can't 
you have firmware be a single provider with multiple domains?

> +		domain-index = <6>;

Don't create your own index properties.

> +		domain-name = "vpu_g1";

Not a standard name. Why do you need this? (Hint: we'd already have a 
standard name if you did.)

> +		parent-domains = <&vpumix_pd>;

We already have a standard way to do this.

> +		clocks = <&clk IMX8MM_CLK_VPU_G1_ROOT>;
> +	};
> +
> +
> +Specifying Power domain for IP modules
> +======================================
> +
> +IP cores belonging to a power domain should contain a 'power-domains'
> +property that is a phandle for PGC node representing the domain.
> +
> +Example of a device that is part of the vpu_g1 power domain:
> +	vpu_g1: vpu_g1@38300000 {

video-codec@...

> +		/* ... */
> +		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "irq_hantro";
> +		/* ... */
> +		power-domains = <&vpu_g1_pd>;
> +	};
> -- 
> 2.21.0
> 
