From: =?UTF-8?B?6ZmI6LGq?= <jacobchen110-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/6] Add basic support for support for Rockchip RK1108 SOC
Date: Sun, 13 Nov 2016 00:02:20 +0800
Message-ID: <CAFLEztT+mCNqxKnaHYKYwKPPwiBH9fxJEcKAzio6oV0oW81eGw@mail.gmail.com>
References: <1478175975-11779-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478175975-11779-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, elaine.zhang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

patches 1-5 on rk1108-cvr-v10 board.
Tested-by: Jacob Chen <jacob2.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

2016-11-03 20:26 GMT+08:00 Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>:
>
> RK1108 is embedded with an ARM Cortex-A7 single core and a DSP core.
> It is designed for varies application scenario such as car DVR, sports
> DV, secure camera and UAV camera.
> This patch series add basic support for it, which can boot a board with
> initramfs into shell.
> More new feathers will come soon.
>
>
> Andy Yan (4):
>   pinctrl: rockchip: add support for rk1108
>   ARM: dts: add basic support for Rockchip RK1108 SOC
>   ARM: add low level debug uart for rk1108
>   ARM: dts: rockchip: add rockchip RK1108 Evaluation board
>
> Shawn Lin (2):
>   dt-bindings: rockchip-dw-mshc: add RK1108 dw-mshc description
>   clk: rockchip: add clock controller for rk1108
>
>  Documentation/devicetree/bindings/arm/rockchip.txt |   3 +
>  .../devicetree/bindings/mmc/rockchip-dw-mshc.txt   |   1 +
>  arch/arm/Kconfig.debug                             |  30 ++
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/rk1108-evb.dts                   |  69 +++
>  arch/arm/boot/dts/rk1108.dtsi                      | 420 +++++++++++++++++++
>  arch/arm/mach-rockchip/rockchip.c                  |   1 +
>  drivers/clk/rockchip/Makefile                      |   1 +
>  drivers/clk/rockchip/clk-rk1108.c                  | 463 +++++++++++++++++++++
>  drivers/clk/rockchip/clk.h                         |  14 +
>  drivers/pinctrl/pinctrl-rockchip.c                 |  27 +-
>  include/dt-bindings/clock/rk1108-cru.h             | 308 ++++++++++++++
>  12 files changed, 1337 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/rk1108-evb.dts
>  create mode 100644 arch/arm/boot/dts/rk1108.dtsi
>  create mode 100644 drivers/clk/rockchip/clk-rk1108.c
>  create mode 100644 include/dt-bindings/clock/rk1108-cru.h
>
> --
> 2.7.4
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
