From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/7] Add SMP bringup support for mt65xx socs
Date: Mon, 4 May 2015 09:48:43 +0200
Message-ID: <CABuKBeJ406DUFoVs2p3-u6sW58Dm7XDd6uxCc==Mkq3dMhhd5Q@mail.gmail.com>
References: <1430466210-22963-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430466210-22963-1-git-send-email-yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Yingjoe,

2015-05-01 9:43 GMT+02:00 Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>:
> This series add SMP brinup support for mediatek SoCs. This is based
> on v4.1-rc1.
>
> There are 2 similar but different SMP bringup up methods on Mediatek
> mt65xx and mt81xx. On MT8135 & MT8127, system boots with a trustzone
> firmware. Others, like MT6589, doesn't have trustzone, and run kernel
> directly in secure world.
>
> Patch 1~3 fix issues in mtk_timer(GPT) and enable arch timer support.
> Patch 4,5 add support for cpu enable-method "mediatek,mt65xx-smp" and
> "mediatek,mt81xx-tz-smp", which support Mediatek SMP bringup for non-TZ
> and TZ platform.
> Patch 6,7 finally enable SMP bringup for mt8135 and mt8127.
>
> Matthias Brugger (1):
>   arm: mediatek: enable gpt6 on boot up to make arch timer working
>
> Yingjoe Chen (6):
>   clocksource: mediatek: Don't run event_handler if it is NULL
>   clocksource: mediatek: Use GPT as sched clock source
>   devicetree: bindings: add new SMP enable method Mediatek SoC
>   ARM: mediatek: add smp bringup code
>   ARM: dts: mt8135: enable basic SMP bringup for mt8135
>   ARM: dts: mt8127: enable basic SMP bringup for mt8127
>

I tried on the mt8135 eval board but it fails to bring up the CPU.

When booting:
[    1.048588] CPU1: failed to come online
[    2.049914] CPU2: failed to come online
[    3.051245] CPU3: failed to come online

And from userspace:
/ # echo 1 > /sys/devices/system/cpu/cpu1/online
[   40.115142] CPU1: failed to come online
sh: write error: Input/output error
/ # echo 1 > /sys/devices/system/cpu/cpu2/online
[   44.667141] CPU2: failed to come online
sh: write error: Input/output error
/ # echo 1 > /sys/devices/system/cpu/cpu3/online
[   51.271141] CPU3: failed to come online
sh: write error: Input/output error

Please check again.

Cheers,
Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
