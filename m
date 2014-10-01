From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v4 4/4] pmbus: ltc2978: add regulator support
Date: Wed, 1 Oct 2014 14:36:13 -0700
Message-ID: <20141001213613.GA29312@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
Cc: jdelvare-l3A5Bk7waGM@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 01, 2014 at 03:18:20PM -0500, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
> From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> 
> Add simple on/off regulator support for ltc2978 and
> other pmbus parts supported by ltc2978.c
> 
> Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> 
> v2: Remove '#include <linux/regulator/machine.h>'
>     Only one regulator per pmbus device
>     Get regulator_init_data from pdata or device tree
> 
> v3: Support multiple regulators for each chip
>     Move most code to pmbus_core.c
>     fixed values for on/off
> 
> v4: fix a #endif comment
>     simplify probe code, remove added switch statement
>     remove BUG_ON(), add error message and fix num_regulators
> ---
>  drivers/hwmon/pmbus/Kconfig   |    7 +++++++
>  drivers/hwmon/pmbus/ltc2978.c |   37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 6e1e493..79117b7 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -56,6 +56,13 @@ config SENSORS_LTC2978
>  	  This driver can also be built as a module. If so, the module will
>  	  be called ltc2978.
>  
> +config SENSORS_LTC2978_REGULATOR
> +	boolean "Regulator support for LTC2974, LTC2978, LTC3880, and LTC3883"

We will need to update this and SENSORS_LTC2978 and add LTC2977 as well as
LTM4646 to the list of supported chips.

Guenter

> +	depends on SENSORS_LTC2978 && REGULATOR
> +	help
> +	  If you say yes here you get regulator support for Linear
> +	  Technology LTC2974, LTC2978, LTC3880, and LTC3883.
> +
>  config SENSORS_MAX16064
>  	tristate "Maxim MAX16064"
>  	default n
> diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
> index e24ed52..422712e 100644
> --- a/drivers/hwmon/pmbus/ltc2978.c
> +++ b/drivers/hwmon/pmbus/ltc2978.c
> @@ -22,6 +22,8 @@
>  #include <linux/err.h>
>  #include <linux/slab.h>
>  #include <linux/i2c.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/of_regulator.h>
>  #include "pmbus.h"
>  
>  enum chips { ltc2974, ltc2977, ltc2978, ltc3880, ltc3883, ltm4676 };
> @@ -374,6 +376,30 @@ static const struct i2c_device_id ltc2978_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, ltc2978_id);
>  
> +#if IS_ENABLED(CONFIG_SENSORS_LTC2978_REGULATOR)
> +static const struct regulator_desc ltc2978_reg_desc[] = {
> +	PMBUS_REGULATOR("vout_en", 0),
> +	PMBUS_REGULATOR("vout_en", 1),
> +	PMBUS_REGULATOR("vout_en", 2),
> +	PMBUS_REGULATOR("vout_en", 3),
> +	PMBUS_REGULATOR("vout_en", 4),
> +	PMBUS_REGULATOR("vout_en", 5),
> +	PMBUS_REGULATOR("vout_en", 6),
> +	PMBUS_REGULATOR("vout_en", 7),
> +};
> +
> +static struct of_regulator_match ltc2978_reg_matches[] = {
> +	{ .name = "vout_en0" },
> +	{ .name = "vout_en1" },
> +	{ .name = "vout_en2" },
> +	{ .name = "vout_en3" },
> +	{ .name = "vout_en4" },
> +	{ .name = "vout_en5" },
> +	{ .name = "vout_en6" },
> +	{ .name = "vout_en7" },
> +};
> +#endif /* CONFIG_SENSORS_LTC2978_REGULATOR */
> +
>  static int ltc2978_probe(struct i2c_client *client,
>  			 const struct i2c_device_id *id)
>  {
> @@ -487,6 +513,17 @@ static int ltc2978_probe(struct i2c_client *client,
>  	default:
>  		return -ENODEV;
>  	}
> +
> +#if IS_ENABLED(CONFIG_SENSORS_LTC2978_REGULATOR)
> +	info->num_regulators = info->pages;
> +	info->reg_desc = ltc2978_reg_desc;
> +	info->reg_matches = ltc2978_reg_matches;
> +	if (info->num_regulators > ARRAY_SIZE(ltc2978_reg_desc)) {
> +		dev_err(&client->dev, "num_regulators too large!");
> +		info->num_regulators = ARRAY_SIZE(ltc2978_reg_desc);
> +	}
> +#endif
> +
>  	return pmbus_do_probe(client, id, info);
>  }
>  
> -- 
> 1.7.9.5
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
