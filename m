From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/7] ARM: mmp: append MMP_USE_OF config
Date: Tue, 19 Jul 2011 13:24:28 -0600
Message-ID: <20110719192428.GG6848@ponder.secretlab.ca>
References: <2011071901>
	<1311042290-20253-1-git-send-email-haojian.zhuang@marvell.com>
	<1311042290-20253-2-git-send-email-haojian.zhuang@marvell.com>
	<1311042290-20253-3-git-send-email-haojian.zhuang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1311042290-20253-3-git-send-email-haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 19, 2011 at 10:24:45AM +0800, Haojian Zhuang wrote:
> Since NR_IRQS is defined in irqs.h, parsing irq specifier will be started
> from NR_IRQS while both CONFIG_USE_OF and CONFIG_SPARSE_IRQ is enabled.
> It breaks the assumption that base irq is started from 0.
> 
> Add CONFIG_MMP_USE_OF config to distinguish. If CONFIG_MMP_USE_OF is set,
> NR_IRQS is defined as 0. Otherwise, it follows the original definition.
> 
> Signed-off-by: Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>

Don't do this.  It is completely valid and supported to have both DT
and non-DT support in the same kernel build.  This patch will break
that.

> ---
>  arch/arm/mach-mmp/Kconfig             |    7 +++++++
>  arch/arm/mach-mmp/include/mach/irqs.h |    4 ++++
>  2 files changed, 11 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-mmp/Kconfig b/arch/arm/mach-mmp/Kconfig
> index 67793a6..1efe994 100644
> --- a/arch/arm/mach-mmp/Kconfig
> +++ b/arch/arm/mach-mmp/Kconfig
> @@ -96,4 +96,11 @@ config CPU_MMP2
>  	select CPU_PJ4
>  	help
>  	  Select code specific to MMP2. MMP2 is ARMv7 compatible.
> +
> +config MMP_USE_OF
> +	bool "MMP Use OF"
> +	select USE_OF
> +	help
> +	  Select OF code to ARCH-MMP.
> +
>  endif
> diff --git a/arch/arm/mach-mmp/include/mach/irqs.h b/arch/arm/mach-mmp/include/mach/irqs.h
> index a09d328..538bb69 100644
> --- a/arch/arm/mach-mmp/include/mach/irqs.h
> +++ b/arch/arm/mach-mmp/include/mach/irqs.h
> @@ -224,6 +224,10 @@
>  
>  #define IRQ_BOARD_START			(IRQ_GPIO_START + IRQ_GPIO_NUM)
>  
> +#ifdef CONFIG_MMP_USE_OF
> +#define NR_IRQS				0
> +#else
>  #define NR_IRQS				(IRQ_BOARD_START)
> +#endif
>  
>  #endif /* __ASM_MACH_IRQS_H */
> -- 
> 1.5.6.5
> 
