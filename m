From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 11/11] usb: musb: da8xx: Remove mach code
Date: Thu, 17 Mar 2016 16:11:37 +0300
Message-ID: <56EAAD09.3080600@cogentembedded.com>
References: <1458181615-27782-1-git-send-email-david@lechnology.com>
 <1458181615-27782-12-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458181615-27782-12-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Cc: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 3/17/2016 5:26 AM, David Lechner wrote:

> Use the new phy-da8xx-usb driver to take the place of the mach code that
> pokes CFGCHIP2 in the da8xx musb glue driver.
>
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> ---
>
> v2 changes: This is part of a previous patch that was split. This version uses
> the new phy driver instead of a second clock. It also gets rid of more mach
> code.
>
>
>   drivers/usb/musb/da8xx.c | 126 ++++++++++++-----------------------------------
>   1 file changed, 31 insertions(+), 95 deletions(-)
>
> diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
> index 50f07a5..1d51711 100644
> --- a/drivers/usb/musb/da8xx.c
> +++ b/drivers/usb/musb/da8xx.c
> @@ -30,13 +30,11 @@
>   #include <linux/clk.h>
>   #include <linux/err.h>
>   #include <linux/io.h>
> +#include <linux/phy/phy.h>
>   #include <linux/platform_device.h>
>   #include <linux/dma-mapping.h>
>   #include <linux/usb/usb_phy_generic.h>
>
> -#include <mach/da8xx.h>
> -#include <linux/platform_data/usb-davinci.h>

    I guess we can move this header back into mach/ now?

[...]
> @@ -383,31 +335,18 @@ static irqreturn_t da8xx_musb_interrupt(int irq, void *hci)
>   	return ret;
>   }
>
> +extern int da8xx_usb20_phy_set_mode(struct phy *phy, enum musb_mode mode);
> +

    You now need to select your new PHY driver since otherwise the kernel 
won't build.
    You can remove "depends on BROKEN" as well since your patch is un-breaking 
it. :-)

[...]
> @@ -425,19 +364,24 @@ static int da8xx_musb_init(struct musb *musb)
[...]
>   	/* Start the on-chip PHY and its PLL. */
> -	phy_on();
> +	phy_power_on(glue->phy);

    What about phy_init()?

> @@ -448,9 +392,12 @@ fail:
>
>   static int da8xx_musb_exit(struct musb *musb)
>   {
> +	struct da8xx_glue *glue = dev_get_drvdata(musb->controller->parent);
> +
>   	del_timer_sync(&otg_workaround);
>
> -	phy_off();
> +	phy_power_off(glue->phy);

    phy_exit()?

[...]
> @@ -503,19 +450,19 @@ static int da8xx_probe(struct platform_device *pdev)
[...]
>
>   	glue->dev			= &pdev->dev;
>   	pdata->platform_ops		= &da8xx_ops;
>
> -	glue->phy = usb_phy_generic_register();
> -	if (IS_ERR(glue->phy)) {
> -		ret = PTR_ERR(glue->phy);
> -		goto err5;
> +	glue->usb_phy = usb_phy_generic_register();

    Hm, do we still need the USB PHY? It does nothing IIRC...

[...]

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
