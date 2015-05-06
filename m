From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH v2 RESEND] drivers: hwspinlock: add CSR atlas7 implementation
Date: Wed, 6 May 2015 11:13:43 -0700
Message-ID: <CAJAp7Ogf9fPTL=bsXUG1UY9tC7yf8NRpi5H3CSx34bLWrJmicg@mail.gmail.com>
References: <1427324585-3936-1-git-send-email-21cnbao@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427324585-3936-1-git-send-email-21cnbao@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Barry Song <21cnbao@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Wei Chen <wei.chen@csr.com>, Barry Song <Baohua.Song@csr.com>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 25, 2015 at 4:03 PM, Barry Song <21cnbao@gmail.com> wrote:
> From: Wei Chen <wei.chen@csr.com>
>
> Add hwspinlock support for the CSR atlas7 SoC.
>
[..]
>
> diff --git a/Documentation/devicetree/bindings/hwspinlock/sirf,hwspinlock.txt b/Documentation/devicetree/bindings/hwspinlock/sirf,hwspinlock.txt
> new file mode 100644
> index 0000000..b22c492
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwspinlock/sirf,hwspinlock.txt
> @@ -0,0 +1,18 @@
> +SIRF Hardware spinlock device Binding
> +-----------------------------------------------
> +
> +Required properties :
> +- compatible : shall contain only one of the following:
> +       "sirf,hwspinlock"
> +
> +- reg : the register address of hwspinlock
> +
> +- num-spinlocks : how many spinlocks this device provides

Why is number of spinlocks dynamic?

If you need to keep this it should have the "sirf," prefix.


You should either make a reference to the hwlock.txt pointing out the required
"#hwlock-cells" property, or simply include it here.

> +
> +Example:
> +       hwspinlock {
> +               compatible = "sirf,hwspinlock";
> +               reg = <0x13240000 0x00010000>;
> +
> +               num-spinlocks = <30>;

Does the hardware really have 30 locks?


The reason for my question is that we had a similar discussion regarding
this property for the Qualcomm driver, in which I ended up dropping the
property because I wanted the dt binding to describe the actual hardware
and not the limited amount stated in some software design document.


The example is missing #hwlock-cells = <1>;

> +       };
> diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
> index 3612cb5..fc400e4 100644
> --- a/drivers/hwspinlock/Kconfig
> +++ b/drivers/hwspinlock/Kconfig
> @@ -29,4 +29,16 @@ config HSEM_U8500
>
>           If unsure, say N.
>
> +config HWSPINLOCK_SIRF

I would appreciate if you put this above HSEM_U8500 to keep the list
somewhat sorted.

> +       tristate "SIRF Hardware Spinlock device"
> +       depends on ARCH_SIRF
> +       select HWSPINLOCK
> +       help
> +         Say y here to support the SIRF Hardware Spinlock device, which
> +         provides a synchronisation mechanism for the various processor

s/processor/processors

> +         on the SoC.
> +
> +         It's safe to say n here if you're not interested in SIRF hardware
> +         spinlock or just want a bare minimum kernel.
> +
>  endmenu
> diff --git a/drivers/hwspinlock/Makefile b/drivers/hwspinlock/Makefile
> index 93eb64b..472b82d 100644
> --- a/drivers/hwspinlock/Makefile
> +++ b/drivers/hwspinlock/Makefile
> @@ -5,3 +5,4 @@
>  obj-$(CONFIG_HWSPINLOCK)               += hwspinlock_core.o
>  obj-$(CONFIG_HWSPINLOCK_OMAP)          += omap_hwspinlock.o
>  obj-$(CONFIG_HSEM_U8500)               += u8500_hsem.o
> +obj-$(CONFIG_HWSPINLOCK_SIRF)          += sirf_hwspinlock.o

Please keep sort order here as well.

> diff --git a/drivers/hwspinlock/sirf_hwspinlock.c b/drivers/hwspinlock/sirf_hwspinlock.c
> new file mode 100644
> index 0000000..b68722a
> --- /dev/null
> +++ b/drivers/hwspinlock/sirf_hwspinlock.c
> @@ -0,0 +1,151 @@
> +/*
> + * SIRF hardware spinlock driver
> + *
> + * Copyright (c) 2014 Cambridge Silicon Radio Limited, a CSR plc group company.
> + *
> + * Licensed under GPLv2.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/device.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/bitops.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/hwspinlock.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +
> +#include "hwspinlock_internal.h"
> +
> +struct sirf_hwspinlock {
> +       void __iomem *io_base;
> +       struct hwspinlock_device bank;
> +};
> +
> +/* Hardware spinlock register offsets */
> +#define HW_SPINLOCK_RD_DEBUG   0x400
> +#define HW_SPINLOCK_BASE       0x404
> +#define HW_SPINLOCK_OFFSET(x)  (HW_SPINLOCK_BASE + 0x4 * (x))
> +
> +/* Possible values of HW_SPINLOCK_REG */
> +#define HW_SPINLOCK_LOCKED     0
> +#define HW_SPINLOCK_FREE       1
> +
> +static int sirf_hwspinlock_trylock(struct hwspinlock *lock)
> +{
> +       void __iomem *lock_addr = lock->priv;
> +
> +       /* attempt to acquire the lock by reading its value */
> +       return (HW_SPINLOCK_FREE == readl(lock_addr));
> +}
> +
> +static void sirf_hwspinlock_unlock(struct hwspinlock *lock)
> +{
> +       void __iomem *lock_addr = lock->priv;
> +
> +       /* release the lock by writing 0 to it */
> +       writel(HW_SPINLOCK_LOCKED, lock_addr);

This looks really wierd, but I assume the naming of the value is in line
with hardware documentation(?)


Instead of having the somewhat confusing names you could replace the
constants with just:
  return !!readl(lock_addr);
and
  writel(0, lock_addr);

If nothing else because you have the comments there as well...

> +}
> +
> +static void sirf_hwspinlock_relax(struct hwspinlock *lock)
> +{
> +       ndelay(50);
> +}
> +
> +static const struct hwspinlock_ops sirf_hwspinlock_ops = {
> +       .trylock = sirf_hwspinlock_trylock,
> +       .unlock = sirf_hwspinlock_unlock,
> +       .relax = sirf_hwspinlock_relax,
> +};
> +
> +static int sirf_hwspinlock_probe(struct platform_device *pdev)
> +{
> +       struct sirf_hwspinlock *hwspin;
> +       struct hwspinlock *hwlock;
> +       u32 num_of_locks;
> +       int idx, ret;
> +
> +       ret = of_property_read_u32(pdev->dev.of_node,
> +                       "num-spinlocks", &num_of_locks);

As above; if you need this the property should have a "sirf," prefix.

> +       if (ret) {
> +               dev_err(&pdev->dev,
> +                       "Unable to find hwspinlock number. ret=%d\n", ret);

No need to print the error code here.

> +               return -ENODEV;
> +       }
> +
> +       hwspin = devm_kzalloc(&pdev->dev, sizeof(*hwspin) +
> +                       sizeof(*hwlock) * num_of_locks, GFP_KERNEL);
> +       if (!hwspin)
> +               return -ENOMEM;
> +
> +       /* retrieve io base */
> +       hwspin->io_base = of_iomap(pdev->dev.of_node, 0);
> +       if (!hwspin->io_base)
> +               ret = -ENOMEM;

By using something like the following you can use devres for the ioremap.

res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
hwspin->io_base = devm_ioremap_resource(&pdev->dev, res);
if (IS_ERR(hwspin->io_base))
return PTR_ERR(hwspin->io_base);

> +
> +       for (idx = 0; idx < num_of_locks; idx++) {
> +               hwlock = &hwspin->bank.lock[idx];
> +               hwlock->priv = hwspin->io_base + HW_SPINLOCK_OFFSET(idx);
> +       }
> +
> +       platform_set_drvdata(pdev, hwspin);
> +
> +       pm_runtime_enable(&pdev->dev);
> +
> +       ret = hwspin_lock_register(&hwspin->bank, &pdev->dev,
> +                               &sirf_hwspinlock_ops, 0, num_of_locks);
> +       if (ret)
> +               goto reg_failed;
> +
> +       return 0;
> +
> +reg_failed:
> +       pm_runtime_disable(&pdev->dev);
> +       iounmap(hwspin->io_base);
> +
> +       return ret;
> +}
> +
> +static int sirf_hwspinlock_remove(struct platform_device *pdev)
> +{
> +       struct sirf_hwspinlock *hwspin = platform_get_drvdata(pdev);
> +       int ret;
> +
> +       ret = hwspin_lock_unregister(&hwspin->bank);
> +       if (ret) {
> +               dev_err(&pdev->dev, "%s failed: %d\n", __func__, ret);
> +               return ret;

Even if you return an error here the device will still be torn down.

> +       }
> +
> +       pm_runtime_disable(&pdev->dev);
> +
> +       iounmap(hwspin->io_base);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id sirf_hwpinlock_ids[] = {
> +       { .compatible = "sirf,hwspinlock", },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, sirf_hwpinlock_ids);
> +
> +static struct platform_driver sirf_hwspinlock_driver = {
> +       .probe = sirf_hwspinlock_probe,
> +       .remove = sirf_hwspinlock_remove,
> +       .driver = {
> +               .name = "atlas7_hwspinlock",
> +               .of_match_table = of_match_ptr(sirf_hwpinlock_ids),
> +       },
> +};
> +
> +module_platform_driver(sirf_hwspinlock_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("SIRF Hardware spinlock driver");
> +MODULE_AUTHOR("Wei Chen <wei.chen@csr.com>");

Part of these details I think the patch looks good.

Regards,
Bjorn
