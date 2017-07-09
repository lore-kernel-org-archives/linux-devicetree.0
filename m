From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/9] staging: iio: tsl2x7x: add of_match table for
 device tree support
Date: Sun, 9 Jul 2017 18:19:15 +0100
Message-ID: <20170709181915.75fb62ad@kernel.org>
References: <20170706225626.6716-1-masneyb@onstation.org>
        <20170706225626.6716-2-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170706225626.6716-2-masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon.Brenner-QzQKeY2x7wg@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu,  6 Jul 2017 18:56:18 -0400
Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org> wrote:

> Add device tree support for the tsl2x7x IIO driver with no custom
> properties. The device tree documentation is in a separate commit so
> that the changes to trivial-devices.txt can go in via the device
> tree subsystem.
> 
> Signed-off-by: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
> CC: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> CC: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan
> ---
>  drivers/staging/iio/light/tsl2x7x.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/staging/iio/light/tsl2x7x.c b/drivers/staging/iio/light/tsl2x7x.c
> index 1467199..8148986 100644
> --- a/drivers/staging/iio/light/tsl2x7x.c
> +++ b/drivers/staging/iio/light/tsl2x7x.c
> @@ -2026,6 +2026,21 @@ static struct i2c_device_id tsl2x7x_idtable[] = {
>  
>  MODULE_DEVICE_TABLE(i2c, tsl2x7x_idtable);
>  
> +static const struct of_device_id tsl2x7x_of_match[] = {
> +	{ .compatible = "amstaos,tsl2571" },
> +	{ .compatible = "amstaos,tsl2671" },
> +	{ .compatible = "amstaos,tmd2671" },
> +	{ .compatible = "amstaos,tsl2771" },
> +	{ .compatible = "amstaos,tmd2771" },
> +	{ .compatible = "amstaos,tsl2572" },
> +	{ .compatible = "amstaos,tsl2672" },
> +	{ .compatible = "amstaos,tmd2672" },
> +	{ .compatible = "amstaos,tsl2772" },
> +	{ .compatible = "amstaos,tmd2772" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, tsl2x7x_of_match);
> +
>  static const struct dev_pm_ops tsl2x7x_pm_ops = {
>  	.suspend = tsl2x7x_suspend,
>  	.resume  = tsl2x7x_resume,
> @@ -2035,6 +2050,7 @@ static const struct dev_pm_ops tsl2x7x_pm_ops = {
>  static struct i2c_driver tsl2x7x_driver = {
>  	.driver = {
>  		.name = "tsl2x7x",
> +		.of_match_table = tsl2x7x_of_match,
>  		.pm = &tsl2x7x_pm_ops,
>  	},
>  	.id_table = tsl2x7x_idtable,

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
