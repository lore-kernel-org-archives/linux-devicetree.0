From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 3/9] ARM: versatile: Map local timers using Device
 Tree when possible
Date: Thu, 15 Dec 2011 08:53:28 -0600
Message-ID: <4EEA09E8.3010807@gmail.com>
References: <1323957761-13553-1-git-send-email-pawel.moll@arm.com>
 <1323957761-13553-4-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1323957761-13553-4-git-send-email-pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/15/2011 08:02 AM, Pawel Moll wrote:
> Try to map TWD registers basing on a "arm,smp-twd" Device Tree
> node (compatible value as used in Highbank's DT). This overrides
> existing twd_base value.
> 
> Signed-off-by: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm/plat-versatile/localtimer.c |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-versatile/localtimer.c b/arch/arm/plat-versatile/localtimer.c
> index 0fb3961..8f0dc10 100644
> --- a/arch/arm/plat-versatile/localtimer.c
> +++ b/arch/arm/plat-versatile/localtimer.c
> @@ -11,6 +11,8 @@
>  #include <linux/init.h>
>  #include <linux/smp.h>
>  #include <linux/clockchips.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
>  
>  #include <asm/smp_twd.h>
>  #include <asm/localtimer.h>
> @@ -21,6 +23,16 @@
>   */
>  int __cpuinit local_timer_setup(struct clock_event_device *evt)
>  {
> +#if defined(CONFIG_OF)
> +	struct device_node *node = of_find_compatible_node(NULL,
> +			NULL, "arm,smp-twd");
> +
> +	if (node)
> +		twd_base = of_iomap(node, 0);
> +#endif

I think your previous version was more correct. This is going to find
the node and do ioremap N times where N is the number of cores. It does
work though because that is what I did initially too.

Rob
