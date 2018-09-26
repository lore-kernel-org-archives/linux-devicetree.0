From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/2] GPIO: add single-register GPIO via CREG driver
Date: Wed, 26 Sep 2018 09:18:21 +0200
Message-ID: <CACRpkdawC77DMggf1ye1=tXUDbzBqWfw9=OVV5w49Aip6cKGug@mail.gmail.com>
References: <20180911150925.19460-1-Eugeniy.Paltsev@synopsys.com> <20180911150925.19460-2-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180911150925.19460-2-Eugeniy.Paltsev@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eugeniy.Paltsev@synopsys.com
Cc: "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Eugeniy,

sorry for the delay, the driver is different from what I'm
used to so I needed focuses attention and it took some time.

On Tue, Sep 11, 2018 at 5:09 PM Eugeniy Paltsev
<Eugeniy.Paltsev@synopsys.com> wrote:

> Add single-register MMIO GPIO driver for complex cases where
> only several fields in register belong to GPIO lines and each GPIO
> line owns a field with different length and on/off value.
>
> Such CREG GPIOs are used in Synopsys AXS10x and HSDK boards.
>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
> Changes v2->v3:
>  * Move parameters into a lookup table instead of device tree.
>  * Use the ngpios attribute for instead of snps,ngpios.

This is looking good! Just a few small things I want you to fix
(we can certainly queue this for the next kernel):

> +#include <linux/of.h>
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <linux/of_gpio.h>

Replace this with:
#include <linux/gpio/driver.h>

Drivers should only need to include that file. (Also move away from
mm_gpio_chip as per below.)

> +#include "gpiolib.h"

Why?

> +struct creg_gpio {
> +       struct of_mm_gpio_chip mmchip;

I would prefer to move away from using this. Just create a regular driver
please. Just struct gpio_chip and add a member
void __iomem *base; instead of referring to mmchip.regs.

In fact I want to rewrite all mm_gpio_chips but I just haven't had time.

> +static void creg_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)

Please rename the variable "gpio" to "offset".

This is clearer because "gpio" becomes quite ambigous.

> +static int creg_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
> +{
> +       return 0; /* output */
> +}

I think with the recent code changes in gpiolib you do not need to define
this function at all.
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?h=devel&id=ae9847f48a4b4bff0335da20be63ac84d94eb54c

> +static int creg_gpio_xlate(struct gpio_chip *gc,
> +                          const struct of_phandle_args *gpiospec, u32 *flags)
> +{
> +       if (gpiospec->args_count != 1) {
> +               dev_err(&gc->gpiodev->dev, "invalid args_count: %d\n",
> +                       gpiospec->args_count);
> +               return -EINVAL;
> +       }
> +
> +       if (gpiospec->args[0] >= gc->ngpio) {
> +               dev_err(&gc->gpiodev->dev, "gpio number is too big: %d\n",
> +                       gpiospec->args[0]);
> +               return -EINVAL;
> +       }
> +
> +       return gpiospec->args[0];
> +}

Another reason to not use mm_gpio_chip: just rely on standard twocell
translation and you can delete this.

> +       /* Check that we suit in 32 bit register */

s/suit/fit

Yours,
Linus Walleij
