From: Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH 1/3] gpio: mpc8xxx: Enable port input and interrupt
Date: Wed, 29 May 2019 16:53:52 -0500
Message-ID: <CADRPPNRTf6ooaJJDkO8xa9qhJhh1ZaQ5crRDX7sLaSV0CoRVyg@mail.gmail.com>
References: <20190529083254.39581-1-chuanhua.han@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529083254.39581-1-chuanhua.han@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chuanhua Han <chuanhua.han@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, bgolaszewski@baylibre.com, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, Zhang Ying-22455 <ying.zhang22455@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 29, 2019 at 3:33 AM Chuanhua Han <chuanhua.han@nxp.com> wrote:
>
> The GPIO Input Buffer Enable register is used to control the input
> enable of each individual GPIO port. When an individual GPIO port's
> direction is set to input (GPIO_GPDIR[DRn=0]), the associated
> input enable must be set (GPIOxGPIE[IEn]=1) to propagate the port
> value to the GPIO Data Register.

I cannot relate what you are saying here with the code you changed.

>
> This patch enable port input and interrupt.

NACK

Why do we need to unmask all the interrupts by default?  The correct
behavior is that all interrupts masked until they are actually
requested.

>
> Signed-off-by: Zhang Ying-22455 <ying.zhang22455@nxp.com>
> Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
> ---
>  drivers/gpio/gpio-mpc8xxx.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index c8673a5d9412..555e0e7957d9 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -373,9 +373,10 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>         if (!mpc8xxx_gc->irq)
>                 return 0;
>
> -       /* ack and mask all irqs */
> +       /* ack and enable irqs */
>         gc->write_reg(mpc8xxx_gc->regs + GPIO_IER, 0xffffffff);
> -       gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR, 0);
> +       gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR, 0xffffffff);
> +       gc->write_reg(mpc8xxx_gc->regs + GPIO_ICR2, 0xffffffff);
>
>         irq_set_chained_handler_and_data(mpc8xxx_gc->irqn,
>                                          mpc8xxx_gpio_irq_cascade, mpc8xxx_gc);
> --
> 2.17.1
>
