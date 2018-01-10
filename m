From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/7] ARM: imx: add timer stop flag to ARM power off state
Date: Wed, 10 Jan 2018 18:48:42 +0100
Message-ID: <1515606522.12538.44.camel@pengutronix.de>
References: <20180102164223.15230-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180102164223.15230-1-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Anson Huang <anson.huang-3arQi8VN3Tc@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, den 02.01.2018, 17:42 +0100 schrieb Stefan Agner:
> When the CPU is in ARM power off state the ARM architected
> timers are stopped. The flag is already present in the higher
> power WAIT mode.
> 
> This allows to use the ARM generic timer on i.MX 6UL/6ULL SoC.
> Without the flag the kernel freezes when the timer enters the
> first time ARM power off mode.
> 
> Cc: Anson Huang <anson.huang-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

Reviewed-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

> ---
>  arch/arm/mach-imx/cpuidle-imx6sx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-imx/cpuidle-imx6sx.c b/arch/arm/mach-
> imx/cpuidle-imx6sx.c
> index c5a5c3a70ab1..d0f14b761ff7 100644
> --- a/arch/arm/mach-imx/cpuidle-imx6sx.c
> +++ b/arch/arm/mach-imx/cpuidle-imx6sx.c
> @@ -89,6 +89,7 @@ static struct cpuidle_driver imx6sx_cpuidle_driver
> = {
>  			 */
>  			.exit_latency = 300,
>  			.target_residency = 500,
> +			.flags = CPUIDLE_FLAG_TIMER_STOP,
>  			.enter = imx6sx_enter_wait,
>  			.name = "LOW-POWER-IDLE",
>  			.desc = "ARM power off",
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
