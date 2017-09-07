From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v4 0/6] irqdomain, gpio: expand irq_domain_push_irq() for
 DT use and use it for GPIO
Date: Thu, 7 Sep 2017 13:39:11 +0100
Message-ID: <b0f7495b-3b51-a75f-2a29-bbcd86eacb53@arm.com>
References: <1504784522-26841-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1504784522-26841-1-git-send-email-yamada.masahiro@socionext.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Masami Hiramatsu <mhiramat@kernel.org>, David Daney <david.daney@cavium.com>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 07/09/17 12:41, Masahiro Yamada wrote:
> 
> This series adds a GPIO controller for UniPhier SoC family.
> It also works as an irqchip in hierarchy domain manner.
> 
> My problem is mapping of IRQ from this controller to the parent
> irqchip is not contiguous.
> 
>   IRQ line of GPIO  --->  Parent interrupt
>         0           --->     48
>         1           --->     49
>                 ...
>         15          --->     63
>         16          --->    154
>         17          --->    155
>                 ...
>         20          --->    158
>         21          --->    217
>         22          --->    218
>                 ...
> 
> So, I need to have an array of parent hwirqs somehow.
> 
> Probably, most of people will try to use "interrupts" DT property,
> but I noticed a potential problem for hierarchy IRQ domain.
> If "interrupts" property exists in the device node, IRQ resource
> may be statically allocated when platform devices are populated
> from DT.  I asked this question some time ago:
> https://lkml.org/lkml/2017/7/6/758
> 
> After I tackled this, I decided to put the array in the driver,
> but I could not get a positive response for this.
> The discussion mostly happened in v1 thread:
> http://patchwork.ozlabs.org/patch/797145/
> 
> Recently, the new API irq_domain_push_irq() was merged in the
> mainline.  I thought this might be useful to solve the hierarchy
> domain issue.  Hence, here is a trial.
> 
> I found patch 2 is needed to avoid "type mismatch" error.
> 
> One more thing, I am worried about a race condition.
> 
> I think there is a possibility where a device tries to get IRQ
> after irq_domain_create_hierarchy(), but before irq_domain_push_irq().
> 
> 	priv->domain = irq_domain_create_hierarchy(...)
> 	if (!priv->domain)
> 		return -ENOMEM;
> 
>         [  *** What if a irq consumer device request the irq here? *** ]

We've explicitly forbidden such a use case. There is a (not exactly fool
proof) check in irq_domain_push_irq(), but it is pretty easy to bypass
it. "Don't do it" is the conclusion we reached with David Daney.

If you don't want these interrupts to be requested, you might as well
flag them as IRQ_NOREQUEST, and unflag them when the hierarchy is ready.

Would that work for you?

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
