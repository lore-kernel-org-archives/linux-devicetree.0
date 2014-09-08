From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/5] rtc: at91sam9: remove references to mach specific
 headers
Date: Mon, 8 Sep 2014 19:32:10 +0200
Message-ID: <20140908173210.GC14623@piout.net>
References: <1409733934-14465-1-git-send-email-boris.brezillon@free-electrons.com>
 <1409733934-14465-2-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1409733934-14465-2-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/09/2014 at 10:45:30 +0200, Boris Brezillon wrote :
> In order to support multi platform kernel drivers should not include
> machine specific headers.
> Copy RTT macros in the driver code and remove any machine specific
> headers.
> 
> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/rtc/rtc-at91sam9.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
> index 5963743..51f0038 100644
> --- a/drivers/rtc/rtc-at91sam9.c
> +++ b/drivers/rtc/rtc-at91sam9.c
> @@ -22,10 +22,6 @@
>  #include <linux/platform_data/atmel.h>
>  #include <linux/io.h>
>  
> -#include <mach/at91_rtt.h>
> -#include <mach/cpu.h>
> -#include <mach/hardware.h>
> -
>  /*
>   * This driver uses two configurable hardware resources that live in the
>   * AT91SAM9 backup power domain (intended to be powered at all times)
> @@ -47,6 +43,24 @@
>   * registers available, likewise usable for more than "RTC" support.
>   */
>  
> +#define AT91_RTT_MR		0x00			/* Real-time Mode Register */
> +#define AT91_RTT_RTPRES		(0xffff << 0)		/* Real-time Timer Prescaler Value */
> +#define AT91_RTT_ALMIEN		(1 << 16)		/* Alarm Interrupt Enable */
> +#define AT91_RTT_RTTINCIEN	(1 << 17)		/* Real Time Timer Increment Interrupt Enable */
> +#define AT91_RTT_RTTRST		(1 << 18)		/* Real Time Timer Restart */
> +
> +#define AT91_RTT_AR		0x04			/* Real-time Alarm Register */
> +#define AT91_RTT_ALMV		(0xffffffff)		/* Alarm Value */
> +
> +#define AT91_RTT_VR		0x08			/* Real-time Value Register */
> +#define AT91_RTT_CRTV		(0xffffffff)		/* Current Real-time Value */
> +
> +#define AT91_RTT_SR		0x0c			/* Real-time Status Register */
> +#define AT91_RTT_ALMS		(1 << 0)		/* Real-time Alarm Status */
> +#define AT91_RTT_RTTINC		(1 << 1)		/* Real-time Timer Increment */
> +
> +#define AT91_SLOW_CLOCK		32768

I would prefer that we get rid of AT91_SLOW_CLOCK or at east not
introduce new use of it.

Maybe we can clk_get_rate() on the provided clock and fall back on 32KHz
if no clock is provided, showing a warning.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
