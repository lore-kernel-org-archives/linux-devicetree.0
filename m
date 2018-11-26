From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V4 2/2] base/drivers/arch_topology: Default dmips-mhz if
 they are not set in DT
Date: Mon, 26 Nov 2018 21:08:12 +0100
Message-ID: <1ad863c3-2c78-52a1-2f0f-b7a3cc3ad80d@linaro.org>
References: <1543234847-21611-1-git-send-email-daniel.lezcano@linaro.org>
 <1543234847-21611-2-git-send-email-daniel.lezcano@linaro.org>
 <20181126150601.GD4637@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181126150601.GD4637@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: rjw@rjwysocki.net, linux-kernel@vger.kernel.org, viresh.kumar@linaro.org, Chris Redpath <chris.redpath@linaro.org>, Quentin Perret <quentin.perret@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Li Yang <leoyang.li@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


Hi Greg,

thanks for the review.

On 26/11/2018 16:06, Greg Kroah-Hartman wrote:
> On Mon, Nov 26, 2018 at 01:20:43PM +0100, Daniel Lezcano wrote:
>> --- a/drivers/base/arch_topology.c
>> +++ b/drivers/base/arch_topology.c
>> @@ -243,9 +243,20 @@ static int __init register_cpufreq_notifier(void)
>>  	 * until we have the necessary code to parse the cpu capacity, so
>>  	 * skip registering cpufreq notifier.
>>  	 */
>> -	if (!acpi_disabled || !raw_capacity)
>> +	if (!acpi_disabled)
>>  		return -EINVAL;
>>  
>> +	if (!raw_capacity) {
>> +
>> +		pr_info("cpu_capacity: No capacity defined in DT, set default "
>> +		       "values to %ld\n", SCHED_CAPACITY_SCALE);
> 
> Why the extra blank line?
> 
> And what is userspace going to do with this noise?  Is this an error?
> Just normal operation?  A device should never be saying anything to the
> log for normal boot functionality.  When is this called?

It is not an error but a fallback path. It is called at init time when
the cpufreq notifier is called and when either the DT read failed or
nothing is specified. I agree this is noise, I will remove the trace.

> And no need for the "cpu_capacity:" right?  Shouldn't the pr_info() line
> handle the prefix for you?

Ah, right I did not pay attention to the prefix and blindly copied the
line from somewhere else. I think it is better to drop this trace in any
case.

I will provide a patch setting the pr_fmt in a separate series.


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
