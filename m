From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFT/RFC PATCH v3 3/5] cpu-topology: Move cpu topology code to
 common code.
Date: Tue, 16 Apr 2019 11:54:49 -0700
Message-ID: <ad175efb-9545-5772-e0dc-ac0b0ae5139b@wdc.com>
References: <20190320234806.19748-1-atish.patra@wdc.com>
 <20190320234806.19748-4-atish.patra@wdc.com>
 <20190415152741.GA28623@e107155-lin>
 <5c5b720f-414a-706c-3415-642c27baef1f@wdc.com>
 <20190416132324.GB24669@e107155-lin>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416132324.GB24669@e107155-lin>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Dmitriy Cherkasov <dmitriy@oss-tech.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, Johan Hovold <johan@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Morten Rasmussen <morten.rasmussen@arm.com>, Otto Sabart <ottosabart@seberm.com>, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsl>
List-Id: devicetree@vger.kernel.org

On 4/16/19 6:23 AM, Sudeep Holla wrote:
> On Mon, Apr 15, 2019 at 03:08:45PM -0700, Atish Patra wrote:
>> On 4/15/19 8:27 AM, Sudeep Holla wrote:
>>> Hi Atish,
>>>
>>> Thanks again for doing this. Overall changes look good except a couple
>>> of minor nit, see below.
>>>
>>> On Wed, Mar 20, 2019 at 04:48:04PM -0700, Atish Patra wrote:
>>>> Both RISC-V & ARM64 are using cpu-map device tree to describe
>>>> their cpu topology. It's better to move the relevant code to
>>>> a common place instead of duplicate code.
>>>>
>>>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>>>> Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>
>>>> ---
>>>>    arch/arm64/include/asm/topology.h |  23 ---
>>>>    arch/arm64/kernel/topology.c      | 303 +-----------------------------
>>>>    drivers/base/arch_topology.c      | 298 ++++++++++++++++++++++++++++-
>>>>    drivers/base/topology.c           |   1 +
>>>>    include/linux/arch_topology.h     |  28 +++
>>>>    5 files changed, 330 insertions(+), 323 deletions(-)
>>>>
>>>
>>> [...]
>>>
>>>> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
>>>> index edfcf8d9..6cc6a860 100644
>>>> --- a/drivers/base/arch_topology.c
>>>> +++ b/drivers/base/arch_topology.c
>>>> @@ -6,8 +6,8 @@
>>>>     * Written by: Juri Lelli, ARM Ltd.
>>>>     */
>>>> -#include <linux/acpi.h>
>>>>    #include <linux/arch_topology.h>
>>>> +#include <linux/acpi.h>
>>>>    #include <linux/cpu.h>
>>>>    #include <linux/cpufreq.h>
>>>>    #include <linux/device.h>
>>>> @@ -16,6 +16,11 @@
>>>>    #include <linux/string.h>
>>>>    #include <linux/sched/topology.h>
>>>>    #include <linux/cpuset.h>
>>>> +#include <linux/cpumask.h>
>>>> +#include <linux/init.h>
>>>> +#include <linux/percpu.h>
>>>> +#include <linux/sched.h>
>>>> +#include <linux/smp.h>
>>>>    DEFINE_PER_CPU(unsigned long, freq_scale) = SCHED_CAPACITY_SCALE;
>>>> @@ -278,3 +283,294 @@ static void parsing_done_workfn(struct work_struct *work)
>>>>    #else
>>>>    core_initcall(free_raw_capacity);
>>>>    #endif
>>>> +
>>>> +#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
>>>
>>> Why can't the above one be just GENERIC_ARCH_TOPOLOGY ?
>>> I may be missing to find it myself, but would like to know.
>>>
>> GENERIC_ARCH_TOPOLOGY is now used for both RISCV, ARM & ARM64.
>> The below functions under this #ifdef have different implementation for ARM
>> and ARM64.
>>
>> parse_dt_topology
>> cpu_coregroup_mask
>> update_siblings_masks
>>
>> While we can combine the later two functions and move them to common code as
>> well, parse_dt_topology is significantly different.
>>
> 
> Sure, had a quick glance and indeed they may look different, but won't
> it defeat the purpose of this binding consolidation ?
> 
I didn't want change too much at first go.

>> That's why we need some kind of #ifdef or renaming of parse_dt_topology for
>> ARM32 code.
>>
> 
> I am fine if we want to take this up later to keep the impact minimum.
> But cpu_coregroup_mask and update_siblings_masks can and must be unified.

Sure. I will just leave parse_dt_topology as it is for now and unify 
other two functions.

I think we should unify parse_dt_topology in separate series.

Regards,
Atish
> In fact the existing generic version must work on ARM32 too.
> 
>> Thanks for the review!!
>>
> 
> You are welcome.
> 
> --
> Regards,
> Sudeep
> 
