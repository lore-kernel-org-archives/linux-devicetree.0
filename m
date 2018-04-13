From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 2/2] mfd: intel_quark_i2c_gpio: Update Synopsys GPIO interrupts
Date: Fri, 13 Apr 2018 10:20:19 +0200
Message-ID: <CAMuHMdVKi=dDvn29U-S26PtAc_Um_+1Oy=PzKAgYUSU9qvcF-Q@mail.gmail.com>
References: <1523606900-2332-1-git-send-email-phil.edworthy@renesas.com> <1523606900-2332-3-git-send-email-phil.edworthy@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523606900-2332-3-git-send-email-phil.edworthy@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Hoan Tran <hotran@apm.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Phil,

On Fri, Apr 13, 2018 at 10:08 AM, Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> Since the way the Synopsys GPIO interrupts are stored has changed, this
> driver needs to be updated in line with the changes.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> ---
> v2:
>  - New patch in v2 to fix the only other user of struct dwapb_port_property.

Thanks for your patch!

To avoid bisection compile failures due to the changed type of
dwapb_port_property.irq,
I think this should be folded into the first patch,

> ---
>  drivers/mfd/intel_quark_i2c_gpio.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mfd/intel_quark_i2c_gpio.c b/drivers/mfd/intel_quark_i2c_gpio.c
> index 90e35de..5bddb84 100644
> --- a/drivers/mfd/intel_quark_i2c_gpio.c
> +++ b/drivers/mfd/intel_quark_i2c_gpio.c
> @@ -233,7 +233,8 @@ static int intel_quark_gpio_setup(struct pci_dev *pdev, struct mfd_cell *cell)
>         pdata->properties->idx          = 0;
>         pdata->properties->ngpio        = INTEL_QUARK_MFD_NGPIO;
>         pdata->properties->gpio_base    = INTEL_QUARK_MFD_GPIO_BASE;
> -       pdata->properties->irq          = pdev->irq;
> +       pdata->properties->irq[0]       = pdev->irq;
> +       pdata->properties->has_irq      = true;
>         pdata->properties->irq_shared   = true;
>
>         cell->platform_data = pdata;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
