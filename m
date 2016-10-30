From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 08/10] staging: iio: tsl2583: use IIO_*_ATTR* macros to
 create sysfs entries
Date: Sun, 30 Oct 2016 18:38:56 +0000
Message-ID: <cab52ad3-b800-6825-d858-81b9f647ebdd@kernel.org>
References: <1477648821-3786-1-git-send-email-masneyb@onstation.org>
 <1477648821-3786-9-git-send-email-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477648821-3786-9-git-send-email-masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Mark.Rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 28/10/16 11:00, Brian Masney wrote:
> Use the IIO_CONST_ATTR, IIO_DEVICE_ATTR_RW, and IIO_DEVICE_ATTR_WO
> macros for creating the in_illuminance_calibscale_available,
> in_illuminance_integration_time_available, in_illuminance_input_target,
> in_illuminance_calibrate, and in_illuminance_lux_table sysfs entries.
> Previously these sysfs entries were prefixed with illuminance0_, however
> they are now prefixed with in_illuminance_ to make these sysfs entries
> consistent with how the IIO core is creating the other sysfs entries.
> 
> Signed-off-by: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
Applied.

Thanks,

Jonathan
> ---
>  drivers/staging/iio/light/tsl2583.c | 73 ++++++++++++++-----------------------
>  1 file changed, 27 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/staging/iio/light/tsl2583.c b/drivers/staging/iio/light/tsl2583.c
> index bfff6ca..1462374 100644
> --- a/drivers/staging/iio/light/tsl2583.c
> +++ b/drivers/staging/iio/light/tsl2583.c
> @@ -29,6 +29,7 @@
>  #include <linux/slab.h>
>  #include <linux/module.h>
>  #include <linux/iio/iio.h>
> +#include <linux/iio/sysfs.h>
>  
>  #define TSL258X_MAX_DEVICE_REGS		32
>  
> @@ -506,24 +507,9 @@ static int taos_chip_off(struct iio_dev *indio_dev)
>  
>  /* Sysfs Interface Functions */
>  
> -static ssize_t taos_gain_available_show(struct device *dev,
> -					struct device_attribute *attr,
> -					char *buf)
> -{
> -	return sprintf(buf, "%s\n", "1 8 16 111");
> -}
> -
> -static ssize_t taos_als_time_available_show(struct device *dev,
> -					    struct device_attribute *attr,
> -					    char *buf)
> -{
> -	return sprintf(buf, "%s\n",
> -		"0.000050 0.000100 0.000150 0.000200 0.000250 0.000300 0.000350 0.000400 0.000450 0.000500 0.000550 0.000600 0.000650");
> -}
> -
> -static ssize_t taos_als_cal_target_show(struct device *dev,
> -					struct device_attribute *attr,
> -					char *buf)
> +static ssize_t in_illuminance_input_target_show(struct device *dev,
> +						struct device_attribute *attr,
> +						char *buf)
>  {
>  	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
>  	struct tsl2583_chip *chip = iio_priv(indio_dev);
> @@ -531,9 +517,9 @@ static ssize_t taos_als_cal_target_show(struct device *dev,
>  	return sprintf(buf, "%d\n", chip->taos_settings.als_cal_target);
>  }
>  
> -static ssize_t taos_als_cal_target_store(struct device *dev,
> -					 struct device_attribute *attr,
> -					 const char *buf, size_t len)
> +static ssize_t in_illuminance_input_target_store(struct device *dev,
> +						 struct device_attribute *attr,
> +						 const char *buf, size_t len)
>  {
>  	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
>  	struct tsl2583_chip *chip = iio_priv(indio_dev);
> @@ -548,9 +534,9 @@ static ssize_t taos_als_cal_target_store(struct device *dev,
>  	return len;
>  }
>  
> -static ssize_t taos_do_calibrate(struct device *dev,
> -				 struct device_attribute *attr,
> -				 const char *buf, size_t len)
> +static ssize_t in_illuminance_calibrate_store(struct device *dev,
> +					      struct device_attribute *attr,
> +					      const char *buf, size_t len)
>  {
>  	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
>  	int value;
> @@ -564,8 +550,9 @@ static ssize_t taos_do_calibrate(struct device *dev,
>  	return len;
>  }
>  
> -static ssize_t taos_luxtable_show(struct device *dev,
> -				  struct device_attribute *attr, char *buf)
> +static ssize_t in_illuminance_lux_table_show(struct device *dev,
> +					     struct device_attribute *attr,
> +					     char *buf)
>  {
>  	int i;
>  	int offset = 0;
> @@ -589,9 +576,9 @@ static ssize_t taos_luxtable_show(struct device *dev,
>  	return offset;
>  }
>  
> -static ssize_t taos_luxtable_store(struct device *dev,
> -				   struct device_attribute *attr,
> -				   const char *buf, size_t len)
> +static ssize_t in_illuminance_lux_table_store(struct device *dev,
> +					      struct device_attribute *attr,
> +					      const char *buf, size_t len)
>  {
>  	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
>  	struct tsl2583_chip *chip = iio_priv(indio_dev);
> @@ -635,25 +622,19 @@ static ssize_t taos_luxtable_store(struct device *dev,
>  	return ret;
>  }
>  
> -static DEVICE_ATTR(illuminance0_calibscale_available, S_IRUGO,
> -		taos_gain_available_show, NULL);
> -
> -static DEVICE_ATTR(illuminance0_integration_time_available, S_IRUGO,
> -		taos_als_time_available_show, NULL);
> -
> -static DEVICE_ATTR(illuminance0_input_target, S_IRUGO | S_IWUSR,
> -		taos_als_cal_target_show, taos_als_cal_target_store);
> -
> -static DEVICE_ATTR(illuminance0_calibrate, S_IWUSR, NULL, taos_do_calibrate);
> -static DEVICE_ATTR(illuminance0_lux_table, S_IRUGO | S_IWUSR,
> -		taos_luxtable_show, taos_luxtable_store);
> +static IIO_CONST_ATTR(in_illuminance_calibscale_available, "1 8 16 111");
> +static IIO_CONST_ATTR(in_illuminance_integration_time_available,
> +		      "0.000050 0.000100 0.000150 0.000200 0.000250 0.000300 0.000350 0.000400 0.000450 0.000500 0.000550 0.000600 0.000650");
> +static IIO_DEVICE_ATTR_RW(in_illuminance_input_target, 0);
> +static IIO_DEVICE_ATTR_WO(in_illuminance_calibrate, 0);
> +static IIO_DEVICE_ATTR_RW(in_illuminance_lux_table, 0);
>  
>  static struct attribute *sysfs_attrs_ctrl[] = {
> -	&dev_attr_illuminance0_calibscale_available.attr,
> -	&dev_attr_illuminance0_integration_time_available.attr,
> -	&dev_attr_illuminance0_input_target.attr,
> -	&dev_attr_illuminance0_calibrate.attr,
> -	&dev_attr_illuminance0_lux_table.attr,
> +	&iio_const_attr_in_illuminance_calibscale_available.dev_attr.attr,
> +	&iio_const_attr_in_illuminance_integration_time_available.dev_attr.attr,
> +	&iio_dev_attr_in_illuminance_input_target.dev_attr.attr,
> +	&iio_dev_attr_in_illuminance_calibrate.dev_attr.attr,
> +	&iio_dev_attr_in_illuminance_lux_table.dev_attr.attr,
>  	NULL
>  };
>  
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
