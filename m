From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 2/4] RISC-V: Support per-hart timebase-frequency
Date: Fri, 7 Dec 2018 15:36:49 -0800
Message-ID: <f9769cec-2240-b668-c9e5-387212cf317e@wdc.com>
References: <mhng-531f9ae3-9ab2-48cb-9f1f-4e6814498753@palmer-si-x1c4>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <mhng-531f9ae3-9ab2-48cb-9f1f-4e6814498753@palmer-si-x1c4>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dmitriy@oss-tech.org" <dmitriy@oss-tech.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "anup@brainfault.org" <anup@brainfault.org>, Damien Le Moal <Damien.LeMoal@wdc.com>
List-Id: devicetree@vger.kernel.org

On 12/7/18 8:42 AM, Palmer Dabbelt wrote:
> On Mon, 03 Dec 2018 12:57:29 PST (-0800), atish.patra@wdc.com wrote:
>> Follow the updated DT specs and read the timebase-frequency
>> from the boot cpu. Keep the old DT reading as well for backward
>> compatibility. This patch is rework of old patch from Palmer.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>   arch/riscv/kernel/time.c          |  9 +--------
>>   drivers/clocksource/riscv_timer.c | 22 ++++++++++++++++++++++
>>   2 files changed, 23 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
>> index 1911c8f6..225fe743 100644
>> --- a/arch/riscv/kernel/time.c
>> +++ b/arch/riscv/kernel/time.c
>> @@ -20,14 +20,7 @@ unsigned long riscv_timebase;
>>
>>   void __init time_init(void)
>>   {
>> -	struct device_node *cpu;
>> -	u32 prop;
>> -
>> -	cpu = of_find_node_by_path("/cpus");
>> -	if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
>> -		panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
>> -	riscv_timebase = prop;
>> +	timer_probe();
>>
>>   	lpj_fine = riscv_timebase / HZ;
>> -	timer_probe();
>>   }
>> diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
>> index 084e97dc..96af7058 100644
>> --- a/drivers/clocksource/riscv_timer.c
>> +++ b/drivers/clocksource/riscv_timer.c
>> @@ -83,6 +83,26 @@ void riscv_timer_interrupt(void)
>>   	evdev->event_handler(evdev);
>>   }
>>
>> +static long __init riscv_timebase_frequency(struct device_node *node)
>> +{
>> +	u32 timebase;
>> +
>> +	if (!of_property_read_u32(node, "timebase-frequency", &timebase))
>> +		return timebase;
>> +
>> +	/*
>> +	 * As per the DT specification, timebase-frequency should be present
>> +	 * under individual cpu node. Unfortunately, there are already available
>> +	 * HiFive Unleashed devices where the timebase-frequency entry is under
>> +	 * CPUs. check under parent "cpus" node to cover those devices.
>> +	 */
>> +	if (!of_property_read_u32(node->parent, "timebase-frequency",
>> +				  &timebase))
>> +		return timebase;
>> +
>> +	panic("RISC-V system with no 'timebase-frequency' in DTS\n");
>> +}
>> +
>>   static int __init riscv_timer_init_dt(struct device_node *n)
>>   {
>>   	int cpuid, hartid, error;
>> @@ -94,6 +114,8 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>>   	if (cpuid != smp_processor_id())
>>   		return 0;
>>
>> +	/* This should be called only for boot cpu */
>> +	riscv_timebase = riscv_timebase_frequency(n);
>>   	cs = per_cpu_ptr(&riscv_clocksource, cpuid);
>>   	clocksource_register_hz(cs, riscv_timebase);
> 
> We need to check to make sure the timebase-frequency of each hart is the same.
> This is mandated by the RISC-V ISA specification but should be checked in the
> code.
> 
Fair enough. I will add a timebase-frequency verification function that 
will be executed for every cpu instead of boot cpu.

If any cpu's timebase-frequency doesn't match with boot cpu, should we 
just WARN? or Do we need panic given that DT is not following something 
that is mandated by ISA ?

Regards,
Atish
