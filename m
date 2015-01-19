From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH v3 1/3] pinctrl: at91: allow to have disabled gpio bank
Date: Mon, 19 Jan 2015 11:40:59 +0100
Message-ID: <54BCDF3B.4060707@atmel.com>
References: <1421422267-2934-1-git-send-email-ludovic.desroches@atmel.com> <1421422267-2934-2-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1421422267-2934-2-git-send-email-ludovic.desroches@atmel.com>
Sender: stable-owner@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, plagnioj@jcrosoft.com, linus.walleij@linaro.org
Cc: stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Le 16/01/2015 16:31, Ludovic Desroches a =E9crit :
> From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
>=20
> Today we expect that all the bank are enabled, and count the number o=
f banks
> used by the pinctrl based on it instead of using the last bank id ena=
bled.
>=20
> So switch to it, set the chained IRQ at runtime based on enabled bank=
s
> and wait only the number of enabled gpio controllers at probe time.
>=20
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.co=
m>
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
>=20
> Cc: <stable@vger.kernel.org> # 3.18

As I acknowledged a comparable solution previously, and after reading,
this patch seems okay:

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Thanks, bye.


> ---
>  drivers/pinctrl/pinctrl-at91.c | 108 +++++++++++++++++++++----------=
----------
>  1 file changed, 55 insertions(+), 53 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl=
-at91.c
> index dfd021e..f4cd0b9 100644
> --- a/drivers/pinctrl/pinctrl-at91.c
> +++ b/drivers/pinctrl/pinctrl-at91.c
> @@ -177,7 +177,7 @@ struct at91_pinctrl {
>  	struct device		*dev;
>  	struct pinctrl_dev	*pctl;
> =20
> -	int			nbanks;
> +	int			nactive_banks;
> =20
>  	uint32_t		*mux_mask;
>  	int			nmux;
> @@ -653,12 +653,18 @@ static int pin_check_config(struct at91_pinctrl=
 *info, const char *name,
>  	int mux;
> =20
>  	/* check if it's a valid config */
> -	if (pin->bank >=3D info->nbanks) {
> +	if (pin->bank >=3D gpio_banks) {
>  		dev_err(info->dev, "%s: pin conf %d bank_id %d >=3D nbanks %d\n",
> -			name, index, pin->bank, info->nbanks);
> +			name, index, pin->bank, gpio_banks);
>  		return -EINVAL;
>  	}
> =20
> +	if (!gpio_chips[pin->bank]) {
> +		dev_err(info->dev, "%s: pin conf %d bank_id %d not enabled\n",
> +			name, index, pin->bank);
> +		return -ENXIO;
> +	}
> +
>  	if (pin->pin >=3D MAX_NB_GPIO_PER_BANK) {
>  		dev_err(info->dev, "%s: pin conf %d pin_bank_id %d >=3D %d\n",
>  			name, index, pin->pin, MAX_NB_GPIO_PER_BANK);
> @@ -981,7 +987,8 @@ static void at91_pinctrl_child_count(struct at91_=
pinctrl *info,
> =20
>  	for_each_child_of_node(np, child) {
>  		if (of_device_is_compatible(child, gpio_compat)) {
> -			info->nbanks++;
> +			if (of_device_is_available(child))
> +				info->nactive_banks++;
>  		} else {
>  			info->nfunctions++;
>  			info->ngroups +=3D of_get_child_count(child);
> @@ -1003,11 +1010,11 @@ static int at91_pinctrl_mux_mask(struct at91_=
pinctrl *info,
>  	}
> =20
>  	size /=3D sizeof(*list);
> -	if (!size || size % info->nbanks) {
> -		dev_err(info->dev, "wrong mux mask array should be by %d\n", info-=
>nbanks);
> +	if (!size || size % gpio_banks) {
> +		dev_err(info->dev, "wrong mux mask array should be by %d\n", gpio_=
banks);
>  		return -EINVAL;
>  	}
> -	info->nmux =3D size / info->nbanks;
> +	info->nmux =3D size / gpio_banks;
> =20
>  	info->mux_mask =3D devm_kzalloc(info->dev, sizeof(u32) * size, GFP_=
KERNEL);
>  	if (!info->mux_mask) {
> @@ -1131,7 +1138,7 @@ static int at91_pinctrl_probe_dt(struct platfor=
m_device *pdev,
>  		of_match_device(at91_pinctrl_of_match, &pdev->dev)->data;
>  	at91_pinctrl_child_count(info, np);
> =20
> -	if (info->nbanks < 1) {
> +	if (gpio_banks < 1) {
>  		dev_err(&pdev->dev, "you need to specify at least one gpio-control=
ler\n");
>  		return -EINVAL;
>  	}
> @@ -1144,7 +1151,7 @@ static int at91_pinctrl_probe_dt(struct platfor=
m_device *pdev,
> =20
>  	dev_dbg(&pdev->dev, "mux-mask\n");
>  	tmp =3D info->mux_mask;
> -	for (i =3D 0; i < info->nbanks; i++) {
> +	for (i =3D 0; i < gpio_banks; i++) {
>  		for (j =3D 0; j < info->nmux; j++, tmp++) {
>  			dev_dbg(&pdev->dev, "%d:%d\t0x%x\n", i, j, tmp[0]);
>  		}
> @@ -1162,7 +1169,7 @@ static int at91_pinctrl_probe_dt(struct platfor=
m_device *pdev,
>  	if (!info->groups)
>  		return -ENOMEM;
> =20
> -	dev_dbg(&pdev->dev, "nbanks =3D %d\n", info->nbanks);
> +	dev_dbg(&pdev->dev, "nbanks =3D %d\n", gpio_banks);
>  	dev_dbg(&pdev->dev, "nfunctions =3D %d\n", info->nfunctions);
>  	dev_dbg(&pdev->dev, "ngroups =3D %d\n", info->ngroups);
> =20
> @@ -1185,7 +1192,7 @@ static int at91_pinctrl_probe(struct platform_d=
evice *pdev)
>  {
>  	struct at91_pinctrl *info;
>  	struct pinctrl_pin_desc *pdesc;
> -	int ret, i, j, k;
> +	int ret, i, j, k, ngpio_chips_enabled =3D 0;
> =20
>  	info =3D devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
>  	if (!info)
> @@ -1200,23 +1207,27 @@ static int at91_pinctrl_probe(struct platform=
_device *pdev)
>  	 * to obtain references to the struct gpio_chip * for them, and we
>  	 * need this to proceed.
>  	 */
> -	for (i =3D 0; i < info->nbanks; i++) {
> -		if (!gpio_chips[i]) {
> -			dev_warn(&pdev->dev, "GPIO chip %d not registered yet\n", i);
> -			devm_kfree(&pdev->dev, info);
> -			return -EPROBE_DEFER;
> -		}
> +	for (i =3D 0; i < gpio_banks; i++)
> +		if (gpio_chips[i])
> +			ngpio_chips_enabled++;
> +
> +	if (ngpio_chips_enabled < info->nactive_banks) {
> +		dev_warn(&pdev->dev,
> +			 "All GPIO chips are not registered yet (%d/%d)\n",
> +			 ngpio_chips_enabled, info->nactive_banks);
> +		devm_kfree(&pdev->dev, info);
> +		return -EPROBE_DEFER;
>  	}
> =20
>  	at91_pinctrl_desc.name =3D dev_name(&pdev->dev);
> -	at91_pinctrl_desc.npins =3D info->nbanks * MAX_NB_GPIO_PER_BANK;
> +	at91_pinctrl_desc.npins =3D gpio_banks * MAX_NB_GPIO_PER_BANK;
>  	at91_pinctrl_desc.pins =3D pdesc =3D
>  		devm_kzalloc(&pdev->dev, sizeof(*pdesc) * at91_pinctrl_desc.npins,=
 GFP_KERNEL);
> =20
>  	if (!at91_pinctrl_desc.pins)
>  		return -ENOMEM;
> =20
> -	for (i =3D 0 , k =3D 0; i < info->nbanks; i++) {
> +	for (i =3D 0, k =3D 0; i < gpio_banks; i++) {
>  		for (j =3D 0; j < MAX_NB_GPIO_PER_BANK; j++, k++) {
>  			pdesc->number =3D k;
>  			pdesc->name =3D kasprintf(GFP_KERNEL, "pio%c%d", i + 'A', j);
> @@ -1234,8 +1245,9 @@ static int at91_pinctrl_probe(struct platform_d=
evice *pdev)
>  	}
> =20
>  	/* We will handle a range of GPIO pins */
> -	for (i =3D 0; i < info->nbanks; i++)
> -		pinctrl_add_gpio_range(info->pctl, &gpio_chips[i]->range);
> +	for (i =3D 0; i < gpio_banks; i++)
> +		if (gpio_chips[i])
> +			pinctrl_add_gpio_range(info->pctl, &gpio_chips[i]->range);
> =20
>  	dev_info(&pdev->dev, "initialized AT91 pinctrl driver\n");
> =20
> @@ -1613,9 +1625,10 @@ static void gpio_irq_handler(unsigned irq, str=
uct irq_desc *desc)
>  static int at91_gpio_of_irq_setup(struct platform_device *pdev,
>  				  struct at91_gpio_chip *at91_gpio)
>  {
> +	struct gpio_chip	*gpiochip_prev =3D NULL;
>  	struct at91_gpio_chip   *prev =3D NULL;
>  	struct irq_data		*d =3D irq_get_irq_data(at91_gpio->pioc_virq);
> -	int ret;
> +	int ret, i;
> =20
>  	at91_gpio->pioc_hwirq =3D irqd_to_hwirq(d);
> =20
> @@ -1641,24 +1654,33 @@ static int at91_gpio_of_irq_setup(struct plat=
form_device *pdev,
>  		return ret;
>  	}
> =20
> -	/* Setup chained handler */
> -	if (at91_gpio->pioc_idx)
> -		prev =3D gpio_chips[at91_gpio->pioc_idx - 1];
> -
>  	/* The top level handler handles one bank of GPIOs, except
>  	 * on some SoC it can handle up to three...
>  	 * We only set up the handler for the first of the list.
>  	 */
> -	if (prev && prev->next =3D=3D at91_gpio)
> +	gpiochip_prev =3D irq_get_handler_data(at91_gpio->pioc_virq);
> +	if (!gpiochip_prev) {
> +		/* Then register the chain on the parent IRQ */
> +		gpiochip_set_chained_irqchip(&at91_gpio->chip,
> +					     &gpio_irqchip,
> +					     at91_gpio->pioc_virq,
> +					     gpio_irq_handler);
>  		return 0;
> +	}
> =20
> -	/* Then register the chain on the parent IRQ */
> -	gpiochip_set_chained_irqchip(&at91_gpio->chip,
> -				     &gpio_irqchip,
> -				     at91_gpio->pioc_virq,
> -				     gpio_irq_handler);
> +	prev =3D container_of(gpiochip_prev, struct at91_gpio_chip, chip);
> =20
> -	return 0;
> +	/* we can only have 2 banks before */
> +	for (i =3D 0; i < 2; i++) {
> +		if (prev->next) {
> +			prev =3D prev->next;
> +		} else {
> +			prev->next =3D at91_gpio;
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
>  }
> =20
>  /* This structure is replicated for each GPIO block allocated at pro=
be time */
> @@ -1675,24 +1697,6 @@ static struct gpio_chip at91_gpio_template =3D=
 {
>  	.ngpio			=3D MAX_NB_GPIO_PER_BANK,
>  };
> =20
> -static void at91_gpio_probe_fixup(void)
> -{
> -	unsigned i;
> -	struct at91_gpio_chip *at91_gpio, *last =3D NULL;
> -
> -	for (i =3D 0; i < gpio_banks; i++) {
> -		at91_gpio =3D gpio_chips[i];
> -
> -		/*
> -		 * GPIO controller are grouped on some SoC:
> -		 * PIOC, PIOD and PIOE can share the same IRQ line
> -		 */
> -		if (last && last->pioc_virq =3D=3D at91_gpio->pioc_virq)
> -			last->next =3D at91_gpio;
> -		last =3D at91_gpio;
> -	}
> -}
> -
>  static struct of_device_id at91_gpio_of_match[] =3D {
>  	{ .compatible =3D "atmel,at91sam9x5-gpio", .data =3D &at91sam9x5_op=
s, },
>  	{ .compatible =3D "atmel,at91rm9200-gpio", .data =3D &at91rm9200_op=
s },
> @@ -1805,8 +1809,6 @@ static int at91_gpio_probe(struct platform_devi=
ce *pdev)
>  	gpio_chips[alias_idx] =3D at91_chip;
>  	gpio_banks =3D max(gpio_banks, alias_idx + 1);
> =20
> -	at91_gpio_probe_fixup();
> -
>  	ret =3D at91_gpio_of_irq_setup(pdev, at91_chip);
>  	if (ret)
>  		goto irq_setup_err;
>=20


--=20
Nicolas Ferre
