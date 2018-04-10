Return-Path: <SRS0=MwFQ=G7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34585 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752134AbeDJTBR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Apr 2018 15:01:17 -0400
Subject: Re: [PATCH v8 2/2] leds: add LED driver for CR0014114 board
References: <20180328185616.27711-2-oleg@kaa.org.ua>
 <20180402125350.2679-1-oleg@kaa.org.ua>
 <20180402125350.2679-2-oleg@kaa.org.ua>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <10077484-3b43-581d-6734-830c379e9a32@gmail.com>
Date: Tue, 10 Apr 2018 20:59:58 +0200
MIME-Version: 1.0
In-Reply-To: <20180402125350.2679-2-oleg@kaa.org.ua>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Oleh,

Thanks for the updated set.

On 04/02/2018 02:53 PM, Oleh Kravchenko wrote:
> This patch adds a LED class driver for the RGB LEDs found on
> the Crane Merchandising System CR0014114 LEDs board.
> 
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>  drivers/leds/Kconfig          |  13 ++
>  drivers/leds/Makefile         |   1 +
>  drivers/leds/leds-cr0014114.c | 314 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 328 insertions(+)
>  create mode 100644 drivers/leds/leds-cr0014114.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 2c896c0e69e1..5831814d01d0 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -104,6 +104,19 @@ config LEDS_CPCAP
>  	  This option enables support for LEDs offered by Motorola's
>  	  CPCAP PMIC.
>  
> +config LEDS_CR0014114
> +	tristate "LED Support for Crane CR0014114"
> +	depends on LEDS_CLASS
> +	depends on SPI
> +	depends on OF
> +	help
> +	  This option enables support for CR0014114 LED Board which
> +	  is widely used in vending machines produced by
> +	  Crane Merchandising Systems.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called leds-cr0014114.
> +
>  config LEDS_LM3530
>  	tristate "LCD Backlight driver for LM3530"
>  	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 91eca81cae82..0176e7335994 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -78,6 +78,7 @@ obj-$(CONFIG_LEDS_MT6323)		+= leds-mt6323.o
>  obj-$(CONFIG_LEDS_LM3692X)		+= leds-lm3692x.o
>  
>  # LED SPI Drivers
> +obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
>  obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
>  
>  # LED Userspace Drivers
> diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
> new file mode 100644
> index 000000000000..9d0417207827
> --- /dev/null
> +++ b/drivers/leds/leds-cr0014114.c
> @@ -0,0 +1,314 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2018 Crane Merchandising Systems. All rights reserved.
> +// Copyright (C) 2018 Oleh Kravchenko <oleg@kaa.org.ua>
> +
> +#include <linux/delay.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/spi/spi.h>
> +#include <linux/workqueue.h>
> +#include <uapi/linux/uleds.h>
> +
> +/*
> + *  CR0014114 SPI protocol descrtiption:
> + *  +----+-----------------------------------+----+
> + *  | CMD|             BRIGHTNESS            |CRC |
> + *  +----+-----------------------------------+----+
> + *  |    | LED0| LED1| LED2| LED3| LED4| LED5|    |
> + *  |    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+    |
> + *  |    |R|G|B|R|G|B|R|G|B|R|G|B|R|G|B|R|G|B|    |
> + *  | 1  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ 1  |
> + *  |    |1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|    |
> + *  |    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+    |
> + *  |    |               18                  |    |
> + *  +----+-----------------------------------+----+
> + *  |                    20                       |
> + *  +---------------------------------------------+
> + *
> + *  PS: Boards can be connected to the chain:
> + *      SPI -> board0 -> board1 -> board2 ..
> + */
> +
> +/* CR0014114 SPI commands */
> +#define CR_SET_BRIGHTNESS	0x80
> +#define CR_INIT_REENUMERATE	0x81
> +#define CR_NEXT_REENUMERATE	0x82
> +
> +/* CR0014114 default settings */
> +#define CR_MAX_BRIGHTNESS	GENMASK(6, 0)
> +#define CR_FW_DELAY_MSEC	10
> +#define CR_RECOUNT_DELAY	(HZ * 3600)
> +
> +struct cr0014114_led {
> +	char			name[LED_MAX_NAME_SIZE];
> +	struct cr0014114	*priv;
> +	struct led_classdev	ldev;
> +	u8			brightness;
> +};
> +
> +struct cr0014114 {
> +	bool			do_recount;
> +	size_t			count;
> +	struct delayed_work	work;
> +	struct device		*dev;
> +	struct mutex		lock;
> +	struct spi_device	*spi;
> +	u8			*buf;
> +	unsigned long		delay;
> +	struct cr0014114_led	leds[];
> +};
> +
> +static void cr0014114_calc_crc(u8 *buf, const size_t len)
> +{
> +	size_t	i;
> +	u8	crc;
> +
> +	for (i = 1, crc = 1; i < len - 1; i++)
> +		crc += buf[i];
> +	crc |= BIT(7);
> +
> +	/* special case when CRC matches the SPI commands */
> +	if (crc == CR_SET_BRIGHTNESS ||
> +	    crc == CR_INIT_REENUMERATE ||
> +	    crc == CR_NEXT_REENUMERATE)
> +		crc = 0xfe;
> +
> +	buf[len - 1] = crc;
> +}
> +
> +static int cr0014114_recount(struct cr0014114 *priv)
> +{
> +	int	ret;
> +	size_t	i;
> +	u8	cmd;
> +
> +	dev_dbg(priv->dev, "LEDs recount is started\n");
> +
> +	cmd = CR_INIT_REENUMERATE;
> +	ret = spi_write(priv->spi, &cmd, sizeof(cmd));
> +	if (ret)
> +		goto err;
> +
> +	cmd = CR_NEXT_REENUMERATE;
> +	for (i = 0; i < priv->count; i++) {
> +		msleep(CR_FW_DELAY_MSEC);
> +
> +		ret = spi_write(priv->spi, &cmd, sizeof(cmd));
> +		if (ret)
> +			goto err;
> +	}
> +
> +err:
> +	dev_dbg(priv->dev, "LEDs recount is finished\n");
> +
> +	if (ret)
> +		dev_err(priv->dev, "with error %d", ret);
> +
> +	return ret;
> +}
> +
> +static int cr0014114_sync(struct cr0014114 *priv)
> +{
> +	int		ret;
> +	size_t		i;
> +	unsigned long	udelay, now = jiffies;
> +
> +	/* to avoid SPI mistiming with firmware we should wait some time */
> +	if (time_after(priv->delay, now)) {
> +		udelay = jiffies_to_usecs(priv->delay - now);
> +		usleep_range(udelay, udelay + 1);
> +	}
> +
> +	if (unlikely(priv->do_recount)) {
> +		ret = cr0014114_recount(priv);
> +		if (ret)
> +			goto err;
> +
> +		priv->do_recount = false;
> +		msleep(CR_FW_DELAY_MSEC);
> +	}
> +
> +	priv->buf[0] = CR_SET_BRIGHTNESS;
> +	for (i = 0; i < priv->count; i++)
> +		priv->buf[i + 1] = priv->leds[i].brightness;
> +	cr0014114_calc_crc(priv->buf, priv->count + 2);
> +	ret = spi_write(priv->spi, priv->buf, priv->count + 2);
> +
> +err:
> +	priv->delay = jiffies + msecs_to_jiffies(CR_FW_DELAY_MSEC);
> +
> +	return ret;
> +}
> +
> +static void cr0014114_recount_work(struct work_struct *work)
> +{
> +	int			ret;
> +	struct cr0014114	*priv = container_of(work,
> +						     struct cr0014114,
> +						     work.work);
> +
> +	mutex_lock(&priv->lock);
> +	priv->do_recount = true;
> +	ret = cr0014114_sync(priv);
> +	mutex_unlock(&priv->lock);
> +
> +	if (ret)
> +		dev_warn(priv->dev, "sync of LEDs failed %d\n", ret);
> +
> +	schedule_delayed_work(&priv->work, CR_RECOUNT_DELAY);
> +}
> +
> +static int cr0014114_set_sync(struct led_classdev *ldev,
> +			      enum led_brightness brightness)
> +{
> +	int			ret;
> +	struct cr0014114_led    *led = container_of(ldev,
> +						    struct cr0014114_led,
> +						    ldev);
> +
> +	dev_dbg(led->priv->dev, "Set brightness of %s to %d\n",
> +		led->name, brightness);
> +
> +	mutex_lock(&led->priv->lock);
> +	led->brightness = (u8)brightness;
> +	ret = cr0014114_sync(led->priv);
> +	mutex_unlock(&led->priv->lock);
> +
> +	return ret;
> +}
> +
> +static int cr0014114_probe_dt(struct cr0014114 *priv)
> +{
> +	size_t			i = 0;
> +	struct cr0014114_led	*led;
> +	struct fwnode_handle	*child;
> +	struct device_node	*np;
> +	int			ret;
> +	const char		*str;
> +
> +	device_for_each_child_node(priv->dev, child) {
> +		np = to_of_node(child);
> +		led = &priv->leds[i];
> +
> +		ret = fwnode_property_read_string(child, "label", &str);
> +		if (ret)
> +			snprintf(led->name, sizeof(led->name),
> +				 "cr0014114::");
> +		else
> +			snprintf(led->name, sizeof(led->name),
> +				 "cr0014114:%s", str);
> +
> +		fwnode_property_read_string(child, "linux,default-trigger",
> +					    &led->ldev.default_trigger);
> +
> +		led->priv			  = priv;
> +		led->ldev.name			  = led->name;
> +		led->ldev.max_brightness	  = CR_MAX_BRIGHTNESS;
> +		led->ldev.brightness_set_blocking = cr0014114_set_sync;
> +
> +		ret = devm_of_led_classdev_register(priv->dev, np,
> +						    &led->ldev);
> +		if (ret) {
> +			dev_err(priv->dev,
> +				"failed to register LED device %s, err %d",
> +				led->name, ret);
> +			fwnode_handle_put(child);
> +			return ret;
> +		}
> +
> +		led->ldev.dev->of_node = np;
> +
> +		i++;
> +	}
> +
> +	return 0;
> +}
> +
> +static int cr0014114_probe(struct spi_device *spi)
> +{
> +	struct cr0014114	*priv;
> +	size_t			count;
> +	int			ret;
> +
> +	count = device_get_child_node_count(&spi->dev);
> +	if (!count) {
> +		dev_err(&spi->dev, "LEDs are not defined in device tree!");
> +		return -ENODEV;
> +	}
> +
> +	priv = devm_kzalloc(&spi->dev,
> +			    sizeof(*priv) + sizeof(*priv->leds) * count,
> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->buf = devm_kzalloc(&spi->dev, count + 2, GFP_KERNEL);
> +	if (!priv->buf)
> +		return -ENOMEM;
> +
> +	mutex_init(&priv->lock);
> +	INIT_DELAYED_WORK(&priv->work, cr0014114_recount_work);
> +	priv->count	= count;
> +	priv->dev	= &spi->dev;
> +	priv->spi	= spi;
> +	priv->delay	= jiffies -
> +			  msecs_to_jiffies(CR_FW_DELAY_MSEC);
> +
> +	priv->do_recount = true;
> +	ret = cr0014114_sync(priv);
> +	if (ret) {
> +		dev_err(priv->dev, "first recount failed %d\n", ret);
> +		return ret;
> +	}
> +
> +	priv->do_recount = true;
> +	ret = cr0014114_sync(priv);
> +	if (ret) {
> +		dev_err(priv->dev, "second recount failed %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = cr0014114_probe_dt(priv);
> +	if (ret)
> +		return ret;
> +
> +	/* setup recount work to workaround buggy firmware */
> +	schedule_delayed_work(&priv->work, CR_RECOUNT_DELAY);
> +
> +	spi_set_drvdata(spi, priv);
> +
> +	return 0;
> +}
> +
> +static int cr0014114_remove(struct spi_device *spi)
> +{
> +	struct cr0014114 *priv = spi_get_drvdata(spi);
> +
> +	cancel_delayed_work_sync(&priv->work);

Added mutex_destroy(&priv->lock) here and applied the set
to the for-4.18 branch of linux-leds.git.

Thanks for your work.

Best regards,
Jacek Anaszewski

> +
> +	return 0;
> +}
> +
> +static const struct of_device_id cr0014114_dt_ids[] = {
> +	{ .compatible = "crane,cr0014114", },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, cr0014114_dt_ids);
> +
> +static struct spi_driver cr0014114_driver = {
> +	.probe		= cr0014114_probe,
> +	.remove		= cr0014114_remove,
> +	.driver = {
> +		.name		= KBUILD_MODNAME,
> +		.of_match_table	= cr0014114_dt_ids,
> +	},
> +};
> +
> +module_spi_driver(cr0014114_driver);
> +
> +MODULE_AUTHOR("Oleh Kravchenko <oleg@kaa.org.ua>");
> +MODULE_DESCRIPTION("cr0014114 LED driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("spi:cr0014114");
> 

