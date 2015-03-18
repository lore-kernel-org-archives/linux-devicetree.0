From: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] drivers: hwspinlock: add CSR atlas7 implementation
Date: Wed, 18 Mar 2015 16:18:04 +0800
Message-ID: <CAGsJ_4zP+SsHqqAYDZ=GujeyFpdnH-mOSysCR8jV=MAMn3kO6w@mail.gmail.com>
References: <1425881514-4806-1-git-send-email-21cnbao@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425881514-4806-1-git-send-email-21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: DL-SHA-WorkGroupLinux <workgroup.linux-kQvG35nSl+M@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Wei Chen <wei.chen-kQvG35nSl+M@public.gmane.org>, Barry Song <Baohua.Song-kQvG35nSl+M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2015-03-09 14:11 GMT+08:00 Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> From: Wei Chen <wei.chen-kQvG35nSl+M@public.gmane.org>
>
> Add hwspinlock support for the CSR atlas7 SoC.
>
> The Hardware Spinlock device on atlas7 provides hardware assistance
> for synchronization between the multiple processors in the system
> (dual Cortex-A7, CAN bus Cortex-M3 and audio DSP).
>
> Signed-off-by: Wei Chen <wei.chen-kQvG35nSl+M@public.gmane.org>
> Signed-off-by: Barry Song <Baohua.Song-kQvG35nSl+M@public.gmane.org>

Hi Rob, Pawel, Mark, Ian, Kumar,

would you kindly review the device tree part?  as Ohad's feedback,  we
need an ACK for the DT part so that he can push it to Linus.

-barry

> ---
>  .../bindings/hwspinlock/sirf,hwspinlock.txt        |  18 +++
>  drivers/hwspinlock/Kconfig                         |  12 ++
>  drivers/hwspinlock/Makefile                        |   1 +
>  drivers/hwspinlock/sirf_hwspinlock.c               | 151 +++++++++++++++++++++
>  4 files changed, 182 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwspinlock/sirf,hwspinlock.txt
>  create mode 100644 drivers/hwspinlock/sirf_hwspinlock.c
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
> +
> +Example:
> +       hwspinlock {
> +               compatible = "sirf,hwspinlock";
> +               reg = <0x13240000 0x00010000>;
> +
> +               num-spinlocks = <30>;
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
> +       tristate "SIRF Hardware Spinlock device"
> +       depends on ARCH_SIRF
> +       select HWSPINLOCK
> +       help
> +         Say y here to support the SIRF Hardware Spinlock device, which
> +         provides a synchronisation mechanism for the various processor
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
> +       if (ret) {
> +               dev_err(&pdev->dev,
> +                       "Unable to find hwspinlock number. ret=%d\n", ret);
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
> +MODULE_AUTHOR("Wei Chen <wei.chen-kQvG35nSl+M@public.gmane.org>");
> --
> 2.3.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
