From: Suravee Suthikulanit <suravee.suthikulpanit@amd.com>
Subject: Re: [V9 PATCH 2/2] irqchip: gicv2m: Add supports for ARM GICv2m MSI(-X)
Date: Mon, 3 Nov 2014 13:57:36 -0600
Message-ID: <5457DE30.3010200@amd.com>
References: <1414743990-28421-1-git-send-email-suravee.suthikulpanit@amd.com>
 <1414743990-28421-3-git-send-email-suravee.suthikulpanit@amd.com>
 <54574FF7.706@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <54574FF7.706@arm.com>
Sender: linux-pci-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <Mark.Rutland@arm.com>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "tglx@linutronix.de" <tglx@linutronix.de>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, "Harish.Kasiviswanathan@amd.com" <Harish.Kasiviswanathan@amd.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 11/3/2014 3:50 AM, Marc Zyngier wrote:
>> diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
>> >index a99c211..4069eb3 100644
>> >--- a/drivers/irqchip/irq-gic.c
>> >+++ b/drivers/irqchip/irq-gic.c
>> >@@ -46,6 +46,7 @@
>> >  #include <asm/smp_plat.h>
>> >
>> >  #include "irq-gic-common.h"
>> >+#include "irq-gic-v2m.h"
>> >  #include "irqchip.h"
>> >
>> >  union gic_base {
>> >@@ -68,6 +69,9 @@ struct gic_chip_data {
>> >  #ifdef CONFIG_GIC_NON_BANKED
>> >         void __iomem *(*get_base)(union gic_base *);
>> >  #endif
>> >+#ifdef CONFIG_ARM_GIC_V2M
>> >+       struct list_head v2m_list;
>> >+#endif
> Can't that be something private to the v2m widget driver? I don't think
> it brings anything to the main GIC driver.
>

Looking at this again, now that we use the hierarchy irqdomain, GIC no 
longer needs to be handling with children v2m. I'll remove this altogether.

Suravee
