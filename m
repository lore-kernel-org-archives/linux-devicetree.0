From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 1/5] dt-bindings: mfd: Add Altera Arria10 SR Reset
 Controller bindings
Date: Wed, 15 Mar 2017 11:06:36 +0000
Message-ID: <20170315110636.gdqu2tiowfrdacwe@dell>
References: <1487783419-10912-1-git-send-email-thor.thayer@linux.intel.com>
 <1487783419-10912-2-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1487783419-10912-2-git-send-email-thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 22 Feb 2017, thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org wrote:

> From: Thor Thayer <thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> 
> This patch adds documentation for the Altera A10-SR Reset
> Controller DT bindings.
> 
> Signed-off-by: Thor Thayer <thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
> v2  No change
> ---
>  Documentation/devicetree/bindings/mfd/altera-a10sr.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Applied with Rob's Ack.

> diff --git a/Documentation/devicetree/bindings/mfd/altera-a10sr.txt b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
> index ea151f2..c8a7365 100644
> --- a/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
> +++ b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
> @@ -18,6 +18,7 @@ The A10SR consists of these sub-devices:
>  Device                   Description
>  ------                   ----------
>  a10sr_gpio               GPIO Controller
> +a10sr_rst                Reset Controller
>  
>  Arria10 GPIO
>  Required Properties:
> @@ -27,6 +28,11 @@ Required Properties:
>                        the second cell is used to specify flags.
>                        See ../gpio/gpio.txt for more information.
>  
> +Arria10 Peripheral PHY Reset
> +Required Properties:
> +- compatible        : Should be "altr,a10sr-reset"
> +- #reset-cells      : Should be one.
> +
>  Example:
>  
>          resource-manager@0 {
> @@ -43,4 +49,9 @@ Example:
>  			gpio-controller;
>  			#gpio-cells = <2>;
>  		};
> +
> +		a10sr_rst: reset-controller {
> +			compatible = "altr,a10sr-reset";
> +			#reset-cells = <1>;
> +		};
>  	};

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
