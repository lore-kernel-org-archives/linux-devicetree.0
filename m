From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 03/13] staging: iio: ad2s1200: Reverse Christmas tree
 ordering
Date: Sat, 21 Apr 2018 17:46:56 +0100
Message-ID: <20180421174656.0bd5553a@archlinux>
References: <cover.1524247563.git.davidjulianveenstra@gmail.com>
 <58723390bf92e565586705b5e8da2350b4d704be.1524247563.git.davidjulianveenstra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <58723390bf92e565586705b5e8da2350b4d704be.1524247563.git.davidjulianveenstra@gmail.com>
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

On Fri, 20 Apr 2018 21:29:08 +0200
David Veenstra <davidjulianveenstra@gmail.com> wrote:

> Reorders the variable declarations to prefer a reverse Christmas tree
> order to improve readability.
> 
> Signed-off-by: David Veenstra <davidjulianveenstra@gmail.com>
Applied,

Thanks,

Jonathan

> ---
>  drivers/staging/iio/resolver/ad2s1200.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/iio/resolver/ad2s1200.c b/drivers/staging/iio/resolver/ad2s1200.c
> index ffcdf4e8eb92..b6c3a3c8f7fe 100644
> --- a/drivers/staging/iio/resolver/ad2s1200.c
> +++ b/drivers/staging/iio/resolver/ad2s1200.c
> @@ -46,9 +46,9 @@ static int ad2s1200_read_raw(struct iio_dev *indio_dev,
>  			     int *val2,
>  			     long m)
>  {
> +	struct ad2s1200_state *st = iio_priv(indio_dev);
>  	int ret = 0;
>  	s16 vel;
> -	struct ad2s1200_state *st = iio_priv(indio_dev);
>  
>  	mutex_lock(&st->lock);
>  	gpio_set_value(st->sample, 0);
> @@ -101,10 +101,10 @@ static const struct iio_info ad2s1200_info = {
>  
>  static int ad2s1200_probe(struct spi_device *spi)
>  {
> +	unsigned short *pins = spi->dev.platform_data;
>  	struct ad2s1200_state *st;
>  	struct iio_dev *indio_dev;
>  	int pn, ret = 0;
> -	unsigned short *pins = spi->dev.platform_data;
>  
>  	for (pn = 0; pn < AD2S1200_PN; pn++) {
>  		ret = devm_gpio_request_one(&spi->dev, pins[pn], GPIOF_DIR_OUT,
