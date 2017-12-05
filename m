From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v8 0/6] stm32 clocksource driver rework
Date: Tue, 5 Dec 2017 11:15:05 +0100
Message-ID: <1f3d581f-e001-5011-829e-bf79e2f639a7@linaro.org>
References: <1510649563-22975-1-git-send-email-benjamin.gaignard@linaro.org>
 <dcff2fd0-58ca-51bb-ea2d-dfd1c5ca0cc3@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dcff2fd0-58ca-51bb-ea2d-dfd1c5ca0cc3@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, mcoquelin.stm32@gmail.com, tglx@linutronix.de, ludovic.barre@st.com, julien.thierry@arm.com, sudeep.holla@arm.com, arnd@arndb.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05/12/2017 11:12, Alexandre Torgue wrote:
[ ... ]

>> Benjamin Gaignard (6):
>>    clocksource: timer_of: rename timer_of_exit to timer_of_cleanup
>>    clocksource: stm32: convert driver to timer_of
>>    clocksource: stm32: increase min delta value
>>    clocksource: stm32: only use 32 bits timers
>>    clocksource: stm32: add clocksource support
>>    arm: dts: stm32: remove useless clocksource nodes
>>
>>   arch/arm/boot/dts/stm32f429.dtsi  |  32 -----
>>   arch/arm/boot/dts/stm32f746.dtsi  |  32 -----
>>   drivers/clocksource/Kconfig       |   1 +
>>   drivers/clocksource/timer-of.c    |   9 +-
>>   drivers/clocksource/timer-of.h    |   2 +-
>>   drivers/clocksource/timer-stm32.c | 242
>> ++++++++++++++++++++------------------
>>   6 files changed, 138 insertions(+), 180 deletions(-)
>>
> 
> What is the status of this patch-set ? Is there a chance to have it for
> v4.16 ?

I will take care of reviewing them this week. It is in my todo list.


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
