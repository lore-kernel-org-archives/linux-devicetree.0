From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 4/5] ARM: mxs: do not add dma device by default
Date: Wed, 18 Apr 2012 20:03:26 +0200
Message-ID: <201204182003.26359.marex@denx.de>
References: <1334753197-12032-1-git-send-email-b29396@freescale.com>
 <1334753197-12032-5-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1334753197-12032-5-git-send-email-b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dong Aisheng <b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Dong Aisheng,

> From: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> This will cause conflict when dt is enabled.
> So let each platform add dma devices respectively.
> 
> Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Reviewed-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>

> ---
>  arch/arm/mach-mxs/devices-mx23.h                |    2 ++
>  arch/arm/mach-mxs/devices-mx28.h                |    2 ++
>  arch/arm/mach-mxs/devices/platform-dma.c        |    3 +--
>  arch/arm/mach-mxs/include/mach/devices-common.h |    3 +++
>  arch/arm/mach-mxs/mach-apx4devkit.c             |    1 +
>  arch/arm/mach-mxs/mach-m28evk.c                 |    1 +
>  arch/arm/mach-mxs/mach-mx23evk.c                |    1 +
>  arch/arm/mach-mxs/mach-stmp378x_devb.c          |    1 +
>  arch/arm/mach-mxs/mach-tx28.c                   |    1 +
>  9 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-mxs/devices-mx23.h
> b/arch/arm/mach-mxs/devices-mx23.h index 4d1329d..5fc6b50 100644
> --- a/arch/arm/mach-mxs/devices-mx23.h
> +++ b/arch/arm/mach-mxs/devices-mx23.h
> @@ -35,3 +35,5 @@ struct platform_device *__init mx23_add_mxsfb(
>  		const struct mxsfb_platform_data *pdata);
> 
>  struct platform_device *__init mx23_add_rtc_stmp3xxx(void);
> +
> +#define mx23_add_dma()	mxs_add_mxs_dma()
> diff --git a/arch/arm/mach-mxs/devices-mx28.h
> b/arch/arm/mach-mxs/devices-mx28.h index 9dbeae1..0b3a62d 100644
> --- a/arch/arm/mach-mxs/devices-mx28.h
> +++ b/arch/arm/mach-mxs/devices-mx28.h
> @@ -55,3 +55,5 @@ extern const struct mxs_saif_data mx28_saif_data[]
> __initconst; mxs_add_saif(&mx28_saif_data[id], pdata)
> 
>  struct platform_device *__init mx28_add_rtc_stmp3xxx(void);
> +
> +#define mx28_add_dma()	mxs_add_mxs_dma()
> diff --git a/arch/arm/mach-mxs/devices/platform-dma.c
> b/arch/arm/mach-mxs/devices/platform-dma.c index aff4813..d0126ea 100644
> --- a/arch/arm/mach-mxs/devices/platform-dma.c
> +++ b/arch/arm/mach-mxs/devices/platform-dma.c
> @@ -30,7 +30,7 @@ static struct platform_device *__init mxs_add_dma(const
> char *devid, DMA_BIT_MASK(32));
>  }
> 
> -static int __init mxs_add_mxs_dma(void)
> +int __init mxs_add_mxs_dma(void)
>  {
>  	char *mx23_apbh = "imx23-dma-apbh";
>  	char *mx23_apbx = "imx23-dma-apbx";
> @@ -49,4 +49,3 @@ static int __init mxs_add_mxs_dma(void)
> 
>  	return 0;
>  }
> -arch_initcall(mxs_add_mxs_dma);
> diff --git a/arch/arm/mach-mxs/include/mach/devices-common.h
> b/arch/arm/mach-mxs/include/mach/devices-common.h index f2e3839..544b38d
> 100644
> --- a/arch/arm/mach-mxs/include/mach/devices-common.h
> +++ b/arch/arm/mach-mxs/include/mach/devices-common.h
> @@ -116,3 +116,6 @@ struct mxs_saif_data {
>  struct platform_device *__init mxs_add_saif(
>  		const struct mxs_saif_data *data,
>  		const struct mxs_saif_platform_data *pdata);
> +
> +/* dma */
> +int __init mxs_add_mxs_dma(void);
> diff --git a/arch/arm/mach-mxs/mach-apx4devkit.c
> b/arch/arm/mach-mxs/mach-apx4devkit.c index 48a7fab..92f47e9 100644
> --- a/arch/arm/mach-mxs/mach-apx4devkit.c
> +++ b/arch/arm/mach-mxs/mach-apx4devkit.c
> @@ -210,6 +210,7 @@ static void __init apx4devkit_init(void)
>  	mxs_iomux_setup_multiple_pads(apx4devkit_pads,
>  			ARRAY_SIZE(apx4devkit_pads));
> 
> +	mx28_add_dma();
>  	mx28_add_duart();
>  	mx28_add_auart0();
>  	mx28_add_auart1();
> diff --git a/arch/arm/mach-mxs/mach-m28evk.c
> b/arch/arm/mach-mxs/mach-m28evk.c index 06d7996..9a74ce6 100644
> --- a/arch/arm/mach-mxs/mach-m28evk.c
> +++ b/arch/arm/mach-mxs/mach-m28evk.c
> @@ -321,6 +321,7 @@ static void __init m28evk_init(void)
>  {
>  	mxs_iomux_setup_multiple_pads(m28evk_pads, ARRAY_SIZE(m28evk_pads));
> 
> +	mx28_add_dma();
>  	mx28_add_duart();
>  	mx28_add_auart0();
>  	mx28_add_auart3();
> diff --git a/arch/arm/mach-mxs/mach-mx23evk.c
> b/arch/arm/mach-mxs/mach-mx23evk.c index 5ea1c57..cabc884 100644
> --- a/arch/arm/mach-mxs/mach-mx23evk.c
> +++ b/arch/arm/mach-mxs/mach-mx23evk.c
> @@ -143,6 +143,7 @@ static void __init mx23evk_init(void)
> 
>  	mxs_iomux_setup_multiple_pads(mx23evk_pads, ARRAY_SIZE(mx23evk_pads));
> 
> +	mx23_add_dma();
>  	mx23_add_duart();
>  	mx23_add_auart0();
> 
> diff --git a/arch/arm/mach-mxs/mach-stmp378x_devb.c
> b/arch/arm/mach-mxs/mach-stmp378x_devb.c index a626c07..a391b9e 100644
> --- a/arch/arm/mach-mxs/mach-stmp378x_devb.c
> +++ b/arch/arm/mach-mxs/mach-stmp378x_devb.c
> @@ -88,6 +88,7 @@ static void __init stmp378x_dvb_init(void)
>  	mxs_iomux_setup_multiple_pads(stmp378x_dvb_pads,
>  			ARRAY_SIZE(stmp378x_dvb_pads));
> 
> +	mx23_add_dma();
>  	mx23_add_duart();
>  	mx23_add_auart0();
>  	mx23_add_rtc_stmp3xxx();
> diff --git a/arch/arm/mach-mxs/mach-tx28.c b/arch/arm/mach-mxs/mach-tx28.c
> index 2c0862e..e17e262 100644
> --- a/arch/arm/mach-mxs/mach-tx28.c
> +++ b/arch/arm/mach-mxs/mach-tx28.c
> @@ -149,6 +149,7 @@ static void __init tx28_stk5v3_init(void)
>  	mxs_iomux_setup_multiple_pads(tx28_stk5v3_pads,
>  			ARRAY_SIZE(tx28_stk5v3_pads));
> 
> +	mx28_add_dma();
>  	mx28_add_duart(); /* UART1 */
>  	mx28_add_auart(1); /* UART2 */

Best regards,
Marek Vasut
