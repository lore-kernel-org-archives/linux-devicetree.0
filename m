From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 05/11] ARM: Introduce CPU_METHOD_OF_DECLARE() for cpu
 hotplug/smp
Date: Thu, 07 Nov 2013 14:34:15 -0800
Message-ID: <527C1567.8000005@codeaurora.org>
References: <1383343739-23080-1-git-send-email-sboyd@codeaurora.org> <1383343739-23080-6-git-send-email-sboyd@codeaurora.org> <20131107015005.GE22684@joshc.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20131107015005.GE22684@joshc.qualcomm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Josh Cartwright <joshc@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-arm-msm@vger.kernel.org, Rohit Vaswani <rvaswani@codeaurora.org>, linux-kernel@vger.kernel.org, David Brown <davidb@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 11/06/13 17:50, Josh Cartwright wrote:
> On Fri, Nov 01, 2013 at 03:08:53PM -0700, Stephen Boyd wrote:
>> diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
>> index f35906b..71a8592 100644
>> --- a/arch/arm/kernel/devtree.c
>> +++ b/arch/arm/kernel/devtree.c
>> @@ -25,6 +25,7 @@
>>  #include <asm/smp_plat.h>
>>  #include <asm/mach/arch.h>
>>  #include <asm/mach-types.h>
>> +#include <asm/smp.h>
>>  
>>  void __init early_init_dt_add_memory_arch(u64 base, u64 size)
>>  {
>> @@ -63,6 +64,36 @@ void __init arm_dt_memblock_reserve(void)
>>  	}
>>  }
>>  
>> +#ifdef CONFIG_SMP
>> +extern struct of_cpu_method __cpu_method_of_table[];
>> +
>> +static const struct of_cpu_method __cpu_method_of_table_sentinel
>> +	__used __section(__cpu_method_of_table_end);
> Having a sentinel allocated into the linked image makes a lot of sense
> in other cases (IRQCHIP/CLOCKSOURCE_OF_DECLARE, etc), where it's used to
> terminate an of_device_id table (as is expected by of_match_table and
> friends).
>
> In this case, however, you aren't building a match table, so having a
> sentinel allocated isn't necessary.  I'd suggest bookending the table
> with a VMLINUX_SYMBOL(__cpu_method_of_table_end) instead.
>
> A whole 2 pointers worth of savings!
>

Yes, will do. Thanks.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
