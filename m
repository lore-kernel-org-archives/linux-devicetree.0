From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 02/11] staging/iio: (iio_hwmon) Add support for sysfs
 name attribute
Date: Sat, 02 Feb 2013 09:52:34 +0000
Message-ID: <510CE1E2.5000704@kernel.org>
References: <1359668588-13678-1-git-send-email-linux@roeck-us.net> <1359668588-13678-3-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1359668588-13678-3-git-send-email-linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/31/2013 09:42 PM, Guenter Roeck wrote:
> The 'name' attribute is mandatory for hwmon devices.
> 
> Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Wow, that one character patch these crossed with manages to effect
this one as well.  Applied with the obvious tiny fix.

Thanks,
> ---
>  drivers/staging/iio/iio_hwmon.c |   12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/iio/iio_hwmon.c b/drivers/staging/iio/iio_hwmon.c
> index 5456272..7f260ea 100644
> --- a/drivers/staging/iio/iio_hwmon.c
> +++ b/drivers/staging/iio/iio_hwmon.c
> @@ -55,6 +55,14 @@ static ssize_t iio_hwmon_read_val(struct device *dev,
>  	return sprintf(buf, "%d\n", result);
>  }
>  
> +static ssize_t show_name(struct device *dev, struct device_attribute *attr,
> +			 char *buf)
> +{
> +	return sprintf(buf, "iio_hwmon\n");
> +}
> +
> +static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
> +
>  static int iio_hwmon_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -77,7 +85,7 @@ static int iio_hwmon_probe(struct platform_device *pdev)
>  		st->num_channels++;
>  
>  	st->attrs = devm_kzalloc(dev,
> -				 sizeof(st->attrs) * (st->num_channels + 1),
> +				 sizeof(st->attrs) * (st->num_channels + 2),
>  				 GFP_KERNEL);
>  	if (st->attrs == NULL) {
>  		ret = -ENOMEM;
> @@ -125,7 +133,7 @@ static int iio_hwmon_probe(struct platform_device *pdev)
>  		a->index = i;
>  		st->attrs[i] = &a->dev_attr.attr;
>  	}
> -
> +	st->attrs[st->num_channels] = &dev_attr_name.attr;
>  	st->attr_group.attrs = st->attrs;
>  	platform_set_drvdata(pdev, st);
>  	ret = sysfs_create_group(&dev->kobj, &st->attr_group);
> 
