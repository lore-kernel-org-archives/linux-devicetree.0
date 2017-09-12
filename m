From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 6/6] gpio: uniphier: add UniPhier GPIO controller driver
Date: Tue, 12 Sep 2017 16:03:56 +0200
Message-ID: <CACRpkdZLG=ezxj62R=WkULh2vfpQwqh8P-6FhtONzU7yRbyeuA@mail.gmail.com>
References: <1504784522-26841-1-git-send-email-yamada.masahiro@socionext.com> <1504784522-26841-7-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1504784522-26841-7-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, David Daney <david.daney@cavium.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Masami Hiramatsu <mhiramat@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 7, 2017 at 1:42 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> This GPIO controller device is used on UniPhier SoCs.
>
> It also serves as an interrupt controller, but interrupt signals are
> just delivered to the parent irqchip without any latching or OR'ing.
> This is implemented by using hierarchy IRQ domain.
>
> Implementation note:
> Unfortunately, the IRQ mapping from this controller to the parent is
> random. (48, 49, ..., 63, 154, 155, ...)
> If "interrupts" property is used, IRQ resources may be statically
> allocated when platform devices are populated from DT.  This can be
> a problem for the hierarchy IRQ domain because IRQ allocation must
> happen from the outer-most domain up to the root domain in order to
> build up the stacked IRQ.  (https://lkml.org/lkml/2017/7/6/758)
> Solutions to work around it could be to hard-code parent hwirqs or
> to invent a driver-specific DT property.
>
> Here, the new API irq_domain_push_irq() was merged by v4.14-rc1.
> It allows to add irq_data to the existing hierarchy.  It will help
> to make this driver work whether the parent has already initialized
> the hierarchy or not.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Changes in v4:
>   - Add COMPILE_TEST and select IRQ_DOMAIN_HIERARCHY
>   - Reimplement irqchip part by using irq_domain_push_irq()

Awesome improvement. There was a build error and I also
would like David Daney to have a look at this so we know we
use things the right way, but overall I am happy after this
so I hope I will be able to apply next version.

Yours,
Linus Walleij
