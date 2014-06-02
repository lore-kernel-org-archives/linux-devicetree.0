From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 1/5] ARM: berlin: add SMP support
Date: Mon, 2 Jun 2014 11:47:15 +0200
Message-ID: <20140602094715.GG28090@lunn.ch>
References: <1401700866-24804-1-git-send-email-antoine.tenart@free-electrons.com>
 <1401700866-24804-2-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1401700866-24804-2-git-send-email-antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 02, 2014 at 11:21:02AM +0200, Antoine T=E9nart wrote:
> +
> +static inline void berlin_reset_cpu(unsigned int cpu)
> +{
> +	u32 val;
> +
> +	val =3D readl(cpu_ctrl + CPU_RESET);
> +	val |=3D BIT(cpu_logical_map(cpu));
> +	writel(val, cpu_ctrl + CPU_RESET);
> +}

Hi Antoine

Is this performing a reset on the CPU, or is it taking it out of reset?

If you are going to implement CPU hotplug at some point, you are going
to want to be able to put the CPU into reset, i.e. power it off, and
take it out of reset, i.e. power it on and getting it running. So it
might help if we get these function names clear now.

      Andrew


> +
> +static int berlin_boot_secondary(unsigned int cpu, struct task_struc=
t *idle)
> +{
> +	if (!cpu_ctrl)
> +		return -EFAULT;
> +
> +	/*
> +	 * Reset the CPU, making it to execute the instruction in the reset
> +	 * exception register.
> +	 */
> +	berlin_reset_cpu(cpu);
> +
> +	return 0;
> +}
> +
> +static void __init berlin_smp_prepare_cpus(unsigned int max_cpus)
> +{
> +	struct device_node *np;
> +	void __iomem *scu_base;
> +	void __iomem *vectors_base;
> +
> +	np =3D of_find_compatible_node(NULL, NULL, "arm,cortex-a9-scu");
> +	scu_base =3D of_iomap(np, 0);
> +	of_node_put(np);
> +	if (!scu_base)
> +		return;
> +
> +	np =3D of_find_compatible_node(NULL, NULL, "marvell,berlin-cpu-ctrl=
");
> +	cpu_ctrl =3D of_iomap(np, 0);
> +	of_node_put(np);
> +	if (!cpu_ctrl)
> +		goto unmap_scu;
> +
> +	vectors_base =3D ioremap(CONFIG_VECTORS_BASE, SZ_32K);
> +	if (!vectors_base)
> +		goto unmap_scu;
> +
> +	scu_enable(scu_base);
> +	flush_cache_all();
> +
> +	/*
> +	 * Write the first instruction the CPU will execute after being res=
eted
> +	 * in the reset exception register.
> +	 */
> +	writel(boot_inst, vectors_base + RESET_VECT);
> +
> +	/*
> +	 * Write the secondary startup address into the SW reset address
> +	 * register. This is used by boot_inst.

Maybe it would be better to call this the reset address vector instead
of address register. It is in the vector space after all.

   Andrew

> +	 */
> +	writel(virt_to_phys(berlin_secondary_startup), vectors_base + SW_RE=
SET_ADDR);
> +
> +	iounmap(vectors_base);
> +unmap_scu:
> +	iounmap(scu_base);
> +}
> +
> +static struct smp_operations berlin_smp_ops __initdata =3D {
> +	.smp_prepare_cpus	=3D berlin_smp_prepare_cpus,
> +	.smp_boot_secondary	=3D berlin_boot_secondary,
> +};
> +CPU_METHOD_OF_DECLARE(berlin_smp, "marvell,berlin-smp", &berlin_smp_=
ops);
> --=20
> 1.9.1
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
