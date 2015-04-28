From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: Re: [PATCH V3 2/2] pinctrl: Add Pistachio SoC pin control driver
Date: Tue, 28 Apr 2015 19:40:53 -0300
Message-ID: <55400C75.9070609@imgtec.com>
References: <1428435862-14354-1-git-send-email-abrestic@chromium.org> <1428435862-14354-3-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1428435862-14354-3-git-send-email-abrestic@chromium.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, Govindraj Raja <govindraj.raja@imgtec.com>, Kevin Cernekee <cernekee@chromium.org>, Paul Bolle <pebolle@tiscali.nl>
List-Id: devicetree@vger.kernel.org

Just a silly comment.

On 04/07/2015 04:44 PM, Andrew Bresticker wrote:
[..]
> +
> +static const struct pinmux_ops pistachio_pinmux_ops = {
> +	.get_functions_count = pistachio_pinmux_get_functions_count,
> +	.get_function_name = pistachio_pinmux_get_function_name,
> +	.get_function_groups = pistachio_pinmux_get_function_groups,
> +	.set_mux = pistachio_pinmux_enable,
> +};
> +
> +static int pistachio_pinconf_get(struct pinctrl_dev *pctldev, unsigned pin,
> +				 unsigned long *config)
> +{
> +	struct pistachio_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
> +	enum pin_config_param param = pinconf_to_config_param(*config);
> +	u32 val, arg;
> +
> +	switch (param) {
> +	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> +		val = pctl_readl(pctl, PADS_SCHMITT_EN_REG(pin));
> +		arg = !!(val & PADS_SCHMITT_EN_BIT(pin));
> +		break;
> +	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
> +		val = pctl_readl(pctl, PADS_PU_PD_REG(pin)) >>
> +			PADS_PU_PD_SHIFT(pin);
> +		arg = (val & PADS_PU_PD_MASK) == PADS_PU_PD_HIGHZ;
> +		break;
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +		val = pctl_readl(pctl, PADS_PU_PD_REG(pin)) >>
> +			PADS_PU_PD_SHIFT(pin);
> +		arg = (val & PADS_PU_PD_MASK) == PADS_PU_PD_UP;
> +		break;
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +		val = pctl_readl(pctl, PADS_PU_PD_REG(pin)) >>
> +			PADS_PU_PD_SHIFT(pin);
> +		arg = (val & PADS_PU_PD_MASK) == PADS_PU_PD_DOWN;
> +		break;
> +	case PIN_CONFIG_BIAS_BUS_HOLD:
> +		val = pctl_readl(pctl, PADS_PU_PD_REG(pin)) >>
> +			PADS_PU_PD_SHIFT(pin);
> +		arg = (val & PADS_PU_PD_MASK) == PADS_PU_PD_BUS;
> +		break;
> +	case PIN_CONFIG_SLEW_RATE:
> +		val = pctl_readl(pctl, PADS_SLEW_RATE_REG(pin));
> +		arg = !!(val & PADS_SLEW_RATE_BIT(pin));
> +		break;
> +	case PIN_CONFIG_DRIVE_STRENGTH:
> +		val = pctl_readl(pctl, PADS_DRIVE_STRENGTH_REG(pin)) >>
> +			PADS_DRIVE_STRENGTH_SHIFT(pin);
> +		switch (val & PADS_DRIVE_STRENGTH_MASK) {
> +		case PADS_DRIVE_STRENGTH_2MA:
> +			arg = 2;
> +			break;
> +		case PADS_DRIVE_STRENGTH_4MA:
> +			arg = 4;
> +			break;
> +		case PADS_DRIVE_STRENGTH_8MA:
> +			arg = 8;
> +			break;
> +		case PADS_DRIVE_STRENGTH_12MA:
> +		default:
> +			arg = 12;
> +			break;
> +		}
> +		break;
> +	default:
> +		dev_err(pctl->dev, "Property %u not supported\n", param);

Probably just a nitpick, but maybe this should be dev_dbg. Otherwise,
we'll get a ton of these errors when cat'ing pinconf-pins in debugfs.

> +		return -EINVAL;

And this should be -ENOTSUPP. I guess it doesn't matter much.

-- 
Ezequiel
