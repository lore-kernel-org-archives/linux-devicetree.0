Return-Path: <SRS0=O2+a=GC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:47978 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751780AbeCLPyS (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 12 Mar 2018 11:54:18 -0400
Subject: Re: [PATCH] leds: add LED driver for CR0014114 board
References: <026d9ec2-f2bd-18b9-d5fa-f593d40e2f57@kaa.org.ua>
 <20180312153323.9200-1-oleg@kaa.org.ua>
 <alpine.DEB.2.21.1803121642140.8144@vps.pmeerw.net>
From: Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <bf110c78-93f2-ccd7-aca5-335405450bf3@kaa.org.ua>
Date: Mon, 12 Mar 2018 17:54:07 +0200
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1803121642140.8144@vps.pmeerw.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DWlBvtZ5o1Iz2KlPSExK4nt10sBUtzNUq"
Sender: devicetree-owner@vger.kernel.org
To: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DWlBvtZ5o1Iz2KlPSExK4nt10sBUtzNUq
Content-Type: multipart/mixed; boundary="MjJBeJnlhhU6LxetYEOjQP1rnm63a03Ek";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Message-ID: <bf110c78-93f2-ccd7-aca5-335405450bf3@kaa.org.ua>
Subject: Re: [PATCH] leds: add LED driver for CR0014114 board
References: <026d9ec2-f2bd-18b9-d5fa-f593d40e2f57@kaa.org.ua>
 <20180312153323.9200-1-oleg@kaa.org.ua>
 <alpine.DEB.2.21.1803121642140.8144@vps.pmeerw.net>
In-Reply-To: <alpine.DEB.2.21.1803121642140.8144@vps.pmeerw.net>

--MjJBeJnlhhU6LxetYEOjQP1rnm63a03Ek
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

Thanks for comments.


On 12.03.18 17:45, Peter Meerwald-Stadler wrote:
> trivial comments below
>
>> This patch adds a LED class driver for the RGB LEDs found on
>> the Crane Merchandising System CR0014114 LEDs board.
>>
>> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
>> ---
>>  .../devicetree/bindings/leds/leds-cr0014114.txt    |  46 ++++
>>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>>  drivers/leds/Kconfig                               |  13 +
>>  drivers/leds/Makefile                              |   1 +
>>  drivers/leds/leds-cr0014114.c                      | 282 ++++++++++++=
+++++++++
>>  5 files changed, 343 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-cr0014=
114.txt
>>  create mode 100644 drivers/leds/leds-cr0014114.c
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-cr0014114.txt=
 b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
>> new file mode 100644
>> index 000000000000..56721598ee81
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
>> @@ -0,0 +1,46 @@
>> +Crane Merchandising System - cr0014114 LED driver
>> +-------------------------------------------------
>> +
>> +This LED Board widely used in vending machines produced
> _is_ widely used
>
>> +by Crane Merchandising Systems.
>> +
>> +Required properties:
>> +- compatible: "cms,cr0014114"
>> +- reg: chip select address for the device
>> +- spi-cpha: shifted clock phase mode is required
>> +
>> +LED sub-node properties:
>> +- label : (optional)
>> +	see Documentation/devicetree/bindings/leds/common.txt
>> +- linux,default-trigger : (optional)
>> +	see Documentation/devicetree/bindings/leds/common.txt
>> +
>> +Example
>> +-------
>> +
>> +cr0014114@0 {
>> +	compatible =3D "crane,cr0014114";
>> +	reg =3D <0>;
>> +	spi-max-frequency =3D <50000>;
>> +	spi-cpha;
>> +
>> +	led0 {
>> +		label =3D "cr0:red:";
>> +	};
>> +	led1 {
>> +		label =3D "cr0:green:";
>> +	};
>> +	led2 {
>> +		label =3D "cr0:blue:";
>> +	};
>> +	led3 {
>> +		label =3D "cr1:red:";
>> +	};
>> +	led4 {
>> +		label =3D "cr1:green:";
>> +	};
>> +	led5 {
>> +		label =3D "cr1:blue:";
>> +	};
>> +	...
>> +};
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/D=
ocumentation/devicetree/bindings/vendor-prefixes.txt
>> index ae850d6c0ad3..f17949c365f5 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> @@ -75,6 +75,7 @@ cnxt	Conexant Systems, Inc.
>>  compulab	CompuLab Ltd.
>>  cortina	Cortina Systems, Inc.
>>  cosmic	Cosmic Circuits
>> +crane	Crane Connectivity Solutions
>>  creative	Creative Technology Ltd
>>  crystalfontz	Crystalfontz America, Inc.
>>  cubietech	Cubietech, Ltd.
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 2c896c0e69e1..bb6a70ac5004 100644
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
>> +	  widely used in vending machines produced by
> is widely
>
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
>> index 000000000000..e3aecdbea73c
>> --- /dev/null
>> +++ b/drivers/leds/leds-cr0014114.c
>> @@ -0,0 +1,282 @@
>> +#include <linux/delay.h>
>> +#include <linux/leds.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/property.h>
>> +#include <linux/spi/spi.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/timer.h>
>> +#include <linux/workqueue.h>
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
>> +	const char		*name;
>> +	struct cr0014114	*priv;
>> +	struct led_classdev	ldev;
>> +	u8			brightness;
>> +};
>> +
>> +struct cr0014114 {
>> +	bool			do_recount;
>> +	size_t			count;
>> +	struct device		*dev;
>> +	struct mutex		lock;
>> +	struct spi_device	*spi;
>> +	struct timer_list	timer;
>> +	struct work_struct	work;
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
>> +	/* special case when CRC matches to SPI commands */
> matches the
>
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
>> +	dev_dbg(priv->dev, "recount of LEDs is started\n");
>> +
>> +	do {
>> +		cmd =3D CR_INIT_REENUMERATE;
>> +		ret =3D spi_write(priv->spi, &cmd, sizeof(cmd));
>> +		if (ret)
>> +			break;
>> +
>> +		cmd =3D CR_NEXT_REENUMERATE;
>> +		for (i =3D 0; i < priv->count; i++) {
>> +			msleep(CR_FW_DELAY_MSEC);
>> +
>> +			ret =3D spi_write(priv->spi, &cmd, sizeof(cmd));
>> +			if (ret)
>> +				break;
>> +		}
>> +	} while (0);
>> +
>> +	dev_dbg(priv->dev, "recount of LEDs is complete, error: %d\n", ret);=

>> +
>> +	return ret;
>> +}
>> +
>> +static int cr0014114_sync(struct cr0014114 *priv)
>> +{
>> +	int		ret;
>> +	size_t		i;
>> +	u8		data[priv->count + 2];
>> +	unsigned long	udelay, now =3D jiffies;
>> +
>> +	/* to avoid SPI mistiming with firmware we should wait some time */
>> +	if (time_after(priv->delay, now)) {
>> +		udelay =3D jiffies_to_usecs(priv->delay - now);
>> +		usleep_range(udelay, udelay + 1);
>> +	}
>> +
>> +	do {
>> +		if (unlikely(priv->do_recount)) {
>> +			ret =3D cr0014114_recount(priv);
>> +			if (ret)
>> +				break;
>> +
>> +			priv->do_recount =3D false;
>> +		}
>> +
>> +		data[0] =3D CR_SET_BRIGHTNESS;
>> +		for (i =3D 0; i < priv->count; i++)
>> +			data[i + 1] =3D priv->leds[i].brightness;
>> +		cr0014114_calc_crc(data, sizeof(data));
>> +
>> +		ret =3D spi_write(priv->spi, data, sizeof(data));
>> +		if (ret)
>> +			break;
>> +	} while (0);
>> +
>> +	priv->delay =3D jiffies + msecs_to_jiffies(CR_FW_DELAY_MSEC);
>> +
>> +	return ret;
>> +}
>> +
>> +static void cr0014114_recount_work(struct work_struct *work)
>> +{
>> +	int			ret;
>> +	struct cr0014114	*priv =3D container_of(work, struct cr0014114,
>> +						     work);
>> +
>> +	mutex_lock(&priv->lock);
>> +	priv->do_recount =3D true;
>> +	ret =3D cr0014114_sync(priv);
>> +	mutex_unlock(&priv->lock);
>> +
>> +	if (ret)
>> +		dev_warn(priv->dev, "recount LEDs failed %d\n", ret);
>> +}
>> +
>> +int cr0014114_set_sync(struct led_classdev *ldev,
> static?
>
>> +		       enum led_brightness brightness)
>> +{
>> +	int			ret;
>> +	struct cr0014114_led    *led =3D container_of(ldev,
>> +						    struct cr0014114_led,
>> +						    ldev);
>> +
>> +	mutex_lock(&led->priv->lock);
>> +	led->brightness =3D (u8)brightness;
>> +	ret =3D cr0014114_sync(led->priv);
>> +	mutex_unlock(&led->priv->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +void cr0014114_recount_timer(struct timer_list *t)
> static?
>
>> +{
>> +	struct cr0014114 *priv =3D from_timer(priv, t, timer);
>> +
>> +	schedule_work(&priv->work);
>> +	mod_timer(&priv->timer, jiffies + CR_RECOUNT_DELAY);
>> +}
>> +
>> +static int cr0014114_probe_dt(struct cr0014114 *priv)
>> +{
>> +	size_t			i =3D 0;
>> +	struct cr0014114_led	*led;
>> +	struct fwnode_handle	*child;
>> +	struct device_node	*np;
>> +	int			ret;
>> +
>> +	device_for_each_child_node(priv->dev, child) {
>> +		np =3D to_of_node(child);
>> +		led =3D &priv->leds[i];
>> +
>> +		ret =3D fwnode_property_read_string(child, "label",
>> +						  &led->name);
>> +		if (ret && IS_ENABLED(CONFIG_OF) && np)
>> +			led->name =3D np->name;
>> +
>> +		if (!led->name) {
>> +			fwnode_handle_put(child);
>> +			return -EINVAL;
>> +		}
>> +
>> +		fwnode_property_read_string(child, "linux,default-trigger",
>> +					    &led->ldev.default_trigger);
>> +
>> +		led->priv			  =3D priv;
>> +		led->ldev.name			  =3D led->name;
>> +		led->ldev.brightness		  =3D LED_OFF;
>> +		led->ldev.max_brightness	  =3D CR_MAX_BRIGHTNESS;
>> +		led->ldev.brightness_set_blocking =3D cr0014114_set_sync;
>> +
>> +		ret =3D devm_of_led_classdev_register(priv->dev, np,
>> +						    &led->ldev);
>> +		if (ret) {
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
>> +		dev_err(&spi->dev, "LEDs are not defined in device tree");
>> +		return -ENODEV;
>> +	}
>> +
>> +	priv =3D devm_kzalloc(&spi->dev,
>> +			    sizeof(*priv) + sizeof(*priv->leds) * count,
>> +			    GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	mutex_init(&priv->lock);
>> +	INIT_WORK(&priv->work, cr0014114_recount_work);
>> +	priv->do_recount	=3D true;
>> +	priv->count		=3D count;
>> +	priv->dev		=3D &spi->dev;
>> +	priv->spi		=3D spi;
>> +
>> +	ret =3D cr0014114_probe_dt(priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D cr0014114_sync(priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* setup recount timer to workaround buggy firmware */
>> +	timer_setup(&priv->timer, cr0014114_recount_timer, 0);
>> +	mod_timer(&priv->timer, jiffies + CR_RECOUNT_DELAY);
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
>> +	cancel_work_sync(&priv->work);
>> +	del_timer_sync(&priv->timer);
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
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("spi:cr0014114");
>>

--=20
Best regards,
Oleh Kravchenko



--MjJBeJnlhhU6LxetYEOjQP1rnm63a03Ek--

--DWlBvtZ5o1Iz2KlPSExK4nt10sBUtzNUq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEC/TM5t+2NenFhW0Q0xNJm20pl4wFAlqmop8QHG9sZWdAa2Fh
Lm9yZy51YQAKCRDTE0mbbSmXjHdZEAC2VXreHLZJzcKeUl/TKXaRKrysy16U/q2T
vPcPCHOrjYcnquep8syV30rMiaHVxchiMxOZyVkkLRQYTHcik9iJDvxdmhl3I4rx
1hhI+39Gs6gpHk/0aMWX4gRClPyCbhhvIaxEEdoC5FkUKf3yXNwXPytPEgGwxCKu
nv6JTGPyOPFzxacE0e6P0fbDtfEcYAbidY/4cRiRWMt9+0K0xTHfSeO6d0AohpWQ
NsEwKRVC5TeDh1DkzbgipYkZa735r6AVOtrbK56NjGmZqmMFtJ04uRvDSTDc5q5u
Xr/YvgfUe//kJ/zEg2CEfuO4HTREuvzxwmUZzTpXnY/JqfM8g9CtK6KTCRYB9MIF
VjByISLlJQjJLXXaoeNaY/6yoWlO0zlwpOChg9Gvv2DGQbUYXBKf2Dn6pgQUlyVT
BP61Ffkrijty+yjZezuqeWtRuCt+3ogkoXWim0bYS1O6mH8IeLseBUAILzhUIhDA
W6IysItYRj8ZSNjTDw2ye5KFZvoxgsG0sP7E5iK7G05B4pkHGy4OEY3jIAST3/L7
vUMJW5JL8wZ6xpKWgK5mxwja2oVKhdd40zr1K5Pj6fyiE09r2VKk9lwkZO9v5c1d
iBAi7NJAN74PlEgSPUTybOD1zG8qDgN1ayl7cihIpI3ylDlR7hMDDJ2yHhRdFOc4
V7b11iObCA==
=WYLq
-----END PGP SIGNATURE-----

--DWlBvtZ5o1Iz2KlPSExK4nt10sBUtzNUq--
