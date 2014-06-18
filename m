From: Varka Bhadram <varkabhadram@gmail.com>
Subject: Re: [PATCH v5] hwmon: Driver for TI TMP103 temperature sensor
Date: Wed, 18 Jun 2014 11:48:31 +0530
Message-ID: <53A12F37.8020206@gmail.com>
References: <1403069837-15651-1-git-send-email-hs@denx.de> <53A127BB.7090802@gmail.com> <53A12DBB.50704@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53A12DBB.50704@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Heiko Schocher <hs@denx.de>, lm-sensors@lm-sensors.org
Cc: Jean Delvare <khali@linux-fr.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On 06/18/2014 11:42 AM, Guenter Roeck wrote:
> On 06/17/2014 10:46 PM, Varka Bhadram wrote:
>> Hi,
>>
>> On 06/18/2014 11:07 AM, Heiko Schocher wrote:
>>> Driver for the TI TMP103.
>>>
>>> The TI TMP103 is similar to the TMP102.  It differs from the TMP102
>>> by having only 8 bit registers.
>>>
>>> Signed-off-by: Heiko Schocher <hs@denx.de>
>>>
>>> ---
>>>
>>> Cc: Jean Delvare <khali@linux-fr.org>
>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>> Cc: linux-kernel@vger.kernel.org
>>> Cc: devicetree@vger.kernel.org
>>> Cc: linux-doc@vger.kernel.org
>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>>
>>> - change for v2:
>>>    - add comments from GuenterRoeck:
>>>      - remove Cc from commit subject
>>>      - add devicetree maintainer
>>>      - move Documentation to Documentation/hwmon/tmp103
>>>      - remove devicetree bindings from Documentation
>>>      - add compatible string to
>>> "Documentation/devicetree/bindings/i2c/trivial-devices.txt"
>>>      - remove CamelCase
>>>      - fix Codingstyle issues
>>>      - use ATTRIBUTE_GROUPS and=20
>>> devm_hwmon_device_register_with_groups()
>>>      - remove unsused define TMP103_CONFIG_RD_ONLY
>>>      - restore config register when exit()
>>>      - use regmap
>>> - changes for v3:
>>>    again a lot of fantastic tips how to use regmap efficiently
>>>    from Guenter Roeck:
>>>    - get rid of "struct tmp103"
>>>    - get rid of "static const u8 tmp103_reg[]"
>>>    - get rid of mutex lock
>>>    - drop config_orig entirely
>>>    - use regmap_update_bits()
>>> - changes for v4:
>>>    - add comment from Guenter Roeck:
>>>      define TMP103_CONFIG_MASK and TMP103_CONF_SD_MASK
>>>      separately to ensure you catch all the to-be-cleared bits.
>>> - changes for v5:
>>>    add comment from Guenter Roeck:
>>>    - use "#define TMP103_CONF_SD TMP103_CONF_M1"
>>>    add comment from Mark Rutland:
>>>    - use full string for DT compatible string matching, instead of
>>>      DRIVER_NAME. Get rid complete of DRIVER_NAME define.
>>>
>>>   .../devicetree/bindings/i2c/trivial-devices.txt    |   1 +
>>>   Documentation/hwmon/tmp103                         |  28 +++
>>>   drivers/hwmon/Kconfig                              |  10 +
>>>   drivers/hwmon/Makefile                             |   1 +
>>>   drivers/hwmon/tmp103.c                             | 205=20
>>> +++++++++++++++++++++
>>>   5 files changed, 245 insertions(+)
>>>   create mode 100644 Documentation/hwmon/tmp103
>>>   create mode 100644 drivers/hwmon/tmp103.c
>>>
>>> diff --git=20
>>> a/Documentation/devicetree/bindings/i2c/trivial-devices.txt=20
>>> b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
>>> index bef86e5..fc944e0 100644
>>> --- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
>>> +++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
>>> @@ -83,5 +83,6 @@ stm,m41t80        M41T80 - SERIAL ACCESS RTC WITH=
=20
>>> ALARMS
>>>   taos,tsl2550        Ambient Light Sensor with SMBUS/Two Wire=20
>>> Serial Interface
>>>   ti,tsc2003        I2C Touch-Screen Controller
>>>   ti,tmp102        Low Power Digital Temperature Sensor with=20
>>> SMBUS/Two Wire Serial Interface
>>> +ti,tmp103        Low Power Digital Temperature Sensor with=20
>>> SMBUS/Two Wire Serial Interface
May i know about this binding compatible property ?
>>>   ti,tmp275        Digital Temperature Sensor
>>>   winbond,wpct301        i2c trusted platform module (TPM)
>>> diff --git a/Documentation/hwmon/tmp103 b/Documentation/hwmon/tmp10=
3
>>> new file mode 100644
>>> index 0000000..ec00a15
>>> --- /dev/null
>>> +++ b/Documentation/hwmon/tmp103
>>> @@ -0,0 +1,28 @@
>>> +Kernel driver tmp103
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +Supported chips:
>>> +  * Texas Instruments TMP103
>>> +    Prefix: 'tmp103'
>>> +    Addresses scanned: none
>>> +    Product info and datasheet: http://www.ti.com/product/tmp103
>>> +
>>> +Author:
>>> +    Heiko Schocher <hs@denx.de>
>>> +
>>> +Description
>>> +-----------
>>> +
>>> +The TMP103 is a digital output temperature sensor in a four-ball
>>> +wafer chip-scale package (WCSP). The TMP103 is capable of reading
>>> +temperatures to a resolution of 1=C2=B0C. The TMP103 is specified =
for
>>> +operation over a temperature range of =E2=80=9340=C2=B0C to +125=C2=
=B0C.
>>> +
>>> +Resolution: 8 Bits
>>> +Accuracy: =C2=B11=C2=B0C Typ (=E2=80=9310=C2=B0C to +100=C2=B0C)
>>> +
>>> +The driver provides the common sysfs-interface for temperatures (s=
ee
>>> +Documentation/hwmon/sysfs-interface under Temperatures).
>>> +
>>> +Please refer how to instantiate this driver:
>>> +Documentation/i2c/instantiating-devices
>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>>> index 08531a1..c882d4b 100644
>>> --- a/drivers/hwmon/Kconfig
>>> +++ b/drivers/hwmon/Kconfig
>>> @@ -1391,6 +1391,16 @@ config SENSORS_TMP102
>>>         This driver can also be built as a module.  If so, the modu=
le
>>>         will be called tmp102.
>>> +config SENSORS_TMP103
>>> +    tristate "Texas Instruments TMP103"
>>> +    depends on I2C
>>> +    help
>>> +      If you say yes here you get support for Texas Instruments TM=
P103
>>> +      sensor chips.
>>> +
>>> +      This driver can also be built as a module.  If so, the modul=
e
>>> +      will be called tmp103.
>>> +
>>>   config SENSORS_TMP401
>>>       tristate "Texas Instruments TMP401 and compatibles"
>>>       depends on I2C
>>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>>> index 3dc0f02..cc0df1ef 100644
>>> --- a/drivers/hwmon/Makefile
>>> +++ b/drivers/hwmon/Makefile
>>> @@ -135,6 +135,7 @@ obj-$(CONFIG_SENSORS_SMSC47M192)+=3D smsc47m192=
=2Eo
>>>   obj-$(CONFIG_SENSORS_AMC6821)    +=3D amc6821.o
>>>   obj-$(CONFIG_SENSORS_THMC50)    +=3D thmc50.o
>>>   obj-$(CONFIG_SENSORS_TMP102)    +=3D tmp102.o
>>> +obj-$(CONFIG_SENSORS_TMP103)    +=3D tmp103.o
>>>   obj-$(CONFIG_SENSORS_TMP401)    +=3D tmp401.o
>>>   obj-$(CONFIG_SENSORS_TMP421)    +=3D tmp421.o
>>>   obj-$(CONFIG_SENSORS_TWL4030_MADC)+=3D twl4030-madc-hwmon.o
>>> diff --git a/drivers/hwmon/tmp103.c b/drivers/hwmon/tmp103.c
>>> new file mode 100644
>>> index 0000000..e69dbca
>>> --- /dev/null
>>> +++ b/drivers/hwmon/tmp103.c
>>> @@ -0,0 +1,205 @@
>>> +/*
>>> + * Texas Instruments TMP103 SMBus temperature sensor driver
>>> + * Copyright (C) 2014 Heiko Schocher <hs@denx.de>
>>> + *
>>> + * Based on:
>>> + * Texas Instruments TMP102 SMBus temperature sensor driver
>>> + *
>>> + * Copyright (C) 2010 Steven King <sfking@fdwdc.com>
>>> + *
>>> + * This program is free software; you can redistribute it and/or=20
>>> modify
>>> + * it under the terms of the GNU General Public License as=20
>>> published by
>>> + * the Free Software Foundation; either version 2 of the License, =
or
>>> + * (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + *
>>> + */
>>> +
>>> +#include <linux/module.h>
>>> +#include <linux/init.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/hwmon.h>
>>> +#include <linux/hwmon-sysfs.h>
>>> +#include <linux/err.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/device.h>
>>> +#include <linux/jiffies.h>
>>> +#include <linux/regmap.h>
>>> +
>>> +#define TMP103_TEMP_REG        0x00
>>> +#define TMP103_CONF_REG        0x01
>>> +#define TMP103_TLOW_REG        0x02
>>> +#define TMP103_THIGH_REG    0x03
>>> +
>>> +#define TMP103_CONF_M0        0x01
>>> +#define TMP103_CONF_M1        0x02
>>> +#define TMP103_CONF_LC        0x04
>>> +#define TMP103_CONF_FL        0x08
>>> +#define TMP103_CONF_FH        0x10
>>> +#define TMP103_CONF_CR0        0x20
>>> +#define TMP103_CONF_CR1        0x40
>>> +#define TMP103_CONF_ID        0x80
>>> +#define TMP103_CONF_SD        (TMP103_CONF_M1)
>>> +#define TMP103_CONF_SD_MASK    (TMP103_CONF_M0 | TMP103_CONF_M1)
>>> +
>>> +#define TMP103_CONFIG        (TMP103_CONF_CR1 | TMP103_CONF_M1)
>>> +#define TMP103_CONFIG_MASK    (TMP103_CONF_CR0 | TMP103_CONF_CR1 |=
 \
>>> +                 TMP103_CONF_M0 | TMP103_CONF_M1)
>>> +
>>> +static inline int tmp103_reg_to_mc(s8 val)
>>> +{
>>> +    return val * 1000;
>>> +}
>>> +
>>> +static inline u8 tmp103_mc_to_reg(int val)
>>> +{
>>> +    return DIV_ROUND_CLOSEST(val, 1000);
>>> +}
>>> +
>>> +static ssize_t tmp103_show_temp(struct device *dev,
>>> +                struct device_attribute *attr,
>>> +                char *buf)
>>> +{
>>> +    struct sensor_device_attribute *sda =3D to_sensor_dev_attr(att=
r);
>>> +    struct regmap *regmap =3D dev_get_drvdata(dev);
>>> +    unsigned int regval;
>>> +    int ret;
>>> +
>>> +    ret =3D regmap_read(regmap, sda->index, &regval);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    return sprintf(buf, "%d\n", tmp103_reg_to_mc(regval));
>>> +}
>>> +
>>> +static ssize_t tmp103_set_temp(struct device *dev,
>>> +                   struct device_attribute *attr,
>>> +                   const char *buf, size_t count)
>>> +{
>>> +    struct sensor_device_attribute *sda =3D to_sensor_dev_attr(att=
r);
>>> +    struct regmap *regmap =3D dev_get_drvdata(dev);
>>> +    long val;
>>> +    int ret;
>>> +
>>> +    if (kstrtol(buf, 10, &val) < 0)
>>> +        return -EINVAL;
>>> +
>>> +    val =3D clamp_val(val, -55000, 127000);
>>> +    ret =3D regmap_write(regmap, sda->index, tmp103_mc_to_reg(val)=
);
>>> +    return ret ? ret : count;
>>> +}
>>> +
>>> +static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, tmp103_show_temp,=20
>>> NULL ,
>>> +              TMP103_TEMP_REG);
>>> +
>>> +static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO,=20
>>> tmp103_show_temp,
>>> +              tmp103_set_temp, TMP103_TLOW_REG);
>>> +
>>> +static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO,=20
>>> tmp103_show_temp,
>>> +              tmp103_set_temp, TMP103_THIGH_REG);
>>> +
>>> +static struct attribute *tmp103_attrs[] =3D {
>>> +    &sensor_dev_attr_temp1_input.dev_attr.attr,
>>> +    &sensor_dev_attr_temp1_min.dev_attr.attr,
>>> +    &sensor_dev_attr_temp1_max.dev_attr.attr,
>>> +    NULL
>>> +};
>>> +ATTRIBUTE_GROUPS(tmp103);
>>> +
>>> +static bool tmp103_regmap_is_volatile(struct device *dev, unsigned=
=20
>>> int reg)
>>> +{
>>> +    return reg =3D=3D TMP103_TEMP_REG;
>>> +}
>>> +
>>> +static struct regmap_config tmp103_regmap_config =3D {
>>> +    .reg_bits =3D 8,
>>> +    .val_bits =3D 8,
>>> +    .max_register =3D TMP103_THIGH_REG,
>>> +    .volatile_reg =3D tmp103_regmap_is_volatile,
>>> +};
>>> +
>>> +static int tmp103_probe(struct i2c_client *client,
>>> +            const struct i2c_device_id *id)
>>> +{
>>> +    struct device *dev =3D &client->dev;
>>> +    struct device *hwmon_dev;
>>> +    struct regmap *regmap;
>>> +    int ret;
>>> +
>>> +    if (!i2c_check_functionality(client->adapter,
>>> +                     I2C_FUNC_SMBUS_BYTE_DATA)) {
>>> +        dev_err(&client->dev,
>>> +            "adapter doesn't support SMBus byte transactions\n");
>>> +        return -ENODEV;
>>> +    }
>>> +
>>> +    regmap =3D devm_regmap_init_i2c(client, &tmp103_regmap_config)=
;
>>> +    if (IS_ERR(regmap)) {
>>> +        dev_err(dev, "failed to allocate register map\n");
>>> +        return PTR_ERR(regmap);
>>> +    }
>>> +
>>> +    ret =3D regmap_update_bits(regmap, TMP103_CONF_REG,=20
>>> TMP103_CONFIG_MASK,
>>> +                 TMP103_CONFIG);
>>> +    if (ret < 0) {
>>> +        dev_err(&client->dev, "error writing config register\n");
>>> +        return ret;
>>> +    }
>>> +
>>> +    hwmon_dev =3D hwmon_device_register_with_groups(dev, client->n=
ame,
>>> +                              regmap, tmp103_groups);
>>> +    return PTR_ERR_OR_ZERO(hwmon_dev);
>>> +}
>>> +
>>> +#ifdef CONFIG_PM
>>> +static int tmp103_suspend(struct device *dev)
>>> +{
>>> +    struct regmap *regmap =3D dev_get_drvdata(dev);
>>> +
>>> +    return regmap_update_bits(regmap, TMP103_CONF_REG,
>>> +                  TMP103_CONF_SD_MASK, 0);
>>> +}
>>> +
>>> +static int tmp103_resume(struct device *dev)
>>> +{
>>> +    struct regmap *regmap =3D dev_get_drvdata(dev);
>>> +
>>> +    return regmap_update_bits(regmap, TMP103_CONF_REG,
>>> +                  TMP103_CONF_SD_MASK, TMP103_CONF_SD);
>>> +}
>>> +
>>> +static const struct dev_pm_ops tmp103_dev_pm_ops =3D {
>>> +    .suspend    =3D tmp103_suspend,
>>> +    .resume        =3D tmp103_resume,
>>> +};
>>> +
>>> +#define TMP103_DEV_PM_OPS (&tmp103_dev_pm_ops)
>>> +#else
>>> +#define    TMP103_DEV_PM_OPS NULL
>>> +#endif /* CONFIG_PM */
>>> +
>>> +static const struct i2c_device_id tmp103_id[] =3D {
>>> +    { "tmp103", 0 },
>>> +    { }
>>> +};
>>
>> In the bindings you are giving the compatible property as :=20
>> ti,tmp103, but here only tmp103.
>>
>> Instead of using the i2c_device_id struct , use of_device_id struct=20
>> for giving the
>> compatible property value.
>> compatble =3D "<manufacturer>,<model>"
>>
>
> No. We don't do that for other i2c drivers, and the i2c subsystem han=
dles
> this case, so it does not sense to start that with this driver just
> for the sake of making the code more complicated than it has to be.
>
> Thanks,
> Guenter
>
