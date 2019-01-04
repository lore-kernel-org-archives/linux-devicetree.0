From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/3] qcom: spmi-gpio: add support for hierarchical IRQ chip
Date: Thu, 03 Jan 2019 16:48:33 -0800
Message-ID: <154656291378.15366.8661245319757182529@swboyd.mtv.corp.google.com>
References: <20181229114755.8711-1-masneyb@onstation.org> <20181229114755.8711-3-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181229114755.8711-3-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>, andy.gross@linaro.org, bjorn.andersson@linaro.org, linus.walleij@linaro.org
Cc: marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Brian Masney (2018-12-29 03:47:54)
> spmi-gpio did not have any irqchip support so consumers of this in
> device tree would need to call gpio[d]_to_irq() in order to get the
> proper IRQ on the underlying PMIC. IRQ chips in device tree should
> be usable from the start without the consumer having to make an
> additional call to get the proper IRQ on the parent. This patch adds
> hierarchical IRQ chip support to the spmi-gpio code to correct this
> issue.
>=20
> Driver was tested using the volume buttons (via gpio-keys) on the LG
> Nexus 5 (hammerhead) phone with the following two configurations.
>=20
> volume-up {
>         interrupts-extended =3D <&pm8941_gpios 0 1 0 IRQ_TYPE_EDGE_BOTH>;

I'd think we want the interrupt-cells for the pmic gpio controller to be
2 cells (pin and flags) instead of 4 like you have here to match the
parent interrupt specifier. The gpio chip never spans two SIDs so that
cell isn't important to express to each GPIO consumer, and the other
zero cell will always be zero for the gpio because it's a 1 to 1
relation between the gpio and SPMI interrupt number. Basically there
isn't more than one irq per gpio in the PMIC so it will always be zero
for that cell too. I'd expect to see something like:

	interrupts-extended =3D <&pm8941_gpios 1 IRQ_TYPE_EDGE_BOTH>

to indicate that GPIO1 should be requested. I also seem to recall that
GPIO numbering starts from 1 instead of 0, so please keep that in mind.

>         ...
> };
>=20
> volume-up {
>         gpios =3D <&pm8941_gpios 2 GPIO_ACTIVE_LOW>;
>         ...
> };
>=20
> Both configurations now show that spmi-gpio is the IRQ domain and that
> the IRQ is setup in a hierarchy.
>=20
> $ grep volume_up /proc/interrupts
> 110:          0          0  spmi-gpio   1 Edge      volume_up
>=20
> $ cat /sys/kernel/debug/irq/irqs/110
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
>=20
> Signed-off-by: Brian Masney <masneyb@onstation.org>


> @@ -761,11 +764,16 @@ static int pmic_gpio_of_xlate(struct gpio_chip *chi=
p,
>  static int pmic_gpio_to_irq(struct gpio_chip *chip, unsigned pin)
>  {
>         struct pmic_gpio_state *state =3D gpiochip_get_data(chip);
> -       struct pmic_gpio_pad *pad;
> +       struct irq_fwspec fwspec;
> =20
> -       pad =3D state->ctrl->desc->pins[pin].drv_data;
> +       fwspec.fwnode =3D state->fwnode;
> +       fwspec.param_count =3D 4;
> +       fwspec.param[0] =3D 0;
> +       fwspec.param[1] =3D pin;
> +       fwspec.param[2] =3D 0;
> +       fwspec.param[3] =3D IRQ_TYPE_NONE;
> =20
> -       return pad->irq;
> +       return irq_create_fwspec_mapping(&fwspec);
>  }
> =20
>  static void pmic_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chi=
p)
> @@ -935,8 +943,91 @@ static int pmic_gpio_populate(struct pmic_gpio_state=
 *state,
>         return 0;
>  }
> =20
> +static struct irq_chip pmic_gpio_irq_chip =3D {
> +       .name =3D "spmi-gpio",
> +       .irq_ack =3D irq_chip_ack_parent,
> +       .irq_mask =3D irq_chip_mask_parent,
> +       .irq_unmask =3D irq_chip_unmask_parent,
> +       .irq_set_type =3D irq_chip_set_type_parent,
> +       .irq_set_wake =3D irq_chip_set_wake_parent,
> +       .flags =3D IRQCHIP_MASK_ON_SUSPEND,
> +};
> +
> +static int pmic_gpio_irq_activate(struct irq_domain *domain,
> +                                 struct irq_data *data, bool reserve)
> +{
> +       struct pmic_gpio_state *state =3D domain->host_data;

How about just storing the gpiochip in the domain->host_data?

> +
> +       return gpiochip_lock_as_irq(&state->chip, data->hwirq);
> +}
> +
> +static void pmic_gpio_irq_deactivate(struct irq_domain *domain,
> +                                    struct irq_data *data)
> +{
> +       struct pmic_gpio_state *state =3D domain->host_data;
> +
> +       gpiochip_unlock_as_irq(&state->chip, data->hwirq);
> +}
> +

Then these could be generic gpiolib APIs?

> +static int pmic_gpio_domain_translate(struct irq_domain *domain,
> +                                     struct irq_fwspec *fwspec,
> +                                     unsigned long *hwirq,
> +                                     unsigned int *type)
> +{
> +       struct pmic_gpio_state *state =3D domain->host_data;
> +
> +       if ((fwspec->param_count !=3D 4) ||
> +           (fwspec->param[1] >=3D state->chip.ngpio))

Please drop parenthesis here.

> +               return -EINVAL;
> +
> +       *hwirq =3D fwspec->param[1];
> +       *type =3D fwspec->param[3];
> +
> +       return 0;
> +}
> +
> +static int pmic_gpio_domain_alloc(struct irq_domain *domain, unsigned in=
t virq,
> +                                 unsigned int nr_irqs, void *data)
> +{
> +       struct pmic_gpio_state *state =3D domain->host_data;
> +       struct irq_fwspec *fwspec =3D data;
> +       struct irq_fwspec parent_fwspec;
> +       irq_hw_number_t hwirq;
> +       unsigned int type;
> +       int ret, i;
> +
> +       ret =3D pmic_gpio_domain_translate(domain, fwspec, &hwirq, &type);
> +       if (ret)
> +               return ret;
> +
> +       for (i =3D 0; i < nr_irqs; i++)
> +               irq_domain_set_info(domain, virq + i, hwirq + i,
> +                                   &pmic_gpio_irq_chip, state,
> +                                   handle_level_irq, NULL, NULL);

Does almost nobody pass a name for that last parameter?

> +
> +       parent_fwspec.fwnode =3D domain->parent->fwnode;
> +       parent_fwspec.param_count =3D 4;
> +       parent_fwspec.param[0] =3D fwspec->param[0];
> +       parent_fwspec.param[1] =3D fwspec->param[1] + 0xc0;

Ideally this comes from the reg property but it's always been 0xc0 so
OK.

> +       parent_fwspec.param[2] =3D fwspec->param[2];
> +       parent_fwspec.param[3] =3D fwspec->param[3];
> +
> +       return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs,
> +                                           &parent_fwspec);
> +}
> +
> +static const struct irq_domain_ops pmic_gpio_domain_ops =3D {
> +       .activate =3D pmic_gpio_irq_activate,
> +       .alloc =3D pmic_gpio_domain_alloc,
> +       .deactivate =3D pmic_gpio_irq_deactivate,
> +       .free =3D irq_domain_free_irqs_common,
> +       .translate =3D pmic_gpio_domain_translate,
> +};
> +
>  static int pmic_gpio_probe(struct platform_device *pdev)
>  {
> +       struct irq_domain *parent_domain;
> +       struct device_node *parent_node;
>         struct device *dev =3D &pdev->dev;
>         struct pinctrl_pin_desc *pindesc;
>         struct pinctrl_desc *pctrldesc;
> @@ -1022,10 +1113,27 @@ static int pmic_gpio_probe(struct platform_device=
 *pdev)
>         if (IS_ERR(state->ctrl))
>                 return PTR_ERR(state->ctrl);
> =20
> +       parent_node =3D of_irq_find_parent(state->dev->of_node);

Do we need to of_node_put() this pointer when we're done with it?

> +       if (!parent_node)
> +               return -ENXIO;
> +
> +       parent_domain =3D irq_find_host(parent_node);
> +       if (!parent_domain)
> +               return -ENXIO;
> +
> +       state->fwnode =3D of_node_to_fwnode(state->dev->of_node);
> +       state->domain =3D irq_domain_create_hierarchy(parent_domain, 0,
> +                                                   state->chip.ngpio,
> +                                                   state->fwnode,
> +                                                   &pmic_gpio_domain_ops,
