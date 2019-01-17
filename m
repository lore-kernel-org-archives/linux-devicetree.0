From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v5 07/14] qcom: spmi-gpio: add support for hierarchical
 IRQ chip
Date: Thu, 17 Jan 2019 11:32:01 +0000
Message-ID: <e9234c48-9fce-1ec4-48f1-dff134559eed@arm.com>
References: <20190117003234.22127-1-masneyb@onstation.org>
 <20190117003234.22127-8-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117003234.22127-8-masneyb@onstation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>, linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org
Cc: shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 17/01/2019 00:32, Brian Masney wrote:
> spmi-gpio did not have any irqchip support so consumers of this in
> device tree would need to call gpio[d]_to_irq() in order to get the
> proper IRQ on the underlying PMIC. IRQ chips in device tree should
> be usable from the start without the consumer having to make an
> additional call to get the proper IRQ on the parent. This patch adds
> hierarchical IRQ chip support to the spmi-gpio code to correct this
> issue.
> 
> Driver was tested using the volume buttons (via gpio-keys) on the LG
> Nexus 5 (hammerhead) phone with the following two configurations.
> 
> volume-up {
>         interrupts-extended = <&pm8941_gpios 2 IRQ_TYPE_EDGE_BOTH>;
>         ...
> };
> 
> volume-up {
>         gpios = <&pm8941_gpios 2 GPIO_ACTIVE_LOW>;
>         ...
> };
> 
> Both configurations now show that spmi-gpio is the IRQ domain and that
> the IRQ is setup in a hierarchy.
> 
> $ grep volume_up /proc/interrupts
>  72:          6          0  spmi-gpio   1 Edge      volume_up
> 
> $ cat /sys/kernel/debug/irq/irqs/72
> handler:  handle_edge_irq
> device:   (null)
> status:   0x00000403
>             _IRQ_NOPROBE
> istate:   0x00000000
> ddepth:   0
> wdepth:   0
> dstate:   0x02400203
>             IRQ_TYPE_EDGE_RISING
>             IRQ_TYPE_EDGE_FALLING
>             IRQD_ACTIVATED
>             IRQD_IRQ_STARTED
> node:     0
> affinity: 0-3
> effectiv:
> domain:  :soc:spmi@fc4cf000:pm8941@0:gpios@c000
>  hwirq:   0x1
>  chip:    spmi-gpio
>   flags:   0x4
>              IRQCHIP_MASK_ON_SUSPEND
>  parent:
>     domain:  :soc:spmi@fc4cf000
>      hwirq:   0xc100057
>      chip:    pmic_arb
>       flags:   0x4
>                  IRQCHIP_MASK_ON_SUSPEND
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> ---
> Changes since v4:
> - None
> 
> Changes since v3:
> - None
> 
> Changes since v2:
> - Use PMIC_GPIO_PHYSICAL_OFFSET instead of the 1 constant
> - Use gpiochip_irq_domain_{activate,deactivate}
> - Changed 'fwspec->param[0] + 0xc0 - 1' to 'hwirq + c0' in call to
>   irq_domain_alloc_irqs_parent
> 
> Changes since v1:
> - Use two cells for interrupts instead of four.
> - Pin numbers in interrupts-extended are now one based instead of zero
>   based so that they match the GPIO pin number.
> - Drop unnecessary parenthesis in pmic_gpio_domain_translate
> - Add missing of_node_put()
> - Remove irq field from pmic_gpio_pad struct that is no longer
>   necessary.
> 
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 111 +++++++++++++++++++++--
>  1 file changed, 101 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index b6fa2c7dbb26..3604c3cdbbc0 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -12,6 +12,7 @@
>   */
>  
>  #include <linux/gpio/driver.h>
> +#include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_irq.h>
> @@ -136,7 +137,6 @@ enum pmic_gpio_func_index {
>  /**
>   * struct pmic_gpio_pad - keep current GPIO settings
>   * @base: Address base in SPMI device.
> - * @irq: IRQ number which this GPIO generate.
>   * @is_enabled: Set to false when GPIO should be put in high Z state.
>   * @out_value: Cached pin output value
>   * @have_buffer: Set to true if GPIO output could be configured in push-pull,
> @@ -156,7 +156,6 @@ enum pmic_gpio_func_index {
>   */
>  struct pmic_gpio_pad {
>  	u16		base;
> -	int		irq;
>  	bool		is_enabled;
>  	bool		out_value;
>  	bool		have_buffer;
> @@ -179,6 +178,8 @@ struct pmic_gpio_state {
>  	struct regmap	*map;
>  	struct pinctrl_dev *ctrl;
>  	struct gpio_chip chip;
> +	struct fwnode_handle *fwnode;
> +	struct irq_domain *domain;
>  };
>  
>  static const struct pinconf_generic_params pmic_gpio_bindings[] = {
> @@ -761,11 +762,14 @@ static int pmic_gpio_of_xlate(struct gpio_chip *chip,
>  static int pmic_gpio_to_irq(struct gpio_chip *chip, unsigned pin)
>  {
>  	struct pmic_gpio_state *state = gpiochip_get_data(chip);
> -	struct pmic_gpio_pad *pad;
> +	struct irq_fwspec fwspec;
>  
> -	pad = state->ctrl->desc->pins[pin].drv_data;
> +	fwspec.fwnode = state->fwnode;
> +	fwspec.param_count = 2;
> +	fwspec.param[0] = pin + PMIC_GPIO_PHYSICAL_OFFSET;
> +	fwspec.param[1] = IRQ_TYPE_NONE;

In my experience, IRQ_TYPE_NONE is rarely a good thing, unless you
expect the trigger information to be found by some other mean. I guess
that's one of the reasons why everything falls back to level in the SPMI
driver...

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
