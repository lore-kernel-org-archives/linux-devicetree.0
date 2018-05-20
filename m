From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 04/12] staging: iio: ad2s1200: Setup spi before iio
 device register
Date: Sun, 20 May 2018 11:55:04 +0100
Message-ID: <20180520115504.6397def1@archlinux>
References: <cover.1526667118.git.davidjulianveenstra@gmail.com>
 <2f531545d91366136c7e421f0931637a45b15d51.1526667118.git.davidjulianveenstra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <2f531545d91366136c7e421f0931637a45b15d51.1526667118.git.davidjulianveenstra@gmail.com>
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, robh+dt@kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de
List-Id: devicetree@vger.kernel.org

On Fri, 18 May 2018 20:21:44 +0200
David Veenstra <davidjulianveenstra@gmail.com> wrote:

> The spi should be set up before the device is registered as an iio
> device.
> 
> This patch moves the setup to before the device registration.
> 
> Signed-off-by: David Veenstra <davidjulianveenstra@gmail.com>
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan

> ---
> Changes in v4:
>  - Introduced in this version.
> 
>  drivers/staging/iio/resolver/ad2s1200.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/iio/resolver/ad2s1200.c b/drivers/staging/iio/resolver/ad2s1200.c
> index 068aa86e9c11..430cc62591fe 100644
> --- a/drivers/staging/iio/resolver/ad2s1200.c
> +++ b/drivers/staging/iio/resolver/ad2s1200.c
> @@ -143,15 +143,16 @@ static int ad2s1200_probe(struct spi_device *spi)
>  	indio_dev->num_channels = ARRAY_SIZE(ad2s1200_channels);
>  	indio_dev->name = spi_get_device_id(spi)->name;
>  
> -	ret = devm_iio_device_register(&spi->dev, indio_dev);
> -	if (ret)
> -		return ret;
> -
>  	spi->max_speed_hz = AD2S1200_HZ;
>  	spi->mode = SPI_MODE_3;
> -	spi_setup(spi);
> +	ret = spi_setup(spi);
> +
> +	if (ret < 0) {
> +		dev_err(&spi->dev, "spi_setup failed!\n");
> +		return ret;
> +	}
>  
> -	return 0;
> +	return devm_iio_device_register(&spi->dev, indio_dev);
>  }
>  
>  static const struct spi_device_id ad2s1200_id[] = {
