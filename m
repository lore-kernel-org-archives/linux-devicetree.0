From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 4/5] mfd: altr_a10sr: Add Arria10 DevKit Reset
 Controller
Date: Wed, 15 Mar 2017 11:06:08 +0000
Message-ID: <20170315110608.5qgyj5pwsr7lr6zz@dell>
References: <1487783419-10912-1-git-send-email-thor.thayer@linux.intel.com>
 <1487783419-10912-5-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1487783419-10912-5-git-send-email-thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 22 Feb 2017, thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org wrote:

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

Sorry for the delay, I've been AFK on vacation and conferences.

Applied, thanks.

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

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
