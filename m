From: RongJun Ying <rjying-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mfd: Support SiRF audio modules
Date: Tue, 11 Mar 2014 00:12:24 +0800
Message-ID: <CAByv0RNQrPitsfcAwMvn=eZ1hNSaii=jw94H68rQvfQXnjYz9A@mail.gmail.com>
References: <1394184531-7679-1-git-send-email-rongjun.ying@csr.com>
	<20140310103532.GI14976@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140310103532.GI14976@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, DL-SHA-WorkGroupLinux <workgroup.linux-kQvG35nSl+M@public.gmane.org>, Rongjun Ying <rongjun.ying-kQvG35nSl+M@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

2014-03-10 18:35 GMT+08:00 Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> CC'ing the DT ML, please don't forget in future.
>
>> From: Rongjun Ying <rongjun.ying-kQvG35nSl+M@public.gmane.org>
>>
>> The audio modules inside the consist of an internal audio codec, int=
ernal
>> audio port and i2s controller.
>>
>> These modules sharing same register range and size.
>> sirf-audio.c provides common regmap mmio handling for all audio modu=
les.
>> The sound drivers operation are via regmap.
>>
>> Signed-off-by: Rongjun Ying <rongjun.ying-kQvG35nSl+M@public.gmane.org>
>> ---
>>  .../devicetree/bindings/mfd/sirf-audio.txt         |   67 +++++++++=
++
>
> DT documentation should be provided in a separate patch.
>
>>  drivers/mfd/Kconfig                                |   11 ++
>>  drivers/mfd/Makefile                               |    1 +
>>  drivers/mfd/sirf-audio.c                           |  119 +++++++++=
+++++++++++
>>  include/linux/mfd/sirf/audio.h                     |   17 +++
>>  5 files changed, 215 insertions(+), 0 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/sirf-audio=
=2Etxt
>>  create mode 100644 drivers/mfd/sirf-audio.c
>>  create mode 100644 include/linux/mfd/sirf/audio.h
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/sirf-audio.txt b/=
Documentation/devicetree/bindings/mfd/sirf-audio.txt
>> new file mode 100644
>> index 0000000..cc6a39b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/sirf-audio.txt
>> @@ -0,0 +1,67 @@
>> +SiRF SoC audio modules
>> +
>> +The audio modules inside the consist of an internal audio codec, in=
ternal
>
> ... inside the <what?>
>
>> +audio port and i2s controller.
>> +
>> +Required properties:
>> +- compatible: "sirf,prima2-audio" or "sirf,atlas6-audio"
>> +- reg : the register address of the device.
>
> Nit: s/the/The
>
>> +- #address-cells: Must be 1
>> +- #size-cells: Must be 1
>> +
>> +Nodes:
>> +Internal audio codec:
>> +  - compatible : "sirf,atlas6-audio-codec" or "sirf,prima2-audio-co=
dec"
>> +  - clocks: the clock of SiRF internal audio codec
>
> Nit: s/the/The
>
> Might be worth mentioning that clocks expects a phandle.
>
>> +Internal audio port:
>> +- compatible: "sirf,audio-port"
>> +- dmas: List of DMA controller phandle and DMA request line ordered=
 pairs.
>
> s/phandle/phandles
>
>> +- dma-names: Identifier string for each DMA request line in the dma=
s property.
>> +  These strings correspond 1:1 with the ordered pairs in dmas.
>> +
>> +  One of the DMA channels will be responsible for transmission (sho=
uld be
>> +  named "tx") and one for reception (should be named "rx").
>> +
>> +I2S controller:
>> +- compatible: "sirf,prima2-i2s"
>> +- dmas: List of DMA controller phandle and DMA request line ordered=
 pairs.
>
> s/phandle/phandles
>
>> +- dma-names: Identifier string for each DMA request line in the dma=
s property.
>> +  These strings correspond 1:1 with the ordered pairs in dmas.
>> +
>> +  One of the DMA channels will be responsible for transmission (sho=
uld be
>> +  named "tx") and one for reception (should be named "rx").
>
> No need to keep mentioning these same lines over and over - just poin=
t
> to:
>   Documentation/devicetree/bindings/dma/dma.txt
>
>> +- clocks: I2S controller clock source
>> +- pinctrl-names: Must contain a "default" entry.
>> +- pinctrl-NNN: One property must exist for each entry in pinctrl-na=
mes.
>
> Again, rather than making up your own interpretation of the standard
> pinctrl properties, just point to:
>   Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
>
> Full stops and colons are not consistent throughout.
>
>> +Example:
>> +
>> +sirfaudio: sirfaudio@b0040000 {
>> +     compatible =3D "sirf,atlas6-audio";
>> +     reg =3D <0xb0040000 0x10000>;
>> +     #address-cells =3D <1>;
>> +     #size-cells =3D <1>;
>> +
>> +     audiocodec: audiocodec@b0040000 {
>> +             compatible =3D "sirf,atlas6-audio-codec";
>> +             interrupts =3D <35>;
>
> No flags?
>
>> +             clocks =3D <&clks 27>;
>> +     };
>> +
>> +     audioport: audioport@b0040000 {
>
> No need for the @b0040000 on child properties.
>
>> +             compatible =3D "sirf,audio-port";
>> +             dmas =3D <&dmac1 3>, <&dmac1 8>;
>> +             dma-names =3D "rx", "tx";
>> +     };
>> +
>> +     i2s: i2s@b0040000 {
>> +             compatible =3D "sirf,prima2-i2s";
>> +             dmas =3D <&dmac1 6>, <&dmac1 12>;
>> +             dma-names =3D "rx", "tx";
>> +             clocks =3D <&clks 27>;
>> +             pinctrl-names =3D "default";
>> +             pinctrl-0 =3D <&i2s_pins_a>;
>> +     };
>> +};
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index b7c74a7..1c13019 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -546,6 +546,17 @@ config MFD_SI476X_CORE
>>         To compile this driver as a module, choose M here: the
>>         module will be called si476x-core.
>>
>> +config MFD_SIRF_AUDIO
>> +     tristate "SiRF Audio modules"
>> +     depends on ARCH_SIRF
>
> depends on OF
>
>> +     select MFD_CORE
>> +     select REGMAP_MMIO
>> +     help
>> +       This is the driver for the SiRF audio modules, include I2S,
>
> s/include/which consists of (or similar)
>
>> +       internal audio codec, internal audio port and AC97. These mo=
dules
>> +       share same register map region and size. So this MFD driver =
used
>
> s/same/the same
>
> s/register map region and size/address space
>
> s/used/is used
>
>> +       to manage regmap.
>
> s/regmap/the regmap OR via regmap
>
>> +
>>  config MFD_SM501
>>       tristate "Silicon Motion SM501"
>>        ---help---
>> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
>> index 8a28dc9..9182170 100644
>> --- a/drivers/mfd/Makefile
>> +++ b/drivers/mfd/Makefile
>> @@ -164,3 +164,4 @@ obj-$(CONFIG_MFD_RETU)            +=3D retu-mfd.=
o
>>  obj-$(CONFIG_MFD_AS3711)     +=3D as3711.o
>>  obj-$(CONFIG_MFD_AS3722)     +=3D as3722.o
>>  obj-$(CONFIG_MFD_STW481X)    +=3D stw481x.o
>> +obj-$(CONFIG_MFD_SIRF_AUDIO) +=3D sirf-audio.o
>> diff --git a/drivers/mfd/sirf-audio.c b/drivers/mfd/sirf-audio.c
>> new file mode 100644
>> index 0000000..078f0a2
>> --- /dev/null
>> +++ b/drivers/mfd/sirf-audio.c
>> @@ -0,0 +1,119 @@
>> +/*
>> + * airf-audio.c
>> + *
>> + * Copyright (c) 2014 Cambridge Silicon Radio Limited, a CSR plc gr=
oup company.
>> + *
>> + * Licensed under GPLv2 or later.
>> + */
>
> Please use a more standard header. There are plenty of good examples
> in other drivers.
>
>> +#include <linux/module.h>
>> +#include <linux/moduleparam.h>
>> +#include <linux/init.h>
>> +#include <linux/err.h>
>> +#include <linux/of.h>
>> +#include <linux/mfd/core.h>
>> +#include <linux/mfd/sirf/audio.h>
>> +#include <linux/regmap.h>
>> +
>> +static const struct mfd_cell sirf_audio_atlas6_devs[] =3D {
>> +     {
>> +             .of_compatible =3D "sirf,prima2-i2s",
>> +             .name =3D "sirf-i2s",
>> +     }, {
>> +             .of_compatible =3D "sirf,atlas6-audio-codec",
>> +             .name =3D "sirf-audio-codec",
>> +     }, {
>> +             .of_compatible =3D "sirf,audio-port",
>> +             .name =3D "sirf-audio-port",
>> +     }
>> +};
>> +
>> +static const struct mfd_cell sirf_audio_prima2_devs[] =3D {
>> +     {
>> +             .of_compatible =3D "sirf,prima2-i2s",
>> +             .name =3D "sirf-i2s",
>> +     }, {
>> +             .of_compatible =3D "sirf,prima2-audio-codec",
>> +             .name =3D "sirf-audio-codec",
>> +     }, {
>> +             .of_compatible =3D "sirf,audio-port",
>> +             .name =3D "sirf-audio-port",
>> +     }
>> +};
>> +
>> +static const struct regmap_config sirf_audio_regmap_config =3D {
>> +     .reg_bits =3D 32,
>> +     .reg_stride =3D 4,
>> +     .val_bits =3D 32,
>> +     .cache_type =3D REGCACHE_NONE,
>> +};
>> +
>> +static int sirf_audio_probe(struct platform_device *pdev)
>> +{
>> +     struct resource *mem_res;
>> +     struct sirf_audio_dev *sirf_audio;
>> +     void __iomem *base;
>> +     struct mfd_cell *cell;
>> +     int cell_number;
>> +
>> +     sirf_audio =3D devm_kzalloc(&pdev->dev, sizeof(struct sirf_aud=
io_dev),
>
> sizeof(*sirf_audio)
>
>> +                             GFP_KERNEL);
>> +     if (sirf_audio =3D=3D NULL)
>
> if (!sirf_audio)
>
>> +             return -ENOMEM;
>> +
>> +     mem_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +     base =3D devm_ioremap_resource(&pdev->dev, mem_res);
>> +     if (base =3D=3D NULL)
>
> if (!base)
>
>> +             return -ENOMEM;
>> +
>> +     sirf_audio->regmap =3D devm_regmap_init_mmio(&pdev->dev, base,
>> +                                         &sirf_audio_regmap_config)=
;
>> +     if (IS_ERR(sirf_audio->regmap))
>> +             return PTR_ERR(sirf_audio->regmap);
>
> Use a local regmap variable here and assign it to sirf_audio->regmap
> if successful.
>
>> +     platform_set_drvdata(pdev, sirf_audio);
>> +
>> +     if (of_device_is_compatible(pdev->dev.of_node,
>> +                     "sirf,prima2-audio")) {
>> +             cell =3D sirf_audio_prima2_devs;
>> +             cell_number =3D ARRAY_SIZE(sirf_audio_prima2_devs);
>
> s/cell_number/n_devs
>
>> +     } else if (of_device_is_compatible(pdev->dev.of_node,
>> +                     "sirf,atlas6-audio")) {
>> +             cell =3D sirf_audio_atlas6_devs;
>> +             cell_number =3D ARRAY_SIZE(sirf_audio_atlas6_devs);
>
> s/cell_number/n_devs
>
>> +     } else
>> +             return -EINVAL;
>
> I'm not sure there's any need for this. Why don't you just parse the
> child nodes? Are you even sure you need an MFD at all? It appears
> you're just using an MFD to share a regmap. Seems like over-kill to m=
e.

In my case, the prima2 and atlas6 codec have small different. But
they use the same register address space.
The sound codec driver need know what codec device is applied.

>
>> +     return mfd_add_devices(&pdev->dev, -1, cell, cell_number,
>> +                     NULL, 0, NULL);
>> +}
>> +
>> +static int sirf_audio_remove(struct platform_device *pdev)
>> +{
>> +     mfd_remove_devices(&pdev->dev);
>> +     return 0;
>> +}
>> +
>> +static const struct of_device_id sirf_audio_of_match[] =3D {
>> +     { .compatible =3D "sirf,prima2-audio", },
>> +     { .compatible =3D "sirf,atlas6-audio", },
>> +     {}
>> +};
>> +MODULE_DEVICE_TABLE(of, sirf_audio_of_match);
>> +
>> +static struct platform_driver sirf_audio_driver =3D {
>> +     .driver =3D {
>> +             .name =3D "sirf-audio",
>> +             .owner =3D THIS_MODULE,
>> +             .of_match_table =3D sirf_audio_of_match,
>> +     },
>> +     .probe =3D sirf_audio_probe,
>> +     .remove =3D sirf_audio_remove,
>> +};
>> +
>> +module_platform_driver(sirf_audio_driver);
>> +
>> +MODULE_DESCRIPTION("SiRF Audio mfd driver");
>
> s/mfd/MFD
>
>> +MODULE_AUTHOR("RongJun Ying <Rongjun.Ying-kQvG35nSl+M@public.gmane.org>");
>> +MODULE_LICENSE("GPL v2");
>> +
>> diff --git a/include/linux/mfd/sirf/audio.h b/include/linux/mfd/sirf=
/audio.h
>> new file mode 100644
>> index 0000000..d8cfff9
>> --- /dev/null
>> +++ b/include/linux/mfd/sirf/audio.h
>> @@ -0,0 +1,17 @@
>> +/*
>> + * audio.h
>> + *
>> + * Copyright (c) 2014 Cambridge Silicon Radio Limited, a CSR plc gr=
oup company.
>> + *
>> + * Licensed under GPLv2 or later.
>> + */
>
> Use a standard header please.
>
>> +
>> +
>
> Superfluous new lines.
>
>> +#ifndef __LINUX_MFD_SIRF_AUDIO_H
>> +#define __LINUX_MFD_SIRF_AUDIO_H
>
> The LINUX_ is superfluous also.
>
>> +struct sirf_audio_dev {
>> +     struct regmap *regmap;
>> +};
>
> Is this going to be utilised in the subordinate drivers?

Yes, The subordinate drivers such as I2S, SiRF internal audio codec and=
 port,
which will used this regmap to shared the same register address space.
The sirf_audio_dev object is the parent driver data, and child drivers
will get it.

>
>> +#endif /* __LINUX_MFD_SIRF_AUDIO_H */
>
> --
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =81 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog


Thanks
--=20
------------------------------
Rongjun Ying
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
