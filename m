From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 04/12] usb: dwc3: dwc3-hisi: Add code for dwc3 of
 Hisilicon Soc Platform
Date: Mon, 3 Dec 2018 10:12:01 +0200
Message-ID: <CAHp75VcdbJ9KV2Xr9mQsAcODMCJUMXz0OY0t_FSJgZ6dXx2fYQ@mail.gmail.com>
References: <20181203034515.91412-1-chenyu56@huawei.com> <20181203034515.91412-5-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203034515.91412-5-chenyu56@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: chenyu56@huawei.com
Cc: USB <linux-usb@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, John Stultz <john.stultz@linaro.org>, Wangbinghui <wangbinghui@hisilicon.com>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 3, 2018 at 5:48 AM Yu Chen <chenyu56@huawei.com> wrote:
>
> This driver handles the poweron and shutdown of dwc3 core
> on Hisilicon Soc Platform.

> +config USB_DWC3_HISI
> +       tristate "HiSilicon Kirin Platforms"
> +       depends on ((ARCH_HISI && ARM64) || COMPILE_TEST) && OF

It would be easy to read if
depends on OF
would be on a separate line

> +       default USB_DWC3
> +       help
> +         Support USB2/3 functionality in HiSilicon Kirin platforms.
> +         Say 'Y' or 'M' if you have one such device.

> +++ b/drivers/usb/dwc3/dwc3-hisi.c
> @@ -0,0 +1,335 @@
> +// SPDX-License-Identifier: GPL-2.0+

You need to talk to your manager and fix License correspondingly.
Currently there is an ambigous reading.

> +/**

Why /** ?

> + * dwc3-hisi.c - Support for dwc3 platform devices on HiSilicon platforms

Usually put filename in the file is not the best idea.

> + *
> + * Copyright (C) 2017-2018 Hilisicon Electronics Co., Ltd.
> + *             http://www.huawei.com
> + *
> + * Authors: Yu Chen <chenyu56@huawei.com>

> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2  of
> + * the License as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

The idea of SPDX is exactly to remove the above boilerplate text.

> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/extcon.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/pinctrl/consumer.h>

It would be easy to maintain ordered list in the future.

> +                       while (--i >= 0)

while (i--)

> +                       while (--i >= 0)

while (i--)

> +                       while (--i >= 0)

while (i--)

> +                       while (--i >= 0)

while (i--)

> +                       while (--i >= 0)

> +static int dwc3_hisi_probe(struct platform_device *pdev)
> +{
> +       struct dwc3_hisi        *dwc3_hisi;
> +       struct device           *dev = &pdev->dev;
> +       struct device_node      *np = dev->of_node;

> +

Redundant blank line

> +       int                     ret;
> +       int                     i;

> +}

> +#ifdef CONFIG_PM_SLEEP
> +static int dwc3_hisi_suspend(struct device *dev)

Don't know the usual practice here, but you can just use
__maybe_unused and remove this #ifdef.

> +{
> +       struct dwc3_hisi *dwc3_hisi = dev_get_drvdata(dev);
> +       int ret;
> +

> +       dev_info(dev, "%s\n", __func__);

Noise

> +}

> +static int dwc3_hisi_resume(struct device *dev)

__maybe_unused ?

> +{

> +       dev_info(dev, "%s\n", __func__);

Noise.

> +       /* Wait for clock stable */
> +       msleep(100);

Don't you have any hardware notification that clocks are stable?
(Something like PLL locked?)

> +
> +       return 0;
> +}
> +#endif /* CONFIG_PM_SLEEP */

> +static const struct of_device_id dwc3_hisi_match[] = {
> +       { .compatible = "hisilicon,hi3660-dwc3" },
> +       { /* sentinel */ },

No need comma for terminator line.

> +};

-- 
With Best Regards,
Andy Shevchenko
