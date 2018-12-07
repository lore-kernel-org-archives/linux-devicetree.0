From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 4/4] RISC-V: Fix non-smp kernel boot on SMP systems
Date: Fri, 7 Dec 2018 15:31:23 -0800
Message-ID: <74dcf9b4-2343-0f56-1b56-80cc064728fb@wdc.com>
References: <mhng-4a071ea7-ddf5-4204-8343-790f9bbb3a09@palmer-si-x1c4>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <mhng-4a071ea7-ddf5-4204-8343-790f9bbb3a09@palmer-si-x1c4>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dmitriy@oss-tech.org" <dmitriy@oss-tech.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "anup@brainfault.org" <anup@brainfault.org>, Damien Le Moal <Damien.LeMoal@wdc.com>
List-Id: devicetree@vger.kernel.org

On 12/7/18 9:00 AM, Palmer Dabbelt wrote:
> On Mon, 03 Dec 2018 12:57:31 PST (-0800), atish.patra@wdc.com wrote:
>> Currently, clocksource registration happens for an invalid cpu
>> for non-smp kernels. This lead to kernel panic as cpu hotplug
>> registration will fail for those cpus.
>>
>> Do not proceed if hartid is invalid. Take this opprtunity to
>> print appropriate error strings for different failure cases.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>   drivers/clocksource/riscv_timer.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
>> index 39de6e49..4af4af47 100644
>> --- a/drivers/clocksource/riscv_timer.c
>> +++ b/drivers/clocksource/riscv_timer.c
>> @@ -108,6 +108,8 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>>   	int cpuid, hartid, error;
>>
>>   	hartid = riscv_of_processor_hartid(n);
>> +	if (hartid < 0)
>> +		return hartid;
> 
> This seems like it's just hiding a bug somewhere else.  We should at least put
> out a WARN here, as I'm not sure the error will propagate anywhere useful.
> 
ok. I will add a warning here. That's what we are doing in plic as well.

Regards,
Atish
>>   	cpuid = riscv_hartid_to_cpuid(hartid);
>>
>>   	if (cpuid != smp_processor_id())
>> @@ -115,14 +117,19 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>>
>>   	/* This should be called only for boot cpu */
>>   	riscv_timebase = riscv_timebase_frequency(n);
>> -	clocksource_register_hz(&riscv_clocksource, riscv_timebase);
>> +	error = clocksource_register_hz(&riscv_clocksource, riscv_timebase);
>>
>> +	if (error) {
>> +		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
>> +		       error, cpuid);
>> +		return error;
>> +	}
>>   	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
>>   			 "clockevents/riscv/timer:starting",
>>   			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);
>>   	if (error)
>> -		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
>> -		       error, cpuid);
>> +		pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
>> +		       error);
>>   	return error;
>>   }
> 
