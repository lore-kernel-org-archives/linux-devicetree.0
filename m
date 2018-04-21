From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 04/13] staging: iio: ad2s1200: Add blank lines
Date: Sat, 21 Apr 2018 17:47:37 +0100
Message-ID: <20180421174737.44349a07@archlinux>
References: <cover.1524247563.git.davidjulianveenstra@gmail.com>
 <399d2beff3981a7a0dd45af0d4277d1c9355b99e.1524247563.git.davidjulianveenstra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <399d2beff3981a7a0dd45af0d4277d1c9355b99e.1524247563.git.davidjulianveenstra@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: David Veenstra <davidjulianveenstra@gmail.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, robh+dt@kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de, daniel.baluta@nxp.com
List-Id: devicetree@vger.kernel.org

On Fri, 20 Apr 2018 21:29:52 +0200
David Veenstra <davidjulianveenstra@gmail.com> wrote:

> Add blank lines to improve readability.
> 
> Signed-off-by: David Veenstra <davidjulianveenstra@gmail.com>
Applied,

Thanks,

Jonathan

> ---
>  drivers/staging/iio/resolver/ad2s1200.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/staging/iio/resolver/ad2s1200.c b/drivers/staging/iio/resolver/ad2s1200.c
> index b6c3a3c8f7fe..357fe3c382b3 100644
> --- a/drivers/staging/iio/resolver/ad2s1200.c
> +++ b/drivers/staging/iio/resolver/ad2s1200.c
> @@ -9,6 +9,7 @@
>   * published by the Free Software Foundation.
>   *
>   */
> +
>  #include <linux/bitops.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> @@ -52,10 +53,12 @@ static int ad2s1200_read_raw(struct iio_dev *indio_dev,
>  
>  	mutex_lock(&st->lock);
>  	gpio_set_value(st->sample, 0);
> +
>  	/* delay (6 * AD2S1200_TSCLK + 20) nano seconds */
>  	udelay(1);
>  	gpio_set_value(st->sample, 1);
>  	gpio_set_value(st->rdvel, !!(chan->type == IIO_ANGL));
> +
>  	ret = spi_read(st->sdev, st->rx, 2);
>  	if (ret < 0) {
>  		mutex_unlock(&st->lock);
> @@ -75,9 +78,11 @@ static int ad2s1200_read_raw(struct iio_dev *indio_dev,
>  		mutex_unlock(&st->lock);
>  		return -EINVAL;
>  	}
> +
>  	/* delay (2 * AD2S1200_TSCLK + 20) ns for sample pulse */
>  	udelay(1);
>  	mutex_unlock(&st->lock);
> +
>  	return IIO_VAL_INT;
>  }
>  
> @@ -115,9 +120,11 @@ static int ad2s1200_probe(struct spi_device *spi)
>  			return ret;
>  		}
>  	}
> +
>  	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
>  	if (!indio_dev)
>  		return -ENOMEM;
> +
>  	spi_set_drvdata(spi, indio_dev);
>  	st = iio_priv(indio_dev);
>  	mutex_init(&st->lock);
