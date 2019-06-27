From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH RESEND V2 1/3] clocksource/drivers/sysctr: Add optional
 clock-frequency property
Date: Thu, 27 Jun 2019 10:07:08 +0200
Message-ID: <8f8aa6e0-5f31-8047-14b5-0e1f65316453@linaro.org>
References: <20190623123850.22584-1-Anson.Huang@nxp.com>
 <55abafbd-c010-32b5-6d76-26040830d5b0@linaro.org>
 <DB3PR0402MB3916AB9F2260B0E46CCDDEC0F5E20@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <9c017ba9-ac6b-480b-d1f3-120289343101@linaro.org>
 <DB3PR0402MB3916ED4AB17B6DDD2248DD44F5FD0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB3916ED4AB17B6DDD2248DD44F5FD0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On 27/06/2019 02:43, Anson Huang wrote:
> Hi, Daniel
> 
>> On 26/06/2019 03:42, Anson Huang wrote:
>>> Hi, Daniel
>>>
>>>> On 23/06/2019 14:38, Anson.Huang@nxp.com wrote:
>>>>> From: Anson Huang <Anson.Huang@nxp.com>
>>>>>
>>>>> Systems which use platform driver model for clock driver require the
>>>>> clock frequency to be supplied via device tree when system counter
>>>>> driver is enabled.
>>>>>
>>>>> This is necessary as in the platform driver model the of_clk
>>>>> operations do not work correctly because system counter driver is
>>>>> initialized in early phase of system boot up, and clock driver using
>>>>> platform driver model is NOT ready at that time, it will cause
>>>>> system counter driver initialization failed.
>>>>>
>>>>> Add the optinal clock-frequency to the device tree bindings of the
>>>>> NXP system counter, so the frequency can be handed in and the of_clk
>>>>> operations can be skipped.
>>>>
>>>> Isn't it possible to create a fixed-clock and refer to it? So no need
>>>> to create a specific action before calling timer_of_init() ?
>>>>
>>>
>>> As the clock must be ready before the TIMER_OF_DECLARE, so adding a
>>> CLK_OF_DECLARE_DRIVER in clock driver to ONLY register a fixed-clock?
>>> The system counter's frequency are different on different platforms,
>>> so adding fixed clock in system counter driver is NOT a good idea,
>>> ONLY the DT node or the clock driver can create this fixed clock according to
>> platforms, can you advise where to create this fixed clock is better?
>>
>> Can you point me to a DT with the "nxp,sysctr-timer" ?
> 
> The DT node of system counter is new added in 3/3 of this patch series, also can be found
> from below link:
> https://patchwork.kernel.org/patch/11011703/

Sorry, I was unclear. I meant a patch with the timer defined using a
clock as defined currently in the binding (no clock-frequency).


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
