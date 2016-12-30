From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/6] iio: bmi160: Add of device table for i2c
Date: Fri, 30 Dec 2016 10:47:36 +0000
Message-ID: <a262d6f4-a7a1-3eb9-af89-f3f03484600b@kernel.org>
References: <20161208142259.26230-1-m.niestroj@grinn-global.com>
 <20161208142259.26230-2-m.niestroj@grinn-global.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161208142259.26230-2-m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
Cc: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/12/16 14:22, Marcin Niestroj wrote:
> From now on we can add bmi160 device to device-tree by specifying
> compatible string.
> 
> Signed-off-by: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
Other than the fact this should really have been two patches, this looks good.

Applied to the togreg branch of iio.git and pushed out as testing for the autobuilders
to play with it.

Thanks,

Jonathan
> ---
> Patch introduced in v2
> 
>  drivers/iio/imu/bmi160/bmi160_i2c.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/imu/bmi160/bmi160_i2c.c b/drivers/iio/imu/bmi160/bmi160_i2c.c
> index 07a179d..155a31f 100644
> --- a/drivers/iio/imu/bmi160/bmi160_i2c.c
> +++ b/drivers/iio/imu/bmi160/bmi160_i2c.c
> @@ -11,10 +11,11 @@
>   *      - 0x68 if SDO is pulled to GND
>   *      - 0x69 if SDO is pulled to VDDIO
>   */
> -#include <linux/module.h>
> +#include <linux/acpi.h>
>  #include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/regmap.h>
> -#include <linux/acpi.h>
Whilst I have no objection to reordering headers so they are alphabetical
(as long as not clarity is lost) it should really be in it's own patch...
>  
>  #include "bmi160.h"
>  
> @@ -56,10 +57,19 @@ static const struct acpi_device_id bmi160_acpi_match[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, bmi160_acpi_match);
>  
> +#ifdef CONFIG_OF
> +static const struct of_device_id bmi160_of_match[] = {
> +	{ .compatible = "bosch,bmi160" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, bmi160_of_match);
> +#endif
> +
>  static struct i2c_driver bmi160_i2c_driver = {
>  	.driver = {
>  		.name			= "bmi160_i2c",
>  		.acpi_match_table	= ACPI_PTR(bmi160_acpi_match),
> +		.of_match_table		= of_match_ptr(bmi160_of_match),
>  	},
>  	.probe		= bmi160_i2c_probe,
>  	.remove		= bmi160_i2c_remove,
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
