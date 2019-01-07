From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 4/5] qcom: spmi-gpio: add support for hierarchical IRQ chip
Date: Mon, 07 Jan 2019 13:55:42 -0800
Message-ID: <154689814280.15366.2705028033847856491@swboyd.mtv.corp.google.com>
References: <20190107021145.6370-1-masneyb@onstation.org> <20190107021145.6370-5-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107021145.6370-5-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>, andy.gross@linaro.org, bjorn.andersson@linaro.org, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Brian Masney (2019-01-06 18:11:44)
> @@ -762,11 +763,14 @@ static int pmic_gpio_of_xlate(struct gpio_chip *chi=
p,
>  static int pmic_gpio_to_irq(struct gpio_chip *chip, unsigned pin)
>  {
>         struct pmic_gpio_state *state =3D gpiochip_get_data(chip);
> -       struct pmic_gpio_pad *pad;
> +       struct irq_fwspec fwspec;
> =20
> -       pad =3D state->ctrl->desc->pins[pin].drv_data;
> +       fwspec.fwnode =3D state->fwnode;
> +       fwspec.param_count =3D 2;
> +       fwspec.param[0] =3D pin + 1;

There seems to be PMIC_GPIO_PHYSICAL_OFFSET for these purposes.

> +       fwspec.param[1] =3D IRQ_TYPE_NONE;
> =20
> -       return pad->irq;
> +       return irq_create_fwspec_mapping(&fwspec);
>  }
> =20
>  static void pmic_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chi=
p)
> @@ -936,6 +940,86 @@ static int pmic_gpio_populate(struct pmic_gpio_state=
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

I meant these sorts of wrappers that could be used by other drivers
possibly, if all they need to store in their domain->host_data is the
gpiochip structure (they can probably indirect through the gpiochip
again to get their driver specific structure).

int gpiochip_irq_domain_activate(struct irq_domain *domain,
				 struct irq_data *data, bool reserve)
{
	struct gpiochip *chip =3D domain->host_data;

	return gpiochip_lock_as_irq(chip, data->hwirq);
}

void gpiochip_irq_domain_deactivate(struct irq_domain *domain,
				    struct irq_data *data)
{
	struct gpiochip *chip =3D domain->host_data;

	return gpiochip_unlock_as_irq(chip, data->hwirq);
}

> +
> +static int pmic_gpio_domain_translate(struct irq_domain *domain,
> +                                     struct irq_fwspec *fwspec,
> +                                     unsigned long *hwirq,
> +                                     unsigned int *type)
> +{
> +       struct pmic_gpio_state *state =3D domain->host_data;
> +
> +       if (fwspec->param_count !=3D 2 || fwspec->param[0] >=3D state->ch=
ip.ngpio)
> +               return -EINVAL;
> +
> +       *hwirq =3D fwspec->param[0] - 1;

There seems to be PMIC_GPIO_PHYSICAL_OFFSET for these purposes.

> +       *type =3D fwspec->param[1];
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
> +
> +       parent_fwspec.fwnode =3D domain->parent->fwnode;
> +       parent_fwspec.param_count =3D 4;
> +       parent_fwspec.param[0] =3D 0;
> +       parent_fwspec.param[1] =3D fwspec->param[0] + 0xc0 - 1;

Is the -1 there twice, once in pmic_gpio_domain_translate() and then
here?

> +       parent_fwspec.param[2] =3D 0;
> +       parent_fwspec.param[3] =3D fwspec->param[1];
> +
> +       return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs,
> +                                           &parent_fwspec);
> +}
> +
