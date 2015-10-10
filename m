From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH v5 0/7] arm64: berlin: add pinctrl support
Date: Sun, 11 Oct 2015 00:40:08 +0200
Message-ID: <20151010224008.GI2842@kwain>
References: <1444391810-5045-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444391810-5045-1-git-send-email-jszhang@marvell.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>
Cc: sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org, antoine.tenart@free-electrons.com, catalin.marinas@arm.com, will.deacon@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jisheng,

On Fri, Oct 09, 2015 at 07:56:43PM +0800, Jisheng Zhang wrote:
> This series adds support for Marvell berlin4ct pin-controller, allowi=
ng
> to configure the pin muxing from the device tree.

=46or the whole series,

Acked-by: Antoine Tenart <antoine.tenart@free-electrons.com>

Thanks!

Antoine

>=20
> Since v4:
>  - drop ARCH_BERLIN dependency for it has been met
>  - drop COMPILE_TEST dependency but make berlin pinctrl driver visibl=
e
>    if COMPILE_TEST=3Dy, and let this change be a seperate commit.
>=20
> Since v3:
>  - fix stupid build error: I missed local changes to berlin-bg4ct.c
>=20
> Since v2:
>  - introduce new berlin_pinctrl_probe_regmap() to avoid duplicated co=
de
>  - renaming such as s/urt/uart etc. but keep the group name as URT* t=
o keep
>    consistent with HW/ASIC
>=20
> Since v1:
>  - use generic name for pin functions
>  - a new commit to add pinmux for uart0
>  - correct pinctrl usage in dts
>=20
>=20
> Jisheng Zhang (7):
>   pinctrl: berlin: introduce berlin_pinctrl_probe_regmap()
>   pinctrl: berlin: Make berlin pinctrl driver visible if COMPILE_TEST=
=3Dy
>   pinctrl: berlin: add the berlin4ct pinctrl driver
>   arm64: berlin: add the pinctrl dependency for Marvell Berlin SoCs
>   pinctrl: dt-binding: document berlin4ct SoC pinctrl
>   arm64: dts: berlin4ct: add the pinctrl node
>   arm64: dts: berlin4ct: add default pinmux for uart0
>=20
>  .../devicetree/bindings/pinctrl/berlin,pinctrl.txt |   5 +-
>  arch/arm64/Kconfig.platforms                       |   1 +
>  arch/arm64/boot/dts/marvell/berlin4ct.dtsi         |  22 +
>  drivers/pinctrl/berlin/Kconfig                     |   7 +-
>  drivers/pinctrl/berlin/Makefile                    |   1 +
>  drivers/pinctrl/berlin/berlin-bg4ct.c              | 503 +++++++++++=
++++++++++
>  drivers/pinctrl/berlin/berlin.c                    |  26 +-
>  drivers/pinctrl/berlin/berlin.h                    |   4 +
>  8 files changed, 558 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/pinctrl/berlin/berlin-bg4ct.c
>=20
> --=20
> 2.6.1
>=20

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
