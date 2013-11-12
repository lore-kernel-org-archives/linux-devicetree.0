From: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v11 5/6] ARM: hi3xxx: add smp support
Date: Tue, 12 Nov 2013 14:53:31 -0800
Message-ID: <8738n1nses.fsf@linaro.org>
References: <1383813691-31587-1-git-send-email-haojian.zhuang@linaro.org>
	<1383813691-31587-6-git-send-email-haojian.zhuang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383813691-31587-6-git-send-email-haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
	(Haojian Zhuang's message of "Thu, 7 Nov 2013 16:41:30 +0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, shaojie.sun-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:

> From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Enable SMP support on hi3xxx platform
>
> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Tested-by: Zhang Mingjun <zhang.mingjun-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Tested-by: Li Xin <li.xin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../bindings/arm/hisilicon/hisilicon.txt           | 30 ++++++--
>  arch/arm/boot/dts/hi3620.dtsi                      | 38 ++++++++++
>  arch/arm/mach-hi3xxx/Kconfig                       |  3 +
>  arch/arm/mach-hi3xxx/Makefile                      |  1 +
>  arch/arm/mach-hi3xxx/core.h                        | 11 +++
>  arch/arm/mach-hi3xxx/hi3xxx.c                      | 34 +++++++++
>  arch/arm/mach-hi3xxx/platsmp.c                     | 84 ++++++++++++++++++++++
>  7 files changed, 197 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm/mach-hi3xxx/core.h
>  create mode 100644 arch/arm/mach-hi3xxx/platsmp.c
>
> diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
> index 3be60c8..8c7a465 100644
> --- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
> +++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
> @@ -1,10 +1,32 @@
>  Hisilicon Platforms Device Tree Bindings
>  ----------------------------------------------------
>  
> -Hi3716 Development Board
> -Required root node properties:
> -	- compatible = "hisilicon,hi3716-dkb";
> -

This was added in patch 1/6, then removed here.  If it's not
needed/used, just drop it from patch 1 please.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
