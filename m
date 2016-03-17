From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 09/11] usb: ohci-da8xx: Remove code that references
 mach
Date: Thu, 17 Mar 2016 15:53:54 +0300
Message-ID: <56EAA8E2.7070904@cogentembedded.com>
References: <1458181615-27782-1-git-send-email-david@lechnology.com>
 <1458181615-27782-10-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458181615-27782-10-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Cc: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 3/17/2016 5:26 AM, David Lechner wrote:

> Including mach/* is frowned upon in device drivers, so get rid of it.
>
> This replaces usb20_clk and code that pokes CFGCHIP2 with a proper phy
> driver.
>
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> ---
>
> v2 changes: Uses the new phy driver instead of using a second clock.
>
>
>   drivers/usb/host/ohci-da8xx.c | 90 +++++++++++++++++++++----------------------
>   1 file changed, 44 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
> index e5c33bc..c648674 100644
> --- a/drivers/usb/host/ohci-da8xx.c
> +++ b/drivers/usb/host/ohci-da8xx.c
> @@ -15,58 +15,40 @@
>   #include <linux/jiffies.h>
>   #include <linux/platform_device.h>
>   #include <linux/clk.h>
> -
> -#include <mach/da8xx.h>
> +#include <linux/phy/phy.h>
>   #include <linux/platform_data/usb-davinci.h>
>
>   #ifndef CONFIG_ARCH_DAVINCI_DA8XX
>   #error "This file is DA8xx bus glue.  Define CONFIG_ARCH_DAVINCI_DA8XX."
>   #endif
>
> -#define CFGCHIP2	DA8XX_SYSCFG0_VIRT(DA8XX_CFGCHIP2_REG)
> -
>   static struct clk *usb11_clk;
> -static struct clk *usb20_clk;
> +static struct phy *usb11_phy;
>
>   /* Over-current indicator change bitmask */
>   static volatile u16 ocic_mask;
>
> -static void ohci_da8xx_clock(int on)
> +static int ohci_da8xx_enable(void)
>   {
[...]
> +	ret = clk_prepare_enable(usb11_clk);
> +	if (ret)
> +		return ret;
>
> -		/* Disable USB 1.1 PHY */
> -		cfgchip2 &= ~CFGCHIP2_USB1SUSPENDM;
> +	ret = phy_power_on(usb11_phy);

    Aren't you supposed to call phy_init() first?

> +	if (ret) {
> +		clk_disable_unprepare(usb11_clk);
> +		return ret;
>   	}
> -	__raw_writel(cfgchip2, CFGCHIP2);
> +
> +	return 0;
> +}
> +
> +static void ohci_da8xx_disable(void)
> +{
> +	phy_power_off(usb11_phy);

   ... and phy_exit() after that?

> +	clk_disable_unprepare(usb11_clk);
>   }
>
>   /*
[...]

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
