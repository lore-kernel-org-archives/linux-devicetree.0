From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH 3/3] mfd: bd718x7: Make power button press duration
 configurable
Date: Mon, 20 May 2019 09:23:17 +0000
Message-ID: <0c254b96e72605deee4d19bcab96e160187ebb4a.camel@fi.rohmeurope.com>
References: <cover.1558341613.git.leonard.crestez@nxp.com>
 <3ffd7b9d0b9cc45ac0fd671a701f857be4cfde46.1558341613.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3ffd7b9d0b9cc45ac0fd671a701f857be4cfde46.1558341613.git.leonard.crestez@nxp.com>
Content-Language: de-DE
Content-ID: <70E01FF649E1384FA8BCE343059391EB@de.rohmeurope.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "leonard.crestez@nxp.com" <leonard.crestez@nxp.com>, "broonie@kernel.org" <broonie@kernel.org>, "lee.jones@linaro.org" <lee.jones@linaro.org>
Cc: "aisheng.dong@nxp.com" <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "angus@akkea.ca" <angus@akkea.ca>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "yibin.gong@nxp.com" <yibin.gong@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Thanks for implementing this Leonard. This is how it should have been
done right away. Just one little thing.

On Mon, 2019-05-20 at 08:55 +0000, Leonard Crestez wrote:
> Allow overwriting the values in BD718XX_REG_PWRONCONFIG0 and
> BD718XX_REG_PWRONCONFIG1 via devicetree.
> 
> Keep existing values (from bootloader or OTP) if property is not
> present.
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> ---
>  drivers/mfd/rohm-bd718x7.c | 42
> ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
> index cdbef83884f0..dffa3f4bffad 100644
> --- a/drivers/mfd/rohm-bd718x7.c
> +++ b/drivers/mfd/rohm-bd718x7.c
> @@ -79,10 +79,48 @@ static const struct regmap_config
> bd718xx_regmap_config = {
>  	.volatile_table = &volatile_regs,
>  	.max_register = BD718XX_MAX_REGISTER - 1,
>  	.cache_type = REGCACHE_RBTREE,
>  };
>  
> +static int bd718xx_init_press_duration(struct bd718xx *bd718xx)
> +{
> +	struct device* dev = bd718xx->dev;
> +	u32 short_press_ms, long_press_ms;
> +	u32 short_press_value, long_press_value;
> +	int ret;
> +
> +	ret = of_property_read_u32(dev->of_node, "rohm,short-press-ms",
> +				   &short_press_ms);
> +	if (!ret) {
> +		short_press_value = min(15u, short_press_ms / 500);

This should rather be implemented as rounding not flooring. Giving for
example 1400ms from DT should rather yield timeout 1500ms than 1000ms.
I'd say it makes the difference at least for long press tmo.

> +		ret = regmap_update_bits(bd718xx->regmap,
> +					 BD718XX_REG_PWRONCONFIG0,
> +					 BD718XX_PWRBTN_PRESS_DURATION_
> MASK,
> +					 short_press_value);
> +		if (ret) {
> +			dev_err(dev, "Failed to init pwron short
> press\n");
> +			return ret;
> +		}
> +	}
> +
> +	ret = of_property_read_u32(dev->of_node, "rohm,long-press-ms",
> +				   &long_press_ms);
> +	if (!ret) {
> +		long_press_value = min(15u, long_press_ms / 1000);

Also here we should do rounding. 900ms from DT should rather be 1s than
10ms. Especially when the long press causes forced power down and short
press may be 10 ms...

> +		ret = regmap_update_bits(bd718xx->regmap,
> +					 BD718XX_REG_PWRONCONFIG1,
> +					 BD718XX_PWRBTN_PRESS_DURATION_
> MASK,
> +					 long_press_value);
> +		if (ret) {
> +			dev_err(dev, "Failed to init pwron long
> press\n");
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int bd718xx_i2c_probe(struct i2c_client *i2c,
>  			    const struct i2c_device_id *id)
>  {
>  	struct bd718xx *bd718xx;
>  	int ret;
> @@ -115,10 +153,14 @@ static int bd718xx_i2c_probe(struct i2c_client
> *i2c,
>  	if (ret) {
>  		dev_err(&i2c->dev, "Failed to add irq_chip\n");
>  		return ret;
>  	}
>  
> +	ret = bd718xx_init_press_duration(bd718xx);
> +	if (ret)
> +		return ret;
> +
>  	ret = regmap_irq_get_virq(bd718xx->irq_data,
> BD718XX_INT_PWRBTN_S);
>  
>  	if (ret < 0) {
>  		dev_err(&i2c->dev, "Failed to get the IRQ\n");
>  		return ret;

Other than that:
Reviewed-By: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>


Best Regards
	Matti Vaittinen
