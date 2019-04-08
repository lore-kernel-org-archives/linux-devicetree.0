From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 2/5] clocksource/drivers/timer-microchip-pit64b: add
 Microchip PIT64B support
Date: Mon, 8 Apr 2019 15:22:50 +0200
Message-ID: <e9e10fa5-dba6-e9ca-f319-036a71105b6a@linaro.org>
References: <1552580772-8499-1-git-send-email-claudiu.beznea@microchip.com>
 <1552580772-8499-3-git-send-email-claudiu.beznea@microchip.com>
 <a738fce5-1108-34d7-d255-dfcb86f51c56@linaro.org>
 <20190408121141.GK7480@piout.net>
 <ce42bb5f-c77e-e882-0579-2bbf95d7b1a5@linaro.org>
 <20190408124213.GL7480@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190408124213.GL7480@piout.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu.Beznea@microchip.com, robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, Ludovic.Desroches@microchip.com, tglx@linutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/04/2019 14:42, Alexandre Belloni wrote:
> On 08/04/2019 14:35:05+0200, Daniel Lezcano wrote:
>>
>> What about commit 51f0aeb2d21f1 ?
>>
> 
> Well, do you see anything parsing that in drivers/clocksource ?

So to make it clear:

1. You say I said anything, emphasis this word in the previous answer.
But you are the one who should have argue and give the reasons of the
changes (and I'm sure they are valid). At the moment of the discussion
in the thread you mentioned, the DT change was already present.
 - Why did you not clarified this point in the thread discussion?
 - Why there is no Rob's acked-by in this commit?


2. You keep sending the atmel rework series again and again. And I'm
reviewing it again and again. And you object every single comment I do
on your code. I've already told you that.


3. I'm putting on the table again this clockevent/clocksource selection
from the DT hoping we can finally find a solution for *everyone* and
instead of jumping on the opportunity to discuss it, you blame me to not
have done this for you before.


4. Bonus, you resend your series again for the nth times two years after
the last discussion.


Do you want to see some progress?

Propose something generic telling if the node pointer is for a
clocksource or a clockevent. Get agreement from everyone and then resend
your atmel rework based on this.

Thanks

  -- Daniel


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
