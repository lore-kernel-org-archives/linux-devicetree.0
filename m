From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCHv4 2/5] arm: mvebu: support for SMP on 98DX3336 SoC
Date: Wed, 18 Jan 2017 16:47:50 -0800
Message-ID: <20170119004750.GC4857@codeaurora.org>
References: <20170113091222.7132-1-chris.packham@alliedtelesis.co.nz>
 <20170113091222.7132-3-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170113091222.7132-3-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, Florian Fainelli <f.fainelli@gmail.com>, Chris Brand <chris.brand@broadcom.com>, Juri Lelli <juri.lelli@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Jayachandran C <jchandra@broadcom.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/13, Chris Packham wrote:
> diff --git a/arch/arm/mach-mvebu/platsmp.c b/arch/arm/mach-mvebu/platsmp.c
> index 46c742d3bd41..59be3ca0464f 100644
> --- a/arch/arm/mach-mvebu/platsmp.c
> +++ b/arch/arm/mach-mvebu/platsmp.c
> @@ -184,3 +184,89 @@ const struct smp_operations armada_xp_smp_ops __initconst = {
>  
>  CPU_METHOD_OF_DECLARE(armada_xp_smp, "marvell,armada-xp-smp",
>  		      &armada_xp_smp_ops);
> +
> +struct resume_controller {
> +	u32 resume_control;
> +	u32 resume_boot_addr;
> +};
> +
> +static const struct resume_controller mv98dx3336_resume_controller = {
> +	.resume_control = 0x08,
> +	.resume_boot_addr = 0x04,
> +};
> +
> +static const struct of_device_id of_mv98dx3236_resume_table[] = {
> +	{
> +		.compatible = "marvell,98dx3336-resume-ctrl",
> +		.data = (void *)&mv98dx3336_resume_controller,

Useless cast?

> +	},
> +	{ /* end of list */ },
> +};
> +
> +static int mv98dx3236_resume_set_cpu_boot_addr(int hw_cpu, void *boot_addr)
> +{
> +	const struct of_device_id *match;
> +	struct device_node *np;
> +	void __iomem *base;
> +	struct resume_controller *rc;
> +
> +	WARN_ON(hw_cpu != 1);
> +
> +	np = of_find_matching_node_and_match(NULL, of_mv98dx3236_resume_table,
> +					     &match);
> +	if (!np)
> +		return -ENODEV;
> +
> +	base = of_io_request_and_map(np, 0, of_node_full_name(np));
> +	rc = (struct resume_controller *)match->data;

Useless cast?

> +	of_node_put(np);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	writel(0, base + rc->resume_control);
> +	writel(virt_to_phys(boot_addr), base + rc->resume_boot_addr);
> +

Otherwise

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
