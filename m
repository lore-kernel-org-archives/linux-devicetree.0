From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4] extcon: gpio: Add the support for Device tree bindings
Date: Tue, 31 May 2016 16:13:28 +0900
Message-ID: <574D3998.6070908@samsung.com>
References: <1464263265-20187-1-git-send-email-vreddytalla@nvidia.com>
 <CAGTfZH25YJDKA+cmFd5Tkid1GYnZmZcfP2q=ggmUiZQriaG+NQ@mail.gmail.com>
 <CGME20160527051358epcas1p1645344dc9a83bfad2c65eade83cc1337@epcas1p1.samsung.com>
 <91b4e67376654538b085a6ab1e38d8ae@bgmail102.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <91b4e67376654538b085a6ab1e38d8ae@bgmail102.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Venkat Reddy Talla <vreddytalla@nvidia.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree <devicetree@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-kernel <linux-kernel@vger.kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Venkat,

On 2016=EB=85=84 05=EC=9B=94 27=EC=9D=BC 14:13, Venkat Reddy Talla wrot=
e:
> Hi Choi,
>=20
> Sorry for changing author, will update author field with your name.
>=20
> Regarding Rob Herring comments, You had already replied.

Rob gave some comment which the compatible string of extcon-gpio.c shou=
ld
include the type of external connector. I replied about it [1].
[1] https://lkml.org/lkml/2016/5/31/109

>=20
> I felt separate compatible for each external connector is not require=
d,
> as client driver can detect the type of external cable(sdp,dcp, micro=
phone) on receiving notification from extcon provider,

You're right about the operation point of view.
But, As Rob gave some comment, The device-tree should include the devic=
e information
instead of driver information. The 'extcon-gpio' compatible mean the on=
ly driver
without h/w information.=20

I think that there is more discussion how to
decide the compatible name of extcon-gpio.c driver. =20

> I have also added more description for wakeup-source.

OK.

>=20
> Do you see any other changes required on top of v4 patch?

Regards,
Chanwoo Choi

>=20
> Regards,
> Venkat
>=20
>> -----Original Message-----
>> From: Chanwoo Choi [mailto:cwchoi00@gmail.com]
>> Sent: Thursday, May 26, 2016 6:52 PM
>> To: Venkat Reddy Talla
>> Cc: MyungJoo Ham; Rob Herring; Pawel Moll; Mark Rutland; Ian Campbel=
l;
>> devicetree; Kumar Gala; linux-kernel; Laxman Dewangan
>> Subject: Re: [PATCH v4] extcon: gpio: Add the support for Device tre=
e
>> bindings
>>
>> Hi Venkat,
>>
>> There is some miscommunication. On previous my reply, I don't mean t=
hat
>> the author of the patch[1] is changed from me to you.
>>
>> I'd like you to remain the original author(me) for the patch[1] with=
out
>> changing the author.
>> [1] https://lkml.org/lkml/2015/10/21/8
>> - [PATCH v3] extcon: gpio: Add the support for Device tree bindings
>>
>> You can use the patch[1] as based patch and you can add new feature =
on
>> base patch[1]. Also, If you ok, you can modify the extccon-gpio.c dr=
iver as
>> Rob comment[2].
>>
>> But, Rob Herring gave me the some comment[2].
>> [2] https://lkml.org/lkml/2015/10/21/906
>>
>>
>> Thanks,
>> Chanwoo Choi
>>
>>
>> On Thu, May 26, 2016 at 8:47 PM, Venkat Reddy Talla
>> <vreddytalla@nvidia.com> wrote:
>>> Add the support for Device tree bindings of extcon-gpio driver.
>>> The extcon-gpio device tree node must include the both 'extcon-id' =
and
>>> 'gpios' property.
>>>
>>> For example:
>>>         usb_cable: extcon-gpio-0 {
>>>                 compatible =3D "extcon-gpio";
>>>                 extcon-id =3D <EXTCON_USB>;
>>>                 gpios =3D <&gpio6 1 GPIO_ACTIVE_HIGH>;
>>>         }
>>>         ta_cable: extcon-gpio-1 {
>>>                 compatible =3D "extcon-gpio";
>>>                 extcon-id =3D <EXTCON_CHG_USB_DCP>;
>>>                 gpios =3D <&gpio3 2 GPIO_ACTIVE_LOW>;
>>>                 debounce-ms =3D <50>;     /* 50 millisecond */
>>>                 wakeup-source;
>>>         }
>>>         &dwc3_usb {
>>>                 extcon =3D <&usb_cable>;
>>>         };
>>>         &charger {
>>>                 extcon =3D <&ta_cable>;
>>>         };
>>>
>>> Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
>>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>>> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
>>>
>>> ---
>>> changes from v3:
>>> - add description for wakeup-source in documentation
>>> - change dts property extcon-gpio name to gpios
>>> - use of_get_named_gpio_flags to get gpio number and flags Changes
>>> from v2:
>>> - Add the more description for 'extcon-id' property in documentatio=
n
>>> Changes from v1:
>>> - Create the include/dt-bindings/extcon/extcon.h including the
>>> identification of external connector. These definitions are used in=
 dts file.
>>> - Fix error if CONFIG_OF is disabled.
>>> - Add signed-off tag by Myungjoo Ham
>>> ---
>>> ---
>>>  .../devicetree/bindings/extcon/extcon-gpio.txt     |  48 +++++++++
>>>  drivers/extcon/extcon-gpio.c                       | 109 +++++++++=
++++++++----
>>>  include/dt-bindings/extcon/extcon.h                |  47 +++++++++
>>>  include/linux/extcon/extcon-gpio.h                 |   8 +-
>>>  4 files changed, 189 insertions(+), 23 deletions(-)  create mode
>>> 100644 Documentation/devicetree/bindings/extcon/extcon-gpio.txt
>>>  create mode 100644 include/dt-bindings/extcon/extcon.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/extcon/extcon-gpio.t=
xt
>>> b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
>>> new file mode 100644
>>> index 0000000..81f7932
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
>>> @@ -0,0 +1,48 @@
>>> +GPIO Extcon device
>>> +
>>> +This is a virtual device used to generate the specific cable state=
s
>>> +from the GPIO pin.
>>> +
>>> +Required properties:
>>> +- compatible: Must be "extcon-gpio".
>>> +- extcon-id: The extcon support the various type of external
>>> +connector to check
>>> +  whether connector is attached or detached. The each external
>>> +connector has
>>> +  the unique number to identify it. So this property includes the
>>> +unique number
>>> +  which indicates the specific external connector. When external
>>> +connector is
>>> +  attached or detached, GPIO pin detect the changed state. See
>>> +include/
>>> +  dt-bindings/extcon/extcon.h which defines the unique number for
>>> +supported
>>> +  external connector from extcon framework.
>>> +- gpios: GPIO pin to detect the external connector. See gpio bindi=
ng.
>>> +
>>> +Optional properties:
>>> +- debounce-ms: the debounce dealy for GPIO pin in millisecond.
>>> +- wakeup-source: Boolean, extcon can wake-up the system from
>> suspend.
>>> +  if gpio provided in extcon-gpio DT node is registered as interru=
pt,
>>> +  then extcon can wake-up the system from suspend if wakeup-source
>>> +property
>>> +  is available in DT node, if gpio registered as interrupt but
>>> +wakeup-source
>>> +  is not available in DT node, then system wake-up due to extcon
>>> +events
>>> +  not supported.
>>> +
>>> +Example: Examples of extcon-gpio node as listed below:
>>> +
>>> +       usb_cable: extcon-gpio-0 {
>>> +               compatible =3D "extcon-gpio";
>>> +               extcon-id =3D <EXTCON_USB>;
>>> +               extcon-gpio =3D <&gpio6 1 GPIO_ACTIVE_HIGH>;
>>> +       }
>>> +
>>> +       ta_cable: extcon-gpio-1 {
>>> +               compatible =3D "extcon-gpio";
>>> +               extcon-id =3D <EXTCON_CHG_USB_DCP>;
>>> +               extcon-gpio =3D <&gpio3 2 GPIO_ACTIVE_LOW>;
>>> +               debounce-ms =3D <50>;     /* 50 millisecond */
>>> +               wakeup-source;
>>> +       }
>>> +
>>> +       &dwc3_usb {
>>> +               extcon =3D <&usb_cable>;
>>> +       };
>>> +
>>> +       &charger {
>>> +               extcon =3D <&ta_cable>;
>>> +       };
>>> diff --git a/drivers/extcon/extcon-gpio.c
>>> b/drivers/extcon/extcon-gpio.c index d023789..592f395 100644
>>> --- a/drivers/extcon/extcon-gpio.c
>>> +++ b/drivers/extcon/extcon-gpio.c
>>> @@ -1,11 +1,9 @@
>>>  /*
>>>   * extcon_gpio.c - Single-state GPIO extcon driver based on extcon=
 class
>>>   *
>>> - * Copyright (C) 2008 Google, Inc.
>>> - * Author: Mike Lockwood <lockwood@android.com>
>>> - *
>>> - * Modified by MyungJoo Ham <myungjoo.ham@samsung.com> to
>> support
>>> extcon
>>> - * (originally switch class is supported)
>>> + * Copyright (C) 2016 Chanwoo Choi <cw00.choi@samsung.com>,
>> Samsung
>>> + Electronics
>>> + * Copyright (C) 2012 MyungJoo Ham <myungjoo.ham@samsung.com>,
>>> + Samsung Electronics
>>> + * Copyright (C) 2008 Mike Lockwood <lockwood@android.com>, Google=
,
>> Inc.
>>>   *
>>>   * This software is licensed under the terms of the GNU General Pu=
blic
>>>   * License version 2, as published by the Free Software Foundation=
,
>>> and @@ -25,13 +23,17 @@  #include <linux/interrupt.h>  #include
>>> <linux/kernel.h>  #include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_gpio.h>
>>>  #include <linux/platform_device.h>
>>> +#include <linux/property.h>
>>>  #include <linux/slab.h>
>>>  #include <linux/workqueue.h>
>>>
>>>  struct gpio_extcon_data {
>>>         struct extcon_dev *edev;
>>>         int irq;
>>> +       bool irq_wakeup;
>>>         struct delayed_work work;
>>>         unsigned long debounce_jiffies;
>>>
>>> @@ -49,7 +51,7 @@ static void gpio_extcon_work(struct work_struct
>> *work)
>>>         state =3D gpiod_get_value_cansleep(data->id_gpiod);
>>>         if (data->pdata->gpio_active_low)
>>>                 state =3D !state;
>>> -       extcon_set_state(data->edev, state);
>>> +       extcon_set_cable_state_(data->edev, data->pdata->extcon_id,
>>> + state);
>>>  }
>>>
>>>  static irqreturn_t gpio_irq_handler(int irq, void *dev_id) @@ -61,=
6
>>> +63,42 @@ static irqreturn_t gpio_irq_handler(int irq, void *dev_id=
)
>>>         return IRQ_HANDLED;
>>>  }
>>>
>>> +static int gpio_extcon_parse_of(struct platform_device *pdev,
>>> +                               struct gpio_extcon_data *data) {
>>> +       struct gpio_extcon_pdata *pdata;
>>> +       struct device_node *np =3D pdev->dev.of_node;
>>> +       enum of_gpio_flags flags;
>>> +       int ret;
>>> +
>>> +       pdata =3D devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERN=
EL);
>>> +       if (!pdata)
>>> +               return -ENOMEM;
>>> +
>>> +       ret =3D device_property_read_u32(&pdev->dev, "extcon-id",
>>> +                                        &pdata->extcon_id);
>>> +       if (ret < 0)
>>> +               return -EINVAL;
>>> +
>>> +       pdata->gpio =3D of_get_named_gpio_flags(np, "gpios", 0, &fl=
ags);
>>> +       if (pdata->gpio < 0)
>>> +               return -EINVAL;
>>> +
>>> +       if (flags & OF_GPIO_ACTIVE_LOW)
>>> +               pdata->gpio_active_low =3D true;
>>> +
>>> +       data->irq_wakeup =3D device_property_read_bool(&pdev->dev,
>>> +                                               "wakeup-source");
>>> +
>>> +       device_property_read_u32(&pdev->dev, "debounce-ms",
>>> + &pdata->debounce);
>>> +
>>> +       pdata->irq_flags =3D (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FA=
LLING
>>> +                               | IRQF_ONESHOT);
>>> +
>>> +       data->pdata =3D pdata;
>>> +       return 0;
>>> +}
>>> +
>>>  static int gpio_extcon_init(struct device *dev, struct
>>> gpio_extcon_data *data)  {
>>>         struct gpio_extcon_pdata *pdata =3D data->pdata; @@ -96,16
>>> +134,20 @@ static int gpio_extcon_probe(struct platform_device *pde=
v)
>>>         struct gpio_extcon_data *data;
>>>         int ret;
>>>
>>> -       if (!pdata)
>>> -               return -EBUSY;
>>> -       if (!pdata->irq_flags || pdata->extcon_id > EXTCON_NONE)
>>> -               return -EINVAL;
>>> -
>>> -       data =3D devm_kzalloc(&pdev->dev, sizeof(struct gpio_extcon=
_data),
>>> -                                  GFP_KERNEL);
>>> +       data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL=
);
>>>         if (!data)
>>>                 return -ENOMEM;
>>> -       data->pdata =3D pdata;
>>> +
>>> +       if (!pdata) {
>>> +               ret =3D gpio_extcon_parse_of(pdev, data);
>>> +               if (ret < 0)
>>> +                       return ret;
>>> +       } else {
>>> +               data->pdata =3D pdata;
>>> +       }
>>> +
>>> +       if (!data->pdata->irq_flags || data->pdata->extcon_id =3D=3D
>> EXTCON_NONE)
>>> +               return -EINVAL;
>>>
>>>         /* Initialize the gpio */
>>>         ret =3D gpio_extcon_init(&pdev->dev, data); @@ -113,7 +155,=
8 @@
>>> static int gpio_extcon_probe(struct platform_device *pdev)
>>>                 return ret;
>>>
>>>         /* Allocate the memory of extcon devie and register extcon =
device */
>>> -       data->edev =3D devm_extcon_dev_allocate(&pdev->dev, &pdata-
>>> extcon_id);
>>> +       data->edev =3D devm_extcon_dev_allocate(&pdev->dev,
>>> +
>>> + &data->pdata->extcon_id);
>>>         if (IS_ERR(data->edev)) {
>>>                 dev_err(&pdev->dev, "failed to allocate extcon devi=
ce\n");
>>>                 return -ENOMEM;
>>> @@ -130,7 +173,8 @@ static int gpio_extcon_probe(struct
>> platform_device *pdev)
>>>          * is attached or detached.
>>>          */
>>>         ret =3D devm_request_any_context_irq(&pdev->dev, data->irq,
>>> -                                       gpio_irq_handler, pdata->ir=
q_flags,
>>> +                                       gpio_irq_handler,
>>> +                                       data->pdata->irq_flags,
>>>                                         pdev->name, data);
>>>         if (ret < 0)
>>>                 return ret;
>>> @@ -139,6 +183,8 @@ static int gpio_extcon_probe(struct
>> platform_device *pdev)
>>>         /* Perform initial detection */
>>>         gpio_extcon_work(&data->work.work);
>>>
>>> +       if (data->irq_wakeup)
>>> +               device_init_wakeup(&pdev->dev, data->irq_wakeup);
>>>         return 0;
>>>  }
>>>
>>> @@ -152,11 +198,23 @@ static int gpio_extcon_remove(struct
>>> platform_device *pdev)  }
>>>
>>>  #ifdef CONFIG_PM_SLEEP
>>> +static int gpio_extcon_suspend(struct device *dev) {
>>> +       struct gpio_extcon_data *data =3D dev_get_drvdata(dev);
>>> +
>>> +       if (data->irq_wakeup)
>>> +               enable_irq_wake(data->irq);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>>  static int gpio_extcon_resume(struct device *dev)  {
>>> -       struct gpio_extcon_data *data;
>>> +       struct gpio_extcon_data *data =3D dev_get_drvdata(dev);
>>> +
>>> +       if (data->irq_wakeup)
>>> +               disable_irq_wake(data->irq);
>>>
>>> -       data =3D dev_get_drvdata(dev);
>>>         if (data->pdata->check_on_resume)
>>>                 queue_delayed_work(system_power_efficient_wq,
>>>                         &data->work, data->debounce_jiffies); @@
>>> -165,7 +223,18 @@ static int gpio_extcon_resume(struct device *dev)=
  }
>>> #endif
>>>
>>> -static SIMPLE_DEV_PM_OPS(gpio_extcon_pm_ops, NULL,
>>> gpio_extcon_resume);
>>> +#if defined(CONFIG_OF)
>>> +static const struct of_device_id gpio_extcon_of_match[] =3D {
>>> +       { .compatible =3D "extcon-gpio", },
>>> +       { /* sentinel */ },
>>> +};
>>> +MODULE_DEVICE_TABLE(of, gpio_extcon_of_match); #else
>>> +#define gpio_extcon_of_match   NULL
>>> +#endif
>>> +
>>> +static SIMPLE_DEV_PM_OPS(gpio_extcon_pm_ops,
>>> +                       gpio_extcon_suspend, gpio_extcon_resume);
>>>
>>>  static struct platform_driver gpio_extcon_driver =3D {
>>>         .probe          =3D gpio_extcon_probe,
>>> @@ -173,11 +242,13 @@ static struct platform_driver gpio_extcon_dri=
ver =3D
>> {
>>>         .driver         =3D {
>>>                 .name   =3D "extcon-gpio",
>>>                 .pm     =3D &gpio_extcon_pm_ops,
>>> +               .of_match_table =3D gpio_extcon_of_match,
>>>         },
>>>  };
>>>
>>>  module_platform_driver(gpio_extcon_driver);
>>>
>>> +MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
>>>  MODULE_AUTHOR("Mike Lockwood <lockwood@android.com>");
>>> MODULE_DESCRIPTION("GPIO extcon driver");  MODULE_LICENSE("GPL");
>> diff
>>> --git a/include/dt-bindings/extcon/extcon.h
>>> b/include/dt-bindings/extcon/extcon.h
>>> new file mode 100644
>>> index 0000000..dbba588
>>> --- /dev/null
>>> +++ b/include/dt-bindings/extcon/extcon.h
>>> @@ -0,0 +1,47 @@
>>> +/*
>>> + * This header provides constants for most extcon bindings.
>>> + *
>>> + * Most extcon bindings include the unique identification format.
>>> + * In most cases, the unique id format uses the standard values/ma=
cro
>>> + * defined in this header.
>>> + */
>>> +
>>> +#ifndef _DT_BINDINGS_EXTCON_EXTCON_H
>>> +#define _DT_BINDINGS_EXTCON_EXTCON_H
>>> +
>>> +/* USB external connector */
>>> +#define EXTCON_USB             1
>>> +#define EXTCON_USB_HOST                2
>>> +
>>> +/* Charging external connector */
>>> +#define EXTCON_CHG_USB_SDP     5       /* Standard Downstream Port=
 */
>>> +#define EXTCON_CHG_USB_DCP     6       /* Dedicated Charging Port =
*/
>>> +#define EXTCON_CHG_USB_CDP     7       /* Charging Downstream Port=
 */
>>> +#define EXTCON_CHG_USB_ACA     8       /* Accessory Charger Adapte=
r */
>>> +#define EXTCON_CHG_USB_FAST    9
>>> +#define EXTCON_CHG_USB_SLOW    10
>>> +
>>> +/* Jack external connector */
>>> +#define EXTCON_JACK_MICROPHONE 20
>>> +#define EXTCON_JACK_HEADPHONE  21
>>> +#define EXTCON_JACK_LINE_IN    22
>>> +#define EXTCON_JACK_LINE_OUT   23
>>> +#define EXTCON_JACK_VIDEO_IN   24
>>> +#define EXTCON_JACK_VIDEO_OUT  25
>>> +#define EXTCON_JACK_SPDIF_IN   26      /* Sony Philips Digital Int=
erFace
>> */
>>> +#define EXTCON_JACK_SPDIF_OUT  27
>>> +
>>> +/* Display external connector */
>>> +#define EXTCON_DISP_HDMI       40      /* High-Definition Multimed=
ia
>> Interface */
>>> +#define EXTCON_DISP_MHL                41      /* Mobile High-Defi=
nition Link
>> */
>>> +#define EXTCON_DISP_DVI                42      /* Digital Visual I=
nterface */
>>> +#define EXTCON_DISP_VGA                43      /* Video Graphics A=
rray */
>>> +
>>> +/* Miscellaneous external connector */
>>> +#define EXTCON_DOCK            60
>>> +#define EXTCON_JIG             61
>>> +#define EXTCON_MECHANICAL      62
>>> +
>>> +#define EXTCON_NUM             63
>>> +
>>> +#endif /* _DT_BINDINGS_EXTCON_EXTCON_H */
>>> diff --git a/include/linux/extcon/extcon-gpio.h
>>> b/include/linux/extcon/extcon-gpio.h
>>> index 7cacafb..f7e7673 100644
>>> --- a/include/linux/extcon/extcon-gpio.h
>>> +++ b/include/linux/extcon/extcon-gpio.h
>>> @@ -1,8 +1,8 @@
>>>  /*
>>>   * Single-state GPIO extcon driver based on extcon class
>>>   *
>>> - * Copyright (C) 2012 Samsung Electronics
>>> - * Author: MyungJoo Ham <myungjoo.ham@samsung.com>
>>> + * Copyright (C) 2016 Chanwoo Choi <cw00.choi@samsung.com>,
>> Samsung
>>> + Electronics
>>> + * Copyright (C) 2012 MyungJoo Ham <myungjoo.ham@samsung.com>,
>>> + Samsung Electronics
>>>   *
>>>   * based on switch class driver
>>>   * Copyright (C) 2008 Google, Inc.
>>> @@ -35,10 +35,10 @@
>>>   *                     while resuming from sleep.
>>>   */
>>>  struct gpio_extcon_pdata {
>>> -       unsigned int extcon_id;
>>> +       u32 extcon_id;
>>>         unsigned gpio;
>>>         bool gpio_active_low;
>>> -       unsigned long debounce;
>>> +       u32 debounce;
>>>         unsigned long irq_flags;
>>>
>>>         bool check_on_resume;
>>> --
>>> 2.1.4
>>>
