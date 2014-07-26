From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 0/8] ARM: rockchip: add initial support for rk3288
Date: Sat, 26 Jul 2014 11:08:11 +0200
Message-ID: <4952360.Q1n75UemR2@wuerfel>
References: <1406324980-2450-1-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406324980-2450-1-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 25 July 2014 23:49:32 Heiko Stuebner wrote:
> This series adds the initial support for Rockchip rk3288 socs including
> debug uart and devicetree files for the rk3288 evaluation board and
> enables these boards to boot into an initramfs.
> 
> Boards using uboot need an updated bootloader, which must start the timer
> supplying the architected timer, while the coreboot bootloader already does
> this. It also depends on the patch
>     "irqchip: gic: Add binding probe for ARM GIC400"
> which should have made it into the irqchip tree today.

Looks all good to me,

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
