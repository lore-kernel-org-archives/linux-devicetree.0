From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: Allow a device to indicate when to force a
 state
Date: Mon, 25 Sep 2017 12:18:46 -0700
Message-ID: <d6320101-d8a8-636c-83e9-a7c653c07ef3@gmail.com>
References: <20170921010421.7467-1-f.fainelli@gmail.com>
 <20170921010421.7467-2-f.fainelli@gmail.com>
 <CACRpkdbVs1b0y91xWtb+8EwcDnkeLd4jbcZnWFnzOytmCLvDXw@mail.gmail.com>
 <20170922132011.wssbhnsggteffgte@localhost.localdomain>
 <CACRpkdbkSE6jckE9HekQZg=nAd6e91Uv7CwGEdPy24YyoQcnog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbkSE6jckE9HekQZg=nAd6e91Uv7CwGEdPy24YyoQcnog@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, ext Tony Lindgren <tony@atomide.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Al Cooper <alcooperx@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

On 09/22/2017 06:57 AM, Linus Walleij wrote:
> On Fri, Sep 22, 2017 at 3:20 PM, Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
>> On Fri, Sep 22, 2017 at 01:55:22PM +0200, Linus Walleij wrote:
> 
>>> Next point, this commit from Baolin:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt?id=6606bc9dee63ad8cda2cc310d2ad5992673a785a
>>>
>>> output-low - set the pin to output mode with low level
>>> output-high - set the pin to output mode with high level
>>> +sleep-hardware-state - indicate this is sleep related state which
>>> will be programmed
>>> + into the registers for the sleep state.
>>> slew-rate - set the slew rate
>>>
>>> This is another thing: here we are defining a state that will be managed
>>> by autonomous hardware. The state settings will be poked into some
>>> special registers that will automatically take effect when the system
>>> goes into sleep.
>>>
>>> This is a hardware-induced state: the SLEEP line for the entire SoC
>>> is asserted.
>>>
>>
>> Just to make sure I understand this property is used to specify a
>> pinctrl state that will be automatically applied by the hardware when
>> entering suspend?
> 
> Yes. It is quite common in SoCs, we just never supported it properly.

This appears to be solving another possible problem/feature with pin
controllers during suspend, which is not exactly what I am after here.

Unless we generalize this into a state of some kind, which would
de-facto force a state transition in pinctrl_select_state() because
p->default != state, then I am not sure this how that is related to the
problem space exposed earlier.

> 
>> Kind of an odd one, feels like something you
>> could just have the software apply as part of the suspend
>> process.
> 
> Not really. It has special registers just for this purpose,
> and the driver is completely unaware that sleep is happening,
> instead it is driven to the hardware by special hardware sleep
> lines inside the SoC. So it needs to be set up when the default
> state is programmed.
> 
>> Almost would have wondered should this be a driver
>> specific binding rather than a generic pinctrl one?
> 
> No, I've seen it in several hardwares. (The Nomadik pin controller
> has this too.)
> 
>> I guess from looking at the driver using this I assume that said
>> hardware also automatically replies the non-sleep settings on
>> resume?
> 
> Yep.
> 
> Yours,
> Linus Walleij
> 


-- 
Florian
