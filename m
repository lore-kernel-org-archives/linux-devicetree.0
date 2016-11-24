From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH 3/3] pinctrl: sx150x: add support for sx1501, sx1504,
 sx1505 and sx1507
Date: Thu, 24 Nov 2016 22:02:24 +0100
Message-ID: <426fb28b-fa0e-f3a2-3bf7-dfe2761c78f6@axentia.se>
References: <1480020320-28354-1-git-send-email-peda@axentia.se>
 <1480020320-28354-4-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1480020320-28354-4-git-send-email-peda@axentia.se>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2016-11-24 21:45, Peter Rosin wrote:
> Untested, register offsets carefully copied from datasheets.
> 
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  .../devicetree/bindings/pinctrl/pinctrl-sx150x.txt |  8 +-
>  drivers/pinctrl/pinctrl-sx150x.c                   | 98 ++++++++++++++++++++++
>  2 files changed, 104 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt
> index 83f8d5c449ba..bf76867168e9 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt
> @@ -6,9 +6,13 @@ pin controller, GPIO, and interrupt bindings.
>  
>  Required properties:
>  - compatible: should be one of :
> +			"semtech,sx1501q",
>  			"semtech,sx1502q",
>  			"semtech,sx1503q",
> +			"semtech,sx1504q",
> +			"semtech,sx1505q",
>  			"semtech,sx1506q",
> +			"semtech,sx1507q",
>  			"semtech,sx1508q",
>  			"semtech,sx1509q".
>  
> @@ -28,7 +32,7 @@ Optional properties :
>  - interrupt-controller: Marks the device as a interrupt controller.
>  
>  - semtech,probe-reset: Will trigger a reset of the GPIO expander on probe,
> -		only for sx1508q and sx1509q
> +		only for sx1507q, sx1508q and sx1509q
>  
>  The GPIO expander can optionally be used as an interrupt controller, in
>  which case it uses the default two cell specifier.
> @@ -43,7 +47,7 @@ Optional properties for pin configuration sub-nodes:
>   - bias-pull-down: pull down the pin, except the OSCIO pin
>   - bias-pull-pin-default: use pin-default pull state, except the OSCIO pin
>   - drive-push-pull: drive actively high and low
> - - drive-open-drain: drive with open drain only for sx1508q and sx1509q and except the OSCIO pin
> + - drive-open-drain: drive with open drain only for sx1507q, sx1508q and sx1509q and except the OSCIO pin
>   - output-low: set the pin to output mode with low level
>   - output-high: set the pin to output mode with high level
>  
> diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
> index 97df9302e84b..eb6adbbd33f0 100644
> --- a/drivers/pinctrl/pinctrl-sx150x.c
> +++ b/drivers/pinctrl/pinctrl-sx150x.c
> @@ -116,6 +116,14 @@ struct sx150x_pinctrl {
>  	const struct sx150x_device_data *data;
>  };
>  
> +static const struct pinctrl_pin_desc sx150x_4_pins[] = {
> +	PINCTRL_PIN(0, "gpio0"),
> +	PINCTRL_PIN(1, "gpio1"),
> +	PINCTRL_PIN(2, "gpio2"),
> +	PINCTRL_PIN(3, "gpio3"),
> +	PINCTRL_PIN(8, "oscio"),

Should of course be:
+	PINCTRL_PIN(4, "oscio"),

If you want an updated patch, just ask...

Cheers,
Peter

> +};
> +
>  static const struct pinctrl_pin_desc sx150x_8_pins[] = {
>  	PINCTRL_PIN(0, "gpio0"),
>  	PINCTRL_PIN(1, "gpio1"),
> @@ -148,6 +156,26 @@ static const struct pinctrl_pin_desc sx150x_16_pins[] = {
>  	PINCTRL_PIN(16, "oscio"),
>  };
>  
> +static const struct sx150x_device_data sx1501q_device_data = {
> +	.model = SX150X_123,
> +	.reg_pullup	= 0x02,
> +	.reg_pulldn	= 0x03,
> +	.reg_dir	= 0x01,
> +	.reg_data	= 0x00,
> +	.reg_irq_mask	= 0x05,
> +	.reg_irq_src	= 0x08,
> +	.reg_sense	= 0x07,
> +	.pri.x123 = {
> +		.reg_pld_mode	= 0x10,
> +		.reg_pld_table0	= 0x11,
> +		.reg_pld_table2	= 0x13,
> +		.reg_advance	= 0xad,
> +	},
> +	.ngpios	= 4,
> +	.pins = sx150x_4_pins,
> +	.npins = 4, /* oscio not available */
> +};
> +
>  static const struct sx150x_device_data sx1502q_device_data = {
>  	.model = SX150X_123,
>  	.reg_pullup	= 0x02,
> @@ -194,6 +222,47 @@ static const struct sx150x_device_data sx1503q_device_data = {
>  	.npins  = 16, /* oscio not available */
>  };
>  
> +static const struct sx150x_device_data sx1504q_device_data = {
> +	.model = SX150X_456,
> +	.reg_pullup	= 0x02,
> +	.reg_pulldn	= 0x03,
> +	.reg_dir	= 0x01,
> +	.reg_data	= 0x00,
> +	.reg_irq_mask	= 0x05,
> +	.reg_irq_src	= 0x08,
> +	.reg_sense	= 0x07,
> +	.pri.x456 = {
> +		.reg_pld_mode	= 0x10,
> +		.reg_pld_table0	= 0x11,
> +		.reg_pld_table2	= 0x13,
> +	},
> +	.ngpios	= 4,
> +	.pins = sx150x_4_pins,
> +	.npins = 4, /* oscio not available */
> +};
> +
> +static const struct sx150x_device_data sx1505q_device_data = {
> +	.model = SX150X_456,
> +	.reg_pullup	= 0x02,
> +	.reg_pulldn	= 0x03,
> +	.reg_dir	= 0x01,
> +	.reg_data	= 0x00,
> +	.reg_irq_mask	= 0x05,
> +	.reg_irq_src	= 0x08,
> +	.reg_sense	= 0x06,
> +	.pri.x456 = {
> +		.reg_pld_mode	= 0x10,
> +		.reg_pld_table0	= 0x11,
> +		.reg_pld_table1	= 0x12,
> +		.reg_pld_table2	= 0x13,
> +		.reg_pld_table3	= 0x14,
> +		.reg_pld_table4	= 0x15,
> +	},
> +	.ngpios	= 8,
> +	.pins = sx150x_8_pins,
> +	.npins = 8, /* oscio not available */
> +};
> +
>  static const struct sx150x_device_data sx1506q_device_data = {
>  	.model = SX150X_456,
>  	.reg_pullup	= 0x04,
> @@ -217,6 +286,27 @@ static const struct sx150x_device_data sx1506q_device_data = {
>  	.npins = 16, /* oscio not available */
>  };
>  
> +static const struct sx150x_device_data sx1507q_device_data = {
> +	.model = SX150X_789,
> +	.reg_pullup	= 0x03,
> +	.reg_pulldn	= 0x04,
> +	.reg_dir	= 0x07,
> +	.reg_data	= 0x08,
> +	.reg_irq_mask	= 0x09,
> +	.reg_irq_src	= 0x0b,
> +	.reg_sense	= 0x0a,
> +	.pri.x789 = {
> +		.reg_drain	= 0x05,
> +		.reg_polarity	= 0x06,
> +		.reg_clock	= 0x0d,
> +		.reg_misc	= 0x0e,
> +		.reg_reset	= 0x7d,
> +	},
> +	.ngpios = 4,
> +	.pins = sx150x_4_pins,
> +	.npins = ARRAY_SIZE(sx150x_4_pins),
> +};
> +
>  static const struct sx150x_device_data sx1508q_device_data = {
>  	.model = SX150X_789,
>  	.reg_pullup	= 0x03,
> @@ -758,18 +848,26 @@ static const struct pinconf_ops sx150x_pinconf_ops = {
>  };
>  
>  static const struct i2c_device_id sx150x_id[] = {
> +	{"sx1501q", (kernel_ulong_t) &sx1501q_device_data },
>  	{"sx1502q", (kernel_ulong_t) &sx1502q_device_data },
>  	{"sx1503q", (kernel_ulong_t) &sx1503q_device_data },
> +	{"sx1504q", (kernel_ulong_t) &sx1504q_device_data },
> +	{"sx1505q", (kernel_ulong_t) &sx1505q_device_data },
>  	{"sx1506q", (kernel_ulong_t) &sx1506q_device_data },
> +	{"sx1507q", (kernel_ulong_t) &sx1507q_device_data },
>  	{"sx1508q", (kernel_ulong_t) &sx1508q_device_data },
>  	{"sx1509q", (kernel_ulong_t) &sx1509q_device_data },
>  	{}
>  };
>  
>  static const struct of_device_id sx150x_of_match[] = {
> +	{ .compatible = "semtech,sx1501q", .data = &sx1501q_device_data },
>  	{ .compatible = "semtech,sx1502q", .data = &sx1502q_device_data },
>  	{ .compatible = "semtech,sx1503q", .data = &sx1503q_device_data },
> +	{ .compatible = "semtech,sx1504q", .data = &sx1504q_device_data },
> +	{ .compatible = "semtech,sx1505q", .data = &sx1505q_device_data },
>  	{ .compatible = "semtech,sx1506q", .data = &sx1506q_device_data },
> +	{ .compatible = "semtech,sx1507q", .data = &sx1507q_device_data },
>  	{ .compatible = "semtech,sx1508q", .data = &sx1508q_device_data },
>  	{ .compatible = "semtech,sx1509q", .data = &sx1509q_device_data },
>  	{},
> 

