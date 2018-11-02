From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFC 0/2] Add RISC-V cpu topology
Date: Fri, 2 Nov 2018 14:14:30 -0700
Message-ID: <9385b2eb-4729-8247-b0ae-1540793d078b@wdc.com>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <866dedbc78ab4fa0e3b040697e112106@mailhost.ics.forth.gr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <866dedbc78ab4fa0e3b040697e112106@mailhost.ics.forth.gr>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Damien Le Moal <Damien.LeMoal@wdc.com>, "alankao@andestech.com" <alankao@andestech.com>, "hch@infradead.org" <hch@infradead.org>, "anup@brainfault.org" <anup@brainfault.org>, "palmer@sifive.com" <palmer@sifive.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "zong@andestech.com" <zong@andestech.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "tglx@linutronix.de" <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On 11/2/18 11:59 AM, Nick Kossifidis wrote:
> Hello All,
> 
> Στις 2018-11-02 01:04, Atish Patra έγραψε:
>> This patch series adds the cpu topology for RISC-V. It contains
>> both the DT binding and actual source code. It has been tested on
>> QEMU & Unleashed board.
>>
>> The idea is based on cpu-map in ARM with changes related to how
>> we define SMT systems. The reason for adopting a similar approach
>> to ARM as I feel it provides a very clear way of defining the
>> topology compared to parsing cache nodes to figure out which cpus
>> share the same package or core.  I am open to any other idea to
>> implement cpu-topology as well.
>>
> 
> I was also about to start a discussion about CPU topology on RISC-V
> after the last swtools group meeting. The goal is to provide the
> scheduler with hints on how to distribute tasks more efficiently
> between harts, by populating the scheduling domain topology levels
> (https://elixir.bootlin.com/linux/v4.19/ident/sched_domain_topology_level).
> What we want to do is define cpu groups and assign them to
> scheduling domains with the appropriate SD_ flags
> (https://github.com/torvalds/linux/blob/master/include/linux/sched/topology.h#L16).
> 

Scheduler domain topology is already getting all the hints in the 
following way.

static struct sched_domain_topology_level default_topology[] = {
#ifdef CONFIG_SCHED_SMT
         { cpu_smt_mask, cpu_smt_flags, SD_INIT_NAME(SMT) },
#endif
#ifdef CONFIG_SCHED_MC
         { cpu_coregroup_mask, cpu_core_flags, SD_INIT_NAME(MC) },
#endif
         { cpu_cpu_mask, SD_INIT_NAME(DIE) },
         { NULL, },
};

#ifdef CONFIG_SCHED_SMT
static inline const struct cpumask *cpu_smt_mask(int cpu)
{
         return topology_sibling_cpumask(cpu);
}
#endif

const struct cpumask *cpu_coregroup_mask(int cpu)
{
         return &cpu_topology[cpu].core_sibling;
}


> So the cores that belong to a scheduling domain may share:
> CPU capacity (SD_SHARE_CPUCAPACITY / SD_ASYM_CPUCAPACITY)
> Package resources -e.g. caches, units etc- (SD_SHARE_PKG_RESOURCES)
> Power domain (SD_SHARE_POWERDOMAIN)
> 
> In this context I believe using words like "core", "package",
> "socket" etc can be misleading. For example the sample topology you
> use on the documentation says that there are 4 cores that are part
> of a package, however "package" has a different meaning to the
> scheduler. Also we don't say anything in case they share a power
> domain or if they have the same capacity or not. This mapping deals
> only with cache hierarchy or other shared resources.
> 
> How about defining a dt scheme to describe the scheduler domain
> topology levels instead ? e.g:
> 
> 2 sets (or clusters if you prefer) of 2 SMT cores, each set with
> a different capacity and power domain:
> 
> sched_topology {
>    level0 { // SMT
>     shared = "power", "capacity", "resources";
>     group0 {
>      members = <&hart0>, <&hart1>;
>     }
>     group1 {
>      members = <&hart2>, <&hart3>;
>     }
>     group2 {
>      members = <&hart4>, <&hart5>;
>     }
>     group3 {
>      members = <&hart6>, <&hart7>;
>     }
>    }
>    level1 { // MC
>     shared = "power", "capacity"
>     group0 {
>      members = <&hart0>, <&hart1>, <&hart2>, <&hart3>;
>     }
>     group1 {
>      members = <&hart4>, <&hart5>, <&hart6>, <&hart7>;
>     }
>    }
>    top_level { // A group with all harts in it
>     shared = "" // There is nothing common for ALL harts, we could have
> capacity here
>    }
> }
> 

I agree that naming could have been better in the past. But it is what 
it is now. I don't see any big advantages in this approach compared to 
the existing approach where DT specifies what hardware looks like and 
scheduler sets up it's domain based on different cpumasks.


Regards,
Atish
> Regards,
> Nick
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
