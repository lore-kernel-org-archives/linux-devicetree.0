From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 2/5] clocksource/drivers/timer-microchip-pit64b: add
 Microchip PIT64B support
Date: Fri, 31 May 2019 12:41:30 +0200
Message-ID: <7267f37b-4f80-97e3-7a8e-bc1a9a28b995@linaro.org>
References: <1552580772-8499-1-git-send-email-claudiu.beznea@microchip.com>
 <1552580772-8499-3-git-send-email-claudiu.beznea@microchip.com>
 <a738fce5-1108-34d7-d255-dfcb86f51c56@linaro.org>
 <20190408121141.GK7480@piout.net>
 <88ab46de-c3b6-6dd2-3fa2-f2d0075e969f@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <88ab46de-c3b6-6dd2-3fa2-f2d0075e969f@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu.Beznea@microchip.com, alexandre.belloni@bootlin.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ludovic.Desroches@microchip.com, robh+dt@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd.bergmann@linaro.org>
List-Id: devicetree@vger.kernel.org


Hi Claudiu,


On 30/05/2019 09:46, Claudiu.Beznea@microchip.com wrote:
> Hi Daniel,
> 
> Taking into account the discussion on this tread and the fact that we have
> no answer from Rob on this topic (I'm talking about [1]), what do you think
> it would be best for this driver to be accepted the soonest? Would it be OK
> for you to mimic the approach done by:
> 
> drivers/clocksource/timer-integrator-ap.c
> 
> with the following bindings in DT:
> 
> aliases {
> 	arm,timer-primary = &timer2;
> 	arm,timer-secondary = &timer1;
> };
> 
> also in PIT64B driver?
> 
> Or do you think re-spinning the Alexandre's patches at [2] (which seems to
> me like the generic way to do it) would be better?

This hardware / OS connection problem is getting really annoying for
everyone and this pattern is repeating itself since several years. It is
time we fix it properly.

The first solution looks hackish from my POV. The second approach looks
nicer and generic as you say. So I would vote for [2] but with the
flagging approach proposed by Mark [3].

I added Arnd in Cc in order to have its opinion.

[3]
https://lore.kernel.org/lkml/20171215113242.skmh5nzr7wqdmvnw@lakrids.cambridge.arm.com/

> [1]
> https://lore.kernel.org/lkml/20190408151155.20279-1-alexandre.belloni@bootlin.com/#t
> [2]
> https://lore.kernel.org/lkml/20171213185313.20017-1-alexandre.belloni@free-electrons.com/
> 






-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
