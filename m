Return-Path: <SRS0=Bgpd=LN=linaro.org=daniel.lezcano@kernel.org>
Subject: Re: [PATCH 1/2] clocksource/drivers/ostm: Delay driver registration
References: <20180829132954.64862-1-chris.brandt@renesas.com>
 <20180829132954.64862-2-chris.brandt@renesas.com>
 <1ff04fa1-ee3b-6095-bcd8-f16dbb99b57a@linaro.org>
 <TY1PR01MB156202DC354E70F1C8C5B18A8A090@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <c16b82c0-e675-8f86-19e6-75cb5995813b@linaro.org>
 <CAMuHMdX9nXYan-m14k6h7OU1UCGW_irDLvMMi==dnM0cdUR_nA@mail.gmail.com>
 <c4bd550f-5319-9d92-a30a-1d12fc9bbcab@linaro.org>
 <CAMuHMdUs-YNQk1wmbqQvz_n9xq04=gkyL1uBJdg9ExA9Lmg5uw@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <a160b76b-8dca-81e8-e958-d8b92bdc8928@linaro.org>
Date: Thu, 30 Aug 2018 10:37:50 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUs-YNQk1wmbqQvz_n9xq04=gkyL1uBJdg9ExA9Lmg5uw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <Chris.Brandt@renesas.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

On 30/08/2018 10:27, Geert Uytterhoeven wrote:
> Hi Daniel,
> 
> On Thu, Aug 30, 2018 at 10:09 AM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
>> On 30/08/2018 09:54, Geert Uytterhoeven wrote:
>>> On Wed, Aug 29, 2018 at 6:26 PM Daniel Lezcano
>>> <daniel.lezcano@linaro.org> wrote:
>>>> On 29/08/2018 17:44, Chris Brandt wrote:
>>>>> On Wednesday, August 29, 2018 1, Daniel Lezcano wrote:
>>>>>> Can the boot constraints [1] solve this issue instead of the changes you
>>>>>> are proposing ?
>>>>>>
>>>>>> [1] https://lwn.net/Articles/747250/
>>>>>
>>>>> Thanks for the suggestion, but...
>>>>>
>>>>> I grepped for "boot_constraint" and it shows up nowhere in the current
>>>>> kernel.
>>>>>
>>>>> Also, this article was written Feb 16, 2018, and I can see that the
>>>>> patch series was still being submitted (V7) as of Feb 23, 2018.
>>>>
>>>> Ah ok, fair enough, I thought it was merged. In any case, after thinking
>>>> about it, it wouldn't have helped.
>>>>
>>>> My concern is if we can avoid changing the TIMER_OF_DECLARE because of
>>>> the boot order, it would be better.
>>>>
>>>> Can returning EPROBE_DEFER fix this issue? Or use the 'complex
>>>> dependencies' [1]?
>>>
>>> *_OF_DECLARE() is not compatible with EPROBE_DEFER, which causes
>>> issues with complex dependencies.
>>
>> What causes issues ? Add support for EPROBE_DEFER with OF_DECLARE or not
>> having support of it ?
> 
> Driver init functions declared using *_OF_DECLARE() are called exactly once.
> Hence if they fail, they are never retried. Calling order among subsystems is
> hardcoded, and the actual order was determined by historical reasons (legacy
> PC systems with always-on clocks and power domains ;-).
> This breaks as soon as e.g. timers or interrupt controllers start depending
> on clocks and/or power domains.
> 
> Drivers using the device driver framework are retried later when their init
> function returns -EPROBE_DEFER. So (eventually) they all succeed
> initialization.

Yeah, I got this point. But it is the meaning of your sentence: "...
which causes issues with complex dependencies.".

It is ambiguous *what* causes the issues.

Did you meant an attempt was done to support EPROBE_DEFER with
*_OF_DECLARE but caused too much issues with the complex dependencies?

Or the current situation is causing too much issues with the complex
dependencies?

(I know the latter is true, it is about the meaning of the sentence).


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
