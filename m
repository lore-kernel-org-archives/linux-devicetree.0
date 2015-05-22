From: Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 7/7] ACPI: import watchdog info of GTDT into platform
 device
Date: Fri, 22 May 2015 23:38:00 +0800
Message-ID: <555F4D58.6040107@linaro.org>
References: <=fu.wei@linaro.org> <1432197156-16947-1-git-send-email-fu.wei@linaro.org> <1432197156-16947-8-git-send-email-fu.wei@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432197156-16947-8-git-send-email-fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org, linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, leo.duran-5C7GfCeVMHo@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+CC Catalin and Will

On 2015=E5=B9=B405=E6=9C=8821=E6=97=A5 16:32, fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
> From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Parse SBSA Generic Watchdog Structure in GTDT table of ACPI,
> and create a platform device with that information.
> This platform device can be used by the ARM SBSA Generic
> Watchdog driver.
>
> Signed-off-by: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>   arch/arm64/kernel/acpi.c | 136 ++++++++++++++++++++++++++++++++++++=
+++++++++++
>   1 file changed, 136 insertions(+)
>
> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> index 8b83955..1ed11fd 100644
> --- a/arch/arm64/kernel/acpi.c
> +++ b/arch/arm64/kernel/acpi.c
> @@ -23,6 +23,7 @@
>   #include <linux/irqdomain.h>
>   #include <linux/memblock.h>
>   #include <linux/of_fdt.h>
> +#include <linux/platform_device.h>
>   #include <linux/smp.h>
>
>   #include <asm/cputype.h>
> @@ -343,3 +344,138 @@ void __init acpi_gic_init(void)
>
>   	early_acpi_os_unmap_memory((char *)table, tbl_size);
>   }
> +
> +static int __init acpi_gtdt_import_sbsa_gwdt(struct acpi_gtdt_watchd=
og *wd,
> +					     int index)
> +{
> +	struct platform_device *pdev;
> +	struct resource *res;
> +	u32 gsi, flags;
> +	int irq, trigger, polarity;
> +	resource_size_t rf_base_phy, cf_base_phy;=09
> +	int err =3D -ENOMEM;
> +
> +	/*
> +	 * Get SBSA Generic Watchdog info
> +	 * from a Watchdog GT type structure in GTDT
> +	 */
> +	rf_base_phy =3D (resource_size_t)wd->refresh_frame_address;
> +	cf_base_phy =3D (resource_size_t)wd->control_frame_address;
> +	gsi =3D wd->timer_interrupt;
> +	flags =3D wd->timer_flags;
> +
> +	pr_info("GTDT: a Watchdog GT structure(0x%llx/0x%llx gsi:%u flags:0=
x%x)\n",
> +		rf_base_phy, cf_base_phy, gsi, flags);

Can we use pr_debug here? I don't think those information
worthy a pr_info.

> +
> +	if (!(rf_base_phy && cf_base_phy && gsi)) {
> +		pr_err("GTDT: failed geting the device info.\n");
> +		return -EINVAL;
> +	}
> +
> +	trigger =3D (flags & ACPI_GTDT_INTERRUPT_MODE) ? ACPI_EDGE_SENSITIV=
E
> +			: ACPI_LEVEL_SENSITIVE;
> +	polarity =3D (flags & ACPI_GTDT_INTERRUPT_POLARITY) ? ACPI_ACTIVE_L=
OW
> +			: ACPI_ACTIVE_HIGH;

I see places to duplicate this, I will look into this to see we can for=
m
a function to handle it.

> +	irq =3D acpi_register_gsi(NULL, gsi, trigger, polarity);
> +	if (irq < 0) {
> +		pr_err("GTDT: failed to register GSI of the Watchdog GT.\n");
> +		return -EINVAL;
> +	}
> +
> +	pdev =3D platform_device_alloc("sbsa-gwdt", index);

Please put a comment before this function to explain
why we need a "sbsa-gwdt" name here.

> +	if (!pdev)
> +		goto err_unregister_gsi;
> +
> +	res =3D kcalloc(3, sizeof(*res), GFP_KERNEL);
> +	if (!res)
> +		goto err_device_put;
> +
> +	res[0].start =3D rf_base_phy;
> +	res[0].end =3D rf_base_phy + SZ_4K - 1;
> +	res[0].name =3D "refresh";
> +	res[0].flags =3D IORESOURCE_MEM;
> +
> +	res[1].start =3D cf_base_phy;
> +	res[1].end =3D cf_base_phy + SZ_4K - 1;

So why SZ_4K? is it defined in SBSA spec? if so, please
comment on it too.

> +	res[1].name =3D "control";
> +	res[1].flags =3D IORESOURCE_MEM;
> +
> +	res[2].start =3D irq;
> +	res[2].end =3D res[2].start;
> +	res[2].name =3D "ws0";
> +	res[2].flags =3D IORESOURCE_IRQ;
> +
> +	err =3D platform_device_add_resources(pdev, res, 3);
> +	if (err)
> +		goto err_free_res;
> +
> +	err =3D platform_device_add(pdev);
> +	if (err)
> +		goto err_free_res;
> +
> +	return 0;
> +
> +err_free_res:
> +	kfree(res);
> +err_device_put:
> +	platform_device_put(pdev);
> +err_unregister_gsi:
> +	acpi_unregister_gsi(gsi);
> +
> +	return err;
> +}
> +
> +/* Initialize SBSA generic Watchdog platform device info from GTDT *=
/
> +static int __init acpi_gtdt_sbsa_gwdt_init(struct acpi_table_header =
*table)
> +{
> +	struct acpi_table_gtdt *gtdt;
> +	struct acpi_gtdt_header *header;
> +	void *gtdt_subtable;
> +	int i, gwdt_index;
> +	int ret =3D 0;
> +
> +	if (table->revision < 2) {
> +		pr_info("GTDT: Revision:%d doesn't support Platform Timers.\n",
> +			table->revision);

pr_warn() would be good.

Thanks
Hanjun
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdo=
g" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
