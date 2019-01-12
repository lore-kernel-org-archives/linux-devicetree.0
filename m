From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 1/2] iio: chemical: bme680: Add device-tree support
Date: Sat, 12 Jan 2019 18:22:21 +0000
Message-ID: <20190112182221.4765d287@archlinux>
References: <20190111205359.14158-1-sebastien.bourdelin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111205359.14158-1-sebastien.bourdelin@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastien Bourdelin <sebastien.bourdelin@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, himanshujha199640@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, pmeerw@pmeerw.net, lars@metafoo.de, knaack.h@gmx.de
List-Id: devicetree@vger.kernel.org

On Fri, 11 Jan 2019 15:53:58 -0500
Sebastien Bourdelin <sebastien.bourdelin@gmail.com> wrote:

> This commit allow the driver to work with device-tree.
> 
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@gmail.com>
Minor stuff inline.

J
> ---
> v1 -> v2:
>   - add missing of.h header in bme680_spi.c
> ---
>  drivers/iio/chemical/bme680_i2c.c | 7 +++++++
>  drivers/iio/chemical/bme680_spi.c | 9 +++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/iio/chemical/bme680_i2c.c b/drivers/iio/chemical/bme680_i2c.c
> index 06d4be539d2e..94a36ebdf0b2 100644
> --- a/drivers/iio/chemical/bme680_i2c.c
> +++ b/drivers/iio/chemical/bme680_i2c.c
> @@ -70,10 +70,17 @@ static const struct acpi_device_id bme680_acpi_match[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, bme680_acpi_match);
>  
> +static const struct of_device_id bme680_of_i2c_match[] = {
> +	{ .compatible = "bosch,bme680", },
> +	{},
> +}
> +MODULE_DEVICE_TABLE(of, bme680_of_i2c_match);
> +
>  static struct i2c_driver bme680_i2c_driver = {
>  	.driver = {
>  		.name			= "bme680_i2c",
>  		.acpi_match_table       = ACPI_PTR(bme680_acpi_match),
> +		.of_match_table		= of_match_ptr(bme680_of_i2c_match),

As below. just = bme680...

>  	},
>  	.probe = bme680_i2c_probe,
>  	.id_table = bme680_i2c_id,
> diff --git a/drivers/iio/chemical/bme680_spi.c b/drivers/iio/chemical/bme680_spi.c
> index c9fb05e8d0b9..caa57287a911 100644
> --- a/drivers/iio/chemical/bme680_spi.c
> +++ b/drivers/iio/chemical/bme680_spi.c
> @@ -6,9 +6,11 @@
>   */
>  #include <linux/acpi.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/regmap.h>
>  #include <linux/spi/spi.h>
>  
> +

This white space change should not be here.

>  #include "bme680.h"
>  
>  static int bme680_regmap_spi_write(void *context, const void *data,
> @@ -110,10 +112,17 @@ static const struct acpi_device_id bme680_acpi_match[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, bme680_acpi_match);
>  
> +static const struct of_device_id bme680_of_spi_match[] = {
> +	{ .compatible = "bosch,bme680", },
> +	{},
> +}
> +MODULE_DEVICE_TABLE(of, bme680_of_spi_match);
> +
>  static struct spi_driver bme680_spi_driver = {
>  	.driver = {
>  		.name			= "bme680_spi",
>  		.acpi_match_table	= ACPI_PTR(bme680_acpi_match),
> +		.of_match_table		= of_match_ptr(bme680_of_spi_match),
Please don't use of_match_ptr.  We actually want this entry to be there even
if devicetree is not in use.  This is because there is a magic ACPI hid
that can use this table even from ACPI.

>  	},
>  	.probe = bme680_spi_probe,
>  	.id_table = bme680_spi_id,
