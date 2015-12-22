From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 5/5] misc: eeprom_93xx46: Add support for a GPIO 'select'
 line.
Date: Tue, 22 Dec 2015 02:30:20 +0200
Message-ID: <5678999C.7040808@mleia.com>
References: <1449720055-25965-1-git-send-email-cory.tusar@pid1solutions.com> <1449720055-25965-6-git-send-email-cory.tusar@pid1solutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449720055-25965-6-git-send-email-cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, afd-l0cyMroinI0@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Chris.Healy-c8ZVq/bFV1I@public.gmane.org, Keith.Vennel-c8ZVq/bFV1I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Cory,

On 10.12.2015 06:00, Cory Tusar wrote:
> This commit adds support to the eeprom_93x46 driver allowing a GPIO line
> to function as a 'select' or 'enable' signal prior to accessing the
> EEPROM.
> 
> Signed-off-by: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
> Tested-by: Chris Healy <chris.healy-c8ZVq/bFV1I@public.gmane.org>
> ---
>  drivers/misc/eeprom/eeprom_93xx46.c | 35 +++++++++++++++++++++++++++++++++++
>  include/linux/eeprom_93xx46.h       |  3 +++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/drivers/misc/eeprom/eeprom_93xx46.c b/drivers/misc/eeprom/eeprom_93xx46.c
> index d50bc17..d28fac2 100644
> --- a/drivers/misc/eeprom/eeprom_93xx46.c
> +++ b/drivers/misc/eeprom/eeprom_93xx46.c
> @@ -10,11 +10,13 @@
>  
>  #include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/of_gpio.h>
>  #include <linux/slab.h>
>  #include <linux/spi/spi.h>
>  #include <linux/sysfs.h>
> @@ -343,6 +345,20 @@ static ssize_t eeprom_93xx46_store_erase(struct device *dev,
>  }
>  static DEVICE_ATTR(erase, S_IWUSR, NULL, eeprom_93xx46_store_erase);
>  
> +static void select_assert(void *context)
> +{
> +	struct eeprom_93xx46_dev *edev = context;
> +
> +	gpiod_set_value_cansleep(edev->pdata->select, 1);
> +}
> +
> +static void select_deassert(void *context)
> +{
> +	struct eeprom_93xx46_dev *edev = context;
> +
> +	gpiod_set_value_cansleep(edev->pdata->select, 0);
> +}
> +
>  static const struct of_device_id eeprom_93xx46_of_table[] = {
>  	{ .compatible = "eeprom-93xx46", },
>  	{ .compatible = "atmel,at93c46d", .data = &atmel_at93c46d_data, },
> @@ -357,6 +373,8 @@ static int eeprom_93xx46_probe_dt(struct spi_device *spi)
>  	struct device_node *np = spi->dev.of_node;
>  	struct eeprom_93xx46_platform_data *pd;
>  	u32 tmp;
> +	int gpio;
> +	enum of_gpio_flags of_flags;
>  	int ret;
>  
>  	pd = devm_kzalloc(&spi->dev, sizeof(*pd), GFP_KERNEL);
> @@ -381,6 +399,23 @@ static int eeprom_93xx46_probe_dt(struct spi_device *spi)
>  	if (of_property_read_bool(np, "read-only"))
>  		pd->flags |= EE_READONLY;
>  
> +	gpio = of_get_named_gpio_flags(np, "select-gpios", 0, &of_flags);
> +	if (gpio_is_valid(gpio)) {
> +		unsigned long flags =
> +			of_flags == OF_GPIO_ACTIVE_LOW ? GPIOF_ACTIVE_LOW : 0;
> +
> +		ret = devm_gpio_request_one(&spi->dev, gpio, flags,
> +					    "eeprom_93xx46_select");
> +		if (ret)
> +			return ret;
> +
> +		pd->select = gpio_to_desc(gpio);
> +		pd->prepare = select_assert;
> +		pd->finish = select_deassert;
> +
> +		gpiod_direction_output(pd->select, 0);
> +	}
> +
>  	if (of_id->data) {
>  		const struct eeprom_93xx46_devtype_data *data = of_id->data;
>  
> diff --git a/include/linux/eeprom_93xx46.h b/include/linux/eeprom_93xx46.h
> index 92fa4c3..03f3435 100644
> --- a/include/linux/eeprom_93xx46.h
> +++ b/include/linux/eeprom_93xx46.h
> @@ -3,6 +3,8 @@
>   * platform description for 93xx46 EEPROMs.
>   */
>  
> +#include <linux/of_gpio.h>
> +

You need just "struct gpio_desc;" instead of the include here, please fix.

>  struct eeprom_93xx46_platform_data {
>  	unsigned char	flags;
>  #define EE_ADDR8	0x01		/*  8 bit addr. cfg */
> @@ -21,4 +23,5 @@ struct eeprom_93xx46_platform_data {
>  	 */
>  	void (*prepare)(void *);
>  	void (*finish)(void *);
> +	struct gpio_desc *select;
>  };
> 

Reviewed-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
