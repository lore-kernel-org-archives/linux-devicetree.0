From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/4] arm64: Add initial Actions Semi S700 and CubieBoard7
 support
Date: Mon, 18 Sep 2017 23:50:11 +0200
Message-ID: <6beabaab-d95f-4ac9-96f1-7c1c98bd7811@linaro.org>
References: <20170911022241.11603-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170911022241.11603-1-afaerber-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thomas Liau <thomas.liau-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?UTF-8?B?5byg5Lic6aOO?= <zhangdf-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?UTF-8?B?5YiY54Kc?= <liuwei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?UTF-8?B?5byg5aSp55uK?= <tyzhang-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?UTF-8?B?5qKF5Yip?= <harrymei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, support-om/0PrzuAKC1Z/+hSey0Gg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ahha Lee <lee-om/0PrzuAKC1Z/+hSey0Gg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Andreas,


On 11/09/2017 04:22, Andreas Färber wrote:
> Hello,
> 
> This series prepares the Actions Semi S700 SoC and Cubietech CubieBoard7.
> It boots equally far as the S900 based Bubblegum-96 these patches are based on,
> i.e. into an initrd with serial and all four cores up.
> 
> I have not yet managed to download the CubieBoard7 sources from Baidu, and the
> Mega download has not yet been fixed, so this is based on the S700 datasheet
> and /proc/device-tree/ from the preinstalled Android.
> 
> Lacking sources and instructions to replace the bootloader on eMMC or to try
> booting from SD, the only working way I've found to boot mainline kernels
> appears to be booting into Android, then issuing "reboot bootloader". U-Boot
> is lacking the saveenv command, so it wasn't possible to change the bootdelay
> to facilitate this.
> 
> Cf. https://en.opensuse.org/HCL:CubieBoard7
> 
> Work branch:
> https://github.com/afaerber/linux/commits/bg96-next
> 
> Have a lot of fun!
> 
> Cheers,
> Andreas
> 
> Cc: Ahha Lee <lee-om/0PrzuAKC1Z/+hSey0Gg@public.gmane.org>
> Cc: support-om/0PrzuAKC1Z/+hSey0Gg@public.gmane.org
> 
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> 
> Andreas Färber (4):
>   dt-bindings: arm: actions: Add S700 and CubieBoard7
>   dt-bindings: timer: Add Actions Semi S700
>   clocksource: owl: Prepare S700
>   arm64: dts: actions: Add S700 and CubieBoard7
> 
>  Documentation/devicetree/bindings/arm/actions.txt  |  15 ++
>  .../bindings/timer/actions,owl-timer.txt           |   1 +

Usually sub system maintainers are also Cc'ed with Dt bindings
definitions and usage.

>  arch/arm64/boot/dts/actions/Makefile               |   2 +
>  arch/arm64/boot/dts/actions/s700-cubieboard7.dts   |  47 ++++++
>  arch/arm64/boot/dts/actions/s700.dtsi              | 164 +++++++++++++++++++++
>  drivers/clocksource/owl-timer.c                    |   1 +
>  6 files changed, 230 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/actions/s700-cubieboard7.dts
>  create mode 100644 arch/arm64/boot/dts/actions/s700.dtsi
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
