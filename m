From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH V5 1/5] arm: mvebu: Added support for coherency fabric
 in mach-mvebu
Date: Wed, 21 Nov 2012 12:53:14 +0100
Message-ID: <50ACC0AA.7060009@free-electrons.com>
References: <1353446150-10088-1-git-send-email-gregory.clement@free-electrons.com>
 <1353446150-10088-2-git-send-email-gregory.clement@free-electrons.com>
 <20121121103622.GC11990@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121121103622.GC11990-MRww78TxoiP5vMa5CHWGZ34zcgK1vI+I0E9HWUfgJXw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Ike Pan <ike.pan-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ian Molton <ian.molton-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, David Marlin <dmarlin-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jani Monoses <jani.monoses-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Dan Frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Eran Ben-Avi <benavi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Leif Lindholm <Leif.Lindholm-5wv7dgnIgG8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWOunwaRDDq4rA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/21/2012 11:36 AM, Will Deacon wrote:
> On Tue, Nov 20, 2012 at 09:15:45PM +0000, Gregory CLEMENT wrote:
>> From: Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> 
> <insert commit log here>
> 
> Also -- is the author attribution still correct?

I don't know: the code is based on Yehuda work, but version
by version I modified it. So I don't know what is the rule
for this.


> 
>> Signed-off-by: Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> ---
>>  .../devicetree/bindings/arm/coherency-fabric.txt   |   16 ++++
>>  arch/arm/boot/dts/armada-370-xp.dtsi               |    5 ++
>>  arch/arm/mach-mvebu/Makefile                       |    2 +-
>>  arch/arm/mach-mvebu/coherency.c                    |   80 ++++++++++++++++++++
>>  arch/arm/mach-mvebu/coherency.h                    |   24 ++++++
>>  arch/arm/mach-mvebu/coherency_ll.S                 |   47 ++++++++++++
>>  arch/arm/mach-mvebu/common.h                       |    2 +
>>  7 files changed, 175 insertions(+), 1 deletion(-)
>>  create mode 100644 Documentation/devicetree/bindings/arm/coherency-fabric.txt
>>  create mode 100644 arch/arm/mach-mvebu/coherency.c
>>  create mode 100644 arch/arm/mach-mvebu/coherency.h
>>  create mode 100644 arch/arm/mach-mvebu/coherency_ll.S
>>
>> diff --git a/Documentation/devicetree/bindings/arm/coherency-fabric.txt b/Documentation/devicetree/bindings/arm/coherency-fabric.txt
>> new file mode 100644
>> index 0000000..2bfbf67
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/coherency-fabric.txt
>> @@ -0,0 +1,16 @@
>> +Coherency fabric
>> +----------------
>> +Available on Marvell SOCs: Armada 370 and Armada XP
>> +
>> +Required properties:
>> +
>> +- compatible: "marvell,coherency-fabric"
>> +- reg: Should contain,coherency fabric registers location and length.
>> +
>> +Example:
>> +
>> +coherency-fabric@d0020200 {
>> +	compatible = "marvell,coherency-fabric";
>> +	reg = <0xd0020200 0xb0>;
>> +};
>> +
>> diff --git a/arch/arm/boot/dts/armada-370-xp.dtsi b/arch/arm/boot/dts/armada-370-xp.dtsi
>> index 94b4b9e..b0d075b 100644
>> --- a/arch/arm/boot/dts/armada-370-xp.dtsi
>> +++ b/arch/arm/boot/dts/armada-370-xp.dtsi
>> @@ -36,6 +36,11 @@
>>  	      interrupt-controller;
>>  	};
>>  
>> +	coherency-fabric@d0020200 {
>> +		compatible = "marvell,coherency-fabric";
>> +		reg = <0xd0020200 0xb0>;
>> +	};
>> +
>>  	soc {
>>  		#address-cells = <1>;
>>  		#size-cells = <1>;
>> diff --git a/arch/arm/mach-mvebu/Makefile b/arch/arm/mach-mvebu/Makefile
>> index 57f996b..5ce4b42 100644
>> --- a/arch/arm/mach-mvebu/Makefile
>> +++ b/arch/arm/mach-mvebu/Makefile
>> @@ -2,4 +2,4 @@ ccflags-$(CONFIG_ARCH_MULTIPLATFORM) := -I$(srctree)/$(src)/include \
>>  	-I$(srctree)/arch/arm/plat-orion/include
>>  
>>  obj-y += system-controller.o
>> -obj-$(CONFIG_MACH_ARMADA_370_XP) += armada-370-xp.o irq-armada-370-xp.o addr-map.o
>> +obj-$(CONFIG_MACH_ARMADA_370_XP) += armada-370-xp.o irq-armada-370-xp.o addr-map.o coherency.o coherency_ll.o
>> diff --git a/arch/arm/mach-mvebu/coherency.c b/arch/arm/mach-mvebu/coherency.c
>> new file mode 100644
>> index 0000000..1bc02d0
>> --- /dev/null
>> +++ b/arch/arm/mach-mvebu/coherency.c
>> @@ -0,0 +1,80 @@
>> +/*
>> + * Coherency fabric (Aurora) support for Armada 370 and XP platforms.
>> + *
>> + * Copyright (C) 2012 Marvell
>> + *
>> + * Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
>> + * Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> + * Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> + *
>> + * This file is licensed under the terms of the GNU General Public
>> + * License version 2.  This program is licensed "as is" without any
>> + * warranty of any kind, whether express or implied.
>> + *
>> + * The Armada 370 and Armada XP SOCs have a coherency fabric which is
>> + * responsible for ensuring hardware coherency between all CPUs and between
>> + * CPUs and I/O masters. This file initializes the coherency fabric and
>> + * supplies basic routines for configuring and controlling hardware coherency
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/init.h>
>> +#include <linux/of_address.h>
>> +#include <linux/io.h>
>> +#include <linux/smp.h>
>> +#include <asm/smp_plat.h>
>> +#include "armada-370-xp.h"
>> +
>> +/* Some functions in this file are called very early during SMP
>> + * initialization. At that time the device tree framework is not yet
>> + * ready, and it is not possible to get the register address to
>> + * ioremap it. That's why the pointer below is given with an initial
>> + * value matching its virtual mapping
>> + */
>> +static void __iomem *coherency_base = ARMADA_370_XP_REGS_VIRT_BASE + 0x20200;
>> +
>> +/* Coherency fabric registers */
>> +#define COHERENCY_FABRIC_CFG_OFFSET		   0x4
>> +
>> +static struct of_device_id of_coherency_table[] = {
>> +	{.compatible = "marvell,coherency-fabric"},
>> +	{ /* end of list */ },
>> +};
>> +#ifdef CONFIG_SMP
>> +int coherency_get_cpu_count(void)
>> +{
>> +	int reg, cnt;
>> +
>> +	reg = readl(coherency_base + COHERENCY_FABRIC_CFG_OFFSET);
>> +	cnt = (reg & 0xF) + 1;
>> +
>> +	return cnt;
>> +}
>> +#endif
>> +/* Function defined in coherncy_ll.S */
> 
> coherency_ll.S

I knew I have to fix it, and I forgot

> 
>> +extern void ll_set_cpu_coherent(void __iomem *base_addr,
>> +				unsigned int hw_cpu_id);
>> +
>> +int set_cpu_coherent(unsigned int hw_cpu_id, int smp_group_id)
>> +{
>> +	if (!coherency_base) {
>> +		pr_warn("Can't make CPU %d cache coherent.\n", hw_cpu_id);
>> +		pr_warn("Coherency fabric is not initialized\n");
>> +		return 1;
>> +	}
>> +	ll_set_cpu_coherent(coherency_base, hw_cpu_id);
>> +	return 0;
> 
> You can just do return ll_set_cpu_coherent(...) now.

Yes of course that was the plan.

> 
>> +}
>> +
>> +int __init coherency_init(void)
>> +{
>> +	struct device_node *np;
>> +
>> +	np = of_find_matching_node(NULL, of_coherency_table);
>> +	if (np) {
>> +		pr_info("Initializing Coherency fabric\n");
>> +		coherency_base = of_iomap(np, 0);
>> +	}
>> +
>> +	return 0;
>> +}
>> diff --git a/arch/arm/mach-mvebu/coherency.h b/arch/arm/mach-mvebu/coherency.h
>> new file mode 100644
>> index 0000000..2f42813
>> --- /dev/null
>> +++ b/arch/arm/mach-mvebu/coherency.h
>> @@ -0,0 +1,24 @@
>> +/*
>> + * arch/arm/mach-mvebu/include/mach/coherency.h
>> + *
>> + *
>> + * Coherency fabric (Aurora) support for Armada 370 and XP platforms.
>> + *
>> + * Copyright (C) 2012 Marvell
>> + *
>> + * This file is licensed under the terms of the GNU General Public
>> + * License version 2.  This program is licensed "as is" without any
>> + * warranty of any kind, whether express or implied.
>> + */
>> +
>> +#ifndef __MACH_370_XP_COHERENCY_H
>> +#define __MACH_370_XP_COHERENCY_H
>> +
>> +#ifdef CONFIG_SMP
>> +int coherency_get_cpu_count(void);
>> +#endif
>> +
>> +int set_cpu_coherent(int cpu_id, int smp_group_id);
>> +int coherency_init(void);
>> +
>> +#endif	/* __MACH_370_XP_COHERENCY_H */
>> diff --git a/arch/arm/mach-mvebu/coherency_ll.S b/arch/arm/mach-mvebu/coherency_ll.S
>> new file mode 100644
>> index 0000000..ae48730
>> --- /dev/null
>> +++ b/arch/arm/mach-mvebu/coherency_ll.S
>> @@ -0,0 +1,47 @@
>> +/*
>> + * Coherency fabric: low level functions
>> + *
>> + * Copyright (C) 2012 Marvell
>> + *
>> + * Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> + *
>> + * This file is licensed under the terms of the GNU General Public
>> + * License version 2.  This program is licensed "as is" without any
>> + * warranty of any kind, whether express or implied.
>> + *
>> + * This file implements the assembly function to add a CPU to the
>> + * coherency fabric. This function is called by each of the secondary
>> + * CPUs during their early boot in an SMP kernel, this why this
>> + * function have to callable from assembly. It can also be called by a
>> + * primary CPU from C code during its boot.
>> + */
>> +
>> +#include <linux/linkage.h>
>> +#define ARMADA_XP_CFB_CTL_REG_OFFSET 0x0
>> +#define ARMADA_XP_CFB_CFG_REG_OFFSET 0x4
>> +
>> +	.text
>> +/*
>> + * r0: Coherency fabric base register address
>> + * r1: HW CPU id
>> + */
>> +ENTRY(ll_set_cpu_coherent)
>> +	/* Create bit by cpu index */
>> +	mov	r3, #(1 << 24)
>> +	lsl     r1, r3, r1
>> +
>> +	/* Add CPU to SMP group - Atomic */
>> +	add	r3, r0, #ARMADA_XP_CFB_CTL_REG_OFFSET
>> +	ldr     r2, [r3]
>> +	orr     r2, r2, r1
>> +	str	r2, [r0]
>> +
>> +	/* Enable coherency on CPU - Atomic */
>> +	add	r3, r0, #ARMADA_XP_CFB_CFG_REG_OFFSET
>> +	ldr     r2, [r3]
>> +	orr     r2, r2, r1
>> +	str     r2, [r3]
> 
> I forgot to mention this before, but do you need a dsb or something here?
> 
> Will
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
