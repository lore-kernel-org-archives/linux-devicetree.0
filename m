From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 9/9] iio: magnetometer: hmc5843: add mount matrix support
Date: Wed, 20 Feb 2019 17:24:39 +0100
Message-ID: <A7BB4D99-1792-4BFB-8D9D-F8EFC1D1B692@goldelico.com>
References: <cover.1550671256.git.hns@goldelico.com> <effcfa7fb13fb8ba2b8b13ab07a6eb86defec77e.1550671256.git.hns@goldelico.com> <20190220161942.703f0c4a@archlinux>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220161942.703f0c4a@archlinux>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>, letux-kernel@openphoenux.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


> Am 20.02.2019 um 17:19 schrieb Jonathan Cameron <jic23@kernel.org>:
>=20
> On Wed, 20 Feb 2019 15:00:56 +0100
> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
>=20
>> This patch allows to read a mount-matrix device tree
>> property and report to user-space or in-kernel iio
>> clients.
>>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> The rest of these are all fine, though I suggest considering
> a local variable rather than the fiddly bit of casting.

Ok, fine.

I will wait some days for further comments than then
submit a v2 with all known improvements.

BR and thanks,
Nikolaus

>=20
> Jonathan
>> ---
>> drivers/iio/magnetometer/hmc5843.h      |  1 +
>> drivers/iio/magnetometer/hmc5843_core.c | 14 ++++++++++++++
>> 2 files changed, 15 insertions(+)
>>=20
>> diff --git a/drivers/iio/magnetometer/hmc5843.h =
b/drivers/iio/magnetometer/hmc5843.h
>> index a75224cf99df..e3e22d2508d3 100644
>> --- a/drivers/iio/magnetometer/hmc5843.h
>> +++ b/drivers/iio/magnetometer/hmc5843.h
>> @@ -43,6 +43,7 @@ struct hmc5843_data {
>> 	struct mutex lock;
>> 	struct regmap *regmap;
>> 	const struct hmc5843_chip_info *variant;
>> +	struct iio_mount_matrix orientation;
>> 	__be16 buffer[8];
>> };
>>=20
>> diff --git a/drivers/iio/magnetometer/hmc5843_core.c =
b/drivers/iio/magnetometer/hmc5843_core.c
>> index ada142fb7aa3..e6b6da70c152 100644
>> --- a/drivers/iio/magnetometer/hmc5843_core.c
>> +++ b/drivers/iio/magnetometer/hmc5843_core.c
>> @@ -237,6 +237,13 @@ int hmc5843_set_measurement_configuration(struct =
iio_dev *indio_dev,
>> 	return hmc5843_set_meas_conf(data, meas_conf);
>> }
>>=20
>> +static const struct iio_mount_matrix *
>> +hmc5843_get_mount_matrix(const struct iio_dev *indio_dev,
>> +			  const struct iio_chan_spec *chan)
>> +{
>> +	return &((struct hmc5843_data =
*)iio_priv(indio_dev))->orientation;
>> +}
>> +
>> static const struct iio_enum hmc5843_meas_conf_enum =3D {
>> 	.items =3D hmc5843_meas_conf_modes,
>> 	.num_items =3D ARRAY_SIZE(hmc5843_meas_conf_modes),
>> @@ -247,6 +254,7 @@ static const struct iio_enum =
hmc5843_meas_conf_enum =3D {
>> static const struct iio_chan_spec_ext_info hmc5843_ext_info[] =3D {
>> 	IIO_ENUM("meas_conf", true, &hmc5843_meas_conf_enum),
>> 	IIO_ENUM_AVAILABLE("meas_conf", &hmc5843_meas_conf_enum),
>> +	IIO_MOUNT_MATRIX(IIO_SHARED_BY_DIR, hmc5843_get_mount_matrix),
>> 	{ },
>> };
>>=20
>> @@ -260,6 +268,7 @@ static const struct iio_enum =
hmc5983_meas_conf_enum =3D {
>> static const struct iio_chan_spec_ext_info hmc5983_ext_info[] =3D {
>> 	IIO_ENUM("meas_conf", true, &hmc5983_meas_conf_enum),
>> 	IIO_ENUM_AVAILABLE("meas_conf", &hmc5983_meas_conf_enum),
>> +	IIO_MOUNT_MATRIX(IIO_SHARED_BY_DIR, hmc5843_get_mount_matrix),
>> 	{ },
>> };
>>=20
>> @@ -635,6 +644,11 @@ int hmc5843_common_probe(struct device *dev, =
struct regmap *regmap,
>> 	data->variant =3D &hmc5843_chip_info_tbl[id];
>> 	mutex_init(&data->lock);
>>=20
>> +	ret =3D of_iio_read_mount_matrix(dev, "mount-matrix",
>> +				&data->orientation);
>> +	if (ret)
>> +		return ret;
>> +
>> 	indio_dev->dev.parent =3D dev;
>> 	indio_dev->name =3D name;
>> 	indio_dev->info =3D &hmc5843_info;
>=20
