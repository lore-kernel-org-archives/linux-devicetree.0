From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] pinctrl: Allow a device to indicate when to force a
 state
Date: Fri, 22 Sep 2017 14:20:11 +0100
Message-ID: <20170922132011.wssbhnsggteffgte@localhost.localdomain>
References: <20170921010421.7467-1-f.fainelli@gmail.com>
 <20170921010421.7467-2-f.fainelli@gmail.com>
 <CACRpkdbVs1b0y91xWtb+8EwcDnkeLd4jbcZnWFnzOytmCLvDXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbVs1b0y91xWtb+8EwcDnkeLd4jbcZnWFnzOytmCLvDXw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, ext Tony Lindgren <tony@atomide.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Al Cooper <alcooperx@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 22, 2017 at 01:55:22PM +0200, Linus Walleij wrote:
> On Thu, Sep 21, 2017 at 3:04 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> 
> > It may happen that a device needs to force applying a state, e.g:
> > because it only defines one state of pin states (default) but loses
> > power/register contents when entering low power modes. Add a
> > pinctrl_dev::flags bitmask to help describe future quirks and define
> > PINCTRL_FLG_FORCE_STATE as such a settable flag.
> >

Is the intention here to have this as a hint to the driver that
it needs to restore the state, or as something the core will act
upon and restore the state for you?

> > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> But I'm uncertain about the design.
> 
> A while back, I applied this patch to the GPIO subsystem:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/include/linux/gpio/machine.h?id=05f479bf7d239f01ff6546f2bdeb14ad0fe65601
> 
> commit 05f479bf7d239f01ff6546f2bdeb14ad0fe65601
> Author: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> Date:   Tue May 23 15:47:29 2017 +0100
> 
>     gpio: Add new flags to control sleep status of GPIOs
> 
>     Add new flags to allow users to specify that they are not concerned with
>     the status of GPIOs whilst in a sleep/low power state.
> 
>     Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
>     Acked-by: Rob Herring <robh@kernel.org>
>     Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
> index c0d712d22b07..13adadf53c09 100644
> --- a/include/linux/gpio/machine.h
> +++ b/include/linux/gpio/machine.h
> @@ -9,6 +9,8 @@ enum gpio_lookup_flags {
>         GPIO_ACTIVE_LOW = (1 << 0),
>         GPIO_OPEN_DRAIN = (1 << 1),
>         GPIO_OPEN_SOURCE = (1 << 2),
> +       GPIO_SLEEP_MAINTAIN_VALUE = (0 << 3),
> +       GPIO_SLEEP_MAY_LOOSE_VALUE = (1 << 3),
>  };
> 
> Charles is also working on pin control and will probably have some
> input on design.
> 
> Maybe we could do the same: a flag to maintain the value and
> a flag to allow it to be lost across suspend/resume, which is the
> core issue here.
> 
> Your case is analogous to GPIO_SLEEP_MAY_LOOSE_VALUE
> and you restore the state when you come back from sleep.

I am not sure these are strictly analogous, my patch is about
the consumer of the GPIO specifying if it can tolerate the state
being dropped whilst in suspend. Whereas this patch appears to be
concerned with whether the state of the controller needs restored
on resume.

I guess in our case we didn't really consider the restore aspect
because we essentially get that for free from regmap. Regmap
cache's all our register state and provides a mechanism to sync
that back to the hardware, so we simply invoke that on resume and
all our GPIO/pinctrl state is restored.

> Next point, this commit from Baolin:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt?id=6606bc9dee63ad8cda2cc310d2ad5992673a785a
> 
> output-low - set the pin to output mode with low level
> output-high - set the pin to output mode with high level
> +sleep-hardware-state - indicate this is sleep related state which
> will be programmed
> + into the registers for the sleep state.
> slew-rate - set the slew rate
> 
> This is another thing: here we are defining a state that will be managed
> by autonomous hardware. The state settings will be poked into some
> special registers that will automatically take effect when the system
> goes into sleep.
> 
> This is a hardware-induced state: the SLEEP line for the entire SoC
> is asserted.
> 

Just to make sure I understand this property is used to specify a
pinctrl state that will be automatically applied by the hardware when
entering suspend? Kind of an odd one, feels like something you
could just have the software apply as part of the suspend
process. Almost would have wondered should this be a driver
specific binding rather than a generic pinctrl one?

I guess from looking at the driver using this I assume that said
hardware also automatically replies the non-sleep settings on
resume?

> What you want is something different: a flag like:
> 
> sleep-restore-state - indicate that this state needs to be restored after sleep
>   as the hardware loose states when sleeping.
> 
> The driver could look for this in a more granular per-state manner, instead
> of all states of the pin controller being restored, we mark what
> states need to be restored on the way up after sleep.
> 
> What are your thoughts about this?
> 
> I do not rule out a global flag for the whole controller, it is just a bit
> confusing if we start to have per-state, per-pin and per-controller
> sleep behaviour. If we have to have this we have to, but I want to
> fully understand the problem first.
> 
> Yours,
> Linus Walleij

Thanks,
Charles
