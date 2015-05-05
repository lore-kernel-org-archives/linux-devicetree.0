From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/2] pinctrl: Add driver for Alphascale asm9260 pinctrl
Date: Tue, 5 May 2015 17:12:06 +0200
Message-ID: <CACRpkdakXbHL6ydeZrs4XZ9Z1odHL5bWRxiHtT_Jbg-ygTudgw@mail.gmail.com>
References: <1428306169.634.51.camel@x220>
	<1428311043-12012-1-git-send-email-linux@rempel-privat.de>
	<1428311043-12012-2-git-send-email-linux@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428311043-12012-2-git-send-email-linux@rempel-privat.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 6, 2015 at 11:04 AM, Oleksij Rempel <linux@rempel-privat.de> wrote:

> This patch adds driver for Alphascale asm9260 pinctrl support.
> Alphascale asm9260t is SoC based on ARM926EJ (240MHz) in LQFP176 package.
> On silicon are:
> - 32MB SDRAM
> - USB2.0 HS/OTG
> - 2x CAN
> - SD/MMC
> - 5x Times/PWM
> - 10x USART
> - 24-channel DMA
> - 2x i2c
> - 2x SPI
> - Quad SPI
> - 10/100 Ethernet MAC
> - Camera IF
> - WD
> - RTC
> - i2s
> - GPIO
> - 12-bit A/D
> - LCD IF
> - 8-channel 12-bit ADC
> - NAND
>
> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>

Nice.

> +#define MUX_TABLE_SIZE         ARRAY_SIZE(asm9260_mux_table)
> +struct asm9260_pmx_priv {
> +       struct device           *dev;
> +       struct pinctrl_dev      *pctl;
> +       void __iomem            *iobase;
> +
> +       struct clk              *clk;
> +       spinlock_t              lock;
> +
> +       struct pinctrl_pin_desc pin_desc[MUX_TABLE_SIZE];
> +};
> +
> +static void __init asm9260_init_mux_pins(struct asm9260_pmx_priv *priv)
> +{
> +       unsigned int i;
> +
> +       for (i = 0; i < MUX_TABLE_SIZE; i++) {
> +               priv->pin_desc[i].name = asm9260_mux_table[i].name;
> +               priv->pin_desc[i].number = asm9260_mux_table[i].number;
> +       }
> +}

What is the point of copying this data from one array to the other?

Just reference the statically defined array by a pointer instead,
this just takes up a lot o memory for no reason.

> +/* each GPIO pin has it's own pseudo pingroup containing only itself */
> +static int asm9260_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
> +{
> +       return MUX_TABLE_SIZE;
> +}

Use return ARRAY_SIZE(foo) to return the size of a static table.

> +static int asm9260_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
> +                                        unsigned int group,
> +                                        const unsigned int **pins,
> +                                        unsigned int *num_pins)
> +{
> +       struct asm9260_pmx_priv *priv = pinctrl_dev_get_drvdata(pctldev);
> +
> +       *pins = &priv->pin_desc[group].number;
> +       *num_pins = 1;

So I see you are using groups with one pin each. Is this how the
hardware works?

> +static int asm9260_pinctrl_get_func_groups(struct pinctrl_dev *pctldev,
> +                                         unsigned int function,
> +                                         const char * const **groups,
> +                                         unsigned int * const num_groups)
> +{

(...)
> +       for (a = 0; a < MUX_TABLE_SIZE; a++) {
> +               table = &asm9260_mux_table[a];
> +
> +               for (b = 0; b < MAX_FUNCS_PER_PIN; b++) {
> +                       if (table->funcs[b] == function) {
> +                               tmp[count] = a;
> +                               count++;
> +                       }
> +
> +               }
> +
> +       }

Mory copying. I don't see why this is necessary at all.

> +       for (a = 0; a < count; a++)
> +               gr[a] = asm9260_mux_table[tmp[a]].name;

And more copying.

Try to just reference static tables.

> +
> +       asm9260_functions[function].groups = gr;
> +       asm9260_functions[function].ngroups = count;
> +done:
> +       *groups = asm9260_functions[function].groups;
> +       *num_groups = asm9260_functions[function].ngroups;

Same comment.

> +static struct pinmux_ops asm9260_pinmux_ops = {
> +       .get_functions_count    = asm9260_pinctrl_get_funcs_count,
> +       .get_function_name      = asm9260_pinctrl_get_func_name,
> +       .get_function_groups    = asm9260_pinctrl_get_func_groups,
> +       .set_mux                = asm9260_pinctrl_set_mux,
> +       /* TODO: should we care about gpios here? gpio_request_enable? */

I think you should, if you also have a matching GPIO driver.

> +static int asm9260_pinconf_reg(struct pinctrl_dev *pctldev,
> +                             unsigned int pin,
> +                             enum pin_config_param param,
> +                             void __iomem **reg, u32 *val)
> +{
> +       struct asm9260_pmx_priv *priv = pinctrl_dev_get_drvdata(pctldev);
> +       struct asm9260_pingroup *table;
> +       int a;
> +
> +       for (a = 0; a < MUX_TABLE_SIZE; a++) {
> +               table = &asm9260_mux_table[a];
> +               if (table->number == pin)
> +                       break;
> +       }

No error check here. What if pin is not in table? We will never
know for that case...

Apart from that it looks OK.

BTW this is a review of v3, I didn't find your v4 of this patch :/

Yours,
Linus Walleij
