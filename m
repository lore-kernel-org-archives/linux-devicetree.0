From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: uniphier: add UniPhier GPIO controller driver
Date: Thu, 31 Aug 2017 15:41:49 +0200
Message-ID: <CACRpkdYG3BFhhpouwAkQN+x0YpC5EhsVhTkqyuNdRd26Ne-r9A@mail.gmail.com>
References: <1503418601-9728-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503418601-9728-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Marc Zyngier <marc.zyngier@arm.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 22, 2017 at 6:16 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> This GPIO controller device is used on UniPhier SoCs.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Changes in v3:
>   - Add .irq_set_affinity() hook
>   - Use irq_domain_create_hierarchy() instead of legacy
>     irq_domain_add_hierarchy().

This is getting better and better.

> +static const u32 uniphier_gpio_irq_parent_hwirqs[] = {
> +       48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63,
> +       154, 155, 156, 157, 158, 217, 218, 219,
> +};

This array which is used when allocating the hierarchical domain
looks like configuration data. Why is it not in the device tree?

Yours,
Linus Walleij
