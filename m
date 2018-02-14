From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] ARM: dts: stout: Initial r8a7790 Stout board support
Date: Wed, 14 Feb 2018 10:11:23 +0100
Message-ID: <CAMuHMdUuuokCjJ-uz1+JMFLF5zytiB6gjhVC1Xtys_rWdFnPhg@mail.gmail.com>
References: <20180213232948.31521-1-marek.vasut+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20180213232948.31521-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Simon Horman <horms+renesas@verge.net.au>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-Id: devicetree@vger.kernel.org

Hi Marek,

On Wed, Feb 14, 2018 at 12:29 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
> Stout base board support making use of 1 GiB of memory,
> the Renesas H2 r8a7790 SoC with the SCIFA0 serial port
> and CA15 with ARM architected timer.
>
> Furthermore, this device tree contains entries for:
>   - 4x LEDs
>   - SDHI SD/MMC controller
>   - Display unit with HDMI output
>   - SH fast ethernet controller
>   - QSPI controller with S25FL512S attached to it
>   - I2C controller with DA9210 and DA 9063 PMICs
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Thanks fro your patch!

> --- /dev/null
> +++ b/arch/arm/boot/dts/r8a7790-stout.dts
> @@ -0,0 +1,360 @@
> +/*
> + * Device Tree Source for the Stout board
> + *
> + * Copyright (C) 2018 Marek Vasut <marek.vasut@gmail.com>
> + *
> + * This file is licensed under the terms of the GNU General Public License
> + * version 2.  This program is licensed "as is" without any warranty of any
> + * kind, whether express or implied.

SPDX for new files?

> +/ {

> +       memory@40000000 {
> +               device_type = "memory";
> +               reg = <0 0x40000000 0 0x40000000>;

According to the schematics, Stout has 2 GiB of RAM.
The extra 1 GiB can be added later, though.

> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +               led1 {
> +                       gpios = <&gpio4 22 GPIO_ACTIVE_HIGH>;
> +               };
> +               led2 {
> +                       gpios = <&gpio4 23 GPIO_ACTIVE_HIGH>;
> +               };
> +               led3 {
> +                       gpios = <&gpio5 17 GPIO_ACTIVE_HIGH>;
> +               };
> +               led5 {
> +                       gpios = <&gpio4 24 GPIO_ACTIVE_HIGH>;

GPIO_ACTIVE_LOW, for all 4 LEDs, as there are no inverting NPN drivers.

> +               };
> +       };

> +       x2_clk: x2-clock {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <148500000>;
> +       };

There's no X2 clock (copied from Lager?).

> +
> +       x13_clk: x13-clock {

This clock is called "OSC1", not "X13".

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <148500000>;
> +       };
> +};
> +
> +&du {
> +       pinctrl-0 = <&du_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +
> +       clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>, <&cpg CPG_MOD 722>,
> +                <&cpg CPG_MOD 726>, <&cpg CPG_MOD 725>,
> +                <&x13_clk>, <&x2_clk>;

"<&osc1_clk>" instead of "<&x13_clk>".
Please drop the reference to the non-existent "<&x2_clk>".

> +       clock-names = "du.0", "du.1", "du.2", "lvds.0", "lvds.1",
> +                     "dclkin.0", "dclkin.1";

Please drop "dclkin.1", as it is not wired on Stout.

> +&qspi {
> +       pinctrl-0 = <&qspi_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +
> +       flash: flash@0 {
> +               compatible = "spansion,s25fl512s", "jedec,spi-nor";
> +               reg = <0>;
> +               spi-max-frequency = <30000000>;
> +               spi-tx-bus-width = <4>;
> +               spi-rx-bus-width = <4>;
> +               spi-cpha;
> +               spi-cpol;
> +               m25p,fast-read;
> +
> +               partitions {
> +                       compatible = "fixed-partitions";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       partition@0 {
> +                               label = "loader";
> +                               reg = <0x00000000 0x00040000>;
> +                               read-only;
> +                       };
> +                       partition@40000 {
> +                               label = "user";
> +                               reg = <0x00040000 0x00400000>;
> +                               read-only;
> +                       };
> +                       partition@440000 {
> +                               label = "flash";
> +                               reg = <0x00440000 0x03bc0000>;
> +                       };

I can't verify the partition layout.

> +               };
> +       };
> +};


> +&iic2  {
> +       status = "okay";
> +       pinctrl-0 = <&iic2_pins>;
> +       pinctrl-names = "default";
> +
> +       clock-frequency = <100000>;
> +
> +       hdmi@39 {
> +               compatible = "adi,adv7511w";
> +               reg = <0x39>;
> +               interrupt-parent = <&gpio1>;
> +               interrupts = <15 IRQ_TYPE_LEVEL_LOW>;

Missing cec clock (OSC4).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
