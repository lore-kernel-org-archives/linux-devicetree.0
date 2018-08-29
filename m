Return-Path: <SRS0=JAkm=LM=linaro.org=daniel.lezcano@kernel.org>
Subject: Re: [PATCH 1/2] clocksource/drivers/ostm: Delay driver registration
References: <20180829132954.64862-1-chris.brandt@renesas.com>
 <20180829132954.64862-2-chris.brandt@renesas.com>
 <1ff04fa1-ee3b-6095-bcd8-f16dbb99b57a@linaro.org>
 <TY1PR01MB156202DC354E70F1C8C5B18A8A090@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <c16b82c0-e675-8f86-19e6-75cb5995813b@linaro.org>
Date: Wed, 29 Aug 2018 18:26:27 +0200
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB156202DC354E70F1C8C5B18A8A090@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Chris Brandt <Chris.Brandt@renesas.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

On 29/08/2018 17:44, Chris Brandt wrote:
> On Wednesday, August 29, 2018 1, Daniel Lezcano wrote:
>> Can the boot constraints [1] solve this issue instead of the changes you
>> are proposing ?
>>
>> [1] https://lwn.net/Articles/747250/
> 
> Thanks for the suggestion, but...
> 
> I grepped for "boot_constraint" and it shows up nowhere in the current 
> kernel.
> 
> Also, this article was written Feb 16, 2018, and I can see that the 
> patch series was still being submitted (V7) as of Feb 23, 2018.

Ah ok, fair enough, I thought it was merged. In any case, after thinking
about it, it wouldn't have helped.

My concern is if we can avoid changing the TIMER_OF_DECLARE because of
the boot order, it would be better.

Can returning EPROBE_DEFER fix this issue? Or use the 'complex
dependencies' [1]?

I'm pretty busy ATM, so I can not investigate now if the suggestions
above are fine or just stupid. I will have a look as soon as I can.

  -- Daniel

[1] https://www.kernel.org/doc/html/v4.15/driver-api/device_link.html




-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
