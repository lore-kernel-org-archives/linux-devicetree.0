From: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v12 08/08] ARM: hi3xxx: select GPIO in Kconfig
Date: Tue, 17 Dec 2013 16:44:13 -0800
Message-ID: <87mwjzm1ia.fsf@linaro.org>
References: <1386748497-11290-1-git-send-email-haojian.zhuang@gmail.com>
	<1386748497-11290-9-git-send-email-haojian.zhuang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386748497-11290-9-git-send-email-haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
	(Haojian Zhuang's message of "Wed, 11 Dec 2013 15:54:57 +0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:

> Select GPIO in hi3xxx Kconfig.
>
> Signed-off-by: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/mach-hi3xxx/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mach-hi3xxx/Kconfig b/arch/arm/mach-hi3xxx/Kconfig
> index 4007ecf..018ad67 100644
> --- a/arch/arm/mach-hi3xxx/Kconfig
> +++ b/arch/arm/mach-hi3xxx/Kconfig
> @@ -3,6 +3,7 @@ config ARCH_HI3xxx
>  	select ARM_AMBA
>  	select ARM_GIC
>  	select ARM_TIMER_SP804
> +	select ARCH_WANT_OPTIONAL_GPIOLIB
>  	select CACHE_L2X0
>  	select CLKSRC_OF
>  	select GENERIC_CLOCKEVENTS

No need for this to be a separate patch, I've folded it into patch 1.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
