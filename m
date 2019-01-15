From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 02/14] pinctrl: qcom: spmi-gpio: add support for three
 new variants
Date: Mon, 14 Jan 2019 16:28:39 -0800
Message-ID: <20190115002839.GI9278@minitux>
References: <20190113154716.5145-1-masneyb@onstation.org>
 <20190113154716.5145-3-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190113154716.5145-3-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: linus.walleij@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun 13 Jan 07:47 PST 2019, Brian Masney wrote:

> Add support for qcom,pm8005-gpio, qcom,pm8998-gpio, and
> qcom,pmi8998-gpio. These three variants are already in use in some
> arm64 dtsi files. Those boards work since the generic binding
> qcom,spmi-gpio is also specified.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> This is a new patch introduced in V4.
> 
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index 4458d44dfcf6..5f2977982ef1 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1063,10 +1063,13 @@ static int pmic_gpio_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id pmic_gpio_of_match[] = {
> +	{ .compatible = "qcom,pm8005-gpio" },	/* 4 GPIO's */
>  	{ .compatible = "qcom,pm8916-gpio" },	/* 4 GPIO's */
>  	{ .compatible = "qcom,pm8941-gpio" },	/* 36 GPIO's */
>  	{ .compatible = "qcom,pm8994-gpio" },	/* 22 GPIO's */
>  	{ .compatible = "qcom,pmi8994-gpio" },  /* 10 GPIO's */
> +	{ .compatible = "qcom,pm8998-gpio" },	/* 26 GPIO's */
> +	{ .compatible = "qcom,pmi8998-gpio" },	/* 14 GPIO's */
>  	{ .compatible = "qcom,pma8084-gpio" },	/* 22 GPIO's */
>  	{ .compatible = "qcom,pms405-gpio" },	/* 12 GPIO's, holes on 1 9 10 */
>  	{ .compatible = "qcom,spmi-gpio" }, /* Generic */
> -- 
> 2.17.2
> 
