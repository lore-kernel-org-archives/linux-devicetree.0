From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: brcmstb: Setup BIU control registers during boot
Date: Mon, 14 Sep 2015 13:48:33 -0700
Message-ID: <20150914204833.GA53555@google.com>
References: <1442260369-6575-1-git-send-email-f.fainelli@gmail.com>
 <1442260369-6575-4-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1442260369-6575-4-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 14, 2015 at 12:52:49PM -0700, Florian Fainelli wrote:
> Call brcmstb_biuctrl_init() in brcmstb's init_irq machine descriptor
> callback since we need to setup the Bus Interface Unit before SMP in
> particular, but we also need to be able to remap registers.
> 
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/mach-bcm/brcmstb.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/mach-bcm/brcmstb.c b/arch/arm/mach-bcm/brcmstb.c
> index 3a60f7ee3f0c..99a67cfb7c0d 100644
> --- a/arch/arm/mach-bcm/brcmstb.c
> +++ b/arch/arm/mach-bcm/brcmstb.c
> @@ -12,11 +12,19 @@
>   */
>  
>  #include <linux/init.h>
> +#include <linux/irqchip.h>
>  #include <linux/of_platform.h>
> +#include <linux/soc/brcmstb/brcmstb.h>
>  
>  #include <asm/mach-types.h>
>  #include <asm/mach/arch.h>
>  
> +static void __init brcmstb_init_irq(void)
> +{
> +	irqchip_init();
> +	brcmstb_biuctrl_init();

I believe you're introducing a dependency on CONFIG_SOC_BRCMSTB, but
it's not represented in Kconfig. Maybe SOC_BRCMSTB shouldn't be
user-selectable, and it should just be select-ed by ARCH_BRCMSTB?

Brian

> +}
> +
>  static const char *const brcmstb_match[] __initconst = {
>  	"brcm,bcm7445",
>  	"brcm,brcmstb",
> @@ -25,4 +33,5 @@ static const char *const brcmstb_match[] __initconst = {
>  
>  DT_MACHINE_START(BRCMSTB, "Broadcom STB (Flattened Device Tree)")
>  	.dt_compat	= brcmstb_match,
> +	.init_irq	= brcmstb_init_irq,
>  MACHINE_END
> -- 
> 2.1.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
