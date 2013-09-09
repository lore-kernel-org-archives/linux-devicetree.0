From: Beomho Seo <beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [Patch 1/2] iio:cm36651: Add CM36651 proximity/light sensor driver
Date: Mon, 09 Sep 2013 21:14:27 +0900
Message-ID: <522DBBA3.4050501@samsung.com>
References: <522D665F.9040901@samsung.com>
 <alpine.DEB.2.01.1309090925290.26885@pmeerw.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <alpine.DEB.2.01.1309090925290.26885-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Peter Meerwald l <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello, Mr. Meerwald

Thank you for your advice.

2013=EB=85=84 09=EC=9B=94 09=EC=9D=BC 16:57, Peter Meerwald =EC=93=B4 =EA=
=B8=80:
>=20
>> This patch add a new driver for Capella CM36651 proximity and RGB li=
ght
>> sensor.
>> The driver exposes two channels: light and proximity. It also suppor=
t
>> detection proximity event.
>=20
> comments inline;
> I do not have the chip, but I don't think that the code will work and=
=20
> intended
>
=20
After I have made this driver, I have checked device working on test bo=
ard.
=20
>> This driver supports:
>> 	- events - rising and falling proximity events.
>> 	- reading channels through read_raw callback.
>>
>> Signed-off-by: Beomho Seo <beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  drivers/iio/light/Kconfig   |   11 +
>>  drivers/iio/light/cm36651.c |  607
>> +++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 618 insertions(+)
>>  create mode 100644 drivers/iio/light/cm36651.c
>>
>> diff --git a/drivers/iio/light/Kconfig b/drivers/iio/light/Kconfig
>> index bf9fa0d..66fb76f 100644
>> --- a/drivers/iio/light/Kconfig
>> +++ b/drivers/iio/light/Kconfig
>> @@ -75,4 +75,15 @@ config VCNL4000
>>  	 To compile this driver as a module, choose M here: the
>>  	 module will be called vcnl4000.
>>
>> +config CM36651
>=20
> sensors to be listed in alphabetical order
>=20

I have fixed it.

>> +	depends on I2C
>> +	tristate "CM36651 driver"
>> +	help
>> +	  Say Y here if you use cm36651.
>> +	  This option enables proximity & RGB sensor using
>> +	  Capella cm36651 device driver.
>> +
>> +	  To compile this driver as a module, choose M here:
>> +	  the module will be called cm36651.
>> +
>>  endmenu
>> diff --git a/drivers/iio/light/cm36651.c b/drivers/iio/light/cm36651=
=2Ec
>> new file mode 100644
>> index 0000000..b3e1f0d
>> --- /dev/null
>> +++ b/drivers/iio/light/cm36651.c
>> @@ -0,0 +1,607 @@
>> +/*
>> + * Copyright (C) 2013 Samsung Electronics Co., Ltd.
>> + * Author: Beomho Seo <beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> + *
>> + * This program is free software; you can redistribute  it and/or m=
odify it
>> + * under  the terms of  the GNU General Public License version 2, a=
s
>> published
>> + * by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/i2c.h>
>> +#include <linux/mutex.h>
>> +#include <linux/module.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/iio/iio.h>
>> +#include <linux/iio/sysfs.h>
>> +#include <linux/iio/events.h>
>> +
>> +/* slave address 0x19 for PS of 7 bit addressing protocol for I2C *=
/
> consistently start comments with uppercase letter
>=20

I use uppercase letter starting comments.

>> +#define CM36651_I2C_ADDR_PS	0x19
>=20
> interesting, the chip seems to have two i2c addresses, the other one =
is=20
> 0x18
>=20
> is this really one chip? an option would be to do two drivers: one fo=
r=20
> ALS, one for proximity
>

CM36651 is one chip. I have checked it. CM36651 apply slave address 0x1=
8 for CS and 0x19 for PS of 7 bit addressing protocol for I2C. CM36651 =
contains are 8-bit command register following each of slave address. Al=
l operations can ve contrroled by the command register.
=20
>> +
>> +/* Ambient light sensor */
>> +#define CS_CONF1	0x00
>> +#define CS_CONF2	0x01
>> +#define CS_CONF3	0x06
>> +
>> +#define RED		0x00
>> +#define GREEN		0x01
>> +#define BLUE		0x02
>> +#define WHITE		0x03
>> +
>> +/* Proximity sensor */
>> +#define PS_CONF1	0x00
>> +#define PS_THD		0x01
>> +#define PS_CANC		0x02
>> +#define PS_CONF2	0x03
>> +
>> +#define ALS_REG_NUM	3
>> +#define PS_REG_NUM	4
>> +#define ALS_CHANNEL_NUM	4
>> +#define INITIAL_THD	0x09
>> +#define SCAN_MODE_LIGHT	0
>> +#define SCAN_MODE_PROX	1
>> +
>> +enum {
>> +	CM36651_LIGHT_EN,
>> +	CM36651_PROXIMITY_EN,
>> +	CM36651_PROXIMITY_EV_EN,
>> +};
>> +
>> +enum cm36651_cmd {
>> +	CM36651_CMD_READ_RAW_LIGHT,
>> +	CM36651_CMD_READ_RAW_PROXIMITY,
>> +	CM36651_CMD_PROX_EV_EN,
>> +	CM36651_CMD_PROX_EV_DIS,
>> +};
>> +
>> +enum {
>> +	CM36651_CLOSE_PROXIMITY,
>> +	CM36651_FAR_PROXIMITY,
>> +};
>> +
>> +/* register settings */
>> +static const u8 als_reg_setting[ALS_REG_NUM][2] =3D {
>> +	{ 0x00, 0x04 },	/* CS_CONF1 */
>=20
> use your #defines instead of a comment, e.g. { CS_CONF1, 0x04 }=20
>=20
> what are the magic constants 0x04, 0x08?
>=20

I'll use #defines instedad of a comment next version.=20
And magic constants(e.g. 0x04, 0x08) will be made to #defines also.

>> +	{ 0x01, 0x08 },	/* CS_CONF2 */
>> +	{ 0x06, 0x00 }	/* CS_CONF3 */
>> +};
>> +
>> +static const u8 ps_reg_setting[PS_REG_NUM][2] =3D {
>> +	{ 0x00, 0x3C },	/* PS_CONF1 */
>> +	{ 0x01, 0x09 },	/* PS_THD */
>> +	{ 0x02, 0x00 },	/* PS_CANC */
>> +	{ 0x03, 0x13 },	/* PS_CONF2 */
>> +};
>> +
>> +struct cm36651_data {
>> +	const struct cm36651_platform_data *pdata;
>> +	struct i2c_client *client;
>> +	struct i2c_client *ps_client;
>> +	struct mutex lock;
>> +	struct regulator *vled_reg;
>> +	unsigned long flags;
>> +	u8 thres;
>> +	u16 color[4];
>> +};
>> +
>> +int cm36651_i2c_read_byte(struct i2c_client *client, u8 *val)
>> +{
>> +	int ret =3D 0;
>> +	struct i2c_msg msg[1];
>> +
>> +	if (!client->adapter)
>> +		return -ENODEV;
>> +
>> +	/* send slave address & command */
>> +	msg->addr =3D client->addr;
>> +	msg->flags =3D I2C_M_RD;
>> +	msg->len =3D 1;
>> +	msg->buf =3D val;
>> +
>> +	ret =3D i2c_transfer(client->adapter, msg, 1);
>> +	if (ret !=3D 1) {
>> +		dev_err(&client->dev, "i2c transfer error ret: %d\n", ret);
>> +		ret =3D -EIO;
>> +	}
>> +
>> +	return ret;
>> +}
>=20
> use i2c_smbus_read_byte_data() instead?
>=20

I'll try use i2c_smbus_* API at next patch.

>> +
>> +int cm36651_i2c_read_word(struct i2c_client *client, u8 command, u1=
6 *val)
>> +{
>> +	int ret =3D 0;
>> +	struct i2c_msg msg[2];
>> +	unsigned char data[2] =3D { 0, };
>> +
>> +	if (!client->adapter)
>> +		return -ENODEV;
>> +
>> +	/* send slave address & command */
>> +	msg[0].addr =3D client->addr;
>> +	msg[0].flags =3D 0;
>> +	msg[0].len =3D 1;
>> +	msg[0].buf =3D &command;
>> +
>> +	/* read word data */
>> +	msg[1].addr =3D client->addr;
>> +	msg[1].flags =3D I2C_M_RD;
>> +	msg[1].len =3D 2;
>> +	msg[1].buf =3D data;
>> +
>> +	ret =3D i2c_transfer(client->adapter, msg, 2);
>> +	if (ret !=3D 2) {
>> +		dev_err(&client->dev, "i2c transfer error ret: %d\n", ret);
>> +		ret =3D -EIO;
>> +	}
>> +	*val =3D le16_to_cpup((__le16 *)data);
>> +
>> +	return ret;
>> +}
>=20
> use i2c_smbus_read_word_data() instead?
>=20
>> +
>> +int cm36651_i2c_write_byte(struct i2c_client *client, u8 command, u=
8 val)
>> +{
>> +	int ret;
>> +	struct i2c_msg msg[1];
>> +	unsigned char data[2] =3D { command, val };
>> +
>> +	if (!client->adapter)
>> +		return -ENODEV;
>> +
>> +	/* send slave address & command */
>> +	msg->addr =3D client->addr;
>> +	msg->flags =3D 0;
>> +	msg->len =3D 2;
>> +	msg->buf =3D data;
>> +
>> +	ret =3D i2c_transfer(client->adapter, msg, 1);
>> +	if (ret !=3D 1) {
>> +		dev_err(&client->dev, "i2c transfer error ret: %d\n", ret);
>> +		ret =3D -EIO;
>> +	}
>> +
>> +	return ret;
>> +}
>=20
> use i2c_smbus_write_byte_data() instead?
>=20
>> +
>> +static int cm36651_setup_reg(struct cm36651_data *cm36651)
>> +{
>> +	struct i2c_client *client =3D cm36651->client;
>> +	int ret =3D 0, i =3D 0;
>=20
> no need to initialize ret, tmp and i
>=20

I'll fix on your comment.

>> +	u8 tmp =3D 0;
>> +
>> +	/* ALS initialization */
>> +	for (i =3D 0; i < ALS_REG_NUM; i++) {
>> +		ret =3D cm36651_i2c_write_byte(client,
>> +			als_reg_setting[i][0], als_reg_setting[i][1]);
>> +		if (ret < 0)
>> +			goto err_setup_reg;
>> +	}
>> +
>> +	/* PS initialization */
>> +	for (i =3D 0; i < PS_REG_NUM; i++) {
>> +		ret =3D cm36651_i2c_write_byte(cm36651->ps_client,
>> +			ps_reg_setting[i][0], ps_reg_setting[i][1]);
>> +		if (ret < 0)
>> +			goto err_setup_reg;
>> +	}
>> +
>> +	ret =3D cm36651_i2c_read_byte(cm36651->ps_client, &tmp);
>> +	if (ret < 0)
>> +		goto err_setup_reg;
>> +
>> +	/* printing the initial proximity value with no contact */
>> +	dev_dbg(&client->dev, "initial proximity value: %d\n", tmp);
>> +
>> +	/* device turn off */
>> +	ret =3D cm36651_i2c_write_byte(client, CS_CONF1, 0x01);
>=20
> use a #define for 0x01 to describe function
>=20

OK. I'll use a #define for 0x01 to describe function.

>> +	if (ret < 0)
>> +		goto err_setup_reg;
>> +
>> +	ret =3D cm36651_i2c_write_byte(cm36651->ps_client, PS_CONF1, 0x01)=
;
>> +	if (ret < 0)
>> +		goto err_setup_reg;
>> +
>> +	return 0;
>> +
>> +err_setup_reg:
>> +	dev_err(&client->dev, "cm36651_setup_reg() failed: %d\n", ret);
>> +	return ret;
>> +}
>> +
>> +static int cm36651_read_output(struct cm36651_data *cm36651,
>> +						int scan_index, int *val)
>> +{
>=20
> val is not used?
>=20

I'll check it, and then fix.

>> +	struct i2c_client *client =3D cm36651->client;
>> +	int i;
>> +	int ret =3D -EINVAL;
>> +	u8 prox_val;
>> +
>> +	switch (scan_index) {
>> +	case SCAN_MODE_LIGHT:
>> +		for (i =3D 0; i < ALS_CHANNEL_NUM; i++) {
>> +			ret =3D cm36651_i2c_read_word(client, i,
>> +						&cm36651->color[i]);
>=20
> I think this is wrong: i is 0,1,2,3,4 but CS_CONF1, CS_CONF2 is 0, 1 =
as=20
> well -- so the config registers are read here?
>=20
> the channel data (red,green,blue,clear) is at addresses 0x02 .. 0x05
> (according to=20
> https://github.com/mozilla-b2g/kernel-android-galaxy-s2-ics/blob/mast=
er/drivers/sensor/cm36651.c)
>=20

i is 0, 1, 2, 3. Also in above link, you can refer to loghtsensor_lux_s=
how and cm36641_work_func_light function, cm36651_i2c_read_word functio=
n need to cm36651_data struct,
address, command, and val data. Where, color Macros(RED, GREEN, BLUE, W=
HITE) are command data. Not address. Address is fixed on CM36651_ALS Ma=
cro.
And then, ALS_WH_M, ... ALS_WL_L(0x02...0x05) registers like below:

ALS_WH_M 0x02 ALS High Threshold Window setting	[15:8]
ALS_WH_L 0x03 ALS High Threshold Whndow setting	[7:0]
=2E..
ALS_WL_M 0x05 ALS Low Threshold Window setting 	[7:0]

>> +			if (ret < 0)
>> +				goto read_err;
>> +		}
>> +
>> +		dev_dbg(&client->dev, "red: %d, green: %d, blue: %d, white: %d\n"=
,
>> +				cm36651->color[0] + 1, cm36651->color[1] + 1,
>> +				cm36651->color[2] + 1, cm36651->color[3] + 1);
>> +
>> +		ret =3D cm36651_i2c_write_byte(client, CS_CONF1, 0x01);
>=20
> what does this do?
>=20

Above code is light sensor disable setting.

>> +		if (ret < 0)
>> +			goto write_err;
>> +
>> +		break;
>> +	case SCAN_MODE_PROX:
>> +		ret =3D cm36651_i2c_read_byte(cm36651->ps_client, &prox_val);
>> +		if (ret < 0)
>> +			goto read_err;
>> +
>> +		dev_dbg(&client->dev, "proximity value: %d\n", prox_val);
>=20
> prox_val is not returned?
>
=20
I'll check and fix at next version patch.

>> +
>> +		ret =3D cm36651_i2c_write_byte(cm36651->ps_client,
>> +							PS_CONF1, 0x01);
>> +		if (ret < 0)
>> +			goto write_err;
>> +
>> +		break;
>> +	}
>> +
>> +	return ret;
>> +
>> +read_err:
>> +	dev_err(&client->dev, "register read failed\n");
>> +	return ret;
>> +
>> +write_err:
>> +	dev_err(&client->dev, "register write failed\n");
>> +	return ret;
>> +}
>> +
>> +static irqreturn_t cm36651_irq_handler(int irq, void *data)
>> +{
>> +	struct iio_dev *indio_dev =3D data;
>> +	struct cm36651_data *cm36651 =3D iio_priv(indio_dev);
>> +	struct i2c_client *client =3D cm36651->client;
>> +	int ev_dir, val, ret;
>> +	u64 ev_code;
>> +	u8 tmp;
>> +
>=20
> tmp must be initialized with the command?
>=20

I'll fix it on your advice.

>> +	ret =3D cm36651_i2c_read_byte(cm36651->ps_client, &tmp);
>> +	if (ret < 0) {
>> +		dev_err(&client->dev,
>> +				"%s: data read failed: %d\n", __func__, ret);
>> +		return IRQ_NONE;
>=20
> should always return IRQ_HANDLED
>

I'll fix it on your advice.
=20
>> +	}
>> +
>> +	if (tmp < ps_reg_setting[1][1]) {
>> +		ev_dir =3D IIO_EV_DIR_RISING;
>> +		val =3D CM36651_FAR_PROXIMITY;
>> +	} else {
>> +		ev_dir =3D IIO_EV_DIR_FALLING;
>> +		val =3D CM36651_CLOSE_PROXIMITY;
>> +	}
>> +
>> +	ev_code =3D IIO_UNMOD_EVENT_CODE(IIO_PROXIMITY,
>> +				CM36651_CMD_READ_RAW_PROXIMITY,
>> +				IIO_EV_TYPE_THRESH, ev_dir);
>> +
>> +	iio_push_event(indio_dev, ev_code, iio_get_time_ns());
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int cm36651_set_operation_mode(struct cm36651_data *cm36651,
>> +						enum cm36651_cmd cmd)
>> +{
>> +	struct i2c_client *client =3D cm36651->client;
>> +	int ret =3D 0;
>> +	int i;
>> +
>> +	switch (cmd) {
>> +	case CM36651_CMD_READ_RAW_LIGHT:
>> +		ret =3D cm36651_i2c_write_byte(client, CS_CONF1, 0x04);
>> +		break;
>> +	case CM36651_CMD_READ_RAW_PROXIMITY:
>> +		ret =3D cm36651_i2c_write_byte(cm36651->ps_client,
>> +							PS_CONF1, 0x3C);
>> +		break;
>> +	case CM36651_CMD_PROX_EV_EN:
>> +		if (test_bit(CM36651_PROXIMITY_EV_EN, &cm36651->flags)) {
>> +			dev_err(&client->dev,
>> +				"Already proximity event enable state\n");
>> +			return ret;
>> +		}
>> +		set_bit(CM36651_PROXIMITY_EV_EN, &cm36651->flags);
>> +		for (i =3D 0; i < 4; i++) {
>> +			ret =3D cm36651_i2c_write_byte(cm36651->ps_client,
>> +				ps_reg_setting[i][0], ps_reg_setting[i][1]);
>> +			if (ret < 0)
>> +				goto write_err;
>> +		}
>> +		enable_irq(client->irq);
>> +		break;
>> +	case CM36651_CMD_PROX_EV_DIS:
>> +		if (!test_bit(CM36651_PROXIMITY_EV_EN, &cm36651->flags)) {
>> +			dev_err(&client->dev,
>> +				"Already proximity event disable state\n");
>> +			return ret;
>> +		}
>> +		clear_bit(CM36651_PROXIMITY_EV_EN, &cm36651->flags);
>> +		disable_irq(client->irq);
>> +		ret =3D cm36651_i2c_write_byte(cm36651->ps_client,
>> +							PS_CONF1, 0x01);
>> +		break;
>> +	}
>> +
>> +	if (ret < 0)
>> +		dev_err(&client->dev, "write register failed\n");
>> +
>> +	return ret;
>> +
>> +write_err:
>> +	dev_err(&client->dev, "proximity event toe enable is failed\n");
>=20
> typo: toe; rephase
>=20

I have fixed on correct typo.

>> +	return ret;
>> +}
>> +
>> +static int cm36651_read_channel(struct cm36651_data *cm36651,
>> +				struct iio_chan_spec const *chan, int *val)
>> +{
>> +	struct i2c_client *client =3D cm36651->client;
>> +	enum cm36651_cmd cmd =3D 0;
>> +	int ret;
>> +
>> +	if (chan->scan_index =3D=3D SCAN_MODE_LIGHT)
>> +		cmd =3D CM36651_CMD_READ_RAW_LIGHT;
>> +	else /* SCAN_MODE_PROX */
>> +		cmd =3D CM36651_CMD_READ_RAW_PROXIMITY;
>> +
>> +	ret =3D cm36651_set_operation_mode(cm36651, cmd);
>> +	if (ret < 0) {
>> +		dev_err(&client->dev, "cm36651 set operation mode failed\n");
>> +		return ret;
>> +	}
>> +	/* raw data integration time */
>> +	msleep(50);
>> +	ret =3D cm36651_read_output(cm36651, chan->scan_index, val);
>=20
> _read_output() does not return data in val!
>=20

OK. I'll fix it.

>> +	if (ret < 0) {
>> +		dev_err(&client->dev, "cm36651 read output failed\n");
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int cm36651_read_raw(struct iio_dev *indio_dev,
>> +			    struct iio_chan_spec const *chan,
>> +			    int *val, int *val2, long mask)
>> +{
>> +	struct cm36651_data *cm36651 =3D iio_priv(indio_dev);
>> +	int ret =3D -EINVAL;
>> +
>> +	mutex_lock(&cm36651->lock);
>> +
>> +	switch (mask) {
>> +	case IIO_CHAN_INFO_RAW:
>> +		ret =3D cm36651_read_channel(cm36651, chan, val);
>> +		break;
>> +	}
>> +	mutex_unlock(&cm36651->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int cm36651_read_thresh(struct iio_dev *indio_dev,
>> +					u64 event_code, int *val)
>> +{
>> +	struct cm36651_data *cm36651 =3D iio_priv(indio_dev);
>> +	int chan_type =3D IIO_EVENT_CODE_EXTRACT_CHAN_TYPE(event_code);
>> +	int event_type =3D IIO_EVENT_CODE_EXTRACT_TYPE(event_code);
>> +
>> +	if (event_type !=3D IIO_EV_TYPE_THRESH ||	chan_type !=3D IIO_PROXI=
MITY)
>> +		return -EINVAL;
>> +
>> +	if (!cm36651->thres)
>> +		*val =3D ps_reg_setting[1][1]; /* initial threshold value */
>> +	else
>> +		*val =3D cm36651->thres;
>> +
>> +	return 0;
>> +}
>> +
>> +static int cm36651_write_thresh(struct iio_dev *indio_dev,
>> +					u64 event_code, int val)
>> +{
>> +	struct cm36651_data *cm36651 =3D iio_priv(indio_dev);
>> +	struct i2c_client *client =3D cm36651->client;
>> +	int ret;
>> +
>> +	cm36651->thres =3D val;
>> +	ret =3D cm36651_i2c_write_byte(cm36651->ps_client,
>> +					PS_THD, cm36651->thres);
>> +
>> +	if (ret < 0) {
>> +		dev_err(&client->dev, "PS register read faied: %d\n", ret);
>> +		return ret;
>> +	}
>> +	dev_dbg(&client->dev, "new threshold is 0x%x\n", cm36651->thres);
>> +
>> +	return 0;
>> +}
>> +
>> +static int cm36651_write_event_config(struct iio_dev *indio_dev,
>> +					u64 event_code, int state)
>> +{
>> +	struct cm36651_data *cm36651 =3D iio_priv(indio_dev);
>> +	enum cm36651_cmd cmd;
>> +	int chan_type =3D IIO_EVENT_CODE_EXTRACT_CHAN_TYPE(event_code);
>> +	int ret =3D -EINVAL;
>> +
>> +	mutex_lock(&cm36651->lock);
>> +
>> +	if (chan_type =3D=3D IIO_PROXIMITY) {
>> +		cmd =3D state ? CM36651_CMD_PROX_EV_EN : CM36651_CMD_PROX_EV_DIS;
>> +		ret =3D cm36651_set_operation_mode(cm36651, cmd);
>> +	}
>> +
>> +	mutex_unlock(&cm36651->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int cm36651_read_event_config(struct iio_dev *indio_dev, u64
>> event_code)
>> +{
>> +	struct cm36651_data *cm36651 =3D iio_priv(indio_dev);
>> +	int chan_type =3D IIO_EVENT_CODE_EXTRACT_CHAN_TYPE(event_code);
>> +	int event_en =3D -EINVAL;
>> +
>> +	mutex_lock(&cm36651->lock);
>> +
>> +	if (chan_type =3D=3D IIO_PROXIMITY)
>> +		event_en =3D test_bit(CM36651_PROXIMITY_EV_EN, &cm36651->flags);
>> +
>> +	mutex_unlock(&cm36651->lock);
>> +
>> +	return event_en;
>> +}
>> +
>> +static const struct iio_chan_spec cm36651_channels[] =3D {
>> +	{
>> +		.type =3D IIO_LIGHT,
>> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),
>> +		.scan_type =3D {
>> +			.sign =3D 'u',
>> +			.realbits =3D 16,
>> +			.shift =3D 0,
>> +			.storagebits =3D 16,
>> +		},
>> +		.scan_index =3D SCAN_MODE_LIGHT
>> +	},
>> +	{
>> +		.type =3D IIO_PROXIMITY,
>> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),
>> +		.scan_type =3D {
>> +			.sign =3D 'u',
>> +			.realbits =3D 8,
>> +			.shift =3D 0,
>> +			.storagebits =3D 8,
>> +		},
>> +		.scan_index =3D SCAN_MODE_PROX,
>> +		.event_mask =3D IIO_EV_BIT(IIO_EV_TYPE_THRESH, IIO_EV_DIR_EITHER)
>> +	},
>> +};
>> +
>> +static const struct iio_info cm36651_info =3D {
>> +	.driver_module		=3D THIS_MODULE,
>> +	.read_raw		=3D &cm36651_read_raw,
>> +	.read_event_value	=3D &cm36651_read_thresh,
>> +	.write_event_value	=3D &cm36651_write_thresh,
>> +	.read_event_config	=3D &cm36651_read_event_config,
>> +	.write_event_config	=3D &cm36651_write_event_config,
>> +};
>> +
>> +static int cm36651_probe(struct i2c_client *client,
>> +			     const struct i2c_device_id *id)
>> +{
>> +	struct cm36651_data *cm36651;
>> +	struct iio_dev *indio_dev;
>> +	unsigned long irqflag;
>> +	int ret;
>> +
>> +	dev_dbg(&client->dev, "cm36651 light/proxymity sensor probe\n");
>> +
>> +	indio_dev =3D devm_iio_device_alloc(&client->dev, sizeof(*cm36651)=
);
>> +	if (!indio_dev)
>> +		return -ENOMEM;
>> +
>> +	cm36651 =3D iio_priv(indio_dev);
>> +
>> +	cm36651->vled_reg =3D devm_regulator_get(&client->dev, "vled");
>> +	if (IS_ERR(cm36651->vled_reg)) {
>> +		dev_err(&client->dev, "get regulator vled failed\n");
>> +		return PTR_ERR(cm36651->vled_reg);
>> +	}
>> +
>> +	ret =3D regulator_enable(cm36651->vled_reg);
>> +	if (ret) {
>> +		dev_err(&client->dev, "enable regulator failed\n");
>> +		return ret;
>> +	}
>> +
>> +	i2c_set_clientdata(client, indio_dev);
>> +
>> +	cm36651->client =3D client;
>> +	cm36651->ps_client =3D i2c_new_dummy(client->adapter,
>> +						CM36651_I2C_ADDR_PS);
>> +	mutex_init(&cm36651->lock);
>> +	indio_dev->dev.parent =3D &client->dev;
>> +	indio_dev->channels =3D cm36651_channels;
>> +	indio_dev->num_channels =3D ARRAY_SIZE(cm36651_channels);
>> +	indio_dev->info =3D &cm36651_info;
>> +	indio_dev->name =3D id->name;
>> +	indio_dev->modes =3D INDIO_DIRECT_MODE;
>> +
>> +	ret =3D cm36651_setup_reg(cm36651);
>> +
>> +	irqflag =3D IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONES=
HOT;
>=20
> rising and falling?
>=20

There are distance from sensor device. Rising is far from device. on th=
e contrary to this Falling is close from device.

>> +	ret =3D request_threaded_irq(client->irq, NULL, cm36651_irq_handle=
r,
>> +				irqflag, "cm36651_proximity", indio_dev);
>> +	if (ret) {
>> +		dev_err(&client->dev, "%s: request irq failed\n", __func__);
>> +		return ret;
>> +	}
>> +	disable_irq(client->irq);
>> +
>> +	ret =3D iio_device_register(indio_dev);
>> +	if (ret) {
>> +		regulator_disable(cm36651->vled_reg);
>=20
> irq not freed
>=20

It will be fixed.

>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int cm36651_remove(struct i2c_client *client)
>> +{
>> +	struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>> +	struct cm36651_data *cm36651 =3D iio_priv(indio_dev);
>> +
>> +	iio_device_unregister(indio_dev);
>> +	regulator_disable(cm36651->vled_reg);
>> +	free_irq(client->irq, indio_dev);
>> +	iio_device_free(indio_dev);
>=20
> iio_device_free() not needed since using devm_iio_device_alloc()
>=20

It will be fixed.

>> +
>> +	return 0;
>> +}
>> +
>> +static const struct i2c_device_id cm36651_id[] =3D {
>> +	{ "cm36651", 0 },
>> +	{ }
>> +};
>> +
>> +MODULE_DEVICE_TABLE(i2c, cm36651_id);
>> +
>> +static const struct of_device_id cm36651_of_match[] =3D {
>> +	{ .compatible =3D "capella,cm36651" },
>> +	{ }
>> +};
>> +
>> +static struct i2c_driver cm36651_driver =3D {
>> +	.driver =3D {
>> +		.name	=3D "cm36651",
>> +		.of_match_table =3D of_match_ptr(cm36651_of_match),
>> +		.owner	=3D THIS_MODULE,
>> +	},
>> +	.probe		=3D cm36651_probe,
>> +	.remove		=3D cm36651_remove,
>> +	.id_table	=3D cm36651_id,
>> +};
>> +
>> +module_i2c_driver(cm36651_driver);
>> +
>> +MODULE_AUTHOR("Beomho Seo <beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>");
>> +MODULE_DESCRIPTION("CM36651 proximity/ambient light sensor driver")=
;
>> +MODULE_LICENSE("GPL v2");
>>
>=20

I will fix and send v2 patch soon.

Best regards,
Beomho Seo

--=20
Beomho Seo, Assistant Engineer
System S/W Lab., S/W Platform Team, Software Center
Samsung Electronics
