From: Ian Lartey <ian@slimlogic.co.uk>
Subject: Re: [PATCH 1/2] leds: Add support for Palmas LEDs
Date: Thu, 28 Feb 2013 11:20:18 +0000
Message-ID: <512F3D72.3010300@slimlogic.co.uk>
References: <24550733.220381362013975218.JavaMail.weblogic@epml02>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <24550733.220381362013975218.JavaMail.weblogic@epml02>
Sender: linux-kernel-owner@vger.kernel.org
To: jg1.han@samsung.com
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "ldewangan@nvidia.com" <ldewangan@nvidia.com>, "j-keerthy@ti.com" <j-keerthy@ti.com>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>, "cooloney@gmail.com" <cooloney@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>
List-Id: devicetree@vger.kernel.org

On 28/02/13 01:12, Jingoo Han wrote:
> On Wednesday, February 27, 2013 10:13 PM, Ian Lartey wrote:
>>
>> The Palmas familly of chips has LED support. This is not always muxe=
d
>> to output pins so depending on the setting of the mux this driver
>> will create the appropriate LED class devices.
>=20
> Hi Ian Lartey,
>=20
> I added some minor comments :)

Hello Jingoo Han,

Thanks for your comments.

> Good luck.
>=20
>>
>> Signed-off-by: Graeme Gregory <gg@slimlogic.co.uk>
>> Signed-off-by: Ian Lartey <ian@slimlogic.co.uk>
>> ---
>>   drivers/leds/leds-palmas.c |  574 ++++++++++++++++++++++++++++++++=
++++++++++++
>>   include/linux/mfd/palmas.h |   60 +++++
>>   2 files changed, 634 insertions(+), 0 deletions(-)
>>   create mode 100644 drivers/leds/leds-palmas.c
>>
>> diff --git a/drivers/leds/leds-palmas.c b/drivers/leds/leds-palmas.c
>> new file mode 100644
>> index 0000000..4cb73aa
>> --- /dev/null
>> +++ b/drivers/leds/leds-palmas.c
>> @@ -0,0 +1,574 @@
>> +/*
>> + * Driver for LED part of Palmas PMIC Chips
>> + *
>> + * Copyright 2011 Texas Instruments Inc.
>=20
> 2013 ?

Code _was_ started a while ago - I'll update.

>=20
>> + *
>> + * Author: Graeme Gregory <gg@slimlogic.co.uk>
>> + * Author: Ian Lartey <ian@slimlogic.co.uk>
>> + *
>> + *  This program is free software; you can redistribute it and/or m=
odify it
>> + *  under  the terms of the GNU General  Public License as publishe=
d by the
>> + *  Free Software Foundation;  either version 2 of the License, or =
(at your
>> + *  option) any later version.
>> + *
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/init.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/slab.h>
>> +#include <linux/leds.h>
>> +#include <linux/err.h>
>> +#include <linux/mfd/palmas.h>
>> +#include <linux/module.h>
>> +#include <linux/of_platform.h>
>=20
> Would you order header files according to alphabetical ordering?
> It would be better for the readability.

It could cause dependency issues so I'd rather leave them
in the order they are in.

I'll implement all the other changes you've noted.

Thanks

Ian
>=20
>> +
>> +struct palmas_leds_data;
>> +
>> +struct palmas_led {
>> +	struct led_classdev cdev;
>> +	struct palmas_leds_data *leds_data;
>> +	int led_no;
>> +	struct work_struct work;
>> +	struct mutex mutex;
>> +
>> +	spinlock_t value_lock;
>> +
>> +	int blink;
>> +	int on_time;
>> +	int period;
>> +	enum led_brightness brightness;
>> +};
>> +
>> +struct palmas_leds_data {
>> +	struct device *dev;
>> +	struct led_classdev cdev;
>> +	struct palmas *palmas;
>> +
>> +	struct palmas_led *palmas_led;
>> +	int no_leds;
>> +};
>> +
>> +#define to_palmas_led(led_cdev) \
>> +	container_of(led_cdev, struct palmas_led, cdev)
>> +
>> +#define LED_ON_62_5MS		0x00
>> +#define LED_ON_125MS		0x01
>> +#define LED_ON_250MS		0x02
>> +#define LED_ON_500MS		0x03
>> +
>> +#define LED_PERIOD_OFF		0x00
>> +#define LED_PERIOD_125MS	0x01
>> +#define LED_PERIOD_250MS	0x02
>> +#define LED_PERIOD_500MS	0x03
>> +#define LED_PERIOD_1000MS	0x04
>> +#define LED_PERIOD_2000MS	0x05
>> +#define LED_PERIOD_4000MS	0x06
>> +#define LED_PERIOD_8000MS	0x07
>> +
>> +
>> +static char *palmas_led_names[] =3D {
>> +	"palmas:led1",
>> +	"palmas:led2",
>> +	"palmas:led3",
>> +	"palmas:led4",
>> +};
>> +
>> +static int palmas_led_read(struct palmas_leds_data *leds, unsigned =
int reg,
>> +		unsigned int *dest)
>> +{
>> +	unsigned int addr;
>> +
>> +	addr =3D PALMAS_BASE_TO_REG(PALMAS_LED_BASE, reg);
>> +
>> +	return palmas_read(leds->palmas, PALMAS_LED_BASE, addr, dest);
>> +}
>> +
>> +static int palmas_led_write(struct palmas_leds_data *leds, unsigned=
 int reg,
>> +		unsigned int value)
>> +{
>> +	unsigned int addr;
>> +
>> +	addr =3D PALMAS_BASE_TO_REG(PALMAS_LED_BASE, reg);
>> +
>> +	return palmas_write(leds->palmas, PALMAS_LED_BASE, addr, value);
>> +}
>> +
>> +static int palmas_led_update_bits(struct palmas_leds_data *leds,
>> +		unsigned int reg, unsigned int mask, unsigned int value)
>> +{
>> +	unsigned int addr;
>> +
>> +	addr =3D PALMAS_BASE_TO_REG(PALMAS_LED_BASE, reg);
>> +
>> +	return palmas_update_bits(leds->palmas, PALMAS_LED_BASE,
>> +			addr, mask, value);
>> +}
>> +
>> +static void palmas_leds_work(struct work_struct *work)
>> +{
>> +	struct palmas_led *led =3D container_of(work, struct palmas_led, w=
ork);
>> +	unsigned int period, ctrl;
>> +	unsigned long flags;
>> +
>> +	mutex_lock(&led->mutex);
>> +
>> +	palmas_led_read(led->leds_data, PALMAS_LED_CTRL, &ctrl);
>> +	palmas_led_read(led->leds_data, PALMAS_LED_PERIOD_CTRL, &period);
>> +
>> +	spin_lock_irqsave(&led->value_lock, flags);
>> +
>> +	switch (led->led_no) {
>> +	case 1:
>> +		ctrl &=3D ~PALMAS_LED_CTRL_LED_1_ON_TIME_MASK;
>> +		period &=3D ~PALMAS_LED_PERIOD_CTRL_LED_1_PERIOD_MASK;
>> +
>> +		if (led->blink) {
>> +			ctrl |=3D led->on_time <<
>> +				PALMAS_LED_CTRL_LED_1_ON_TIME_SHIFT;
>> +			period |=3D led->period <<
>> +				PALMAS_LED_PERIOD_CTRL_LED_1_PERIOD_SHIFT;
>> +		} else {
>> +			/*
>> +			 * for off value is zero which we already set by
>> +			 * masking earlier.
>> +			 */
>> +			if (led->brightness) {
>> +				ctrl |=3D LED_ON_500MS <<
>> +					PALMAS_LED_CTRL_LED_1_ON_TIME_SHIFT;
>> +				period |=3D LED_PERIOD_500MS <<
>> +				PALMAS_LED_PERIOD_CTRL_LED_1_PERIOD_SHIFT;
>> +			}
>> +		}
>> +	case 2:
>> +		ctrl &=3D ~PALMAS_LED_CTRL_LED_2_ON_TIME_MASK;
>> +		period &=3D ~PALMAS_LED_PERIOD_CTRL_LED_2_PERIOD_MASK;
>> +
>> +		if (led->blink) {
>> +			ctrl |=3D led->on_time <<
>> +				PALMAS_LED_CTRL_LED_2_ON_TIME_SHIFT;
>> +			period |=3D led->period <<
>> +				PALMAS_LED_PERIOD_CTRL_LED_2_PERIOD_SHIFT;
>> +		} else {
>> +			/*
>> +			 * for off value is zero which we already set by
>> +			 * masking earlier.
>> +			 */
>> +			if (led->brightness) {
>> +				ctrl |=3D LED_ON_500MS <<
>> +					PALMAS_LED_CTRL_LED_2_ON_TIME_SHIFT;
>> +				period |=3D LED_PERIOD_500MS <<
>> +				PALMAS_LED_PERIOD_CTRL_LED_2_PERIOD_SHIFT;
>> +			}
>> +		}
>> +	case 3:
>> +		ctrl &=3D ~PALMAS_LED_CTRL2_LED_3_ON_TIME_MASK;
>> +		period &=3D ~PALMAS_LED_PERIOD2_CTRL_LED_3_PERIOD_MASK;
>> +
>> +		if (led->blink) {
>> +			ctrl |=3D led->on_time <<
>> +				PALMAS_LED_CTRL2_LED_3_ON_TIME_SHIFT;
>> +			period |=3D led->period <<
>> +				PALMAS_LED_PERIOD2_CTRL_LED_3_PERIOD_SHIFT;
>> +		} else {
>> +			/*
>> +			 * for off value is zero which we already set by
>> +			 * masking earlier.
>> +			 */
>> +			if (led->brightness) {
>> +				ctrl |=3D LED_ON_500MS <<
>> +					PALMAS_LED_CTRL2_LED_3_ON_TIME_SHIFT;
>> +				period |=3D LED_PERIOD_500MS <<
>> +				PALMAS_LED_PERIOD2_CTRL_LED_3_PERIOD_SHIFT;
>> +			}
>> +		}
>> +		break;
>> +	case 4:
>> +		ctrl &=3D ~PALMAS_LED_CTRL2_CHRG_LED_ON_TIME_MASK;
>> +		period &=3D ~PALMAS_LED_PERIOD2_CTRL_CHRG_LED_PERIOD_MASK;
>> +
>> +		if (led->blink) {
>> +			ctrl |=3D led->on_time <<
>> +				PALMAS_LED_CTRL2_CHRG_LED_ON_TIME_SHIFT;
>> +			period |=3D led->period <<
>> +				PALMAS_LED_PERIOD2_CTRL_CHRG_LED_PERIOD_SHIFT;
>> +		} else {
>> +			/*
>> +			 * for off value is zero which we already set by
>> +			 * masking earlier.
>> +			 */
>> +			if (led->brightness) {
>> +				ctrl |=3D LED_ON_500MS <<
>> +					PALMAS_LED_CTRL2_CHRG_LED_ON_TIME_SHIFT;
>> +				period |=3D LED_PERIOD_500MS <<
>> +				PALMAS_LED_PERIOD2_CTRL_CHRG_LED_PERIOD_SHIFT;
>> +			}
>> +		}
>> +		break;
>> +	}
>> +	spin_unlock_irqrestore(&led->value_lock, flags);
>> +
>> +	if (led->led_no < 3) {
>> +		palmas_led_write(led->leds_data, PALMAS_LED_CTRL, ctrl);
>> +		palmas_led_write(led->leds_data, PALMAS_LED_PERIOD_CTRL,
>> +				period);
>> +	} else {
>> +		palmas_led_write(led->leds_data, PALMAS_LED_CTRL2, ctrl);
>> +		palmas_led_write(led->leds_data, PALMAS_LED_PERIOD2_CTRL,
>> +				period);
>> +	}
>> +
>> +	if (is_palmas_charger(led->leds_data->palmas->product_id)) {
>> +		if (led->brightness || led->blink)
>> +			palmas_led_update_bits(led->leds_data, PALMAS_LED_EN,
>> +					1 << (led->led_no - 1), 0xFF);
>> +		else
>> +			palmas_led_update_bits(led->leds_data, PALMAS_LED_EN,
>> +					1 << (led->led_no - 1), 0x00);
>> +	}
>> +	mutex_unlock(&led->mutex);
>> +}
>> +
>> +static void palmas_leds_set(struct led_classdev *led_cdev,
>> +			   enum led_brightness value)
>> +{
>> +	struct palmas_led *led =3D to_palmas_led(led_cdev);
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&led->value_lock, flags);
>> +	led->brightness =3D value;
>> +	led->blink =3D 0;
>> +	schedule_work(&led->work);
>> +	spin_unlock_irqrestore(&led->value_lock, flags);
>> +}
>> +
>> +static int palmas_leds_blink_set(struct led_classdev *led_cdev,
>> +				   unsigned long *delay_on,
>> +				   unsigned long *delay_off)
>> +{
>> +	struct palmas_led *led =3D to_palmas_led(led_cdev);
>> +	unsigned long flags;
>> +	int ret =3D 0;
>> +	int period;
>> +
>> +	/* Pick some defaults if we've not been given times */
>> +	if (*delay_on =3D=3D 0 && *delay_off =3D=3D 0) {
>> +		*delay_on =3D 250;
>> +		*delay_off =3D 250;
>> +	}
>> +
>> +	spin_lock_irqsave(&led->value_lock, flags);
>> +
>> +	/* We only have a limited selection of settings, see if we can
>> +	 * support the configuration we're being given */
>=20
> According to the Coding Style, the preferred style for multi-line com=
ments is:
>=20
>   +	/*
>   +	 * We only have a limited selection of settings, see if we can
>   +	 * support the configuration we're being given
>   +	 */
>=20
>=20
>> +	switch (*delay_on) {
>> +	case 500:
>> +		led->on_time =3D LED_ON_500MS;
>> +		break;
>> +	case 250:
>> +		led->on_time =3D LED_ON_250MS;
>> +		break;
>> +	case 125:
>> +		led->on_time =3D LED_ON_125MS;
>> +		break;
>> +	case 62:
>> +	case 63:
>> +		/* Actually 62.5ms */
>> +		led->on_time =3D LED_ON_62_5MS;
>> +		break;
>> +	default:
>> +		ret =3D -EINVAL;
>> +		break;
>> +	}
>> +
>> +	period =3D *delay_on + *delay_off;
>> +
>> +	if (ret =3D=3D 0) {
>> +		switch (period) {
>> +		case 124:
>> +		case 125:
>> +		case 126:
>> +			/* All possible variations of 62.5 + 62.5 */
>> +			led->period =3D LED_PERIOD_125MS;
>> +			break;
>> +		case 250:
>> +			led->period =3D LED_PERIOD_250MS;
>> +			break;
>> +		case 500:
>> +			led->period =3D LED_PERIOD_500MS;
>> +			break;
>> +		case 1000:
>> +			led->period =3D LED_PERIOD_1000MS;
>> +			break;
>> +		case 2000:
>> +			led->period =3D LED_PERIOD_2000MS;
>> +			break;
>> +		case 4000:
>> +			led->period =3D LED_PERIOD_4000MS;
>> +			break;
>> +		case 8000:
>> +			led->period =3D LED_PERIOD_8000MS;
>> +			break;
>> +		default:
>> +			ret =3D -EINVAL;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (ret =3D=3D 0)
>> +		led->blink =3D 1;
>> +	else
>> +		led->blink =3D 0;
>> +
>> +	/* Always update; if we fail turn off blinking since we expect
>> +	 * a software fallback. */
>=20
> Same as above.
>=20
>> +	schedule_work(&led->work);
>> +
>> +	spin_unlock_irqrestore(&led->value_lock, flags);
>> +
>> +	return ret;
>> +}
>> +
>> +static void palmas_init_led(struct palmas_leds_data *leds_data, int=
 offset,
>> +		int led_no)
>> +{
>> +	mutex_init(&leds_data->palmas_led[offset].mutex);
>> +	INIT_WORK(&leds_data->palmas_led[offset].work, palmas_leds_work);
>> +	spin_lock_init(&leds_data->palmas_led[offset].value_lock);
>> +
>> +	leds_data->palmas_led[offset].leds_data =3D leds_data;
>> +	leds_data->palmas_led[offset].led_no =3D led_no;
>> +	leds_data->palmas_led[offset].cdev.name =3D palmas_led_names[led_n=
o - 1];
>> +	leds_data->palmas_led[offset].cdev.default_trigger =3D NULL;
>> +	leds_data->palmas_led[offset].cdev.brightness_set =3D palmas_leds_=
set;
>> +	leds_data->palmas_led[offset].cdev.blink_set =3D palmas_leds_blink=
_set;
>> +}
>> +
>> +static int  palmas_dt_to_pdata(struct device *dev,
>> +		struct device_node *node,
>> +		struct palmas_leds_platform_data *pdata)
>> +{
>> +	struct device_node *child_node;
>> +	int ret;
>> +	u32 prop;
>> +
>> +	child_node =3D of_get_child_by_name(node, "palmas_leds");
>> +	if (!child_node) {
>> +		dev_err(dev, "child node 'palmas_leds' not found\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret =3D of_property_read_u32(child_node, "ti,led1_current", &prop)=
;
>> +	if (!ret)
>> +		pdata->led1_current =3D prop;
>> +
>> +	ret =3D of_property_read_u32(child_node, "ti,led2_current", &prop)=
;
>> +	if (!ret)
>> +		pdata->led2_current =3D prop;
>> +
>> +	ret =3D of_property_read_u32(child_node, "ti,led3_current", &prop)=
;
>> +	if (!ret)
>> +		pdata->led3_current =3D prop;
>> +
>> +	ret =3D of_property_read_u32(child_node, "ti,led4_current", &prop)=
;
>> +	if (!ret)
>> +		pdata->led4_current =3D prop;
>> +
>> +	ret =3D of_property_read_u32(child_node, "ti,chrg_led_mode", &prop=
);
>> +	if (!ret)
>> +		pdata->chrg_led_mode =3D prop;
>> +
>> +	ret =3D of_property_read_u32(child_node, "ti,chrg_led_vbat_low", &=
prop);
>> +	if (!ret)
>> +		pdata->chrg_led_vbat_low =3D prop;
>> +
>> +	return 0;
>> +}
>> +
>> +static int palmas_leds_probe(struct platform_device *pdev)
>> +{
>> +	struct palmas *palmas =3D dev_get_drvdata(pdev->dev.parent);
>> +	struct palmas_leds_platform_data *pdata =3D pdev->dev.platform_dat=
a;
>> +	struct palmas_leds_data *leds_data;
>> +	struct device_node *node =3D pdev->dev.of_node;
>> +	int ret, i;
>> +	int offset =3D 0;
>> +
>> +	if (!palmas->led_muxed && !is_palmas_charger(palmas->product_id)) =
{
>> +		dev_err(&pdev->dev, "there are no LEDs muxed\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* Palmas charger requires platform data */
>> +	if (is_palmas_charger(palmas->product_id) && node && !pdata) {
>> +		pdata =3D devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
>> +
>> +		if (!pdata)
>> +			return -ENOMEM;
>> +
>> +		ret =3D palmas_dt_to_pdata(&pdev->dev, node, pdata);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	if (is_palmas_charger(palmas->product_id) && !pdata)
>> +		return -EINVAL;
>> +
>> +	leds_data =3D kzalloc(sizeof(*leds_data), GFP_KERNEL);
>=20
> How about using devm_kzalloc()?
> Memory allocated with this function is automatically freed
> on driver detach. So it makes error path more simple.
>=20
>=20
>> +	if (!leds_data)
>> +		return -ENOMEM;
>> +	platform_set_drvdata(pdev, leds_data);
>> +
>> +	leds_data->palmas =3D palmas;
>> +
>> +	switch (palmas->led_muxed) {
>> +	case PALMAS_LED1_MUXED | PALMAS_LED2_MUXED:
>> +		leds_data->no_leds =3D 2;
>> +		break;
>> +	case PALMAS_LED1_MUXED:
>> +	case PALMAS_LED2_MUXED:
>> +		leds_data->no_leds =3D 1;
>> +		break;
>> +	default:
>> +		leds_data->no_leds =3D 0;
>> +		break;
>> +	}
>> +
>> +	if (is_palmas_charger(palmas->product_id)) {
>> +		if (pdata->chrg_led_mode)
>> +			leds_data->no_leds +=3D 2;
>> +		else
>> +			leds_data->no_leds++;
>> +	}
>> +
>> +	leds_data->palmas_led =3D kcalloc(leds_data->no_leds,
>> +			sizeof(struct palmas_led), GFP_KERNEL);
>=20
> How about using devm_kzalloc()?
>=20
>=20
>> +
>> +	/* Initialise LED1 */
>> +	if (palmas->led_muxed & PALMAS_LED1_MUXED) {
>> +		palmas_init_led(leds_data, offset, 1);
>> +		offset++;
>> +	}
>> +
>> +	/* Initialise LED2 */
>> +	if (palmas->led_muxed & PALMAS_LED2_MUXED) {
>> +		palmas_init_led(leds_data, offset, 2);
>> +		offset++;
>> +	}
>> +
>> +	if (is_palmas_charger(palmas->product_id)) {
>> +		palmas_init_led(leds_data, offset, 3);
>> +		offset++;
>> +
>> +		if (pdata->chrg_led_mode) {
>> +			palmas_led_update_bits(leds_data, PALMAS_CHRG_LED_CTRL,
>> +					PALMAS_CHRG_LED_CTRL_CHRG_LED_MODE,
>> +					PALMAS_CHRG_LED_CTRL_CHRG_LED_MODE);
>> +
>> +			palmas_init_led(leds_data, offset, 4);
>> +		}
>> +	}
>> +
>> +	for (i =3D 0; i < leds_data->no_leds; i++) {
>> +		ret =3D led_classdev_register(leds_data->dev,
>> +				&leds_data->palmas_led[i].cdev);
>> +		if (ret < 0) {
>> +			dev_err(&pdev->dev,
>> +				"Failed to register LED no: %d err: %d\n",
>> +				i, ret);
>> +			goto err_led;
>> +		}
>> +	}
>> +
>> +	if (!is_palmas_charger(palmas->product_id))
>> +		return 0;
>> +
>> +	/* Set the LED current registers if set in platform data */
>> +	if (pdata->led1_current)
>> +		palmas_led_update_bits(leds_data, PALMAS_LED_CURRENT_CTRL1,
>> +				PALMAS_LED_CURRENT_CTRL1_LED_1_CURRENT_MASK,
>> +				pdata->led1_current);
>> +
>> +	if (pdata->led2_current)
>> +		palmas_led_update_bits(leds_data, PALMAS_LED_CURRENT_CTRL1,
>> +				PALMAS_LED_CURRENT_CTRL1_LED_2_CURRENT_MASK,
>> +				pdata->led2_current <<
>> +				PALMAS_LED_CURRENT_CTRL1_LED_2_CURRENT_SHIFT);
>> +
>> +	if (pdata->led3_current)
>> +		palmas_led_update_bits(leds_data, PALMAS_LED_CURRENT_CTRL2,
>> +				PALMAS_LED_CURRENT_CTRL2_LED_3_CURRENT_MASK,
>> +				pdata->led3_current);
>> +
>> +	if (pdata->led3_current)
>> +		palmas_led_update_bits(leds_data, PALMAS_LED_CURRENT_CTRL2,
>> +				PALMAS_LED_CURRENT_CTRL2_LED_3_CURRENT_MASK,
>> +				pdata->led3_current);
>> +
>> +	if (pdata->led4_current)
>> +		palmas_led_update_bits(leds_data, PALMAS_CHRG_LED_CTRL,
>> +				PALMAS_CHRG_LED_CTRL_CHRG_LED_CURRENT_MASK,
>> +				pdata->led4_current <<
>> +				PALMAS_CHRG_LED_CTRL_CHRG_LED_CURRENT_SHIFT);
>> +
>> +	if (pdata->chrg_led_vbat_low)
>> +		palmas_led_update_bits(leds_data, PALMAS_CHRG_LED_CTRL,
>> +				PALMAS_CHRG_LED_CTRL_CHRG_LOWBAT_BLK_DIS,
>> +				PALMAS_CHRG_LED_CTRL_CHRG_LOWBAT_BLK_DIS);
>> +
>> +	return 0;
>> +
>> +err_led:
>> +	for (i =3D 0; i < leds_data->no_leds; i++)
>> +		led_classdev_unregister(&leds_data->palmas_led[i].cdev);
>> +	kfree(leds_data->palmas_led);
>> +	kfree(leds_data);
>=20
> If you use devm_kzalloc() above, you don't need to use kfree().
>=20
>> +	return ret;
>> +}
>> +
>> +static int palmas_leds_remove(struct platform_device *pdev)
>> +{
>> +	struct palmas_leds_data *leds_data =3D platform_get_drvdata(pdev);
>> +	int i;
>> +
>> +	for (i =3D 0; i < leds_data->no_leds; i++)
>> +		led_classdev_unregister(&leds_data->palmas_led[i].cdev);
>> +	if (i)
>> +		kfree(leds_data->palmas_led);
>> +	kfree(leds_data);
>=20
> If you use devm_kzalloc() above, you don't need to use kfree().
>=20
>> +
>> +	return 0;
>> +}
>> +
>> +static struct of_device_id of_palmas_match_tbl[] =3D {
>> +	{ .compatible =3D "ti,palmas-leds", },
>> +	{ /* end */ }
>> +};
>> +
>> +static struct platform_driver palmas_leds_driver =3D {
>> +	.driver =3D {
>> +		.name =3D "palmas-leds",
>> +		.of_match_table =3D of_palmas_match_tbl,
>> +		.owner =3D THIS_MODULE,
>> +	},
>> +	.probe =3D palmas_leds_probe,
>> +	.remove =3D palmas_leds_remove,
>> +};
>> +
>> +static int  palmas_leds_init(void)
>> +{
>> +	return platform_driver_register(&palmas_leds_driver);
>> +}
>> +module_init(palmas_leds_init);
>> +
>> +static void palmas_leds_exit(void)
>> +{
>> +	platform_driver_unregister(&palmas_leds_driver);
>> +}
>> +module_exit(palmas_leds_exit);
>=20
> Please use module_platform_driver() macro which makes the code
> smaller and simpler.
>=20
> +module_platform_driver(palmas_leds_driver);
>=20
>=20
>> +
>> +MODULE_AUTHOR("Graeme Gregory <gg@slimlogic.co.uk>");
>> +MODULE_DESCRIPTION("Palmas LED driver");
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:palmas-leds");
>> +MODULE_DEVICE_TABLE(of, of_palmas_match_tbl);
>> diff --git a/include/linux/mfd/palmas.h b/include/linux/mfd/palmas.h
>> index 0b86845..856f54e 100644
>> --- a/include/linux/mfd/palmas.h
>> +++ b/include/linux/mfd/palmas.h
>> @@ -232,6 +232,16 @@ struct palmas_clk_platform_data {
>>   	int clk32kgaudio_mode_sleep;
>>   };
>>
>> +struct palmas_leds_platform_data {
>> +	int led1_current;
>> +	int led2_current;
>> +	int led3_current;
>> +	int led4_current;
>> +
>> +	int chrg_led_mode;
>> +	int chrg_led_vbat_low;
>> +};
>> +
>>   struct palmas_platform_data {
>>   	int gpio_base;
>>
>> @@ -1855,6 +1865,12 @@ enum usb_irq_events {
>>   #define PALMAS_LED_CTRL						0x1
>>   #define PALMAS_PWM_CTRL1					0x2
>>   #define PALMAS_PWM_CTRL2					0x3
>> +#define PALMAS_LED_PERIOD2_CTRL					0x4
>> +#define PALMAS_LED_CTRL2					0x5
>> +#define PALMAS_LED_CURRENT_CTRL1				0x6
>> +#define PALMAS_LED_CURRENT_CTRL2				0x7
>> +#define PALMAS_CHRG_LED_CTRL					0x8
>> +#define PALMAS_LED_EN						0x9
>>
>>   /* Bit definitions for LED_PERIOD_CTRL */
>>   #define PALMAS_LED_PERIOD_CTRL_LED_2_PERIOD_MASK		0x38
>> @@ -1882,6 +1898,50 @@ enum usb_irq_events {
>>   #define PALMAS_PWM_CTRL2_PWM_DUTY_SEL_MASK			0xff
>>   #define PALMAS_PWM_CTRL2_PWM_DUTY_SEL_SHIFT			0
>>
>> +/* Bit definitions for LED_PERIOD2_CTRL */
>> +#define PALMAS_LED_PERIOD2_CTRL_CHRG_LED_PERIOD_MASK		0x38
>> +#define PALMAS_LED_PERIOD2_CTRL_CHRG_LED_PERIOD_SHIFT		3
>> +#define PALMAS_LED_PERIOD2_CTRL_LED_3_PERIOD_MASK		0x07
>> +#define PALMAS_LED_PERIOD2_CTRL_LED_3_PERIOD_SHIFT		0
>> +
>> +/* Bit definitions for LED_CTRL2 */
>> +#define PALMAS_LED_CTRL2_CHRG_LED_SEQ				0x20
>> +#define PALMAS_LED_CTRL2_CHRG_LED_SEQ_SHIFT			5
>> +#define PALMAS_LED_CTRL2_LED_3_SEQ				0x10
>> +#define PALMAS_LED_CTRL2_LED_3_SEQ_SHIFT			4
>> +#define PALMAS_LED_CTRL2_CHRG_LED_ON_TIME_MASK			0x0c
>> +#define PALMAS_LED_CTRL2_CHRG_LED_ON_TIME_SHIFT			2
>> +#define PALMAS_LED_CTRL2_LED_3_ON_TIME_MASK			0x03
>> +#define PALMAS_LED_CTRL2_LED_3_ON_TIME_SHIFT			0
>> +
>> +/* Bit definitions for LED_CURRENT_CTRL1 */
>> +#define PALMAS_LED_CURRENT_CTRL1_LED_2_CURRENT_MASK		0x38
>> +#define PALMAS_LED_CURRENT_CTRL1_LED_2_CURRENT_SHIFT		3
>> +#define PALMAS_LED_CURRENT_CTRL1_LED_1_CURRENT_MASK		0x07
>> +#define PALMAS_LED_CURRENT_CTRL1_LED_1_CURRENT_SHIFT		0
>> +
>> +/* Bit definitions for LED_CURRENT_CTRL2 */
>> +#define PALMAS_LED_CURRENT_CTRL2_LED_3_CURRENT_MASK		0x07
>> +#define PALMAS_LED_CURRENT_CTRL2_LED_3_CURRENT_SHIFT		0
>> +
>> +/* Bit definitions for CHRG_LED_CTRL */
>> +#define PALMAS_CHRG_LED_CTRL_CHRG_LED_CURRENT_MASK		0x38
>> +#define PALMAS_CHRG_LED_CTRL_CHRG_LED_CURRENT_SHIFT		3
>> +#define PALMAS_CHRG_LED_CTRL_CHRG_LOWBAT_BLK_DIS		0x02
>> +#define PALMAS_CHRG_LED_CTRL_CHRG_LOWBAT_BLK_DIS_SHIFT		1
>> +#define PALMAS_CHRG_LED_CTRL_CHRG_LED_MODE			0x01
>> +#define PALMAS_CHRG_LED_CTRL_CHRG_LED_MODE_SHIFT		0
>> +
>> +/* Bit definitions for LED_EN */
>> +#define PALMAS_LED_EN_CHRG_LED_EN				0x08
>> +#define PALMAS_LED_EN_CHRG_LED_EN_SHIFT				3
>> +#define PALMAS_LED_EN_LED_3_EN					0x04
>> +#define PALMAS_LED_EN_LED_3_EN_SHIFT				2
>> +#define PALMAS_LED_EN_LED_2_EN					0x02
>> +#define PALMAS_LED_EN_LED_2_EN_SHIFT				1
>> +#define PALMAS_LED_EN_LED_1_EN					0x01
>> +#define PALMAS_LED_EN_LED_1_EN_SHIFT				0
>> +
>>   /* Registers for function INTERRUPT */
>>   #define PALMAS_INT1_STATUS					0x0
>>   #define PALMAS_INT1_MASK					0x1
>> --
>> 1.7.0.4
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-leds=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> N=EB=96=91=EA=BF=A9=EF=BF=BDr=ED=88=A4y=E9=89=89=EC=8B=95b=EC=BE=8A=D0=
=A4=ED=91=A4v=EF=BF=BD^=EF=BF=BD)=E9=A0=BB{.n=EF=BF=BD+=EB=8F=B4=EC=AA=90=
{=EC=BD=97=E5=96=A9zX=E3=8E=8D=17=EC=8D=B3=E8=AE=8A}=EC=B0=A0=EA=BC=BF=EC=
=9F=BA=EF=BF=BD&j:+v=EB=8F=A3=EF=BF=BD=07=EC=B3=AD=E5=96=A9zZ+=EF=BF=BD=
+zf=EF=BC=82=ED=86=92=EC=89=B1=EF=BF=BD~=EB=84=AE=EB=85=ACi=EF=BF=BD=E9=
=8E=ACz=EF=BF=BD=1E=EC=B7=BF=E2=85=B1=EF=BF=BD?=EC=86=B3=E9=88=BA=EF=BF=
=BD&=EF=BF=BD)=E5=88=AA=1Bf=EB=B7=8C^j=ED=91=B9y=EC=AC=B6=EB=81=B7@A=EC=
=B2=BA=EB=9B=B4=EF=BF=BD=EF=BF=BD=0C0=EB=9D=A0h=EF=BF=BD=0F=EF=BF=BDi=EF=
=BF=BD
>=20
