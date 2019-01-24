From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 02/17] clocksource: davinci-timer: new driver
Date: Thu, 24 Jan 2019 17:39:19 +0530
Message-ID: <06da1719-26d6-19b0-97f5-ef4bb976e444@ti.com>
References: <20190111172134.30147-1-brgl@bgdev.pl>
 <20190111172134.30147-3-brgl@bgdev.pl>
 <08200de1-fde5-c525-c874-c7872259067b@ti.com>
 <CAMRc=McrT4KTW45=3CTBxspVb+z8k=DDjOvKi9NH0aA9eJ8=cQ@mail.gmail.com>
 <a7d4994d-7740-c845-da67-9d06e6d874cc@ti.com>
 <d9bc1153-3b65-19a8-67ef-e131296cd8b1@ti.com>
 <CAMRc=McPCJxd7i7Ei+xOKOXYhYZgC=MYYFwyn2zAjStQov91fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMRc=McPCJxd7i7Ei+xOKOXYhYZgC=MYYFwyn2zAjStQov91fw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 17/01/19 7:31 PM, Bartosz Golaszewski wrote:
> czw., 17 sty 2019 o 13:42 Sekhar Nori <nsekhar@ti.com> napisał(a):
>>
>> On 16/01/19 2:48 PM, Sekhar Nori wrote:
>>> On 14/01/19 10:09 PM, Bartosz Golaszewski wrote:
>>>> pon., 14 sty 2019 o 13:20 Sekhar Nori <nsekhar@ti.com> napisał(a):
>>>>>
>>>>> Hi Bartosz,
>>>>>
>>>>> On 11/01/19 10:51 PM, Bartosz Golaszewski wrote:
>>>>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>>>>
>>>>>> Currently the clocksource and clockevent support for davinci platforms
>>>>>> lives in mach-davinci. It hard-codes many things, used global variables,
>>>>>> implements functionalities unused by any platform and has code fragments
>>>>>> scattered across many (often unrelated) files.
>>>>>>
>>>>>> Implement a new, modern and simplified timer driver and put it into
>>>>>> drivers/clocksource. We still need to support legacy board files so
>>>>>> export a config structure and a function that allows machine code to
>>>>>> register the timer.
>>>>>>
>>>>>> We don't check the return values of regmap reads and writes since with
>>>>>> mmio it's only likely to fail due to programmer's errors.
>>>>>>
>>>>>> We also don't bother freeing resources on errors in
>>>>>> davinci_timer_register() as the system won't boot without a timer anyway.
>>>>>>
>>>>>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>>>
>>>>> With this series, DA830 fails to boot. Rest of the devices are okay from
>>>>> boot perspective.
>>>>>
>>>>> DA830 is pretty unique because it uses the same timer-half for both
>>>>> clocksource and clockevent. May be you can set the same configuration on
>>>>> your DA850 to see the same issue? Else, I will enable low-level debug
>>>>> and try to provide more debug data.
>>>>>
>>>>
>>>> I can't boot da850 with the same config as da830 (0x60 compare
>>>> register, compare irq 74) even with the old timer code. Just to make
>>>> sure: does da830 boot fine with mainline v5.0-rc2?
>>>
>>> Yeah, I did check that without the patch DA830 does boot.
>>
>> You are right that DA850 lacks compare interrupts for timers 0 and 1.
>> So, yes, it seems like we will have to shift to timer2 to test
>> compare interrupts on DA850.
>>
> 
> Timers 2 and 3 are a bit different on da850 - for instance they don't
> have separate interrupts for bottom and top halfs.

We should only be using the compare feature which has a a separate
interrupt (distinct from top and bottom half interrupts). Only timer 2
and 3 of DA850 have the compare interrupts though. So you will have to
use those timers to be able to test compare feature on DA850.

> 
> I configured the old code to use timer 2 - bottom half only with
> compare register 0x60 and compare intterupt 74. It boots although very
> slowly and something's broken with timekeeping as the clock goes
> backwards and forward (seemingly) randomly.

Ah, okay. Timer 2/3 use ASYNC3 as clock input instead of PLL0_AUXCLK.
Did you make adjustment for this too?

> 
> Kevin has an OMAP-L137 starter kit - is this the same as da830-evm? If

Yes.

> so, then I can get remote access to it and work on this problem.
> Otherwise, I can prepare something that works on da850 with broken
> timekeeping and let you see if it works correctly on da830.

Alright, happy to test.

Thanks,
Sekhar
