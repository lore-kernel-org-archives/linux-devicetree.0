From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH TIP 02/14] x86: Add device tree support
Date: Thu, 17 Feb 2011 12:03:34 +0100
Message-ID: <4D5D0086.801@linutronix.de>
References: <1295843342-1122-1-git-send-email-bigeasy@linutronix.de>
	<1295843342-1122-3-git-send-email-bigeasy@linutronix.de>
	<20110216212623.GA22837@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110216212623.GA22837-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> Hi Sebastian,
Hi Grant,

> 
> Relatively minor comments below.  You can go ahead and add the
> following when you respin:
> 
> Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

Cool.

>> diff --git a/Documentation/x86/boot_with_dtb.txt b/Documentation/x86/boot_with_dtb.txt
>> new file mode 100644
>> index 0000000..6a357aa
>> --- /dev/null
>> +++ b/Documentation/x86/boot_with_dtb.txt
>> @@ -0,0 +1,26 @@
>> +  Booting x86 with device tree
>> +=================================
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
>> +#define SETUP_DTB                      2
>> +
>> +3. Purpose
>> +~~~~~~~~~~~
>> +The device tree is used as an extension to the "boot page". As such it does not
>> +parse / consider data which are already covered by the boot page. This includes
>> +memory size, command line arguments or initrd address.
>> +It simply holds information which can not be retrieved otherwise like interrupt
>> +routing or a list of devices behind an I2C bus.
>> +
>> +[0] Documentation/x86/boot.txt
> 
> Please also add a brief description to section I of
> Documentation/devicetree/booting-without-of.txt

I assumed this file is powerpc only. Since you added arm there I have no
problem to move this content there.

>> diff --git a/arch/x86/include/asm/prom.h b/arch/x86/include/asm/prom.h
>> index b4ec95f..b227ba7 100644
>> --- a/arch/x86/include/asm/prom.h
>> +++ b/arch/x86/include/asm/prom.h
>> @@ -1 +1,59 @@
>> -/* dummy prom.h; here to make linux/of.h's #includes happy */
>> +/*
>> + * Definitions for Device tree / OpenFirmware handling on X86
>> + *
>> + * based on arch/powerpc/include/asm/prom.h which is
>> + *         Copyright (C) 1996-2005 Paul Mackerras.
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
>> +#define NO_IRQ		(0)
> 
> This line should no longer be necessary.  drivers/of/irq.c defines
> NO_IRQ if it isn't already defined by the architecture.  I'm trying to
> limit the exposure of NO_IRQ in dt code.

okay, I will to remove that.

>> +#endif /* __ASSEMBLY__ */
>> +
>> +/*
>> + * These includes are put at the bottom because they may contain things
>> + * that are overridden by this file.  Ideally they shouldn't be included
>> + * by this file, but there are a bunch of .c files that currently depend
>> + * on it.  Eventually they will be cleaned up.
>> + */
>> +#include <linux/of_fdt.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/platform_device.h>
> 
> You should be able to remove these includes.  The problems described
> in the header are mostly with device drivers and architecture code.
> You shouldn't run into any of those issue, and if you do they should
> be fixed at the source.
okay.

>> index c752e97..149c87f 100644
>> --- a/arch/x86/kernel/irqinit.c
>> +++ b/arch/x86/kernel/irqinit.c
>> @@ -25,6 +25,7 @@
>>  #include <asm/setup.h>
>>  #include <asm/i8259.h>
>>  #include <asm/traps.h>
>> +#include <asm/prom.h>
> 
> I'm probably missing something.  I don't see any changes to irqinit.c
> other than this.  What symbol definition has been moved to prom.h that
> irqinit.c needs?

This hunk was folded into the wrong patch. It should been folded into
"x86/ioapic: Add OF bindings for IO-APIC".

>>  /*
>>   * ISA PIC or low IO-APIC triggered (INTA-cycle or APIC) interrupts:
>> diff --git a/arch/x86/kernel/prom.c b/arch/x86/kernel/prom.c
>> new file mode 100644
>> index 0000000..4969ffa
>> --- /dev/null
>> +++ b/arch/x86/kernel/prom.c
> 
> You don't need to name this prom.c.  devicetree.c would make more sense.
> prom is a legacy name from when only Open Firmware systems were using
> the dt code.

okay.

>> @@ -0,0 +1,51 @@

>> +
>> +void __init add_dtb(u64 data)
>> +{
>> +	initial_boot_params = (struct boot_param_header *)
>> +		phys_to_virt((u64) (u32) data +
>> +				offsetof(struct setup_data, data));
> 
> (struct boot_param_header *) cast unnecessary since phys_to_virt
> should return a void*.

removed.

>> +}

Sebastian
