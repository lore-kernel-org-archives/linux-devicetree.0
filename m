From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulators: anatop: add set_voltage_time_sel interface
Date: Wed, 30 Jan 2013 23:04:18 +0800
Message-ID: <20130130150416.GG2757@S2101-09.ap.freescale.net>
References: <1359586214-11876-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1359586214-11876-1-git-send-email-b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, paul.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 30, 2013 at 05:50:14PM -0500, Anson Huang wrote:
> diff --git a/Documentation/devicetree/bindings/regulator/anatop-regulator.txt b/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
> index 357758c..b3a08f8 100644
> --- a/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
> @@ -5,6 +5,9 @@ Required properties:
>  - anatop-reg-offset: Anatop MFD register offset
>  - anatop-vol-bit-shift: Bit shift for the register
>  - anatop-vol-bit-width: Number of bits used in the register
> +- anatop-delay-reg-offset: Anatop MFD step time register offset
> +- anatop-delay-bit-shift: Bit shift for the step time register
> +- anatop-delay-bit-width: Number of bits used in the step time register

These should be documented as optional properties, as regulators 1p1,
3p0 and 2p5 do not have them.

>  - anatop-min-bit-val: Minimum value of this register
>  - anatop-min-voltage: Minimum voltage of this regulator
>  - anatop-max-voltage: Maximum voltage of this regulator
> @@ -23,6 +26,9 @@ Example:
>  		anatop-reg-offset = <0x140>;
>  		anatop-vol-bit-shift = <9>;
>  		anatop-vol-bit-width = <5>;
> +		anatop-delay-reg-offset = <0x170>;
> +		anatop-delay-bit-shift = <24>;
> +		anatop-delay-bit-width = <2>;
>  		anatop-min-bit-val = <1>;
>  		anatop-min-voltage = <725000>;
>  		anatop-max-voltage = <1300000>;
> diff --git a/drivers/regulator/anatop-regulator.c b/drivers/regulator/anatop-regulator.c
> index 8f39cac..a857b9c 100644
> --- a/drivers/regulator/anatop-regulator.c
> +++ b/drivers/regulator/anatop-regulator.c
> @@ -31,12 +31,18 @@
>  #include <linux/regulator/driver.h>
>  #include <linux/regulator/of_regulator.h>
>  
> +#define LDO_RAMP_UP_UNIT_IN_CYCLES      64 /* 64 cycles per step */
> +#define LDO_RAMP_UP_FREQ_IN_MHZ         24 /* cycle based on 24M OSC */
> +
>  struct anatop_regulator {
>  	const char *name;
>  	u32 control_reg;
>  	struct regmap *anatop;
>  	int vol_bit_shift;
>  	int vol_bit_width;
> +	u32 delay_reg;
> +	int delay_bit_shift;
> +	int delay_bit_width;
>  	int min_bit_val;
>  	int min_voltage;
>  	int max_voltage;
> @@ -55,6 +61,33 @@ static int anatop_regmap_set_voltage_sel(struct regulator_dev *reg,
>  	return regulator_set_voltage_sel_regmap(reg, selector);
>  }
>  
> +static int anatop_regmap_set_voltage_time_sel(struct regulator_dev *reg,
> +	unsigned int old_sel,
> +	unsigned int new_sel)
> +{
> +	struct anatop_regulator *anatop_reg = rdev_get_drvdata(reg);
> +	u32 val;
> +	int ret = 0;
> +
> +	/* check whether need to care about LDO ramp up speed */
> +	if (anatop_reg->delay_reg) {

It might be safer to check if (anatop_reg->delay_bit_width)?

Otherwise,

Acked-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Shawn

> +		/*
> +		 * the delay for LDO ramp up time is
> +		 * based on the register setting, we need
> +		 * to calculate how many steps LDO need to
> +		 * ramp up, and how much delay needed. (us)
> +		 */
> +		regmap_read(anatop_reg->anatop, anatop_reg->delay_reg, &val);
> +		val = (val >> anatop_reg->delay_bit_shift) &
> +			((1 << anatop_reg->delay_bit_width) - 1);
> +		ret = new_sel > old_sel ? (new_sel - old_sel) *
> +			((LDO_RAMP_UP_UNIT_IN_CYCLES << val) /
> +			LDO_RAMP_UP_FREQ_IN_MHZ + 1) : 0;
> +	}
> +
> +	return ret;
> +}
> +
>  static int anatop_regmap_get_voltage_sel(struct regulator_dev *reg)
>  {
>  	struct anatop_regulator *anatop_reg = rdev_get_drvdata(reg);
> @@ -67,6 +100,7 @@ static int anatop_regmap_get_voltage_sel(struct regulator_dev *reg)
>  
>  static struct regulator_ops anatop_rops = {
>  	.set_voltage_sel = anatop_regmap_set_voltage_sel,
> +	.set_voltage_time_sel = anatop_regmap_set_voltage_time_sel,
>  	.get_voltage_sel = anatop_regmap_get_voltage_sel,
>  	.list_voltage = regulator_list_voltage_linear,
>  	.map_voltage = regulator_map_voltage_linear,
> @@ -143,6 +177,14 @@ static int anatop_regulator_probe(struct platform_device *pdev)
>  		goto anatop_probe_end;
>  	}
>  
> +	/* read LDO ramp up setting, only for core reg */
> +	of_property_read_u32(np, "anatop-delay-reg-offset",
> +			     &sreg->delay_reg);
> +	of_property_read_u32(np, "anatop-delay-bit-width",
> +			     &sreg->delay_bit_width);
> +	of_property_read_u32(np, "anatop-delay-bit-shift",
> +			     &sreg->delay_bit_shift);
> +
>  	rdesc->n_voltages = (sreg->max_voltage - sreg->min_voltage) / 25000 + 1
>  			    + sreg->min_bit_val;
>  	rdesc->min_uV = sreg->min_voltage;
> -- 
> 1.7.9.5
> 
> 
