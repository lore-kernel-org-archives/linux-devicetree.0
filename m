From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 2/2] irqchip/meson-gpio: Add support for meson sm1 SoCs
Date: Thu, 29 Aug 2019 11:43:59 -0700
Message-ID: <7h1rx3revk.fsf@baylibre.com>
References: <20190829161635.25067-1-jbrunet@baylibre.com> <20190829161635.25067-3-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829161635.25067-3-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> The meson sm1 SoCs uses the same type of GPIO interrupt controller IP
> block as the other meson SoCs, A total of 100 pins can be spied on:
>
> - 223:100 undefined (no interrupt)
> - 99:97   3 pins on bank GPIOE
> - 96:77   20 pins on bank GPIOX
> - 76:61   16 pins on bank GPIOA
> - 60:53   8 pins on bank GPIOC
> - 52:37   16 pins on bank BOOT
> - 36:28   9 pins on bank GPIOH
> - 27:12   16 pins on bank GPIOZ
> - 11:0    12 pins in the AO domain
>
> Mapping is the same as the g12a family but the sm1 controller
> allows to trig an irq on both edges of the input signal. This was
> not possible with the previous SoCs families
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/irqchip/irq-meson-gpio.c | 52 +++++++++++++++++++++++---------
>  1 file changed, 38 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
> index dcdc23b9dce6..829084b568fa 100644
> --- a/drivers/irqchip/irq-meson-gpio.c
> +++ b/drivers/irqchip/irq-meson-gpio.c
> @@ -24,14 +24,25 @@
>  #define REG_PIN_47_SEL	0x08
>  #define REG_FILTER_SEL	0x0c
>  
> -#define REG_EDGE_POL_MASK(x)	(BIT(x) | BIT(16 + (x)))
> +/*
> + * Note: The S905X3 datasheet reports that BOTH_EDGE is controlled by
> + * bits 24 to 31. Tests on the actual HW show that these bits are
> + * stuck at 0. Bits 8 to 15 are responsive and have the expected
> + * effect.
> + */

nice catch!

Kevin
