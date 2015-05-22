From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: Re: [PATCH 7/7] mips: pistachio: Allow to enable the external timer
 based clocksource
Date: Fri, 22 May 2015 15:08:45 -0300
Message-ID: <555F70AD.7060307@imgtec.com>
References: <1432244260-14908-1-git-send-email-ezequiel.garcia@imgtec.com>	<1432244618-15548-1-git-send-email-ezequiel.garcia@imgtec.com> <CAL1qeaG=LeQtSS_0w_=hXMNfG2dqTomL5hgifFXV-x1Jy9P1rw@mail.gmail.com> <72BC0C8BD7BB6F45988A99382E5FBAE5445286D0@hhmail02.hh.imgtec.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <72BC0C8BD7BB6F45988A99382E5FBAE5445286D0@hhmail02.hh.imgtec.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Hartley <James.Hartley@imgtec.com>, Andrew Bresticker <abrestic@chromium.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, James Hogan <James.Hogan@imgtec.com>, Thomas Gleixner <tglx@linutronix.de>, Damien Horsley <Damien.Horsley@imgtec.com>, Govindraj Raja <Govindraj.Raja@imgtec.com>
List-Id: devicetree@vger.kernel.org



On 05/22/2015 01:58 PM, James Hartley wrote:
> 
> 
>> -----Original Message-----
>> From: abrestic@google.com [mailto:abrestic@google.com] On Behalf Of
>> Andrew Bresticker
>> Sent: 22 May 2015 17:50
>> To: Ezequiel Garcia
>> Cc: linux-kernel@vger.kernel.org; Linux-MIPS; Daniel Lezcano;
>> devicetree@vger.kernel.org; James Hartley; James Hogan; Thomas Gleixner;
>> Damien Horsley; Govindraj Raja
>> Subject: Re: [PATCH 7/7] mips: pistachio: Allow to enable the external timer
>> based clocksource
>>
>> On Thu, May 21, 2015 at 2:43 PM, Ezequiel Garcia
>> <ezequiel.garcia@imgtec.com> wrote:
>>> This commit introduces a new config, so the user can choose to enable
>>> the General Purpose Timer based clocksource. This option is required
>>> to have CPUFreq support.
>>>
>>> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
>>> ---
>>>  arch/mips/Kconfig           |  1 +
>>>  arch/mips/pistachio/Kconfig | 13 +++++++++++++
>>>  2 files changed, 14 insertions(+)
>>>  create mode 100644 arch/mips/pistachio/Kconfig
>>>
>>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig index
>>> f501665..91f6ca0 100644
>>> --- a/arch/mips/Kconfig
>>> +++ b/arch/mips/Kconfig
>>> @@ -934,6 +934,7 @@ source "arch/mips/jazz/Kconfig"
>>>  source "arch/mips/jz4740/Kconfig"
>>>  source "arch/mips/lantiq/Kconfig"
>>>  source "arch/mips/lasat/Kconfig"
>>> +source "arch/mips/pistachio/Kconfig"
>>>  source "arch/mips/pmcs-msp71xx/Kconfig"
>>>  source "arch/mips/ralink/Kconfig"
>>>  source "arch/mips/sgi-ip27/Kconfig"
>>> diff --git a/arch/mips/pistachio/Kconfig b/arch/mips/pistachio/Kconfig
>>> new file mode 100644 index 0000000..97731ea
>>> --- /dev/null
>>> +++ b/arch/mips/pistachio/Kconfig
>>> @@ -0,0 +1,13 @@
>>> +config PISTACHIO_GPTIMER_CLKSRC
>>> +       bool "Enable General Purpose Timer based clocksource"
>>> +       depends on MACH_PISTACHIO
>>> +       select CLKSRC_PISTACHIO
>>> +       select MIPS_EXTERNAL_TIMER
>>
>> Why not just select these in the MACH_PISTACHIO Kconfig entry?  Is there any
>> harm in always having the Pistachio GPT enabled?
> 
> It does mean that there are less GPT's available for other users, and whilst I'm not aware of any use cases that currently require all 4, perhaps having the flexibility is worth it.
> 

And also, this is only useful if the user wants CPUFreq. Otherwise we
have MIPS GIC and R4K for clockevents and clocksource. Not sure why we'd
want another one.

-- 
Ezequiel
