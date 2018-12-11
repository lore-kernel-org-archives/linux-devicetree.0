From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFT PATCH v1 0/4] Unify CPU topology across ARM64 & RISC-V
Date: Mon, 10 Dec 2018 16:26:48 -0800
Message-ID: <131ba08d-a31f-601d-eb40-9d2e8007d948@wdc.com>
References: <1543534100-3654-1-git-send-email-atish.patra@wdc.com>
 <d72a87f4-8dc1-2ec7-b602-0135c5e4c3a7@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d72a87f4-8dc1-2ec7-b602-0135c5e4c3a7@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jhugo@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Morten Rasmussen <morten.rasmussen@arm.com>, Juri Lelli <juri.lelli@arm.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>, Ingo Molnar <mingo@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "moderated list:ARM64 PORT AARCH64 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 12/5/18 9:53 AM, Jeffrey Hugo wrote:
> On 11/29/2018 4:28 PM, Atish Patra wrote:
>> The cpu-map DT entry in ARM64 can describe the CPU topology in
>> much better way compared to other existing approaches. RISC-V can
>> easily adopt this binding to represent it's own CPU topology.
>> Thus, both cpu-map DT binding and topology parsing code can be
>> moved to a common location so that RISC-V or any other
>> architecture can leverage that.
>>
>> The relevant discussion regarding unifying cpu topology can be
>> found in [1].
>>
>> arch_topology seems to be a perfect place to move the common
>> code. I have not introduced any functional changes in the moved
>> code. The only downside in this approach is that the capacity
>> code will be executed for RISC-V as well. But, it will exit
>> immediately after not able to find the appropriate DT node. If
>> the overhead is considered too much, we can always compile out
>> capacity related functions under a different config for the
>> architectures that do not support them.
>>
>> The patches have been tested for RISC-V and compile tested for
>> ARM64 & x86.
>>
>> The socket change[2] is also now part of this series.
>>
>> [1] https://lkml.org/lkml/2018/11/6/19
>> [2] https://lkml.org/lkml/2018/11/7/918
>>
>> QEMU changes for RISC-V topology are available at
>>
>> https://github.com/atishp04/riscv-qemu/tree/cpu_topo
>>
>> Apologies for the previous patch series with incorrect title and
>> was sent only to kernel mailing list due to a bug in my config.
>> Please ignore that.
>>
>> Atish Patra (3):
>> dt-binding: cpu-topology: Move cpu-map to a common binding.
>> cpu-topology: Move cpu topology code to common code.
>> RISC-V: Parse cpu topology during boot.
>>
>> Sudeep Holla (1):
>> Documentation: DT: arm: add support for sockets defining package
>> boundaries
>>
>> .../{arm/topology.txt => cpu/cpu-topology.txt}     | 133 +++++++--
>> arch/arm64/include/asm/topology.h                  |  22 --
>> arch/arm64/kernel/topology.c                       | 303 +--------------------
>> arch/riscv/Kconfig                                 |   1 +
>> arch/riscv/kernel/smpboot.c                        |   3 +
>> drivers/base/arch_topology.c                       | 294 ++++++++++++++++++++
>> include/linux/arch_topology.h                      |  26 ++
>> include/linux/topology.h                           |   1 +
>> 8 files changed, 435 insertions(+), 348 deletions(-)
>> rename Documentation/devicetree/bindings/{arm/topology.txt => cpu/cpu-topology.txt} (66%)
>>
>> --
>> 2.7.4
>>
> 
> Seems to test fine on QDF2400.
> 
> Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>
>


Thanks for verifying the patches.

> I did see that git am complained about patch #2 -
> 
> patch:103: space before tab in indent.
>                           };
> patch:114: space before tab in indent.
>           };
> warning: 2 lines add whitespace errors.
> 
> 

Thanks for pointing it out. For some reason, cherry-pick did not 
complain about these. I will fix them.

Regards,
Atish
