From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V1] pinctrl: qcom: spmi-gpio: Add support for
 qcom,gpios-disallowed property
Date: Mon, 28 Aug 2017 22:54:37 +0800
Message-ID: <20170828145435.GJ3685@dragon>
References: <20170719071804.3816-1-fenglinw@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170719071804.3816-1-fenglinw@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: fenglinw@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, collinsd@codeaurora.org, aghayal@codeaurora.org, wruan@codeaurora.org, kgunda@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 19, 2017 at 03:17:07PM +0800, fenglinw@codeaurora.org wrote:
> From: Fenglin Wu <fenglinw@codeaurora.org>
> 
> Add support for qcom,gpios-disallowed property which is used to exclude
> PMIC GPIOs not owned by the APSS processor from the pinctrl device.

If I understand it correctly, whether PMIC GPIOs is owned by APSS or not
can be configured by firmware.  If that's true, I do not think we should
have this qcom,gpios-disallowed thing in device tree, which is supposed
to describe hardware not something software configurable.

Shawn

> Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
> ---
>  .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt |  12 ++
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           | 202 +++++++++++++++++----
>  2 files changed, 176 insertions(+), 38 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> index 8d893a8..435efe8 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> @@ -43,6 +43,17 @@ PMIC's from Qualcomm.
>  		    the first cell will be used to define gpio number and the
>  		    second denotes the flags for this gpio
>  
> +- qcom,gpios-disallowed:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: Array of the GPIO hardware numbers corresponding to GPIOs
> +		    which the APSS processor is not allowed to configure.
> +		    The hardware numbers are indexed from 1.
> +		    The interrupt resources for these GPIOs must not be defined
> +		    in "interrupts" and "interrupt-names" properties.
> +		    GPIOs defined in this array won't be registered as pins
> +		    in the pinctrl device or gpios in the gpio chip.
> +
>  Please refer to ../gpio/gpio.txt and ../interrupt-controller/interrupts.txt for
>  a general description of GPIO and interrupt bindings.
>  
> @@ -206,6 +217,7 @@ Example:
>  
>  		gpio-controller;
>  		#gpio-cells = <2>;
> +		qcom,gpios-disallowed = <1 20>;
>  
>  		pm8921_gpio_keys: gpio-keys {
>  			volume-keys {
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index 664b641..74821af 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -96,6 +96,7 @@
>   * struct pmic_gpio_pad - keep current GPIO settings
>   * @base: Address base in SPMI device.
>   * @irq: IRQ number which this GPIO generate.
> + * @gpio_idx: The index in GPIO's hardware number space (1-based)
>   * @is_enabled: Set to false when GPIO should be put in high Z state.
>   * @out_value: Cached pin output value
>   * @have_buffer: Set to true if GPIO output could be configured in push-pull,
> @@ -112,6 +113,7 @@
>  struct pmic_gpio_pad {
>  	u16		base;
>  	int		irq;
> +	int		gpio_idx;
>  	bool		is_enabled;
>  	bool		out_value;
>  	bool		have_buffer;
> @@ -130,6 +132,7 @@ struct pmic_gpio_state {
>  	struct regmap	*map;
>  	struct pinctrl_dev *ctrl;
>  	struct gpio_chip chip;
> +	const char **gpio_groups;
>  };
>  
>  static const struct pinconf_generic_params pmic_gpio_bindings[] = {
> @@ -231,7 +234,9 @@ static int pmic_gpio_get_function_groups(struct pinctrl_dev *pctldev,
>  					 const char *const **groups,
>  					 unsigned *const num_qgroups)
>  {
> -	*groups = pmic_gpio_groups;
> +	struct pmic_gpio_state *state = pinctrl_dev_get_drvdata(pctldev);
> +
> +	*groups = state->gpio_groups;
>  	*num_qgroups = pctldev->desc->npins;
>  	return 0;
>  }
> @@ -455,7 +460,7 @@ static void pmic_gpio_config_dbg_show(struct pinctrl_dev *pctldev,
>  
>  	pad = pctldev->desc->pins[pin].drv_data;
>  
> -	seq_printf(s, " gpio%-2d:", pin + PMIC_GPIO_PHYSICAL_OFFSET);
> +	seq_printf(s, " gpio%-2d:", pad->gpio_idx);
>  
>  	val = pmic_gpio_read(state, pad, PMIC_GPIO_REG_EN_CTL);
>  
> @@ -546,13 +551,29 @@ static int pmic_gpio_of_xlate(struct gpio_chip *chip,
>  			      const struct of_phandle_args *gpio_desc,
>  			      u32 *flags)
>  {
> +	int i;
> +	struct pmic_gpio_state *state = gpiochip_get_data(chip);
> +	struct pinctrl_desc *desc = state->ctrl->desc;
> +	struct pmic_gpio_pad *pad;
> +
>  	if (chip->of_gpio_n_cells < 2)
>  		return -EINVAL;
>  
>  	if (flags)
>  		*flags = gpio_desc->args[1];
>  
> -	return gpio_desc->args[0] - PMIC_GPIO_PHYSICAL_OFFSET;
> +	for (i = 0; i < chip->ngpio; i++) {
> +		pad = desc->pins[i].drv_data;
> +		if (pad->gpio_idx == gpio_desc->args[0]) {
> +			dev_dbg(state->dev, "gpio%-2d xlate to pin%-2d\n",
> +						gpio_desc->args[0], i);
> +			return i;
> +		}
> +	}
> +
> +	dev_err(state->dev, "Couldn't find pin for gpio %d\n",
> +				gpio_desc->args[0]);
> +	return -ENODEV;
>  }
>  
>  static int pmic_gpio_to_irq(struct gpio_chip *chip, unsigned pin)
> @@ -688,43 +709,124 @@ static int pmic_gpio_probe(struct platform_device *pdev)
>  	struct pinctrl_desc *pctrldesc;
>  	struct pmic_gpio_pad *pad, *pads;
>  	struct pmic_gpio_state *state;
> -	int ret, npins, i;
> -	u32 reg;
> +	int ret, npins, ngpios, i, j, pin_idx;
> +	int disallowed_count = 0;
> +	u32 reg[2], start, size;
> +	u32 *disallowed = NULL;
>  
> -	ret = of_property_read_u32(dev->of_node, "reg", &reg);
> +	ret = of_property_read_u32_array(dev->of_node, "reg", reg, 2);
>  	if (ret < 0) {
> -		dev_err(dev, "missing base address");
> +		dev_err(dev, "reg property reading failed\n");
>  		return ret;
>  	}
> +	start = reg[0];
> +	size = reg[1];
> +
> +	ngpios = size / PMIC_GPIO_ADDRESS_RANGE;
> +	if (ngpios == 0) {
> +		dev_err(dev, "no gpios assigned\n");
> +		return -ENODEV;
> +	}
>  
> -	npins = platform_irq_count(pdev);
> -	if (!npins)
> +	if (ngpios > ARRAY_SIZE(pmic_gpio_groups)) {
> +		dev_err(dev, "reg property defines %d gpios, but only %d are allowed\n",
> +				ngpios, (int)ARRAY_SIZE(pmic_gpio_groups));
>  		return -EINVAL;
> -	if (npins < 0)
> -		return npins;
> +	}
> +
> +	if (of_find_property(dev->of_node, "qcom,gpios-disallowed",
> +					&disallowed_count)) {
> +		disallowed_count /= sizeof(u32);
> +		if (disallowed_count == 0) {
> +			dev_err(dev, "No data in gpios-disallowed\n");
> +			return -EINVAL;
> +		}
>  
> -	BUG_ON(npins > ARRAY_SIZE(pmic_gpio_groups));
> +		disallowed = kcalloc(disallowed_count, sizeof(u32), GFP_KERNEL);
> +		if (disallowed == NULL)
> +			return -ENOMEM;
> +
> +		ret = of_property_read_u32_array(dev->of_node,
> +				"qcom,gpios-disallowed",
> +				disallowed, disallowed_count);
> +		if (ret < 0) {
> +			dev_err(dev, "qcom,gpios-disallowed property reading failed, ret=%d\n",
> +								ret);
> +			goto err_free;
> +		}
> +
> +		for (i = 0; i < disallowed_count; i++) {
> +			if (disallowed[i] >= ngpios + PMIC_GPIO_PHYSICAL_OFFSET
> +				|| disallowed[i] < PMIC_GPIO_PHYSICAL_OFFSET) {
> +				dev_err(dev, "invalid gpio = %d specified in qcom,gpios-disallowed, supported values: %d to %d\n",
> +					disallowed[i],
> +					PMIC_GPIO_PHYSICAL_OFFSET,
> +					ngpios - 1 + PMIC_GPIO_PHYSICAL_OFFSET);
> +				ret = -EINVAL;
> +				goto err_free;
> +			}
> +			for (j = 0; j < i; j++) {
> +				if (disallowed[i] == disallowed[j]) {
> +					dev_err(dev, "duplicate gpio = %d listed in qcom,gpios-disallowed\n",
> +							disallowed[i]);
> +					ret = -EINVAL;
> +					goto err_free;
> +				}
> +			}
> +			dev_dbg(dev, "gpio %d NOT supported\n", disallowed[i]);
> +		}
> +	} else {
> +		disallowed_count = 0;
> +	}
> +
> +	npins = ngpios - disallowed_count;
> +	if (npins <= 0) {
> +		dev_err(dev, "No pins assigned\n");
> +		ret = -ENODEV;
> +		goto err_free;
> +	}
> +	if (platform_irq_count(pdev) != npins) {
> +		dev_err(dev, "%d IRQs defined but %d expected\n",
> +				platform_irq_count(pdev), npins);
> +		ret = -EINVAL;
> +		goto err_free;
> +	}
>  
>  	state = devm_kzalloc(dev, sizeof(*state), GFP_KERNEL);
> -	if (!state)
> -		return -ENOMEM;
> +	if (!state) {
> +		ret = -ENOMEM;
> +		goto err_free;
> +	}
>  
>  	platform_set_drvdata(pdev, state);
>  
>  	state->dev = &pdev->dev;
>  	state->map = dev_get_regmap(dev->parent, NULL);
>  
> +	state->gpio_groups = devm_kcalloc(dev, sizeof(*state->gpio_groups),
> +						npins, GFP_KERNEL);
> +	if (!state->gpio_groups) {
> +		ret = -ENOMEM;
> +		goto err_free;
> +	}
> +
>  	pindesc = devm_kcalloc(dev, npins, sizeof(*pindesc), GFP_KERNEL);
> -	if (!pindesc)
> -		return -ENOMEM;
> +	if (!pindesc) {
> +		ret = -ENOMEM;
> +		goto err_free;
> +	}
>  
>  	pads = devm_kcalloc(dev, npins, sizeof(*pads), GFP_KERNEL);
> -	if (!pads)
> -		return -ENOMEM;
> +	if (!pads) {
> +		ret = -ENOMEM;
> +		goto err_free;
> +	}
>  
>  	pctrldesc = devm_kzalloc(dev, sizeof(*pctrldesc), GFP_KERNEL);
> -	if (!pctrldesc)
> -		return -ENOMEM;
> +	if (!pctrldesc) {
> +		ret = -ENOMEM;
> +		goto err_free;
> +	}
>  
>  	pctrldesc->pctlops = &pmic_gpio_pinctrl_ops;
>  	pctrldesc->pmxops = &pmic_gpio_pinmux_ops;
> @@ -738,22 +840,42 @@ static int pmic_gpio_probe(struct platform_device *pdev)
>  #ifdef CONFIG_DEBUG_FS
>  	pctrldesc->custom_conf_items = pmic_conf_items;
>  #endif
> +	for (pin_idx = 0, i = 0; i < ngpios; i++) {
> +		for (j = 0; j < disallowed_count; j++) {
> +			if (i + PMIC_GPIO_PHYSICAL_OFFSET == disallowed[j])
> +				break;
> +		}
> +		if (j != disallowed_count)
> +			continue;
>  
> -	for (i = 0; i < npins; i++, pindesc++) {
> -		pad = &pads[i];
> +		pad = &pads[pin_idx];
>  		pindesc->drv_data = pad;
> -		pindesc->number = i;
> +		pindesc->number = pin_idx;
>  		pindesc->name = pmic_gpio_groups[i];
>  
> -		pad->irq = platform_get_irq(pdev, i);
> -		if (pad->irq < 0)
> -			return pad->irq;
> +		pad->gpio_idx = i + PMIC_GPIO_PHYSICAL_OFFSET;
> +		pad->irq = platform_get_irq(pdev, pin_idx);
> +		if (pad->irq < 0) {
> +			dev_err(state->dev,
> +				"failed to get irq for gpio %d (pin %d), ret=%d\n",
> +					pad->gpio_idx, pin_idx, pad->irq);
> +			ret = pad->irq;
> +			goto err_free;
> +		}
> +		/* Every pin is a group */
> +		state->gpio_groups[pin_idx] = pmic_gpio_groups[i];
>  
> -		pad->base = reg + i * PMIC_GPIO_ADDRESS_RANGE;
> +		pad->base = start + i * PMIC_GPIO_ADDRESS_RANGE;
>  
>  		ret = pmic_gpio_populate(state, pad);
> -		if (ret < 0)
> -			return ret;
> +		if (ret < 0) {
> +			dev_err(state->dev,
> +				"failed to populate gpio %d, ret=%d\n",
> +							i, ret);
> +			goto err_free;
> +		}
> +		pindesc++;
> +		pin_idx++;
>  	}
>  
>  	state->chip = pmic_gpio_gpio_template;
> @@ -765,25 +887,29 @@ static int pmic_gpio_probe(struct platform_device *pdev)
>  	state->chip.can_sleep = false;
>  
>  	state->ctrl = devm_pinctrl_register(dev, pctrldesc, state);
> -	if (IS_ERR(state->ctrl))
> -		return PTR_ERR(state->ctrl);
> +	if (IS_ERR(state->ctrl)) {
> +		ret = PTR_ERR(state->ctrl);
> +		dev_err(state->dev, "failed to register pinctrl device, ret=%d\n",
> +							ret);
> +		goto err_free;
> +	}
>  
>  	ret = gpiochip_add_data(&state->chip, state);
>  	if (ret) {
> -		dev_err(state->dev, "can't add gpio chip\n");
> -		return ret;
> +		dev_err(state->dev, "can't add gpio chip, ret=%d\n", ret);
> +		goto err_free;
>  	}
>  
>  	ret = gpiochip_add_pin_range(&state->chip, dev_name(dev), 0, 0, npins);
>  	if (ret) {
> -		dev_err(dev, "failed to add pin range\n");
> -		goto err_range;
> +		dev_err(dev, "failed to add pin range\n, ret=%d\n", ret);
> +		gpiochip_remove(&state->chip);
> +		goto err_free;
>  	}
>  
> -	return 0;
> +err_free:
> +	kfree(disallowed);
>  
> -err_range:
> -	gpiochip_remove(&state->chip);
>  	return ret;
>  }
>  
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project.
> 
