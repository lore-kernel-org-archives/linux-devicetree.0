From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFT PATCH v5 3/5] cpu-topology: Move cpu topology code to common
 code.
Date: Wed, 29 May 2019 10:24:44 -0700
Message-ID: <b291e1da-47a7-32b9-ab36-90f65b2a961a@wdc.com>
References: <20190524000653.13005-1-atish.patra@wdc.com>
 <20190524000653.13005-4-atish.patra@wdc.com>
 <20190529104801.GA13155@e107155-lin>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529104801.GA13155@e107155-lin>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>, Jeffrey Hugo <jhugo@codeaurora.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>, Anup Patel <anup@brainfault.org>, Catalin Marinas <catalin.marinas@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Morten Rasmussen <morten.rasmussen@arm.com>, Otto Sabart <ottosabart@seberm.com>, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh>
List-Id: devicetree@vger.kernel.org

On 5/29/19 3:48 AM, Sudeep Holla wrote:
> On Thu, May 23, 2019 at 05:06:50PM -0700, Atish Patra wrote:
>> Both RISC-V & ARM64 are using cpu-map device tree to describe
>> their cpu topology. It's better to move the relevant code to
>> a common place instead of duplicate code.
>>
> 
> I couldn't test this on any ARM64 server platforms, tested on Juno
> and other embedded platforms.
> 

Jeff had tested earlier patch series on ARM64 server platform.
Since then, the series has changed. Even though, I don't expect it break 
ARM64, if it can be verified again that would be great.

@Jeff: Can you give it a shot if you have some time ?

> Tested-by: Sudeep Holla <sudeep.holla@arm.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> 

Thanks!

>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>   arch/arm64/include/asm/topology.h |  23 ---
>>   arch/arm64/kernel/topology.c      | 303 +-----------------------------
>>   drivers/base/arch_topology.c      | 296 +++++++++++++++++++++++++++++
>>   include/linux/arch_topology.h     |  28 +++
>>   include/linux/topology.h          |   1 +
>>   5 files changed, 329 insertions(+), 322 deletions(-)
>>
> 
> [...]
> 
>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
>> index 0825c4a856e3..6b95c91e7d67 100644
>> --- a/arch/arm64/kernel/topology.c
>> +++ b/arch/arm64/kernel/topology.c
>>
> 
> [...]
> 
>> -static int __init parse_cluster(struct device_node *cluster, int depth)
>> -{
>> -	char name[10];
>> -	bool leaf = true;
>> -	bool has_cores = false;
>> -	struct device_node *c;
>> -	static int package_id __initdata;
>> -	int core_id = 0;
> 
> [Ultra minor nit]: you seem to have reordered the above declaration when
> you moved, just noticed as it showed up when comparing.
> 

Arrgh. Sorry!

I think I was trying to fix a checkpatch or something and forgot to 
revert. I will update it.

>> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
>> index 1739d7e1952a..20a960131bee 100644
>> --- a/drivers/base/arch_topology.c
>> +++ b/drivers/base/arch_topology.c
> 
> [...]
> 
>> +
>> +static int __init parse_cluster(struct device_node *cluster, int depth)
>> +{
>> +	char name[10];
>> +	bool leaf = true;
>> +	bool has_cores = false;
>> +	int core_id = 0;
>> +	static int package_id __initdata;
>> +	struct device_node *c;
>> +	int i, ret;
>> +
> 
> [...]
> 
>> +#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
>> +void update_siblings_masks(unsigned int cpu);
>> +#endif
>> +void remove_cpu_topology(unsigned int cpuid);
>> +
> 
> Another thing(not a block and we can do it once this is merged) is to
> remove these #ifdefs
> 

This #ifdef is removed in patch 4.

But we should remove the other ones around init_cpu_topology, 
parse_dt_topology and friends in a follow up patch once this is merged.

> --
> Regards,
> Sudeep
> 


-- 
Regards,
Atish
