From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V1] pinctrl: qcom: spmi-gpio: Add support for
 qcom,gpios-disallowed property
Date: Mon, 24 Jul 2017 14:09:49 -0500
Message-ID: <20170724190949.y45cx4zextmvb4tn@rob-hp-laptop>
References: <20170719071804.3816-1-fenglinw@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170719071804.3816-1-fenglinw@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
To: fenglinw@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, collinsd@codeaurora.org, aghayal@codeaurora.org, wruan@codeaurora.org, kgunda@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 19, 2017 at 03:17:07PM +0800, fenglinw@codeaurora.org wrote:
> From: Fenglin Wu <fenglinw@codeaurora.org>
> 
> Add support for qcom,gpios-disallowed property which is used to exclude
> PMIC GPIOs not owned by the APSS processor from the pinctrl device.
> 
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

Isn't simply not assigning GPIOs to anything in the DT sufficient to not 
use GPIOs?

Rob

