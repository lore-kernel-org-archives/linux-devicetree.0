From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/6] iio: light: Updated Vishay Capella cm32181 ambient
 light sensor driver.
Date: Sat, 23 May 2015 11:57:50 +0100
Message-ID: <55605D2E.9000608@kernel.org>
References: <1432268380-7302-1-git-send-email-ktsai@capellamicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432268380-7302-1-git-send-email-ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Tsai <ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Roberta Dobrescu <roberta.dobrescu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 22/05/15 05:19, Kevin Tsai wrote:
> - Renamed company name.
> - Removed cm32181_reg.
> - Removed white space.
> - Removed unused include files.
> - Updated macro definitions.
> - Renamed cm32181_chip pointer to chip.
> 
> Signed-off-by: Kevin Tsai <ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>

Obviously this whole series needs better patch titles.

Split this up into little patches doing one thing.

You may end up with a huge series, but every step will be trivial
and obvious which makes for really easy review!

There's a lot of churn in here to do that chip rename that I'm not
sure really matters, but it also doesn't do any harm so if you
really want to do it fair enough...  That patch also obscures various
other changes so definitely needs to be done on it's own.

> ---
>  drivers/iio/light/Kconfig   |   4 +-
>  drivers/iio/light/cm32181.c | 126 +++++++++++++++++++++++---------------------
>  2 files changed, 67 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/iio/light/Kconfig b/drivers/iio/light/Kconfig
> index a437bad..583aa6a 100644
> --- a/drivers/iio/light/Kconfig
> +++ b/drivers/iio/light/Kconfig
> @@ -39,11 +39,11 @@ config APDS9300
>  
>  config CM32181
>  	depends on I2C
> -	tristate "CM32181 driver"
> +	tristate "Vishay Capella CM32181 driver"
>  	help
>  	 Say Y here if you use cm32181.
>  	 This option enables ambient light sensor using
> -	 Capella cm32181 device driver.
> +	 Vishay Capella cm32181 device driver.
>  
>  	 To compile this driver as a module, choose M here:
>  	 the module will be called cm32181.
> diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
> index 5d12ae54..0491d73 100644
> --- a/drivers/iio/light/cm32181.c
> +++ b/drivers/iio/light/cm32181.c
> @@ -1,19 +1,15 @@
>  /*
> - * Copyright (C) 2013 Capella Microsystems Inc.
> - * Author: Kevin Tsai <ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>
> + * Copyright (C) 2013-2015 Vishay Capella
>   *
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms of the GNU General Public License version 2, as published
>   * by the Free Software Foundation.
>   */
>  
> -#include <linux/delay.h>
> -#include <linux/err.h>
Umm. -ENODEV etc come from here.  It might be included via another
header, but that doesn't mean it should not also be explicitly  listed
here.

>  #include <linux/i2c.h>
>  #include <linux/mutex.h>
>  #include <linux/module.h>
>  #include <linux/interrupt.h>
> -#include <linux/regulator/consumer.h>
>  #include <linux/iio/iio.h>
>  #include <linux/iio/sysfs.h>
>  #include <linux/iio/events.h>
> @@ -21,36 +17,43 @@
>  
>  /* Registers Address */
>  #define CM32181_REG_ADDR_CMD		0x00
> +#define CM32181_REG_ADDR_ALS_WH		0x01
> +#define CM32181_REG_ADDR_ALS_WL		0x02
>  #define CM32181_REG_ADDR_ALS		0x04
>  #define CM32181_REG_ADDR_STATUS		0x06
>  #define CM32181_REG_ADDR_ID		0x07
>  
>  /* Number of Configurable Registers */
> -#define CM32181_CONF_REG_NUM		0x01
> +#define CM32181_CONF_REG_NUM		3
>  
>  /* CMD register */
> -#define CM32181_CMD_ALS_ENABLE		0x00
> -#define CM32181_CMD_ALS_DISABLE		0x01
> -#define CM32181_CMD_ALS_INT_EN		0x02
> +#define CM32181_CMD_ALS_DISABLE		BIT(0)
> +#define CM32181_CMD_ALS_INT_EN		BIT(1)
>  
>  #define CM32181_CMD_ALS_IT_SHIFT	6
> -#define CM32181_CMD_ALS_IT_MASK		(0x0F << CM32181_CMD_ALS_IT_SHIFT)
> +#define CM32181_CMD_ALS_IT_MASK		(BIT(6) | BIT(7) | BIT(8) | BIT(9))
Use genmask
>  #define CM32181_CMD_ALS_IT_DEFAULT	(0x00 << CM32181_CMD_ALS_IT_SHIFT)
>  
>  #define CM32181_CMD_ALS_SM_SHIFT	11
> -#define CM32181_CMD_ALS_SM_MASK		(0x03 << CM32181_CMD_ALS_SM_SHIFT)
> +#define CM32181_CMD_ALS_SM_MASK		(BIT(11) | BIT(12))
again genmask
>  #define CM32181_CMD_ALS_SM_DEFAULT	(0x01 << CM32181_CMD_ALS_SM_SHIFT)
>  
> +#define CM32181_CMD_DEFAULT		(CM32181_CMD_ALS_IT_DEFAULT | \
> +					CM32181_CMD_ALS_SM_DEFAULT)
> +
> +/* ALS_WH register */
> +#define CM32181_ALS_WH_DEFAULT		0xFFFF
> +
> +/* ALS_WL register */
> +#define CM32181_ALS_WL_DEFAULT		0x0000
> +
> +/* Software parameters */
>  #define CM32181_MLUX_PER_BIT		5	/* ALS_SM=01 IT=800ms */
>  #define CM32181_MLUX_PER_BIT_BASE_IT	800000	/* Based on IT=800ms */
>  #define	CM32181_CALIBSCALE_DEFAULT	1000
>  #define CM32181_CALIBSCALE_RESOLUTION	1000
>  #define MLUX_PER_LUX			1000
>  
> -static const u8 cm32181_reg[CM32181_CONF_REG_NUM] = {
> -	CM32181_REG_ADDR_CMD,
> -};
> -
>  static const int als_it_bits[] = {12, 8, 0, 1, 2, 3};
>  static const int als_it_value[] = {25000, 50000, 100000, 200000, 400000,
>  	800000};
> @@ -64,15 +67,15 @@ struct cm32181_chip {
>  
>  /**
>   * cm32181_reg_init() - Initialize CM32181 registers
> - * @cm32181:	pointer of struct cm32181.
> + * @chip:	pointer of struct cm32181_chip
>   *
>   * Initialize CM32181 ambient light sensor register to default values.
>   *
>   * Return: 0 for success; otherwise for error code.
>   */
> -static int cm32181_reg_init(struct cm32181_chip *cm32181)
> +static int cm32181_reg_init(struct cm32181_chip *chip)
>  {
> -	struct i2c_client *client = cm32181->client;
> +	struct i2c_client *client = chip->client;
>  	int i;
>  	s32 ret;
>  
> @@ -85,14 +88,15 @@ static int cm32181_reg_init(struct cm32181_chip *cm32181)
>  		return -ENODEV;
>  
>  	/* Default Values */
> -	cm32181->conf_regs[CM32181_REG_ADDR_CMD] = CM32181_CMD_ALS_ENABLE |
> -			CM32181_CMD_ALS_IT_DEFAULT | CM32181_CMD_ALS_SM_DEFAULT;
> -	cm32181->calibscale = CM32181_CALIBSCALE_DEFAULT;
> +	chip->conf_regs[CM32181_REG_ADDR_CMD] = CM32181_CMD_DEFAULT;
> +	chip->conf_regs[CM32181_REG_ADDR_ALS_WH] = CM32181_ALS_WH_DEFAULT;
> +	chip->conf_regs[CM32181_REG_ADDR_ALS_WL] = CM32181_ALS_WL_DEFAULT;
> +	chip->calibscale = CM32181_CALIBSCALE_DEFAULT;
>  
>  	/* Initialize registers*/
>  	for (i = 0; i < CM32181_CONF_REG_NUM; i++) {
> -		ret = i2c_smbus_write_word_data(client, cm32181_reg[i],
> -			cm32181->conf_regs[i]);
> +		ret = i2c_smbus_write_word_data(client, i,
> +			chip->conf_regs[i]);
>  		if (ret < 0)
>  			return ret;
>  	}
> @@ -101,20 +105,20 @@ static int cm32181_reg_init(struct cm32181_chip *cm32181)
>  }
>  
>  /**
> - *  cm32181_read_als_it() - Get sensor integration time (ms)
> - *  @cm32181:	pointer of struct cm32181
> - *  @val2:	pointer of int to load the als_it value.
> + * cm32181_read_als_it() - Get sensor integration time (ms)
> + * @chip:	pointer of struct cm32181_chip
> + * @val2:	pointer of int to load the als_it value.
>   *
> - *  Report the current integartion time by millisecond.
> + * Report the current integartion time by millisecond.
>   *
> - *  Return: IIO_VAL_INT_PLUS_MICRO for success, otherwise -EINVAL.
> + * Return: IIO_VAL_INT_PLUS_MICRO for success, otherwise -EINVAL.
>   */
> -static int cm32181_read_als_it(struct cm32181_chip *cm32181, int *val2)
> +static int cm32181_read_als_it(struct cm32181_chip *chip, int *val2)
>  {
>  	u16 als_it;
>  	int i;
>  
> -	als_it = cm32181->conf_regs[CM32181_REG_ADDR_CMD];
> +	als_it = chip->conf_regs[CM32181_REG_ADDR_CMD];
>  	als_it &= CM32181_CMD_ALS_IT_MASK;
>  	als_it >>= CM32181_CMD_ALS_IT_SHIFT;
>  	for (i = 0; i < ARRAY_SIZE(als_it_bits); i++) {
> @@ -129,16 +133,16 @@ static int cm32181_read_als_it(struct cm32181_chip *cm32181, int *val2)
>  
>  /**
>   * cm32181_write_als_it() - Write sensor integration time
> - * @cm32181:	pointer of struct cm32181.
> + * @chip:	pointer of struct cm32181_chip.
>   * @val:	integration time by millisecond.
>   *
>   * Convert integration time (ms) to sensor value.
>   *
>   * Return: i2c_smbus_write_word_data command return value.
>   */
> -static int cm32181_write_als_it(struct cm32181_chip *cm32181, int val)
> +static int cm32181_write_als_it(struct cm32181_chip *chip, int val)
>  {
> -	struct i2c_client *client = cm32181->client;
> +	struct i2c_client *client = chip->client;
>  	u16 als_it;
>  	int ret, i, n;
>  
> @@ -152,35 +156,35 @@ static int cm32181_write_als_it(struct cm32181_chip *cm32181, int val)
>  	als_it = als_it_bits[i];
>  	als_it <<= CM32181_CMD_ALS_IT_SHIFT;
>  
> -	mutex_lock(&cm32181->lock);
> -	cm32181->conf_regs[CM32181_REG_ADDR_CMD] &=
> +	mutex_lock(&chip->lock);
> +	chip->conf_regs[CM32181_REG_ADDR_CMD] &=
>  		~CM32181_CMD_ALS_IT_MASK;
> -	cm32181->conf_regs[CM32181_REG_ADDR_CMD] |=
> +	chip->conf_regs[CM32181_REG_ADDR_CMD] |=
>  		als_it;
>  	ret = i2c_smbus_write_word_data(client, CM32181_REG_ADDR_CMD,
> -			cm32181->conf_regs[CM32181_REG_ADDR_CMD]);
> -	mutex_unlock(&cm32181->lock);
> +			chip->conf_regs[CM32181_REG_ADDR_CMD]);
> +	mutex_unlock(&chip->lock);
>  
>  	return ret;
>  }
>  
>  /**
>   * cm32181_get_lux() - report current lux value
> - * @cm32181:	pointer of struct cm32181.
> + * @chip:	pointer of struct cm32181_chip
>   *
>   * Convert sensor raw data to lux.  It depends on integration
>   * time and calibscale variable.
>   *
>   * Return: Positive value is lux, otherwise is error code.
>   */
> -static int cm32181_get_lux(struct cm32181_chip *cm32181)
> +static int cm32181_get_lux(struct cm32181_chip *chip)
>  {
> -	struct i2c_client *client = cm32181->client;
> +	struct i2c_client *client = chip->client;
>  	int ret;
>  	int als_it;
>  	unsigned long lux;
>  
> -	ret = cm32181_read_als_it(cm32181, &als_it);
> +	ret = cm32181_read_als_it(chip, &als_it);
>  	if (ret < 0)
>  		return -EINVAL;
>  
> @@ -193,7 +197,7 @@ static int cm32181_get_lux(struct cm32181_chip *cm32181)
>  		return ret;
>  
>  	lux *= ret;
> -	lux *= cm32181->calibscale;
> +	lux *= chip->calibscale;
>  	lux /= CM32181_CALIBSCALE_RESOLUTION;
>  	lux /= MLUX_PER_LUX;
>  
> @@ -204,25 +208,25 @@ static int cm32181_get_lux(struct cm32181_chip *cm32181)
>  }
>  
>  static int cm32181_read_raw(struct iio_dev *indio_dev,
> -			    struct iio_chan_spec const *chan,
> -			    int *val, int *val2, long mask)
> +			struct iio_chan_spec const *chan,
> +			int *val, int *val2, long mask)
>  {
> -	struct cm32181_chip *cm32181 = iio_priv(indio_dev);
> +	struct cm32181_chip *chip = iio_priv(indio_dev);
>  	int ret;
>  
>  	switch (mask) {
>  	case IIO_CHAN_INFO_PROCESSED:
> -		ret = cm32181_get_lux(cm32181);
> +		ret = cm32181_get_lux(chip);
>  		if (ret < 0)
>  			return ret;
>  		*val = ret;
>  		return IIO_VAL_INT;
>  	case IIO_CHAN_INFO_CALIBSCALE:
> -		*val = cm32181->calibscale;
> +		*val = chip->calibscale;
>  		return IIO_VAL_INT;
>  	case IIO_CHAN_INFO_INT_TIME:
>  		*val = 0;
> -		ret = cm32181_read_als_it(cm32181, val2);
> +		ret = cm32181_read_als_it(chip, val2);
>  		return ret;
>  	}
>  
> @@ -230,18 +234,18 @@ static int cm32181_read_raw(struct iio_dev *indio_dev,
>  }
>  
>  static int cm32181_write_raw(struct iio_dev *indio_dev,
> -			     struct iio_chan_spec const *chan,
> -			     int val, int val2, long mask)
> +			struct iio_chan_spec const *chan,
> +			int val, int val2, long mask)
>  {
> -	struct cm32181_chip *cm32181 = iio_priv(indio_dev);
> +	struct cm32181_chip *chip = iio_priv(indio_dev);
>  	int ret;
>  
>  	switch (mask) {
>  	case IIO_CHAN_INFO_CALIBSCALE:
> -		cm32181->calibscale = val;
> +		chip->calibscale = val;
>  		return val;
>  	case IIO_CHAN_INFO_INT_TIME:
> -		ret = cm32181_write_als_it(cm32181, val2);
> +		ret = cm32181_write_als_it(chip, val2);
>  		return ret;
>  	}
>  
> @@ -301,21 +305,21 @@ static const struct iio_info cm32181_info = {
>  static int cm32181_probe(struct i2c_client *client,
>  			const struct i2c_device_id *id)
>  {
> -	struct cm32181_chip *cm32181;
> +	struct cm32181_chip *chip;
>  	struct iio_dev *indio_dev;
>  	int ret;
>  
> -	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*cm32181));
> +	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*chip));
>  	if (!indio_dev) {
>  		dev_err(&client->dev, "devm_iio_device_alloc failed\n");
>  		return -ENOMEM;
>  	}
>  
> -	cm32181 = iio_priv(indio_dev);
> +	chip = iio_priv(indio_dev);
>  	i2c_set_clientdata(client, indio_dev);
> -	cm32181->client = client;
> +	chip->client = client;
>  
> -	mutex_init(&cm32181->lock);
> +	mutex_init(&chip->lock);
>  	indio_dev->dev.parent = &client->dev;
>  	indio_dev->channels = cm32181_channels;
>  	indio_dev->num_channels = ARRAY_SIZE(cm32181_channels);
> @@ -323,7 +327,7 @@ static int cm32181_probe(struct i2c_client *client,
>  	indio_dev->name = id->name;
>  	indio_dev->modes = INDIO_DIRECT_MODE;
>  
> -	ret = cm32181_reg_init(cm32181);
> +	ret = cm32181_reg_init(chip);
>  	if (ret) {
>  		dev_err(&client->dev,
>  			"%s: register init failed\n",
> @@ -360,7 +364,7 @@ static struct i2c_driver cm32181_driver = {
>  		.of_match_table = of_match_ptr(cm32181_of_match),
>  		.owner	= THIS_MODULE,
>  	},
> -	.id_table       = cm32181_id,
> +	.id_table	= cm32181_id,
>  	.probe		= cm32181_probe,
>  };
>  
> 
