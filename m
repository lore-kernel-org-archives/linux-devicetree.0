From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 02/12] pinctrl: Add core pinctrl support for Aspeed SoCs
Date: Thu, 11 Aug 2016 10:41:16 +0200
Message-ID: <CACRpkdZ0p+jNHBV1AqhVWQ2Q8RRrHVfsAz3XU3_+f6My22=Zxg@mail.gmail.com>
References: <1468994313-13538-1-git-send-email-andrew@aj.id.au>
 <1468994313-13538-3-git-send-email-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1468994313-13538-3-git-send-email-andrew@aj.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jeremy Kerr <jk@ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 20, 2016 at 7:58 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> --- a/arch/arm/mach-aspeed/Kconfig
> +++ b/arch/arm/mach-aspeed/Kconfig
> @@ -5,6 +5,7 @@ menuconfig ARCH_ASPEED
>         select WATCHDOG
>         select ASPEED_WATCHDOG
>         select MOXART_TIMER
> +       select PINCTRL
>         help
>           Say Y here if you want to run your kernel on an ASpeed BMC SoC.

This needs to be a separate patch sent to the ARM SoC tree.
I don't like to merge patches to other subsystems if it can be
avoided.

> +static inline void aspeed_sig_desc_print_val(
> +               const struct aspeed_sig_desc *desc, bool enable, u32 rv)
> +{
> +#if defined(CONFIG_DEBUG_PINCTRL)
> +       pr_debug("SCU%x[0x%08x]=0x%x, got 0x%x from 0x%08x\n", desc->reg,
> +                       desc->mask, enable ? desc->enable : desc->disable,
> +                       (rv & desc->mask) >> __ffs(desc->mask), rv);
> +#endif
> +}

You can just use pr_debug(). CONFIG_DEBUG_PINCTRL enables
DEBUG_KERNEL which activates debug prints so this is a truism.

> +static bool aspeed_sig_desc_eval(const struct aspeed_sig_desc *desc,
> +               bool enabled, struct regmap *map)
> +static bool aspeed_sig_expr_eval(const struct aspeed_sig_expr *expr,
> +               bool enabled, struct regmap *map)

These need kerneldoc too, they are kind of hard to understand.

> +static bool aspeed_gpio_in_exprs(const struct aspeed_sig_expr **exprs)
> +{
> +       if (!exprs)
> +               return false;
> +
> +       while (*exprs) {
> +               if (strncmp((*exprs)->signal, "GPIO", 4) == 0)
> +                       return true;

This looks a bit fragile and hard to debug. Do you have some better
idea of how to do this but not resort to string comparison?

Apart from that it looks pretty alright, complex but such is life
with complex hardware.

Yours,
Linus Walleij
