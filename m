From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 9/9] iio: magnetometer: hmc5843: add mount matrix
 support
Date: Wed, 20 Feb 2019 16:19:42 +0000
Message-ID: <20190220161942.703f0c4a@archlinux>
References: <cover.1550671256.git.hns@goldelico.com>
        <effcfa7fb13fb8ba2b8b13ab07a6eb86defec77e.1550671256.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <effcfa7fb13fb8ba2b8b13ab07a6eb86defec77e.1550671256.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>, letux-kernel@openphoenux.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 20 Feb 2019 15:00:56 +0100
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> This patch allows to read a mount-matrix device tree
> property and report to user-space or in-kernel iio
> clients.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
The rest of these are all fine, though I suggest considering
a local variable rather than the fiddly bit of casting.

Jonathan
> ---
>  drivers/iio/magnetometer/hmc5843.h      |  1 +
>  drivers/iio/magnetometer/hmc5843_core.c | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/iio/magnetometer/hmc5843.h b/drivers/iio/magnetometer/hmc5843.h
> index a75224cf99df..e3e22d2508d3 100644
> --- a/drivers/iio/magnetometer/hmc5843.h
> +++ b/drivers/iio/magnetometer/hmc5843.h
> @@ -43,6 +43,7 @@ struct hmc5843_data {
>  	struct mutex lock;
>  	struct regmap *regmap;
>  	const struct hmc5843_chip_info *variant;
> +	struct iio_mount_matrix orientation;
>  	__be16 buffer[8];
>  };
>  
> diff --git a/drivers/iio/magnetometer/hmc5843_core.c b/drivers/iio/magnetometer/hmc5843_core.c
> index ada142fb7aa3..e6b6da70c152 100644
> --- a/drivers/iio/magnetometer/hmc5843_core.c
> +++ b/drivers/iio/magnetometer/hmc5843_core.c
> @@ -237,6 +237,13 @@ int hmc5843_set_measurement_configuration(struct iio_dev *indio_dev,
>  	return hmc5843_set_meas_conf(data, meas_conf);
>  }
>  
> +static const struct iio_mount_matrix *
> +hmc5843_get_mount_matrix(const struct iio_dev *indio_dev,
> +			  const struct iio_chan_spec *chan)
> +{
> +	return &((struct hmc5843_data *)iio_priv(indio_dev))->orientation;
> +}
> +
>  static const struct iio_enum hmc5843_meas_conf_enum = {
>  	.items = hmc5843_meas_conf_modes,
>  	.num_items = ARRAY_SIZE(hmc5843_meas_conf_modes),
> @@ -247,6 +254,7 @@ static const struct iio_enum hmc5843_meas_conf_enum = {
>  static const struct iio_chan_spec_ext_info hmc5843_ext_info[] = {
>  	IIO_ENUM("meas_conf", true, &hmc5843_meas_conf_enum),
>  	IIO_ENUM_AVAILABLE("meas_conf", &hmc5843_meas_conf_enum),
> +	IIO_MOUNT_MATRIX(IIO_SHARED_BY_DIR, hmc5843_get_mount_matrix),
>  	{ },
>  };
>  
> @@ -260,6 +268,7 @@ static const struct iio_enum hmc5983_meas_conf_enum = {
>  static const struct iio_chan_spec_ext_info hmc5983_ext_info[] = {
>  	IIO_ENUM("meas_conf", true, &hmc5983_meas_conf_enum),
>  	IIO_ENUM_AVAILABLE("meas_conf", &hmc5983_meas_conf_enum),
> +	IIO_MOUNT_MATRIX(IIO_SHARED_BY_DIR, hmc5843_get_mount_matrix),
>  	{ },
>  };
>  
> @@ -635,6 +644,11 @@ int hmc5843_common_probe(struct device *dev, struct regmap *regmap,
>  	data->variant = &hmc5843_chip_info_tbl[id];
>  	mutex_init(&data->lock);
>  
> +	ret = of_iio_read_mount_matrix(dev, "mount-matrix",
> +				&data->orientation);
> +	if (ret)
> +		return ret;
> +
>  	indio_dev->dev.parent = dev;
>  	indio_dev->name = name;
>  	indio_dev->info = &hmc5843_info;
