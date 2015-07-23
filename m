From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 6/8] ACPI: add GTDT table parse driver into ACPI driver
Date: Thu, 23 Jul 2015 16:32:39 +0800
Message-ID: <CADyBb7vu5VYjWqQjg4w+C86F9HxRJz8jabSBLwYrK9xfU3dqGw@mail.gmail.com>
References: <=fu.wei@linaro.org>
	<1435075182-20182-1-git-send-email-fu.wei@linaro.org>
	<1435075182-20182-2-git-send-email-fu.wei@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435075182-20182-2-git-send-email-fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rafael Wysocki <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Vipul Gandhi <vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rafael,

Any suggestion on the  GTDT patch of this patch set?
Please let me know if I can do anything to improve it.
If it is OK for you, could you add a "Acked-by:"?

Great thanks for your time! :-)


On 23 June 2015 at 23:59,  <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> This driver adds support for parsing SBSA Generic Watchdog
> Structure in GTDT, and creating a platform device with that
> information. This allows the operating system to obtain device
> data from the resource of platform device.
>
> The platform device named "sbsa-gwdt" can be used by the
> ARM SBSA Generic Watchdog driver.
>
> Signed-off-by: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/acpi/Kconfig  |   9 ++++
>  drivers/acpi/Makefile |   1 +
>  drivers/acpi/gtdt.c   | 137 ++++++++++++++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 147 insertions(+)
>  create mode 100644 drivers/acpi/gtdt.c
>
> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> index 1bbaa3d..e125698 100644
> --- a/drivers/acpi/Kconfig
> +++ b/drivers/acpi/Kconfig
> @@ -433,4 +433,13 @@ config XPOWER_PMIC_OPREGION
>
>  endif
>
> +config ACPI_GTDT
> +       bool "ACPI GTDT Support"
> +       depends on ARM64
> +       help
> +         GTDT (Generic Timer Description Table) provides information
> +         for per-processor timers and Platform (memory-mapped) timer=
s
> +         for ARM platforms. Select this option to provide informatio=
n
> +         needed for the timers init.
> +
>  endif  # ACPI
> diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
> index 431e587..2c5a194 100644
> --- a/drivers/acpi/Makefile
> +++ b/drivers/acpi/Makefile
> @@ -96,3 +96,4 @@ obj-$(CONFIG_ACPI_EXTLOG)     +=3D acpi_extlog.o
>  obj-$(CONFIG_PMIC_OPREGION)    +=3D pmic/intel_pmic.o
>  obj-$(CONFIG_CRC_PMIC_OPREGION) +=3D pmic/intel_pmic_crc.o
>  obj-$(CONFIG_XPOWER_PMIC_OPREGION) +=3D pmic/intel_pmic_xpower.o
> +obj-$(CONFIG_ACPI_GTDT)                +=3D gtdt.o
> diff --git a/drivers/acpi/gtdt.c b/drivers/acpi/gtdt.c
> new file mode 100644
> index 0000000..a92abf2
> --- /dev/null
> +++ b/drivers/acpi/gtdt.c
> @@ -0,0 +1,137 @@
> +/*
> + * ARM Specific GTDT table Support
> + *
> + * Copyright (C) 2015, Linaro Ltd.
> + * Author: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> + *         Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +static int __init map_generic_timer_interrupt(u32 interrupt, u32 fla=
gs)
> +{
> +       int trigger, polarity;
> +
> +       if (!interrupt)
> +               return 0;
> +
> +       trigger =3D (flags & ACPI_GTDT_INTERRUPT_MODE) ? ACPI_EDGE_SE=
NSITIVE
> +                       : ACPI_LEVEL_SENSITIVE;
> +
> +       polarity =3D (flags & ACPI_GTDT_INTERRUPT_POLARITY) ? ACPI_AC=
TIVE_LOW
> +                       : ACPI_ACTIVE_HIGH;
> +
> +       return acpi_register_gsi(NULL, interrupt, trigger, polarity);
> +}
> +
> +/*
> + * Initialize a SBSA generic Watchdog platform device info from GTDT
> + * According to SBSA specification the size of refresh and control
> + * frames of SBSA Generic Watchdog is SZ_4K(Offset 0x000 =E2=80=93 0=
xFFF).
> + */
> +static int __init gtdt_import_sbsa_gwdt(struct acpi_gtdt_watchdog *w=
d,
> +                                       int index)
> +{
> +       struct platform_device *pdev;
> +       int irq =3D map_generic_timer_interrupt(wd->timer_interrupt,
> +                                             wd->timer_flags);
> +       struct resource res[] =3D {
> +               DEFINE_RES_IRQ_NAMED(irq, "ws0"),
> +               DEFINE_RES_MEM_NAMED(wd->refresh_frame_address, SZ_4K=
,
> +                                    "refresh"),
> +               DEFINE_RES_MEM_NAMED(wd->control_frame_address, SZ_4K=
,
> +                                    "control"),
> +       };
> +
> +       pr_debug("GTDT: a Watchdog GT(0x%llx/0x%llx gsi:%u flags:0x%x=
)\n",
> +                wd->refresh_frame_address, wd->control_frame_address=
,
> +                wd->timer_interrupt, wd->timer_flags);
> +
> +       if (!(wd->refresh_frame_address &&
> +             wd->control_frame_address &&
> +             wd->timer_interrupt)) {
> +               pr_err("GTDT: failed geting the device info.\n");
> +               return -EINVAL;
> +       }
> +
> +       if (irq < 0) {
> +               pr_err("GTDT: failed to register GSI of the Watchdog =
GT.\n");
> +               return -EINVAL;
> +       }
> +
> +       /*
> +        * Add a platform device named "sbsa-gwdt" to match the platf=
orm driver.
> +        * "sbsa-gwdt": SBSA(Server Base System Architecture) Generic=
 Watchdog
> +        * The platform driver (like drivers/watchdog/sbsa_gwdt.c)can=
 get device
> +        * info below by matching this name.
> +        */
> +       pdev =3D platform_device_register_simple("sbsa-gwdt", index, =
res,
> +                                              ARRAY_SIZE(res));
> +       if (IS_ERR(pdev)) {
> +               acpi_unregister_gsi(wd->timer_interrupt);
> +               return PTR_ERR(pdev);
> +       }
> +
> +       return 0;
> +}
> +
> +static int __init gtdt_platform_timer_parse(struct acpi_table_header=
 *table)
> +{
> +       struct acpi_gtdt_header *header;
> +       struct acpi_table_gtdt *gtdt;
> +       void *gtdt_subtable;
> +       int i, gwdt_index;
> +       int ret =3D 0;
> +
> +       if (table->revision < 2) {
> +               pr_warn("GTDT: Revision:%d doesn't support Platform T=
imers.\n",
> +                       table->revision);
> +               return 0;
> +       }
> +
> +       gtdt =3D container_of(table, struct acpi_table_gtdt, header);
> +       if (!gtdt->platform_timer_count) {
> +               pr_info("GTDT: No Platform Timer structures.\n");
> +               return 0;
> +       }
> +
> +       gtdt_subtable =3D (void *)gtdt + gtdt->platform_timer_offset;
> +
> +       for (i =3D 0, gwdt_index =3D 0; i < gtdt->platform_timer_coun=
t; i++) {
> +               if (gtdt_subtable > (void *)table + table->length) {
> +                       pr_err("GTDT: subtable pointer overflows, bad=
 table\n");
> +                       return -EINVAL;
> +               }
> +               header =3D (struct acpi_gtdt_header *)gtdt_subtable;
> +               if (header->type =3D=3D ACPI_GTDT_TYPE_WATCHDOG) {
> +                       ret =3D gtdt_import_sbsa_gwdt(gtdt_subtable, =
gwdt_index);
> +                       if (ret)
> +                               pr_err("GTDT: failed to import subtab=
le %d\n",
> +                                      i);
> +                       else
> +                               gwdt_index++;
> +               }
> +               gtdt_subtable +=3D header->length;
> +       }
> +
> +       return ret;
> +}
> +
> +static int __init gtdt_platform_timer_init(void)
> +{
> +       if (acpi_disabled)
> +               return 0;
> +
> +       return acpi_table_parse(ACPI_SIG_GTDT, gtdt_platform_timer_pa=
rse);
> +}
> +
> +device_initcall(gtdt_platform_timer_init);
> --
> 1.9.1
>



--=20
Best regards,

=46u Wei
Software Engineer
Red Hat Software (Beijing) Co.,Ltd.Shanghai Branch
Ph: +86 21 61221326(direct)
Ph: +86 186 2020 4684 (mobile)
Room 1512, Regus One Corporate Avenue,Level 15,
One Corporate Avenue,222 Hubin Road,Huangpu District,
Shanghai,China 200021
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdo=
g" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
