From: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 02/10 v3] usb: usb251xb: Add USB2517i specific struct and
 IDs
Date: Mon, 23 Oct 2017 23:47:02 +0200
Message-ID: <6bbb6ef6-41bc-a30b-8baf-80f765320d97@skidata.com>
References: <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20171022203812.9379-1-fancer.lancer@gmail.com>
 <20171022203812.9379-3-fancer.lancer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171022203812.9379-3-fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: de-AT
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,
please see comments below for some nit-picks.

On 10/22/2017 10:38 PM, Serge Semin wrote:
> There are USB2517 and USB2517i hubs, which have almost the same
> registers space as already supported USB251xBi series. The difference
> it in DIDs and in a few functions. This patch adds the USB2517/i data
> structures to the driver, so it would have different setting depending
> on the device discovered on i2c-bus.
> 
> Signed-off-by: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   drivers/usb/misc/Kconfig    |  4 ++--
>   drivers/usb/misc/usb251xb.c | 23 +++++++++++++++++++++--
>   2 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> index 37dd1c018..27b9fcbdf 100644
> --- a/drivers/usb/misc/Kconfig
> +++ b/drivers/usb/misc/Kconfig
> @@ -247,8 +247,8 @@ config USB_HUB_USB251XB
>   	depends on I2C
>   	help
>   	  This option enables support for configuration via SMBus of the
> -	  Microchip USB251xB/xBi USB 2.0 Hub Controller series.
> -	  Configuration parameters may be set in devicetree or platform data.
> +	  Microchip USB251x/xBi USB 2.0 Hub Controller series. Configuration
> +	  parameters may be set in devicetree or platform data.

Here you have "USB251x/xBi"...

>   	  Say Y or M here if you need to configure such a device via SMBus.
>   
>   config USB_HSIC_USB3503
> diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> index 91f66d68b..22c32ea3f 100644
> --- a/drivers/usb/misc/usb251xb.c
> +++ b/drivers/usb/misc/usb251xb.c

...

> @@ -82,7 +83,7 @@
>   
>   #define USB251XB_ADDR_PRODUCT_STRING_LEN	0x14
>   #define USB251XB_ADDR_PRODUCT_STRING		0x54
> -#define USB251XB_DEF_PRODUCT_STRING		"USB251xB/xBi"
> +#define USB251XB_DEF_PRODUCT_STRING		"USB251xB/xBi/7i"

but here you have "USB251xB/xBi/7i"...

>   
>   #define USB251XB_ADDR_SERIAL_STRING_LEN		0x15
>   #define USB251XB_ADDR_SERIAL_STRING		0x92

...

> @@ -590,5 +609,5 @@ static struct i2c_driver usb251xb_i2c_driver = {
>   module_i2c_driver(usb251xb_i2c_driver);
>   
>   MODULE_AUTHOR("Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>");
> -MODULE_DESCRIPTION("USB251xB/xBi USB 2.0 Hub Controller Driver");
> +MODULE_DESCRIPTION("USB251x/xBi USB 2.0 Hub Controller Driver");

... and here again "USB251x/xBi"...

>   MODULE_LICENSE("GPL");
> 

I'd prefer to use just one "name" for the driver. If you be precise that 
would be "USB251xB/xBi/xi". But that seems a bit overloaded to me. AFAIK 
the "B" and "i" prepended to the type have no affect on the I2C 
interface/register map, so maybe "USB251x" would be sufficient?

kind regards,
Richard.L
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
