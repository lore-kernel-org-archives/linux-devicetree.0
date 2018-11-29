From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v5 00/17] initial support for "suniv"
 Allwinner new ARM9 SoC
Date: Fri, 30 Nov 2018 07:45:34 +0800
Message-ID: <3CE89E4F-BDE2-4715-8B15-B0167273C613@aosc.io>
References: <cover.1543443475.git.mesihkilinc@gmail.com> <20181129214730.6d6aju4jurai6rmv@plaes.org>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBS7UQHQAKGQEYAO7JWY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181129214730.6d6aju4jurai6rmv-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.orgPriit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>, Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B411=E6=9C=8830=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=885=
:47:30, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org> =E5=86=99=E5=88=B0:
>On Thu, Nov 29, 2018 at 01:33:10AM +0300, Mesih Kilinc wrote:
>> This is the fifth version of patchset for Allwinner ARMv5 F1C100s
>> SoC. Addressed comments from Maxime Ripard and Rob Herring, added
>signatures.
>
>IIRC, the original author of these patches was Icenowy, what happened
>to this?

I lost interest on maintaining this.

>>=20
>> Changes since v4:
>> - Patch "dt-bindings: pinctrl: Add Allwinner suniv F1C100s pinctrl"
>>   - This patch applied for 4.21.
>> - Patch "pinctrl: sunxi: add support for suniv F1C100s (newer
>F-series SoCs)"
>>   - This patch applied for 4.21.
>> - Patch "dt-bindings: clock: Add Allwinner suniv F1C100s CCU"
>>   - Fixed license identifier position
>>   - Added DMA fields.
>> - Patch "clk: sunxi-ng: add support for suniv F1C100s SoC"
>>   - Added DMA reset and clock support.
>> - Patch "ARM: dts: suniv: add initial DTSI file for F1C100s"
>>   - Remove dt-binding headers.=20
>>   - Fix uart0 pin label.
>> - Patch "ARM: suniv: f1c100s: add device tree for Lichee Pi Nano"
>>   - Fix uart0 pin label.
>>=20
>> Changes since v3:
>> - Patch "ARM: Check ARCH_MULTI_V7 to differentiate ARMv5/v7 Allwinner
>SoCs"
>>   - Remove CONFIG_ARCH_SUNXI_Vx. Use ARCH_MULTI_Vx to differentiate
>SoC's
>>   - Change KConfig ARCH_SUNXI selection: 'select' to 'default'.=20
>> - Patch "irqchip/sun4i: Add a struct to hold global variables"
>>   - Split irq_sun4i.c changes to 3 patch.
>> - Patch "pinctrl: sunxi: add support for suniv F1C100s (newer
>F-series SoCs)"
>>   - pinctrl-suniv-f1c100s: remove: disable_strict_mode =3D true
>> - Patch "ARM: dts: suniv: add initial DTSI file for F1C100s"
>>   - suniv-f1c100s.dtsi: remove unnecessary componenets.
>>   - Instead of patching drivers, add original compatible string with=20
>> f1c100s compatibles.
>>   - Add Acked-by signatures.
>>=20
>> Changes since v2:
>> - Patch "ARM: sunxi: add Allwinner ARMv5 SoCs"
>>   - Move SUN4I_TIMER option to ARCH_SUNXI
>>   - Added help text for MACH_SUNIV
>> - Patch "irqchip/sun4i: add support for suniv interrupt controller"
>>   - Defined sunxi_irq_chip_data struct and used it to differentiate
>>     registers between different chips.
>> - Patch " ARM: dts: suniv: add initial DTSI file for F1C100s"
>>   - Removed unnecessary fake clock.
>>   - Fixed compatible strings.
>>=20
>> Changes since v1:
>> - Patch "ARM: add CONFIG_ARCH_SUNXI_V7 for differentiate ARMv5/v7
>>   Allwinner SoCs"
>>   - Instead of using a common bool config use a common menuconfig.=20
>>   - Use ARCH_MULTI_V7 to differentiate V7 SoCs.
>>   - Addressed comment from Julian Calaby
>> - Patch "ARM: sunxi: add Allwinner ARMv5 SoCs"
>>   - Use ARCH_MULTI_V5 to differentiate V5 SoCs.
>>   - removed "allwinner,suniv" board compatible string
>>   - Added dt-bindings
>> - Patch "irqchip/sun4i: add support for suniv interrupt controller"
>>   - Added dt-bindings
>>   - Changed "allwinner,suniv-ic" to "allwinner,suniv-f1c100s-ic"
>> - Patch "clocksource: sun4i: add a compatible for suniv"
>>   - Added dt-bindings
>>   - Changed "allwinner,suniv-timer" to
>"allwinner,suniv-f1c100s-timer"
>> - Patch "pinctrl: sunxi: add support for suniv F1C100s (newer
>F-series SoCs)"
>>   - Added dt-bindings
>>   - Renamed suniv-pinctrl to suniv-f1c100s-pinctrl
>> - Patch "clk: sunxi-ng: add support for suniv F1C100s SoC"
>>   - Added dt-bindings
>>   - Renamed suniv-ccu to suniv-f1c100s-ccu
>> - Patch "ARM: suniv: f1c100s: add device tree for Lichee Pi Nano"
>>   - Addressed comment from Rask Ingemann Lambertsen
>>=20
>> Thanks!
>>=20
>> Mesih Kilinc (17):
>>   ARM: Check ARCH_MULTI_V7 to differentiate ARMv5/v7 Allwinner SoCs
>>   dt-bindings: arm: Add new Allwinner ARMv5 F1C100s SoC
>>   ARM: sunxi: add Allwinner ARMv5 SoCs
>>   dt-bindings: interrupt-controller: Add suniv interrupt-controller
>>   irqchip/sun4i: Add a struct to hold global variables
>>   irqchip/sun4i: Move IC specific register offsets to struct
>>   irqchip/sun4i: Add support for Allwinner ARMv5 F1C100s
>>   dt-bindings: timer: Add Allwinner suniv timer
>>   clocksource: sun4i: add a compatible for suniv
>>   dt-bindings: pinctrl: Add Allwinner suniv F1C100s pinctrl
>>   pinctrl: sunxi: add support for suniv F1C100s (newer F-series SoCs)
>>   dt-bindings: clock: Add Allwinner suniv F1C100s CCU
>>   clk: sunxi-ng: add support for suniv F1C100s SoC
>>   dt-bindings: sram: Add Allwinner suniv F1C100s
>>   dt-bindings: watchdog: Add Allwinner ARMv5 F1C100s wdt
>>   ARM: dts: suniv: add initial DTSI file for F1C100s
>>   ARM: suniv: f1c100s: add device tree for Lichee Pi Nano
>>=20
>>  Documentation/devicetree/bindings/arm/sunxi.txt    |   1 +
>>  .../devicetree/bindings/clock/sunxi-ccu.txt        |   1 +
>>  .../interrupt-controller/allwinner,sun4i-ic.txt    |   4 +-
>>  .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |   1 +
>>  .../devicetree/bindings/sram/sunxi-sram.txt        |   4 +
>>  .../bindings/timer/allwinner,sun4i-timer.txt       |   4 +-
>>  .../devicetree/bindings/watchdog/sunxi-wdt.txt     |   1 +
>>  arch/arm/boot/dts/Makefile                         |   2 +
>>  arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts  |  26 +
>>  arch/arm/boot/dts/suniv-f1c100s.dtsi               | 147 ++++++
>>  arch/arm/mach-sunxi/Kconfig                        |  19 +-
>>  arch/arm/mach-sunxi/sunxi.c                        |  10 +
>>  drivers/clk/sunxi-ng/Kconfig                       |   5 +
>>  drivers/clk/sunxi-ng/Makefile                      |   1 +
>>  drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c           | 541
>+++++++++++++++++++++
>>  drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h           |  34 ++
>>  drivers/clocksource/sun4i_timer.c                  |   5 +-
>>  drivers/irqchip/irq-sun4i.c                        | 106 ++--
>>  drivers/pinctrl/sunxi/Kconfig                      |   4 +
>>  drivers/pinctrl/sunxi/Makefile                     |   1 +
>>  drivers/pinctrl/sunxi/pinctrl-suniv-f1c100s.c      | 416
>++++++++++++++++
>>  include/dt-bindings/clock/suniv-ccu-f1c100s.h      |  70 +++
>>  include/dt-bindings/reset/suniv-ccu-f1c100s.h      |  38 ++
>>  23 files changed, 1408 insertions(+), 33 deletions(-)
>>  create mode 100644 arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts
>>  create mode 100644 arch/arm/boot/dts/suniv-f1c100s.dtsi
>>  create mode 100644 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
>>  create mode 100644 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h
>>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-suniv-f1c100s.c
>>  create mode 100644 include/dt-bindings/clock/suniv-ccu-f1c100s.h
>>  create mode 100644 include/dt-bindings/reset/suniv-ccu-f1c100s.h
>>=20
>> --=20
>> 2.7.4
>>=20
>> --=20
>> You received this message because you are subscribed to the Google
>Groups "linux-sunxi" group.
>> To unsubscribe from this group and stop receiving emails from it,
>send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
