From: Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH V1 3/9] clk: sprd: add gate clock support
Date: Thu, 22 Jun 2017 18:16:39 +0800
Message-ID: <CAAfSe-sbJxEA0OdC9u3A4p5Q7hrfqkiHscvsuT_irOHp98G+aQ@mail.gmail.com>
References: <20170618015855.27738-1-chunyan.zhang@spreadtrum.com>
 <20170618015855.27738-4-chunyan.zhang@spreadtrum.com> <20170620013130.GI4493@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170620013130.GI4493@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Chunyan Zhang <chunyan.zhang@spreadtrum.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>, Orson Zhai <orson.zhai@spreadtrum.com>, Geng Ren <geng.ren@spreadtrum.com>, Ben Li <ben.li@spreadtrum.com>
List-Id: devicetree@vger.kernel.org

On 20 June 2017 at 09:31, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 06/18, Chunyan Zhang wrote:
>> diff --git a/drivers/clk/sprd/Makefile b/drivers/clk/sprd/Makefile
>> index 8f802b2..333e2b2 100644
>> --- a/drivers/clk/sprd/Makefile
>> +++ b/drivers/clk/sprd/Makefile
>> @@ -1,3 +1,3 @@
>>  ifneq ($(CONFIG_OF),)
>> -obj-y        += ccu_common.o
>> +obj-y        += ccu_common.o ccu_gate.o
>
> Can this be built as a module?

Since most of all Spreadtrum device drivers would depend on if clocks
have been initialized, so we'd prefer to build this into the kernel
image.

>
>>  endif
>> diff --git a/drivers/clk/sprd/ccu_gate.c b/drivers/clk/sprd/ccu_gate.c
>> new file mode 100644
>> index 0000000..3d27615
>> --- /dev/null
>> +++ b/drivers/clk/sprd/ccu_gate.c
>> @@ -0,0 +1,102 @@
>> +/*
>> + * Spreadtrum gate clock driver
>> + *
>> + * Copyright (C) 2017 Spreadtrum, Inc.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +
>> +#include "ccu_gate.h"
>> +
>> +DEFINE_SPINLOCK(gate_lock);
>
> This variable name is not very unique for debugging lockdep
> reports. Probably needs 'sprd' in the name.

Ok.

Thank you for your comments,
Chunyan

>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
