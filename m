From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V5 2/2] base/drivers/arch_topology: Default dmips-mhz if
 they are not set in DT
Date: Tue, 4 Dec 2018 11:02:12 +0100
Message-ID: <db264663-3b7c-6dd3-a180-d71de9dc83f2@linaro.org>
References: <1543325060-1599-1-git-send-email-daniel.lezcano@linaro.org>
 <1543325060-1599-2-git-send-email-daniel.lezcano@linaro.org>
 <2b050e93-f734-f2f3-ac67-a30d37bf1950@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2b050e93-f734-f2f3-ac67-a30d37bf1950@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dietmar Eggemann <dietmar.eggemann@arm.com>, rjw@rjwysocki.net
Cc: linux-kernel@vger.kernel.org, viresh.kumar@linaro.org, Chris Redpath <chris.redpath@linaro.org>, Quentin Perret <quentin.perret@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, Rob Herring <robh@kernel.org>, Quentin Perret <quentin.perret@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Li Yang <leoyang.li@nxp.com>, Olof Johansson <olof@lixom.net>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org


Hi Dietmar,

thanks for the review and spotting this.

On 03/12/2018 14:46, Dietmar Eggemann wrote:
> Hi Daniel,
> 
> +cc: Russell King <linux@armlinux.org.uk>
> 
> On 11/27/18 2:24 PM, Daniel Lezcano wrote:
>> In the case of asymmetric SoC with the same micro-architecture, we
>> have a group of CPUs with smaller OPPs than the other group. One
>> example is the 96boards dragonboard 820c. There is no dmips/MHz
>> difference between both groups, so no need to specify the values in
>> the DT. Unfortunately, without these defined, there is no scaling
>> capacity computation triggered, so we need to write
>> 'capacity-dmips-mhz' for each CPU with the same value in order to
>> force the scaled capacity computation.
>>
>> In order to fix this situation, allocate 'raw_capacity' so the pointer
>> is set and the init_cpu_capacity_callback() function can be called.
>>
>> This was tested on db820c:
>>   - specified values in the DT (correct results)
>>   - partial values defined in the DT (error + fallback to defaults)
>>   - no specified values in the DT (correct results)
>>
>> correct results are:
>>    cat /sys/devices/system/cpu/cpu*/cpu_capacity
>>     758
>>     758
>>    1024
>>    1024
>>
>>    ... respectively for CPU0, CPU1, CPU2 and CPU3.
>>
>> That reflects the capacity for the max frequencies 1593600 and 2150400.
> 
> [...]
> 
> I'm afraid that this change is incompatible with the still existing
> cpu_efficiency interface we have in Arm32 for A15/A7 systems like Arm TC2:
> 
> In case you specify clock-frequency dt properties per cpu for such a
> system, the cpu_capacity values are determined via the cpu_efficiency
> code in arch/arm/kernel/topology.c.
> 
> So on Arm TC2 with clock-frequency = <1000000000> [A15] and <800000000>
> [A7] you get:
> 
> root@linaro-nano:~# cat /sys/devices/system/cpu/cpu*/cpu_capacity
> 606
> 1441
> 1441
> 606
> 606
> 
> With your patches on top (cpu_capacity functionality in
> drivers/base/arch_topology.c does not have to be switched on by
> specifying capacity-dmips-mhz dt properties anymore) we end up scaling
> by max frequency again:
> 
> root@linaro-nano:~# cat /sys/devices/system/cpu/cpu*/cpu_capacity
> 358
> 1024
> 1024
> 358
> 358
> 
> I tried to remove the cpu_efficiency based API a year ago but Russell
> pointed out that the compatibility has to be maintained for longer:
> 
> https://lore.kernel.org/lkml/20171024102718.16113-1-dietmar.eggemann@arm.com/
> 
> 
> I assume that the capacity-dmips-mhz dt property is like a switch to
> turn this functionality on for big.Little and so called gold/silver
> platforms, which have cores with the same uArch but in frequency domains
> with different max frequency values.
> 
> So what's wrong with specifying capacity-dmips-mhz = <1024> for all
> cores for those gold/silver platforms? 

There is nothing wrong, I just don't like to specify in a DT a default
values.

> I don't expect that there will be
> so many of them. And normal SMP platforms (w/o frequency domains w/o
> different max frequency values) don't have to execute this code.

Fair enough, I will send a DT change, I'm tired of playing mikado with
this code.

Thanks again for the review.

  -- Daniel


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
