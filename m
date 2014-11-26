From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/2] ARM: hip04: add GPIO support
Date: Wed, 26 Nov 2014 16:56:27 +0800
Message-ID: <CAN1soZySQjz42Vq-Rer-iC5tL69dXY93cJHqBXzg4eL6nPsB2Q@mail.gmail.com>
References: <1416984212-619-1-git-send-email-wangzhou.bry@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416984212-619-1-git-send-email-wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "xuwei (O)" <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 26, 2014 at 2:43 PM, Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This series add the support for the GPIOs of Hisilicon Soc hip04. Hip04 uses
> synopsis' GPIO IP, and we use the dwapb GPIO driver here. This series add the
> corresponding dts.
>
> Change in v2:
> - Add select GPIO_DWAPB in arch/arm/mach-hisi/Kconfig
>
> Zhou Wang (2):
>   ARM: hip04: set ARCH_NR_GPIO to 128
>   ARM: dts: hip04: add GPIO pieces
>
>  arch/arm/Kconfig             |    1 +
>  arch/arm/boot/dts/hip04.dtsi |   75 ++++++++++++++++++++++++++++++++++++++++++
>  arch/arm/mach-hisi/Kconfig   |    1 +
>  3 files changed, 77 insertions(+)
>
> --
> 1.7.9.5
>

Acked-by: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
