From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V1 1/3] pinctrl: qcom: spmi-gpio: Add support for GPIO
 LV/MV subtype
Date: Sun, 18 Jun 2017 09:04:56 -0500
Message-ID: <20170618140456.orzknmxg4fpce4tk@rob-hp-laptop>
References: <20170613061707.13892-1-fenglinw@codeaurora.org>
 <20170613061707.13892-2-fenglinw@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170613061707.13892-2-fenglinw@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: fenglinw@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-soc@vger.kernel.org, collinsd@quicinc.com, aghayal@qti.qualcomm.com, wruan@quicinc.com, kgunda@qti.qualcomm.com
List-Id: devicetree@vger.kernel.org

On Tue, Jun 13, 2017 at 02:16:03PM +0800, fenglinw@codeaurora.org wrote:
> From: Fenglin Wu <fenglinw@codeaurora.org>
> 
> GPIO LV (low voltage)/MV (medium voltage) subtypes have different
> features and register mappings than 4CH/8CH subtypes. Add support
> for LV and MV subtypes.
> 
> Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
> ---
>  .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt |  28 ++-
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           | 269 ++++++++++++++++++---
>  include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |   9 +
>  3 files changed, 264 insertions(+), 42 deletions(-)

[...]

> diff --git a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
> index d33f17c..85d8809 100644
> --- a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
> +++ b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
> @@ -93,15 +93,24 @@
>  #define PM8994_GPIO_S4			2
>  #define PM8994_GPIO_L12			3
>  
> +/* ATEST MUX selection for analog-pass-through mode */
> +#define PMIC_GPIO_AOUT_ATEST1		0
> +#define PMIC_GPIO_AOUT_ATEST2		1
> +#define PMIC_GPIO_AOUT_ATEST3		2
> +#define PMIC_GPIO_AOUT_ATEST4		3
> +
>  /* To be used with "function" */
>  #define PMIC_GPIO_FUNC_NORMAL		"normal"
>  #define PMIC_GPIO_FUNC_PAIRED		"paired"
>  #define PMIC_GPIO_FUNC_FUNC1		"func1"
>  #define PMIC_GPIO_FUNC_FUNC2		"func2"
> +#define PMIC_GPIO_FUNC_FUNC3		"func3"
> +#define PMIC_GPIO_FUNC_FUNC4		"func4"
>  #define PMIC_GPIO_FUNC_DTEST1		"dtest1"
>  #define PMIC_GPIO_FUNC_DTEST2		"dtest2"
>  #define PMIC_GPIO_FUNC_DTEST3		"dtest3"
>  #define PMIC_GPIO_FUNC_DTEST4		"dtest4"
> +#define PMIC_GPIO_FUNC_ANALOG		"analog"

defines for strings? That's really pointless. I'd prefer you drop using 
them than add more.

Rob
