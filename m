From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v9 RESEND 1/3] watchdog: at91sam9_wdt: add device tree
 support
Date: Fri, 16 Nov 2012 15:56:15 +0100
Message-ID: <50A6540F.9070308@atmel.com>
References: <1352709447-8306-1-git-send-email-fabio.porcedda@gmail.com>
 <1352709447-8306-2-git-send-email-fabio.porcedda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1352709447-8306-2-git-send-email-fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "Yang,
 Wenyou" <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, LIN Junmin <JM.Lin-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/12/2012 09:37 AM, Fabio Porcedda :
> Tested on an at91sam9260 board (evk-pro3)
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
(and to the whole patch series actually)

Wim, can you tell me if it is possible to merge this part through
arm-soc git tree with the rest of material for AT91? If yes, I would
need your Acked-by...

Thanks, best regards,

> ---
>  Documentation/devicetree/bindings/watchdog/atmel-wdt.txt | 15 +++++++++++++++
>  drivers/watchdog/at91sam9_wdt.c                          | 11 +++++++++++
>  2 files changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/atmel-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt b/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt
> new file mode 100644
> index 0000000..2957ebb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt
> @@ -0,0 +1,15 @@
> +* Atmel Watchdog Timers
> +
> +** at91sam9-wdt
> +
> +Required properties:
> +- compatible: must be "atmel,at91sam9260-wdt".
> +- reg: physical base address of the controller and length of memory mapped
> +  region.
> +
> +Example:
> +
> +	watchdog@fffffd40 {
> +		compatible = "atmel,at91sam9260-wdt";
> +		reg = <0xfffffd40 0x10>;
> +	};
> diff --git a/drivers/watchdog/at91sam9_wdt.c b/drivers/watchdog/at91sam9_wdt.c
> index 05e1be8..dc42e44 100644
> --- a/drivers/watchdog/at91sam9_wdt.c
> +++ b/drivers/watchdog/at91sam9_wdt.c
> @@ -32,6 +32,7 @@
>  #include <linux/timer.h>
>  #include <linux/bitops.h>
>  #include <linux/uaccess.h>
> +#include <linux/of.h>
>  
>  #include "at91sam9_wdt.h"
>  
> @@ -302,11 +303,21 @@ static int __exit at91wdt_remove(struct platform_device *pdev)
>  	return res;
>  }
>  
> +#if defined(CONFIG_OF)
> +static const struct of_device_id at91_wdt_dt_ids[] __initconst = {
> +	{ .compatible = "atmel,at91sam9260-wdt" },
> +	{ /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, at91_wdt_dt_ids);
> +#endif
> +
>  static struct platform_driver at91wdt_driver = {
>  	.remove		= __exit_p(at91wdt_remove),
>  	.driver		= {
>  		.name	= "at91_wdt",
>  		.owner	= THIS_MODULE,
> +		.of_match_table = of_match_ptr(at91_wdt_dt_ids),
>  	},
>  };
>  
> 


-- 
Nicolas Ferre
