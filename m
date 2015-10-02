From: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
Subject: Re: [PATCH v2] Add driver for the si514 clock generator chip
Date: Fri, 2 Oct 2015 08:02:30 +0200
Message-ID: <560E1DF6.9010901@topic.nl>
References: <1442478495-23522-1-git-send-email-mike.looijmans@topic.nl>
 <1442487891-20477-1-git-send-email-mike.looijmans@topic.nl>
 <20151001233407.GW19319@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151001233407.GW19319-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

=EF=BB=BFOn 02-10-15 01:34, Stephen Boyd wrote:
> On 09/17, Mike Looijmans wrote:
>> This patch adds the driver and devicetree documentation for the
>> Silicon Labs SI514 clock generator chip. This is an I2C controlled
>> oscilator capable of generating clock signals ranging from 100kHz
>
> s/oscilator/oscillator/
>
>> to 250MHz.
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
>> ---
>> diff --git a/Documentation/devicetree/bindings/clock/silabs,si514.tx=
t b/Documentation/devicetree/bindings/clock/silabs,si514.txt
>> new file mode 100644
>> index 0000000..05964d1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/silabs,si514.txt
>> @@ -0,0 +1,27 @@
>> +Binding for Silicon Labs 514 programmable I2C clock generator.
>> +
>> +Reference
>> +This binding uses the common clock binding[1]. Details about the de=
vice can be
>> +found in the datasheet[2].
>> +
>> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
>> +[2] Si514 datasheet
>> +    http://www.silabs.com/Support%20Documents/TechnicalDocs/si514.p=
df
>> +
>> +Required properties:
>> + - compatible: Shall be "silabs,si514"
>> + - reg: I2C device address.
>> + - #clock-cells: From common clock bindings: Shall be 0.
>> +
>> +Optional properties:
>> + - clock-output-names: From common clock bindings. Recommended to b=
e "si514".
>> + - clock-frequency: Output frequency to generate. This defines the =
output
>> +		    frequency set during boot. It can be reprogrammed during
>> +		    runtime through the common clock framework.
>
> Can we use assigned clock rates instead of this property?

I'll first need to learn what 'assigned clock rates' means. But I suspe=
ct the=20
answer will be yes.

>> +
>> +Example:
>> +	si514: clock-generator@55 {
>> +		reg =3D <0x55>;
>> +		#clock-cells =3D <0>;
>> +		compatible =3D "silabs,si514";
>> +	};
>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>> index 42f7120..6ac7deb5 100644
>> --- a/drivers/clk/Kconfig
>> +++ b/drivers/clk/Kconfig
>> @@ -68,6 +68,16 @@ config COMMON_CLK_SI5351
>>   	  This driver supports Silicon Labs 5351A/B/C programmable clock
>>   	  generators.
>>
>> +config COMMON_CLK_SI514
>> +	tristate "Clock driver for SiLabs 514 devices"
>> +	depends on I2C
>> +	depends on OF
>
> It actually depends on this to build?

It calls various 'of_' methods unconditionally, so I'd think so.

>> +	select REGMAP_I2C
>> +	help
>> +	---help---
>> +	  This driver supports the Silicon Labs 514 programmable clock
>> +	  generator.
>> +
>>   config COMMON_CLK_SI570
>>   	tristate "Clock driver for SiLabs 570 and compatible devices"
>>   	depends on I2C
>> diff --git a/drivers/clk/clk-si514.c b/drivers/clk/clk-si514.c
>> new file mode 100644
>> index 0000000..ca70818
>> --- /dev/null
>> +++ b/drivers/clk/clk-si514.c
>> @@ -0,0 +1,393 @@
>> +
>> +#include <linux/clk-provider.h>
>
> I'd expect some sort of linux/clk.h include here if we're using
> clk APIs.

It probably got dragged in by the clk-provider.h include, including it=20
specifically would be more appropriate.

>
>> +#include <linux/delay.h>
>> +#include <linux/module.h>
>> +#include <linux/i2c.h>
>> +#include <linux/regmap.h>
>> +#include <linux/slab.h>
> [...]
>> +
>> +/* Program clock settings into hardware */
>
> This comment is useless.
>
>> +static int si514_set_muldiv(struct clk_si514 *data,
>> +	struct clk_si514_muldiv *settings)
>> +{
>> +	u8 lp;
>> +	u8 reg[7];
>> +	int err;
>> +
>> +	/* Calculate LP1/LP2 according to table 13 in the datasheet */
>> +	/* 65.259980246 */
>> +	if ((settings->m_int < 65) ||
>> +		((settings->m_int =3D=3D 65) && (settings->m_frac <=3D 139575831)=
))
>> +		lp =3D 0x22;
>> +	/* 67.859763463 */
>> +	else if ((settings->m_int < 67) ||
>> +		((settings->m_int =3D=3D 67) && (settings->m_frac <=3D 461581994)=
))
>> +		lp =3D 0x23;
>> +	/* 72.937624981 */
>> +	else if ((settings->m_int < 72) ||
>> +		((settings->m_int =3D=3D 72) && (settings->m_frac <=3D 503383578)=
))
>> +		lp =3D 0x33;
>> +	/* 75.843265046 */
>> +	else if ((settings->m_int < 75) ||
>> +		((settings->m_int =3D=3D 75) && (settings->m_frac <=3D 452724474)=
))
>> +		lp =3D 0x34;
>
> Drop the extra parenthesis on these if statements.
>
>> +	else
>> +		lp =3D 0x44;
>> +
>> +	err =3D regmap_write(data->regmap, SI514_REG_LP, lp);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	reg[0] =3D settings->m_frac & 0xff;
>> +	reg[1] =3D (settings->m_frac >> 8) & 0xff;
>> +	reg[2] =3D (settings->m_frac >> 16) & 0xff;
>> +	reg[3] =3D ((settings->m_frac >> 24) | (settings->m_int << 5)) & 0=
xff;
>> +	reg[4] =3D (settings->m_int >> 3) & 0xff;
>> +	reg[5] =3D (settings->hs_div) & 0xff;
>> +	reg[6] =3D (((settings->hs_div) >> 8) |
>> +			(settings->ls_div_bits << 4)) & 0xff;
>
> The & 0xff part is redundant. Assignment truncates for us.
>
>> +
>> +	err =3D regmap_bulk_write(data->regmap, SI514_REG_HS_DIV, reg + 5,=
 2);
>> +	if (err < 0)
>> +		return err;
>> +	/* Writing to SI514_REG_M_INT_FRAC triggers the clock change, so t=
hat
>> +	 * must be written last */
>
> Please fix multi-line commenting style.
>
>> +	return regmap_bulk_write(data->regmap, SI514_REG_M_FRAC1, reg, 5);
>> +}
>> +
>> +/* Calculate divider settings for a given frequency */
>> +static int si514_calc_muldiv(struct clk_si514_muldiv *settings,
>> +	unsigned long frequency)
>> +{
>> +	u64 m;
>> +	u32 ls_freq;
>> +	u32 tmp;
>> +	u8 res;
>> +
>> +	if ((frequency < SI514_MIN_FREQ) || (frequency > SI514_MAX_FREQ))
>> +		return -EINVAL;
>> +
>> +	/* Determine the minimum value of LS_DIV and resulting target freq=
=2E */
>> +	ls_freq =3D frequency;
>> +	if (frequency >=3D (FVCO_MIN / HS_DIV_MAX))
>> +		settings->ls_div_bits =3D 0;
>> +	else {
>> +		res =3D 1;
>> +		tmp =3D 2 * HS_DIV_MAX;
>> +		while (tmp <=3D (HS_DIV_MAX*32)) {
>
> Please add some space here between HS_DIV_MAX and 32.
>
>> +			if ((frequency * tmp) >=3D FVCO_MIN)
>> +				break; /* We're done */
>
> Yep, that's what break in a loop usually means.
>
>> +			++res;
>> +			tmp <<=3D 1;
>> +		}
>> +		settings->ls_div_bits =3D res;
>> +		ls_freq =3D frequency << res;
>> +	}
>> +
>> +	/* Determine minimum HS_DIV, round up to even number */
>> +	settings->hs_div =3D DIV_ROUND_UP(FVCO_MIN >> 1, ls_freq) << 1;
>> +
>> +	/* M =3D LS_DIV x HS_DIV x frequency / F_XO (in fixed-point) */
>> +	m =3D ((u64)(ls_freq * settings->hs_div) << 29) + (FXO/2);
>> +	do_div(m, FXO);
>> +	settings->m_frac =3D (u32)m & (BIT(29) - 1);
>> +	settings->m_int =3D (u32)(m >> 29);
>> +
>> +	return 0;
>> +}
>> +
>> +/* Calculate resulting frequency given the register settings */
>> +static unsigned long si514_calc_rate(struct clk_si514_muldiv *setti=
ngs)
>> +{
>> +	u64 m =3D settings->m_frac | ((u64)settings->m_int << 29);
>> +
>> +	return ((u32)(((m * FXO) + (FXO/2)) >> 29)) /
>
> Please add space after /
>
>> +		(settings->hs_div * BIT(settings->ls_div_bits));
>
> And drop the extra parenthesis. It would be nice if we didn't do
> it all in one line too. Use some local variables.

I'll refactor it into something more readable.

>> +}
>> +
> [...]
>> +
>> +	err =3D si514_calc_muldiv(&settings, rate);
>> +	if (err)
>> +		return err;
>> +
>> +	return si514_calc_rate(&settings);
>> +}
>> +
>> +/* Update output frequency for big frequency changes (> 1000 ppm).
>> + * The chip supports <1000ppm changes "on the fly", we haven't impl=
emented
>> + * that here. */
>
> Please fix comment style.
>
>> +static int si514_set_rate(struct clk_hw *hw, unsigned long rate,
>> +		unsigned long parent_rate)
>> +{
>> +	struct clk_si514 *data =3D to_clk_si514(hw);
>> +	struct clk_si514_muldiv settings;
>> +	int err;
>> +
>> +	err =3D si514_calc_muldiv(&settings, rate);
>> +	if (err)
>> +		return err;
>> +
>> +	si514_enable_output(data, false);
>> +
>> +	err =3D si514_set_muldiv(data, &settings);
>> +	if (err < 0)
>> +		return err; /* Undefined state now, best to leave disabled */
>> +
>> +	/* Trigger calibration */
>> +	err =3D regmap_write(data->regmap, SI514_REG_CONTROL, SI514_CONTRO=
L_FCAL);
>> +
>> +	/* Applying a new frequency can take up to 10ms */
>> +	usleep_range(10000, 12000);
>> +
>> +	si514_enable_output(data, true);
>> +
>
> Should we enable if regmap_write() failed?

Good question, I don't recall why I made this choice.

=46or a client, when set_rate returns error, it would expect either the=
 clock=20
still running at the old frequency, or not running at all. From that=20
perspective, since the PLL has been reprogrammed, the better choice wou=
ld be=20
to leave it disabled. Expected behaviour for the client is going to be =
to fix=20
the I2C bus problems and try again.

>> +	return err;
>> +}
>> +
>> +static const struct clk_ops si514_clk_ops =3D {
>> +	.recalc_rate =3D si514_recalc_rate,
>> +	.round_rate =3D si514_round_rate,
>> +	.set_rate =3D si514_set_rate,
>> +};
>> +
>> +static struct regmap_config si514_regmap_config =3D {
>
> const?
>
>> +		}
>> +	}
>> +
>> +	/* Display a message indicating that we've successfully registered=
 */
>> +	dev_info(&client->dev, "registered, current frequency %lu Hz\n",
>> +			clk_get_rate(clk));
>
> Please remove this.
>
>> +
>> +	return 0;
>> +}
>> +
>

I'll post a v2 patch with the requested changes soon. Thank you for you=
r review.

Mike.


Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans-yhtFebqMsb9it5bFGTN0CAC/G2K4zDHf@public.gmane.org
Website: www.topicproducts.com

Please consider the environment before printing this e-mail





--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
