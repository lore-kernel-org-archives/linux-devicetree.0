From: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH v2 2/4] nvmem: NXP LPC18xx EEPROM memory NVMEM driver
Date: Fri, 30 Oct 2015 12:42:44 -0300
Message-ID: <56338FF4.8050102@vanguardiasur.com.ar>
References: <1445275946-32653-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1445275946-32653-3-git-send-email-ariel@vanguardiasur.com.ar>
 <562E377A.3040604@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <562E377A.3040604-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Srinivas,

El 26/10/15 a las 11:23, Srinivas Kandagatla escribi=F3:
>=20
>=20
> On 19/10/15 18:32, Ariel D'Alessandro wrote:
>> This commit adds support for NXP LPC18xx EEPROM memory found in NXP
> s/commit/patch

OK.

>=20
>> LPC185x/3x and LPC435x/3x/2x/1x devices.
>>
>> EEPROM size is 16384 bytes and it can be entirely read and
>> written/erased with 1 word (4 bytes) granularity. The last page
>> (128 bytes) contains the EEPROM initialization data and is not writa=
ble.
>>
>> Erase/program time is less than 3ms. The EEPROM device requires a
>> ~1500 kHz clock (min 800 kHz, max 1600 kHz) that is generated dividi=
ng
>> the system bus clock by the division factor, contained in the divide=
r
>> register (minus 1 encoded).
>>
>> Signed-off-by: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
>> ---
>>   drivers/nvmem/Kconfig          |   9 ++
>>   drivers/nvmem/Makefile         |   2 +
>>   drivers/nvmem/lpc18xx_eeprom.c | 266
>> +++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 277 insertions(+)
>>   create mode 100644 drivers/nvmem/lpc18xx_eeprom.c
>>
[snip]
>> diff --git a/drivers/nvmem/lpc18xx_eeprom.c
>> b/drivers/nvmem/lpc18xx_eeprom.c
>> new file mode 100644
>> index 0000000..ccdda66
>> --- /dev/null
>> +++ b/drivers/nvmem/lpc18xx_eeprom.c
>> @@ -0,0 +1,266 @@
>> +/*
>> + * NXP LPC18xx/LPC43xx EEPROM memory NVMEM driver
>> + *
>> + * Copyright (c) 2015 Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgC/G2K4zDHf@public.gmane.org>
>> + *
>> + * This program is free software; you can redistribute it and/or
>> modify it
>> + * under the terms of the GNU General Public License version 2 as
>> published by
>> + * the Free Software Foundation.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/device.h>
>> +#include <linux/delay.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/nvmem-provider.h>
>> +#include <linux/of_device.h>
> Why do you need above?
>=20
> Also you should probably include
>=20
>  #include <linux/platform_device.h>

You're right. No need for of_device.h, only platform_device.h.

>=20
>=20
>> +#include <linux/regmap.h>
>> +#include <linux/reset.h>
>> +
>> +/* Registers */
>> +#define LPC18XX_EEPROM_AUTOPROG        0x00c
>> +#define LPC18XX_EEPROM_AUTOPROG_WORD    0x1
>> +
>> +#define LPC18XX_EEPROM_CLKDIV        0x014
>> +
>> +#define LPC18XX_EEPROM_PWRDWN        0x018
>> +#define LPC18XX_EEPROM_PWRDWN_NO    0x0
>> +#define LPC18XX_EEPROM_PWRDWN_YES    0x1
>> +
>> +/* Fixed page size (bytes) */
>> +#define LPC18XX_EEPROM_PAGE_SIZE    0x80
>> +
>> +/* EEPROM device requires a ~1500 kHz clock (min 800 kHz, max 1600
>> kHz) */
>> +#define LPC18XX_EEPROM_CLOCK_HZ        1500000
>> +
>> +struct lpc18xx_eeprom_dev {
>> +    struct clk *clk;
>> +    void __iomem *reg_base;
>> +    void __iomem *mem_base;
>> +    struct nvmem_device *nvmem;
>> +    unsigned reg_bytes;
>> +    unsigned val_bytes;
>> +};
>> +
>> +static inline void lpc18xx_eeprom_writel(struct lpc18xx_eeprom_dev
>> *eeprom,
>> +                     u32 reg, u32 val)
>> +{
>> +    writel(val, eeprom->reg_base + reg);
>> +}
> I don't have a strong feeling but, I see no point to have a wrapper f=
or
> writel which is only used in probe function.

Well, to be correct it's also used in remove function. And I might call
it in read()/write() functions to allow dynamic power on/off.
I'd prefer keeping the wrapper.

>=20
>> +
>> +static int lpc18xx_eeprom_gather_write(void *context, const void *r=
eg,
>> +                       size_t reg_size, const void *val,
>> +                       size_t val_size)
>> +{
>> +    struct lpc18xx_eeprom_dev *eeprom =3D context;
>> +    unsigned int offset =3D *(u32 *)reg;
>> +
>> +    /* 3 ms of erase/program time between each writing */
>> +    while (val_size) {
>> +        writel(*(u32 *)val, eeprom->mem_base + offset);
>> +        usleep_range(3000, 4000);
>> +        val_size -=3D eeprom->val_bytes;
>> +        val +=3D eeprom->val_bytes;
>> +        offset +=3D eeprom->val_bytes;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int lpc18xx_eeprom_write(void *context, const void *data,
>> size_t count)
>> +{
>> +    struct lpc18xx_eeprom_dev *eeprom =3D context;
>> +    unsigned int offset =3D eeprom->reg_bytes;
>> +
>> +    if (count <=3D offset)
>> +        return -EINVAL;
>> +
>> +
> unnecessary new line.

ACK.

>=20
>> +    return lpc18xx_eeprom_gather_write(context, data, eeprom->reg_b=
ytes,
>> +                       data + offset, count - offset);
>> +}
>> +
[snip]
>> +
>> +static int lpc18xx_eeprom_probe(struct platform_device *pdev)
>> +{
>> +    struct lpc18xx_eeprom_dev *eeprom;
>> +    struct device *dev =3D &pdev->dev;
>> +    struct reset_control *rst;
>> +    unsigned long clk_rate;
>> +    struct regmap *regmap;
>> +    struct resource *res;
>> +    int ret;
>> +
>> +    eeprom =3D devm_kzalloc(dev, sizeof(*eeprom), GFP_KERNEL);
>> +    if (!eeprom)
>> +        return -ENOMEM;
>> +
>> +    res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "reg=
");
>> +    eeprom->reg_base =3D devm_ioremap_resource(dev, res);
>> +    if (IS_ERR(eeprom->reg_base))
>> +        return PTR_ERR(eeprom->reg_base);
>> +
>> +    res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "mem=
");
>> +    eeprom->mem_base =3D devm_ioremap_resource(dev, res);
>> +    if (IS_ERR(eeprom->mem_base))
>> +        return PTR_ERR(eeprom->mem_base);
>> +
>> +    eeprom->clk =3D devm_clk_get(&pdev->dev, "eeprom");
>> +    if (IS_ERR(eeprom->clk)) {
>> +        dev_err(&pdev->dev, "failed to get eeprom clock\n");
>> +        return PTR_ERR(eeprom->clk);
>> +    }
>> +
>> +    ret =3D clk_prepare_enable(eeprom->clk);
>> +    if (ret < 0) {
>> +        dev_err(dev, "failed to prepare/enable eeprom clk: %d\n", r=
et);
>> +        return ret;
>> +    }
>> +
>> +    rst =3D devm_reset_control_get(dev, NULL);
>> +    if (IS_ERR(rst)) {
>> +        dev_err(dev, "failed to get reset: %ld\n", PTR_ERR(rst));
>> +        ret =3D PTR_ERR(rst);
>> +        goto err_clk;
>> +    }
>> +
>> +    ret =3D reset_control_deassert(rst);
>> +    if (ret < 0) {
>> +        dev_err(dev, "failed to deassert reset: %d\n", ret);
>> +        goto err_clk;
>> +    }
>> +
>> +    eeprom->val_bytes =3D lpc18xx_regmap_config.val_bits / 8;
>> +    eeprom->reg_bytes =3D lpc18xx_regmap_config.reg_bits / 8;
>> +
>> +    /*
>> +     * Clock rate is generated by dividing the system bus clock by =
the
>> +     * division factor, contained in the divider register (minus 1
>> encoded).
>> +     */
>> +    clk_rate =3D clk_get_rate(eeprom->clk);
>> +    clk_rate =3D DIV_ROUND_UP(clk_rate, LPC18XX_EEPROM_CLOCK_HZ) - =
1;
>> +    lpc18xx_eeprom_writel(eeprom, LPC18XX_EEPROM_CLKDIV, clk_rate);
>> +
>> +    /*
>> +     * Writing a single word to the page will start the erase/progr=
am
>> cycle
>> +     * automatically
>> +     */
>> +    lpc18xx_eeprom_writel(eeprom, LPC18XX_EEPROM_AUTOPROG,
>> +                  LPC18XX_EEPROM_AUTOPROG_WORD);
>> +
>> +    lpc18xx_eeprom_writel(eeprom, LPC18XX_EEPROM_PWRDWN,
>> +                  LPC18XX_EEPROM_PWRDWN_NO);
>=20
> Any reason not power up/dowm dynamically in
> lpc18xx_eeprom_write()/lpc18xx_eeprom_read().
>=20
> This can potentially save some power.

That sounds good. I'll add this feature and check that it works properl=
y.

>=20
>> +
>> +    lpc18xx_regmap_config.max_register =3D resource_size(res) - 1;
>> +    lpc18xx_regmap_config.writeable_reg =3D lpc18xx_eeprom_writeabl=
e_reg;
>> +    lpc18xx_regmap_config.readable_reg =3D lpc18xx_eeprom_readable_=
reg;
>> +
>> +    regmap =3D devm_regmap_init(dev, &lpc18xx_eeprom_bus, eeprom,
>> +                  &lpc18xx_regmap_config);
>> +    if (IS_ERR(regmap)) {
>> +        dev_err(dev, "regmap init failed: %ld\n", PTR_ERR(regmap));
>> +        ret =3D PTR_ERR(regmap);
>> +        goto err_clk;
>> +    }
>> +
>> +    lpc18xx_nvmem_config.dev =3D dev;
>> +
>> +    eeprom->nvmem =3D nvmem_register(&lpc18xx_nvmem_config);
>> +    if (IS_ERR(eeprom->nvmem)) {
>> +        ret =3D PTR_ERR(eeprom->nvmem);
>> +        goto err_clk;
>> +    }
>> +
>> +    platform_set_drvdata(pdev, eeprom);
>> +
>> +    return 0;
>> +
>> +err_clk:
>=20
> Should this error path also include power down/reset assert the eepro=
m?

Yes, I'll add another cleanup routine.

>=20
>> +    clk_disable_unprepare(eeprom->clk);
>> +
>> +    return ret;
>> +}
>> +
>> +static int lpc18xx_eeprom_remove(struct platform_device *pdev)
>> +{
>> +    struct lpc18xx_eeprom_dev *eeprom =3D platform_get_drvdata(pdev=
);
>> +
>> +    lpc18xx_eeprom_writel(eeprom, LPC18XX_EEPROM_PWRDWN,
>> +                  LPC18XX_EEPROM_PWRDWN_YES);
>> +
>> +    clk_disable_unprepare(eeprom->clk);
>> +
>> +    return nvmem_unregister(eeprom->nvmem);
>=20
> Same comment as Joachim, should the reset be asserted too?

No. That would cause a reset, disabling EEPROM power down mode.

--=20
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
