From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] ARM: kernel: respect device tree status of cpu nodes
Date: Wed, 05 Mar 2014 12:33:07 -0800
Message-ID: <53178A03.3090004@codeaurora.org>
References: <1393240960-31846-1-git-send-email-j@bitron.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1393240960-31846-1-git-send-email-j@bitron.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?SsO8cmcgQmlsbGV0ZXI=?= <j@bitron.ch>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@lists.codethink.co.uk, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
List-Id: devicetree@vger.kernel.org

+Lorenzo

On 02/24/14 03:22, J=C3=BCrg Billeter wrote:
> Skip 'disabled' cpu nodes when building the cpu logical map. This avo=
ids
> booting cpus that have been disabled in the device tree.
>
> Signed-off-by: J=C3=BCrg Billeter <j@bitron.ch>
> Reviewed-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  arch/arm/kernel/devtree.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
> index 739c3df..9aed299 100644
> --- a/arch/arm/kernel/devtree.c
> +++ b/arch/arm/kernel/devtree.c
> @@ -95,6 +95,10 @@ void __init arm_dt_init_cpu_maps(void)
>  		if (of_node_cmp(cpu->type, "cpu"))
>  			continue;
> =20
> +		/* Check if CPU is enabled */
> +		if (!of_device_is_available(cpu))
> +			continue;
> +
>  		pr_debug(" * %s...\n", cpu->full_name);
>  		/*
>  		 * A device tree containing CPU nodes with missing "reg"

This doesn't follow the ePAPR spec. According to ePAPR status=3D"disabl=
ed"
in a cpu node means "the cpu is in a quiescent state" and one can enabl=
e
it by using the "enable-method". At the least, we should document this
in bindings/arm/cpus.txt if we can all agree that we want this
definition of disabled.

--=20
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
