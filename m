From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH V7 2/2] iio: accell: mma8452: add vdd/vddio regulator
 operation support
Date: Sat, 12 Jan 2019 19:11:11 +0000
Message-ID: <20190112191111.4909e254@archlinux>
References: <1546938556-26969-1-git-send-email-Anson.Huang@nxp.com>
        <1546938556-26969-2-git-send-email-Anson.Huang@nxp.com>
        <84c2971b-29d5-a0d0-c830-11504c381dd2@posteo.de>
        <4CB70D1B-06A6-4E34-B701-58E72B1AC9D9@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4CB70D1B-06A6-4E34-B701-58E72B1AC9D9@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: Martin Kepplinger <martink@posteo.de>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gustavo@embeddedor.com" <gustavo@embeddedor.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Leonard Crestez <leonard.crestez@nxp.com>, "rtresidd@electromag.com.au" <rtresidd@electromag.com.au>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, 8 Jan 2019 14:48:48 +0000
Anson Huang <anson.huang@nxp.com> wrote:

> Hi, Martin
>=20
> From Anson's iPhone 6
>=20
>=20
> > =E5=9C=A8 2019=E5=B9=B41=E6=9C=888=E6=97=A5=EF=BC=8C19:41=EF=BC=8CMarti=
n Kepplinger <martink@posteo.de> =E5=86=99=E9=81=93=EF=BC=9A
> >  =20
> >> On 08.01.19 10:14, Anson Huang wrote:
> >> The accelerometer's power supply could be controllable on some
> >> platforms, such as i.MX6Q-SABRESD board, the mma8451's power supplies
> >> are controlled by a GPIO fixed regulator, need to make sure the
> >> regulators are enabled before any communication with mma8451, this
> >> patch adds vdd/vddio regulator operation support.
> >>=20
> >> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> >> Acked-by: Martin Kepplinger <martink@posteo.de>
> >> ---
> >> ChangeLog Since V6:
> >>  - separate the error handling of regulators get to make code easy to =
read.
> >> ---
> >> drivers/iio/accel/mma8452.c | 105 ++++++++++++++++++++++++++++++++++--=
--------
> >> 1 file changed, 83 insertions(+), 22 deletions(-)
> >>=20
> >> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> >> index 421a0a8..3027811 100644
> >> --- a/drivers/iio/accel/mma8452.c
> >> +++ b/drivers/iio/accel/mma8452.c
> >> @@ -31,6 +31,7 @@
> >> #include <linux/of_device.h>
> >> #include <linux/of_irq.h>
> >> #include <linux/pm_runtime.h>
> >> +#include <linux/regulator/consumer.h>
> >>=20
> >> #define MMA8452_STATUS                0x00
> >> #define  MMA8452_STATUS_DRDY            (BIT(2) | BIT(1) | BIT(0))
> >> @@ -107,6 +108,8 @@ struct mma8452_data {
> >>    u8 data_cfg;
> >>    const struct mma_chip_info *chip_info;
> >>    int sleep_val;
> >> +    struct regulator *vdd_reg;
> >> +    struct regulator *vddio_reg;
> >> };
> >>=20
> >>  /**
> >> @@ -1534,9 +1537,39 @@ static int mma8452_probe(struct i2c_client *cli=
ent,
> >>    mutex_init(&data->lock);
> >>    data->chip_info =3D match->data;
> >>=20
> >> +    data->vdd_reg =3D devm_regulator_get(&client->dev, "vdd");
> >> +    if (IS_ERR(data->vdd_reg)) {
> >> +        if (PTR_ERR(data->vdd_reg) =3D=3D -EPROBE_DEFER)
> >> +            return -EPROBE_DEFER;
> >> +
> >> +        dev_err(&client->dev, "failed to get VDD regulator!\n");
> >> +        return PTR_ERR(data->vdd_reg);
> >> +    }
> >> +
> >> +    data->vddio_reg =3D devm_regulator_get(&client->dev, "vddio");
> >> +    if (IS_ERR(data->vddio_reg)) {
> >> +        if (PTR_ERR(data->vddio_reg) =3D=3D -EPROBE_DEFER)
> >> +            return -EPROBE_DEFER;
> >> +
> >> +        dev_err(&client->dev, "failed to get VDDIO regulator!\n");
> >> +        return PTR_ERR(data->vddio_reg);
> >> +    }
> >> +
> >> +    ret =3D regulator_enable(data->vdd_reg);
> >> +    if (ret) {
> >> +        dev_err(&client->dev, "failed to enable VDD regulator!\n");
> >> +        return ret;
> >> +    }
> >> +
> >> +    ret =3D regulator_enable(data->vddio_reg);
> >> +    if (ret) {
> >> +        dev_err(&client->dev, "failed to enable VDDIO regulator!\n");
> >> +        goto disable_regulator_vdd;
> >> +    }
> >> +
> >>    ret =3D i2c_smbus_read_byte_data(client, MMA8452_WHO_AM_I);
> >>    if (ret < 0)
> >> -        return ret;
> >> +        goto disable_regulators;
> >>=20
> >>    switch (ret) {
> >>    case MMA8451_DEVICE_ID:
> >> @@ -1549,7 +1582,8 @@ static int mma8452_probe(struct i2c_client *clie=
nt,
> >>            break;
> >>        /* else: fall through */
> >>    default:
> >> -        return -ENODEV;
> >> +        ret =3D -ENODEV;
> >> +        goto disable_regulators;
> >>    }
> >>=20
> >>    dev_info(&client->dev, "registering %s accelerometer; ID 0x%x\n",
> >> @@ -1566,13 +1600,13 @@ static int mma8452_probe(struct i2c_client *cl=
ient,
> >>=20
> >>    ret =3D mma8452_reset(client);
> >>    if (ret < 0)
> >> -        return ret;
> >> +        goto disable_regulators;
> >>=20
> >>    data->data_cfg =3D MMA8452_DATA_CFG_FS_2G;
> >>    ret =3D i2c_smbus_write_byte_data(client, MMA8452_DATA_CFG,
> >>                    data->data_cfg);
> >>    if (ret < 0)
> >> -        return ret;
> >> +        goto disable_regulators;
> >>=20
> >>    /*
> >>     * By default set transient threshold to max to avoid events if
> >> @@ -1581,7 +1615,7 @@ static int mma8452_probe(struct i2c_client *clie=
nt,
> >>    ret =3D i2c_smbus_write_byte_data(client, MMA8452_TRANSIENT_THS,
> >>                    MMA8452_TRANSIENT_THS_MASK);
> >>    if (ret < 0)
> >> -        return ret;
> >> +        goto disable_regulators;
> >>=20
> >>    if (client->irq) {
> >>        int irq2;
> >> @@ -1595,7 +1629,7 @@ static int mma8452_probe(struct i2c_client *clie=
nt,
> >>                        MMA8452_CTRL_REG5,
> >>                        data->chip_info->all_events);
> >>            if (ret < 0)
> >> -                return ret;
> >> +                goto disable_regulators;
> >>=20
> >>            dev_dbg(&client->dev, "using interrupt line INT1\n");
> >>        }
> >> @@ -1604,11 +1638,11 @@ static int mma8452_probe(struct i2c_client *cl=
ient,
> >>                    MMA8452_CTRL_REG4,
> >>                    data->chip_info->enabled_events);
> >>        if (ret < 0)
> >> -            return ret;
> >> +            goto disable_regulators;
> >>=20
> >>        ret =3D mma8452_trigger_setup(indio_dev);
> >>        if (ret < 0)
> >> -            return ret;
> >> +            goto disable_regulators;
> >>    }
> >>=20
> >>    data->ctrl_reg1 =3D MMA8452_CTRL_ACTIVE |
> >> @@ -1661,12 +1695,19 @@ static int mma8452_probe(struct i2c_client *cl=
ient,
> >> trigger_cleanup:
> >>    mma8452_trigger_cleanup(indio_dev);
> >>=20
> >> +disable_regulators:
> >> +    regulator_disable(data->vddio_reg);
> >> +
> >> +disable_regulator_vdd:
> >> +    regulator_disable(data->vdd_reg);
> >> +
> >>    return ret;
> >> }
> >>=20
> >> static int mma8452_remove(struct i2c_client *client)
> >> {
> >>    struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
> >> +    struct mma8452_data *data =3D iio_priv(indio_dev);
> >>=20
> >>    iio_device_unregister(indio_dev);
> >>=20
> >> @@ -1678,6 +1719,9 @@ static int mma8452_remove(struct i2c_client *cli=
ent)
> >>    mma8452_trigger_cleanup(indio_dev);
> >>    mma8452_standby(iio_priv(indio_dev));
> >>=20
> >> +    regulator_disable(data->vddio_reg);
> >> +    regulator_disable(data->vdd_reg);
> >> +
> >>    return 0;
> >> }
> >>=20
> >> @@ -1696,6 +1740,18 @@ static int mma8452_runtime_suspend(struct devic=
e *dev)
> >>        return -EAGAIN;
> >>    }
> >>=20
> >> +    ret =3D regulator_disable(data->vddio_reg);
> >> +    if (ret) {
> >> +        dev_err(dev, "failed to disable VDDIO regulator\n");
> >> +        return ret;
> >> +    }
> >> +
> >> +    ret =3D regulator_disable(data->vdd_reg);
> >> +    if (ret) {
> >> +        dev_err(dev, "failed to disable VDD regulator\n");
> >> +        return ret;
> >> +    }
> >> +
> >>    return 0;
> >> }
> >>=20
> >> @@ -1705,9 +1761,22 @@ static int mma8452_runtime_resume(struct device=
 *dev)
> >>    struct mma8452_data *data =3D iio_priv(indio_dev);
> >>    int ret, sleep_val;
> >>=20
> >> +    ret =3D regulator_enable(data->vdd_reg);
> >> +    if (ret) {
> >> +        dev_err(dev, "failed to enable VDD regulator\n");
> >> +        return ret;
> >> +    }
> >> +
> >> +    ret =3D regulator_enable(data->vddio_reg);
> >> +    if (ret) {
> >> +        dev_err(dev, "failed to enable VDDIO regulator\n");
> >> +        regulator_disable(data->vdd_reg);
> >> +        return ret;
> >> +    }
> >> +
> >>    ret =3D mma8452_active(data);
> >>    if (ret < 0)
> >> -        return ret;
> >> +        goto runtime_resume_failed;
> >>=20
> >>    ret =3D mma8452_get_odr_index(data);
> >>    sleep_val =3D 1000 / mma8452_samp_freq[ret][0];
> >> @@ -1717,25 +1786,17 @@ static int mma8452_runtime_resume(struct devic=
e *dev)
> >>        msleep_interruptible(sleep_val);
> >>=20
> >>    return 0;
> >> -}
> >> -#endif
> >>=20
> >> -#ifdef CONFIG_PM_SLEEP
> >> -static int mma8452_suspend(struct device *dev)
> >> -{
> >> -    return mma8452_standby(iio_priv(i2c_get_clientdata(
> >> -        to_i2c_client(dev))));
> >> -}
> >> +runtime_resume_failed:
> >> +    regulator_disable(data->vddio_reg);
> >> +    regulator_disable(data->vdd_reg);
> >>=20
> >> -static int mma8452_resume(struct device *dev)
> >> -{
> >> -    return mma8452_active(iio_priv(i2c_get_clientdata(
> >> -        to_i2c_client(dev))));
> >> +    return ret;
> >> }
> >> #endif
> >>=20
> >> static const struct dev_pm_ops mma8452_pm_ops =3D {
> >> -    SET_SYSTEM_SLEEP_PM_OPS(mma8452_suspend, mma8452_resume)
> >> +    SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_forc=
e_resume) =20
> >=20
> > Just a quesion: Isn't it semantically a different change to replace
> > mma8452_suspend() and mma8452_resume()? If not, why is it needed here?
> >=20
> > other than that, lgtm. =20
>=20
> It is because with regulator operation added, before system suspend, driv=
er is in runtime suspend already, the suspend/resume callback need to deal =
with regulator again including error handling etc., and also need to disabl=
e runtime pm and re-enable it etc., this introduces too many complicated co=
de/logic, also, the things suspend/resume callback does are actually same a=
s runtime suspend/ resume, so just using pm_runtime_force_suspend/resume ca=
n save these duplicated operations and make code easy/clean.
>=20
Anson, please wrap below 80 chars.  Some of us have old old old
laptops, (though I admit I still have more than 80 chars ;)

I 'think' Anson is correct that these end up running the same
code, but with considerably less complexity an this is
the reason the force functions exist.  Often the runtime case
is very similar to the full pm case so you can avoid the whole
runtime resume then suspend dance by doing this.

Anyhow I've applied it to the togreg branch of iio.git and pushed
it out as testing.  Hopefully we haven't missed any corner
cases.

Runtime PM always gives me a headache when I dig into exactly
what the various dances are that go on.

Thanks

Jonathan
> Anson.
>=20
>=20
>=20
>=20
> >  =20
> >>    SET_RUNTIME_PM_OPS(mma8452_runtime_suspend,
> >>               mma8452_runtime_resume, NULL)
> >> };
> >>  =20
> >  =20
