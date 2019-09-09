From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/3] soc: amazon: al-pos: Introduce Amazon's Annapurna
 Labs POS driver
Date: Mon, 9 Sep 2019 11:44:13 +0200
Message-ID: <CAK8P3a3UF7xPV1U3eW6Jdu754P1bzG208UxD9KUxEm1JjZudww@mail.gmail.com>
References: <1568020220-7758-1-git-send-email-talel@amazon.com> <1568020220-7758-3-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568020220-7758-3-git-send-email-talel@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Talel Shenhar <talel@amazon.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, David Miller <davem@davemloft.net>, gregkh <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Thomas Gleixner <tglx@linutronix.de>, Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, Maxime Ripard <mripard@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, paul.kocialkowski@bootlin.com, mjourdan@baylibre.com, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, DTML <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>David
List-Id: devicetree@vger.kernel.org

On Mon, Sep 9, 2019 at 11:14 AM Talel Shenhar <talel@amazon.com> wrote:
>
> The Amazon's Annapurna Labs SoCs includes Point Of Serialization error
> logging unit that reports an error in case write error (e.g. attempt to
> write to a read only register).
> This patch introduces the support for this unit.
>
> Signed-off-by: Talel Shenhar <talel@amazon.com>

Looks ok overall, juts a few minor comments:

> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Talel Shenhar");
> +MODULE_DESCRIPTION("Amazon's Annapurna Labs POS driver");

These usually go to the end of the file.

> +       log1 = readl_relaxed(pos->mmio_base + AL_POS_ERROR_LOG_1);
> +       if (!FIELD_GET(AL_POS_ERROR_LOG_1_VALID, log1))
> +               return IRQ_NONE;
> +
> +       log0 = readl_relaxed(pos->mmio_base + AL_POS_ERROR_LOG_0);
> +       writel_relaxed(0, pos->mmio_base + AL_POS_ERROR_LOG_1);

Why do you require _relaxed() accessors here? Please add a comment
explaining that, or use the regular readl()/writel().

> +       resource = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       pos->mmio_base = devm_ioremap_resource(&pdev->dev, resource);

This can be simplified to devm_platform_ioremap_resource().

> +       pos->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);

And this is usually written as platform_get_irq()

       Arnd
