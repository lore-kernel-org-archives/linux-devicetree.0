From: Guo Ren <ren_guo@c-sky.com>
Subject: Re: [PATCH V10 1/8] irqchip: add C-SKY SMP interrupt controller
Date: Tue, 9 Oct 2018 22:59:56 +0800
Message-ID: <20181009145955.GA17681@guoren-Inspiron-7460>
References: <cover.1538672812.git.ren_guo@c-sky.com>
 <e06484474231375248e3e7a6ab47cf8ff8893129.1538672812.git.ren_guo@c-sky.com>
 <404fb433-020e-28f9-2434-a22c6db36a15@arm.com>
 <20181009022357.GA826@guoren>
 <a8654ba4-fe46-6842-64f6-d4141bbf8793@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a8654ba4-fe46-6842-64f6-d4141bbf8793@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, anurup.m@huawei.com, Jonathan.Cameron@huawei.com, will.deacon@arm.com, zhangshaokun@hisilicon.com, jhogan@kernel.org, paul.burton@mips.com, peterz@infradead.org, arnd@arndb.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi, Marc,

On Tue, Oct 09, 2018 at 09:15:17AM +0100, Marc Zyngier wrote:

> >>>+#ifdef CONFIG_SMP
> >>>+	set_send_ipi(&csky_mpintc_send_ipi);
> >>>+
> >>>+	set_ipi_irq_mapping(&csky_mpintc_ipi_irq_mapping);
> >>
> >>Since you seem to be inventing a new set_send_ipi callback, why don't you
> >>define it as:
> >>
> >>void set_send_ipi(void (*func)(const struct cpumask *),
> >>		  unsigned int ipi_irq);
> >>after having created the mapping for the IPI interrupt? It would avoid this
> >>rather pointless mapping callback.
> >
> >I'll define it to:
> >
> >void set_send_ipi(void (*func)(const struct cpumask *));
> >
> >IPI_IRQ only use software-irq-15 in mpintc driver, so arch needn't care
> >about irq-num.
> 
> Except that your SMP code does a request_irq on the result of
> create_mapping. Who is going to do that if you don't pass the Linux irq
> around?
 
Yes, My SMP code does a request_irq on the result of create_mapping.
Here is my smp.c code and it use a result of create_mapping by arch_ipi_irq_mapping()
callback in irq-csky-mpintc.c

void __init setup_smp_ipi(void)
{
	int rc;

	ipi_irq = arch_ipi_irq_mapping();
	if (ipi_irq == 0)
		panic("%s IRQ mapping failed\n", __func__);

	rc = request_percpu_irq(ipi_irq, handle_ipi, "IPI Interrupt",
				&ipi_dummy_dev);
	if (rc)
		panic("%s IRQ request failed\n", __func__);

	enable_smp_ipi();
}

Best Regards
 Guo Ren
