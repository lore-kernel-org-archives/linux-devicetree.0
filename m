From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH v1 10/12] hikey960: Support usb functionality of Hikey960
Date: Tue, 4 Dec 2018 09:40:45 +0800
Message-ID: <6810012e-9a77-dfdf-a738-14ce77a3027a@huawei.com>
References: <20181203034515.91412-1-chenyu56@huawei.com>
 <20181203034515.91412-11-chenyu56@huawei.com>
 <CAHp75VdSowHk4meQqqUamSjJJoVT59+pMZ1qjmmWd-W5nWBcUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdSowHk4meQqqUamSjJJoVT59+pMZ1qjmmWd-W5nWBcUw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: wangbinghui@hisilicon.com, USB <linux-usb@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Stultz <john.stultz@linaro.org>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 2018/12/3 17:23, Andy Shevchenko wrote:
> On Mon, Dec 3, 2018 at 5:47 AM Yu Chen <chenyu56@huawei.com> wrote:
>>
>> This driver handles usb hub power on and typeC port event of HiKey960 board:
>> 1)DP&DM switching between usb hub and typeC port base on typeC port
>> state
>> 2)Control power of usb hub on Hikey960
>> 3)Control vbus of typeC port
> 
>> +config HISI_HIKEY_USB
>> +       tristate "USB functionality of HiSilicon Hikey Platform"
>> +       depends on GPIOLIB
> 
>> +       default n
> 
> No, Linus is not happy about this.
> Default n _is_ a default.

OK.
> 
>> +       help
>> +         If you say yes here you get support for usb functionality of HiSilicon Hikey Platform.
> 
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * hisi_hikey_usb.c
>> + *
>> + * Copyright (c) Hisilicon Tech. Co., Ltd. All rights reserved.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + */
> 
> Same comments to the above lines.
> 
>> +#include <linux/module.h>
>> +#include <linux/kernel.h>
>> +#include <linux/slab.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/of.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/usb/role.h>
>> +#include <linux/notifier.h>
> 
> Order?
> 
>> +       pr_debug("%s: set hub power %d\n", __func__, value);
> 
> Noise.
> 
>> +       pr_debug("%s: switch to %s\n", __func__, switch_to_str);
> 
> Noise.
> 
>> +       pr_debug("%s: set typec vbus gpio to %d\n", __func__, value);
> 
> Noise.
> 
>> +       if (!nb)
>> +               return -EINVAL;
> 
> On which conditions this happen?
> 
>> +       pr_info("%s:set typec state to %lu\n", __func__, state);
> 
> Noise!
> 
> Guys, you perhaps can read about tracepoints and function tracer
> facilities in the kernel.
> 
>> +static int hisi_hikey_usb_probe(struct platform_device *pdev)
>> +{
> 
>> +               pr_info("%s: typc_vbus_enable_val can't get\n", __func__);
> 
> Noise!

OK.
> 
>> +       if (IS_ERR_OR_NULL(hisi_hikey_usb->typec_vbus)) {
> 
> So, this check is redundant. You are repeating it below.
> 
>> +               if (!hisi_hikey_usb->typec_vbus)
>> +                       ret = -EINVAL;
>> +               else
>> +                       ret = PTR_ERR(hisi_hikey_usb->typec_vbus);
>> +               return ret;
>> +       }
OK.

> 
>> +       if (IS_ERR_OR_NULL(hisi_hikey_usb->role_sw)) {
> 
>> +               pr_err("%s: usb_role_switch_get failed\n", __func__);
> 
> Noise and same comment to the conditional check as above
> 
>> +               if (!hisi_hikey_usb->role_sw)
>> +                       ret = -ENOENT;
>> +               else
>> +                       ret = PTR_ERR(hisi_hikey_usb->role_sw);
>> +               return ret;
>> +       }
> 
>> +               .of_match_table = of_match_ptr(id_table_hisi_hikey_usb),
> 
> Does it compiles for non-OF case? Why macro is in use?
> 
OK. I will add the "CONFIG_OF".
