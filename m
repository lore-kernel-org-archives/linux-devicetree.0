From: Caesar Wang <caesar.upstream@gmail.com>
Subject: Re: [PATCH v4 0/4] add reboot mode driver
Date: Thu, 3 Mar 2016 09:52:49 +0800
Message-ID: <56D798F1.9060709@gmail.com>
References: <1456834172-5425-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456834172-5425-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Yan <andy.yan@rock-chips.com>
Cc: robh+dt@kernel.org, john.stultz@linaro.org, arnd@arndb.de, heiko@sntech.de, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, sre@kernel.org, alexandre.belloni@free-electrons.com, f.fainelli@gmail.com, linux@arm.linux.org.uk, dbaryshkov@gmail.com, richard@nod.at, linux-rockchip@lists.infradead.org, wxt@rock-chips.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, edubezval@gmail.com, lorenzo.pieralisi@arm.com, matthias.bgg@gmail.com, moritz.fischer@ettus.com, linux-kernel@vger.kernel.org, galak@codeaurora.org, olof@lixom.net, jun.nie@linaro.org, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

Hi Andy,


This series patches ware verified on my github with RK3368 evb and=20
RK30236 board.
https://github.com/Caesar-github/rockchip/tree/for-reboot-mode-tests


=E5=9C=A8 2016=E5=B9=B403=E6=9C=8801=E6=97=A5 20:09, Andy Yan =E5=86=99=
=E9=81=93:
> This driver parse the reboot commands like "reboot loader"
> and "reboot recovery" to get a boot mode described in the
> device tree , then call the corresponding  write interfae
> to store the boot mode in some place like special register
> or ram , which can be read by the bootloader after system
> reboot.
>
> This is commonly done on Android based devices, in order to
> reboot the device into fastboot or recovery mode.
>
>
> Changes in v4:
> - remove mode-maskrom
> - rename mode-fastboot to mode-bootloader to keep compatible with the=
 exiting Android device
> - make this driver depends on OF to avoid kbuild test error
>
> Changes in v3:
> - descirbe all reboot mode as properity instead of subnode
> - scan multi properities
> - add mask value for some platform which only use some bits of the re=
gister
>    to store boot mode magic value
> - descirbe all reboot mode as property instead of subnode
> - add rk3036 support
> - descirbe all reboot mode as properity instead of subnode
>
> Changes in v2:
> - move to dir drivers/power/reset/
> - make syscon-reboot-mode a generic driver
> - make this node as a subnode of PMU
> - make this node as a subnode of pmugrf
>
> Changes in v1:
> - fix the embarrassed compile warning
> - correct the maskrom magic number
> - check for the normal reboot
> - correct the maskrom magic number
> - use macro defined in rockchip_boot-mode.h for reboot-mode DT node
>
> Andy Yan (4):
>    dt-bindings: power: reset: add document for reboot-mode driver
>    power: reset: add reboot mode driver
>    ARM: dts: rockchip: add syscon-reboot-mode DT node
>    ARM64: dts: rockchip: add syscon-reboot-mode DT node

Tested-by: Caesar Wang <wxt@rock-chips.com>


>
>   .../bindings/power/reset/reboot-mode.txt           |  24 +++++
>   .../bindings/power/reset/syscon-reboot-mode.txt    |  35 +++++++
>   arch/arm/boot/dts/rk3036.dtsi                      |  11 ++-
>   arch/arm/boot/dts/rk3288.dtsi                      |  10 ++
>   arch/arm/boot/dts/rk3xxx.dtsi                      |  12 ++-
>   arch/arm64/boot/dts/rockchip/rk3368.dtsi           |  13 ++-
>   drivers/power/reset/Kconfig                        |  16 ++++
>   drivers/power/reset/Makefile                       |   2 +
>   drivers/power/reset/reboot-mode.c                  | 105 ++++++++++=
+++++++++++
>   drivers/power/reset/reboot-mode.h                  |   6 ++
>   drivers/power/reset/syscon-reboot-mode.c           |  64 ++++++++++=
+++
>   include/dt-bindings/soc/rockchip_boot-mode.h       |  30 ++++++
>   12 files changed, 325 insertions(+), 3 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/power/reset/re=
boot-mode.txt
>   create mode 100644 Documentation/devicetree/bindings/power/reset/sy=
scon-reboot-mode.txt
>   create mode 100644 drivers/power/reset/reboot-mode.c
>   create mode 100644 drivers/power/reset/reboot-mode.h
>   create mode 100644 drivers/power/reset/syscon-reboot-mode.c
>   create mode 100644 include/dt-bindings/soc/rockchip_boot-mode.h
>


--=20
Thanks,
Caesar
