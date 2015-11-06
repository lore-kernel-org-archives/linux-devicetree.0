From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND 03/16] Documentation: dt-bindings: hwmon: add TI
 LMU HWMON binding information
Date: Thu, 5 Nov 2015 19:57:57 -0600
Message-ID: <20151106015757.GA32420@rob-hp-laptop>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
 <1446441875-1256-4-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1446441875-1256-4-git-send-email-milo.kim-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 02, 2015 at 02:24:22PM +0900, Milo Kim wrote:
> Hardware fault monitoring driver is used in LM3633 and LM3697 device.
> Just 'compatible' property is required to describe the driver.
> 
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> Cc: Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>
> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  Documentation/devicetree/bindings/hwmon/ti-lmu-hwmon.txt | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ti-lmu-hwmon.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti-lmu-hwmon.txt b/Documentation/devicetree/bindings/hwmon/ti-lmu-hwmon.txt
> new file mode 100644
> index 0000000..99cb241
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ti-lmu-hwmon.txt
> @@ -0,0 +1,12 @@
> +TI LMU Hardware Monotoring device tree bindings
> +
> +LMU HWON driver monitors hardware fault situation of LMU devices,
> +LM3633 and LM3697.
> +
> +Required properties:
> +  - compatible: Should be one of lists below.
> +                "ti,lm3633-hwmon"
> +                "ti,lm3697-hwmon"
> +
> +Examples: Please refer to ti-lmu dt-bindings.
> +          Documentation/devicetree/bindings/mfd/ti-lmu.txt
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
