From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [2/2] hwmon: add dt binding for max1619
Date: Sun, 1 Oct 2017 07:13:01 -0700
Message-ID: <20171001141301.GA31794@roeck-us.net>
References: <20170911191649.3344-2-atull@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170911191649.3344-2-atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 11, 2017 at 02:16:49PM -0500, Alan Tull wrote:
> Add new device tree binding for max1619.
> 
> Signed-off-by: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>
> Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/max1619.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/hwmon/max1619.c b/drivers/hwmon/max1619.c
> index a182789..76d9669 100644
> --- a/drivers/hwmon/max1619.c
> +++ b/drivers/hwmon/max1619.c
> @@ -303,10 +303,20 @@ static const struct i2c_device_id max1619_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, max1619_id);
>  
> +#ifdef CONFIG_OF
> +static const struct of_device_id max1619_of_match[] = {
> +	{ .compatible = "maxim,max1619", },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, max1619_of_match);
> +#endif
> +
>  static struct i2c_driver max1619_driver = {
>  	.class		= I2C_CLASS_HWMON,
>  	.driver = {
>  		.name	= "max1619",
> +		.of_match_table = of_match_ptr(max1619_of_match),
>  	},
>  	.probe		= max1619_probe,
>  	.id_table	= max1619_id,
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
