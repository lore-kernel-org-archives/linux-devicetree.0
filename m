From: Caesar Wang <caesar.upstream-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] mailbox: rockchip: Add mailbox driver for Rockchip
 platform
Date: Mon, 28 Sep 2015 10:09:49 +0800
Message-ID: <5608A16D.4090109@gmail.com>
References: <1442228798-15191-1-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442228798-15191-1-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Jassi,

=46riendly Ping!

Could you review this series patchs if you have free time?


=D4=DA 2015=C4=EA09=D4=C214=C8=D5 19:06, Caesar Wang =D0=B4=B5=C0:
> Mailbox is used by the Rockchip CPU cores to communicate
> requests to MCU processorm.
>
> This driver is found on RK3368 SoCs.
>
> The Mailbox module is a simple APB peripheral that allows both
> the Cortex-A53 MCU system to communicate by writing operation to
> generate interrupt.
> The registers are accessible by both CPU via APB interface.
>
> Tested on RK3368 SDK board.
>
>
>
> Caesar Wang (3):
>    dt-bindings: Add document of Rockchip mailbox
>    mailbox: rockchip: Add Rockchip mailbox driver
>    ARM64: dts: rk3368: Add mailbox device nodes
>
>   .../bindings/mailbox/rockchip-mailbox.txt          |  33 +++
>   arch/arm64/boot/dts/rockchip/rk3368.dtsi           |  13 +
>   drivers/mailbox/Kconfig                            |   9 +
>   drivers/mailbox/Makefile                           |   2 +
>   drivers/mailbox/rockchip-mailbox.c                 | 317 ++++++++++=
+++++++++++
>   5 files changed, 374 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mailbox/rockch=
ip-mailbox.txt
>   create mode 100644 drivers/mailbox/rockchip-mailbox.c
>

--=20
Thanks,
Caesar

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
