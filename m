From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/3] iio: humidity: hdc100x: add match table and
 device id's
Date: Tue, 20 Jun 2017 17:48:49 +0100
Message-ID: <20170620174849.34cd0252@kernel.org>
References: <1497888066-12652-1-git-send-email-m-stecklein@ti.com>
        <1497888066-12652-3-git-send-email-m-stecklein@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497888066-12652-3-git-send-email-m-stecklein-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Stecklein <m-stecklein-l0cyMroinI0@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "Andrew F . Davis" <afd-l0cyMroinI0@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 19 Jun 2017 11:01:06 -0500
Michael Stecklein <m-stecklein-l0cyMroinI0@public.gmane.org> wrote:

> Add of_match_table and point it to a list of compatible device tree
> device id's.
> 
> Signed-off-by: Michael Stecklein <m-stecklein-l0cyMroinI0@public.gmane.org>
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan
> ---
>  drivers/iio/humidity/hdc100x.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/iio/humidity/hdc100x.c b/drivers/iio/humidity/hdc100x.c
> index 6778bc7..7851bd9 100644
> --- a/drivers/iio/humidity/hdc100x.c
> +++ b/drivers/iio/humidity/hdc100x.c
> @@ -429,9 +429,20 @@ static const struct i2c_device_id hdc100x_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, hdc100x_id);
>  
> +static const struct of_device_id hdc100x_dt_ids[] = {
> +	{ .compatible = "ti,hdc1000" },
> +	{ .compatible = "ti,hdc1008" },
> +	{ .compatible = "ti,hdc1010" },
> +	{ .compatible = "ti,hdc1050" },
> +	{ .compatible = "ti,hdc1080" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, hdc100x_dt_ids);
> +
>  static struct i2c_driver hdc100x_driver = {
>  	.driver = {
>  		.name	= "hdc100x",
> +		.of_match_table = of_match_ptr(hdc100x_dt_ids),
>  	},
>  	.probe = hdc100x_probe,
>  	.remove = hdc100x_remove,

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
