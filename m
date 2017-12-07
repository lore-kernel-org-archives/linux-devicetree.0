From: Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V6 01/12] drivers: move clock common macros out from
 vendor directories
Date: Thu, 7 Dec 2017 16:08:37 +0800
Message-ID: <CAAfSe-ufFDXTxUxTSW8Au9wdwoHKcB6RBdVdX36RrZQC4x0knw@mail.gmail.com>
References: <20171127100115.20655-1-chunyan.zhang@spreadtrum.com>
 <20171127100115.20655-2-chunyan.zhang@spreadtrum.com> <20171207064723.GV4283@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171207064723.GV4283-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Xiaolong Zhang <xiaolong.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Ben Li <ben.li-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Orson Zhai <orson.zhai-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 7 December 2017 at 14:47, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On 11/27, Chunyan Zhang wrote:
>> These macros are used by more than one SoC vendor platforms, avoid to
>> have many copies of these code, this patch moves them to the common
>> clock directory which every clock drivers can access to.
>>
>> Signed-off-by: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
>> ---
>>  drivers/clk/clk_common.h | 60 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 60 insertions(+)
>>  create mode 100644 drivers/clk/clk_common.h
>>
>> diff --git a/drivers/clk/clk_common.h b/drivers/clk/clk_common.h
>> new file mode 100644
>> index 0000000..21e93d2
>> --- /dev/null
>> +++ b/drivers/clk/clk_common.h
>> @@ -0,0 +1,60 @@
>> +/*
>> + * drivers/clk/clk_common.h
>
> We don't need this in the file too. Please remove this line.
>
>> + *
>> + * SPDX-License-Identifier: GPL-2.0
>> + */
>> +
>> +#ifndef _CLK_COMMON_H_
>> +#define _CLK_COMMON_H_
>> +
>> +#include <linux/clk-provider.h>
>
> Maybe these macros should just go into clk-provider.h?

Ok.  And I will also remove the same macros from sunxi-ng/ccu_common.h
and zte/clk.h.

>
>> +
>> +#define CLK_HW_INIT(_name, _parent, _ops, _flags)            \
>> +     (&(struct clk_init_data) {                              \
>> +             .flags          = _flags,                       \
>> +             .name           = _name,                        \
>> +             .parent_names   = (const char *[]) { _parent }, \
>> +             .num_parents    = 1,                            \
>> +             .ops            = _ops,                         \
>> +     })
>
> Hopefully we don't extend the init structure anymore to have
> something else. I guess we'll do something if that happens.
>
>> +
>> +#define CLK_HW_INIT_PARENTS(_name, _parents, _ops, _flags)   \
>> +     (&(struct clk_init_data) {                              \
>> +             .flags          = _flags,                       \
>> +             .name           = _name,                        \
>> +             .parent_names   = _parents,                     \
>> +             .num_parents    = ARRAY_SIZE(_parents),         \
>> +             .ops            = _ops,                         \
>> +     })
>> +
>> +#define CLK_HW_INIT_NO_PARENT(_name, _ops, _flags)     \
>> +     (&(struct clk_init_data) {                      \
>> +             .flags          = _flags,               \
>> +             .name           = _name,                \
>> +             .parent_names   = NULL,                 \
>> +             .num_parents    = 0,                    \
>> +             .ops            = _ops,                 \
>> +     })
>> +
>> +#define CLK_FIXED_FACTOR(_struct, _name, _parent,                    \
>> +                     _div, _mult, _flags)                            \
>> +     struct clk_fixed_factor _struct = {                             \
>> +             .div            = _div,                                 \
>> +             .mult           = _mult,                                \
>> +             .hw.init        = CLK_HW_INIT(_name,                    \
>> +                                           _parent,                  \
>> +                                           &clk_fixed_factor_ops,    \
>> +                                           _flags),                  \
>> +     }
>> +
>> +#define CLK_FIXED_RATE(_struct, _name, _flags,                               \
>> +                    _fixed_rate, _fixed_accuracy)                    \
>> +     struct clk_fixed_rate _struct = {                               \
>> +             .fixed_rate     = _fixed_rate,                          \
>> +             .fixed_accuracy = _fixed_accuracy,                      \
>> +             .hw.init        = CLK_HW_INIT_NO_PARENT(_name,          \
>> +                                       &clk_fixed_rate_ops,          \
>> +                                                     _flags),        \
>> +     }
>
> Maybe don't add this one? Usually fixed rate clks come from DT.

Ok, will also move the fixed rate clks from our driver to DT.

Thanks,
Chunyan

>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
