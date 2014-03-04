From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 1/3] power_supply: modelgauge_battery: Maxim ModelGauge
 ICs gauge
Date: Tue, 04 Mar 2014 13:05:48 +0100
Message-ID: <1393934748.1222.10.camel@AMDC1943>
References: <1391293385-27539-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1391293385-27539-2-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1391293385-27539-2-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: anton@enomsg.org, dwmw2@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mk7.kang@samsung.com, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

And one more comment:

On Sun, 2014-02-02 at 02:23 +0400, Vladimir Barinov wrote:
> +static int modelgauge_get_property(struct power_supply *psy,
> +				   enum power_supply_property psp,
> +				   union power_supply_propval *val)
> +{
> +	struct modelgauge_priv *priv = container_of(psy,
> +						    struct modelgauge_priv,
> +						    battery);
> +	struct regmap *regmap = priv->regmap;
> +	struct modelgauge_platform_data *pdata = priv->pdata;
> +	int reg;
> +	int ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_STATUS:
> +		if (pdata && pdata->get_charging_status)
> +			val->intval = pdata->get_charging_status();
> +		else
> +			val->intval = POWER_SUPPLY_STATUS_UNKNOWN;
> +		break;
> +	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
> +		ret = regmap_read(regmap, MODELGAUGE_VCELL_REG, &reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		val->intval = modelgauge_lsb_to_uvolts(priv, reg);
> +		break;
> +	case POWER_SUPPLY_PROP_VOLTAGE_OCV:
> +		/* Unlock model access */
> +		regmap_write(regmap, MODELGAUGE_UNLOCK_REG,
> +			     MODELGAUGE_UNLOCK_VALUE);
> +		ret = regmap_read(regmap, MODELGAUGE_OCV_REG, &reg);
> +		/* Lock model access */
> +		regmap_write(regmap, MODELGAUGE_UNLOCK_REG, 0);
> +		if (ret < 0)
> +			return ret;
> +
> +		val->intval = modelgauge_lsb_to_uvolts(priv, reg);
> +		break;
> +	case POWER_SUPPLY_PROP_CAPACITY:
> +		ret = regmap_read(regmap, MODELGAUGE_SOC_REG, &reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		val->intval = reg / (1 << priv->soc_shift);
> +		break;
> +	case POWER_SUPPLY_PROP_TEMP:
> +		if (pdata && pdata->get_temperature)
> +			val->intval = pdata->get_temperature();
> +		else
> +			val->intval = 25;

If pdata->get_temperature() is not supplied then probably the driver
should not support POWER_SUPPLY_PROP_TEMP at all. I think it is better
not to report any temperature than to report a wrong one.


Best regards,
Krzysztof
