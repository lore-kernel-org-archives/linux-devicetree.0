From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 5/5] iio: dac: mcp4725: add devicetree support
Date: Sat, 22 Oct 2016 19:26:30 +0100
Message-ID: <4a635f3f-3429-130a-1e7a-ed7b2cb82d08@kernel.org>
References: <1476812589-18333-1-git-send-email-tomas.novotny@tbs-biometrics.com>
 <1476812589-18333-6-git-send-email-tomas.novotny@tbs-biometrics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476812589-18333-6-git-send-email-tomas.novotny-MzfF5RY65ECbtNqbA8UwFdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomas Novotny <tomas.novotny-MzfF5RY65ECbtNqbA8UwFdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yong Li <sdliyong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 18/10/16 18:43, Tomas Novotny wrote:
> From: Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
> 
> Signed-off-by: Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
Applied to the togreg branch of iio.git. Initially pushed out as
testing for the autobuilders to play with it.

thanks,

Jonathan
> ---
>  drivers/iio/dac/mcp4725.c | 43 +++++++++++++++++++++++++++++++++++++------
>  1 file changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iio/dac/mcp4725.c b/drivers/iio/dac/mcp4725.c
> index 83d431f..05f7f4d 100644
> --- a/drivers/iio/dac/mcp4725.c
> +++ b/drivers/iio/dac/mcp4725.c
> @@ -19,6 +19,7 @@
>  #include <linux/err.h>
>  #include <linux/delay.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/of.h>
>  
>  #include <linux/iio/iio.h>
>  #include <linux/iio/sysfs.h>
> @@ -364,22 +365,41 @@ static const struct iio_info mcp4725_info = {
>  	.driver_module = THIS_MODULE,
>  };
>  
> +#ifdef CONFIG_OF
> +static int mcp4725_probe_dt(struct device *dev,
> +			    struct mcp4725_platform_data *pdata)
> +{
> +	struct device_node *np = dev->of_node;
> +
> +	if (!np)
> +		return -ENODEV;
> +
> +	/* check if is the vref-supply defined */
> +	pdata->use_vref = of_property_read_bool(np, "vref-supply");
> +	pdata->vref_buffered =
> +		of_property_read_bool(np, "microchip,vref-buffered");
> +
> +	return 0;
> +}
> +#else
> +static int mcp4725_probe_dt(struct device *dev,
> +			    struct mcp4725_platform_data *platform_data)
> +{
> +	return -ENODEV;
> +}
> +#endif
> +
>  static int mcp4725_probe(struct i2c_client *client,
>  			 const struct i2c_device_id *id)
>  {
>  	struct mcp4725_data *data;
>  	struct iio_dev *indio_dev;
> -	struct mcp4725_platform_data *pdata = dev_get_platdata(&client->dev);
> +	struct mcp4725_platform_data *pdata, pdata_dt;
>  	u8 inbuf[4];
>  	u8 pd;
>  	u8 ref;
>  	int err;
>  
> -	if (!pdata) {
> -		dev_err(&client->dev, "invalid platform data");
> -		return -EINVAL;
> -	}
> -
>  	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
>  	if (indio_dev == NULL)
>  		return -ENOMEM;
> @@ -387,6 +407,17 @@ static int mcp4725_probe(struct i2c_client *client,
>  	i2c_set_clientdata(client, indio_dev);
>  	data->client = client;
>  	data->id = id->driver_data;
> +	pdata = dev_get_platdata(&client->dev);
> +
> +	if (!pdata) {
> +		err = mcp4725_probe_dt(&client->dev, &pdata_dt);
> +		if (err) {
> +			dev_err(&client->dev,
> +				"invalid platform or devicetree data");
> +			return err;
> +		}
> +		pdata = &pdata_dt;
> +	}
>  
>  	if (data->id == MCP4725 && pdata->use_vref) {
>  		dev_err(&client->dev,
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
