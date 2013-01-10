From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [RFC PATCH 4/7] ARM: s3c64xx: Fix build error with
 CONFIG_S3C_DEV_FB disabled
Date: Wed, 09 Jan 2013 16:15:23 -0800
Message-ID: <00a201cdeec7$99f5d560$cde18020$@samsung.com>
References: <1357774909-29938-1-git-send-email-tomasz.figa@gmail.com>
 <1357774909-29938-5-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1357774909-29938-5-git-send-email-tomasz.figa@gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk
List-Id: devicetree@vger.kernel.org

Tomasz Figa wrote:
> 
> If there is no board selecting CONFIG_S3C_DEV_FB enabled, build will fail
on
> arch/arm/mach-s3c64xx/pm.c, where s3c_device_fb is referenced.
> 
> This patch adds ifdef guard around the code making it compile only when
> CONFIG_S3C_DEV_FB is enabled.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---
>  arch/arm/mach-s3c64xx/pm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c64xx/pm.c b/arch/arm/mach-s3c64xx/pm.c
> index f6b13a2..3686785 100644
> --- a/arch/arm/mach-s3c64xx/pm.c
> +++ b/arch/arm/mach-s3c64xx/pm.c
> @@ -338,10 +338,10 @@ int __init s3c64xx_pm_init(void)
> 
>  	for (i = 0; i < ARRAY_SIZE(s3c64xx_pm_domains); i++)
>  		pm_genpd_init(&s3c64xx_pm_domains[i]->pd, NULL, false);
> -
> +#ifdef CONFIG_S3C_DEV_FB
>  	if (dev_get_platdata(&s3c_device_fb.dev))
>  		pm_genpd_add_device(&s3c64xx_pm_f.pd,
> &s3c_device_fb.dev);
> -
> +#endif
>  	return 0;
>  }
> 
> --
> 1.8.1

This should be separated patch from this series as a fix.

Let me pick this up into -fixes.

Thanks.

- Kukjin
