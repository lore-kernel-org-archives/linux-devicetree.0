From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 3/9] iio: accel: bmc150: add mount matrix support
Date: Wed, 20 Feb 2019 17:20:29 +0100
Message-ID: <4C07F0C8-3149-4DEA-B108-39F2CC04ED88@goldelico.com>
References: <cover.1550671256.git.hns@goldelico.com> <71ef51037525ae6324bc22e933c00a514d518b31.1550671256.git.hns@goldelico.com> <20190220161444.78f34a61@archlinux>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220161444.78f34a61@archlinux>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>, letux-kernel@openphoenux.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


> Am 20.02.2019 um 17:14 schrieb Jonathan Cameron <jic23@kernel.org>:
>=20
> On Wed, 20 Feb 2019 15:00:50 +0100
> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
>=20
>> This patch allows to read a mount-matrix device tree
>> property and report to user-space or in-kernel iio
>> clients.
>>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> This will clash with Andy's current patch, but I'll fix that up if
> needed. Otherwise, one trivial suggestion inline.

Ok, thanks!

>=20
> Jonathan
>=20
>> ---
>> drivers/iio/accel/bmc150-accel-core.c | 19 +++++++++++++++++++
>> 1 file changed, 19 insertions(+)
>>=20
>> diff --git a/drivers/iio/accel/bmc150-accel-core.c =
b/drivers/iio/accel/bmc150-accel-core.c
>> index 383c802eb5b8..9178846cfddc 100644
>> --- a/drivers/iio/accel/bmc150-accel-core.c
>> +++ b/drivers/iio/accel/bmc150-accel-core.c
>> @@ -204,6 +204,7 @@ struct bmc150_accel_data {
>> 	int ev_enable_state;
>> 	int64_t timestamp, old_timestamp; /* Only used in hw fifo mode. =
*/
>> 	const struct bmc150_accel_chip_info *chip_info;
>> +	struct iio_mount_matrix orientation;
>> };
>>=20
>> static const struct {
>> @@ -796,6 +797,18 @@ static ssize_t =
bmc150_accel_get_fifo_state(struct device *dev,
>> 	return sprintf(buf, "%d\n", state);
>> }
>>=20
>> +static const struct iio_mount_matrix *
>> +bmc150_accel_get_mount_matrix(const struct iio_dev *indio_dev,
>> +				const struct iio_chan_spec *chan)
>> +{
>> +	return &((struct bmc150_accel_data =
*)iio_priv(indio_dev))->orientation;
>=20
> I would use a local variable as that casting is less than simple to =
parse
> to my eyes anyway!

Yes, Andy already suggested that. I just happend to pick one of the only =
two bad examples
from all iio drivers as template...

drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
drivers/iio/magnetometer/ak8975.c

>=20
>> +}
>> +
>> +static const struct iio_chan_spec_ext_info bmc150_accel_ext_info[] =3D=
 {
>> +	IIO_MOUNT_MATRIX(IIO_SHARED_BY_DIR, =
bmc150_accel_get_mount_matrix),
>> +	{ },
>> +};
>> +
>> static IIO_CONST_ATTR(hwfifo_watermark_min, "1");
>> static IIO_CONST_ATTR(hwfifo_watermark_max,
>> 		      __stringify(BMC150_ACCEL_FIFO_LENGTH));
>> @@ -978,6 +991,7 @@ static const struct iio_event_spec =
bmc150_accel_event =3D {
>> 		.shift =3D 16 - (bits),					=
\
>> 		.endianness =3D IIO_LE,					=
\
>> 	},								=
\
>> +	.ext_info =3D bmc150_accel_ext_info,				=
\
>> 	.event_spec =3D &bmc150_accel_event,				=
\
>> 	.num_event_specs =3D 1						=
\
>> }
>> @@ -1555,6 +1569,11 @@ int bmc150_accel_core_probe(struct device =
*dev, struct regmap *regmap, int irq,
>>=20
>> 	data->regmap =3D regmap;
>>=20
>> +	ret =3D of_iio_read_mount_matrix(dev, "mount-matrix",
>> +				       &data->orientation);
>> +	if (ret)
>> +		return ret;
>> +
>> 	ret =3D bmc150_accel_chip_init(data);
>> 	if (ret < 0)
>> 		return ret;
>=20

BR and thanks,
Nikolaus
