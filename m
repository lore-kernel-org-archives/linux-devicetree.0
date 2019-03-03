From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 10/10] iio: ak8975: improve code readability
Date: Sun, 3 Mar 2019 15:30:32 +0000
Message-ID: <20190303153032.580537fe@archlinux>
References: <cover.1550768574.git.hns@goldelico.com>
        <8a4498a761bf63e38c16f17d437715be0399a957.1550768574.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8a4498a761bf63e38c16f17d437715be0399a957.1550768574.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>, Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Martin Kelly <mkelly@xevo.com>, Jonathan Marek <jonathan@marek.ca>, Brian Masney <masneyb@onstation.org>, Stephan Gerhold <stephan@gerhold.net>, letux-kernel@openphoenux.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 21 Feb 2019 18:02:55 +0100
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> - use temporary variable in get_mount_matrix()
> - remove , after { }
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Applied.

Thanks,

Jonathan

> ---
>  drivers/iio/magnetometer/ak8975.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/magnetometer/ak8975.c b/drivers/iio/magnetometer/ak8975.c
> index db7214ac514c..43d08c089792 100644
> --- a/drivers/iio/magnetometer/ak8975.c
> +++ b/drivers/iio/magnetometer/ak8975.c
> @@ -746,12 +746,14 @@ static const struct iio_mount_matrix *
>  ak8975_get_mount_matrix(const struct iio_dev *indio_dev,
>  			const struct iio_chan_spec *chan)
>  {
> -	return &((struct ak8975_data *)iio_priv(indio_dev))->orientation;
> +	struct ak8975_data *data = iio_priv(indio_dev);
> +
> +	return &data->orientation;
>  }
>  
>  static const struct iio_chan_spec_ext_info ak8975_ext_info[] = {
>  	IIO_MOUNT_MATRIX(IIO_SHARED_BY_DIR, ak8975_get_mount_matrix),
> -	{ },
> +	{ }
>  };
>  
>  #define AK8975_CHANNEL(axis, index)					\
> @@ -792,7 +794,7 @@ static const struct acpi_device_id ak_acpi_match[] = {
>  	{"AK09911", AK09911},
>  	{"AKM9911", AK09911},
>  	{"AK09912", AK09912},
> -	{ },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, ak_acpi_match);
>  #endif
