From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] MIPS: Add device tree support to MIPS
Date: Wed, 28 Jul 2010 12:54:21 -0600
Message-ID: <AANLkTi=a=tGURpMKo7g+32LMcFovx4GJk2Wid6vmvQt8@mail.gmail.com>
References: <20100727214948.GA29241@dediao-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100727214948.GA29241-xfMjgo8mR/VtOC46+g3osbQa8qPdvLwY@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dezhong Diao <dediao-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Dezhong,

Thanks for the patches.  Do you want me to carry these in my test tree
for a while?  I won't be able to test them, but I'll be able to rework
as I make changes to the drivers/of core code.  I'm still making
changes to reduce the number of symbols that architectures need to
implement in order to bring up CONFIG_OF support.

Comments below.

On Tue, Jul 27, 2010 at 3:49 PM, Dezhong Diao <dediao-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org> wrote:
> V2:
> =A0 =A0Synchronize with test-devicetree branch of device tree.
>
> V1:
> =A0 =A0Add common code to support device tree on MIPS.
>
> Signed-off-by: Dezhong Diao <dediao-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> ---
> =A0arch/mips/Kconfig =A0 =A0 =A0 =A0 =A0 =A0| =A0 13 ++++
> =A0arch/mips/include/asm/prom.h | =A0 61 ++++++++++++++++
> =A0arch/mips/kernel/Makefile =A0 =A0| =A0 =A02 +
> =A0arch/mips/kernel/prom.c =A0 =A0 =A0| =A0158 ++++++++++++++++++++++++++=
++++++++++++++++
> =A0arch/mips/kernel/setup.c =A0 =A0 | =A0 =A02 +
> =A05 files changed, 236 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/mips/include/asm/prom.h
> =A0create mode 100644 arch/mips/kernel/prom.c
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index cdaae94..d85e8fb 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2083,6 +2083,19 @@ config SECCOMP
>
> =A0 =A0 =A0 =A0 =A0If unsure, say Y. Only embedded should say N here.
>
> +config USE_OF
> + =A0 =A0 =A0 bool "Flattened Device Tree support"
> + =A0 =A0 =A0 select OF
> + =A0 =A0 =A0 select OF_FLATTREE
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Include support for flattened device tree machine descr=
iptions.
> +
> +config ARCH_HAS_DEVTREE_MEM
> + =A0 =A0 =A0 bool "Support user-defined memory scan function in device t=
ree"
> + =A0 =A0 =A0 depends on OF
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 The user has a customized function to parse memory node=
s.
> +

Hmm, This is a little ugly.  I should rework the memory functions
override code to not require this config symbol.  I'll look into that.

> =A0endmenu
>
> =A0config LOCKDEP_SUPPORT
> diff --git a/arch/mips/include/asm/prom.h b/arch/mips/include/asm/prom.h
> new file mode 100644
> index 0000000..b798b19
> --- /dev/null
> +++ b/arch/mips/include/asm/prom.h
> @@ -0,0 +1,61 @@
> +/*
> + * =A0arch/mips/include/asm/prom.h
> + *
> + * =A0Copyright (C) 2010 Cisco Systems Inc. <dediao-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + */
> +#ifndef __ASM_MIPS_PROM_H
> +#define __ASM_MIPS_PROM_H
> +
> +#ifdef CONFIG_OF
> +#include <linux/init.h>
> +
> +#include <asm/setup.h>
> +#include <asm/irq.h>
> +#include <asm/bootinfo.h>
> +
> +/* which is compatible with the flattened device tree (FDT) */
> +#define cmd_line arcs_cmdline
> +
> +/*
> + * Use this value to indicate lack of interrupt
> + * capability
> + */
> +#ifndef NO_IRQ
> +#define NO_IRQ =A0((unsigned int)(-1))
> +#endif
> +
> +static inline unsigned long pci_address_to_pio(phys_addr_t address)
> +{
> + =A0 =A0 =A0 return (unsigned long)-1;
> +}
> +
> +struct device_node;
> +
> +static inline int of_node_to_nid(struct device_node *device)
> +{
> + =A0 =A0 =A0 return 0;
> +}

This should no longer be necessary in the current test-devicetree branch.

> +
> +static inline void __init early_init_dt_scan_chosen_arch(unsigned long n=
ode)
> +{
> +}
> +
> +extern int __init early_init_dt_scan_memory_arch(unsigned long node,
> + =A0 =A0 =A0 const char *uname, int depth, void *data);
> +
> +extern int __init reserve_mem_mach(unsigned long addr, unsigned long siz=
e);
> +extern void __init free_mem_mach(unsigned long addr, unsigned long size);
> +
> +extern void __init device_tree_init(void);
> +#else /* CONFIG_OF */
> +static inline void __init device_tree_init(void)
> +{
> +}
> +#endif /* CONFIG_OF */
> +
> +#endif /* _ASM_MIPS_PROM_H */
> diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
> index 7a6ac50..4d4ceb1 100644
> --- a/arch/mips/kernel/Makefile
> +++ b/arch/mips/kernel/Makefile
> @@ -95,6 +95,8 @@ obj-$(CONFIG_KEXEC) =A0 =A0 =A0 =A0 =A0 +=3D machine_ke=
xec.o relocate_kernel.o
> =A0obj-$(CONFIG_EARLY_PRINTK) =A0 =A0 +=3D early_printk.o
> =A0obj-$(CONFIG_SPINLOCK_TEST) =A0 =A0+=3D spinlock_test.o
>
> +obj-$(CONFIG_OF) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D prom.o
> +
> =A0CFLAGS_cpu-bugs64.o =A0 =A0=3D $(shell if $(CC) $(KBUILD_CFLAGS) -Wa,-=
mdaddi -c -o /dev/null -xc /dev/null >/dev/null 2>&1; then echo "-DHAVE_AS_=
SET_DADDI"; fi)
>
> =A0obj-$(CONFIG_HAVE_STD_PC_SERIAL_PORT) =A0+=3D 8250-platform.o
> diff --git a/arch/mips/kernel/prom.c b/arch/mips/kernel/prom.c
> new file mode 100644
> index 0000000..fb4adc2
> --- /dev/null
> +++ b/arch/mips/kernel/prom.c
> @@ -0,0 +1,158 @@
> +/*
> + * =A0linux/arch/mips/kernel/prom.c
> + *
> + * =A0Copyright (C) 2010 Cisco Systems Inc. <dediao-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/errno.h>
> +#include <linux/types.h>
> +#include <linux/bootmem.h>
> +#include <linux/initrd.h>
> +#include <linux/debugfs.h>
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +
> +#include <asm/page.h>
> +#include <asm/prom.h>
> +
> +/*
> + * The list of OF IDs below is used for matching bus types in the
> + * system whose devices are to be exposed as of_platform_devices.
> + *
> + * This is the default list valid for most platforms. This file provides
> + * functions who can take an explicit list if necessary though
> + *
> + * The search is always performed recursively looking for children of
> + * the provided device_node and recursively if such a children matches
> + * a bus type in the list
> + */
> +const struct of_device_id of_default_bus_ids[] =3D {
> + =A0 =A0 =A0 {},
> +};

You can also remove this symbol now.

> +
> +#ifndef CONFIG_ARCH_HAS_DEVTREE_MEM
> +int __init early_init_dt_scan_memory_arch(unsigned long node,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 const char *uname, int depth,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 void *data)
> +{
> + =A0 =A0 =A0 return early_init_dt_scan_memory(node, uname, depth, data);
> +}
> +
> +void __init early_init_dt_add_memory_arch(u64 base, u64 size)
> +{
> + =A0 =A0 =A0 return add_memory_region(base, size, BOOT_MEM_RAM);
> +}
> +
> +int __init reserve_mem_mach(unsigned long addr, unsigned long size)
> +{
> + =A0 =A0 =A0 return reserve_bootmem(addr, size, BOOTMEM_DEFAULT);
> +}
> +
> +void __init free_mem_mach(unsigned long addr, unsigned long size)
> +{
> + =A0 =A0 =A0 return free_bootmem(addr, size);
> +}
> +#endif
> +
> +u64 __init early_init_dt_alloc_memory_arch(u64 size, u64 align)
> +{
> + =A0 =A0 =A0 return virt_to_phys(
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 __alloc_bootmem(size, align, __pa(MAX_DMA_A=
DDRESS))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 );
> +}
> +
> +#ifdef CONFIG_BLK_DEV_INITRD
> +void __init early_init_dt_setup_initrd_arch(unsigned long start,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 unsigned long end)
> +{
> + =A0 =A0 =A0 initrd_start =3D (unsigned long)__va(start);
> + =A0 =A0 =A0 initrd_end =3D (unsigned long)__va(end);
> + =A0 =A0 =A0 initrd_below_start_ok =3D 1;
> +}
> +#endif
> +
> +/*
> + * Interrupt remapper
> + */
> +struct device_node *of_irq_find_parent_by_phandle(phandle p)
> +{
> + =A0 =A0 =A0 return of_find_node_by_phandle(p);
> +}

Also can be removed.

> +
> +/*
> + * irq_create_of_mapping - Hook to resolve OF irq specifier into a Linux=
 irq#
> + *
> + * Currently the mapping mechanism is trivial; simple flat hwirq numbers=
 are
> + * mapped 1:1 onto Linux irq numbers. =A0Cascaded irq controllers are not
> + * supported.
> + */
> +unsigned int irq_create_of_mapping(struct device_node *controller,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cons=
t u32 *intspec, unsigned int intsize)
> +{
> + =A0 =A0 =A0 return intspec[0];
> +}
> +EXPORT_SYMBOL_GPL(irq_create_of_mapping);
> +
> +void __init early_init_devtree(void *params)
> +{
> + =A0 =A0 =A0 /* Setup flat device-tree pointer */
> + =A0 =A0 =A0 initial_boot_params =3D params;
> +
> + =A0 =A0 =A0 /* Retrieve various informations from the /chosen node of t=
he
> + =A0 =A0 =A0 =A0* device-tree, including the platform type, initrd locat=
ion and
> + =A0 =A0 =A0 =A0* size, and more ...
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 of_scan_flat_dt(early_init_dt_scan_chosen, NULL);
> +
> + =A0 =A0 =A0 /* Scan memory nodes */
> + =A0 =A0 =A0 of_scan_flat_dt(early_init_dt_scan_root, NULL);
> + =A0 =A0 =A0 of_scan_flat_dt(early_init_dt_scan_memory_arch, NULL);
> +}
> +
> +void __init device_tree_init(void)
> +{
> + =A0 =A0 =A0 unsigned long base, size;
> +
> + =A0 =A0 =A0 if (!initial_boot_params)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> +
> + =A0 =A0 =A0 base =3D virt_to_phys((void *)initial_boot_params);
> + =A0 =A0 =A0 size =3D initial_boot_params->totalsize;
> +
> + =A0 =A0 =A0 /* Before we do anything, lets reserve the dt blob */
> + =A0 =A0 =A0 reserve_mem_mach(base, size);
> +
> + =A0 =A0 =A0 unflatten_device_tree();
> +
> + =A0 =A0 =A0 /* free the space reserved for the dt blob */
> + =A0 =A0 =A0 free_mem_mach(base, size);
> +}
> +
> +#if defined(CONFIG_DEBUG_FS) && defined(DEBUG)
> +static struct dentry *of_debugfs_root;
> +static struct debugfs_blob_wrapper flat_dt_blob;
> +
> +static int __init export_flat_device_tree(void)
> +{
> + =A0 =A0 =A0 struct dentry *d;
> +
> + =A0 =A0 =A0 flat_dt_blob.data =3D initial_boot_params;
> + =A0 =A0 =A0 flat_dt_blob.size =3D initial_boot_params->totalsize;
> +
> + =A0 =A0 =A0 d =3D debugfs_create_blob("flat-device-tree", S_IFREG | S_I=
RUSR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_debugfs_=
root, &flat_dt_blob);
> + =A0 =A0 =A0 if (!d)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 1;
> +
> + =A0 =A0 =A0 return 0;
> +}
> +device_initcall(export_flat_device_tree);
> +#endif

I'm probably also going to move the debugfs file into common code
(unless someone beats me to it).  :-)

> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 85aef3f..a6b900f 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -31,6 +31,7 @@
> =A0#include <asm/setup.h>
> =A0#include <asm/smp-ops.h>
> =A0#include <asm/system.h>
> +#include <asm/prom.h>
>
> =A0struct cpuinfo_mips cpu_data[NR_CPUS] __read_mostly;
>
> @@ -487,6 +488,7 @@ static void __init arch_mem_init(char **cmdline_p)
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0bootmem_init();
> + =A0 =A0 =A0 device_tree_init();
> =A0 =A0 =A0 =A0sparse_init();
> =A0 =A0 =A0 =A0paging_init();
> =A0}

Very nice clean patch, thanks!  How/when would you like to see MIPS OF
support go into mainline?

g.


-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
