From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 3/9] iio: accel: bmc150: add mount matrix support
Date: Wed, 20 Feb 2019 17:14:43 +0100
Message-ID: <C7E571DD-DEC0-43DE-A11C-988C808BF089@goldelico.com>
References: <cover.1550671256.git.hns@goldelico.com> <71ef51037525ae6324bc22e933c00a514d518b31.1550671256.git.hns@goldelico.com> <20190220160754.GW9224@smile.fi.intel.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220160754.GW9224@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>, letux-kernel@openphoenux.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


> Am 20.02.2019 um 17:07 schrieb Andy Shevchenko =
<andriy.shevchenko@linux.intel.com>:
>=20
> On Wed, Feb 20, 2019 at 03:00:50PM +0100, H. Nikolaus Schaller wrote:
>> This patch allows to read a mount-matrix device tree
>> property and report to user-space or in-kernel iio
>> clients.
>=20
>> +static const struct iio_mount_matrix *
>> +bmc150_accel_get_mount_matrix(const struct iio_dev *indio_dev,
>> +				const struct iio_chan_spec *chan)
>> +{
>> +	return &((struct bmc150_accel_data =
*)iio_priv(indio_dev))->orientation;
>=20
> It's hard to read.
>=20
> Can you split such lines in your series to something like
>=20
> struct bmc150_accel_data *data =3D iio_priv(indio_dev);
>=20
> return &data->orientation;
>=20
> ?

I think I did copy it verbatim from some other iio driver:

=
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/d=
rivers/iio/magnetometer/ak8975.c?h=3Dnext-20190220#n745

and checkpatch did not complain.

But yes, it can and should be improved since it seems that
I picked the only bad example as template...

>=20
>> +}
>> +
>> +static const struct iio_chan_spec_ext_info bmc150_accel_ext_info[] =3D=
 {
>> +	IIO_MOUNT_MATRIX(IIO_SHARED_BY_DIR, =
bmc150_accel_get_mount_matrix),
>> +	{ },
>=20
> Terminator lines better without comma.

Ok.

>=20
>> +};
>=20
> --=20
> With Best Regards,
> Andy Shevchenko
>=20
>=20
