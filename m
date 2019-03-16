From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v5 02/11] staging: iio: ad7780: add missing switch
 default case
Date: Sat, 16 Mar 2019 17:48:31 +0000
Message-ID: <20190316174831.04bd818a@archlinux>
References: <cover.1552700652.git.renatogeh@gmail.com>
        <84375be9b21a30dde736e47a7e2f72c1aedf7e92.1552700652.git.renatogeh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <84375be9b21a30dde736e47a7e2f72c1aedf7e92.1552700652.git.renatogeh@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Renato Lui Geh <renatogeh@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, stefan.popa@analog.com, alexandru.Ardelean@analog.com, giuliano.belinassi@usp.br, robh+dt@kernel.org, mark.rutland@arm.com, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 15 Mar 2019 23:12:53 -0300
Renato Lui Geh <renatogeh@gmail.com> wrote:

> This patch simply adds a missing switch default case in read_raw.
> 
> Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>
Applied,

Thanks,

Jonathan

> ---
>  drivers/staging/iio/adc/ad7780.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/iio/adc/ad7780.c b/drivers/staging/iio/adc/ad7780.c
> index 07e5e35c92a3..f4cd7bc3e02f 100644
> --- a/drivers/staging/iio/adc/ad7780.c
> +++ b/drivers/staging/iio/adc/ad7780.c
> @@ -118,6 +118,8 @@ static int ad7780_read_raw(struct iio_dev *indio_dev,
>  	case IIO_CHAN_INFO_OFFSET:
>  		*val = -(1 << (chan->scan_type.realbits - 1));
>  		return IIO_VAL_INT;
> +	default:
> +		break;
>  	}
>  
>  	return -EINVAL;
