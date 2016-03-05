From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH 4/5] ARM: socfpga: Enable Arria10 L2 cache ECC on
 startup
Date: Sat, 5 Mar 2016 00:36:16 -0600
Message-ID: <alpine.DEB.2.02.1603050030190.9477@linux-builds1>
References: <1456850301-22066-1-git-send-email-tthayer@opensource.altera.com> <1456850301-22066-4-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456850301-22066-4-git-send-email-tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
Cc: bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 1 Mar 2016, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:

> From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> 
> Enable ECC for Arria10 L2 cache on machine startup. The ECC has to be
> enabled before data is stored in memory otherwise the ECC will fail
> on reads.
> 
> Signed-off-by: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> ---
>  arch/arm/mach-socfpga/l2_cache.c |   42 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 38 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-socfpga/l2_cache.c b/arch/arm/mach-socfpga/l2_cache.c
> index e3907ab..b197218 100644
> --- a/arch/arm/mach-socfpga/l2_cache.c
> +++ b/arch/arm/mach-socfpga/l2_cache.c
> @@ -17,14 +17,31 @@
>  #include <linux/of_platform.h>
>  #include <linux/of_address.h>
>  
> +#include "core.h"
> +
> +/* A10 System Manager ECC interrupt mask control registers */
> +#define A10_L2_ECC_CTRL_OFST            0x0
> +
> +#define A10_SYSMGR_ECC_INTMASK_CLR_OFST 0x98
> +#define A10_L2_ECC_INT_CLR_OFST         0xA8
> +
> +#define A10_MPU_CTRL_L2_ECC_EN          BIT(0)
> +#define A10_ECC_INTMASK_CLR_EN          BIT(0)
> +#define A10_ECC_INT_CLR                 (BIT(31) | BIT(15))
> +
>  void socfpga_init_l2_ecc(void)
>  {
>  	struct device_node *np;
>  	void __iomem *mapped_l2_edac_addr;
> +	const char *compat = "altr,socfpga-l2-ecc";
>  
> -	np = of_find_compatible_node(NULL, NULL, "altr,socfpga-l2-ecc");
> +	if (of_machine_is_compatible("altr,socfpga-arria10"))
> +		compat = "altr,socfpga-a10-l2-ecc";

The ARM maintainers have made comment to me about about trying to not sprinkle
these of_machine_is_compatible() all over the place. You should make the
decision during the initial probe of the machine. Please look at how the
.restart is differentiate between the 2 platforms.


> +
> +	/* Find the L2 EDAC device tree node */
> +	np = of_find_compatible_node(NULL, NULL, compat);
>  	if (!np) {
> -		pr_err("Unable to find socfpga-l2-ecc in dtb\n");
> +		pr_err("Unable to find %s in dtb\n", compat);
>  		return;
>  	}
>  
> @@ -35,7 +52,24 @@ void socfpga_init_l2_ecc(void)
>  		return;
>  	}
>  
> -	/* Enable ECC */
> -	writel(0x01, mapped_l2_edac_addr);
> +	if (of_machine_is_compatible("altr,socfpga-arria10")) {

Same comment as above here.

BR,
Dinh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
