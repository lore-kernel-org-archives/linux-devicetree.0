From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 5/7] irqchip/irq-bcm2836: Add support for the 7211
 interrupt controller
Date: Wed, 2 Oct 2019 10:06:31 -0700
Message-ID: <72f07d2e-b070-301a-6a5d-8e89d32adcd7@gmail.com>
References: <20191001224842.9382-1-f.fainelli@gmail.com>
 <20191001224842.9382-6-f.fainelli@gmail.com> <20191002134041.5a181d96@why>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002134041.5a181d96@why>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <maz@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 10/2/19 5:40 AM, Marc Zyngier wrote:
> On Tue,  1 Oct 2019 15:48:40 -0700
> Florian Fainelli <f.fainelli@gmail.com> wrote:
> 
>> The root interrupt controller on 7211 is about identical to the one
>> existing on BCM2836, except that the SMP cross call are done through the
>> standard ARM GIC-400 interrupt controller. This interrupt controller is
>> used for side band wake-up signals though.
> 
> I don't fully grasp how this thing works.
> 
> If the 7211 interrupt controller is root and the GIC is used for SGIs,
> this means that the GIC outputs (IRQ/FIQ/VIRQ/VFIQ, times eight) are
> connected to individual inputs to the 7211 controller. Seems totally
> braindead, and unexpectedly so.
> 
> If the GIC is root and the 7211 outputs into the GIC all of its
> interrupts as a secondary irqchip, it would at least match an existing
> (and pretty bad) pattern.
> 
> So which one of the two is it?

The nominal configuration on 7211 is to have all interrupts go through
the ARM GIC. It is possible however, to fallback to the legacy 2836 mode
whereby the root interrupt controller for peripheral interrupts is this
ARMCTL IC. There is a mux that the firmware can control which will
dictate which root interrupt controller is used for peripherals.

I have used this mostly for silicon verification and since those are
fairly harmless patches, just decided to send them out to avoid
maintaining them out of tree.

We have a plan to use those as an "alternate" interrupt domain for low
power modes and use the fact that peripheral interrupts could be active
in both domains (GIC and ARMCTRL IC) to help support configuring and
identifying wake-up sources fro m within Linux.

Thanks!

> 
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>  drivers/irqchip/irq-bcm2836.c | 25 ++++++++++++++++++++++---
>>  1 file changed, 22 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-bcm2836.c b/drivers/irqchip/irq-bcm2836.c
>> index 2038693f074c..77fa395c8f6b 100644
>> --- a/drivers/irqchip/irq-bcm2836.c
>> +++ b/drivers/irqchip/irq-bcm2836.c
>> @@ -112,6 +112,8 @@ static int bcm2836_map(struct irq_domain *d, unsigned int irq,
>>  		return -EINVAL;
>>  	}
>>  
>> +	chip->flags |= IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SKIP_SET_WAKE;
>> +
>>  	irq_set_percpu_devid(irq);
>>  	irq_domain_set_info(d, irq, hw, chip, d->host_data,
>>  			    handle_percpu_devid_irq, NULL, NULL);
>> @@ -216,8 +218,9 @@ static void bcm2835_init_local_timer_frequency(void)
>>  	writel(0x80000000, intc.base + LOCAL_PRESCALER);
>>  }
>>  
>> -static int __init bcm2836_arm_irqchip_l1_intc_of_init(struct device_node *node,
>> -						      struct device_node *parent)
>> +static int __init arm_irqchip_l1_intc_of_init_smp(struct device_node *node,
>> +						  struct device_node *parent,
>> +						  bool smp_init)
>>  {
>>  	intc.base = of_iomap(node, 0);
>>  	if (!intc.base) {
>> @@ -232,11 +235,27 @@ static int __init bcm2836_arm_irqchip_l1_intc_of_init(struct device_node *node,
>>  	if (!intc.domain)
>>  		panic("%pOF: unable to create IRQ domain\n", node);
>>  
>> -	bcm2836_arm_irqchip_smp_init();
>> +	if (smp_init)
>> +		bcm2836_arm_irqchip_smp_init();
> 
> Instead of the additional parameter and this check, why don't you just
> move the smp_init() call to bcm2836_arm_irqchip_l1_intc_of_init()
> instead?

Good idea, will do.
-- 
Florian
