From: Julien Thierry <julien.thierry@arm.com>
Subject: Re: [PATCH V3 05/11] clk: sprd: add mux clock support
Date: Thu, 2 Nov 2017 18:22:22 +0000
Message-ID: <ba6366af-ecae-5f8b-f48b-6f93fbe833c0@arm.com>
References: <20171102065626.21835-1-chunyan.zhang@spreadtrum.com>
 <20171102065626.21835-6-chunyan.zhang@spreadtrum.com>
 <532aed43-03bf-ea26-bdc2-d7deb1093f53@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <532aed43-03bf-ea26-bdc2-d7deb1093f53@arm.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Chunyan Zhang <chunyan.zhang@spreadtrum.com>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>, Ben Li <ben.li@spreadtrum.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Orson Zhai <orson.zhai@spreadtrum.com>, Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: devicetree@vger.kernel.org



On 02/11/17 18:11, Julien Thierry wrote:
> Hi,
> 
> On 02/11/17 06:56, Chunyan Zhang wrote:
>> This patch adds clock multiplexor support for Spreadtrum platforms,
>> the mux clocks also can be found in sprd composite clocks, so
>> provides two helpers that can be reused later on.
>>
>> Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
>> ---
>>   drivers/clk/sprd/Makefile |  1 +
>>   drivers/clk/sprd/mux.c    | 89 
>> +++++++++++++++++++++++++++++++++++++++++++++++
>>   drivers/clk/sprd/mux.h    | 65 ++++++++++++++++++++++++++++++++++
>>   3 files changed, 155 insertions(+)
>>   create mode 100644 drivers/clk/sprd/mux.c
>>   create mode 100644 drivers/clk/sprd/mux.h
>>
>> diff --git a/drivers/clk/sprd/Makefile b/drivers/clk/sprd/Makefile
>> index 8cd5592..cee36b5 100644
>> --- a/drivers/clk/sprd/Makefile
>> +++ b/drivers/clk/sprd/Makefile
>> @@ -2,3 +2,4 @@ obj-$(CONFIG_SPRD_COMMON_CLK)    += clk-sprd.o
>>   clk-sprd-y    += common.o
>>   clk-sprd-y    += gate.o
>> +clk-sprd-y    += mux.o
>> diff --git a/drivers/clk/sprd/mux.c b/drivers/clk/sprd/mux.c
>> new file mode 100644
>> index 0000000..5a344e0
>> --- /dev/null
>> +++ b/drivers/clk/sprd/mux.c
>> @@ -0,0 +1,89 @@
>> +/*
>> + * Spreadtrum multiplexer clock driver
>> + *
>> + * Copyright (C) 2017 Spreadtrum, Inc.
>> + * Author: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
>> + *
>> + * SPDX-License-Identifier: GPL-2.0
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/regmap.h>
>> +
>> +#include "mux.h"
>> +
>> +DEFINE_SPINLOCK(sprd_mux_lock);
>> +EXPORT_SYMBOL_GPL(sprd_mux_lock);
>> +
>> +u8 sprd_mux_helper_get_parent(const struct sprd_clk_common *common,
>> +                  const struct sprd_mux_internal *mux)
>> +{
>> +    unsigned int reg;
>> +    u8 parent;
>> +    int num_parents;
>> +    int i;
>> +
>> +    sprd_regmap_read(common->regmap, common->reg, &reg);
>> +    parent = reg >> mux->shift;
>> +    parent &= (1 << mux->width) - 1;
>> +
>> +    if (mux->table) {
>> +        num_parents = clk_hw_get_num_parents(&common->hw);
>> +
>> +        for (i = 0; i < num_parents; i++)
>> +            if (parent == mux->table[i] ||
>> +                (i < (num_parents - 1) && parent > mux->table[i] &&
>> +                 parent < mux->table[i + 1]))
>> +                return i;
>> +        if (i == num_parents)
>> +            return i - 1;
> 
> The if branch is not necessary since you only get there when the loop 
> has finished, so the condition is always true. And the loop can be 
> simplified to:
> 
> for (i = 0; i < num_parents - 1; i++)
>      if (parent >= mux->table[i] &&  parent < mux->table[i + 1])
>          return i;
> 
> return num_parents;

Oops, meant to say "return num_parents - 1;" on that last line.

-- 
Julien Thierry
