From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: si7020: Add devicetree support and trivial bindings
Date: Sun, 30 Oct 2016 16:30:07 +0000
Message-ID: <5c6795ad-85ce-3dd5-638b-f87f8240775a@kernel.org>
References: <20161025192010.11195-1-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161025192010.11195-1-contact-W9ppeneeCTY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 25/10/16 20:20, Paul Kocialkowski wrote:
> This adds devicetree support for the si7020 iio driver. Since it works
> well without requiring any additional property, its compatible string is
> added to the trivial i2c devices bindings list.
> 
> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Applied to the togreg branch of iio.git - initially pushed out as tesitng
for the autobuilders to play with it.

Thanks,

Jonathan
> ---
>  Documentation/devicetree/bindings/i2c/trivial-devices.txt |  1 +
>  drivers/iio/humidity/si7020.c                             | 11 ++++++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.txt b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> index 5c70ce9..6afba26 100644
> --- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> +++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> @@ -145,6 +145,7 @@ ricoh,rv5c387a		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
>  samsung,24ad0xd1	S524AD0XF1 (128K/256K-bit Serial EEPROM for Low Power)
>  sgx,vz89x		SGX Sensortech VZ89X Sensors
>  sii,s35390a		2-wire CMOS real-time clock
> +silabs,si7020		Relative Humidity and Temperature Sensors
>  skyworks,sky81452	Skyworks SKY81452: Six-Channel White LED Driver with Touch Panel Bias Supply
>  st,24c256		i2c serial eeprom  (24cxx)
>  st,m41t00		Serial real-time clock (RTC)
> diff --git a/drivers/iio/humidity/si7020.c b/drivers/iio/humidity/si7020.c
> index ffc2ccf..345a765 100644
> --- a/drivers/iio/humidity/si7020.c
> +++ b/drivers/iio/humidity/si7020.c
> @@ -154,8 +154,17 @@ static const struct i2c_device_id si7020_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, si7020_id);
>  
> +static const struct of_device_id si7020_dt_ids[] = {
> +	{ .compatible = "silabs,si7020" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, si7020_dt_ids);
> +
>  static struct i2c_driver si7020_driver = {
> -	.driver.name	= "si7020",
> +	.driver = {
> +		.name = "si7020",
> +		.of_match_table = of_match_ptr(si7020_dt_ids),
> +	},
>  	.probe		= si7020_probe,
>  	.id_table	= si7020_id,
>  };
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
