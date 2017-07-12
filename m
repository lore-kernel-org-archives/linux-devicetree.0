From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V1 2/3] pinctrl: qcom: spmi-gpio: Add dtest route for
 digital input
Date: Wed, 12 Jul 2017 14:24:54 -0700
Message-ID: <20170712212454.GK1618@tuxbook>
References: <20170613061707.13892-1-fenglinw@codeaurora.org>
 <20170613061707.13892-3-fenglinw@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170613061707.13892-3-fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, collinsd-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org, aghayal-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org, wruan-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org, kgunda-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon 12 Jun 23:16 PDT 2017, fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org wrote:

> From: Fenglin Wu <fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> 
> Add property "qcom,dtest-buffer" to specify which dtest rail to feed
> when the pin is configured as a digital input.
> 
> Signed-off-by: Fenglin Wu <fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 15 ++++++++
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           | 45 ++++++++++++++++++++++
>  include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |  6 +++
>  3 files changed, 66 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> index 1493c0a..521c783 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> @@ -195,6 +195,21 @@ to specify in a pin configuration subnode:
>  		    Valid values are 0-3 corresponding to PMIC_GPIO_AOUT_ATESTx
>  		    defined in <dt-bindings/pinctrl/qcom,pmic-gpio.h>.
>  
> +- qcom,dtest-buffer:
> +	Usage: optional
> +	Value type: <u32>
> +	Definition: Selects DTEST rail to route to GPIO when it's configured
> +		    as a digital input.
> +		    For LV/MV GPIO subtypes, the valid values are 0-3
> +		    corresponding to PMIC_GPIO_DIN_DTESTx defined in
> +		    <dt-bindings/pinctrl/qcom,pmic-gpio.h>. Only one
> +		    DTEST rail can be selected at a time.

As with the analog lines, this is a natural number and I think we should
encode it as such in the DeviceTree.

> +		    For 4CH/8CH GPIO subtypes, supported values are 1-15.
> +		    4 DTEST rails are supported in total and more than 1 DTEST
> +		    rail can be selected simultaneously. Each bit of the
> +		    4 LSBs represent one DTEST rail, such as [3:0] = 0101
> +		    means both DTEST1 and DTEST3 are selected.

I'm not too keen on encoding this as a bitmask. I would much rather
encode it as multiple values - although that complicates the
implementation.

Or can we just ignore it? (Is the lack of support in the newer chips a
result of no-one using this?)

> +
>  Example:
>  
>  	pm8921_gpio: gpio@150 {
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
[..]
> @@ -512,6 +526,13 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
>  				return -EINVAL;
>  			pad->atest = arg;
>  			break;
> +		case PMIC_GPIO_CONF_DTEST_BUFFER:
> +			if ((pad->lv_mv_type && arg > PMIC_GPIO_DIN_DTEST4)
> +					|| (!pad->lv_mv_type && arg >
> +					PMIC_GPIO_DIG_IN_DTEST_SEL_MASK))
> +				return -EINVAL;
> +			pad->dtest_buffer = arg;
> +			break;
>  		default:
>  			return -EINVAL;
>  		}
> @@ -544,6 +565,17 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
>  			val = PMIC_GPIO_MODE_DIGITAL_OUTPUT;
>  	}
>  

Remember that you're supposed to be able to have two different states
defines, one with dtest-buffer and one without - and switching between
them should enable _and_ disable the dtest buffer.

So you need to detect the absence of qcom,dtest-buffer and you need to
write the register in this case as well. So before looping over all the
config parameters, set pad->dtest_buffer to "disabled" and when you get
here it will either be disabled or have the specified value.

> +	if (pad->dtest_buffer != INT_MAX) {
> +		val = pad->dtest_buffer;
> +		if (pad->lv_mv_type)
> +			val |= PMIC_GPIO_LV_MV_DIG_IN_DTEST_EN;
> +

Instead of representing "disabled" as INT_MAX, you could keep track of
it in the same representation as the hardware, i.e. 0 would be disabled.

The additional effort would be in the lv_mv case that you need to mask
in PMIC_GPIO_LV_MV_DIG_IN_DTEST_EN in the few places where you actually
enable dtest buffering.

> +		ret = pmic_gpio_write(state, pad,
> +				PMIC_GPIO_REG_DIG_IN_CTL, val);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
[..]
> diff --git a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
> index 85d8809..21738ed 100644
> --- a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
> +++ b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
> @@ -99,6 +99,12 @@
>  #define PMIC_GPIO_AOUT_ATEST3		2
>  #define PMIC_GPIO_AOUT_ATEST4		3
>  
> +/* DTEST buffer for digital input mode */
> +#define PMIC_GPIO_DIN_DTEST1		0
> +#define PMIC_GPIO_DIN_DTEST2		1
> +#define PMIC_GPIO_DIN_DTEST3		2
> +#define PMIC_GPIO_DIN_DTEST4		3
> +

Please drop these defines.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
