From: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/9] Implement clocksource for rockchip SoC using rockchip timer
Date: Wed, 21 Dec 2016 17:21:05 +0300
Message-ID: <E6DD9335-0D2D-47CB-8098-5F96C2E08139@gmail.com>
References: <1480343486-25539-1-git-send-email-al.kochet@gmail.com> <1480436092-10728-1-git-send-email-al.kochet@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480436092-10728-1-git-send-email-al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Heiko, Daniel!

Are there any reasons why the patches [1][2] are not applied yet into =
kernel?
How can I help in applying patches?

Regards,
Alexander.

[1] =
http://lists.infradead.org/pipermail/linux-rockchip/2016-November/thread.h=
tml#13236
     [PATCH v4 0/9] Implement clocksource for rockchip SoC using =
rockchip timer=20
[2] =
http://lists.infradead.org/pipermail/linux-rockchip/2016-December/013308.h=
tml=20


> 29 =D0=BD=D0=BE=D1=8F=D0=B1. 2016 =D0=B3., =D0=B2 19:14, Alexander =
Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB=
(=D0=B0):
>=20
> Hello,
>=20
> This patch series contain:
> - devicetree bindings clarification for rockchip timers
> - dts files fixes for rk3228-evb, rk3229-evb and rk3188
> - implementation of clocksource and sched clock for rockchip SoC
>=20
> The clock supplying the arm-global-timer on the rk3188 is coming from =
the
> the cpu clock itself and thus changes its rate everytime cpufreq =
adjusts
> the cpu frequency making this timer unsuitable as a stable =
clocksource.
>=20
> The rk3188, rk3288 and following socs share a separate timer block =
already
> handled by the rockchip-timer driver. Therefore adapt this driver to =
also
> be able to act as clocksource on rk3188.
>=20
> In order to test clocksource you can run following commands and check
> how much time it take in real. On rk3188 it take about ~45 seconds.
>=20
>        cpufreq-set -f 1.6GHZ
>        date; sleep 60; date
>=20
> rk3288 (and probably anything newer) is irrelevant to this patch,
> as it has the arch timer interface. This patch may be usefull
> for Cortex-A9/A5 based parts.
>=20
> Regards,
> Alexander.
>=20
> This is try 4. Please discard all v1, v2, v3 patches.
>=20
> Changes in v4:
> merged 7 and 8 from series 3
> merged 10, 11, 12, 13 from series 3
> fixed commit message
>=20
> Changes in v3:
> added patches:
> ARM: dts: rockchip: disable arm-global-timer for rk3188
> clocksource/drivers/rockchip_timer: Prevent ftrace recursion
>=20
> devicetree v1 patches:
> https://patchwork.ozlabs.org/patch/699019/
> https://patchwork.ozlabs.org/patch/699020/
>=20
> kernel v1 patches:
> https://patchwork.kernel.org/patch/9443975/
> https://patchwork.kernel.org/patch/9443971/
> https://patchwork.kernel.org/patch/9443959/
> https://patchwork.kernel.org/patch/9443963/
> https://patchwork.kernel.org/patch/9443979/
> https://patchwork.kernel.org/patch/9443989/
> https://patchwork.kernel.org/patch/9443987/
> https://patchwork.kernel.org/patch/9443977/
> https://patchwork.kernel.org/patch/9443991/
>=20
> Alexander Kochetkov (9):
>  dt-bindings: clarify compatible property for rockchip timers
>  ARM: dts: rockchip: update compatible property for rk3228 timer
>  ARM: dts: rockchip: update compatible property for rk3229 timer
>  ARM: dts: rockchip: add timer entries to rk3188 SoC
>  ARM: dts: rockchip: disable arm-global-timer for rk3188
>  clocksource/drivers/rockchip_timer: split bc_timer into rk_timer and
>    rk_clock_event_device
>  clocksource/drivers/rockchip_timer: low level routines take rk_timer
>    as parameter
>  clocksource/drivers/rockchip_timer: move TIMER_INT_UNMASK out of
>    rk_timer_enable()
>  clocksource/drivers/rockchip_timer: implement clocksource timer
>=20
> .../bindings/timer/rockchip,rk-timer.txt           |   12 +-
> arch/arm/boot/dts/rk3188.dtsi                      |   17 ++
> arch/arm/boot/dts/rk3228-evb.dts                   |    4 +
> arch/arm/boot/dts/rk3229-evb.dts                   |    4 +
> drivers/clocksource/rockchip_timer.c               |  207 =
+++++++++++++++-----
> 5 files changed, 190 insertions(+), 54 deletions(-)
>=20
> --=20
> 1.7.9.5
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
