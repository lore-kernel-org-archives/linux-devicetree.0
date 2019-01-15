From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 03/14] pinctrl: qcom: spmi-gpio: hardcode IRQ counts
Date: Mon, 14 Jan 2019 16:34:28 -0800
Message-ID: <20190115003428.GJ9278@minitux>
References: <20190113154716.5145-1-masneyb@onstation.org>
 <20190113154716.5145-4-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190113154716.5145-4-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: linus.walleij@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun 13 Jan 07:47 PST 2019, Brian Masney wrote:

> The probing of this driver calls platform_irq_count, which will
> setup all of the IRQs that are configured in device tree. In
> preparation for converting this driver to be a hierarchical IRQ
> chip, hardcode the IRQ count based on the hardware type so that all
> the IRQs are not configured immediately and are configured on an
> as-needed basis later in the boot process. This change will also
> allow for the removal of the interrupts property later in this
> patch series once the hierarchical IRQ chip support is in.
> 
> This patch also removes the generic qcom,spmi-gpio OF match since we
> don't know the number of pins. All of the existing upstream bindings
> already include the more-specific binding.
> 
> The pm8941 code was tested on a LG Nexus 5 (hammerhead) phone.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> Changes since v3:
> - More variants are now included. I missed these since I searched for
>   qcom,spmi-gpio in the arm dts, and missed the ones in the arm64 dts.
> 
> Changes since v2:
> - Don't move pmic_gpio_of_match block. Use device_get_match_data instead
>   of of_match_device.
> - Correct build warning on arm64: warning: cast from pointer to integer
>   of different size
> 
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 28 ++++++++++--------------
>  1 file changed, 11 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index 5f2977982ef1..b74c44357e8a 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -951,13 +951,7 @@ static int pmic_gpio_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	npins = platform_irq_count(pdev);
> -	if (!npins)
> -		return -EINVAL;
> -	if (npins < 0)
> -		return npins;
> -
> -	BUG_ON(npins > ARRAY_SIZE(pmic_gpio_groups));
> +	npins = (u16)(uintptr_t) device_get_match_data(&pdev->dev);

Why u16, afaict npins is an int? I'm pretty sure you can leave the last
cast as implicit and as it's not actually a pointer that we're acquiring
casting it to "unsigned long" is the idiomatic way.

Apart from this the change looks good.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

>  
>  	state = devm_kzalloc(dev, sizeof(*state), GFP_KERNEL);
>  	if (!state)
> @@ -1063,16 +1057,16 @@ static int pmic_gpio_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id pmic_gpio_of_match[] = {
> -	{ .compatible = "qcom,pm8005-gpio" },	/* 4 GPIO's */
> -	{ .compatible = "qcom,pm8916-gpio" },	/* 4 GPIO's */
> -	{ .compatible = "qcom,pm8941-gpio" },	/* 36 GPIO's */
> -	{ .compatible = "qcom,pm8994-gpio" },	/* 22 GPIO's */
> -	{ .compatible = "qcom,pmi8994-gpio" },  /* 10 GPIO's */
> -	{ .compatible = "qcom,pm8998-gpio" },	/* 26 GPIO's */
> -	{ .compatible = "qcom,pmi8998-gpio" },	/* 14 GPIO's */
> -	{ .compatible = "qcom,pma8084-gpio" },	/* 22 GPIO's */
> -	{ .compatible = "qcom,pms405-gpio" },	/* 12 GPIO's, holes on 1 9 10 */
> -	{ .compatible = "qcom,spmi-gpio" }, /* Generic */
> +	{ .compatible = "qcom,pm8005-gpio", .data = (void *) 4 },
> +	{ .compatible = "qcom,pm8916-gpio", .data = (void *) 4 },
> +	{ .compatible = "qcom,pm8941-gpio", .data = (void *) 36 },
> +	{ .compatible = "qcom,pm8994-gpio", .data = (void *) 22 },
> +	{ .compatible = "qcom,pmi8994-gpio", .data = (void *) 10 },
> +	{ .compatible = "qcom,pm8998-gpio", .data = (void *) 26 },
> +	{ .compatible = "qcom,pmi8998-gpio", .data = (void *) 14 },
> +	{ .compatible = "qcom,pma8084-gpio", .data = (void *) 22 },
> +	/* pms405 has 12 GPIOs with holes on 1, 9, and 10 */
> +	{ .compatible = "qcom,pms405-gpio", .data = (void *) 12 },
>  	{ },
>  };
>  
> -- 
> 2.17.2
> 
