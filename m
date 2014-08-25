From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 4/6] pinctrl: Qualcomm SPMI PMIC pin controller driver
Date: Mon, 25 Aug 2014 17:00:39 +0300
Message-ID: <1408975239.5256.39.camel@iivanov-dev>
References: <1407771634-14946-1-git-send-email-iivanov@mm-sol.com>
	 <1407771634-14946-5-git-send-email-iivanov@mm-sol.com>
	 <20140821061607.GF16274@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140821061607.GF16274-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2014-08-20 at 23:16 -0700, Bjorn Andersson wrote:
> On Mon 11 Aug 08:40 PDT 2014, Ivan T. Ivanov wrote:
> 
> > From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> > 
> > This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> > Qualcomm GPIO and MPP sub-function blocks found in the PMIC chips.
> > 
> 
> Hi Ivan,
> 
> I'm not very fond of the mixing of gpio and mpp in the same driver, there are
> so many places where you have extra complexity to handle the fact that both are
> handled in the same code paths.

I could split them. Downstream driver uses one driver for GPIO and MPP
from all PMIC's. Initially to me it looks like GPIO's are MPP's with
limited functionality, but it turn out that they are 2 different HW
block with some similarities.

> 
> Also, magic constans aren't good, but with all the shifts and maskes used
> throughout this driver it's really difficult to follow the code. A lot of this
> complexity comes from the fact that you're using regmap_update_bits(), so you
> have to have those masks and shifts everywhere.
> 
> As you saw I solved this by keeping track of the various properties set by the
> driver, another way could be to have a register shadow that you update and
> flush - it would save you from the attrs-game in pinconf set/get.
> 

Yep. I agree. Currently my implementation is fragile because it depend
on order of the properties in the DT files. Probably will be best if all
settings accumulated by pin_config_group_get() are applied in correct
order in pinmux.enable().

<snip>

> 
> > +#define QPNP_PIN_PHYSICAL_OFFSET               1
> 
> If you just assign the of_node to the gpio_chip and then call
> gpiochip_add_pin_range(_, _, 1, 0, _) this will give you the off-by-one you're
> looking for.

I have tried this, but something went wrong, I don't remember what. 
Will check again.

> > +
> > +struct qpnp_pinctrl {
> > +       struct device *dev;
> > +       struct regmap *map;
> > +       struct pinctrl_dev *ctrl;
> > +       struct pinctrl_desc desc;
> > +       struct gpio_chip chip;
> > +
> > +       struct qpnp_padinfo *pads;
> 
> As Linus commented on my code, you shouldn't have a list of pads here, you
> should reference them via desc.pins[x].drv_data

I was trying to avoid multiple small allocation. Will check again.

<snip>

> 
> > +       const struct qpnp_chipinfo *info;
> 
> 'info' is only used during probe, no reason to keep a pointer around.

probe and discover functions.

> 
> > +       const char *const *groups;
> > +       const char *const *functions;
> > +};
> > +
> > +static inline struct qpnp_pinctrl *to_qpnp_pinctrl(struct gpio_chip *chip)
> > +{
> > +       return container_of(chip, struct qpnp_pinctrl, chip);
> > +};
> 
> I see little point in breaking out the container_of into its own function.

It fit driver state dereferencing to 80 columns.

> > +
> > +static int qpnp_conv_to_pin(struct qpnp_pinctrl *qctrl,
> > +                          struct qpnp_padinfo *pad, unsigned param,

<snip>

> > +       case PIN_CONFIG_BIAS_PULL_UP:
> > +               if (type != QPNP_MPP_TYPE)
> > +                       return -EINVAL;
> 
> The binding documentation says that it's okay to just state "bias-pull-up" and
> it will be configured as 30uA pull up. 

But is valid only for MPP's.

> I would like us to keep the binding
> documentation as it is now, but then you need to handle that here.
> 

Right.

> > +               switch (val) {
> > +               case 0:
> > +                       val = QPNP_MPP_PULL_UP_OPEN;
> > +                       break;
> > +               case 600:
> > +                       val = QPNP_MPP_PULL_UP_0P6KOHM;
> > +                       break;
> > +               case 10000:
> > +                       val = QPNP_MPP_PULL_UP_10KOHM;
> > +                       break;
> > +               case 30000:
> > +                       val = QPNP_MPP_PULL_UP_30KOHM;
> > +                       break;
> > +               default:
> > +                       return -EINVAL;
> > +               }

<snip>

> > +       case QPNP_PINCONF_MODE:
> > +               if ((pad->modes & BIT(val)) == 0)
> > +                       return -ENXIO;
> 
> -EINVAL?
> 
> > +               attr[0].addr  = QPNP_REG_MODE_CTL;
> > +               attr[0].shift = QPNP_REG_MODE_SEL_SHIFT;
> > +               attr[0].mask  = QPNP_REG_MODE_SEL_MASK;
> > +               attr[0].val   = val;
> 
> What happens here if I day output-high; qcom,mode = "digital-input"; ?

It depends on the order of which they are found in DT files :-).
Will fix it.

> > +
> > +static int qpnp_of_xlate(struct gpio_chip *chip,
> > +                      const struct of_phandle_args *gpio_desc, u32 *flags)
> > +{
> 
> Assign chip.of_node when registering the gpio_chip and remove this function.
> 
> > +       struct qpnp_pinctrl *qctrl = to_qpnp_pinctrl(chip);
> > +       struct qpnp_padinfo *pad;
> > +       unsigned pin = gpio_desc->args[0] - QPNP_PIN_PHYSICAL_OFFSET;

This way gpiolib see pin numbers like pinctrl framework, starting from 1.
I will try to offset gpio range with 1 in registration.
> 
> > +
> > +static int qpnp_control_init(struct qpnp_pinctrl *qctrl,
> > +                         struct qpnp_padinfo *pad)
> 
> This is not "initializing any control", it's rather a
> qpnp_get_available_modes(type, subtype) function.
> 
> > +{
> > +       pad->modes = 0;
> > +
> > +       if (pad->type == QPNP_GPIO_TYPE) {
> > +               switch (pad->subtype) {
> > +               case QPNP_GPIO_SUBTYPE_GPIO_4CH:
> > +               case QPNP_GPIO_SUBTYPE_GPIOC_4CH:
> > +               case QPNP_GPIO_SUBTYPE_GPIO_8CH:
> > +               case QPNP_GPIO_SUBTYPE_GPIOC_8CH:
> 
> Looks like this switch is not of much use, consider dropping it.
> 
> > +
> > +                       /* only GPIO is supported*/
> > +                       pad->modes |= BIT(QPNP_PIN_MODE_DIG_IN);
> > +                       pad->modes |= BIT(QPNP_PIN_MODE_DIG_OUT);
> > +                       pad->modes |= BIT(QPNP_PIN_MODE_DIG_IN_OUT);
> > +                       break;
> > +               default:
> > +                       dev_err(qctrl->dev, "invalid GPIO subtype 0x%x\n",
> > +                               pad->subtype);
> 
> Is this really going to happen? This would indicate that we have "compatible"
> chips that suddenly have some new type of gpio/mpp block.

And we should be somehow be noticed, right?

> 
> > +                       return -EINVAL;
> > +               }

<snip>

> > +static int qpnp_pinctrl_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +       const struct qpnp_chipinfo *qchip;
> > +       struct qpnp_pinctrl *qctrl;
> > +
> > +       qctrl = devm_kzalloc(dev, sizeof(*qctrl), GFP_KERNEL);
> > +       if (!qctrl)
> > +               return -ENOMEM;
> > +
> > +       platform_set_drvdata(pdev, qctrl);
> > +
> > +       qchip = of_match_node(qpnp_pinctrl_of_match, dev->of_node)->data;
> > +
> > +       qctrl->info = qchip;
> 
> No need to keep track of the info after qpnp_discover().

Right.

<snip>

> > +
> > +static const struct qpnp_chipinfo qpnp_pm8841_mpp_info = {
> > +       .npins  = 4,
> > +       .base   = 0xa000,
> 
> Read this from the reg property instead.

If SPMI bindings are changed a little bit, there will be no
need to hard code even number of pins :-). Will do.

> Regards,
> Bjorn

Thank you for detailed review. I agree with sniped comments
and will fix them.

Regards,
Ivan


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
