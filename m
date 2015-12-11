From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 0/5] Add reboot notifier driver for rockchip platform
Date: Fri, 11 Dec 2015 22:29:13 +0100
Message-ID: <45323116.BWNAaZT5p4@diego>
References: <1447840044-19689-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447840044-19689-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, benchan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 18. November 2015, 17:47:24 schrieb Andy Yan:
> rockchip platform have a protocol to pass the kernel reboot
> mode to bootloader by some special registers when system reboot.
> By this way the bootloader can take different action according
> to the different kernel reboot mode, for example, command
> "reboot loader" will reboot the board to rockusb mode, this is
> a very convenient way to get the board enter download mode.
> And Android system also use this protocol to pass "recovery"=E3=80=81
> =E2=80=9Cfastboot=E2=80=9D reboot mode to bootloader. In upstream lan=
d, We found
> tegra platform also use this mechanism.
>=20
> Before this version, I have sent two Series, which can be found
> at [0] [1]
> [0] https://patchwork.kernel.org/patch/7140751/
> [1] https://patchwork.kernel.org/patch/7153531/

just so it doesn't get lost, this ties into a slightly more generic app=
roach,=20
John Stultz is doing for the android reboot reasons:

http://thread.gmane.org/gmane.linux.kernel/2103447

The only difference is that we'd need to use the pmu syscon for it.



> Changes in v3:
>  - rename a pinctrl node in rk3288-veyron, the original name will be
>    used in the incoming reboot notifier driver
>  - add dt binding
>  - move from mach-rockchip to drivers/soc/rockchip, as the tegra does
>  - use dts pass the related register
>  - add DT node
>=20
> Changes in v2:
>   - check cpu dt node
>   - remove a unnecessary of_put_node in function rockchip_get_pmu_reg=
map
>   - fix a align issue
>   - use reboot_notifier instead of restart_handler
>=20
> Andy Yan (5):
>   ARM: dts: rockchip: rk3288-veyron: rename pinctrl node reboot to re=
set
>   dt-bindings: soc: add document for rockchip reboot notifier driver
>   soc: rockchip: add reboot notifier driver
>   ARM: dts: rockchip: add reboot node
>   ARM64: dts: rockchip: add reboot node
>=20
>  .../bindings/soc/rockchip/rockchip-reboot.txt      | 18 ++++
>  arch/arm/boot/dts/rk3288-veyron.dtsi               |  2 +-
>  arch/arm/boot/dts/rk3288.dtsi                      |  6 ++
>  arch/arm/boot/dts/rk3xxx.dtsi                      |  6 ++
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi           |  6 ++
>  drivers/soc/rockchip/Kconfig                       |  7 ++
>  drivers/soc/rockchip/Makefile                      |  1 +
>  drivers/soc/rockchip/loader.h                      | 22 +++++
>  drivers/soc/rockchip/reboot.c                      | 98
> ++++++++++++++++++++++ 9 files changed, 165 insertions(+), 1 deletion=
(-)
>  create mode 100644
> Documentation/devicetree/bindings/soc/rockchip/rockchip-reboot.txt cr=
eate
> mode 100644 drivers/soc/rockchip/loader.h
>  create mode 100644 drivers/soc/rockchip/reboot.c

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
