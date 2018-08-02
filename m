From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 09/11] RISC-V: Support per-hart timebase-frequency
Date: Thu, 2 Aug 2018 15:19:49 -0700
Message-ID: <fef973e1-6efc-0eff-2789-4a4b5b01900b@wdc.com>
References: <20180802115008.4031-1-hch@lst.de>
 <20180802115008.4031-10-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180802115008.4031-10-hch@lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, "tglx@linutronix.de" <tglx@linutronix.de>, "palmer@sifive.com" <palmer@sifive.com>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "anup@brainfault.org" <anup@brainfault.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "shorne@gmail.com" <shorne@gmail.com>
List-Id: devicetree@vger.kernel.org

On 8/2/18 4:50 AM, Christoph Hellwig wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
> 
> Follow the updated DT specs and read the timebase-frequency from the
> CPU 0 node.
> 

However, the DT in the HighFive Unleashed has the entry at the wrong place.

Even the example in github also at wrong place.
https://github.com/riscv/riscv-device-tree-doc/pull/8/commits/2461d481329c55005fcbe684f0d6bdb3b7f0a432

DT should be consistent between Documentation and the one in the 
hardware. I can fix them in bbl & submit a bbl patch. But I am not sure 
if that's an acceptable way to do it.

Regards,
Atish
> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> [hch: updated changelog]
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   arch/riscv/kernel/time.c | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
> index 0df9b2cbd645..1bb01dc2d0f1 100644
> --- a/arch/riscv/kernel/time.c
> +++ b/arch/riscv/kernel/time.c
> @@ -24,17 +24,24 @@ void __init init_clockevent(void)
>   	csr_set(sie, SIE_STIE);
>   }
>   
> -void __init time_init(void)
> +static long __init timebase_frequency(void)
>   {
>   	struct device_node *cpu;
>   	u32 prop;
>   
>   	cpu = of_find_node_by_path("/cpus");
> -	if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
> -		panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
> -	riscv_timebase = prop;
> +	if (cpu && !of_property_read_u32(cpu, "timebase-frequency", &prop))
> +		return prop;
> +	cpu = of_find_node_by_path("/cpus/cpu@0");
> +	if (cpu && !of_property_read_u32(cpu, "timebase-frequency", &prop))
> +		return prop;
>   
> -	lpj_fine = riscv_timebase / HZ;
> +	panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
> +}
>   
> +void __init time_init(void)
> +{
> +	riscv_timebase = timebase_frequency();
> +	lpj_fine = riscv_timebase / HZ;
>   	init_clockevent();
>   }
> 
