From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/6] mfd: hi6421-pmic: add support for HiSilicon Hi6421v530
Date: Mon, 5 Jun 2017 19:57:30 +0800
Message-ID: <CAFGCpxyCtFTr9OpXSZ0Rh=Brz3obEp3e08kq0n7vmwWhp75gBg@mail.gmail.com>
References: <20170602105156.11351-1-guodong.xu@linaro.org> <20170602105156.11351-3-guodong.xu@linaro.org>
 <20170605082406.nbeu3qhfyxsjoqq3@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170605082406.nbeu3qhfyxsjoqq3@dell>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "xuwei (O)" <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Riku Voipio <riku.voipio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 5, 2017 at 4:24 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Fri, 02 Jun 2017, Guodong Xu wrote:
>
>> Add support for HiSilicon Hi6421v530 PMIC. Hi6421v530 communicates with
>> main SoC via memory-mapped I/O.
>>
>> Hi6421v530 and Hi6421 are PMIC chips from the same vendor, HiSilicon,
>> but at different revisions. They share the same memory-mapped I/O
>> design. They differ in integrated devices, such as regulator details,
>> LDO voltage points.
>>
>> Also, changed license to a shorter form, and arranged all #include in
>> alphabetical order.
>>
>> Signed-off-by: Wang Xiaoyin <hw.wangxiaoyin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>> Signed-off-by: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  drivers/mfd/hi6421-pmic-core.c  | 85 +++++++++++++++++++++++++---------=
-------
>>  include/linux/mfd/hi6421-pmic.h |  5 +++
>>  2 files changed, 58 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/mfd/hi6421-pmic-core.c b/drivers/mfd/hi6421-pmic-co=
re.c
>> index 3fd703f..b914541 100644
>> --- a/drivers/mfd/hi6421-pmic-core.c
>> +++ b/drivers/mfd/hi6421-pmic-core.c
>> @@ -1,40 +1,35 @@
>>  /*
>> - * Device driver for Hi6421 IC
>> + * Device driver for Hi6421 PMIC
>>   *
>>   * Copyright (c) <2011-2014> HiSilicon Technologies Co., Ltd.
>>   *              http://www.hisilicon.com
>> - * Copyright (c) <2013-2014> Linaro Ltd.
>> + * Copyright (c) <2013-2017> Linaro Ltd.
>>   *              http://www.linaro.org
>>   *
>>   * Author: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>   *
>>   * This program is free software; you can redistribute it and/or modify
>> - * it under the terms of the GNU General Public License as published by
>> - * the Free Software Foundation; either version 2 of the License, or
>> - * (at your option) any later version.
>> - *
>> - * This program is distributed in the hope it will be useful, but WITHO=
UT
>> - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY o=
r
>> - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Licens=
e for
>> - * more details.
>> - *
>> - * You should have received a copy of the GNU General Public License
>> - * along with this program.  If not, see <http://www.gnu.org/licenses/>=
.
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>
> Nice change, but this should be a separate patch.
>

I will add that as a separate patch.

>>   */
>>
>>  #include <linux/device.h>
>>  #include <linux/err.h>
>>  #include <linux/mfd/core.h>
>> +#include <linux/mfd/hi6421-pmic.h>
>>  #include <linux/module.h>
>> -#include <linux/of.h>
>> +#include <linux/of_device.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/regmap.h>
>> -#include <linux/mfd/hi6421-pmic.h>
>>
>>  static const struct mfd_cell hi6421_devs[] =3D {
>>       { .name =3D "hi6421-regulator", },
>>  };
>>
>> +static const struct mfd_cell hi6421v530_devs[] =3D {
>> +     { .name =3D "hi6421v530-regulator", },
>> +};
>> +
>>  static const struct regmap_config hi6421_regmap_config =3D {
>>       .reg_bits =3D 32,
>>       .reg_stride =3D 4,
>> @@ -42,12 +37,30 @@ static const struct regmap_config hi6421_regmap_conf=
ig =3D {
>>       .max_register =3D HI6421_REG_TO_BUS_ADDR(HI6421_REG_MAX),
>>  };
>>
>> +static const struct of_device_id of_hi6421_pmic_match[] =3D {
>> +     { .compatible =3D "hisilicon,hi6421-pmic",
>> +                                     .data =3D (void *)HI6421 },
>> +     { .compatible =3D "hisilicon,hi6421v530-pmic",
>> +                                     .data =3D (void *)HI6421_V530 },
>> +     { },
>> +};
>> +MODULE_DEVICE_TABLE(of, of_hi6421_pmic_match);
>
> This formatting is odd.  If both attributes won't fit on a single
> line, please place them on completely separate lines.  This includes
> the braces.  Something like this:
>
>         {
>                 .compatible =3D "hisilicon,hi6421-pmic",
>                 .data =3D (void *)HI6421
>         }, {
>                 .compatible =3D "hisilicon,hi6421v530-pmic",
>                 .data =3D (void *)HI6421_V530 },
>         { },
>

Thanks, I will change that.

>>  static int hi6421_pmic_probe(struct platform_device *pdev)
>>  {
>>       struct hi6421_pmic *pmic;
>>       struct resource *res;
>>       void __iomem *base;
>> -     int ret;
>> +     const struct of_device_id *id;
>> +     unsigned long type;
>> +     const struct mfd_cell *subdevs =3D NULL;
>> +     int n_subdevs, ret;
>
> Better to reorganise this a little.  I tend to have the complex data
> types at the top running down to simple 'int' types at the bottom.
>

Sure. I will update.

>> +     id =3D of_match_device(of_hi6421_pmic_match, &pdev->dev);
>> +     if (id)
>> +             type =3D (unsigned long)id->data;
>> +     else
>> +             return -EINVAL;
>
> Place "!id" in the if statement, then you can drop the else.
>

Thanks. I will update.

>>       pmic =3D devm_kzalloc(&pdev->dev, sizeof(*pmic), GFP_KERNEL);
>>       if (!pmic)
>> @@ -61,41 +74,49 @@ static int hi6421_pmic_probe(struct platform_device =
*pdev)
>>       pmic->regmap =3D devm_regmap_init_mmio_clk(&pdev->dev, NULL, base,
>>                                                &hi6421_regmap_config);
>>       if (IS_ERR(pmic->regmap)) {
>> -             dev_err(&pdev->dev,
>> -                     "regmap init failed: %ld\n", PTR_ERR(pmic->regmap)=
);
>> +             dev_err(&pdev->dev, "Failed to initialise Regmap: %ld\n",
>> +                                                     PTR_ERR(pmic->regm=
ap));
>
> Separate patch.
>

I will do.

>>               return PTR_ERR(pmic->regmap);
>>       }
>>
>> -     /* set over-current protection debounce 8ms */
>> -     regmap_update_bits(pmic->regmap, HI6421_OCP_DEB_CTRL_REG,
>> +     platform_set_drvdata(pdev, pmic);
>> +
>> +     switch (type) {
>> +     case HI6421:
>> +             /* set over-current protection debounce 8ms */
>> +             regmap_update_bits(pmic->regmap, HI6421_OCP_DEB_CTRL_REG,
>>                               (HI6421_OCP_DEB_SEL_MASK
>>                                | HI6421_OCP_EN_DEBOUNCE_MASK
>>                                | HI6421_OCP_AUTO_STOP_MASK),
>>                               (HI6421_OCP_DEB_SEL_8MS
>>                                | HI6421_OCP_EN_DEBOUNCE_ENABLE));
>>
>> -     platform_set_drvdata(pdev, pmic);
>> +             subdevs =3D hi6421_devs;
>> +             n_subdevs =3D ARRAY_SIZE(hi6421_devs);
>> +             break;
>> +     case HI6421_V530:
>> +             subdevs =3D hi6421v530_devs;
>> +             n_subdevs =3D ARRAY_SIZE(hi6421v530_devs);
>> +             break;
>> +     default:
>> +             dev_err(&pdev->dev, "Unknown device type %ld\n", type);
>> +             return -EINVAL;
>> +     }
>>
>> -     ret =3D devm_mfd_add_devices(&pdev->dev, 0, hi6421_devs,
>> -                                ARRAY_SIZE(hi6421_devs), NULL, 0, NULL)=
;
>> +     ret =3D devm_mfd_add_devices(&pdev->dev, 0, subdevs,
>
> Use the proper defines, not '0'.

I'll change this to PLATFORM_DEVID_NONE

>
>> +                                n_subdevs, NULL, 0, NULL);
>>       if (ret) {
>> -             dev_err(&pdev->dev, "add mfd devices failed: %d\n", ret);
>> +             dev_err(&pdev->dev, "Failed to add child devices: %d\n", r=
et);
>
> This needs to be grouped with the other error message change above.
>

will do.

>>               return ret;
>>       }
>>
>>       return 0;
>>  }
>>
>> -static const struct of_device_id of_hi6421_pmic_match_tbl[] =3D {
>> -     { .compatible =3D "hisilicon,hi6421-pmic", },
>> -     { },
>> -};
>> -MODULE_DEVICE_TABLE(of, of_hi6421_pmic_match_tbl);
>> -
>>  static struct platform_driver hi6421_pmic_driver =3D {
>>       .driver =3D {
>> -             .name   =3D "hi6421_pmic",
>> -             .of_match_table =3D of_hi6421_pmic_match_tbl,
>> +             .name =3D "hi6421_pmic",
>> +             .of_match_table =3D of_hi6421_pmic_match,
>>       },
>>       .probe  =3D hi6421_pmic_probe,
>>  };
>> diff --git a/include/linux/mfd/hi6421-pmic.h b/include/linux/mfd/hi6421-=
pmic.h
>> index 587273e..2457438 100644
>> --- a/include/linux/mfd/hi6421-pmic.h
>> +++ b/include/linux/mfd/hi6421-pmic.h
>> @@ -38,4 +38,9 @@ struct hi6421_pmic {
>>       struct regmap           *regmap;
>>  };
>>
>> +enum hi6421_type {
>> +     HI6421      =3D 1,
>> +     HI6421_V530 =3D 2,
>
> Why 1 and 2?
>

I didn't get your point. I have no special reason. Actually, any value
should work. I just need two value to differentiate two chips.
Did you see any problem if I use 1 and 2?

-Guodong


>> +};
>> +
>>  #endif               /* __HI6421_PMIC_H */
>
> --
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
