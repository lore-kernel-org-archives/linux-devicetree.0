From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] Drivers: MUSB: Davinci MUSB: added DT support
Date: Thu, 21 Jan 2016 21:05:29 +0300
Message-ID: <56A11DE9.6060406@cogentembedded.com>
References: <1453387999-4485-1-git-send-email-petr@barix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453387999-4485-1-git-send-email-petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 01/21/2016 05:53 PM, Petr Kulhavy wrote:

> TI DaVinci MUSB driver equipped with DeviceTree support.
> Tested with AM1808 board and USB2.0 (OTG) in host mode.
>
> Signed-off-by: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
> ---
>   .../devicetree/bindings/usb/da8xx-usb.txt          |  52 +++++++
>   drivers/usb/musb/da8xx.c                           | 166 +++++++++++++++++++++

    DA8xx is not a real DaVinci. DaVincis have their own glue layer, davinci.c.

>   include/linux/platform_data/usb-davinci.h          |   3 +-
>   3 files changed, 220 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/usb/da8xx-usb.txt

[...]
> diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
> index 4e13fe2..2c00e98 100644
> --- a/drivers/usb/musb/da8xx.c
> +++ b/drivers/usb/musb/da8xx.c
[...]
> @@ -627,11 +777,27 @@ static int da8xx_remove(struct platform_device *pdev)
>   	return 0;
>   }
>
> +#ifdef CONFIG_OF
> +static const struct of_device_id da8xx_id_table[] = {
> +	{
> +		.compatible = "ti,da850-musb"
> +	},
> +	{
> +		.compatible = "ti,da830-musb"
> +	},

    What's the difference b/w DA830 and DA850? You don't seem to differ them...

> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, da8xx_id_table);
> +#endif
> +
>   static struct platform_driver da8xx_driver = {
>   	.probe		= da8xx_probe,
>   	.remove		= da8xx_remove,
>   	.driver		= {
>   		.name	= "musb-da8xx",
> +#ifdef CONFIG_OF
> +		.of_match_table = of_match_ptr(da8xx_id_table),
> +#endif

    With of_match_ptr() you shouldn't need this #ifdef.

[...]
> diff --git a/include/linux/platform_data/usb-davinci.h b/include/linux/platform_data/usb-davinci.h
> index e0bc4ab..bd2a5a9 100644
> --- a/include/linux/platform_data/usb-davinci.h
> +++ b/include/linux/platform_data/usb-davinci.h
> @@ -21,7 +21,8 @@
>   #define CFGCHIP2_FORCE_DEVICE 	(2 << 13)
>   #define CFGCHIP2_FORCE_HOST_VBUS_LOW (3 << 13)
>   #define CFGCHIP2_USB1PHYCLKMUX	(1 << 12)
> -#define CFGCHIP2_USB2PHYCLKMUX	(1 << 11)
> +#define CFGCHIP2_USB2PHYCLKMUX_OFFSET	(11)

    I'd prefer *_SHIFT if you must #define it.

> +#define CFGCHIP2_USB2PHYCLKMUX	(1 << CFGCHIP2_USB2PHYCLKMUX_OFFSET)
>   #define CFGCHIP2_PHYPWRDN	(1 << 10)
>   #define CFGCHIP2_OTGPWRDN	(1 << 9)
>   #define CFGCHIP2_DATPOL 	(1 << 8)

    More comments later, when the time permits...

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
