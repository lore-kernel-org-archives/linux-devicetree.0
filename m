From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 3/6] irqchip: RISC-V Local Interrupt Controller Driver
Date: Wed, 25 Jul 2018 12:18:39 +0100
Message-ID: <c3ccb953-cd75-4a37-636a-ca643602053a@arm.com>
References: <20180725093649.32332-1-hch@lst.de>
 <20180725093649.32332-4-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180725093649.32332-4-hch@lst.de>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, tglx@linutronix.de, palmer@sifive.com, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
List-Id: devicetree@vger.kernel.org

On 25/07/18 10:36, Christoph Hellwig wrote:
> From: Palmer Dabbelt <palmer@dabbelt.com>
> 
> This patch adds a driver that manages the local interrupts on each
> RISC-V hart, as specifiec by the RISC-V supervisor level ISA manual.
> The local interrupt controller manages software interrupts, timer
> interrupts, and hardware interrupts (which are routed via the
> platform level interrupt controller).  Per-hart local interrupt
> controllers are found on all RISC-V systems.
> 
> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> [hch: Kconfig simplifications, various cleanups]
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/irqchip/Kconfig          |   4 +
>  drivers/irqchip/Makefile         |   1 +
>  drivers/irqchip/irq-riscv-intc.c | 197 +++++++++++++++++++++++++++++++
>  3 files changed, 202 insertions(+)
>  create mode 100644 drivers/irqchip/irq-riscv-intc.c
> 

[...]

> +/*
> + * On RISC-V systems local interrupts are masked or unmasked by writing the SIE
> + * (Supervisor Interrupt Enable) CSR.  As CSRs can only be written on the local
> + * hart, these functions can only be called on the hart that corresponds to the
> + * IRQ chip.  They are only called internally to this module, so they BUG_ON if
> + * this condition is violated rather than attempting to handle the error by
> + * forwarding to the target hart, as that's already expected to have been done.
> + */
> +static void riscv_irq_mask(struct irq_data *d)
> +{
> +	struct riscv_irq_data *data = irq_data_get_irq_chip_data(d);
> +
> +	BUG_ON(smp_processor_id() != data->hart);
> +	csr_clear(sie, 1 << d->hwirq);
> +}
> +
> +static void riscv_irq_unmask(struct irq_data *d)
> +{
> +	struct riscv_irq_data *data = irq_data_get_irq_chip_data(d);
> +
> +	BUG_ON(smp_processor_id() != data->hart);
> +	csr_set(sie, 1 << d->hwirq);
> +}
> +
> +/* Callbacks for twiddling SIE on another hart. */
> +static void riscv_irq_enable_helper(void *d)
> +{
> +	riscv_irq_unmask(d);
> +}
> +
> +static void riscv_irq_disable_helper(void *d)
> +{
> +	riscv_irq_mask(d);
> +}
> +
> +static void riscv_remote_ctrl(unsigned int cpu, void (*fn)(void *d),
> +			      struct irq_data *data)
> +{
> +	smp_call_function_single(cpu, fn, data, true);
> +}
> +
> +static void riscv_irq_enable(struct irq_data *d)
> +{
> +	struct riscv_irq_data *data = irq_data_get_irq_chip_data(d);
> +
> +	/*
> +	 * It's only possible to write SIE on the current hart.  This jumps
> +	 * over to the target hart if it's not the current one.  It's invalid
> +	 * to write SIE on a hart that's not currently running.
> +	 */
> +	if (data->hart == smp_processor_id())
> +		riscv_irq_unmask(d);
> +	else if (cpu_online(data->hart))
> +		riscv_remote_ctrl(data->hart, riscv_irq_enable_helper, d);

This feels odd. It means that you cannot have the following sequence:

	local_irq_disable();
	enable_irq(x); // where x is owned by a remote hart

as smp_call_function_single() requires interrupts to be enabled.

More fundamentally, why are you trying to make these interrupts look
global while they aren't? arm/arm64 have similar restrictions with GICv2
and earlier, and treats these interrupts as per-cpu.

Given that the drivers that deal with drivers connected to the per-hart
irqchip are themselves likely to be aware of the per-cpu aspect, it
would make sense to align things (we've been through that same
discussion about the clocksource driver a few weeks back).

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
