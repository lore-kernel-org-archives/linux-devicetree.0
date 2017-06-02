From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v4 1/2] Documentation: bindings: add
 amlogic,meson-gxbb-scpi-sensors compatible
Date: Fri, 2 Jun 2017 06:14:17 -0700
Message-ID: <8d0c867e-2b78-63fa-f422-709e515012ca@roeck-us.net>
References: <20170530090507.16611-1-carlo@caione.org>
 <20170530090507.16611-2-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170530090507.16611-2-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, jdelvare-IBi9RG/b67k@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, punit.agrawal-5wv7dgnIgG8@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/30/2017 02:05 AM, Carlo Caione wrote:
> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> 
> Introduce a new Amlogic specific compatible to handle how Amlogic reports
> the sensor readings from SCPI using a different scale.
> 
> Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

Formally waiting for DT approval. However, I don't see any problems with it,
so

Acked-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

Not sure what branch this is supposed to go through. For now I assume it
will be arm/arm64.

Thanks,
Guenter

> ---
>   Documentation/devicetree/bindings/arm/arm,scpi.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,scpi.txt b/Documentation/devicetree/bindings/arm/arm,scpi.txt
> index 4018319..40f50c1 100644
> --- a/Documentation/devicetree/bindings/arm/arm,scpi.txt
> +++ b/Documentation/devicetree/bindings/arm/arm,scpi.txt
> @@ -76,7 +76,7 @@ Sensor bindings for the sensors based on SCPI Message Protocol
>   SCPI provides an API to access the various sensors on the SoC.
>   
>   Required properties:
> -- compatible : should be "arm,scpi-sensors".
> +- compatible : should be "arm,scpi-sensors" or "amlogic,meson-gxbb-scpi-sensors"
>   - #thermal-sensor-cells: should be set to 1. This property follows the
>   			 thermal device tree bindings[2].
>   
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
