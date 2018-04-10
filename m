Return-Path: <SRS0=MwFQ=G7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:58414 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751629AbeDJUYa (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 10 Apr 2018 16:24:30 -0400
Subject: Re: [PATCH v8 2/2] leds: add LED driver for CR0014114 board
References: <20180328185616.27711-2-oleg@kaa.org.ua>
 <20180402125350.2679-1-oleg@kaa.org.ua>
 <20180402125350.2679-2-oleg@kaa.org.ua>
 <10077484-3b43-581d-6734-830c379e9a32@gmail.com>
From: Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <fca9d0b3-13fa-f517-e0cf-c6f4ac9b1445@kaa.org.ua>
Date: Tue, 10 Apr 2018 23:24:19 +0300
MIME-Version: 1.0
In-Reply-To: <10077484-3b43-581d-6734-830c379e9a32@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jiiNnJbIhfHYiiFm704FvAajr4vEy80UK"
Sender: devicetree-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jiiNnJbIhfHYiiFm704FvAajr4vEy80UK
Content-Type: multipart/mixed; boundary="XD8MgL2tYzmYRQYaVIU8qYzoG7j4QVkKA";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Message-ID: <fca9d0b3-13fa-f517-e0cf-c6f4ac9b1445@kaa.org.ua>
Subject: Re: [PATCH v8 2/2] leds: add LED driver for CR0014114 board
References: <20180328185616.27711-2-oleg@kaa.org.ua>
 <20180402125350.2679-1-oleg@kaa.org.ua>
 <20180402125350.2679-2-oleg@kaa.org.ua>
 <10077484-3b43-581d-6734-830c379e9a32@gmail.com>
In-Reply-To: <10077484-3b43-581d-6734-830c379e9a32@gmail.com>

--XD8MgL2tYzmYRQYaVIU8qYzoG7j4QVkKA
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

Thank you!

On 10.04.18 21:59, Jacek Anaszewski wrote:
> Hi Oleh,
>
> Thanks for the updated set.
>
> On 04/02/2018 02:53 PM, Oleh Kravchenko wrote:
>> This patch adds a LED class driver for the RGB LEDs found on
>> the Crane Merchandising System CR0014114 LEDs board.
>>
>> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
>> ---
>>  drivers/leds/Kconfig          |  13 ++
>>  drivers/leds/Makefile         |   1 +
>>  drivers/leds/leds-cr0014114.c | 314 +++++++++++++++++++++++++++++++++=
+++++++++
>>  3 files changed, 328 insertions(+)
>>  create mode 100644 drivers/leds/leds-cr0014114.c
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 2c896c0e69e1..5831814d01d0 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -104,6 +104,19 @@ config LEDS_CPCAP
>>  	  This option enables support for LEDs offered by Motorola's
>>  	  CPCAP PMIC.
>> =20
>> +config LEDS_CR0014114
>> +	tristate "LED Support for Crane CR0014114"
>> +	depends on LEDS_CLASS
>> +	depends on SPI
>> +	depends on OF
>> +	help
>> +	  This option enables support for CR0014114 LED Board which
>> +	  is widely used in vending machines produced by
>> +	  Crane Merchandising Systems.
>> +
>> +	  To compile this driver as a module, choose M here: the module
>> +	  will be called leds-cr0014114.
>> +
>>  config LEDS_LM3530
>>  	tristate "LCD Backlight driver for LM3530"
>>  	depends on LEDS_CLASS
>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>> index 91eca81cae82..0176e7335994 100644
>> --- a/drivers/leds/Makefile
>> +++ b/drivers/leds/Makefile
>> @@ -78,6 +78,7 @@ obj-$(CONFIG_LEDS_MT6323)		+=3D leds-mt6323.o
>>  obj-$(CONFIG_LEDS_LM3692X)		+=3D leds-lm3692x.o
>> =20
>>  # LED SPI Drivers
>> +obj-$(CONFIG_LEDS_CR0014114)		+=3D leds-cr0014114.o
>>  obj-$(CONFIG_LEDS_DAC124S085)		+=3D leds-dac124s085.o
>> =20
>>  # LED Userspace Drivers
>> diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr00141=
14.c
>> new file mode 100644
>> index 000000000000..9d0417207827
>> --- /dev/null
>> +++ b/drivers/leds/leds-cr0014114.c
>> @@ -0,0 +1,314 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2018 Crane Merchandising Systems. All rights reserve=
d.
>> +// Copyright (C) 2018 Oleh Kravchenko <oleg@kaa.org.ua>
>> +
>> +#include <linux/delay.h>
>> +#include <linux/leds.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/spi/spi.h>
>> +#include <linux/workqueue.h>
>> +#include <uapi/linux/uleds.h>
>> +
>> +/*
>> + *  CR0014114 SPI protocol descrtiption:
>> + *  +----+-----------------------------------+----+
>> + *  | CMD|             BRIGHTNESS            |CRC |
>> + *  +----+-----------------------------------+----+
>> + *  |    | LED0| LED1| LED2| LED3| LED4| LED5|    |
>> + *  |    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+    |
>> + *  |    |R|G|B|R|G|B|R|G|B|R|G|B|R|G|B|R|G|B|    |
>> + *  | 1  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ 1  |
>> + *  |    |1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|    |
>> + *  |    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+    |
>> + *  |    |               18                  |    |
>> + *  +----+-----------------------------------+----+
>> + *  |                    20                       |
>> + *  +---------------------------------------------+
>> + *
>> + *  PS: Boards can be connected to the chain:
>> + *      SPI -> board0 -> board1 -> board2 ..
>> + */
>> +
>> +/* CR0014114 SPI commands */
>> +#define CR_SET_BRIGHTNESS	0x80
>> +#define CR_INIT_REENUMERATE	0x81
>> +#define CR_NEXT_REENUMERATE	0x82
>> +
>> +/* CR0014114 default settings */
>> +#define CR_MAX_BRIGHTNESS	GENMASK(6, 0)
>> +#define CR_FW_DELAY_MSEC	10
>> +#define CR_RECOUNT_DELAY	(HZ * 3600)
>> +
>> +struct cr0014114_led {
>> +	char			name[LED_MAX_NAME_SIZE];
>> +	struct cr0014114	*priv;
>> +	struct led_classdev	ldev;
>> +	u8			brightness;
>> +};
>> +
>> +struct cr0014114 {
>> +	bool			do_recount;
>> +	size_t			count;
>> +	struct delayed_work	work;
>> +	struct device		*dev;
>> +	struct mutex		lock;
>> +	struct spi_device	*spi;
>> +	u8			*buf;
>> +	unsigned long		delay;
>> +	struct cr0014114_led	leds[];
>> +};
>> +
>> +static void cr0014114_calc_crc(u8 *buf, const size_t len)
>> +{
>> +	size_t	i;
>> +	u8	crc;
>> +
>> +	for (i =3D 1, crc =3D 1; i < len - 1; i++)
>> +		crc +=3D buf[i];
>> +	crc |=3D BIT(7);
>> +
>> +	/* special case when CRC matches the SPI commands */
>> +	if (crc =3D=3D CR_SET_BRIGHTNESS ||
>> +	    crc =3D=3D CR_INIT_REENUMERATE ||
>> +	    crc =3D=3D CR_NEXT_REENUMERATE)
>> +		crc =3D 0xfe;
>> +
>> +	buf[len - 1] =3D crc;
>> +}
>> +
>> +static int cr0014114_recount(struct cr0014114 *priv)
>> +{
>> +	int	ret;
>> +	size_t	i;
>> +	u8	cmd;
>> +
>> +	dev_dbg(priv->dev, "LEDs recount is started\n");
>> +
>> +	cmd =3D CR_INIT_REENUMERATE;
>> +	ret =3D spi_write(priv->spi, &cmd, sizeof(cmd));
>> +	if (ret)
>> +		goto err;
>> +
>> +	cmd =3D CR_NEXT_REENUMERATE;
>> +	for (i =3D 0; i < priv->count; i++) {
>> +		msleep(CR_FW_DELAY_MSEC);
>> +
>> +		ret =3D spi_write(priv->spi, &cmd, sizeof(cmd));
>> +		if (ret)
>> +			goto err;
>> +	}
>> +
>> +err:
>> +	dev_dbg(priv->dev, "LEDs recount is finished\n");
>> +
>> +	if (ret)
>> +		dev_err(priv->dev, "with error %d", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int cr0014114_sync(struct cr0014114 *priv)
>> +{
>> +	int		ret;
>> +	size_t		i;
>> +	unsigned long	udelay, now =3D jiffies;
>> +
>> +	/* to avoid SPI mistiming with firmware we should wait some time */
>> +	if (time_after(priv->delay, now)) {
>> +		udelay =3D jiffies_to_usecs(priv->delay - now);
>> +		usleep_range(udelay, udelay + 1);
>> +	}
>> +
>> +	if (unlikely(priv->do_recount)) {
>> +		ret =3D cr0014114_recount(priv);
>> +		if (ret)
>> +			goto err;
>> +
>> +		priv->do_recount =3D false;
>> +		msleep(CR_FW_DELAY_MSEC);
>> +	}
>> +
>> +	priv->buf[0] =3D CR_SET_BRIGHTNESS;
>> +	for (i =3D 0; i < priv->count; i++)
>> +		priv->buf[i + 1] =3D priv->leds[i].brightness;
>> +	cr0014114_calc_crc(priv->buf, priv->count + 2);
>> +	ret =3D spi_write(priv->spi, priv->buf, priv->count + 2);
>> +
>> +err:
>> +	priv->delay =3D jiffies + msecs_to_jiffies(CR_FW_DELAY_MSEC);
>> +
>> +	return ret;
>> +}
>> +
>> +static void cr0014114_recount_work(struct work_struct *work)
>> +{
>> +	int			ret;
>> +	struct cr0014114	*priv =3D container_of(work,
>> +						     struct cr0014114,
>> +						     work.work);
>> +
>> +	mutex_lock(&priv->lock);
>> +	priv->do_recount =3D true;
>> +	ret =3D cr0014114_sync(priv);
>> +	mutex_unlock(&priv->lock);
>> +
>> +	if (ret)
>> +		dev_warn(priv->dev, "sync of LEDs failed %d\n", ret);
>> +
>> +	schedule_delayed_work(&priv->work, CR_RECOUNT_DELAY);
>> +}
>> +
>> +static int cr0014114_set_sync(struct led_classdev *ldev,
>> +			      enum led_brightness brightness)
>> +{
>> +	int			ret;
>> +	struct cr0014114_led    *led =3D container_of(ldev,
>> +						    struct cr0014114_led,
>> +						    ldev);
>> +
>> +	dev_dbg(led->priv->dev, "Set brightness of %s to %d\n",
>> +		led->name, brightness);
>> +
>> +	mutex_lock(&led->priv->lock);
>> +	led->brightness =3D (u8)brightness;
>> +	ret =3D cr0014114_sync(led->priv);
>> +	mutex_unlock(&led->priv->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int cr0014114_probe_dt(struct cr0014114 *priv)
>> +{
>> +	size_t			i =3D 0;
>> +	struct cr0014114_led	*led;
>> +	struct fwnode_handle	*child;
>> +	struct device_node	*np;
>> +	int			ret;
>> +	const char		*str;
>> +
>> +	device_for_each_child_node(priv->dev, child) {
>> +		np =3D to_of_node(child);
>> +		led =3D &priv->leds[i];
>> +
>> +		ret =3D fwnode_property_read_string(child, "label", &str);
>> +		if (ret)
>> +			snprintf(led->name, sizeof(led->name),
>> +				 "cr0014114::");
>> +		else
>> +			snprintf(led->name, sizeof(led->name),
>> +				 "cr0014114:%s", str);
>> +
>> +		fwnode_property_read_string(child, "linux,default-trigger",
>> +					    &led->ldev.default_trigger);
>> +
>> +		led->priv			  =3D priv;
>> +		led->ldev.name			  =3D led->name;
>> +		led->ldev.max_brightness	  =3D CR_MAX_BRIGHTNESS;
>> +		led->ldev.brightness_set_blocking =3D cr0014114_set_sync;
>> +
>> +		ret =3D devm_of_led_classdev_register(priv->dev, np,
>> +						    &led->ldev);
>> +		if (ret) {
>> +			dev_err(priv->dev,
>> +				"failed to register LED device %s, err %d",
>> +				led->name, ret);
>> +			fwnode_handle_put(child);
>> +			return ret;
>> +		}
>> +
>> +		led->ldev.dev->of_node =3D np;
>> +
>> +		i++;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int cr0014114_probe(struct spi_device *spi)
>> +{
>> +	struct cr0014114	*priv;
>> +	size_t			count;
>> +	int			ret;
>> +
>> +	count =3D device_get_child_node_count(&spi->dev);
>> +	if (!count) {
>> +		dev_err(&spi->dev, "LEDs are not defined in device tree!");
>> +		return -ENODEV;
>> +	}
>> +
>> +	priv =3D devm_kzalloc(&spi->dev,
>> +			    sizeof(*priv) + sizeof(*priv->leds) * count,
>> +			    GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->buf =3D devm_kzalloc(&spi->dev, count + 2, GFP_KERNEL);
>> +	if (!priv->buf)
>> +		return -ENOMEM;
>> +
>> +	mutex_init(&priv->lock);
>> +	INIT_DELAYED_WORK(&priv->work, cr0014114_recount_work);
>> +	priv->count	=3D count;
>> +	priv->dev	=3D &spi->dev;
>> +	priv->spi	=3D spi;
>> +	priv->delay	=3D jiffies -
>> +			  msecs_to_jiffies(CR_FW_DELAY_MSEC);
>> +
>> +	priv->do_recount =3D true;
>> +	ret =3D cr0014114_sync(priv);
>> +	if (ret) {
>> +		dev_err(priv->dev, "first recount failed %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	priv->do_recount =3D true;
>> +	ret =3D cr0014114_sync(priv);
>> +	if (ret) {
>> +		dev_err(priv->dev, "second recount failed %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret =3D cr0014114_probe_dt(priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* setup recount work to workaround buggy firmware */
>> +	schedule_delayed_work(&priv->work, CR_RECOUNT_DELAY);
>> +
>> +	spi_set_drvdata(spi, priv);
>> +
>> +	return 0;
>> +}
>> +
>> +static int cr0014114_remove(struct spi_device *spi)
>> +{
>> +	struct cr0014114 *priv =3D spi_get_drvdata(spi);
>> +
>> +	cancel_delayed_work_sync(&priv->work);
> Added mutex_destroy(&priv->lock) here and applied the set
> to the for-4.18 branch of linux-leds.git.
>
> Thanks for your work.
>
> Best regards,
> Jacek Anaszewski
>
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id cr0014114_dt_ids[] =3D {
>> +	{ .compatible =3D "crane,cr0014114", },
>> +	{},
>> +};
>> +
>> +MODULE_DEVICE_TABLE(of, cr0014114_dt_ids);
>> +
>> +static struct spi_driver cr0014114_driver =3D {
>> +	.probe		=3D cr0014114_probe,
>> +	.remove		=3D cr0014114_remove,
>> +	.driver =3D {
>> +		.name		=3D KBUILD_MODNAME,
>> +		.of_match_table	=3D cr0014114_dt_ids,
>> +	},
>> +};
>> +
>> +module_spi_driver(cr0014114_driver);
>> +
>> +MODULE_AUTHOR("Oleh Kravchenko <oleg@kaa.org.ua>");
>> +MODULE_DESCRIPTION("cr0014114 LED driver");
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_ALIAS("spi:cr0014114");
>>

--=20
Best regards,
Oleh Kravchenko



--XD8MgL2tYzmYRQYaVIU8qYzoG7j4QVkKA--

--jiiNnJbIhfHYiiFm704FvAajr4vEy80UK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEC/TM5t+2NenFhW0Q0xNJm20pl4wFAlrNHXcACgkQ0xNJm20p
l4xqthAAuBdsB80q7jAhBrnNxyFQ4CnA2l0D1K1l/rYzffhsuqXsJsrJTjyFYuwi
DuaIFUg1A2jd6XmJYGr1bpBQjiXV6x+ifqHYFSkxD5f0+FOiUmKKF8Nn97wnR60u
M7PgFhP868wn9il4rlymMJqvfCWqDO7SCF8VvokViyAewua2hm/YxAfVM6VCOJw2
PdNxMStHyCCgLm+r5rtkD2hcWZ8C3BWi9Qu0+8uMbO2PrNkzkkYrIMClS0pHFG2L
eyAJvzhKiVVIP4pWDW6uUdMrCbQH8UAtoUe04Xc1xYFyWbEiR/LDdXLdK0dSiAoj
e/AYg5PmHVUNTWS9Oa2dPz99gba0bsPvBNmwFL1ccu2VklfQExrktSFaj9HPvdaf
wiNnYfBxc/EgTHhJQuh06sJ2I9lcCM4yJlKYuowsOlEpxW/w29JbDUBJul5m4H7K
gHiWks95NFajaW+KS2EsV3mwIAN7e9IApERX1qlePgod4pQTIrBxabFr1s0WUT9Y
Z+dhMXPCC0i4NRNw9kBNVpTtSeMN3ShxbUImoofE72HW2Cjot3aeKQCMVyVf8TWx
3AaCIfzQDaYl/L4ick1OEPtyteYXCFC7q31vbzI3tIJCTEPVVCWC93cNxCjzD7Lv
CFToaWPRUI7/sPjCj1rXb5hweGF1zoLJv+DPGDBuPS14HCshR8g=
=X0uP
-----END PGP SIGNATURE-----

--jiiNnJbIhfHYiiFm704FvAajr4vEy80UK--
