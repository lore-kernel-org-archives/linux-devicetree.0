From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 4/4] irqchip: Add bcm2836 interrupt controller for
 Raspberry Pi 2.
Date: Fri, 10 Jul 2015 23:13:15 -0600
Message-ID: <55A0A5EB.4090007@wwwdotorg.org>
References: <1436303617-17185-1-git-send-email-eric@anholt.net>
 <1436303617-17185-5-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1436303617-17185-5-git-send-email-eric@anholt.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Eric Anholt <eric@anholt.net>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrea Merello <andrea.merello@gmail.com>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On 07/07/2015 03:13 PM, Eric Anholt wrote:
> This interrupt controller is the new root interrupt controller with
> the timer, PMU events, and IPIs, and the bcm2835's interrupt
> controller is chained off of it to handle the peripherals.
> 
> SMP IPI support was mostly written by Andrea Merello, while I wrote
> most of the rest of the IRQ handling.
> 
> Signed-off-by: Andrea Merello <andrea.merello@gmail.com>
> Signed-off-by: Eric Anholt <eric@anholt.net>

I'd expect the git patch author to be Andrea if he wrote the original
patch and you enhanced it.

> diff --git a/drivers/irqchip/irq-bcm2836.c b/drivers/irqchip/irq-bcm2836.c

> +struct arm_local_intc {
> +	struct irq_domain *domain;
> +	void __iomem *base;
> +};
> +
> +static struct arm_local_intc intc  __read_mostly;

It'd be nice to give everything (types, functions, variables) a
consistent symbol prefix; bcm2836_arm_irqchip_ sounds like a good
bikeshed to me, but perhaps just propagating the above arm_local_ to the
functions too would be good, although that seems to risk symbol name
collisions with other ARM SoCs.

> +static void bcm2836_mask_per_cpu_irq(unsigned int reg, unsigned int bit)
> +{
> +	void __iomem *reg_base = intc.base + reg;
> +	unsigned int i;
> +
> +	for (i = 0; i < 4; i++)

Is "4" there the CPU count? Perhaps this should use one of the Linux
APIs to query the CPU count rather than hard-coding it?

Should per-CPU IRQs automatically be masked on all CPUs at once, or only
on the current CPU? A very quick look at the ARM GIC driver implies it
doesn't iterate over all CPUs when masking per-CPU IRQs.

> +static void bcm2836_mask_gpu_irq(struct irq_data *d)
> +{
> +}
> +
> +static void bcm2836_unmask_gpu_irq(struct irq_data *d)
> +{
> +}

If the IRQs can't be masked, should these functions actually be implemented?

> +static void __exception_irq_entry bcm2836_handle_irq(struct pt_regs *regs)
> +{
> +	int cpu = smp_processor_id();
> +	u32 stat;
> +
> +	stat = readl_relaxed(intc.base + LOCAL_IRQ_PENDING0 + 4 * cpu);
> +	if (stat & 0x10) {
> +		void __iomem *mailbox0 = (intc.base +
> +					  LOCAL_MAILBOX0_CLR0 + 16 * cpu);
> +		u32 mbox_val = readl(mailbox0);
> +		u32 ipi = ffs(mbox_val) - 1;
> +
> +		writel(1 << ipi, mailbox0);
> +		handle_IPI(ipi, regs);

Given that bcm2836_send_ipi() is #ifdef CONFIG_SMP, should this code be too?
