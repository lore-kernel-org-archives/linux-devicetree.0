MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1805100728350.2589@hadrien>
References: <20180509144119.GA6358@himanshu-Vostro-3559>
	<CAL_JsqJPXyq59oK+n+w7wX=4ua3Qe9oSiAV99ADB0f-5-a0VLg@mail.gmail.com>
	<alpine.DEB.2.20.1805100728350.2589@hadrien>
Date: Thu, 10 May 2018 08:30:52 -0500
Message-ID: <CAL_JsqJ=CZOgJi048rbeJagynGpd=eM+Yu8-ntyihrYwTWEX0Q@mail.gmail.com>
Subject: Re: When does of_match_device() return NULL ?
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Himanshu Jha <himanshujha199640@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, May 10, 2018 at 12:42 AM, Julia Lawall <julia.lawall@lip6.fr> wrote:
>
>
> On Wed, 9 May 2018, Rob Herring wrote:
>
>> On Wed, May 9, 2018 at 9:41 AM, Himanshu Jha
>> <himanshujha199640@gmail.com> wrote:
>> > Hi,
>> >
>> >
>> >
>> > The only way to probe an OF driver is when a match is found
>> > in the device table.
>>
>> For an OF-only driver, yes that is generally true. For drivers that
>> support ACPI or platform_data ptr, then it is not true.
>>
>> But what about manually binding a driver via sysfs?
>
> Yes, this is the point of the question.  How to know what are the
> possbilities for a given driver?

Bind and unbind is possible for every driver unless the driver sets
suppress_bind_attrs. You'd also have to use driver_override attr to
force a different match.

>> > And hence checking for of_match_device() is redundant
>> > and instead it is better to use of_device_get_match_data() to get the
>> > matched driver specific data in the probe function.
>>
>> This part is always true. of_device_get_match_data() was introduced
>> later, so there's still many cases that open code it with
>> of_match_device(). Patches welcome. :)
>
> Actually, the question is incorrect.  It is always fine to use
> of_device_get_match_data.  The question is whether error checking is
> needed on the result.

It would not be needed if the driver is DT only and all match table
entries have a .data ptr. However, because of manual bind/unbind, you
still need error checking.

How the error is handled varies though depending if the driver
supports NULL data, ACPI, or platform_data.

>> > For instance:
>> > https://lkml.org/lkml/2018/4/30/66
>> >
>> >  static int mmio_74xx_gpio_probe(struct platform_device *pdev)
>> >  {
>> > -       const struct of_device_id *of_id;
>> >         struct mmio_74xx_gpio_priv *priv;
>> >         struct resource *res;
>> >         void __iomem *dat;
>> >         int err;
>> >
>> > -       of_id = of_match_device(mmio_74xx_gpio_ids, &pdev->dev);
>> > -       if (!of_id)
>> > -               return -ENODEV;
>> > -
>> >         priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>> >         if (!priv)
>> >                 return -ENOMEM;
>> >
>> > +       priv->flags = (uintptr_t)of_device_get_match_data(&pdev->dev);
>> > +
>> >         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> >         dat = devm_ioremap_resource(&pdev->dev, res);
>> >         if (IS_ERR(dat))
>> >                 return PTR_ERR(dat);
>> >
>> > -       priv->flags = (uintptr_t) of_id->data;
>> > -
>> >
>> > --------------------------------------------------------------------------
>> >
>> > In the above example of_match_device() is useless since the
>> > probe occurs *only* when a match is found and therefore checking again
>> > is redundant.
>> >
>> > But now my question is if this is the case, then when does
>> > of_match_device() return NULL ? When is the error handling required ?
>> >
>> > There are places where it is done as "safe-play" coding as suggested to me
>> > by Jonathan Cameron previosuly https://lkml.org/lkml/2018/3/16/1245
>> >
>> > I am working on a Coccinelle SmPL rule with the help of Julia Lawall to
>> > replace of_match_device() + error handling with
>> > of_device_get_match_data() simply.
>> >
>> > I am testing the refactoring changes and it is at:
>> > https://github.com/himanshujha199640/linux-next/commit/efb7ed923bd00c86fe0a4e67e2ddb636ff0e0ff4
>> >
>> > -------------------------------------------------------------------------------
>> >
>> > Some statistics found by Julia Lawall:
>> >
>> >
>> > f_match_device with check: 257/283
>> >   no of tbl: 39, of tbl only: 148, other tbl only: 4, multi tbl: 66
>> >   has of_match_ptr: 87, no of_match_ptr: 170
>> >
>> > of_match_device without check: 26/283
>> >   no of tbl: 14, of tbl only: 11, other tbl only: 0, multi tbl: 1
>> >   has of_match_ptr: 6, no of_match_ptr: 20
>> >
>> > of_device_get_match_data with check: 158/212
>> >   no of tbl: 29, of tbl only: 78, other tbl only: 0, multi tbl: 51
>> >   has of_match_ptr: 53, no of_match_ptr: 105
>> >
>> > of_device_get_match_data without check: 54/212
>> >   no of tbl: 13, of tbl only: 40, other tbl only: 0, multi tbl: 1
>> >   has of_match_ptr: 8, no of_match_ptr: 46
>> >
>> > Multi table files without an of_match_device check
>> >   drivers/mmc/host/mxs-mmc.c
>> >
>> > Multi table files without an of_device_get_match_data check
>> >   drivers/clk/clk-versaclock5.c
>> >
>> > of_match_ptr files without an of_match_device check
>> >   drivers/pinctrl/mvebu/pinctrl-orion.c
>> >   drivers/tty/serial/mvebu-uart.c
>> >   drivers/misc/eeprom/eeprom_93xx46.c
>> >   arch/arm/plat-pxa/ssp.c
>> >   drivers/soc/mediatek/mtk-scpsys.c
>> >   drivers/pinctrl/mvebu/pinctrl-armada-cp110.c
>> > of_match_ptr files without an of_device_get_match_data check
>>
>> The purpose of of_match_ptr() is just to increase compile coverage for
>> !CONFIG_OF. In both of these cases, it is perfectly fine to not call
>> of_match_device or of_device_get_match_data if the match table has no
>> data ptr. That is quite common.
>
> The question here is not whether a function is called or not, but whether
> there is error checking on the result.  In the above cases, there is a
> call to of_device_get_match_data, which means that a device table can be
> NULL, but still there is no check for NULL on the result of
> of_device_get_match_data.

That's a bug if the driver supports driver_override and bind.

>
> What is the relationship between the declaration:
>
> MODULE_DEVICE_TABLE(of, ...);

That creates module aliases for module auto loading. For built-in only
drivers it is not needed. However, it also just gets thrown out
automatically.

> and a declaration like:
>
> struct platform_driver nouveau_platform_driver = {
>         .driver = {
>                 .name = "nouveau",

This can be used to match as well if neither DT nor ACPI is used.

>                 .of_match_table = of_match_ptr(nouveau_platform_match),

And this is used for matching devices with drivers.

>         },
>         .probe = nouveau_platform_probe,
>         .remove = nouveau_platform_remove,
> };
>
> Many drivers have both, but some do not have the first.  Which causes the
> actual device tree matching to happen?

Depends on the bus. For platform devices, of_platform_populate() scans
the tree and creates devices. From there, it is how matching works for
everything. When a device is added, the bus's driver list is checked
for a match. When a driver is added, the bus's device list is checked
for a match.

> Is there any way that one can
> infer from the presence or absence of either kind of declaration that
> there is only one way to cause the probe function to be invoked?

I think the short answer is no.

DT requires an of_match_table. ACPI requires an acpi_match_table
(IIRC). PCI/USB use VID/PID. Then you have old style platform device
and driver .name matching. And then there's manually binding.

Rob
