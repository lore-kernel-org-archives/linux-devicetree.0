From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4] gpio: dwapb: Add support for 1 interrupt per port A GPIO
Date: Tue, 17 Apr 2018 08:04:24 -0500
Message-ID: <CAL_JsqKrBa5Rneu+BJOXd6n-xZEVqkKg4RqXHYvNs5xz7gdS2Q@mail.gmail.com>
References: <1523968977-4241-1-git-send-email-phil.edworthy@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523968977-4241-1-git-send-email-phil.edworthy@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Hoan Tran <hotran@apm.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 17, 2018 at 7:42 AM, Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> The DesignWare GPIO IP can be configured for either 1 interrupt or 1
> per GPIO in port A, but the driver currently only supports 1 interrupt.
> See the DesignWare DW_apb_gpio Databook description of the
> 'GPIO_INTR_IO' parameter.
>
> This change allows the driver to work with up to 32 interrupts, it will
> get as many interrupts as specified in the DT 'interrupts' property.
> It doesn't do anything clever with the different interrupts, it just calls
> the same handler used for single interrupt hardware.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> ---
> One point to mention is that I have made it possible for users to have
> unconncted interrupts by specifying holes in the list of interrupts. This is
> done by supporting the interrupts-extended DT prop.
> However, I have no use for this and had to hack some test case for this.
> Perhaps the driver should support 1 interrupt or all GPIOa as interrupts?
>
> v4:
>  - Use of_irq_get() instead of of_irq_parse_one()+irq_create_of_mapping()
> v3:
>  - Rolled mfd: intel_quark_i2c_gpio fix into this patch to avoid bisect problems
> v2:
>  - Replaced interrupt-mask DT prop with support for the interrupts-extended
>    prop. This means replacing the call to irq_of_parse_and_map() with calls
>    to of_irq_parse_one() and irq_create_of_mapping().
>
> Note: There are a few *code* lines over 80 chars, but this is just guidance,
>    right? Especially as there are already some lines over 80 chars.
>
> snps:gpio fix
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> ---
>  .../devicetree/bindings/gpio/snps-dwapb-gpio.txt   |  9 +++--
>  drivers/gpio/gpio-dwapb.c                          | 42 +++++++++++++++++-----
>  drivers/mfd/intel_quark_i2c_gpio.c                 |  3 +-
>  include/linux/platform_data/gpio-dwapb.h           |  3 +-
>  4 files changed, 44 insertions(+), 13 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
