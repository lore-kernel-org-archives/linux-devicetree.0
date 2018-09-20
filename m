From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: Add pms405 gpio support
Date: Wed, 19 Sep 2018 18:56:27 -0700
Message-ID: <20180920015627.GB1367@tuxbook-pro>
References: <20180920014705.15144-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180920014705.15144-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed 19 Sep 18:47 PDT 2018, Bjorn Andersson wrote:

> From: Vinod Koul <vkoul@kernel.org>
> 
> Update the binding and driver for pms405-gpios
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 ++
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                     | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> index ffd4345415f3..ab4000eab07d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> @@ -19,6 +19,7 @@ PMIC's from Qualcomm.
>  		    "qcom,pm8998-gpio"
>  		    "qcom,pma8084-gpio"
>  		    "qcom,pmi8994-gpio"
> +		    "qcom,pms405-gpio"
>  
>  		    And must contain either "qcom,spmi-gpio" or "qcom,ssbi-gpio"
>  		    if the device is on an spmi bus or an ssbi bus respectively
> @@ -91,6 +92,7 @@ to specify in a pin configuration subnode:
>  		    gpio1-gpio26 for pm8998
>  		    gpio1-gpio22 for pma8084
>  		    gpio1-gpio10 for pmi8994
> +		    gpio1-gpio11 for pms405
>  
>  - function:
>  	Usage: required
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index a29efbe08f48..b54891998caa 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1055,6 +1055,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
>  	{ .compatible = "qcom,pm8994-gpio" },	/* 22 GPIO's */
>  	{ .compatible = "qcom,pmi8994-gpio" },  /* 10 GPIO's */
>  	{ .compatible = "qcom,pma8084-gpio" },	/* 22 GPIO's */
> +	{ .compatible = "qcom,pms405-gpio" }, /* 11 GPIO's */
>  	{ .compatible = "qcom,spmi-gpio" }, /* Generic */
>  	{ },
>  };
> -- 
> 2.18.0
> 
