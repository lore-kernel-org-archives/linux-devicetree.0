From: Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH 1/3 v3] drivers: hwspinlock: add CSR atlas7 implementation
Date: Tue, 26 May 2015 12:03:39 -0500
Message-ID: <5564A76B.7090204@ti.com>
References: <1432017698-23725-1-git-send-email-21cnbao@gmail.com> <555FB2F2.7080109@ti.com> <CAGsJ_4xthM+G2b+Zw_xu062bcXQohC6RHvP5DsNnwH5aihW1dA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGsJ_4xthM+G2b+Zw_xu062bcXQohC6RHvP5DsNnwH5aihW1dA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Barry Song <21cnbao@gmail.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, DL-SHA-WorkGroupLinux <workgroup.linux@csr.com>, Wei Chen <wei.chen@csr.com>, Bjorn Andersson <bjorn@kryo.se>, Barry Song <Baohua.Song@csr.com>
List-Id: devicetree@vger.kernel.org

On 05/25/2015 12:37 AM, Barry Song wrote:
> 2015-05-23 6:51 GMT+08:00 Suman Anna <s-anna@ti.com>:
>> Hi Barry,
>>
>> On 05/19/2015 01:41 AM, Barry Song wrote:
>>> From: Wei Chen <wei.chen@csr.com>
>>>
>>> Add hwspinlock support for the CSR atlas7 SoC.
>>>
>>> The Hardware Spinlock device on atlas7 provides hardware assistance
>>> for synchronization between the multiple processors in the system
>>> (dual Cortex-A7, CAN bus Cortex-M3 and audio DSP).
>>>
>>> Cc: Suman Anna <s-anna@ti.com>
>>> Cc: Bjorn Andersson <bjorn@kryo.se>
>>> Signed-off-by: Wei Chen <wei.chen@csr.com>
>>> Signed-off-by: Barry Song <Baohua.Song@csr.com>
>>> ---
>>>  -v3:
>>>  use #hwlock-cells and general hwspinlock dt-binding;
>>>  drop relax();
>>>  drop num-spinlocks in dts;
>>>  re-order Kconfig and Makefile;
>>>  other codingstyle issues.
>>>  Thanks Suman, Bjorn and Ohad
>>>
>>>  drivers/hwspinlock/Kconfig           |  12 ++++
>>>  drivers/hwspinlock/Makefile          |   1 +
>>>  drivers/hwspinlock/sirf_hwspinlock.c | 135 +++++++++++++++++++++++++++++++++++
>>>  3 files changed, 148 insertions(+)
>>>  create mode 100644 drivers/hwspinlock/sirf_hwspinlock.c
>>>
>>> diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
>>> index b5b4f52..73a4016 100644
>>> --- a/drivers/hwspinlock/Kconfig
>>> +++ b/drivers/hwspinlock/Kconfig
>>> @@ -30,6 +30,18 @@ config HWSPINLOCK_QCOM
>>>
>>>         If unsure, say N.
>>>
>>> +config HWSPINLOCK_SIRF
>>> +     tristate "SIRF Hardware Spinlock device"
>>> +     depends on ARCH_SIRF
>>> +     select HWSPINLOCK
>>> +     help
>>> +       Say y here to support the SIRF Hardware Spinlock device, which
>>> +       provides a synchronisation mechanism for the various processors
>>> +       on the SoC.
>>> +
>>> +       It's safe to say n here if you're not interested in SIRF hardware
>>> +       spinlock or just want a bare minimum kernel.
>>> +
>>>  config HSEM_U8500
>>>       tristate "STE Hardware Semaphore functionality"
>>>       depends on ARCH_U8500
>>> diff --git a/drivers/hwspinlock/Makefile b/drivers/hwspinlock/Makefile
>>> index 68f95d9..6b59cb5a 100644
>>> --- a/drivers/hwspinlock/Makefile
>>> +++ b/drivers/hwspinlock/Makefile
>>> @@ -5,4 +5,5 @@
>>>  obj-$(CONFIG_HWSPINLOCK)             += hwspinlock_core.o
>>>  obj-$(CONFIG_HWSPINLOCK_OMAP)                += omap_hwspinlock.o
>>>  obj-$(CONFIG_HWSPINLOCK_QCOM)                += qcom_hwspinlock.o
>>> +obj-$(CONFIG_HWSPINLOCK_SIRF)                += sirf_hwspinlock.o
>>>  obj-$(CONFIG_HSEM_U8500)             += u8500_hsem.o
>>> diff --git a/drivers/hwspinlock/sirf_hwspinlock.c b/drivers/hwspinlock/sirf_hwspinlock.c
>>> new file mode 100644
>>> index 0000000..e7e5ba6
>>> --- /dev/null
>>> +++ b/drivers/hwspinlock/sirf_hwspinlock.c
>>> @@ -0,0 +1,135 @@
>>> +/*
>>> + * SIRF hardware spinlock driver
>>> + *
>>> + * Copyright (c) 2014 Cambridge Silicon Radio Limited, a CSR plc group company.
>>
>> Not sure on this, but 2015 is here and now..
>>
>>> + *
>>> + * Licensed under GPLv2.
>>> + */
>>> +
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/device.h>
>>> +#include <linux/io.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/spinlock.h>
>>> +#include <linux/hwspinlock.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_address.h>
>>> +
>>> +#include "hwspinlock_internal.h"
>>> +
>>> +struct sirf_hwspinlock {
>>> +     void __iomem *io_base;
>>> +     struct hwspinlock_device bank;
>>> +};
>>> +
>>> +/* Number of Hardware Spinlocks*/
>>> +#define      HW_SPINLOCK_NUMBER      30
>>> +
>>> +/* Hardware spinlock register offsets */
>>> +#define HW_SPINLOCK_BASE     0x404
>>> +#define HW_SPINLOCK_OFFSET(x)        (HW_SPINLOCK_BASE + 0x4 * (x))
>>> +
>>> +static int sirf_hwspinlock_trylock(struct hwspinlock *lock)
>>> +{
>>> +     void __iomem *lock_addr = lock->priv;
>>> +
>>> +     /* attempt to acquire the lock by reading value == 1 from it */
>>> +     return !!readl(lock_addr);
>>> +}
>>> +
>>> +static void sirf_hwspinlock_unlock(struct hwspinlock *lock)
>>> +{
>>> +     void __iomem *lock_addr = lock->priv;
>>> +
>>> +     /* release the lock by writing 0 to it */
>>> +     writel(0, lock_addr);
>>> +}
>>> +
>>> +static const struct hwspinlock_ops sirf_hwspinlock_ops = {
>>> +     .trylock = sirf_hwspinlock_trylock,
>>> +     .unlock = sirf_hwspinlock_unlock,
>>> +};
>>> +
>>> +static int sirf_hwspinlock_probe(struct platform_device *pdev)
>>> +{
>>> +     struct sirf_hwspinlock *hwspin;
>>> +     struct hwspinlock *hwlock;
>>> +     int idx, ret;
>>> +
>>> +     if (!pdev->dev.of_node)
>>> +             return -ENODEV;
>>> +
>>> +     hwspin = devm_kzalloc(&pdev->dev, sizeof(*hwspin) +
>>> +                     sizeof(*hwlock) * HW_SPINLOCK_NUMBER, GFP_KERNEL);
>>> +     if (!hwspin)
>>> +             return -ENOMEM;
>>> +
>>> +     /* retrieve io base */
>>> +     hwspin->io_base = of_iomap(pdev->dev.of_node, 0);
>>> +     if (!hwspin->io_base)
>>> +             ret = -ENOMEM;
>>
>> You are missing the bail out here.
> 
> real. it should be "return -ENOMEM"
> 
>>
>>> +
>>> +     for (idx = 0; idx < HW_SPINLOCK_NUMBER; idx++) {
>>> +             hwlock = &hwspin->bank.lock[idx];
>>> +             hwlock->priv = hwspin->io_base + HW_SPINLOCK_OFFSET(idx);
>>> +     }
>>> +
>>> +     platform_set_drvdata(pdev, hwspin);
>>> +
>>> +     pm_runtime_enable(&pdev->dev);
>>> +
>>> +     ret = hwspin_lock_register(&hwspin->bank, &pdev->dev,
>>> +                             &sirf_hwspinlock_ops, 0, HW_SPINLOCK_NUMBER);
>>
>> this is a checkpatch warning with the --strict option, not sure what
>> convention Ohad is following though. Rest looks good.
> 
> do you mean this CHECK?
> 
> CHECK: Alignment should match open parenthesis
> #87: FILE: drivers/hwspinlock/sirf_hwspinlock.c:87:
> + ret = hwspin_lock_register(&hwspin->bank, &pdev->dev,
> + &sirf_hwspinlock_ops, 0, HW_SPINLOCK_NUMBER);

Yes.

regards
Suman
