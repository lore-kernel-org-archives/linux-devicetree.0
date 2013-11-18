From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] itg3200: add dt support.
Date: Mon, 18 Nov 2013 11:57:42 +0000
Message-ID: <20131118115742.GG30853@e106331-lin.cambridge.arm.com>
References: <20131101154854.2d7d1432@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131101154854.2d7d1432-wvvUuzkyo1EYVZTmpyfIwg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Cc: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Manuel Stahl <manuel.stahl-GeUHRtUQU7nSyEMIgutvibNAH6kLmebB@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 01, 2013 at 04:48:54AM +0000, NeilBrown wrote:
> 
> 
> No new configuration, just a 'compatible' string and documentation.
> 
> Signed-off-by: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
> 
> diff --git a/Documentation/devicetree/bindings/iio/gyro/itg3200.txt b/Documentation/devicetree/bindings/iio/gyro/itg3200.txt
> new file mode 100644
> index 000000000000..4581620632df
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/gyro/itg3200.txt
> @@ -0,0 +1,20 @@
> +* InvenSense ITG3200 3-axis gyroscope
> +
> +Required properties:
> +
> +  - compatible : "invensense,itg3200"
> +  - reg : I2C address, typically 0x68
> +
> +Optional properties:
> +
> +  - interrupt-parent : should be the phandle for the interrupt controller
> +  - interrupts : interrupt mapping for GPIO IRQ

Why is this a "GPIO IRQ"? This device das no GPIO. The fact that it
might be wired to a GPIO controller has nothing to do with the ITG3200,
and shouldn't be a concern of its binding.

Thanks,
Mark.

> +
> +Example:
> +
> +itg3200@68 {
> +	compatible = "invensense,itg3200";
> +	reg = <0x68>;
> +	interrupt-parent = <&gpio2>;
> +	interrupts = <24 IRQ_TYPE_EDGE_RISING>;
> +};
> diff --git a/drivers/iio/gyro/itg3200_core.c b/drivers/iio/gyro/itg3200_core.c
> index 4d3f3b92b361..1ed3003ef41a 100644
> --- a/drivers/iio/gyro/itg3200_core.c
> +++ b/drivers/iio/gyro/itg3200_core.c
> @@ -374,10 +374,17 @@ static const struct i2c_device_id itg3200_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, itg3200_id);
>  
> +static const struct of_device_id itg3200_of_match[] = {
> +	{ .compatible = "invensense,itg3200", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, itg3200_of_match);
> +
>  static struct i2c_driver itg3200_driver = {
>  	.driver = {
>  		.owner  = THIS_MODULE,
>  		.name	= "itg3200",
> +		.of_match_table = of_match_ptr(itg3200_of_match),
>  	},
>  	.id_table	= itg3200_id,
>  	.probe		= itg3200_probe,
