From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 02/15] x86: Add device tree support
Date: Thu, 30 Dec 2010 14:01:40 -0700
Message-ID: <AANLkTi=EFewaizO=1FLALE0eQPUmaFPfTmgoeF+JRpkt@mail.gmail.com>
References: <1292600033-12271-1-git-send-email-bigeasy@linutronix.de>
	<1292600033-12271-3-git-send-email-bigeasy@linutronix.de>
	<20101230084311.GD11721@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101230084311.GD11721-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Peter,

Since this series is based on the tip tree, these should be merged via
the same route.  Aside from the comments below, I'm okay with patches
1 & 2 going in for 2.6.38 (assuming NO_IRQ is fixed).  I've picked up
patch 12 since it is a generic fix.  I haven't made a decision on the
remaining 14 yet.

g.

On Thu, Dec 30, 2010 at 1:43 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
> On Fri, Dec 17, 2010 at 04:33:40PM +0100, Sebastian Andrzej Siewior wrote:
>> This patch adds minimal support for device tree support on x86. It will
>> be passed to the kernel via setup_data which requires atleast boot
>> protocol 2.09.
>> Memory size, restricted memory regions, boot arguments are gathered the
>> traditional way so things like cmd_line are just here to let the code
>> compile.
>> The current plan is use the device tree as an extension and to gather
>> informations from it which can not be enumerated and have to be
>> hardcoded otherwise. This includes things like
>> - which devices are on this I2C/ SPI bus?
>> - how are the interrupts wired to IO APIC?
>> - where could my hpet be?
>>
>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
>> Signed-off-by: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Mostly looks good. Some comments below.
>
> g.
>
>> ---
>> =A0Documentation/x86/boot_with_dtb.txt | =A0 26 +++++++++++++++
>> =A0arch/x86/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A07 ++=
++
>> =A0arch/x86/include/asm/bootparam.h =A0 =A0| =A0 =A01 +
>> =A0arch/x86/include/asm/prom.h =A0 =A0 =A0 =A0 | =A0 59 ++++++++++++++++=
+++++++++++++++++++
>> =A0arch/x86/kernel/Makefile =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A01 +
>> =A0arch/x86/kernel/irqinit.c =A0 =A0 =A0 =A0 =A0 | =A0 =A01 +
>> =A0arch/x86/kernel/prom.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 54 ++++++++++=
++++++++++++++++++++++
>> =A0arch/x86/kernel/setup.c =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A04 ++
>> =A08 files changed, 153 insertions(+), 0 deletions(-)
>> =A0create mode 100644 Documentation/x86/boot_with_dtb.txt
>> =A0create mode 100644 arch/x86/include/asm/prom.h
>> =A0create mode 100644 arch/x86/kernel/prom.c
>>
>> diff --git a/Documentation/x86/boot_with_dtb.txt b/Documentation/x86/boo=
t_with_dtb.txt
>> new file mode 100644
>> index 0000000..6a357aa
>> --- /dev/null
>> +++ b/Documentation/x86/boot_with_dtb.txt
>> @@ -0,0 +1,26 @@
>> + =A0Booting x86 with device tree
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +1. Introduction
>> +~~~~~~~~~~~~~~~
>> +This document contains device tree information which are specific to
>> +the x86 platform. Generic informations as bindings can be found in
>> +Documentation/powerpc/dts-bindings/
>> +
>> +2. Passing the device tree
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +The pointer to the device tree block (dtb) is passed via setup_data
>> +(see [0]) which requires at least boot protocol 2.09. The type filed is
>> +defined as
>> +
>> +#define SETUP_DTB =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A02
>> +
>> +3. Purpose
>> +~~~~~~~~~~~
>> +The device tree is used as an extension to the "boot page". As such it =
does not
>> +parse / consider data which are already covered by the boot page. This =
includes
>> +memory size, command line arguments or initrd address.
>> +It simply holds information which can not be retrieved otherwise like i=
nterrupt
>> +routing or a list of devices behind an I2C bus.
>> +
>> +[0] Documentation/x86/boot.txt
>> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>> index b6fccb0..0522354 100644
>> --- a/arch/x86/Kconfig
>> +++ b/arch/x86/Kconfig
>> @@ -299,6 +299,13 @@ config X86_BIGSMP
>> =A0 =A0 =A0 ---help---
>> =A0 =A0 =A0 =A0 This option is needed for the systems that have more tha=
n 8 CPUs
>>
>> +config X86_OF
>> + =A0 =A0 bool "Support for device tree"
>> + =A0 =A0 select OF
>> + =A0 =A0 select OF_FLATTREE
>> + =A0 =A0 ---help---
>> + =A0 =A0 =A0 Device tree support on X86.
>> +
>> =A0if X86_32
>> =A0config X86_EXTENDED_PLATFORM
>> =A0 =A0 =A0 bool "Support for extended (non-PC) x86 platforms"
>> diff --git a/arch/x86/include/asm/bootparam.h b/arch/x86/include/asm/boo=
tparam.h
>> index c8bfe63..e020d88 100644
>> --- a/arch/x86/include/asm/bootparam.h
>> +++ b/arch/x86/include/asm/bootparam.h
>> @@ -12,6 +12,7 @@
>> =A0/* setup data types */
>> =A0#define SETUP_NONE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0
>> =A0#define SETUP_E820_EXT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1
>> +#define SETUP_DTB =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A02
>>
>> =A0/* extensible setup data list node */
>> =A0struct setup_data {
>> diff --git a/arch/x86/include/asm/prom.h b/arch/x86/include/asm/prom.h
>> new file mode 100644
>> index 0000000..2fbe3e8
>> --- /dev/null
>> +++ b/arch/x86/include/asm/prom.h
>> @@ -0,0 +1,59 @@
>> +/*
>> + * Definitions for Device tree / OpenFirmware handling on X86
>> + *
>> + * based on arch/powerpc/include/asm/prom.h which is
>> + * =A0 =A0 =A0 =A0 Copyright (C) 1996-2005 Paul Mackerras.
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License
>> + * as published by the Free Software Foundation; either version
>> + * 2 of the License, or (at your option) any later version.
>> + */
>> +
>> +#ifndef _ASM_X86_PROM_H
>> +#define _ASM_X86_PROM_H
>> +#ifndef __ASSEMBLY__
>> +
>> +#include <linux/of.h>
>> +#include <linux/types.h>
>> +#include <asm/irq.h>
>> +#include <asm/atomic.h>
>> +#include <asm/setup.h>
>> +
>> +#ifdef CONFIG_OF
>> +extern void add_dtb(u64 data);
>> +#else
>> +static inline void add_dtb(u64 data) { }
>> +#endif
>> +
>> +extern char cmd_line[COMMAND_LINE_SIZE];
>> +/* This number is used when no interrupt has been assigned */
>> +#define NO_IRQ =A0 =A0 =A0 =A0 =A0 =A0 =A0 (-1)
>
> 0 means NO_IRQ on x86 and most architectures. =A0I will change this when
> I pick up the patch.
>
>> +
>> +#define pci_address_to_pio pci_address_to_pio
>> +unsigned long pci_address_to_pio(phys_addr_t addr);
>> +
>> +/**
>> + * irq_dispose_mapping - Unmap an interrupt
>> + * @virq: linux virq number of the interrupt to unmap
>> + *
>> + * FIXME: We really should implement proper virq handling like power,
>> + * but that's going to be major surgery.
>> + */
>> +static inline void irq_dispose_mapping(unsigned int virq) { }
>> +
>> +#define HAVE_ARCH_DEVTREE_FIXUPS
>> +
>> +#endif /* __ASSEMBLY__ */
>> +
>> +/*
>> + * These includes are put at the bottom because they may contain things
>> + * that are overridden by this file. =A0Ideally they shouldn't be inclu=
ded
>> + * by this file, but there are a bunch of .c files that currently depend
>> + * on it. =A0Eventually they will be cleaned up.
>> + */
>> +#include <linux/of_fdt.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/platform_device.h>
>> +
>> +#endif
>> diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
>> index f60153d..40bc33d 100644
>> --- a/arch/x86/kernel/Makefile
>> +++ b/arch/x86/kernel/Makefile
>> @@ -108,6 +108,7 @@ obj-$(CONFIG_MICROCODE) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 +=3D microcode.o
>> =A0obj-$(CONFIG_X86_CHECK_BIOS_CORRUPTION) +=3D check.o
>>
>> =A0obj-$(CONFIG_SWIOTLB) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
+=3D pci-swiotlb.o
>> +obj-$(CONFIG_X86_OF) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D prom.o
>>
>> =A0###
>> =A0# 64 bit specific files
>> diff --git a/arch/x86/kernel/irqinit.c b/arch/x86/kernel/irqinit.c
>> index c752e97..149c87f 100644
>> --- a/arch/x86/kernel/irqinit.c
>> +++ b/arch/x86/kernel/irqinit.c
>> @@ -25,6 +25,7 @@
>> =A0#include <asm/setup.h>
>> =A0#include <asm/i8259.h>
>> =A0#include <asm/traps.h>
>> +#include <asm/prom.h>
>>
>> =A0/*
>> =A0 * ISA PIC or low IO-APIC triggered (INTA-cycle or APIC) interrupts:
>> diff --git a/arch/x86/kernel/prom.c b/arch/x86/kernel/prom.c
>> new file mode 100644
>> index 0000000..249ebd3
>> --- /dev/null
>> +++ b/arch/x86/kernel/prom.c
>> @@ -0,0 +1,54 @@
>> +/*
>> + * Architecture specific OF callbacks.
>> + */
>> +#include <linux/bootmem.h>
>> +#include <linux/io.h>
>> +#include <linux/list.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/slab.h>
>> +
>> +char __initdata cmd_line[COMMAND_LINE_SIZE];
>> +
>> +unsigned int irq_create_of_mapping(struct device_node *controller,
>> + =A0 =A0 =A0 =A0 =A0 =A0 const u32 *intspec, unsigned int intsize)
>> +{
>> + =A0 =A0 return intspec[0];
>> +
>> +}
>> +EXPORT_SYMBOL_GPL(irq_create_of_mapping);
>> +
>> +unsigned long pci_address_to_pio(phys_addr_t address)
>> +{
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* The ioport address can be directly used by inX / outX
>> + =A0 =A0 =A0*/
>> + =A0 =A0 BUG_ON(address >=3D (1 << 16));
>> + =A0 =A0 return (unsigned long)address;
>> +}
>> +EXPORT_SYMBOL_GPL(pci_address_to_pio);
>> +
>> +void __init early_init_dt_scan_chosen_arch(unsigned long node)
>> +{
>> + =A0 =A0 BUG();
>> +}
>> +
>> +void __init early_init_dt_add_memory_arch(u64 base, u64 size)
>> +{
>> + =A0 =A0 BUG();
>> +}
>> +
>> +u64 __init early_init_dt_alloc_memory_arch(u64 size, u64 align)
>> +{
>> + =A0 =A0 void *mem;
>> +
>> + =A0 =A0 mem =3D __alloc_bootmem(size, align, __pa(MAX_DMA_ADDRESS));
>> + =A0 =A0 return virt_to_phys(mem);
>> +}
>> +
>> +void __init add_dtb(u64 data)
>> +{
>> + =A0 =A0 initial_boot_params =3D (struct boot_param_header *)
>> + =A0 =A0 =A0 =A0 =A0 =A0 phys_to_virt((u64) (u32) data +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 offsetof(struc=
t setup_data, data));
>> +}
>> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
>> index 577d06b..26f2c9a 100644
>> --- a/arch/x86/kernel/setup.c
>> +++ b/arch/x86/kernel/setup.c
>> @@ -113,6 +113,7 @@
>> =A0#endif
>> =A0#include <asm/mce.h>
>> =A0#include <asm/alternative.h>
>> +#include <asm/prom.h>
>>
>> =A0/*
>> =A0 * end_pfn only includes RAM, while max_pfn_mapped includes all e820 =
entries.
>> @@ -445,6 +446,9 @@ static void __init parse_setup_data(void)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 case SETUP_E820_EXT:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 parse_e820_ext(data);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 =A0 =A0 =A0 case SETUP_DTB:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 add_dtb(pa_data);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>
> Why is the physical address being passed in when the virtual address
> is needed to be stored in initial_boot_params by add_dtb()?
>
>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 default:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> --
>> 1.7.3.2
>>
>> _______________________________________________
>> devicetree-discuss mailing list
>> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> https://lists.ozlabs.org/listinfo/devicetree-discuss
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
