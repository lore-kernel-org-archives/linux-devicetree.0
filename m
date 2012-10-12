From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH V2 3/3] ARM: SPEAr13xx: Pass DW DMAC platform data from DT
Date: Fri, 12 Oct 2012 16:48:37 +0200
Message-ID: <20121012144837.GE12801@game.jcrosoft.org>
References: <142ef9170a2c69657d8a05ac127a9970d7b04965.1350051925.git.viresh.kumar@linaro.org>
 <2039bc164224b0068bc078b6cd8df6218e754fce.1350051925.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2039bc164224b0068bc078b6cd8df6218e754fce.1350051925.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

>  
>  /* others */
> -#define DMAC0_BASE				UL(0xEA800000)
> -#define DMAC1_BASE				UL(0xEB000000)
>  #define MCIF_CF_BASE				UL(0xB2800000)
>  
>  /* Devices present in SPEAr1310 */
> diff --git a/arch/arm/mach-spear13xx/spear1310.c b/arch/arm/mach-spear13xx/spear1310.c
> index 9fbbfc5..0e60195 100644
> --- a/arch/arm/mach-spear13xx/spear1310.c
> +++ b/arch/arm/mach-spear13xx/spear1310.c
> @@ -36,9 +36,7 @@ static struct pl022_ssp_controller ssp1_plat_data = {
>  
>  /* Add SPEAr1310 auxdata to pass platform data */
>  static struct of_dev_auxdata spear1310_auxdata_lookup[] __initdata = {
> -	OF_DEV_AUXDATA("arasan,cf-spear1340", MCIF_CF_BASE, NULL, &cf_dma_priv),
> -	OF_DEV_AUXDATA("snps,dma-spear1340", DMAC0_BASE, NULL, &dmac_plat_data),
> -	OF_DEV_AUXDATA("snps,dma-spear1340", DMAC1_BASE, NULL, &dmac_plat_data),
> +	OF_DEV_AUXDATA("arasan,cf-spear1340", MCIF_CF_BASE, NULL, "cf"),
?/
>  	OF_DEV_AUXDATA("arm,pl022", SSP_BASE, NULL, &pl022_plat_data),
>  
>  	OF_DEV_AUXDATA("arm,pl022", SPEAR1310_SSP1_BASE, NULL, &ssp1_plat_data),
> diff --git a/arch/arm/mach-spear13xx/spear1340.c b/arch/arm/mach-spear13xx/spear1340.c
> index 081014f..7301f14 100644
> --- a/arch/arm/mach-spear13xx/spear1340.c
> +++ b/arch/arm/mach-spear13xx/spear1340.c
> @@ -20,7 +20,6 @@
>  #include <linux/of_platform.h>
>  #include <asm/hardware/gic.h>
>  #include <asm/mach/arch.h>
> -#include <mach/dma.h>
>  #include <mach/generic.h>
>  #include <mach/spear.h>
>  
> @@ -78,26 +77,10 @@
>  			(SPEAR1340_MIPHY_OSC_BYPASS_EXT | \
>  			SPEAR1340_MIPHY_PLL_RATIO_TOP(25))
>  

Best Regards,
J.
