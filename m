From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 5/9] iio: accel: bma180: convert to devm
Date: Wed, 20 Feb 2019 17:15:09 +0100
Message-ID: <175C24D1-2C0D-455F-B091-E16ED67C4049@goldelico.com>
References: <cover.1550671256.git.hns@goldelico.com> <900f59b94ef2e1b5559b363c0d1af4fefccd0366.1550671256.git.hns@goldelico.com> <20190220160951.GX9224@smile.fi.intel.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220160951.GX9224@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>, letux-kernel@openphoenux.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


> Am 20.02.2019 um 17:09 schrieb Andy Shevchenko =
<andriy.shevchenko@linux.intel.com>:
>=20
> On Wed, Feb 20, 2019 at 03:00:52PM +0100, H. Nikolaus Schaller wrote:
>> This simplifies the code a little.
>=20
>> -err_buffer_cleanup:
>> -	iio_triggered_buffer_cleanup(indio_dev);
>> -err_trigger_unregister:
>> -	if (data->trig)
>> -		iio_trigger_unregister(data->trig);
>> -err_trigger_free:
>> -	iio_trigger_free(data->trig);
>=20
>> -err_chip_disable:
>> +err:
>=20
> Please, leave the original label name as it's more self-explanatory.

Ok.

>=20
>> 	data->part_info->chip_disable(data);
>>=20
>> 	return ret;
>=20
> --=20
> With Best Regards,
> Andy Shevchenko
>=20
>=20
