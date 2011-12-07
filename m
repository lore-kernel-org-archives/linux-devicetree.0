From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 5/6] ARM: vexpress: DT-based support for Cortex-A5 and
 Cortex-A9 based tiles
Date: Wed, 7 Dec 2011 15:33:38 +0000
Message-ID: <20111207153338.GD2910@linaro.org>
References: <1323186229-22054-1-git-send-email-pawel.moll@arm.com>
 <1323186229-22054-6-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1323186229-22054-6-git-send-email-pawel.moll-5wv7dgnIgG8@public.gmane.org>
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

On Tue, Dec 06, 2011 at 03:43:48PM +0000, Pawel Moll wrote:

[...]

> diff --git a/arch/arm/mach-vexpress/Kconfig b/arch/arm/mach-vexpress/Kconfig
> index 56a61fb..c1cd08d 100644
> --- a/arch/arm/mach-vexpress/Kconfig
> +++ b/arch/arm/mach-vexpress/Kconfig
> @@ -1,13 +1,23 @@
>  menu "Versatile Express platform type"
>  	depends on ARCH_VEXPRESS
>  
> -config ARCH_VEXPRESS_CA9X4
> -	bool "Versatile Express Cortex-A9x4 tile"
> -	select CPU_V7
> -	select ARM_GIC
> +config ARCH_VEXPRESS_CORTEX_A5_A9
> +	bool
>  	select ARM_ERRATA_720789
>  	select ARM_ERRATA_751472
> -	select ARM_ERRATA_753970
> +	select ARM_GIC
> +	select CPU_V7
> +	select HAVE_L2X0_L2CC
> +	select PL310_ERRATA_753970 if CACHE_PL310
> +	help
> +	  Provides common dependencies for Versatile Express platforms
> +	  based on Cortex-A5 and Cortex-A9 processors. In order to
> +	  build a working kernel, you must also enable relevant core
> +	  tile support or Flattened Device Tree based support options.
> +
> +config ARCH_VEXPRESS_CA9X4
> +	bool "Versatile Express Cortex-A9x4 tile"
> +	select ARCH_VEXPRESS_CORTEX_A5_A9
>  
>  config ARCH_VEXPRESS_DT
>  	bool "Device Tree support for Versatile Express platforms"
> @@ -21,4 +31,23 @@ config ARCH_VEXPRESS_DT
>  	  If your bootloader supports Flattened Device Tree based booting,
>  	  say Y here.

Oh, we should select HAVE_PATA_PLATFORM in here somewhere too.
But that's not critical for this series.

Cheers
---Dave
