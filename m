From: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 01/10] mfd: Add TI LMU driver
Date: Tue, 18 Feb 2014 16:45:32 +0900
Message-ID: <53030F9C.8000605@ti.com>
References: <1392359450-6890-1-git-send-email-milo.kim@ti.com> <20140217095734.GD17875@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140217095734.GD17875@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Lee,

On 02/17/2014 06:57 PM, Lee Jones wrote:
>> +static const struct resource lm3633_effect_resources[] = {
>> +	{
>> +		.name  = LM3633_EFFECT_BL0_RAMPUP,
>> +		.flags = IORESOURCE_REG,
>> +		.start = LM3633_EFFECT_REGISTER(BL0_RAMPUP),
>> +	},
>> +	{
>> +		.name  = LM3633_EFFECT_BL0_RAMPDOWN,
>> +		.flags = IORESOURCE_REG,
>> +		.start = LM3633_EFFECT_REGISTER(BL0_RAMPDN),
>> +	},
>> +	{
>> +		.name  = LM3633_EFFECT_BL1_RAMPUP,
>> +		.flags = IORESOURCE_REG,
>> +		.start = LM3633_EFFECT_REGISTER(BL1_RAMPUP),
>> +	},
>> +	{
>> +		.name  = LM3633_EFFECT_BL1_RAMPDOWN,
>> +		.flags = IORESOURCE_REG,
>> +		.start = LM3633_EFFECT_REGISTER(BL1_RAMPDN),
>> +	},
>> +	{
>> +		.name  = LM3633_EFFECT_PTN_DELAY,
>> +		.flags = IORESOURCE_REG,
>> +		.start = LM3633_EFFECT_REGISTER(DELAY),
>> +	},
>> +	{
>> +		.name  = LM3633_EFFECT_PTN_HIGHTIME,
>> +		.flags = IORESOURCE_REG,
>> +		.start = LM3633_EFFECT_REGISTER(HIGHTIME),
>> +	},
>> +	{
>> +		.name  = LM3633_EFFECT_PTN_LOWTIME,
>> +		.flags = IORESOURCE_REG,
>> +		.start = LM3633_EFFECT_REGISTER(LOWTIME),
>> +	},
>> +	{
>> +		.name  = LM3633_EFFECT_PTN0_RAMPUP,
>> +		.flags = IORESOURCE_REG,
>> +		.start = LM3633_EFFECT_REGISTER(PTN0_RAMPUP),
>> +	},
>> +	{
>> +		.name  = LM3633_EFFECT_PTN0_RAMPDOWN,
>> +		.flags = IORESOURCE_REG,
>> +		.start = LM3633_EFFECT_REGISTER(PTN0_RAMPDN),
>> +	},
>> +	{
>> +		.name  = LM3633_EFFECT_PTN1_RAMPUP,
>> +		.flags = IORESOURCE_REG,
>> +		.start = LM3633_EFFECT_REGISTER(PTN1_RAMPUP),
>> +	},
>> +	{
>> +		.name  = LM3633_EFFECT_PTN1_RAMPDOWN,
>> +		.flags = IORESOURCE_REG,
>> +		.start = LM3633_EFFECT_REGISTER(PTN1_RAMPDN),
>> +	},
>> +	{
>> +		.name  = LM3633_EFFECT_PTN_LOWBRT,
>> +		.flags = IORESOURCE_REG,
>> +		.start = LM3633_EFFECT_REGISTER(LOWBRT),
>> +	},
>> +	{
>> +		.name  = LM3633_EFFECT_PTN_HIGHBRT,
>> +		.flags = IORESOURCE_REG,
>> +		.start = LM3633_EFFECT_REGISTER(HIGHBRT),
>> +	},
>> +};
>
> Can you define a MACRO to do all of these as one liners?

Yes, resource definitions will be replaced by simple macro, 
LMU_EFFECT_RESOURCE().

For example,

#define LMU_EFFECT_RESOURCE(chip, effect)               \
{                                                       \
         .name  = chip##_EFFECT_##effect,                \
         .flags = IORESOURCE_REG,                        \
         .start = LMU_EFFECT_REGISTER(chip, effect),     \
}

static const struct resource lm3633_effect_resources[] = {
         LMU_EFFECT_RESOURCE(LM3633, BL0_RAMPUP),
         LMU_EFFECT_RESOURCE(LM3633, BL0_RAMPDN),
         LMU_EFFECT_RESOURCE(LM3633, BL1_RAMPUP),
         LMU_EFFECT_RESOURCE(LM3633, BL1_RAMPDN),
         LMU_EFFECT_RESOURCE(LM3633, PTN_DELAY),
         LMU_EFFECT_RESOURCE(LM3633, PTN_HIGHTIME),
         LMU_EFFECT_RESOURCE(LM3633, PTN_LOWTIME),
         LMU_EFFECT_RESOURCE(LM3633, PTN0_RAMPUP),
         LMU_EFFECT_RESOURCE(LM3633, PTN0_RAMPDN),
         LMU_EFFECT_RESOURCE(LM3633, PTN1_RAMPUP),
         LMU_EFFECT_RESOURCE(LM3633, PTN1_RAMPDN),
         LMU_EFFECT_RESOURCE(LM3633, PTN_LOWBRT),
         LMU_EFFECT_RESOURCE(LM3633, PTN_HIGHBRT),
};

static const struct resource lm3697_effect_resources[] = {
         LMU_EFFECT_RESOURCE(LM3697, BL0_RAMPUP),
         LMU_EFFECT_RESOURCE(LM3697, BL0_RAMPDN),
         LMU_EFFECT_RESOURCE(LM3697, BL1_RAMPUP),
         LMU_EFFECT_RESOURCE(LM3697, BL1_RAMPDN),
};

and so on.

> <snip>
>
>> +static int ti_lmu_parse_dt(struct device *dev, struct ti_lmu *lmu)
>> +{
>
> <snip>
>
>> +	pdata->en_gpio = of_get_named_gpio(node, "ti,enable-gpio", 0);
>
> There is a global DT property for this already.

I've not found it yet, but I agree it looks like general property.
So I'll replace "ti,enable-gpio" with "ti,lmu-en-gpio".

>
>> +static int ti_lmu_probe(struct i2c_client *cl, const struct i2c_device_id *id)
>> +{
>
> <snip>
>
>> +	lmu->id = id->driver_data;
>> +	switch (lmu->id) {
>> +	case LM3532:
>> +		lmu_regmap_config.max_register = LM3532_MAX_REGISTERS;
>> +		break;
>> +	case LM3631:
>> +		lmu_regmap_config.max_register = LM3631_MAX_REGISTERS;
>> +		break;
>> +	case LM3633:
>> +		lmu_regmap_config.max_register = LM3633_MAX_REGISTERS;
>> +		break;
>> +	case LM3695:
>> +		lmu_regmap_config.max_register = LM3695_MAX_REGISTERS;
>> +		break;
>> +	case LM3697:
>> +		lmu_regmap_config.max_register = LM3697_MAX_REGISTERS;
>> +		break;
>> +	default:
>> +		break;
>> +	}
>
> As there are so many of these, it might be nicer to pull these out
> into a seperate function.

Lines of code will be moved to new function, ti_lmu_regmap_init().

Thanks for your review.

Best regards,
Milo

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
