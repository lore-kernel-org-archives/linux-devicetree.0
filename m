From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: Allow a device to indicate when to force a
 state
Date: Tue, 26 Sep 2017 10:51:14 -0700
Message-ID: <61d19678-e90c-3b3a-099a-81200873edc8@gmail.com>
References: <20170921010421.7467-1-f.fainelli@gmail.com>
 <20170921010421.7467-2-f.fainelli@gmail.com>
 <CACRpkdbVs1b0y91xWtb+8EwcDnkeLd4jbcZnWFnzOytmCLvDXw@mail.gmail.com>
 <20170922132011.wssbhnsggteffgte@localhost.localdomain>
 <dbd6df33-0af4-7014-bc46-3378c1346726@gmail.com>
 <20170926141628.h27hcrujzhxu4sph@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170926141628.h27hcrujzhxu4sph@localhost.localdomain>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, ext Tony Lindgren <tony@atomide.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Al Cooper <alcooperx@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

On 09/26/2017 07:16 AM, Charles Keepax wrote:
> On Fri, Sep 22, 2017 at 09:57:22AM -0700, Florian Fainelli wrote:
>> On 09/22/2017 06:20 AM, Charles Keepax wrote:
>>> On Fri, Sep 22, 2017 at 01:55:22PM +0200, Linus Walleij wrote:
>>>> On Thu, Sep 21, 2017 at 3:04 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
>>> I guess in our case we didn't really consider the restore aspect
>>> because we essentially get that for free from regmap. Regmap
>>> cache's all our register state and provides a mechanism to sync
>>> that back to the hardware, so we simply invoke that on resume and
>>> all our GPIO/pinctrl state is restored.
>>
>> As you may see, the problem in my case is that the hardware has only onw
>> pinctrl state: "default", and it loses its hardware register contents,
>> and because of early check in pinctrl_select_state(), we do nothing (the
>> state has not changed per-se), so we are left with SW thinking we
>> applied the "default" state again, while in fact we did not.
>>
> 
> That is exactly the situation we have on the CODECs when they go
> into runtime suspend, power is removed, and everything is back at
> defaults when we resume. Just in our case we re-apply the state
> as part of the CODEC resume using a regmap sync.

Do you just re-apply the previous state, or do you force a "fake" state
by moving to a state different than the current during suspend, just to
force a transition during resume?

> 
>> The approach taken here was to move this to the core pinctrl code
>> because this is not something a pinctrl consumer should be aware of,
>> when it calls pinctrl_select_state(), it should do what it asked for.
>>
> 
> Apologies if I have missed something here, but does the consumer
> not still to some extent need to be aware with this solution
> since it needs to re-request the pin state in resume?

Consumers may indeed have to call pinctrl_select_state() but because of
the current check that does:

if (p->state == state)

this is not happening, but you are absolutely right, consumers that wish
to see their pin state be (re)configured during driver resume absolutely
need to tell the core about it, I am not thinking about any of this
happening "under the hood", this absolutely would not be right.

> 
> I think that is really my only reservation here, is it feels
> like this should be something that is purely implemented on the
> provider, and be invisible to the consumer, and I am not clear
> this is.
> 
>> I also decided to make this a per-provider property as opposed to a
>> per-group property because chances are that the state retention is on a
>> per-controller basis, and not per-bank/group, although I may be wrong.
>>
> 
> It seems quite likely that this property would mostly be
> per-provider to me as well.
> 
> Thanks,
> Charles
> 


-- 
Florian
