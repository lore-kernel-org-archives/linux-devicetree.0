From: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 11/15] MIPS: ingenic: Initial JZ4770 support
Date: Tue, 2 Jan 2018 21:39:07 +0530
Message-ID: <CANc+2y7Raw_cmV7U84mCx_ZVULOSxmk_qHSebDNSt+M9=zByQA@mail.gmail.com>
References: <20180102150848.11314-1-paul@crapouillou.net> <20180102150848.11314-11-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180102150848.11314-11-paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Maarten ter Huurne <maarten-Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Paul,

On 2 January 2018 at 20:38, Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org> wrote:
> Provide just enough bits (clocks, clocksource, uart) to allow a kernel
> to boot on the JZ4770 SoC to a initramfs userspace.
>
> Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
> ---
>  arch/mips/boot/dts/ingenic/jz4770.dtsi | 212 +++++++++++++++++++++++++++++++++
>  arch/mips/jz4740/Kconfig               |   6 +
>  arch/mips/jz4740/time.c                |   2 +-
>  3 files changed, 219 insertions(+), 1 deletion(-)
>  create mode 100644 arch/mips/boot/dts/ingenic/jz4770.dtsi
>
>  v2: No change
>  v3: No change
>  v4: No change
>  v5: Use SPDX license identifier
>
> diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> new file mode 100644
> index 000000000000..7c2804f3f5f1
> --- /dev/null
> +++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> @@ -0,0 +1,212 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <dt-bindings/clock/jz4770-cgu.h>
> +
> +/ {
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +       compatible = "ingenic,jz4770";
> +
> +       cpuintc: interrupt-controller {
> +               #address-cells = <0>;
> +               #interrupt-cells = <1>;
> +               interrupt-controller;
> +               compatible = "mti,cpu-interrupt-controller";
> +       };
> +
> +       intc: interrupt-controller@10001000 {
> +               compatible = "ingenic,jz4770-intc";
> +               reg = <0x10001000 0x40>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <1>;
> +
> +               interrupt-parent = <&cpuintc>;
> +               interrupts = <2>;
> +       };
> +
> +       ext: ext {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +       };
> +
> +       osc32k: osc32k {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <32768>;
> +       };
> +
> +       cgu: jz4770-cgu@10000000 {
> +               compatible = "ingenic,jz4770-cgu";
> +               reg = <0x10000000 0x100>;
> +
> +               clocks = <&ext>, <&osc32k>;
> +               clock-names = "ext", "osc32k";
> +
> +               #clock-cells = <1>;
> +       };
> +
> +       pinctrl: pin-controller@10010000 {
> +               compatible = "ingenic,jz4770-pinctrl";
> +               reg = <0x10010000 0x600>;
> +
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpa: gpio@0 {
> +                       compatible = "ingenic,jz4770-gpio";
> +                       reg = <0>;
> +
> +                       gpio-controller;
> +                       gpio-ranges = <&pinctrl 0 0 32>;
> +                       #gpio-cells = <2>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +
> +                       interrupt-parent = <&intc>;
> +                       interrupts = <17>;
> +               };
> +
> +               gpb: gpio@1 {
> +                       compatible = "ingenic,jz4770-gpio";
> +                       reg = <1>;
> +
> +                       gpio-controller;
> +                       gpio-ranges = <&pinctrl 0 32 32>;
> +                       #gpio-cells = <2>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +
> +                       interrupt-parent = <&intc>;
> +                       interrupts = <16>;
> +               };
> +
> +               gpc: gpio@2 {
> +                       compatible = "ingenic,jz4770-gpio";
> +                       reg = <2>;
> +
> +                       gpio-controller;
> +                       gpio-ranges = <&pinctrl 0 64 32>;
> +                       #gpio-cells = <2>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +
> +                       interrupt-parent = <&intc>;
> +                       interrupts = <15>;
> +               };
> +
> +               gpd: gpio@3 {
> +                       compatible = "ingenic,jz4770-gpio";
> +                       reg = <3>;
> +
> +                       gpio-controller;
> +                       gpio-ranges = <&pinctrl 0 96 32>;
> +                       #gpio-cells = <2>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +
> +                       interrupt-parent = <&intc>;
> +                       interrupts = <14>;
> +               };
> +
> +               gpe: gpio@4 {
> +                       compatible = "ingenic,jz4770-gpio";
> +                       reg = <4>;
> +
> +                       gpio-controller;
> +                       gpio-ranges = <&pinctrl 0 128 32>;
> +                       #gpio-cells = <2>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +
> +                       interrupt-parent = <&intc>;
> +                       interrupts = <13>;
> +               };
> +
> +               gpf: gpio@5 {
> +                       compatible = "ingenic,jz4770-gpio";
> +                       reg = <5>;
> +
> +                       gpio-controller;
> +                       gpio-ranges = <&pinctrl 0 160 32>;
> +                       #gpio-cells = <2>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +
> +                       interrupt-parent = <&intc>;
> +                       interrupts = <12>;
> +               };
> +       };
> +
> +       uart0: serial@10030000 {
> +               compatible = "ingenic,jz4770-uart";
> +               reg = <0x10030000 0x100>;
> +
> +               clocks = <&ext>, <&cgu JZ4770_CLK_UART0>;
> +               clock-names = "baud", "module";
> +
> +               interrupt-parent = <&intc>;
> +               interrupts = <5>;
> +
> +               status = "disabled";
> +       };
> +
> +       uart1: serial@10031000 {
> +               compatible = "ingenic,jz4770-uart";
> +               reg = <0x10031000 0x100>;
> +
> +               clocks = <&ext>, <&cgu JZ4770_CLK_UART1>;
> +               clock-names = "baud", "module";
> +
> +               interrupt-parent = <&intc>;
> +               interrupts = <4>;
> +
> +               status = "disabled";
> +       };
> +
> +       uart2: serial@10032000 {
> +               compatible = "ingenic,jz4770-uart";
> +               reg = <0x10032000 0x100>;
> +
> +               clocks = <&ext>, <&cgu JZ4770_CLK_UART2>;
> +               clock-names = "baud", "module";
> +
> +               interrupt-parent = <&intc>;
> +               interrupts = <3>;
> +
> +               status = "disabled";
> +       };
> +
> +       uart3: serial@10033000 {
> +               compatible = "ingenic,jz4770-uart";
> +               reg = <0x10033000 0x100>;
> +
> +               clocks = <&ext>, <&cgu JZ4770_CLK_UART3>;
> +               clock-names = "baud", "module";
> +
> +               interrupt-parent = <&intc>;
> +               interrupts = <2>;
> +
> +               status = "disabled";
> +       };
> +
> +       uhc: uhc@13430000 {
> +               compatible = "generic-ohci";
> +               reg = <0x13430000 0x1000>;
> +
> +               clocks = <&cgu JZ4770_CLK_UHC>, <&cgu JZ4770_CLK_UHC_PHY>;
> +               assigned-clocks = <&cgu JZ4770_CLK_UHC>;
> +               assigned-clock-rates = <48000000>;
> +
> +               interrupt-parent = <&intc>;
> +               interrupts = <20>;
> +
> +               status = "disabled";
> +       };
> +};
> diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
> index 643af2012e14..29a9361a2b77 100644
> --- a/arch/mips/jz4740/Kconfig
> +++ b/arch/mips/jz4740/Kconfig
> @@ -18,6 +18,12 @@ config MACH_JZ4740
>         bool
>         select SYS_HAS_CPU_MIPS32_R1
>
> +config MACH_JZ4770
> +       bool
> +       select MIPS_CPU_SCACHE
> +       select SYS_HAS_CPU_MIPS32_R2
> +       select SYS_SUPPORTS_HIGHMEM
> +
>  config MACH_JZ4780
>         bool
>         select MIPS_CPU_SCACHE
> diff --git a/arch/mips/jz4740/time.c b/arch/mips/jz4740/time.c
> index bb1ad5119da4..2ca9160f642a 100644
> --- a/arch/mips/jz4740/time.c
> +++ b/arch/mips/jz4740/time.c
> @@ -113,7 +113,7 @@ static struct clock_event_device jz4740_clockevent = {
>  #ifdef CONFIG_MACH_JZ4740
>         .irq = JZ4740_IRQ_TCU0,
>  #endif
> -#ifdef CONFIG_MACH_JZ4780
> +#if defined(CONFIG_MACH_JZ4770) || defined(CONFIG_MACH_JZ4780)
>         .irq = JZ4780_IRQ_TCU2,
>  #endif
>  };
> --
> 2.11.0
>
>

Looks good to me.
Reviewed-by: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
