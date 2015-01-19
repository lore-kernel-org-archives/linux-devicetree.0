From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: basic-mmio-gpio: add DT support
Date: Mon, 19 Jan 2015 12:37:18 +0900
Message-ID: <CAAVeFu+sv9XGus0QXpamkRaGebTsgWcpfCRY50Q0F3xb2psGrg@mail.gmail.com>
References: <5490B528.2020305@gmail.com> <CAAVeFuLoZPptaqnN8s6r_aN_rpBj+MpmT=5Xc2-iO3kGKZfctw@mail.gmail.com>
 <54B65110.8030509@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <54B65110.8030509@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 14, 2015 at 8:20 PM, =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
> El 14/01/2015 a las 6:32, Alexandre Courbot escribi=C3=B3:
>> On Wed, Dec 17, 2014 at 7:41 AM, =C3=81lvaro Fern=C3=A1ndez Rojas
>> <noltari@gmail.com> wrote:
>>> Add DT support while keeping legacy support.
>>>
>>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>>> ---
>>> diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generi=
c.c
>>
>> There is no documentation for these new bindings?
>
> Actually, I was waiting for this patch (by kamlakant.patel@linaro.org=
) to be accepted before: "[PATCH v1 5/5] gpio: document basic mmio gpio=
 library".
> Anyway, I will add documentation on the next version of this patch.
>
>>
>>> index 16f6115..9792783 100644
>>> --- a/drivers/gpio/gpio-generic.c
>>> +++ b/drivers/gpio/gpio-generic.c
>>> @@ -61,6 +61,9 @@ o        `                     ~~~~\___/~~~~    `=
 controller in FPGA is ,.`
>>>  #include <linux/platform_device.h>
>>>  #include <linux/mod_devicetable.h>
>>>  #include <linux/basic_mmio_gpio.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/of_gpio.h>
>>>
>>>  static void bgpio_write8(void __iomem *reg, unsigned long data)
>>>  {
>>> @@ -488,8 +491,58 @@ static void __iomem *bgpio_map(struct platform=
_device *pdev,
>>>         return ret;
>>>  }
>>>
>>> +#ifdef CONFIG_OF
>>> +static const struct of_device_id bgpio_dt_ids[] =3D {
>>> +       { .compatible =3D "basic-mmio-gpio" },
>>> +};
>>> +MODULE_DEVICE_TABLE(of, bgpio_dt_ids);
>>> +
>>> +static int bgpio_probe_dt(struct platform_device *pdev)
>>> +{
>>> +       u32 tmp;
>>> +       struct bgpio_pdata *pdata;
>>> +       struct device_node *np;
>>> +
>>> +       np =3D pdev->dev.of_node;
>>> +       if (!np)
>>> +               return 0;
>>> +
>>> +       pdata =3D devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERN=
EL);
>>> +       if (!pdata)
>>> +               return -ENOMEM;
>>> +
>>> +       pdata->label =3D dev_name(&pdev->dev);
>>> +       pdata->base =3D -1;
>>> +       if (of_find_property(np, "byte-be", NULL)) {
>>> +               pdata->flags |=3D BGPIOF_BIG_ENDIAN_BYTE_ORDER;
>>> +       }
>>> +       if (of_find_property(np, "bit-be", NULL)) {
>>> +               pdata->flags |=3D BGPIOF_BIG_ENDIAN;
>>> +       }
>>> +       if (of_find_property(np, "regset-nr", NULL)) {
>>> +               pdata->flags |=3D BGPIOF_UNREADABLE_REG_SET;
>>> +       }
>>> +       if (of_find_property(np, "regdir-nr", NULL)) {
>>> +               pdata->flags |=3D BGPIOF_UNREADABLE_REG_DIR;
>>> +       }
>>> +       if (!of_property_read_u32(np, "num-gpios", &tmp)) {
>>> +               pdata->ngpio =3D tmp;
>>> +       }
>>
>> I don't think this is acceptable. gpio-generic is designed to be use=
d
>> as a framework for other drivers to build upon. These drivers should
>> have their own compatible strings, which should be enough to infer a=
ll
>> the properties you defined here.
>>
>
> gpio-generic is not only designed as a framework for other drivers, i=
t can also be used directly by registering the driver through platform =
device (basic-mmio-gpio/basic-mmio-gpio-be).

This works for platform drivers which stay confined to the kernel, but
DT is a firmware definition where such generic bindings are much less
desirable.

> My intention is to make it DT compatible as a generic driver, which c=
an be used for different hardware, by selecting different DT properties=
 as configuration.
>
>> Device Tree identifies hardware precisely (vendor and model), and th=
is
>> new binding is just not that. You *could* however have a very simple
>> driver that associates compatible strings to static tables containin=
g
>> the values of the properties you wanted to see passed through the DT=
,
>> and have one single driver that covers many mmio-based GPIO devices.
>> But I'm afraid "basic-mmio-gpio" is *way* to vague to describe
>> hardware.
>>
>
> I don't think making a new driver mapping different compatible string=
s to static tables containing the values of the properties passed throu=
gh DT is a sane way of doing it, since it will require multiple combina=
tions to cover all the possibilites.
>
> My plan is to be able to do something like this (btw, I actually test=
ed this patch on BCM63xx and works perfectly):
> gpio-controller@10000084 {
>         compatible =3D "basic-mmio-gpio", "brcm,brcm6368";

Here your compatible string should be

        compatible =3D "brcm,brcm6368", "basic-mmio-gpio";

I.e. from more precise to less precise. A dedicated BRCM6368 driver
should take precedence over your generic one.

>         reg =3D <0x10000084 0x4>, <0x1000008c 0x4>;
>         reg-names =3D "dirout", "dat";
>
>         num-gpios =3D <32>;
>         byte-be;
>
>         gpio-controller;
>         #gpio-cells =3D <2>;
> };
> And for other hardware you could do:
> gpio-controller@10000180 {
>         compatible =3D "basic-mmio-gpio", "foo,bar";
>         reg =3D <0x10000180 0x4>, <0x10000184 0x4>, <0x10000188 0x4>;
>         reg-names =3D "dirin", "dirout", "dat";
>
>         num-gpios =3D <20>;
>         bit-be;
>         byte-be;
>         regdir-nr;
>
>         gpio-controller;
>         #gpio-cells =3D <2>;
> };
> This way you wouldn't need to add a wrapper for each specific hardwar=
e using basic-mmio-gpio, and you would save time by using the generic d=
river.

I understand the intent but IIUC the history of DT speaks  against
such generic bindings. On the other hand I can see some instances of
them like "simple-bus" for instance. Added the DT maintainers and
mailing list to get more informed opinions on the matter.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
