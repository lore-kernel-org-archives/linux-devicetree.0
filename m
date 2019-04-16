From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFT/RFC PATCH v3 4/5] arm: Use common cpu_topology
Date: Tue, 16 Apr 2019 12:04:00 -0700
Message-ID: <7118dc22-ddd6-d224-733c-fbe160bab28f@wdc.com>
References: <20190320234806.19748-1-atish.patra@wdc.com>
 <20190320234806.19748-5-atish.patra@wdc.com>
 <20190415153147.GB28623@e107155-lin>
 <41f890e9-3893-9092-bac7-3daca99f181b@wdc.com>
 <20190416130916.GA24669@e107155-lin>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416130916.GA24669@e107155-lin>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Dmitriy Cherkasov <dmitriy@oss-tech.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, Johan Hovold <johan@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Morten Rasmussen <morten.rasmussen@arm.com>, Otto Sabart <ottosabart@seberm.com>, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Peter Zijlstra (Inte
List-Id: devicetree@vger.kernel.org

On 4/16/19 6:09 AM, Sudeep Holla wrote:
> On Mon, Apr 15, 2019 at 02:16:43PM -0700, Atish Patra wrote:
>> On 4/15/19 8:31 AM, Sudeep Holla wrote:
>>> On Wed, Mar 20, 2019 at 04:48:05PM -0700, Atish Patra wrote:
>>>> Currently, ARM32 and ARM64 uses different data structures to
>>>> represent their cpu toplogies. Since, we are moving the ARM64
>>>> topology to common code to be used by other architectures, we
>>>> can reuse that for ARM32 as well.
>>>>
>>>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>>>> ---
>>>>    arch/arm/include/asm/topology.h | 22 +---------------------
>>>>    arch/arm/kernel/topology.c      | 10 +++++-----
>>>>    include/linux/arch_topology.h   | 10 +++++++++-
>>>>    3 files changed, 15 insertions(+), 27 deletions(-)
>>>>
>>>
>>> [...]
>>>
>>>> diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
>>>> index d4e76e0a..7c850611 100644
>>>> --- a/include/linux/arch_topology.h
>>>> +++ b/include/linux/arch_topology.h
>>>> @@ -36,17 +36,25 @@ unsigned long topology_get_freq_scale(int cpu)
>>>>    struct cpu_topology {
>>>>    	int thread_id;
>>>>    	int core_id;
>>>> +#ifdef CONFIG_ARM_CPU_TOPOLOGY
>>>> +	int socket_id;
>>>
>>> Sorry, but I can't find any reason why we need to do this ifdef dance
>>> here, especially for socket_id vs package_id ?
>>
>> I was not sure if we can rename socket_id to package_id from a semantic
>> point of view. If you are okay with it, I will change it to package_id and
>> send a v4.
>>
> 
> Thanks, all make sure to cc linux-arm-kernel@lists.infradead.org,
> just noticed that's missing and you are asking for testing on ARM
> platforms :)
> 

My bad!! I didn't realize that linux-arm-kernel is not included. Thanks 
for pointing that out.

>> Other's I can understand
>>> as there are new, but I am sure we can find a way and get away with
>>> #ifdefery here completely.
>>>
>> That would be good. Any suggestions on how to do that?
>>
> 
> Do you see any issues having extra structure members for ARM ?
> Something like below seem to compile + boot fine on my 32-bit TC2 with
> proper topology info on top of your series. Of course, more testing is
> better, but I don't see any issue keeping llc_{id,sibling} around for
> ARM eliminating the need for #ifdefs
> 

I thought adding unused members for ARM32 might be unacceptable :).
I will update my v4 with this.

Regards,
Atish
> Let me know if I am missing something.
> 
> -->8
> 
> diff --git i/arch/arm/kernel/topology.c w/arch/arm/kernel/topology.c
> index 0ddb24c76c17..f2aa942e0cfa 100644
> --- i/arch/arm/kernel/topology.c
> +++ w/arch/arm/kernel/topology.c
> @@ -206,7 +206,7 @@ void update_siblings_masks(unsigned int cpuid)
>   	for_each_possible_cpu(cpu) {
>   		cpu_topo = &cpu_topology[cpu];
>   
> -		if (cpuid_topo->socket_id != cpu_topo->socket_id)
> +		if (cpuid_topo->package_id != cpu_topo->package_id)
>   			continue;
>   
>   		cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
> @@ -250,12 +250,12 @@ void store_cpu_topology(unsigned int cpuid)
>   			/* core performance interdependency */
>   			cpuid_topo->thread_id = MPIDR_AFFINITY_LEVEL(mpidr, 0);
>   			cpuid_topo->core_id = MPIDR_AFFINITY_LEVEL(mpidr, 1);
> -			cpuid_topo->socket_id = MPIDR_AFFINITY_LEVEL(mpidr, 2);
> +			cpuid_topo->package_id = MPIDR_AFFINITY_LEVEL(mpidr, 2);
>   		} else {
>   			/* largely independent cores */
>   			cpuid_topo->thread_id = -1;
>   			cpuid_topo->core_id = MPIDR_AFFINITY_LEVEL(mpidr, 0);
> -			cpuid_topo->socket_id = MPIDR_AFFINITY_LEVEL(mpidr, 1);
> +			cpuid_topo->package_id = MPIDR_AFFINITY_LEVEL(mpidr, 1);
>   		}
>   	} else {
>   		/*
> @@ -265,7 +265,7 @@ void store_cpu_topology(unsigned int cpuid)
>   		 */
>   		cpuid_topo->thread_id = -1;
>   		cpuid_topo->core_id = 0;
> -		cpuid_topo->socket_id = -1;
> +		cpuid_topo->package_id = -1;
>   	}
>   
>   	update_siblings_masks(cpuid);
> @@ -275,7 +275,7 @@ void store_cpu_topology(unsigned int cpuid)
>   	pr_info("CPU%u: thread %d, cpu %d, socket %d, mpidr %x\n",
>   		cpuid, cpu_topology[cpuid].thread_id,
>   		cpu_topology[cpuid].core_id,
> -		cpu_topology[cpuid].socket_id, mpidr);
> +		cpu_topology[cpuid].package_id, mpidr);
>   }
>   
>   static inline int cpu_corepower_flags(void)
> @@ -306,7 +306,7 @@ void __init init_cpu_topology(void)
>   
>   		cpu_topo->thread_id = -1;
>   		cpu_topo->core_id =  -1;
> -		cpu_topo->socket_id = -1;
> +		cpu_topo->package_id = -1;
>   		cpumask_clear(&cpu_topo->core_sibling);
>   		cpumask_clear(&cpu_topo->thread_sibling);
>   	}
> diff --git i/include/linux/arch_topology.h w/include/linux/arch_topology.h
> index 7c850611986d..8e82389c2bed 100644
> --- i/include/linux/arch_topology.h
> +++ w/include/linux/arch_topology.h
> @@ -36,13 +36,9 @@ unsigned long topology_get_freq_scale(int cpu)
>   struct cpu_topology {
>   	int thread_id;
>   	int core_id;
> -#ifdef CONFIG_ARM_CPU_TOPOLOGY
> -	int socket_id;
> -#else
>   	int package_id;
>   	int llc_id;
>   	cpumask_t llc_sibling;
> -#endif
>   	cpumask_t thread_sibling;
>   	cpumask_t core_sibling;
>   };
> @@ -50,11 +46,7 @@ struct cpu_topology {
>   #ifdef CONFIG_GENERIC_ARCH_TOPOLOGY
>   extern struct cpu_topology cpu_topology[NR_CPUS];
>   
> -#ifdef CONFIG_ARM_CPU_TOPOLOGY
> -#define topology_physical_package_id(cpu)	(cpu_topology[cpu].socket_id)
> -#else
>   #define topology_physical_package_id(cpu)	(cpu_topology[cpu].package_id)
> -#endif
>   #define topology_core_id(cpu)		(cpu_topology[cpu].core_id)
>   #define topology_core_cpumask(cpu)	(&cpu_topology[cpu].core_sibling)
>   #define topology_sibling_cpumask(cpu)	(&cpu_topology[cpu].thread_sibling)
> 
