From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCHv2 4/5] mfd: altr_a10sr: Add Arria10 DevKit Reset
 Controller
Date: Tue, 28 Feb 2017 15:42:21 +0100
Message-ID: <1488292941.2288.55.camel@pengutronix.de>
References: <1487783419-10912-1-git-send-email-thor.thayer@linux.intel.com>
         <1487783419-10912-5-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487783419-10912-5-git-send-email-thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2017-02-22 at 11:10 -0600, thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org wrote:
> From: Thor Thayer <thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> 
> Add Peripheral PHY Reset Controller to the Arria10
> Development Kit System Resource Chip's MFD.
> 
> Signed-off-by: Thor Thayer <thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
> v2  Changes to commit header & body for clarification.
> ---
>  drivers/mfd/altera-a10sr.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mfd/altera-a10sr.c b/drivers/mfd/altera-a10sr.c
> index 06e1f7f..96e7d2c 100644
> --- a/drivers/mfd/altera-a10sr.c
> +++ b/drivers/mfd/altera-a10sr.c
> @@ -33,6 +33,10 @@
>  		.name = "altr_a10sr_gpio",
>  		.of_compatible = "altr,a10sr-gpio",
>  	},
> +	{
> +		.name = "altr_a10sr_reset",
> +		.of_compatible = "altr,a10sr-reset",
> +	},
>  };
>  
>  static bool altr_a10sr_reg_readable(struct device *dev, unsigned int reg)

Lee, should this be merged through the reset tree? Otherwise I'll just
pick up patches 1-3.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
