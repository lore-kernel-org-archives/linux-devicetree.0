From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2] Add driver for the si514 clock generator chip
Date: Thu, 1 Oct 2015 16:34:07 -0700
Message-ID: <20151001233407.GW19319@codeaurora.org>
References: <1442478495-23522-1-git-send-email-mike.looijmans@topic.nl>
 <1442487891-20477-1-git-send-email-mike.looijmans@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1442487891-20477-1-git-send-email-mike.looijmans@topic.nl>
Sender: linux-clk-owner@vger.kernel.org
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/17, Mike Looijmans wrote:
> This patch adds the driver and devicetree documentation for the
> Silicon Labs SI514 clock generator chip. This is an I2C controlled
> oscilator capable of generating clock signals ranging from 100kHz

s/oscilator/oscillator/

> to 250MHz.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> diff --git a/Documentation/devicetree/bindings/clock/silabs,si514.txt b/Documentation/devicetree/bindings/clock/silabs,si514.txt
> new file mode 100644
> index 0000000..05964d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/silabs,si514.txt
> @@ -0,0 +1,27 @@
> +Binding for Silicon Labs 514 programmable I2C clock generator.
> +
> +Reference
> +This binding uses the common clock binding[1]. Details about the device can be
> +found in the datasheet[2].
> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +[2] Si514 datasheet
> +    http://www.silabs.com/Support%20Documents/TechnicalDocs/si514.pdf
> +
> +Required properties:
> + - compatible: Shall be "silabs,si514"
> + - reg: I2C device address.
> + - #clock-cells: From common clock bindings: Shall be 0.
> +
> +Optional properties:
> + - clock-output-names: From common clock bindings. Recommended to be "si514".
> + - clock-frequency: Output frequency to generate. This defines the output
> +		    frequency set during boot. It can be reprogrammed during
> +		    runtime through the common clock framework.

Can we use assigned clock rates instead of this property?

> +
> +Example:
> +	si514: clock-generator@55 {
> +		reg = <0x55>;
> +		#clock-cells = <0>;
> +		compatible = "silabs,si514";
> +	};
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 42f7120..6ac7deb5 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -68,6 +68,16 @@ config COMMON_CLK_SI5351
>  	  This driver supports Silicon Labs 5351A/B/C programmable clock
>  	  generators.
>  
> +config COMMON_CLK_SI514
> +	tristate "Clock driver for SiLabs 514 devices"
> +	depends on I2C
> +	depends on OF

It actually depends on this to build?

> +	select REGMAP_I2C
> +	help
> +	---help---
> +	  This driver supports the Silicon Labs 514 programmable clock
> +	  generator.
> +
>  config COMMON_CLK_SI570
>  	tristate "Clock driver for SiLabs 570 and compatible devices"
>  	depends on I2C
> diff --git a/drivers/clk/clk-si514.c b/drivers/clk/clk-si514.c
> new file mode 100644
> index 0000000..ca70818
> --- /dev/null
> +++ b/drivers/clk/clk-si514.c
> @@ -0,0 +1,393 @@
> +
> +#include <linux/clk-provider.h>

I'd expect some sort of linux/clk.h include here if we're using
clk APIs.

> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
[...]
> +
> +/* Program clock settings into hardware */

This comment is useless.

> +static int si514_set_muldiv(struct clk_si514 *data,
> +	struct clk_si514_muldiv *settings)
> +{
> +	u8 lp;
> +	u8 reg[7];
> +	int err;
> +
> +	/* Calculate LP1/LP2 according to table 13 in the datasheet */
> +	/* 65.259980246 */
> +	if ((settings->m_int < 65) ||
> +		((settings->m_int == 65) && (settings->m_frac <= 139575831)))
> +		lp = 0x22;
> +	/* 67.859763463 */
> +	else if ((settings->m_int < 67) ||
> +		((settings->m_int == 67) && (settings->m_frac <= 461581994)))
> +		lp = 0x23;
> +	/* 72.937624981 */
> +	else if ((settings->m_int < 72) ||
> +		((settings->m_int == 72) && (settings->m_frac <= 503383578)))
> +		lp = 0x33;
> +	/* 75.843265046 */
> +	else if ((settings->m_int < 75) ||
> +		((settings->m_int == 75) && (settings->m_frac <= 452724474)))
> +		lp = 0x34;

Drop the extra parenthesis on these if statements.

> +	else
> +		lp = 0x44;
> +
> +	err = regmap_write(data->regmap, SI514_REG_LP, lp);
> +	if (err < 0)
> +		return err;
> +
> +	reg[0] = settings->m_frac & 0xff;
> +	reg[1] = (settings->m_frac >> 8) & 0xff;
> +	reg[2] = (settings->m_frac >> 16) & 0xff;
> +	reg[3] = ((settings->m_frac >> 24) | (settings->m_int << 5)) & 0xff;
> +	reg[4] = (settings->m_int >> 3) & 0xff;
> +	reg[5] = (settings->hs_div) & 0xff;
> +	reg[6] = (((settings->hs_div) >> 8) |
> +			(settings->ls_div_bits << 4)) & 0xff;

The & 0xff part is redundant. Assignment truncates for us.

> +
> +	err = regmap_bulk_write(data->regmap, SI514_REG_HS_DIV, reg + 5, 2);
> +	if (err < 0)
> +		return err;
> +	/* Writing to SI514_REG_M_INT_FRAC triggers the clock change, so that
> +	 * must be written last */

Please fix multi-line commenting style.

> +	return regmap_bulk_write(data->regmap, SI514_REG_M_FRAC1, reg, 5);
> +}
> +
> +/* Calculate divider settings for a given frequency */
> +static int si514_calc_muldiv(struct clk_si514_muldiv *settings,
> +	unsigned long frequency)
> +{
> +	u64 m;
> +	u32 ls_freq;
> +	u32 tmp;
> +	u8 res;
> +
> +	if ((frequency < SI514_MIN_FREQ) || (frequency > SI514_MAX_FREQ))
> +		return -EINVAL;
> +
> +	/* Determine the minimum value of LS_DIV and resulting target freq. */
> +	ls_freq = frequency;
> +	if (frequency >= (FVCO_MIN / HS_DIV_MAX))
> +		settings->ls_div_bits = 0;
> +	else {
> +		res = 1;
> +		tmp = 2 * HS_DIV_MAX;
> +		while (tmp <= (HS_DIV_MAX*32)) {

Please add some space here between HS_DIV_MAX and 32.

> +			if ((frequency * tmp) >= FVCO_MIN)
> +				break; /* We're done */

Yep, that's what break in a loop usually means.

> +			++res;
> +			tmp <<= 1;
> +		}
> +		settings->ls_div_bits = res;
> +		ls_freq = frequency << res;
> +	}
> +
> +	/* Determine minimum HS_DIV, round up to even number */
> +	settings->hs_div = DIV_ROUND_UP(FVCO_MIN >> 1, ls_freq) << 1;
> +
> +	/* M = LS_DIV x HS_DIV x frequency / F_XO (in fixed-point) */
> +	m = ((u64)(ls_freq * settings->hs_div) << 29) + (FXO/2);
> +	do_div(m, FXO);
> +	settings->m_frac = (u32)m & (BIT(29) - 1);
> +	settings->m_int = (u32)(m >> 29);
> +
> +	return 0;
> +}
> +
> +/* Calculate resulting frequency given the register settings */
> +static unsigned long si514_calc_rate(struct clk_si514_muldiv *settings)
> +{
> +	u64 m = settings->m_frac | ((u64)settings->m_int << 29);
> +
> +	return ((u32)(((m * FXO) + (FXO/2)) >> 29)) /

Please add space after /

> +		(settings->hs_div * BIT(settings->ls_div_bits));

And drop the extra parenthesis. It would be nice if we didn't do
it all in one line too. Use some local variables.

> +}
> +
[...]
> +
> +	err = si514_calc_muldiv(&settings, rate);
> +	if (err)
> +		return err;
> +
> +	return si514_calc_rate(&settings);
> +}
> +
> +/* Update output frequency for big frequency changes (> 1000 ppm).
> + * The chip supports <1000ppm changes "on the fly", we haven't implemented
> + * that here. */

Please fix comment style.

> +static int si514_set_rate(struct clk_hw *hw, unsigned long rate,
> +		unsigned long parent_rate)
> +{
> +	struct clk_si514 *data = to_clk_si514(hw);
> +	struct clk_si514_muldiv settings;
> +	int err;
> +
> +	err = si514_calc_muldiv(&settings, rate);
> +	if (err)
> +		return err;
> +
> +	si514_enable_output(data, false);
> +
> +	err = si514_set_muldiv(data, &settings);
> +	if (err < 0)
> +		return err; /* Undefined state now, best to leave disabled */
> +
> +	/* Trigger calibration */
> +	err = regmap_write(data->regmap, SI514_REG_CONTROL, SI514_CONTROL_FCAL);
> +
> +	/* Applying a new frequency can take up to 10ms */
> +	usleep_range(10000, 12000);
> +
> +	si514_enable_output(data, true);
> +

Should we enable if regmap_write() failed?

> +	return err;
> +}
> +
> +static const struct clk_ops si514_clk_ops = {
> +	.recalc_rate = si514_recalc_rate,
> +	.round_rate = si514_round_rate,
> +	.set_rate = si514_set_rate,
> +};
> +
> +static struct regmap_config si514_regmap_config = {

const?

> +		}
> +	}
> +
> +	/* Display a message indicating that we've successfully registered */
> +	dev_info(&client->dev, "registered, current frequency %lu Hz\n",
> +			clk_get_rate(clk));

Please remove this.

> +
> +	return 0;
> +}
> +

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
