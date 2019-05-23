From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFT PATCH v4 3/5] cpu-topology: Move cpu topology code to common
 code.
Date: Thu, 23 May 2019 16:34:48 -0700
Message-ID: <935ee66e-d303-5e0f-bbf9-20139ba79d77@wdc.com>
References: <20190428002529.14229-1-atish.patra@wdc.com>
 <20190428002529.14229-4-atish.patra@wdc.com>
 <20190523093549.GA13560@e107155-lin>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190523093549.GA13560@e107155-lin>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>, Anup Patel <anup@brainfault.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Morten Rasmussen <morten.rasmussen@arm.com>, Otto Sabart <ottosabart@seberm.com>, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>
List-Id: devicetree@vger.kernel.org

On 5/23/19 2:36 AM, Sudeep Holla wrote:
> On Sat, Apr 27, 2019 at 05:25:27PM -0700, Atish Patra wrote:
>> Both RISC-V & ARM64 are using cpu-map device tree to describe
>> their cpu topology. It's better to move the relevant code to
>> a common place instead of duplicate code.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>   arch/arm64/include/asm/topology.h |  23 ---
>>   arch/arm64/kernel/topology.c      | 303 +-----------------------------
>>   drivers/base/arch_topology.c      | 298 ++++++++++++++++++++++++++++-
>>   drivers/base/topology.c           |   1 +
>>   include/linux/arch_topology.h     |  28 +++
>>   5 files changed, 330 insertions(+), 323 deletions(-)
>>
>> -void store_cpu_topology(unsigned int cpuid);
> [...]
> 
> 
>> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
>> index edfcf8d982e4..2b0758c01cee 100644
>> --- a/drivers/base/arch_topology.c
>> +++ b/drivers/base/arch_topology.c
>> @@ -6,8 +6,8 @@
>>    * Written by: Juri Lelli, ARM Ltd.
>>    */
>>
>> -#include <linux/acpi.h>
>>   #include <linux/arch_topology.h>
>> +#include <linux/acpi.h>
> 
> I assume this was to avoid compilation errors, when I rebased I got
> conflict and I ordered them back alphabetically as before and hit the
> compilation error.
> 
> The actual fix would be to include linux/arch_topology.h in linux/topology.h
> as you are moving contents of asm/topology.h which it includes.
> 
> I did the change and get it tested by kbuild. See [1]
> 

Thanks for pointing that out. I think we can remove arch_topology.h 
include in base/arch_topology.c and base/topology.c as they already 
include sched/topology.h or linux/topology.h.

I will send out v5 soon.

> Regards,
> Sudeep
> 
> [1] https://git.kernel.org/sudeep.holla/linux/h/cpu_topology
> 


-- 
Regards,
Atish
