From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] MAINTAINERS: Add missing platform maintainers for dts files
Date: Fri, 11 Dec 2015 09:13:53 +0900
Message-ID: <566A1541.5050201@samsung.com>
References: <1449790703-12054-1-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1449790703-12054-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Viresh Kumar <vireshk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shiraz Hashim <shiraz.linux.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11.12.2015 08:38, Rob Herring wrote:
> Platform dts files need to be reviewed primarily by the platform
> maintainers as dts files typically go in thru their trees. Add the missing
> paths where there are existing maintainers listed.
> 
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  MAINTAINERS | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 69c8a9c..415b731 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -950,6 +950,8 @@ M:	Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>  L:	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	arch/arm/mach-highbank/
> +F:	arch/arm/boot/dts/highbank.dts
> +F:	arch/arm/boot/dts/ecx-*.dts*
>  
>  ARM/CAVIUM NETWORKS CNS3XXX MACHINE SUPPORT
>  M:	Krzysztof Halasa <khalasa-NlWvg49iv0c@public.gmane.org>
> @@ -1025,6 +1027,7 @@ M:	Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>  L:	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/baohua/linux.git
>  S:	Maintained
> +F:	arch/arm/boot/dts/prima2*
>  F:	arch/arm/mach-prima2/
>  F:	drivers/clk/sirf/
>  F:	drivers/clocksource/timer-prima2.c
> @@ -1126,6 +1129,10 @@ W:	http://www.hisilicon.com
>  S:	Supported
>  T:	git git://github.com/hisilicon/linux-hisi.git
>  F:	arch/arm/mach-hisi/
> +F:	arch/arm/boot/dts/hi3*
> +F:	arch/arm/boot/dts/hip*
> +F:	arch/arm/boot/dts/hisi*
> +F:	arch/arm64/boot/dts/hisilicon/
>  
>  ARM/HP JORNADA 7XX MACHINE SUPPORT
>  M:	Kristoffer Ericson <kristoffer.ericson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> @@ -1202,6 +1209,7 @@ M:	Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>  L:	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	arch/arm/mach-keystone/
> +F:	arch/arm/boot/dts/k2*
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git
>  
>  ARM/TEXAS INSTRUMENT KEYSTONE CLOCK FRAMEWORK
> @@ -1270,6 +1278,7 @@ L:	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	arch/arm/mach-berlin/
>  F:	arch/arm/boot/dts/berlin*
> +F:	arch/arm64/boot/dts/marvell/berlin*
>  
>  
>  ARM/Marvell Dove/MV78xx0/Orion SOC support
> @@ -1406,7 +1415,9 @@ M:	David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>  L:	linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>  L:	linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>  S:	Maintained
> +F:	arch/arm/boot/dts/qcom-*
>  F:	arch/arm/mach-qcom/
> +F:	arch/arm64/boot/dts/qcom/*
>  F:	drivers/soc/qcom/
>  F:	drivers/tty/serial/msm_serial.h
>  F:	drivers/tty/serial/msm_serial.c
> @@ -1456,6 +1467,8 @@ L:	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
>  L:	linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	arch/arm/boot/dts/s3c*
> +F:	arch/arm/boot/dts/s5p*
> +F:	arch/arm/boot/dts/samsung*
>  F:	arch/arm/boot/dts/exynos*
>  F:	arch/arm64/boot/dts/exynos/
>  F:	arch/arm/plat-samsung/

Acked-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Best regards,
Krzysztof


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
