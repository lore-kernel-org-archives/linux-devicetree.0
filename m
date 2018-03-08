Return-Path: <SRS0=9q+S=F6=gmail.com=jacek.anaszewski@kernel.org>
Subject: Re: [PATCH v2 2/2] leds: add Panasonic AN30259A support
References: <20180307004722.23524-1-simon@lineageos.org>
 <20180307004722.23524-3-simon@lineageos.org>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <b1f6024c-8364-213e-a18d-1fe5970b9262@gmail.com>
Date: Thu, 8 Mar 2018 23:17:27 +0100
MIME-Version: 1.0
In-Reply-To: <20180307004722.23524-3-simon@lineageos.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
To: Simon Shields <simon@lineageos.org>, linux-leds@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

Thanks for the update.

On 03/07/2018 01:47 AM, Simon Shields wrote:
> AN30259A is a 3-channel LED driver which uses I2C. It supports timed
> operation via an internal PWM clock, and variable brightness. This
> driver offers support for basic hardware-based blinking and brightness
> control.
> 
> The datasheet is freely available:
> https://www.alliedelec.com/m/d/a9d2b3ee87c2d1a535a41dd747b1c247.pdf
> 
> Signed-off-by: Simon Shields <simon@lineageos.org>
> ---
>  drivers/leds/Kconfig         |  11 ++
>  drivers/leds/Makefile        |   1 +
>  drivers/leds/leds-an30259a.c | 382 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 394 insertions(+)
>  create mode 100644 drivers/leds/leds-an30259a.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 3e763d2a0cb3..369bfb1227f8 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -57,6 +57,17 @@ config LEDS_AAT1290
>  	depends on PINCTRL
>  	help
>  	 This option enables support for the LEDs on the AAT1290.
> +
> +config LEDS_AN30259A
> +	tristate "LED support for Panasonic AN30259A"
> +	depends on LEDS_CLASS && I2C && OF
> +	help
> +	  This option enables support for the AN30259A 3-channel
> +	  LED driver.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called leds-an30259a.
> +
>  config LEDS_APU
>  	tristate "Front panel LED support for PC Engines APU/APU2 boards"
>  	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 987884a5b9a5..44f9b42d1600 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_LEDS_88PM860X)		+= leds-88pm860x.o
>  obj-$(CONFIG_LEDS_AAT1290)		+= leds-aat1290.o
>  obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
>  obj-$(CONFIG_LEDS_AS3645A)		+= leds-as3645a.o
> +obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
>  obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
>  obj-$(CONFIG_LEDS_BCM6358)		+= leds-bcm6358.o
>  obj-$(CONFIG_LEDS_BD2802)		+= leds-bd2802.o
> diff --git a/drivers/leds/leds-an30259a.c b/drivers/leds/leds-an30259a.c
> new file mode 100644
> index 000000000000..6170aa2e3adb
> --- /dev/null
> +++ b/drivers/leds/leds-an30259a.c
> @@ -0,0 +1,382 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for Panasonic AN30259A 3-channel LED driver
> + *
> + * Copyright (c) 2018 Simon Shields <simon@lineageos.org>
> + *
> + * Datasheet:
> + * https://www.alliedelec.com/m/d/a9d2b3ee87c2d1a535a41dd747b1c247.pdf
> + */

I'd go for '//' comment marker for this entire block.
We're already changing it (e.g. [0][1]) according to Linus
preference [2].

> +#include <linux/i2c.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +#define MAX_LEDS 3
> +
> +#define REG_SRESET 0x00
> +#define LED_SRESET BIT(0)
> +
> +/* LED power registers */
> +#define REG_LEDON 0x01
> +#define LED_EN(x) BIT(x - 1)
> +#define LED_SLOPE(x) BIT((x - 1) + 4)
> +
> +#define REG_LEDCC(x) (0x03 + (x - 1))
> +
> +/* slope control registers */
> +#define REG_SLOPE(x) (0x06 + (x - 1))
> +#define LED_SLOPETIME1(x) (x)
> +#define LED_SLOPETIME2(x) ((x) << 4)
> +
> +#define REG_LEDCNT1(x) (0x09 + (4 * (x - 1)))
> +#define LED_DUTYMAX(x) ((x) << 4)
> +#define LED_DUTYMID(x) (x)
> +
> +#define REG_LEDCNT2(x) (0x0A + (4 * (x - 1)))
> +#define LED_DELAY(x) ((x) << 4)
> +#define LED_DUTYMIN(x) (x)
> +
> +/* detention time control (length of each slope step) */
> +#define REG_LEDCNT3(x) (0x0B + (4 * (x - 1)))
> +#define LED_DT1(x) (x)
> +#define LED_DT2(x) ((x) << 4)
> +
> +#define REG_LEDCNT4(x) (0x0C + (4 * (x - 1)))
> +#define LED_DT3(x) (x)
> +#define LED_DT4(x) ((x) << 4)
> +
> +#define REG_MAX 0x14
> +
> +#define BLINK_MAX_TIME 7500 /* ms */
> +#define SLOPE_RESOLUTION 500 /* ms */
> +
> +#define STATE_OFF 0
> +#define STATE_KEEP 1
> +#define STATE_ON 2
> +
> +struct an30259a;
> +
> +struct an30259a_led {
> +	struct an30259a *chip;
> +	struct led_classdev cdev;
> +	u32 num;
> +	u32 default_state;
> +};
> +
> +struct an30259a {
> +	struct mutex mutex; /* held when writing to registers */
> +	struct i2c_client *client;
> +	struct an30259a_led leds[MAX_LEDS];
> +	struct regmap *regmap;
> +	int num_leds;
> +};
> +
> +static u8 an30259a_get_dutymax(u8 brightness)
> +{
> +	u8 duty_max, floor, ceil;
> +
> +	/* squash 8 bit number into 7-bit PWM range */
> +	duty_max = brightness >> 1;
> +
> +	/* bottom 3 bits are always set for DUTYMAX
> +	 * figure out the closest value
> +	 */
> +	ceil = duty_max | 0x7;
> +	floor = ceil - 0x8;
> +
> +	if ((duty_max - floor) < (ceil - duty_max))
> +		duty_max = floor >> 3;
> +	else
> +		duty_max = ceil >> 3;
> +
> +	return duty_max;
> +}
> +
> +static int an30259a_brightness(struct an30259a_led *led,
> +			       enum led_brightness brightness)
> +{
> +	int ret;
> +	unsigned int ledon;

s/ledon/led_on/

> +	u8 dutymax;
> +
> +	ret = regmap_read(led->chip->regmap, REG_LEDON, &ledon);
> +	if (ret)
> +		return ret;
> +
> +	switch (brightness) {
> +	case LED_OFF:
> +		ledon &= ~LED_EN(led->num);
> +		ledon &= ~LED_SLOPE(led->num);
> +		break;
> +	default:
> +		ledon |= LED_EN(led->num);
> +		dutymax = an30259a_get_dutymax(brightness & 0xff);
> +		ret = regmap_write(led->chip->regmap, REG_LEDCNT1(led->num),
> +				   LED_DUTYMAX(dutymax) | LED_DUTYMID(dutymax));
> +		if (ret)
> +			return ret;
> +		break;
> +	}
> +	ret = regmap_write(led->chip->regmap, REG_LEDON, ledon);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(led->chip->regmap, REG_LEDCC(led->num),
> +			   brightness & 0xff);
> +	if (ret)
> +		return ret;
> +
> +	return ret;
> +}
> +
> +static int an30259a_blink(struct an30259a_led *led,
> +			  unsigned long *poff, unsigned long *pon)
> +{
> +	int ret, num = led->num;
> +	unsigned int ledon;
> +	unsigned long off = *poff, on = *pon;
> +
> +	/* slope time - multiples of 500ms only, floored */
> +	off -= off % SLOPE_RESOLUTION;
> +	/* don't floor off time to zero if a non-zero time was requested */
> +	if (!off && *poff)
> +		off += SLOPE_RESOLUTION;
> +	else if (off > BLINK_MAX_TIME)
> +		off = BLINK_MAX_TIME;
> +	*poff = off;
> +
> +	on -= on % SLOPE_RESOLUTION;
> +	/* don't floor on time to zero if a non-zero time was requested */
> +	if (!on && *pon)
> +		on += SLOPE_RESOLUTION;
> +	else if (on > BLINK_MAX_TIME)
> +		on = BLINK_MAX_TIME;
> +	*pon = on;
> +
> +	/* convert into values the HW will understand */
> +	off /= SLOPE_RESOLUTION;
> +	on /= SLOPE_RESOLUTION;
> +
> +	/* duty min should be zero (=off), delay should be zero */
> +	ret = regmap_write(led->chip->regmap, REG_LEDCNT2(num),
> +			   LED_DELAY(0) | LED_DUTYMIN(0));
> +	if (ret)
> +		return ret;
> +
> +	/* reset detention time (no "breathing" effect) */
> +	ret = regmap_write(led->chip->regmap, REG_LEDCNT3(num),
> +			   LED_DT1(0) | LED_DT2(0));
> +	if (ret)
> +		return ret;
> +	ret = regmap_write(led->chip->regmap, REG_LEDCNT4(num),
> +			   LED_DT3(0) | LED_DT4(0));
> +	if (ret)
> +		return ret;
> +
> +	/* slope time controls on/off cycle length */
> +	ret = regmap_write(led->chip->regmap, REG_SLOPE(num),
> +			   LED_SLOPETIME1(off) | LED_SLOPETIME2(on));
> +	if (ret)
> +		return ret;
> +
> +	/* Finally, enable slope mode. */
> +	ret = regmap_read(led->chip->regmap, REG_LEDON, &ledon);
> +	if (ret)
> +		return ret;
> +
> +	ledon |= LED_SLOPE(num);
> +
> +	return regmap_write(led->chip->regmap, REG_LEDON, ledon);
> +}
> +
> +static int an30259a_led_set(struct led_classdev *cdev,
> +			    enum led_brightness value)
> +{
> +	struct an30259a_led *led;
> +	int ret;
> +
> +	led = container_of(cdev, struct an30259a_led, cdev);
> +
> +	mutex_lock(&led->chip->mutex);
> +	ret = an30259a_brightness(led, value);

There is no verb in this function name and the reader wouldn't
know what actually we're doing with brightness here on the first glance.

But instead of fixing the function name I propose to put whole its
content directly here, You're not using an30259a_brightness() anywhere
besides this place.

I'd also rename an30259a_led_set to an30259a_brightness_set.

> +	mutex_unlock(&led->chip->mutex);
> +
> +	return ret;
> +}
> +
> +static int an30259a_blink_set(struct led_classdev *cdev,
> +			      unsigned long *delay_off, unsigned long *delay_on)
> +{
> +	struct an30259a_led *led;
> +	int ret;
> +
> +	led = container_of(cdev, struct an30259a_led, cdev);
> +
> +	mutex_lock(&led->chip->mutex);
> +	ret = an30259a_blink(led, delay_off, delay_on);

Ditto.

> +	mutex_unlock(&led->chip->mutex);
> +
> +	return ret;
> +}
> +
> +static int an30259a_dt_init(struct i2c_client *client, struct an30259a *chip)
> +{
> +	struct device_node *np = client->dev.of_node, *child;
> +	int count, ret;
> +	int i = 0;
> +	const char *str;
> +
> +	count = of_get_child_count(np);
> +	if (!count || count > MAX_LEDS)
> +		return -EINVAL;
> +
> +	for_each_child_of_node(np, child) {
> +		u32 source;
> +
> +		ret = of_property_read_u32(child, "reg", &source);
> +		if (ret != 0 || !source || source > MAX_LEDS) {
> +			count--;

Printing some error message here could be useful.

> +			continue;
> +		}
> +
> +		chip->leds[i].num = source;
> +		chip->leds[i].chip = chip;
> +
> +		if (of_property_read_string(child, "label",
> +					    &chip->leds[i].cdev.name))
> +			chip->leds[i].cdev.name = "an30259a::";

Please follow drivers/leds/leds-lm3692x.c when it comes to LED class
device name construction.

> +
> +		if (!of_property_read_string(child, "default-state",
> +					     &str)) {
> +			if (!strcmp(str, "on"))
> +				chip->leds[i].default_state = STATE_ON;
> +			else if (!strcmp(str, "keep"))
> +				chip->leds[i].default_state = STATE_KEEP;
> +			else
> +				chip->leds[i].default_state = STATE_OFF;
> +		}
> +
> +		of_property_read_string(child, "linux,default-trigger",
> +					&chip->leds[i].cdev.default_trigger);
> +
> +		i++;
> +	}
> +
> +	if (!count)
> +		return -EINVAL;
> +
> +	chip->num_leds = i;
> +
> +	return 0;
> +}
> +
> +static const struct regmap_config an30259a_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = REG_MAX,
> +};
> +
> +static void an30259a_init_default_state(struct an30259a_led *led)
> +{
> +	struct an30259a *chip = led->chip;
> +	int ledon, err;
> +
> +	switch (led->default_state) {
> +	case STATE_ON:
> +		led->cdev.brightness = LED_FULL;
> +		break;
> +	case STATE_KEEP:
> +		err = regmap_read(chip->regmap, REG_LEDON, &ledon);
> +		if (err)
> +			break;
> +
> +		if (!(ledon & LED_EN(led->num))) {
> +			led->cdev.brightness = LED_OFF;
> +			break;
> +		}
> +		regmap_read(chip->regmap, REG_LEDCC(led->num),
> +			    &led->cdev.brightness);
> +		break;
> +	default:
> +		led->cdev.brightness = LED_OFF;
> +	}
> +
> +	an30259a_led_set(&led->cdev, led->cdev.brightness);
> +}
> +
> +static int an30259a_probe(struct i2c_client *client)
> +{
> +	struct an30259a *chip;
> +	int i, err;
> +
> +	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	err = an30259a_dt_init(client, chip);
> +	if (err < 0)
> +		return err;
> +
> +	mutex_init(&chip->mutex);
> +	chip->client = client;
> +	i2c_set_clientdata(client, chip);
> +
> +	chip->regmap = devm_regmap_init_i2c(client, &an30259a_regmap_config);
> +
> +	for (i = 0; i < chip->num_leds; i++) {
> +		an30259a_init_default_state(&chip->leds[i]);
> +		chip->leds[i].cdev.brightness_set_blocking = an30259a_led_set;
> +		chip->leds[i].cdev.blink_set = an30259a_blink_set;
> +
> +		err = devm_led_classdev_register(&client->dev,
> +						 &chip->leds[i].cdev);
> +		if (err < 0)
> +			goto exit;
> +	}
> +	return 0;
> +
> +exit:
> +	mutex_destroy(&chip->mutex);
> +	return err;
> +}
> +
> +static int an30259a_remove(struct i2c_client *client)
> +{
> +	struct an30259a *chip = i2c_get_clientdata(client);
> +
> +	mutex_destroy(&chip->mutex);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id an30259a_match_table[] = {
> +	{ .compatible = "panasonic,an30259a", },
> +	{ /* sentinel */ },
> +};
> +
> +MODULE_DEVICE_TABLE(of, an30259a_match_table);
> +
> +static const struct i2c_device_id an30259a_id[] = {
> +	{ "an30259a", NULL },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(i2c, an30259a_id);
> +
> +static struct i2c_driver an30259a_driver = {
> +	.driver = {
> +		.name = "leds-an32059a",
> +		.of_match_table = of_match_ptr(an30259a_match_table),
> +	},
> +	.probe_new = an30259a_probe,
> +	.remove = an30259a_remove,
> +	.id_table = an30259a_id,
> +};
> +
> +module_i2c_driver(an30259a_driver);
> +
> +MODULE_AUTHOR("Simon Shields <simon@lineageos.org>");
> +MODULE_DESCRIPTION("AN32059A LED driver");
> +MODULE_LICENSE("GPL v2");
> 

[0] https://www.mail-archive.com/netdev@vger.kernel.org/msg204598.html
[1] https://lkml.org/lkml/2018/1/10/1110
[2] https://lkml.org/lkml/2017/11/2/715

-- 
Best regards,
Jacek Anaszewski
