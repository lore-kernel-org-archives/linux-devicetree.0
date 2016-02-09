From: Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v6 1/2] dt/bindings: Add PIC32 clock binding documentation
Date: Mon, 08 Feb 2016 16:45:13 -0800
Message-ID: <20160209004513.12298.5063@quark.deferred.io>
References: <1454966902-15228-1-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1454966902-15228-1-git-send-email-joshua.henderson@microchip.com>
Sender: linux-clk-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Purna Chandra Mandal <purna.mandal@microchip.com>, Joshua Henderson <joshua.henderson@microchip.com>, Ralf Baechle <ralf@linux-mips.org>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Joshua,

Quoting Joshua Henderson (2016-02-08 13:28:16)
> +       clocks_node {
> +               reg =3D <>;
> +
> +               spll_node {
> +                       ...
> +               };
> +
> +               frcdiv_node {
> +                       ...
> +               };
> +
> +               sysclk_mux_node {
> +                       ...
> +               };
> +
> +               pbdiv_node {
> +                       ...
> +               };
> +
> +               refoclk_node {
> +                       ...
> +               };

Why the _node suffix on everything?

> +               ...
> +       };
> +
> +This binding uses the common clock binding[1].
> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +Required properties:
> +- compatible : should be one of "microchip,pic32mzda-clk",
> +    "microchip,pic32mzda-sosc", "microchip,pic32mzda-frcdivclk",
> +    "microchip,pic32mzda-syspll", "microchip,pic32mzda-sysclk-v2",
> +    "microchip,pic32mzda-pbclk", "microchip,pic32mzda-refoclk".

This seems like a lot of compatible strings. I took a very quick look a=
t
the pic32mz reference manual and it seems like all of those clock nodes
are on-chip, correct? The only thing that would be off-chip would the
crystal that supplies Posc (OSC1 and OSC2) as well as the (mandatory?)
32k clock for Sosc (SOSCI and SOSCO).

Since most of those clocks are on-chip, can't you just group them all
into a single clock generator node? E.g. everything that's in the same
address range probably belongs in one node, the USB PLL should be a
fixed-rate clock stuffed inside of the USB host controller DT node, etc=
=2E

More to the point this DT binding description + driver is clearly
following the Device Tree Data Driven=E2=84=A2 way of doing things, whi=
ch isn't
necessarily a good thing. Putting hardware details into drivers (in the
form of static struct initialization) is a good thing.

> +- reg : A Base address and length of the register set.
> +- interrupts : source of interrupt.
> +
> +Optional properties (for subnodes):
> +- #clock-cells: From common clock binding, should be 0.
> +- microchip,clock-indices: in multiplexer node clock sources always =
aren't linear
> +    and contiguous. This property helps define clock-sources with re=
spect to
> +    the mux clock node.
> +- microchip,ignore-unused : ignore gate request even if the gated cl=
ock is unused.
> +- microchip,status-bit-mask: bitmask for status check. This will be =
used to confirm
> +    particular operation by clock sub-node is completed. It is depen=
dent sub-node.
> +- microchip,bit-mask: enable mask, similar to microchip,status-bit-m=
ask.

Generally it is bad to put register-level details into DT. Static clock
data is where this level detail belongs.

> +- microchip,slew-step: enable frequency slewing(stepping) during rat=
e change;
> +    applicable only to sys-clock subnode.

Does this change from board to board or from chip-to-chip? Should it
belong in DT or in the driver?

> +
> +Example:
> +
> +/* PIC32 specific clks */
> +pic32_clktree {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <1>;
> +       reg =3D <0x1f801200 0x200>;
> +       compatible =3D "microchip,pic32mzda-clk";
> +       ranges =3D <0 0x1f801200 0x200>;
> +
> +       /* secondary oscillator; external input on SOSCI pin */
> +       SOSC:sosc_clk@0 {
> +               #clock-cells =3D <0>;
> +               compatible =3D "microchip,pic32mzda-sosc";
> +               clock-frequency =3D <32768>;
> +               reg =3D <0x000 0x10>, /* enable reg */
> +                     <0x1d0 0x10>; /* status reg */
> +               microchip,bit-mask =3D <0x02>; /* enable mask */
> +               microchip,status-bit-mask =3D <0x10>; /* status-mask*=
/
> +       };
> +
> +       FRCDIV:frcdiv_clk {
> +               #clock-cells =3D <0>;
> +               compatible =3D "microchip,pic32mzda-frcdivclk";
> +               clocks =3D <&FRC>;
> +               clock-output-names =3D "frcdiv_clk";
> +       };
> +
> +       /* System PLL clock */
> +       SYSPLL:spll_clk@20 {
> +               #clock-cells =3D <0>;
> +               compatible =3D "microchip,pic32mzda-syspll";
> +               reg =3D <0x020 0x10>, /* SPLL register */
> +                     <0x1d0 0x10>; /* CLKSTAT register */
> +               clocks =3D <&POSC>, <&FRC>;
> +               clock-output-names =3D "sys_pll";
> +               microchip,status-bit-mask =3D <0x80>; /* SPLLRDY */
> +       };
> +
> +       /* system clock; mux with postdiv & slew */
> +       SYSCLK:sys_clk@1c0 {
> +               #clock-cells =3D <0>;
> +               compatible =3D "microchip,pic32mzda-sysclk-v2";
> +               reg =3D <0x1c0 0x04>; /* SLEWCON */
> +               clocks =3D <&FRCDIV>, <&SYSPLL>, <&POSC>, <&SOSC>,
> +                        <&LPRC>, <&FRCDIV>;
> +               microchip,clock-indices =3D <0>, <1>, <2>, <4>,
> +                                         <5>, <7>;
> +               clock-output-names =3D "sys_clk";
> +       };
> +
> +       /* UPLL is integral part of USB PHY; UTMI clk for USBCORE */
> +       UPLL:usb_phy_clk {
> +               #clock-cells =3D <0>;
> +               compatible =3D "fixed-clocks";
> +               clock-frequency =3D <24000000>;
> +               clock-output-names =3D "usbphy_clk";
> +       };
> +
> +       /* Peripheral bus1 clock */
> +       PBCLK1:pb1_clk@140 {
> +               reg =3D <0x140 0x10>;
> +               #clock-cells =3D <0>;
> +               compatible =3D "microchip,pic32mzda-pbclk";
> +               clocks =3D <&SYSCLK>;
> +               clock-output-names =3D "pb1_clk";
> +               /* used by system modules, not gateable */
> +               microchip,ignore-unused;
> +       };
> +
> +       /* Peripheral bus2 clock */
> +       PBCLK2:pb2_clk@150 {
> +               reg =3D <0x150 0x10>;
> +               #clock-cells =3D <0>;
> +               compatible =3D "microchip,pic32mzda-pbclk";
> +               clocks =3D <&SYSCLK>;
> +               clock-output-names =3D "pb2_clk";
> +               /* avoid gating even if unused */
> +               microchip,ignore-unused;
> +       };
> +
> +       /* Peripheral bus3 clock */
> +       PBCLK3:pb3_clk@160 {
> +               reg =3D <0x160 0x10>;
> +               #clock-cells =3D <0>;
> +               compatible =3D "microchip,pic32mzda-pbclk";
> +               clocks =3D <&SYSCLK>;
> +               clock-output-names =3D "pb3_clk";
> +       };
> +
> +       /* Peripheral bus4 clock(I/O ports, GPIO) */
> +       PBCLK4:pb4_clk@170 {
> +               reg =3D <0x170 0x10>;
> +               #clock-cells =3D <0>;
> +               compatible =3D "microchip,pic32mzda-pbclk";
> +               clocks =3D <&SYSCLK>;
> +               clock-output-names =3D "pb4_clk";
> +       };
> +
> +       /* Peripheral bus clock */
> +       PBCLK5:pb5_clk@180 {
> +               reg =3D <0x180 0x10>;
> +               #clock-cells =3D <0>;
> +               compatible =3D "microchip,pic32mzda-pbclk";
> +               clocks =3D <&SYSCLK>;
> +               clock-output-names =3D "pb5_clk";
> +       };
> +
> +       /* Peripheral Bus6 clock; */
> +       PBCLK6:pb6_clk@190 {
> +               reg =3D <0x190 0x10>;
> +               compatible =3D "microchip,pic32mzda-pbclk";
> +               clocks =3D <&SYSCLK>;
> +               #clock-cells =3D <0>;
> +       };
> +
> +       /* Peripheral bus7 clock */
> +       PBCLK7:pb7_clk@1a0 {
> +               reg =3D <0x1a0 0x10>;
> +               #clock-cells =3D <0>;
> +               compatible =3D "microchip,pic32mzda-pbclk";
> +               /* CPU is driven by this clock; so named */
> +               clock-output-names =3D "cpu_clk";
> +               clocks =3D <&SYSCLK>;
> +       };
> +
> +       /* Reference Oscillator clock for SPI/I2S */
> +       REFCLKO1:refo1_clk@80 {
> +               reg =3D <0x080 0x20>;
> +               #clock-cells =3D <0>;
> +               compatible =3D "microchip,pic32mzda-refoclk";
> +               clocks =3D <&SYSCLK>, <&PBCLK1>, <&POSC>, <&FRC>, <&L=
PRC>,
> +                       <&SOSC>, <&SYSPLL>, <&REFIx>, <&BFRC>;
> +               microchip,clock-indices =3D <0>, <1>, <2>, <3>, <4>,
> +                                         <5>, <7>, <8>, <9>;
> +               clock-output-names =3D "refo1_clk";
> +       };
> +
> +       /* Reference Oscillator clock for SQI */
> +       REFCLKO2:refo2_clk@a0 {
> +               reg =3D <0x0a0 0x20>;
> +               #clock-cells =3D <0>;
> +               compatible =3D "microchip,pic32mzda-refoclk";
> +               clocks =3D <&SYSCLK>, <&PBCLK1>, <&POSC>, <&FRC>, <&L=
PRC>,
> +                        <&SOSC>, <&SYSPLL>, <&REFIx>, <&BFRC>;
> +               microchip,clock-indices =3D <0>, <1>, <2>, <3>, <4>,
> +                                         <5>, <7>, <8>, <9>;
> +               clock-output-names =3D "refo2_clk";
> +       };
> +
> +       /* Reference Oscillator clock, ADC */
> +       REFCLKO3:refo3_clk@c0 {
> +               reg =3D <0x0c0 0x20>;
> +               compatible =3D "microchip,pic32mzda-refoclk";
> +               clocks =3D <&SYSCLK>, <&PBCLK1>, <&POSC>, <&FRC>, <&L=
PRC>,
> +                        <&SOSC>, <&SYSPLL>, <&REFIx>, <&BFRC>;
> +               microchip,clock-indices =3D <0>, <1>, <2>, <3>, <4>,
> +                                         <5>, <7>, <8>, <9>;
> +               #clock-cells =3D <0>;
> +               clock-output-names =3D "refo3_clk";
> +       };
> +
> +       /* Reference Oscillator clock */
> +       REFCLKO4:refo4_clk@e0 {
> +               reg =3D <0x0e0 0x20>;
> +               compatible =3D "microchip,pic32mzda-refoclk";
> +               clocks =3D <&SYSCLK>, <&PBCLK1>, <&POSC>, <&FRC>, <&L=
PRC>,
> +                        <&SOSC>, <&SYSPLL>, <&REFIx>, <&BFRC>;
> +               microchip,clock-indices =3D <0>,<1>,<2>,<3>,<4>,
> +                                         <5>,<7>,<8>,<9>;
> +               #clock-cells =3D <0>;
> +               clock-output-names =3D "refo4_clk";
> +       };
> +
> +       /* Reference Oscillator clock, LCD */
> +       REFCLKO5:refo5_clk@100 {
> +               reg =3D <0x100 0x20>;
> +               compatible =3D "microchip,pic32mzda-refoclk";
> +               clocks =3D <&SYSCLK>,<&PBCLK1>,<&POSC>,<&FRC>,<&LPRC>=
,
> +                        <&SOSC>,<&SYSPLL>,<&REFIx>,<&BFRC>;
> +               microchip,clock-indices =3D <0>, <1>, <2>, <3>, <4>,
> +                                         <5>, <7>, <8>,<9>;
> +               #clock-cells =3D <0>;
> +               clock-output-names =3D "refo5_clk";
> +       };

Essentially all of the above information can live in the driver as
static data. Then you can create a single clock generator node like you
see in the qcom binding:

An example from Documentation/devicetree/bindings/clock/qcom,gcc.txt an=
d
arch/arm/boot/dts/qcom-apq8064.dtsi:

        gcc: clock-controller@900000 {
                compatible =3D "qcom,gcc-apq8064";
                reg =3D <0x00900000 0x4000>;
                #clock-cells =3D <1>;
                #reset-cells =3D <1>;
        };

If you have off-chip fixed-rate or fixed-factor clocks (such as XTALs o=
r
the USBPLL in your USB IP block) then go ahead and put those in Device
Tree. Board specific details belong in DT (and we make exception for
simple fixed-rate clocks like your USBPLL one).

Regards,
Mike

> +};
> +
> +The clock consumer should specify the desired clock by having the cl=
ocks in its
> +"clock" phandle cell. For example for UART:
> +
> +uart2: serial@<> {
> +       compatible =3D "microchip,pic32mzda-uart";
> +       reg =3D <>;
> +       interrupts =3D <>;
> +       clocks =3D <&PBCLK2>;
> +}
> --=20
> 1.7.9.5
>=20
