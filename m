From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v4 2/2] driver: clocksource: Add nxp system counter timer
 driver support
Date: Tue, 21 May 2019 14:20:15 +0200
Message-ID: <bc03b0c8-52cf-58e1-e7b3-bb1f2345c05b@linaro.org>
References: <20190521072355.12928-1-ping.bai@nxp.com>
 <20190521072355.12928-2-ping.bai@nxp.com>
 <5823cd07-312b-600c-1b78-dc5bff2a12eb@linaro.org>
 <VI1PR0402MB3519B14C5AF93F246907F03A87070@VI1PR0402MB3519.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR0402MB3519B14C5AF93F246907F03A87070@VI1PR0402MB3519.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacky Bai <ping.bai@nxp.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On 21/05/2019 14:01, Jacky Bai wrote:
> 
>> -----Original Message-----
>> From: Daniel Lezcano [mailto:daniel.lezcano@linaro.org]
>> Sent: Tuesday, May 21, 2019 6:08 PM
>> To: Jacky Bai <ping.bai@nxp.com>; tglx@linutronix.de; robh+dt@kernel.org;
>> shawnguo@kernel.org; mark.rutland@arm.com; Aisheng Dong
>> <aisheng.dong@nxp.com>
>> Cc: linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; dl-linux-imx
>> <linux-imx@nxp.com>
>> Subject: Re: [PATCH v4 2/2] driver: clocksource: Add nxp system counter timer
>> driver support
>>
>> On 21/05/2019 09:18, Jacky Bai wrote:
>>> From: Bai Ping <ping.bai@nxp.com>
>>>
>>> The system counter (sys_ctr) is a programmable system counter which
>>> provides a shared time base to the Cortex A15, A7, A53 etc cores.
>>> It is intended for use in applications where the counter is always
>>> powered on and supports multiple, unrelated clocks. The sys_ctr
>>> hardware
>>> supports:
>>>  - 56-bit counter width (roll-over time greater than 40 years)
>>
>> The benefit of using more than 32bits on a 32bits system is not proven.
>>
> 
> It is mainly used on 64bit ARMv8 system.

Oh, ok. Fair enough.

> 
>> The function to read and build the 56bits value can have a very significant
>> impact on the performance of your platform.
>>
>> Using a 32bits counter can be enough if it does not wrap too fast.
>>
>> Can you consider a 32 bits counter ?
> 
> this counter is ARMv8 arch timer's counter source. As it also has timer function, so I choose it
> to act as a broadcast timer for cpuidle. The timer interrupt can only be triggered when 'compare[55:0] <= counter[55:0]'.
> So you mean that only use the lower 32bit to implement this timer? If so, I can change to use only the lower 32bit.

IMO it is preferable but you decide (probably compare with how long it
takes to wrap when 32bits).



-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
