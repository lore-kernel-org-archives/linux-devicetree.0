From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 07/10] iio: magnetometer: bmc150: add mount matrix
 support
Date: Sun, 3 Mar 2019 15:23:47 +0000
Message-ID: <20190303152347.1183694a@archlinux>
References: <cover.1550768574.git.hns@goldelico.com>
        <92f9b04e6540612b8bb8450803df1fcda21e364b.1550768574.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <92f9b04e6540612b8bb8450803df1fcda21e364b.1550768574.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>, Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Martin Kelly <mkelly@xevo.com>, Jonathan Marek <jonathan@marek.ca>, Brian Masney <masneyb@onstation.org>, Stephan Gerhold <stephan@gerhold.net>, letux-kernel@openphoenux.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 21 Feb 2019 18:02:52 +0100
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> This patch allows to read a mount-matrix device tree
> property and report to user-space or in-kernel iio
> clients.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Applied.

Thanks,

Jonathan
> ---
>  drivers/iio/magnetometer/bmc150_magn.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/iio/magnetometer/bmc150_magn.c b/drivers/iio/magnetometer/bmc150_magn.c
> index d91cb845e3d6..b0d8b036d9bb 100644
> --- a/drivers/iio/magnetometer/bmc150_magn.c
> +++ b/drivers/iio/magnetometer/bmc150_magn.c
> @@ -143,6 +143,7 @@ struct bmc150_magn_data {
>  	 */
>  	struct mutex mutex;
>  	struct regmap *regmap;
> +	struct iio_mount_matrix orientation;
>  	/* 4 x 32 bits for x, y z, 4 bytes align, 64 bits timestamp */
>  	s32 buffer[6];
>  	struct iio_trigger *dready_trig;
> @@ -612,6 +613,20 @@ static ssize_t bmc150_magn_show_samp_freq_avail(struct device *dev,
>  	return len;
>  }
>  
> +static const struct iio_mount_matrix *
> +bmc150_magn_get_mount_matrix(const struct iio_dev *indio_dev,
> +			      const struct iio_chan_spec *chan)
> +{
> +	struct bmc150_magn_data *data = iio_priv(indio_dev);
> +
> +	return &data->orientation;
> +}
> +
> +static const struct iio_chan_spec_ext_info bmc150_magn_ext_info[] = {
> +	IIO_MOUNT_MATRIX(IIO_SHARED_BY_DIR, bmc150_magn_get_mount_matrix),
> +	{ }
> +};
> +
>  static IIO_DEV_ATTR_SAMP_FREQ_AVAIL(bmc150_magn_show_samp_freq_avail);
>  
>  static struct attribute *bmc150_magn_attributes[] = {
> @@ -638,6 +653,7 @@ static const struct attribute_group bmc150_magn_attrs_group = {
>  		.storagebits = 32,					\
>  		.endianness = IIO_LE					\
>  	},								\
> +	.ext_info = bmc150_magn_ext_info,				\
>  }
>  
>  static const struct iio_chan_spec bmc150_magn_channels[] = {
> @@ -861,6 +877,11 @@ int bmc150_magn_probe(struct device *dev, struct regmap *regmap,
>  	data->irq = irq;
>  	data->dev = dev;
>  
> +	ret = iio_read_mount_matrix(dev, "mount-matrix",
> +				&data->orientation);
> +	if (ret)
> +		return ret;
> +
>  	if (!name && ACPI_HANDLE(dev))
>  		name = bmc150_magn_match_acpi_device(dev);
>  
