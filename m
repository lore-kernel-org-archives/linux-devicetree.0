From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 2/3] irqchip: stm32: protect configuration registers with
 hwspinlock
Date: Fri, 7 Dec 2018 18:14:51 +0000
Message-ID: <499e10d5-b0d4-b0a6-b2ce-2565dc8935f7@arm.com>
References: <20181113144805.1054-1-benjamin.gaignard@st.com>
 <20181113144805.1054-3-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181113144805.1054-3-benjamin.gaignard@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, alexandre.torgue@st.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

On 13/11/2018 14:48, Benjamin Gaignard wrote:
> If a hwspinlock is defined in device tree use it to protect
> configuration registers.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  drivers/irqchip/irq-stm32-exti.c | 36 ++++++++++++++++++++++++++++++------
>  1 file changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
> index 0a2088e12d96..a010a2eed078 100644
> --- a/drivers/irqchip/irq-stm32-exti.c
> +++ b/drivers/irqchip/irq-stm32-exti.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/bitops.h>
> +#include <linux/hwspinlock.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/irq.h>
> @@ -20,6 +21,8 @@
>  
>  #define IRQS_PER_BANK 32
>  
> +#define HWSPINLOCK_TIMEOUT	5 /* msec */
> +
>  struct stm32_exti_bank {
>  	u32 imr_ofst;
>  	u32 emr_ofst;
> @@ -47,6 +50,7 @@ struct stm32_exti_drv_data {
>  struct stm32_exti_chip_data {
>  	struct stm32_exti_host_data *host_data;
>  	const struct stm32_exti_bank *reg_bank;
> +	struct hwspinlock *hwlock;
>  	struct raw_spinlock rlock;
>  	u32 wake_active;
>  	u32 mask_cache;
> @@ -275,25 +279,34 @@ static int stm32_irq_set_type(struct irq_data *d, unsigned int type)
>  	struct stm32_exti_chip_data *chip_data = gc->private;
>  	const struct stm32_exti_bank *stm32_bank = chip_data->reg_bank;
>  	u32 rtsr, ftsr;
> -	int err;
> +	int err = 0;
>  
>  	irq_gc_lock(gc);
>  
> +	if (chip_data->hwlock)
> +		err = hwspin_lock_timeout(chip_data->hwlock,
> +					  HWSPINLOCK_TIMEOUT);
> +
> +	if (err)
> +		goto unlock;
> +
>  	rtsr = irq_reg_readl(gc, stm32_bank->rtsr_ofst);
>  	ftsr = irq_reg_readl(gc, stm32_bank->ftsr_ofst);
>  
>  	err = stm32_exti_set_type(d, type, &rtsr, &ftsr);
> -	if (err) {
> -		irq_gc_unlock(gc);
> -		return err;
> -	}
> +	if (err)
> +		goto unspinlock;
>  
>  	irq_reg_writel(gc, rtsr, stm32_bank->rtsr_ofst);
>  	irq_reg_writel(gc, ftsr, stm32_bank->ftsr_ofst);
>  
> +unspinlock:
> +	if (chip_data->hwlock)
> +		hwspin_unlock(chip_data->hwlock);
> +unlock:
>  	irq_gc_unlock(gc);
>  
> -	return 0;
> +	return err;
>  }
>  
>  static void stm32_chip_suspend(struct stm32_exti_chip_data *chip_data,
> @@ -670,6 +683,7 @@ static int __init stm32_exti_init(const struct stm32_exti_drv_data *drv_data,
>  	int nr_irqs, ret, i;
>  	struct irq_chip_generic *gc;
>  	struct irq_domain *domain;
> +	struct hwspinlock *hwlock = NULL;
>  
>  	host_data = stm32_exti_host_init(drv_data, node);
>  	if (!host_data)
> @@ -692,12 +706,22 @@ static int __init stm32_exti_init(const struct stm32_exti_drv_data *drv_data,
>  		goto out_free_domain;
>  	}
>  
> +	/* hwspinlock is optional */
> +	ret = of_hwspin_lock_get_id(node, 0);
> +	if (ret < 0) {
> +		if (ret == -EPROBE_DEFER)
> +			goto out_free_domain;

Wouldn't it make sense to probe for this before allocating the domain?

> +	} else {
> +		hwlock = hwspin_lock_request_specific(ret);
> +	}
> +
>  	for (i = 0; i < drv_data->bank_nr; i++) {
>  		const struct stm32_exti_bank *stm32_bank;
>  		struct stm32_exti_chip_data *chip_data;
>  
>  		stm32_bank = drv_data->exti_banks[i];
>  		chip_data = stm32_exti_chip_init(host_data, i, node);
> +		chip_data->hwlock = hwlock;
>  
>  		gc = irq_get_domain_generic_chip(domain, i * IRQS_PER_BANK);
>  
> 

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
