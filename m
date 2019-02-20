From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 3/9] iio: accel: bmc150: add mount matrix support
Date: Wed, 20 Feb 2019 18:07:54 +0200
Message-ID: <20190220160754.GW9224@smile.fi.intel.com>
References: <cover.1550671256.git.hns@goldelico.com>
 <71ef51037525ae6324bc22e933c00a514d518b31.1550671256.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <71ef51037525ae6324bc22e933c00a514d518b31.1550671256.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>, letux-kernel@openphoenux.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 20, 2019 at 03:00:50PM +0100, H. Nikolaus Schaller wrote:
> This patch allows to read a mount-matrix device tree
> property and report to user-space or in-kernel iio
> clients.

> +static const struct iio_mount_matrix *
> +bmc150_accel_get_mount_matrix(const struct iio_dev *indio_dev,
> +				const struct iio_chan_spec *chan)
> +{
> +	return &((struct bmc150_accel_data *)iio_priv(indio_dev))->orientation;

It's hard to read.

Can you split such lines in your series to something like

struct bmc150_accel_data *data = iio_priv(indio_dev);

return &data->orientation;

?

> +}
> +
> +static const struct iio_chan_spec_ext_info bmc150_accel_ext_info[] = {
> +	IIO_MOUNT_MATRIX(IIO_SHARED_BY_DIR, bmc150_accel_get_mount_matrix),
> +	{ },

Terminator lines better without comma.

> +};

-- 
With Best Regards,
Andy Shevchenko
