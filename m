From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [RFC 2/3] pinctrl: e3xx: Adding support for NI Ettus Research
 USRP E3xx pinconf
Date: Fri, 6 Nov 2015 22:56:16 +0200
Message-ID: <CAHp75Vem4MGuXDqwLKCQLyEsJohxu2GV8xKGH8r6hbp9sSSFDQ@mail.gmail.com>
References: <1446766883-25703-1-git-send-email-moritz.fischer@ettus.com>
	<1446766883-25703-3-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446766883-25703-3-git-send-email-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, ijc+devicetree <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 6, 2015 at 1:41 AM, Moritz Fischer <moritz.fischer@ettus.com> wrote:
> The USRP E3XX series requires pinctrl to configure the idle state
> FPGA image for minimizing power consumption.
> This is required since different daughtercards have different uses
> for pins on a common connector.

> +#include <linux/pinctrl/pinconf-generic.h>

+ empty line?

> +#include "pinctrl-utils.h"
> +#include "core.h"

> +static int e3xx_pinconf_cfg_get(struct pinctrl_dev *pctldev,
> +                               unsigned pin,
> +                               unsigned long *config)
> +{
> +       u32 reg, mask;
> +       int arg;
> +       struct e3xx_pinctrl *pctrl;
> +       unsigned int param;
> +
> +       param = pinconf_to_config_param(*config);
> +       pctrl = pinctrl_dev_get_drvdata(pctldev);
> +
> +       if (pin >= E3XX_NUM_DB_PINS)
> +               return -ENOTSUPP;
> +
> +       mask = BIT(pin % E3XX_PINS_PER_REG);
> +
> +       switch (param) {
> +       case PIN_CONFIG_OUTPUT:
> +               clk_enable(pctrl->clk);
> +               reg = e3xx_pinctrl_read(pctrl, E3XX_DDR_OFFSET +
> +                                       (pin / E3XX_PINS_PER_REG) * 4);
> +
> +               clk_disable(pctrl->clk);
> +               arg = !!(reg & mask);

So, for now arg variable seems redundant, you may use expression
inside call below.

> +               break;
> +       default:
> +               dev_err(pctrl->dev, "requested illegal configuration");
> +               return -ENOTSUPP;
> +       };
> +
> +       *config = pinconf_to_config_packed(param, arg);
> +
> +       return 0;
> +}
> +
> +static int e3xx_pinconf_cfg_set(struct pinctrl_dev *pctldev,
> +                               unsigned pin,
> +                               unsigned long *configs,
> +                               unsigned num_configs)
> +{
> +       u32 reg, mask;
> +       int i;

unsigned

> +       struct e3xx_pinctrl *pctrl;
> +       unsigned int param, arg;
> +
> +       if (pin >= E3XX_NUM_DB_PINS)
> +               return -ENOTSUPP;
> +       mask = BIT(pin % E3XX_PINS_PER_REG);
> +
> +       pctrl = pinctrl_dev_get_drvdata(pctldev);
> +
> +       clk_enable(pctrl->clk);
> +
> +       for (i = 0; i < num_configs; i++) {
> +               param = pinconf_to_config_param(configs[i]);
> +               arg = pinconf_to_config_argument(configs[i]);
> +
> +               switch (param) {
> +               case PIN_CONFIG_OUTPUT:
> +                       /* deal with value, set out bit if arg is 1 */
> +                       reg = e3xx_pinctrl_read(pctrl, E3XX_OUT_OFFSET +
> +                                               ((pin / E3XX_PINS_PER_REG) * 4))
> +                               ;

Why not one the previous line?

> +                       reg &= ~mask;
> +                       if (arg)
> +                               reg |= mask;



> +
> +                       /* addresses need to be 4 byte aligned */
> +                       e3xx_pinctrl_write(pctrl, E3XX_OUT_OFFSET +
> +                                          ((pin / E3XX_PINS_PER_REG) * 4), reg)
> +                               ;
> +
> +                       /* set ddr bit to high for output */
> +                       reg = e3xx_pinctrl_read(pctrl, E3XX_DDR_OFFSET +
> +                                               ((pin / E3XX_PINS_PER_REG) * 4))
> +                               ;

Ditto.

> +                       reg |= mask;
> +
> +                       /* addresses need to be 4 byte aligned */
> +                       e3xx_pinctrl_write(pctrl, E3XX_DDR_OFFSET +
> +                                         ((pin / E3XX_PINS_PER_REG) * 4), reg);
> +                       break;
> +
> +               default:
> +                       clk_disable(pctrl->clk);
> +                       return -ENOTSUPP;
> +               };
> +       }
> +
> +       clk_disable(pctrl->clk);
> +
> +       return 0;
> +}
> +
> +static int e3xx_pinconf_group_set(struct pinctrl_dev *pctldev,
> +                                 unsigned selector,
> +                                 unsigned long *configs,
> +                                 unsigned num_configs)
> +{
> +       return -EAGAIN;
> +}
> +
> +static const struct pinconf_ops e3xx_pinconf_ops = {
> +       .is_generic = true,
> +       .pin_config_get = e3xx_pinconf_cfg_get,
> +       .pin_config_set = e3xx_pinconf_cfg_set,
> +       .pin_config_group_set = e3xx_pinconf_group_set,
> +};
> +
> +static struct pinctrl_desc e3xx_desc = {
> +       .name = "e3xx_pinctrl",
> +       .pins = e3xx_pins,
> +       .npins = ARRAY_SIZE(e3xx_pins),
> +       .pctlops = &e3xx_pctrl_ops,
> +       .confops = &e3xx_pinconf_ops,
> +       .owner = THIS_MODULE,
> +};
> +
> +static int e3xx_pinctrl_probe(struct platform_device *pdev)
> +{
> +       struct resource *res;
> +       struct e3xx_pinctrl *pctrl;
> +       int err;
> +
> +       pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
> +       if (!pctrl)
> +               return -ENOMEM;
> +       pctrl->dev = &pdev->dev;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);

> +       if (!res) {
> +               dev_err(&pdev->dev, "missing IO resource\n");
> +               return -ENODEV;
> +       }

Whole condition is redundant.

> +
> +       pctrl->io_base = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(pctrl->io_base))
> +               return PTR_ERR(pctrl->io_base);
> +
> +       pctrl->clk = devm_clk_get(&pdev->dev, NULL);
> +       if (IS_ERR(pctrl->clk)) {
> +               dev_err(&pdev->dev, "input clock not found");
> +               return PTR_ERR(pctrl->clk);
> +       }
> +
> +       err = clk_prepare(pctrl->clk);
> +       if (err) {
> +               dev_err(&pdev->dev, "unable to prepare clock");
> +               return err;
> +       }
> +
> +       pctrl->pctl = pinctrl_register(&e3xx_desc, &pdev->dev, pctrl);
> +       if (!pctrl->pctl)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, pctrl);
> +
> +       dev_info(&pdev->dev, "NI Ettus Research E3xx pinctrl initialized\n");
> +
> +       return 0;
> +}
> +
> +static int e3xx_pinctrl_remove(struct platform_device *pdev)
> +{
> +       struct e3xx_pinctrl *pctrl = platform_get_drvdata(pdev);
> +
> +       pinctrl_unregister(pctrl->pctl);
> +
> +       clk_unprepare(pctrl->clk);
> +
> +       return 0;
> +}
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id e3xx_pinctrl_of_match[] = {
> +       { .compatible = "ettus,e3xx-pinctrl-1.0", },
> +       {},
> +};
> +
> +MODULE_DEVICE_TABLE(of, e3xx_pinctrl_of_match);
> +#endif
> +
> +static struct platform_driver e3xx_pinctrl_driver = {
> +       .probe = e3xx_pinctrl_probe,
> +       .remove = e3xx_pinctrl_remove,
> +       .driver = {
> +               .name = "e3xx_pinctrl",
> +               .of_match_table = of_match_ptr(e3xx_pinctrl_of_match),
> +       },
> +};
> +
> +module_platform_driver(e3xx_pinctrl_driver);
> +
> +MODULE_AUTHOR("Moritz Fischer <moritz.fischer@ettus.com>");
> +MODULE_DESCRIPTION("Ettus Research pinctrl driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.4.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/



-- 
With Best Regards,
Andy Shevchenko
