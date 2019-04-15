From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFT/RFC PATCH v3 4/5] arm: Use common cpu_topology
Date: Mon, 15 Apr 2019 14:16:43 -0700
Message-ID: <41f890e9-3893-9092-bac7-3daca99f181b@wdc.com>
References: <20190320234806.19748-1-atish.patra@wdc.com>
 <20190320234806.19748-5-atish.patra@wdc.com>
 <20190415153147.GB28623@e107155-lin>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415153147.GB28623@e107155-lin>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Dmitriy Cherkasov <dmitriy@oss-tech.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, Johan Hovold <johan@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Morten Rasmussen <morten.rasmussen@arm.com>, Otto Sabart <ottosabart@seberm.com>, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Peter Zijlstra (Inte
List-Id: devicetree@vger.kernel.org

On 4/15/19 8:31 AM, Sudeep Holla wrote:
> On Wed, Mar 20, 2019 at 04:48:05PM -0700, Atish Patra wrote:
>> Currently, ARM32 and ARM64 uses different data structures to
>> represent their cpu toplogies. Since, we are moving the ARM64
>> topology to common code to be used by other architectures, we
>> can reuse that for ARM32 as well.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>   arch/arm/include/asm/topology.h | 22 +---------------------
>>   arch/arm/kernel/topology.c      | 10 +++++-----
>>   include/linux/arch_topology.h   | 10 +++++++++-
>>   3 files changed, 15 insertions(+), 27 deletions(-)
>>
> 
> [...]
> 
>> diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
>> index d4e76e0a..7c850611 100644
>> --- a/include/linux/arch_topology.h
>> +++ b/include/linux/arch_topology.h
>> @@ -36,17 +36,25 @@ unsigned long topology_get_freq_scale(int cpu)
>>   struct cpu_topology {
>>   	int thread_id;
>>   	int core_id;
>> +#ifdef CONFIG_ARM_CPU_TOPOLOGY
>> +	int socket_id;
> 
> Sorry, but I can't find any reason why we need to do this ifdef dance
> here, especially for socket_id vs package_id ? 

I was not sure if we can rename socket_id to package_id from a semantic 
point of view. If you are okay with it, I will change it to package_id 
and send a v4.

Other's I can understand
> as there are new, but I am sure we can find a way and get away with
> #ifdefery here completely.
> 
That would be good. Any suggestions on how to do that?

>> +#else
>>   	int package_id;
>>   	int llc_id;
>> +	cpumask_t llc_sibling;
>> +#endif
>>   	cpumask_t thread_sibling;
>>   	cpumask_t core_sibling;
>> -	cpumask_t llc_sibling;
>>   };
>>
>>   #ifdef CONFIG_GENERIC_ARCH_TOPOLOGY
>>   extern struct cpu_topology cpu_topology[NR_CPUS];
>>
>> +#ifdef CONFIG_ARM_CPU_TOPOLOGY
>> +#define topology_physical_package_id(cpu)	(cpu_topology[cpu].socket_id)
>> +#else
>>   #define topology_physical_package_id(cpu)	(cpu_topology[cpu].package_id)
>> +#endif
> 
> Since all callsites must use topology_physical_package_id, we should be
> able to rename socket_id to package_id easily.
> 
Sure.

Regards,
Atish
> --
> Regards,
> Sudeep
> 
