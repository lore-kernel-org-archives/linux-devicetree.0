From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFT PATCH v1 3/4] cpu-topology: Move cpu topology code to common
 code.
Date: Mon, 3 Dec 2018 09:31:17 -0800
Message-ID: <f71fd03d-e5a7-0e79-9273-367db2354777@wdc.com>
References: <1543534100-3654-1-git-send-email-atish.patra@wdc.com>
 <1543534100-3654-4-git-send-email-atish.patra@wdc.com>
 <20181203171619.GE17883@e107155-lin>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203171619.GE17883@e107155-lin>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Dmitriy Cherkasov <dmitriy@oss-tech.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, Juri Lelli <juri.lelli@arm.com>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Morten Rasmussen <morten.rasmussen@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Peter Z
List-Id: devicetree@vger.kernel.org

On 12/3/18 9:16 AM, Sudeep Holla wrote:
> On Thu, Nov 29, 2018 at 03:28:19PM -0800, Atish Patra wrote:
>> Both RISC-V & ARM64 are using cpu-map device tree to describe
>> their cpu topology. It's better to move the relevant code to
>> a common place instead of duplicate code.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>   arch/arm64/include/asm/topology.h |  22 ---
>>   arch/arm64/kernel/topology.c      | 303 +-------------------------------------
>>   drivers/base/arch_topology.c      | 294 ++++++++++++++++++++++++++++++++++++
>>   include/linux/arch_topology.h     |  26 ++++
>>   include/linux/topology.h          |   1 +
>>   5 files changed, 325 insertions(+), 321 deletions(-)
>>
>  From a quick look and diffstat, it looks like a simple move. However
> I would like to throw this at 0-day bot to test various build configurations
> so that it's not breaking anything. I can push to a branch in my git
> @kernel.org but not sure on the build coverage. Anyways will update
> with any results on build and testing on my side ASAP.
> 
Thanks. It definitely need to rigorous build testing for different 
configurations.

What is the best practice to trigger expansive build tests?
linux-kernel@vger.kernel.org is in CC.

Regards,
Atish
> --
> Regards,
> Sudeep
> 
