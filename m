From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/6] regulator: hi6421v530: add driver for hi6421v530
 voltage regulator
Date: Sat, 27 May 2017 17:47:25 +0800
Message-ID: <CAFGCpxyc6YnXQQk5TFzh5b7mByQuFg5h+nYfPYyJUdjvforYHA@mail.gmail.com>
References: <20170526063518.21246-1-guodong.xu@linaro.org> <20170526063518.21246-5-guodong.xu@linaro.org>
 <20170526113822.xsmk5lsrvzmqyljm@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170526113822.xsmk5lsrvzmqyljm-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "xuwei (O)" <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Riku Voipio <riku.voipio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.wallei>
List-Id: devicetree@vger.kernel.org

On Fri, May 26, 2017 at 7:38 PM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, May 26, 2017 at 02:35:16PM +0800, Guodong Xu wrote:
>
> Overall this driver needs quite a lot of modernization, it's at least a
> couple of years out of date in how it's using the framework - there's
> barely any use of helpers.  It does look like it should be fairly easy
> to get it up to date though, it's mostly going to be a case of deleting
> code that's reimplementing helpers rather than anything else.
>
>> +/*
>> + * struct hi6421c530_regulator_pdata - Hi6421V530 regulator data
>> + * of platform device.
>> + * @lock: mutex to serialize regulator enable
>> + */
>> +struct hi6421v530_regulator_pdata {
>> +     struct mutex lock;
>> +};
>
> This isn't platform data so it probably shouldn't be called pdata.  I
> also can't tell what the lock is protecting, every use seems to be a
> call to regmap_update_bits() which is atomic anyway - could we just drop
> the whole thing?

In original hi6421 chip, this lock can protect from enabling multiple
LDOs simultaneously. Because it cannot afford such surging current.

I will double check whether this is still the case for hi6421v530. If
not, I will remove the whole thing.

>
>> +static int hi6421v530_regulator_enable(struct regulator_dev *rdev)
>> +{
>> +     struct hi6421v530_regulator_pdata *pdata;
>> +     int ret = 0;
>> +
>> +     pdata = dev_get_drvdata(rdev->dev.parent);
>> +     mutex_lock(&pdata->lock);
>> +
>> +     ret = regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
>> +                     rdev->desc->enable_mask,
>> +                     1 << (ffs(rdev->desc->enable_mask) - 1));
>> +
>> +     mutex_unlock(&pdata->lock);
>> +     return ret;
>> +}
>
> This looks like it should be able to use the regmap helpers for all the
> enable operations rather than open coding.
>


>> +static int hi6421v530_regulator_set_voltage(struct regulator_dev *rdev,
>> +                                             unsigned int sel)
>> +{
>> +     struct hi6421v530_regulator_pdata *pdata;
>> +     int ret = 0;
>> +
>> +     pdata = dev_get_drvdata(rdev->dev.parent);
>> +     mutex_lock(&pdata->lock);
>> +
>> +     ret = regmap_update_bits(rdev->regmap, rdev->desc->vsel_reg,
>> +                             rdev->desc->vsel_mask,
>> +                             sel << (ffs(rdev->desc->vsel_mask) - 1));
>
> Same for all the voltage operations :(
>
>> +     rdev->constraints->valid_modes_mask = info->mode_mask;
>> +     rdev->constraints->valid_ops_mask |=
>> +                     REGULATOR_CHANGE_VOLTAGE | REGULATOR_CHANGE_MODE;
>
> The driver should *never* modify constraints, it's up to the machine
> integration to say what can be supported on a given board.
>
>> +     np = of_get_child_by_name(dev->parent->of_node, "regulators");
>> +     if (!np)
>> +             return -ENODEV;
>> +
>> +     ret = of_regulator_match(dev, np,
>> +                              hi6421v530_regulator_match,
>> +                              ARRAY_SIZE(hi6421v530_regulator_match));
>
> Don't open code this, use of_match and regulators_node.

I will fix that.

Thanks Mark for your review.

-Guodong
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
