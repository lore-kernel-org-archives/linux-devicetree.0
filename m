From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2] extcon: gpio: Add the support for Device tree bindings
Date: Tue, 13 Oct 2015 12:03:06 +0900
Message-ID: <561C746A.1040004@samsung.com>
References: <1444028299-11755-1-git-send-email-cw00.choi@samsung.com>
 <20151005111359.GF19064@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20151005111359.GF19064@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

On 2015=EB=85=84 10=EC=9B=94 05=EC=9D=BC 20:13, Mark Rutland wrote:
> On Mon, Oct 05, 2015 at 03:58:19PM +0900, Chanwoo Choi wrote:
>> This patch adds the support for Device tree bindings of extcon-gpio =
driver.
>> The extcon-gpio device tree node must include the both 'extcon-id' a=
nd
>> 'extcon-gpio' property.
>>
>> For exmaple:
>> 	usb_cable: extcon-gpio-0 {
>> 		compatible =3D "extcon-gpio";
>> 		extcon-id =3D <EXTCON_USB>;
>> 		extcon-gpio =3D <&gpio6 1 GPIO_ACTIVE_HIGH>;
>> 	}
>>
>> 	ta_cable: extcon-gpio-1 {
>> 		compatible =3D "extcon-gpio";
>> 		extcon-id =3D <EXTCON_CHG_USB_DCP>;
>> 		extcon-gpio =3D <&gpio3 2 GPIO_ACTIVE_LOW>;
>> 		debounce-ms =3D <50>;	/* 50 millisecond */
>> 		wakeup-source;
>> 	}
>>
>> 	&dwc3_usb {
>> 		extcon =3D <&usb_cable>;
>> 	};
>>
>> 	&charger {
>> 		extcon =3D <&ta_cable>;
>> 	};
>>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> ---
>> Changes from v1:
>> - Create the include/dt-bindings/extcon/extcon.h including the ident=
ification
>>   of external connector. These definitions are used in dts file.
>> - Fix error if CONFIG_OF is disabled.
>>
>>  .../devicetree/bindings/extcon/extcon-gpio.txt     |  38 +++++++
>>  drivers/extcon/extcon-gpio.c                       | 110 ++++++++++=
++++++-----
>>  include/dt-bindings/extcon/extcon.h                |  44 +++++++++
>>  include/linux/extcon/extcon-gpio.h                 |   6 +-
>>  4 files changed, 173 insertions(+), 25 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/extcon/extcon-=
gpio.txt
>>  create mode 100644 include/dt-bindings/extcon/extcon.h
>>
>> diff --git a/Documentation/devicetree/bindings/extcon/extcon-gpio.tx=
t b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
>> new file mode 100644
>> index 000000000000..70c36f729963
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
>> @@ -0,0 +1,38 @@
>> +GPIO Extcon device
>> +
>> +This is a virtual device used to generate specific external connect=
or
>> +from the GPIO pin connected to a GPIO pin.
>> +
>> +Required properties:
>> +- compatible: Must be "extcon-gpio".
>> +- extcon-id: unique id for specific external connector.
>> +	     See include/dt-bindings/extcon/extcon.h.
>=20
> This property is either misnamed and badly described, or it is
> pointless (the node is sufficient to form a unique ID which can be
> referenced by phandle).
>=20
> What is this used for exactly?

OK, I'll modify the description of 'extcon-id' property as following:

- extcon-id: The extcon support the various type of external connector =
to check
  whether connector is attached or detached. The each external connecto=
r has
  the unique number to identify it. So this property includes the uniqu=
e number
  which indicates the specific external connector. When external connec=
tor is
  attached or detached, GPIO pin detect the changed state. See include/
  dt-bindings/extcon/extcon.h which defines the unique number for suppo=
rted
  external connector from extcon framework.

>=20
>> +- extcon-gpio: GPIO pin to detect the external connector. See gpio =
binding.
>> +
>> +Optional properties:
>> +- debounce-ms: the debounce dealy for GPIO pin in millisecond.
>> +- wakeup-source: Boolean, extcon can wake-up the system.
>> +
>> +Example: Examples of extcon-gpio node as listed below:
>> +
>> +	usb_cable: extcon-gpio-0 {
>> +		compatible =3D "extcon-gpio";
>> +		extcon-id =3D <EXTCON_USB>;
>> +		extcon-gpio =3D <&gpio6 1 GPIO_ACTIVE_HIGH>;
>> +	}
>> +
>> +	ta_cable: extcon-gpio-1 {
>> +		compatible =3D "extcon-gpio";
>> +		extcon-id =3D <EXTCON_CHG_USB_DCP>;
>> +		extcon-gpio =3D <&gpio3 2 GPIO_ACTIVE_LOW>;
>> +		debounce-ms =3D <50>;	/* 50 millisecond */
>> +		wakeup-source;
>> +	}
>> +
>> +	&dwc3_usb {
>> +		extcon =3D <&usb_cable>;
>> +	};
>> +
>> +	&charger {
>> +		extcon =3D <&ta_cable>;
>> +	};
>> diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gp=
io.c
>> index 279ff8f6637d..7f3e24aae0c4 100644
>> --- a/drivers/extcon/extcon-gpio.c
>> +++ b/drivers/extcon/extcon-gpio.c
>> @@ -1,8 +1,8 @@
>>  /*
>>   * extcon_gpio.c - Single-state GPIO extcon driver based on extcon =
class
>>   *
>> - * Copyright (C) 2008 Google, Inc.
>> - * Author: Mike Lockwood <lockwood@android.com>
>> + * Copyright (C) 2015 Chanwoo Choi <cw00.choi@samsung.com>, Samsung=
 Electronics
>> + * Copyright (C) 2008 Mike Lockwood <lockwood@android.com>, Google,=
 Inc.
>>   *
>>   * Modified by MyungJoo Ham <myungjoo.ham@samsung.com> to support e=
xtcon
>>   * (originally switch class is supported)
>> @@ -26,12 +26,14 @@
>>  #include <linux/kernel.h>
>>  #include <linux/module.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/property.h>
>>  #include <linux/slab.h>
>>  #include <linux/workqueue.h>
>> =20
>>  struct gpio_extcon_data {
>>  	struct extcon_dev *edev;
>>  	int irq;
>> +	bool irq_wakeup;
>>  	struct delayed_work work;
>>  	unsigned long debounce_jiffies;
>> =20
>> @@ -61,19 +63,50 @@ static irqreturn_t gpio_irq_handler(int irq, voi=
d *dev_id)
>>  	return IRQ_HANDLED;
>>  }
>> =20
>> -static int gpio_extcon_init(struct device *dev, struct gpio_extcon_=
data *data)
>> +static int gpio_extcon_parse_of(struct device *dev,
>> +				struct gpio_extcon_data *data)
>>  {
>> -	struct gpio_extcon_pdata *pdata =3D data->pdata;
>> +	struct gpio_extcon_pdata *pdata;
>>  	int ret;
>> =20
>> -	ret =3D devm_gpio_request_one(dev, pdata->gpio, GPIOF_DIR_IN,
>> -				dev_name(dev));
>> +	pdata =3D devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>> +	if (!pdata)
>> +		return -ENOMEM;
>> +
>> +	ret =3D device_property_read_u32(dev, "extcon-id", &pdata->extcon_=
id);
>> +	if (ret < 0)
>> +		return -EINVAL;
>=20
> No sanity checking of the value?

When checking the validation of value,
I should check both the unique number and name.
But, the name of external connector is only accessed
in the extcon core driver(drivers/extcon/extcon.c)

So, I'll implement the sanity checking on extcon core
when calling the extcon_dev_allocate(*supported_cable).

>=20
> Why device_property rather than of_property?

There is no special reason. When using the device_property_*(),
It is well-working without any problem.

>> +
>> +	data->id_gpiod =3D devm_gpiod_get(dev, "extcon", GPIOD_IN);
>>  	if (ret < 0)
>>  		return ret;
>> =20
>> -	data->id_gpiod =3D gpio_to_desc(pdata->gpio);
>> -	if (!data->id_gpiod)
>> -		return -EINVAL;
>> +	data->irq_wakeup =3D device_property_read_bool(dev, "wakeup-source=
");
>> +
>> +	device_property_read_u32(dev, "debounce-ms", &pdata->debounce);
>=20
> Likewise, surely there's an upper bound above?

The unit of debounce-ms is millisecond. It is not determined limit valu=
e for just time.

Thanks,
Chanwoo Choi
