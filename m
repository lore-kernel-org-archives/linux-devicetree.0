From: Hanjun Guo <hanjun.guo@linaro.org>
Subject: Re: [PATCH v3 6/6] ACPI: import watchdog info of GTDT into platform
 device
Date: Tue, 26 May 2015 16:28:24 +0800
Message-ID: <55642EA8.5000003@linaro.org>
References: <=fu.wei@linaro.org> <1432548193-19569-1-git-send-email-fu.wei@linaro.org> <1432548193-19569-7-git-send-email-fu.wei@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432548193-19569-7-git-send-email-fu.wei@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: fu.wei@linaro.org, Suravee.Suthikulpanit@amd.com, linaro-acpi@lists.linaro.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: tekkamanninja@gmail.com, graeme.gregory@linaro.org, al.stone@linaro.org, timur@codeaurora.org, ashwin.chaugule@linaro.org, arnd@arndb.de, linux@roeck-us.net, vgandhi@codeaurora.org, wim@iguana.be, jcm@redhat.com, leo.duran@amd.com, corbet@lwn.net, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
List-Id: devicetree@vger.kernel.org

Hi Fu Wei,

Some minor comments inline.

On 2015=E5=B9=B405=E6=9C=8825=E6=97=A5 18:03, fu.wei@linaro.org wrote:
> From: Fu Wei <fu.wei@linaro.org>
>
> Parse SBSA Generic Watchdog Structure in GTDT table of ACPI,
> and create a platform device with that information.
> This platform device can be used by the ARM SBSA Generic
> Watchdog driver.
>
> Tested-by: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
> Tested-by: Timur Tabi <timur@codeaurora.org>
> Signed-off-by: Fu Wei <fu.wei@linaro.org>
> ---
>   arch/arm64/kernel/acpi.c | 145 ++++++++++++++++++++++++++++++++++++=
+++++++++++
>   1 file changed, 145 insertions(+)
>
> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> index 8b83955..c95deec 100644
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
> @@ -343,3 +344,147 @@ void __init acpi_gic_init(void)
>
>   	early_acpi_os_unmap_memory((char *)table, tbl_size);
>   }

please add

#ifdef CONFIG_ARM_SBSA_WATCHDOG
(acpi gtdt code)
#endif

> +
> +static int __init acpi_gtdt_import_sbsa_gwdt(struct acpi_gtdt_watchd=
og *wd,
> +					     int index)
> +{
> +	struct platform_device *pdev;
> +	struct resource *res;
> +	u32 gsi, flags;
> +	int irq, trigger, polarity;
> +	resource_size_t rf_base_phy, cf_base_phy;
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
> +	pr_debug("GTDT: a Watchdog GT structure(0x%llx/0x%llx gsi:%u flags:=
0x%x)\n",
> +		 rf_base_phy, cf_base_phy, gsi, flags);
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
> +	irq =3D acpi_register_gsi(NULL, gsi, trigger, polarity);
> +	if (irq < 0) {
> +		pr_err("GTDT: failed to register GSI of the Watchdog GT.\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Add a platform device named "sbsa-gwdt" to match the platform dr=
iver.
> +	 * "sbsa-gwdt": SBSA(Server Base System Architecture) Generic Watch=
dog
> +	 * The platform driver can get device info below by matching this n=
ame.

* The platform driver (drivers/watchdog/sbsa_gwdt.c) can get device inf=
o=20
below by matching this name.

Adding the file name which will help for review and maintain in my
opinion.

> +	 */
> +	pdev =3D platform_device_alloc("sbsa-gwdt", index);
> +	if (!pdev)
> +		goto err_unregister_gsi;
> +
> +	res =3D kcalloc(3, sizeof(*res), GFP_KERNEL);
> +	if (!res)
> +		goto err_device_put;
> +
> +	/*
> +	 * According to SBSA specification the size of refresh and control
> +	 * frames of SBSA Generic Watchdog is SZ_4K(Offset 0x000 =E2=80=93 =
0xFFF).
> +	 */
> +	res[0].start =3D rf_base_phy;
> +	res[0].end =3D rf_base_phy + SZ_4K - 1;
> +	res[0].name =3D "refresh";
> +	res[0].flags =3D IORESOURCE_MEM;
> +
> +	res[1].start =3D cf_base_phy;
> +	res[1].end =3D cf_base_phy + SZ_4K - 1;
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

=2E..

> +	if (err)
> +		goto err_free_res;
> +
> +	return 0;

How about

if (!err)
	return 0;

then no need for goto err_free_res and save two lines of codes.

Other than that,

Acked-by: Hanjun Guo <hanjun.guo@linaro.org>

Thanks
Hanjun
