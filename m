From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm: dts: r7s72100: Add support for GR-Peach
Date: Tue, 23 May 2017 12:08:30 +0200
Message-ID: <CAMuHMdUR0Djqi-7DWAHpN_F6xt-WcYzT4H2+mLCjHE9T+7UuJg@mail.gmail.com>
References: <1495532834-25670-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1495532834-25670-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

On Tue, May 23, 2017 at 11:47 AM, Jacopo Mondi
<jacopo+renesas@jmondi.org> wrote:
> Add device tree source for Renesas GR-Peach board.
> GR-Peach is an RZ/A1H based board with 10MB of on-chip SRAM and 8MB
> QSPI flash storage.
> Add support for the board, and create a 2MB partition to use as rootfs.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -51,6 +51,8 @@ Boards:
>      compatible = "renesas,bockw", "renesas,r8a7778"
>    - Genmai (RTK772100BC00000BR)
>      compatible = "renesas,genmai", "renesas,r7s72100"
> +  - GR-Peach (RTK772100BC00000BR)

That part number is Genmai?

> +    compatible = "renesas,grpeach", "renesas,r7s72100"

"renesas,gr-peach"?

> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -716,6 +716,7 @@ dtb-$(CONFIG_ARCH_S5PV210) += \
>  dtb-$(CONFIG_ARCH_SHMOBILE_MULTI) += \
>         emev2-kzm9d.dtb \
>         r7s72100-genmai.dtb \
> +       r7s72100-grpeach.dtb \

r7s72100-gr-peach.dtb?

> --- /dev/null
> +++ b/arch/arm/boot/dts/r7s72100-grpeach.dts

r7s72100-gr-peach.dts

> @@ -0,0 +1,65 @@
> +/*
> + * Device Tree Source for the GRPEACH board

GR-PEACH

> +/ {
> +       model = "GRPEACH";

GR-PEACH

> +       compatible = "renesas,grpeach", "renesas,r7s72100";

renesas,gr-peach

> +
> +       aliases {
> +               serial2 = &scif2;

The first serial port is supposed to be called serial0, unless labeled
otherwise.

> +       };
> +
> +       chosen {
> +               bootargs = "console=ttySC2,115200 ignore_loglevel rw root=/dev/mtdblock0";

bootargs = "ignore_loglevel rw root=/dev/mtdblock0";
stdout-path = "serial0:115200n8";

> +       memory {

memory@20000000

(please run "make dtbs W=1")

> +               device_type = "memory";
> +               reg = <0x20000000 0x00A00000>;  /* 10Mb @ 0x20000000 */

reg = <0x20000000 0x00a00000>;

No need for the comment, esp. since it says 10 megabits instead of
10 mebibyte ;-)

> +       qspi@18000000 {

flash@18000000?

> +               compatible = "mtd-rom";
> +               probe-type = "map_rom";
> +               reg = <0x18000000 0x00800000>;   /* 8 MB*/

No need for the comment (megabyte vs. mebibyte)

> +               bank-width = <4>;
> +               device-width = <1>;
> +
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +
> +               rootfs@18600000 {

rootfs@600000?

> +                       label = "rootfs";
> +                       reg = <0x00600000 0x00200000>; /* 2MB @ 0x18600000 */

Do we need the comment?

> +&extal_clk {
> +       clock-frequency = <13330000>;

My schematics have one more digit of precision: <13333000>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
