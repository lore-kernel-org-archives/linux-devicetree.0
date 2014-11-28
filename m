From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 1/2] ARM: hip04: set ARCH_NR_GPIO to 128
Date: Fri, 28 Nov 2014 10:33:36 +0100
Message-ID: <3094004.3WUKgY6xNz@wuerfel>
References: <1417156188-500-1-git-send-email-wangzhou.bry@gmail.com> <1417156188-500-2-git-send-email-wangzhou.bry@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417156188-500-2-git-send-email-wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 28 November 2014 14:29:47 Zhou Wang wrote:
> Set ARCH_NR_GPIO for Hisilicon Soc Hip04, which has 4 GPIO
> controllers with 32 GPIOs each.
> 
> Signed-off-by: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/Kconfig                |    1 +
>  arch/arm/configs/hisi_defconfig |    3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 89c4b5c..26aae1e 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1509,6 +1509,7 @@ config ARCH_NR_GPIO
>         default 352 if ARCH_VT8500
>         default 288 if ARCH_ROCKCHIP
>         default 264 if MACH_H4700
> +       default 128 if ARCH_HIP04
>         default 0
>         help
>           Maximum number of GPIOs in the system.
> 

If I remember correctly, you don't actually need to set this if all gpio
clients are using the new gpio descriptor interfaces instead of gpio
numbers. Would that work for you? You'd have to know which devices
can be connected to the gpio controller for all hip04 based machines,
but I think this is a short list of boards.

Linus, one question for you: Does the ARCH_NR_GPIO actually work as designed?
I see that e.g. OMAP4 defines 192 GPIO lines but does not have an ARCH_NR_GPIO
setting. In an OMAP4-only kernel you would get the default value (512)
from include/asm-generic/gpio.h, and in a multiplatform kernel you get at
least 512 if any of the (ARCH_EXYNOS || ARCH_KEYSTONE || SOC_OMAP5 || \
SOC_DRA7XX || ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5PV210 || ARCH_SHMOBILE
|| ARCH_TEGRA) are set, so that is still good.

However if one builds a kernel that just enables OMAP4 and HIP04, I suspect
it can't work on OMAP4 for any gpio line above 128, which seems to be
a fundamental multiplatform problem.

Do we neet to increase the default to 512 for all ARCH_MULTIPLATFORM
configurations and just leave ARCH_SHMOBILE, ARCH_TEGRA and MACH_H4700
here as special cases?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
