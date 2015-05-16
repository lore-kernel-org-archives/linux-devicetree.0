From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 1/9] ARM: correct secondary_startup_arm mode
Date: Sat, 16 May 2015 11:08:36 +0200
Message-ID: <CABuKBeJwWR1+0mJkStJFNMeOsESKJCH4T1w5HTyUv5q=KAN7EA@mail.gmail.com>
References: <1431763110-443-1-git-send-email-yingjoe.chen@mediatek.com>
	<1431763110-443-2-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431763110-443-2-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marc Carino <marc.ceeeee@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, srv_heupstream <srv_heupstream@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

2015-05-16 9:58 GMT+02:00 Yingjoe Chen <yingjoe.chen@mediatek.com>:
> secondary_startup_arm is used as ARM mode secondary start up function
> when ther kernel is compiled in THUMB mode, however the label itself
> is still in .thumb mode. readelf shows:
>
> 160979: c020a581   120 FUNC    GLOBAL DEFAULT    2 secondary_startup_arm
>
> Make sure the label is in ARM mode as well.
>
> Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> ---
>  arch/arm/kernel/head.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
> index 3637973..58ee8a2 100644
> --- a/arch/arm/kernel/head.S
> +++ b/arch/arm/kernel/head.S
> @@ -346,8 +346,8 @@ __turn_mmu_on_loc:
>
>  #if defined(CONFIG_SMP)
>         .text
> -ENTRY(secondary_startup_arm)
>         .arm
> +ENTRY(secondary_startup_arm)
>   THUMB(        adr     r9, BSYM(1f)    )       @ Kernel is entered in ARM.
>   THUMB(        bx      r9              )       @ If this is a Thumb-2 kernel,
>   THUMB(        .thumb                  )       @ switch to Thumb now.

This fixes and issue we had with SMP on mt6589.

Tested-by: Matthias Brugger <matthias.bgg@gmail.com>


-- 
motzblog.wordpress.com
