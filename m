From: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH v2 2/4] nvmem: NXP LPC18xx EEPROM memory NVMEM driver
Date: Fri, 30 Oct 2015 11:55:07 -0300
Message-ID: <563384CB.3070607@vanguardiasur.com.ar>
References: <1445275946-32653-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1445275946-32653-3-git-send-email-ariel@vanguardiasur.com.ar>
 <CAGhQ9Vyg6sScq7yM=7judsMPHOc5VF2zf=7LPxmbmL7wF=vvgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGhQ9Vyg6sScq7yM=7judsMPHOc5VF2zf=7LPxmbmL7wF=vvgw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Joachim,

El 24/10/15 a las 19:04, Joachim Eastwood escribi=C3=B3:
> Hi Ariel,
>=20
> On 19 October 2015 at 19:32, Ariel D'Alessandro
> <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org> wrote:
>> This commit adds support for NXP LPC18xx EEPROM memory found in NXP
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
>>  drivers/nvmem/Kconfig          |   9 ++
>>  drivers/nvmem/Makefile         |   2 +
>>  drivers/nvmem/lpc18xx_eeprom.c | 266 ++++++++++++++++++++++++++++++=
+++++++++++
>>  3 files changed, 277 insertions(+)
>>  create mode 100644 drivers/nvmem/lpc18xx_eeprom.c
>=20
>> +static int lpc18xx_eeprom_gather_write(void *context, const void *r=
eg,
>> +                                      size_t reg_size, const void *=
val,
>> +                                      size_t val_size)
>> +{
>> +       struct lpc18xx_eeprom_dev *eeprom =3D context;
>> +       unsigned int offset =3D *(u32 *)reg;
>> +
>> +       /* 3 ms of erase/program time between each writing */
>> +       while (val_size) {
>> +               writel(*(u32 *)val, eeprom->mem_base + offset);
>> +               usleep_range(3000, 4000);
>> +               val_size -=3D eeprom->val_bytes;
>> +               val +=3D eeprom->val_bytes;
>> +               offset +=3D eeprom->val_bytes;
>> +       }
>=20
> What happens here if 'val_size' is less than 4 or not dividable by 4?

AFAIK, before calling to gather_write, the caller ensures that
'val_size' % map->format.val_bytes =3D=3D 0

Like nvmem_device_write() do this in
drivers/base/regmap/regmap.c:regmap_raw_write()

Then, if val_size =3D=3D 0, nothing will happen.

> Same thing for 'offset'.

Let me check this one.

>=20
> I tested the driver from sysfs by writing strings into the nvmem-file
> with echo. Writing a string not dividable by 4 seems to hang the
> system.

Yeah, I saw that too. I think that's a nvmem core issue and Srinivas's
patch solves this. Will confirm that as soon as I have the board back.

>=20
>=20
>> +static int lpc18xx_eeprom_read(void *context, const void *reg, size=
_t reg_size,
>> +                              void *val, size_t val_size)
>> +{
>> +       struct lpc18xx_eeprom_dev *eeprom =3D context;
>> +       unsigned int offset =3D *(u32 *)reg;
>> +
>> +       while (val_size) {
>> +               *(u32 *)val =3D readl(eeprom->mem_base + offset);
>> +               val_size -=3D eeprom->val_bytes;
>> +               val +=3D eeprom->val_bytes;
>> +               offset +=3D eeprom->val_bytes;
>> +       }
>> +
>> +       return 0;
>> +}
>=20
> Same comments as for lpc18xx_eeprom_gather_write().

Same answer.

>=20
>=20
>> +static const struct of_device_id lpc18xx_eeprom_of_match[] =3D {
>> +       { .compatible =3D "nxp,lpc1857-eeprom" },
>> +       { },
>> +};
>> +MODULE_DEVICE_TABLE(of, lpc18xx_eeprom_of_match);
>=20
> nit: It's usual to place of_device_id struct just above the
> platform_driver struct.

I see.

>=20
>=20
>> +       eeprom->val_bytes =3D lpc18xx_regmap_config.val_bits / 8;
>> +       eeprom->reg_bytes =3D lpc18xx_regmap_config.reg_bits / 8;
>=20
> There is a BITS_PER_BYTE define in bitops.h that you might want to us=
e here.

Right. Thanks.

>=20
>=20
>> +       /*
>> +        * Clock rate is generated by dividing the system bus clock =
by the
>> +        * division factor, contained in the divider register (minus=
 1 encoded).
>> +        */
>> +       clk_rate =3D clk_get_rate(eeprom->clk);
>> +       clk_rate =3D DIV_ROUND_UP(clk_rate, LPC18XX_EEPROM_CLOCK_HZ)=
 - 1;
>> +       lpc18xx_eeprom_writel(eeprom, LPC18XX_EEPROM_CLKDIV, clk_rat=
e);
>> +
>> +       /*
>> +        * Writing a single word to the page will start the erase/pr=
ogram cycle
>> +        * automatically
>> +        */
>> +       lpc18xx_eeprom_writel(eeprom, LPC18XX_EEPROM_AUTOPROG,
>> +                             LPC18XX_EEPROM_AUTOPROG_WORD);
>> +
>> +       lpc18xx_eeprom_writel(eeprom, LPC18XX_EEPROM_PWRDWN,
>> +                             LPC18XX_EEPROM_PWRDWN_NO);
>> +
>> +       lpc18xx_regmap_config.max_register =3D resource_size(res) - =
1;
>> +       lpc18xx_regmap_config.writeable_reg =3D lpc18xx_eeprom_write=
able_reg;
>> +       lpc18xx_regmap_config.readable_reg =3D lpc18xx_eeprom_readab=
le_reg;
>> +
>> +       regmap =3D devm_regmap_init(dev, &lpc18xx_eeprom_bus, eeprom=
,
>> +                                 &lpc18xx_regmap_config);
>> +       if (IS_ERR(regmap)) {
>> +               dev_err(dev, "regmap init failed: %ld\n", PTR_ERR(re=
gmap));
>> +               ret =3D PTR_ERR(regmap);
>> +               goto err_clk;
>> +       }
>> +
>> +       lpc18xx_nvmem_config.dev =3D dev;
>> +
>> +       eeprom->nvmem =3D nvmem_register(&lpc18xx_nvmem_config);
>> +       if (IS_ERR(eeprom->nvmem)) {
>> +               ret =3D PTR_ERR(eeprom->nvmem);
>> +               goto err_clk;
>> +       }
>> +
>> +       platform_set_drvdata(pdev, eeprom);
>> +
>> +       return 0;
>> +
>> +err_clk:
>> +       clk_disable_unprepare(eeprom->clk);
>> +
>> +       return ret;
>> +}
>> +
>> +static int lpc18xx_eeprom_remove(struct platform_device *pdev)
>> +{
>> +       struct lpc18xx_eeprom_dev *eeprom =3D platform_get_drvdata(p=
dev);
>> +
>> +       lpc18xx_eeprom_writel(eeprom, LPC18XX_EEPROM_PWRDWN,
>> +                             LPC18XX_EEPROM_PWRDWN_YES);
>> +
>> +       clk_disable_unprepare(eeprom->clk);
>> +
>> +       return nvmem_unregister(eeprom->nvmem);
>=20
> Normally you do tear down in the reverse order of initialization.
>=20
> Consider what happens here when you power down and disable the clock
> while there still are nvmem users of the eeprom.

You're right! Will fix this. Thanks again.

--=20
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
