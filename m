From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: Allow a device to indicate when to force a
 state
Date: Fri, 22 Sep 2017 09:57:22 -0700
Message-ID: <dbd6df33-0af4-7014-bc46-3378c1346726@gmail.com>
References: <20170921010421.7467-1-f.fainelli@gmail.com>
 <20170921010421.7467-2-f.fainelli@gmail.com>
 <CACRpkdbVs1b0y91xWtb+8EwcDnkeLd4jbcZnWFnzOytmCLvDXw@mail.gmail.com>
 <20170922132011.wssbhnsggteffgte@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170922132011.wssbhnsggteffgte-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ext Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/22/2017 06:20 AM, Charles Keepax wrote:
> On Fri, Sep 22, 2017 at 01:55:22PM +0200, Linus Walleij wrote:
>> On Thu, Sep 21, 2017 at 3:04 AM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>>> It may happen that a device needs to force applying a state, e.g:
>>> because it only defines one state of pin states (default) but loses
>>> power/register contents when entering low power modes. Add a
>>> pinctrl_dev::flags bitmask to help describe future quirks and define
>>> PINCTRL_FLG_FORCE_STATE as such a settable flag.
>>>
> 
> Is the intention here to have this as a hint to the driver that
> it needs to restore the state, or as something the core will act
> upon and restore the state for you?

The intention here is to tell the pinctrl core code that a pinctrl
provider hardware will lose its hardware state upon entering a system
wide deep sleep. This is mainly because this specific pinctrl provider
is no an ON/OFF power island that is powered off on suspend, and resumes
with its default pin state.

> 
>>> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> But I'm uncertain about the design.
>>
>> A while back, I applied this patch to the GPIO subsystem:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/include/linux/gpio/machine.h?id=05f479bf7d239f01ff6546f2bdeb14ad0fe65601
>>
>> commit 05f479bf7d239f01ff6546f2bdeb14ad0fe65601
>> Author: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
>> Date:   Tue May 23 15:47:29 2017 +0100
>>
>>     gpio: Add new flags to control sleep status of GPIOs
>>
>>     Add new flags to allow users to specify that they are not concerned with
>>     the status of GPIOs whilst in a sleep/low power state.
>>
>>     Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
>>     Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>     Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
>> index c0d712d22b07..13adadf53c09 100644
>> --- a/include/linux/gpio/machine.h
>> +++ b/include/linux/gpio/machine.h
>> @@ -9,6 +9,8 @@ enum gpio_lookup_flags {
>>         GPIO_ACTIVE_LOW = (1 << 0),
>>         GPIO_OPEN_DRAIN = (1 << 1),
>>         GPIO_OPEN_SOURCE = (1 << 2),
>> +       GPIO_SLEEP_MAINTAIN_VALUE = (0 << 3),
>> +       GPIO_SLEEP_MAY_LOOSE_VALUE = (1 << 3),
>>  };
>>
>> Charles is also working on pin control and will probably have some
>> input on design.
>>
>> Maybe we could do the same: a flag to maintain the value and
>> a flag to allow it to be lost across suspend/resume, which is the
>> core issue here.
>>
>> Your case is analogous to GPIO_SLEEP_MAY_LOOSE_VALUE
>> and you restore the state when you come back from sleep.
> 
> I am not sure these are strictly analogous, my patch is about
> the consumer of the GPIO specifying if it can tolerate the state
> being dropped whilst in suspend. Whereas this patch appears to be
> concerned with whether the state of the controller needs restored
> on resume.

Your patch does seem to be tackling a different angle indeed.

> 
> I guess in our case we didn't really consider the restore aspect
> because we essentially get that for free from regmap. Regmap
> cache's all our register state and provides a mechanism to sync
> that back to the hardware, so we simply invoke that on resume and
> all our GPIO/pinctrl state is restored.

As you may see, the problem in my case is that the hardware has only onw
pinctrl state: "default", and it loses its hardware register contents,
and because of early check in pinctrl_select_state(), we do nothing (the
state has not changed per-se), so we are left with SW thinking we
applied the "default" state again, while in fact we did not.

The approach taken here was to move this to the core pinctrl code
because this is not something a pinctrl consumer should be aware of,
when it calls pinctrl_select_state(), it should do what it asked for.

I also decided to make this a per-provider property as opposed to a
per-group property because chances are that the state retention is on a
per-controller basis, and not per-bank/group, although I may be wrong.

> 
>> Next point, this commit from Baolin:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt?id=6606bc9dee63ad8cda2cc310d2ad5992673a785a
>>
>> output-low - set the pin to output mode with low level
>> output-high - set the pin to output mode with high level
>> +sleep-hardware-state - indicate this is sleep related state which
>> will be programmed
>> + into the registers for the sleep state.
>> slew-rate - set the slew rate
>>
>> This is another thing: here we are defining a state that will be managed
>> by autonomous hardware. The state settings will be poked into some
>> special registers that will automatically take effect when the system
>> goes into sleep.
>>
>> This is a hardware-induced state: the SLEEP line for the entire SoC
>> is asserted.
>>
> 
> Just to make sure I understand this property is used to specify a
> pinctrl state that will be automatically applied by the hardware when
> entering suspend? Kind of an odd one, feels like something you
> could just have the software apply as part of the suspend
> process. Almost would have wondered should this be a driver
> specific binding rather than a generic pinctrl one?
> 
> I guess from looking at the driver using this I assume that said
> hardware also automatically replies the non-sleep settings on
> resume?
> 
>> What you want is something different: a flag like:
>>
>> sleep-restore-state - indicate that this state needs to be restored after sleep
>>   as the hardware loose states when sleeping.
>>
>> The driver could look for this in a more granular per-state manner, instead
>> of all states of the pin controller being restored, we mark what
>> states need to be restored on the way up after sleep.
>>
>> What are your thoughts about this?
>>
>> I do not rule out a global flag for the whole controller, it is just a bit
>> confusing if we start to have per-state, per-pin and per-controller
>> sleep behaviour. If we have to have this we have to, but I want to
>> fully understand the problem first.
>>
>> Yours,
>> Linus Walleij
> 
> Thanks,
> Charles
> 


-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
