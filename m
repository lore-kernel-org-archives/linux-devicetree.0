From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH]  arm64/pvpanic-mmio : add pvpanic mmio device
Date: Wed, 17 Oct 2018 12:38:16 +0100
Message-ID: <20181017113816.6kub42pii5hev6fh@lakrids.cambridge.arm.com>
References: <1539770903-18531-1-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1539770903-18531-1-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Hao <peng.hao2@zte.com.cn>
Cc: catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nd@arm.com
List-Id: devicetree@vger.kernel.org

Hi,

[adding devicetree]

On Wed, Oct 17, 2018 at 06:08:23PM +0800, Peng Hao wrote:
> Add a platform device driver, pvpanic-mmio that is similar
> to x86's pvpanic device.

It would be worth noting in the commit message that this is a
QEMU-specific device.

Is this already in upstream QEMU?

> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  drivers/platform/Kconfig            |   3 +
>  drivers/platform/Makefile           |   1 +
>  drivers/platform/arm/Kconfig        |   6 ++
>  drivers/platform/arm/Makefile       |   6 ++
>  drivers/platform/arm/pvpanic-mmio.c | 123 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 139 insertions(+)
>  create mode 100644 drivers/platform/arm/Kconfig
>  create mode 100644 drivers/platform/arm/Makefile
>  create mode 100644 drivers/platform/arm/pvpanic-mmio.c

If this is an MMIO device, why does this need to be specific to arm?

Surely *any* architecture could use this?

> 
> diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
> index d4c2e42..8b64b78 100644
> --- a/drivers/platform/Kconfig
> +++ b/drivers/platform/Kconfig
> @@ -1,3 +1,6 @@
> +if ARM64
> +source "drivers/platform/arm/Kconfig"
> +endif
>  if X86
>  source "drivers/platform/x86/Kconfig"
>  endif
> diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
> index 4b2ce58..232231c 100644
> --- a/drivers/platform/Makefile
> +++ b/drivers/platform/Makefile
> @@ -3,6 +3,7 @@
>  # Makefile for linux/drivers/platform
>  #
>  
> +obj-$(CONFIG_ARM64)               += arm/
>  obj-$(CONFIG_X86)		+= x86/
>  obj-$(CONFIG_MELLANOX_PLATFORM)	+= mellanox/
>  obj-$(CONFIG_MIPS)		+= mips/
> diff --git a/drivers/platform/arm/Kconfig b/drivers/platform/arm/Kconfig
> new file mode 100644
> index 0000000..89fd694
> --- /dev/null
> +++ b/drivers/platform/arm/Kconfig
> @@ -0,0 +1,6 @@
> +config PVPANIC_MMIO
> +        tristate "pvpanic mmio device support"
> +        help
> +          This driver provides support for the pvpanic mmio device. pvpanic mmio
> +          is a paravirtualized device provided by QEMU; it lets a virtual machine
> +          (guest) communicate panic events to the host.
> diff --git a/drivers/platform/arm/Makefile b/drivers/platform/arm/Makefile
> new file mode 100644
> index 0000000..a68af01
> --- /dev/null
> +++ b/drivers/platform/arm/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for linux/drivers/platform/arm
> +# arm Platform-Specific Drivers
> +#
> +obj-$(CONFIG_PVPANIC_MMIO) = pvpanic-mmio.o
> diff --git a/drivers/platform/arm/pvpanic-mmio.c b/drivers/platform/arm/pvpanic-mmio.c
> new file mode 100644
> index 0000000..6a06d24
> --- /dev/null
> +++ b/drivers/platform/arm/pvpanic-mmio.c
> @@ -0,0 +1,123 @@
> +/*
> + * pvpanic mmio device driver
> + *
> + * Copyright (C) 2018 ZTE Ltd.
> + * Author: Peng Hao <peng.hao2@zte.com.cn>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/types.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <asm/virt.h>
> +#include <linux/platform_device.h>
> +
> +#define PVPANIC_MMIO_CRASHED	(1 << 0)

This looks like it's identical to PVPANIC_PANICKED in the existing ACPI
IO pvpanic driver.

I suspect on the QEMU side, there's one device, and the distinction is
only in how this is described.

Can't one driver support both?

> +
> +struct pvpanic_mmio_device {
> +	void __iomem *base;
> +};
> +
> +static struct pvpanic_mmio_device pvpanic_mmio_dev;
> +
> +static void
> +pvpanic_mmio_trigger_event(unsigned int event)
> +{
> +	writeb(event, pvpanic_mmio_dev.base);
> +}
> +
> +static int
> +pvpanic_mmio_crash_notify(struct notifier_block *nb, unsigned long code,
> +			void *unused)
> +{
> +	pvpanic_mmio_trigger_event(PVPANIC_MMIO_CRASHED);
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block pvpanic_mmio_crash_nb = {
> +	.notifier_call = pvpanic_mmio_crash_notify,
> +	.priority = 1,
> +};
> +
> +static int pvpanic_mmio_probe(struct platform_device *pdev)
> +{
> +	struct resource *mem;
> +
> +	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!mem)
> +		return -EINVAL;
> +
> +	if (!devm_request_mem_region(&pdev->dev, mem->start,
> +				resource_size(mem), pdev->name))
> +		return -EBUSY;
> +
> +	pvpanic_mmio_dev.base = devm_ioremap(&pdev->dev, mem->start,
> +										resource_size(mem));
> +	if (pvpanic_mmio_dev.base == NULL)
> +		return -EFAULT;
> +
> +	platform_set_drvdata(pdev, &pvpanic_mmio_dev);
> +
> +	atomic_notifier_chain_register(&panic_notifier_list,
> +								  &pvpanic_mmio_crash_nb);
> +
> +	return 0;
> +}
> +
> +
> +static int pvpanic_mmio_remove(struct platform_device *pdev)
> +{
> +
> +	atomic_notifier_chain_unregister(&panic_notifier_list,
> +					&pvpanic_mmio_crash_nb);
> +	devm_kfree(&pdev->dev, &pvpanic_mmio_dev);
> +	return 0;
> +}
> +
> +static const struct of_device_id pvpanic_mmio_match[] = {
> +	{ .compatible = "pvpanic,mmio", },
> +	{},
> +};

This should be "qemu,pvpanic-mmio"; "pvpanic" is not the vendor.

This should also have a binding document somewhere.

Thanks,
Mark.

> +MODULE_DEVICE_TABLE(of, pvpanic_mmio_match);
> +
> +static struct platform_driver pvpanic_mmio_driver = {
> +	.probe =        pvpanic_mmio_probe,
> +	.remove =       pvpanic_mmio_remove,
> +	.driver = {
> +		.name =	"pvpanic-mmio",
> +		.of_match_table = pvpanic_mmio_match,
> +	},
> +};
> +
> +static int __init pvpanic_mmio_init(void)
> +{
> +	return platform_driver_register(&pvpanic_mmio_driver);
> +}
> +
> +static void __exit pvpanic_mmio_exit(void)
> +{
> +	platform_driver_unregister(&pvpanic_mmio_driver);
> +}
> +
> +module_init(pvpanic_mmio_init);
> +module_exit(pvpanic_mmio_exit);
> +
> +MODULE_AUTHOR("Peng Hao<peng.hao2@zte.com.cn>");
> +MODULE_DESCRIPTION("pvpanic mmio device driver");
> +MODULE_LICENSE("GPL");
> -- 
> 1.8.3.1
> 
