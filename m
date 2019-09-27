From: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] ARM: dts: stm32: Enable high resolution timer
Date: Fri, 27 Sep 2019 13:41:03 +0100
Message-ID: <ff11797da8f049b354797689754fde52@www.loen.fr>
References: <20190927084819.645-1-benjamin.gaignard@st.com>
 <da48ce9633441cd0186518fa7ce1d528@www.loen.fr>
 <341949c8-7864-5d65-2797-988022724a4c@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <341949c8-7864-5d65-2797-988022724a4c@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc: Alexandre TORGUE <alexandre.torgue@st.com>, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2019-09-27 13:36, Benjamin GAIGNARD wrote:
> On 9/27/19 1:22 PM, Marc Zyngier wrote:
>> On 2019-09-27 09:48, Benjamin Gaignard wrote:
>>> Adding always-on makes arm arch_timer claim to be an high 
>>> resolution
>>> timer.
>>> That is possible because power mode won't stop clocking the timer.
>>
>> The "always-on" is not about the clock. It is about the comparator.
>> The clock itself is *guaranteed* to always tick. If it didn't, 
>> that'd be
>> an integration bug, and a pretty bad one.
>>
>> What you're claiming here is that your CPU never enters a low-power 
>> mode?
>> Ever? I find this very hard to believe.
>>
>> Furthermore, claiming that always-on is the way to force the 
>> arch-timer
>> to be an hrtimer is factually wrong. This is what happens *if* this 
>> is
>> the only timer in the system. The only case this is true is for 
>> virtual
>> machines. Anything else has a global timer somewhere that will allow
>> the arch timers to be used as an hrtimer.
>>
>> I'm pretty sure you too have a global timer somewhere in your 
>> system.
>> Enable it, and enjoy hrtimers without having to lie about the 
>> properties
>> of your system! ;-)
>
> Hi Marc,
>
> This SoC doesn't have any other global timer. Use arch_time is the 
> only
> we have to provide hrtimer on this system.

And you don't have any form of power management either? What happens 
when
your CPU goes into idle? If your system does any form of power 
management
*and* doesn't have a separate timer, it is remarkably broken.

         M.
-- 
Jazz is not dead. It just smells funny...
