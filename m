From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: Add msm8998 pinctrl driver
Date: Thu, 12 Jan 2017 08:20:37 -0800
Message-ID: <20170112162037.GA27322@minitux>
References: <1483974019-8235-1-git-send-email-kimran@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1483974019-8235-1-git-send-email-kimran@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Imran Khan <kimran@codeaurora.org>
Cc: andy.gross@linaro.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Brown <david.brown@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon 09 Jan 07:00 PST 2017, Imran Khan wrote:

> diff --git a/drivers/pinctrl/qcom/pinctrl-msm8998.c b/drivers/pinctrl/qcom/pinctrl-msm8998.c
[..]
> +
> +#define NORTH	0x500000
> +#define WEST	0x100000
> +#define EAST	0x900000

So the control registers are now laid out in 3 non-contiguous ranges?
Please move them to the top of the file.

> +#define REG_SIZE 0x1000

Just inline 0x1000 in the macro below.

> +#define PINGROUP(id, base, f1, f2, f3, f4, f5, f6, f7, f8, f9)	\
> +	{					        \
> +		.name = "gpio" #id,			\
> +		.pins = gpio##id##_pins,		\
> +		.npins = (unsigned int)ARRAY_SIZE(gpio##id##_pins),	\
> +		.funcs = (int[]){			\
> +			msm_mux_gpio, /* gpio mode */	\
> +			msm_mux_##f1,			\
> +			msm_mux_##f2,			\
> +			msm_mux_##f3,			\
> +			msm_mux_##f4,			\
> +			msm_mux_##f5,			\
> +			msm_mux_##f6,			\
> +			msm_mux_##f7,			\
> +			msm_mux_##f8,			\
> +			msm_mux_##f9			\
> +		},				        \
> +		.nfuncs = 10,				\
> +		.ctl_reg = base + REG_SIZE * id,	\
> +		.io_reg = base + 0x4 + REG_SIZE * id,		\
> +		.intr_cfg_reg = base + 0x8 + REG_SIZE * id,	\
> +		.intr_status_reg = base + 0xc + REG_SIZE * id,	\
> +		.intr_target_reg = base + 0x8 + REG_SIZE * id,	\
> +		.mux_bit = 2,			\
> +		.pull_bit = 0,			\
> +		.drv_bit = 6,			\
> +		.oe_bit = 9,			\
> +		.in_bit = 0,			\
> +		.out_bit = 1,			\
> +		.intr_enable_bit = 0,		\
> +		.intr_status_bit = 0,		\
> +		.intr_target_bit = 5,		\
> +		.intr_target_kpss_val = 3,  \
> +		.intr_raw_status_bit = 4,	\
> +		.intr_polarity_bit = 1,		\
> +		.intr_detection_bit = 2,	\
> +		.intr_detection_width = 2,	\
> +	}
> +
> +#define SDC_QDSD_PINGROUP(pg_name, ctl, pull, drv)	\
> +	{					        \
> +		.name = #pg_name,			\
> +		.pins = pg_name##_pins,			\
> +		.npins = (unsigned int)ARRAY_SIZE(pg_name##_pins),	\
> +		.ctl_reg = ctl,				\
> +		.io_reg = 0,				\
> +		.intr_cfg_reg = 0,			\
> +		.intr_status_reg = 0,			\
> +		.intr_target_reg = 0,			\
> +		.mux_bit = -1,				\
> +		.pull_bit = pull,			\
> +		.drv_bit = drv,				\
> +		.oe_bit = -1,				\
> +		.in_bit = -1,				\
> +		.out_bit = -1,				\
> +		.intr_enable_bit = -1,			\
> +		.intr_status_bit = -1,			\
> +		.intr_target_bit = -1,			\
> +		.intr_raw_status_bit = -1,		\
> +		.intr_polarity_bit = -1,		\
> +		.intr_detection_bit = -1,		\
> +		.intr_detection_width = -1,		\
> +	}
> +
> +#define UFS_RESET(pg_name, offset)				\
> +	{					        \
> +		.name = #pg_name,			\
> +		.pins = pg_name##_pins,			\
> +		.npins = (unsigned int)ARRAY_SIZE(pg_name##_pins),	\
> +		.ctl_reg = offset,			\
> +		.io_reg = offset + 0x4,			\
> +		.intr_cfg_reg = 0,			\
> +		.intr_status_reg = 0,			\
> +		.intr_target_reg = 0,			\
> +		.mux_bit = -1,				\
> +		.pull_bit = 3,				\
> +		.drv_bit = 0,				\
> +		.oe_bit = -1,				\
> +		.in_bit = -1,				\
> +		.out_bit = 0,				\
> +		.intr_enable_bit = -1,			\
> +		.intr_status_bit = -1,			\
> +		.intr_target_bit = -1,			\
> +		.intr_raw_status_bit = -1,		\
> +		.intr_polarity_bit = -1,		\
> +		.intr_detection_bit = -1,		\
> +		.intr_detection_width = -1,		\
> +	}

Please add an empty line here.

> +static const struct pinctrl_pin_desc msm8998_pins[] = {
[..]
> +enum msm8998_functions {
[..]
> +	msm_mux_phase_flag6,
> +	msm_mux_phase_flag29,
> +	msm_mux_phase_flag30,
> +	msm_mux_phase_flag31,

With the Qualcomm pinctrl driver it's possible to specify configuration
in DT for a subset of pins of a group. So I think you should squash the
"phase_flag"s and "atest_char" into one group each.

> +	msm_mux_pa_indicator,
> +	msm_mux_ssbi1,
> +	msm_mux_isense_dbg,
> +	msm_mux_mss_lte,
> +	msm_mux_gpio,
> +	msm_mux_NA,
> +};
[..]
> +static const struct msm_pingroup msm8998_groups[] = {
> +	PINGROUP(0, EAST, blsp_spi1, blsp_uart1_a, blsp_uim1_a, NA, NA, NA, NA,
> +		 NA, NA),

Please do ignore the 80-char "rule" and skip the line break on
these - it makes the table easier to read.

[..]
> +};
> +
> +static const struct msm_pinctrl_soc_data msm8998_pinctrl = {
> +	.pins = msm8998_pins,
> +	.npins = ARRAY_SIZE(msm8998_pins),
> +	.functions = msm8998_functions,
> +	.nfunctions = ARRAY_SIZE(msm8998_functions),
> +	.groups = msm8998_groups,
> +	.ngroups = ARRAY_SIZE(msm8998_groups),
> +	.ngpios = 153,

ngpios is 150

> +};
> +

Regards,
Bjorn
