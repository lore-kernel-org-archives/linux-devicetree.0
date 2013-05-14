From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH 1/2] clk: sun5i: Add compatibles for Allwinner A13
Date: Tue, 14 May 2013 12:26:02 -0700
Message-ID: <20130514192602.10068.53237@quantum>
References: <1367315783-21345-1-git-send-email-maxime.ripard@free-electrons.com>
 <1367315783-21345-2-git-send-email-maxime.ripard@free-electrons.com>
 <517FA8F7.1080609@elopez.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <517FA8F7.1080609@elopez.com.ar>
Sender: linux-doc-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, Emilio Lopez <emilio@elopez.com.ar>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Landley <rob@landley.net>
List-Id: devicetree@vger.kernel.org

Quoting Emilio L=C3=B3pez (2013-04-30 04:20:23)
> Hi Maxime,
>=20
> El 30/04/13 06:56, Maxime Ripard escribi=C3=B3:
> > The A13 has a lot less clocks than the one found in the Allwinner A=
10.
> > Add these stripped down clocks to the clock driver and in the
> > documentation.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> This patch looks good to me.
>=20
> Acked-by: Emilio L=C3=B3pez <emilio@elopez.com.ar>
>=20

I've taken patch #1 into clk-next.

Thanks!
Mike

> > ---
> >  Documentation/devicetree/bindings/clock/sunxi.txt  | 117 +++------=
------------
> >  .../bindings/clock/sunxi/sun4i-a10-gates.txt       |  93 +++++++++=
+++++++
> >  .../bindings/clock/sunxi/sun5i-a13-gates.txt       |  58 +++++++++=
+
> >  drivers/clk/sunxi/clk-sunxi.c                      |  31 ++++--
> >  4 files changed, 187 insertions(+), 112 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/clock/sunxi/s=
un4i-a10-gates.txt
> >  create mode 100644 Documentation/devicetree/bindings/clock/sunxi/s=
un5i-a13-gates.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Do=
cumentation/devicetree/bindings/clock/sunxi.txt
> > index 729f524..d495521 100644
> > --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> > +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> > @@ -12,22 +12,30 @@ Required properties:
> >       "allwinner,sun4i-axi-clk" - for the AXI clock
> >       "allwinner,sun4i-axi-gates-clk" - for the AXI gates
> >       "allwinner,sun4i-ahb-clk" - for the AHB clock
> > -     "allwinner,sun4i-ahb-gates-clk" - for the AHB gates
> > +     "allwinner,sun4i-ahb-gates-clk" - for the AHB gates on A10
> > +     "allwinner,sun5i-a13-ahb-gates-clk" - for the AHB gates on A1=
3
> >       "allwinner,sun4i-apb0-clk" - for the APB0 clock
> > -     "allwinner,sun4i-apb0-gates-clk" - for the APB0 gates
> > +     "allwinner,sun4i-apb0-gates-clk" - for the APB0 gates on A10
> > +     "allwinner,sun5i-a13-apb0-gates-clk" - for the APB0 gates on =
A13
> >       "allwinner,sun4i-apb1-clk" - for the APB1 clock
> >       "allwinner,sun4i-apb1-mux-clk" - for the APB1 clock muxing
> > -     "allwinner,sun4i-apb1-gates-clk" - for the APB1 gates
> > +     "allwinner,sun4i-apb1-gates-clk" - for the APB1 gates on A10
> > +     "allwinner,sun5i-a13-apb1-gates-clk" - for the APB1 gates on =
A13
> > =20
> >  Required properties for all clocks:
> >  - reg : shall be the control register address for the clock.
> >  - clocks : shall be the input parent clock(s) phandle for the cloc=
k
> >  - #clock-cells : from common clock binding; shall be set to 0 exce=
pt for
> > -     "allwinner,sun4i-*-gates-clk" where it shall be set to 1
> > +     "allwinner,*-gates-clk" where it shall be set to 1
> > =20
> > -Additionally, "allwinner,sun4i-*-gates-clk" clocks require:
> > +Additionally, "allwinner,*-gates-clk" clocks require:
> >  - clock-output-names : the corresponding gate names that the clock=
 controls
> > =20
> > +Clock consumers should specify the desired clocks they use with a
> > +"clocks" phandle cell. Consumers that are using a gated clock shou=
ld
> > +provide an additional ID in their clock property. The values of th=
is
> > +ID are documented in sunxi/<soc>-gates.txt.
> > +
> >  For example:
> > =20
> >  osc24M: osc24M@01c20050 {
> > @@ -50,102 +58,3 @@ cpu: cpu@01c20054 {
> >       reg =3D <0x01c20054 0x4>;
> >       clocks =3D <&osc32k>, <&osc24M>, <&pll1>;
> >  };
> > -
> > -
> > -
> > -Gate clock outputs
> > -
> > -The "allwinner,sun4i-*-gates-clk" clocks provide several gatable o=
utputs;
> > -their corresponding offsets as present on sun4i are listed below. =
Note that
> > -some of these gates are not present on sun5i.
> > -
> > -  * AXI gates ("allwinner,sun4i-axi-gates-clk")
> > -
> > -    DRAM                                                          =
      0
> > -
> > -  * AHB gates ("allwinner,sun4i-ahb-gates-clk")
> > -
> > -    USB0                                                          =
      0
> > -    EHCI0                                                         =
      1
> > -    OHCI0                                                         =
      2*
> > -    EHCI1                                                         =
      3
> > -    OHCI1                                                         =
      4*
> > -    SS                                                            =
      5
> > -    DMA                                                           =
      6
> > -    BIST                                                          =
      7
> > -    MMC0                                                          =
      8
> > -    MMC1                                                          =
      9
> > -    MMC2                                                          =
      10
> > -    MMC3                                                          =
      11
> > -    MS                                                            =
      12**
> > -    NAND                                                          =
      13
> > -    SDRAM                                                         =
      14
> > -
> > -    ACE                                                           =
      16
> > -    EMAC                                                          =
      17
> > -    TS                                                            =
      18
> > -
> > -    SPI0                                                          =
      20
> > -    SPI1                                                          =
      21
> > -    SPI2                                                          =
      22
> > -    SPI3                                                          =
      23
> > -    PATA                                                          =
      24
> > -    SATA                                                          =
      25**
> > -    GPS                                                           =
      26*
> > -
> > -    VE                                                            =
      32
> > -    TVD                                                           =
      33
> > -    TVE0                                                          =
      34
> > -    TVE1                                                          =
      35
> > -    LCD0                                                          =
      36
> > -    LCD1                                                          =
      37
> > -
> > -    CSI0                                                          =
      40
> > -    CSI1                                                          =
      41
> > -
> > -    HDMI                                                          =
      43
> > -    DE_BE0                                                        =
      44
> > -    DE_BE1                                                        =
      45
> > -    DE_FE0                                                        =
      46
> > -    DE_FE1                                                        =
      47
> > -
> > -    MP                                                            =
      50
> > -
> > -    MALI400                                                       =
      52
> > -
> > -  * APB0 gates ("allwinner,sun4i-apb0-gates-clk")
> > -
> > -    CODEC                                                         =
      0
> > -    SPDIF                                                         =
      1*
> > -    AC97                                                          =
      2
> > -    IIS                                                           =
      3
> > -
> > -    PIO                                                           =
      5
> > -    IR0                                                           =
      6
> > -    IR1                                                           =
      7
> > -
> > -    KEYPAD                                                        =
      10
> > -
> > -  * APB1 gates ("allwinner,sun4i-apb1-gates-clk")
> > -
> > -    I2C0                                                          =
      0
> > -    I2C1                                                          =
      1
> > -    I2C2                                                          =
      2
> > -
> > -    CAN                                                           =
      4
> > -    SCR                                                           =
      5
> > -    PS20                                                          =
      6
> > -    PS21                                                          =
      7
> > -
> > -    UART0                                                         =
      16
> > -    UART1                                                         =
      17
> > -    UART2                                                         =
      18
> > -    UART3                                                         =
      19
> > -    UART4                                                         =
      20
> > -    UART5                                                         =
      21
> > -    UART6                                                         =
      22
> > -    UART7                                                         =
      23
> > -
> > -Notation:
> > - [*]:  The datasheet didn't mention these, but they are present on=
 AW code
> > - [**]: The datasheet had this marked as "NC" but they are used on =
AW code
> > diff --git a/Documentation/devicetree/bindings/clock/sunxi/sun4i-a1=
0-gates.txt b/Documentation/devicetree/bindings/clock/sunxi/sun4i-a10-g=
ates.txt
> > new file mode 100644
> > index 0000000..6a03475
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/sunxi/sun4i-a10-gates=
=2Etxt
> > @@ -0,0 +1,93 @@
> > +Gate clock outputs
> > +------------------
> > +
> > +  * AXI gates ("allwinner,sun4i-axi-gates-clk")
> > +
> > +    DRAM                                     0
> > +
> > +  * AHB gates ("allwinner,sun4i-ahb-gates-clk")
> > +
> > +    USB0                                     0
> > +    EHCI0                                    1
> > +    OHCI0                                    2*
> > +    EHCI1                                    3
> > +    OHCI1                                    4*
> > +    SS                                               5
> > +    DMA                                              6
> > +    BIST                                     7
> > +    MMC0                                     8
> > +    MMC1                                     9
> > +    MMC2                                     10
> > +    MMC3                                     11
> > +    MS                                               12**
> > +    NAND                                     13
> > +    SDRAM                                    14
> > +
> > +    ACE                                              16
> > +    EMAC                                     17
> > +    TS                                               18
> > +
> > +    SPI0                                     20
> > +    SPI1                                     21
> > +    SPI2                                     22
> > +    SPI3                                     23
> > +    PATA                                     24
> > +    SATA                                     25**
> > +    GPS                                              26*
> > +
> > +    VE                                               32
> > +    TVD                                              33
> > +    TVE0                                     34
> > +    TVE1                                     35
> > +    LCD0                                     36
> > +    LCD1                                     37
> > +
> > +    CSI0                                     40
> > +    CSI1                                     41
> > +
> > +    HDMI                                     43
> > +    DE_BE0                                   44
> > +    DE_BE1                                   45
> > +    DE_FE1                                   46
> > +    DE_FE1                                   47
> > +
> > +    MP                                               50
> > +
> > +    MALI400                                  52
> > +
> > +  * APB0 gates ("allwinner,sun4i-apb0-gates-clk")
> > +
> > +    CODEC                                    0
> > +    SPDIF                                    1*
> > +    AC97                                     2
> > +    IIS                                              3
> > +
> > +    PIO                                              5
> > +    IR0                                              6
> > +    IR1                                              7
> > +
> > +    KEYPAD                                   10
> > +
> > +  * APB1 gates ("allwinner,sun4i-apb1-gates-clk")
> > +
> > +    I2C0                                     0
> > +    I2C1                                     1
> > +    I2C2                                     2
> > +
> > +    CAN                                              4
> > +    SCR                                              5
> > +    PS20                                     6
> > +    PS21                                     7
> > +
> > +    UART0                                    16
> > +    UART1                                    17
> > +    UART2                                    18
> > +    UART3                                    19
> > +    UART4                                    20
> > +    UART5                                    21
> > +    UART6                                    22
> > +    UART7                                    23
> > +
> > +Notation:
> > + [*]:  The datasheet didn't mention these, but they are present on=
 AW code
> > + [**]: The datasheet had this marked as "NC" but they are used on =
AW code
> > diff --git a/Documentation/devicetree/bindings/clock/sunxi/sun5i-a1=
3-gates.txt b/Documentation/devicetree/bindings/clock/sunxi/sun5i-a13-g=
ates.txt
> > new file mode 100644
> > index 0000000..006b6df
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/sunxi/sun5i-a13-gates=
=2Etxt
> > @@ -0,0 +1,58 @@
> > +Gate clock outputs
> > +------------------
> > +
> > +  * AXI gates ("allwinner,sun4i-axi-gates-clk")
> > +
> > +    DRAM                                     0
> > +
> > +  * AHB gates ("allwinner,sun5i-a13-ahb-gates-clk")
> > +
> > +    USBOTG                                   0
> > +    EHCI                                     1
> > +    OHCI                                     2
> > +
> > +    SS                                               5
> > +    DMA                                              6
> > +    BIST                                     7
> > +    MMC0                                     8
> > +    MMC1                                     9
> > +    MMC2                                     10
> > +
> > +    NAND                                     13
> > +    SDRAM                                    14
> > +
> > +    SPI0                                     20
> > +    SPI1                                     21
> > +    SPI2                                     22
> > +
> > +    STIMER                                   28
> > +
> > +    VE                                               32
> > +
> > +    LCD                                              36
> > +
> > +    CSI                                              40
> > +
> > +    DE_BE                                    44
> > +
> > +    DE_FE                                    46
> > +
> > +    IEP                                              51
> > +    MALI400                                  52
> > +
> > +  * APB0 gates ("allwinner,sun5i-a13-apb0-gates-clk")
> > +
> > +    CODEC                                    0
> > +
> > +    PIO                                              5
> > +    IR                                               6
> > +
> > +  * APB1 gates ("allwinner,sun5i-a13-apb1-gates-clk")
> > +
> > +    I2C0                                     0
> > +    I2C1                                     1
> > +    I2C2                                     2
> > +
> > +    UART1                                    17
> > +
> > +    UART3                                    19
> > diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-=
sunxi.c
> > index 8492ad1..930d36f 100644
> > --- a/drivers/clk/sunxi/clk-sunxi.c
> > +++ b/drivers/clk/sunxi/clk-sunxi.c
> > @@ -333,22 +333,34 @@ struct gates_data {
> >       DECLARE_BITMAP(mask, SUNXI_GATES_MAX_SIZE);
> >  };
> > =20
> > -static const __initconst struct gates_data axi_gates_data =3D {
> > +static const __initconst struct gates_data sun4i_axi_gates_data =3D=
 {
> >       .mask =3D {1},
> >  };
> > =20
> > -static const __initconst struct gates_data ahb_gates_data =3D {
> > +static const __initconst struct gates_data sun4i_ahb_gates_data =3D=
 {
> >       .mask =3D {0x7F77FFF, 0x14FB3F},
> >  };
> > =20
> > -static const __initconst struct gates_data apb0_gates_data =3D {
> > +static const __initconst struct gates_data sun5i_a13_ahb_gates_dat=
a =3D {
> > +     .mask =3D {0x107067e7, 0x185111},
>=20
> If you send a v2 please use uppercase e and a below for consistency.
>=20
> > +};
> > +
> > +static const __initconst struct gates_data sun4i_apb0_gates_data =3D=
 {
> >       .mask =3D {0x4EF},
> >  };
> > =20
> > -static const __initconst struct gates_data apb1_gates_data =3D {
> > +static const __initconst struct gates_data sun5i_a13_apb0_gates_da=
ta =3D {
> > +     .mask =3D {0x61},
> > +};
> > +
> > +static const __initconst struct gates_data sun4i_apb1_gates_data =3D=
 {
> >       .mask =3D {0xFF00F7},
> >  };
> > =20
> > +static const __initconst struct gates_data sun5i_a13_apb1_gates_da=
ta =3D {
> > +     .mask =3D {0xa0007},
>=20
> > +};
> > +
> >  static void __init sunxi_gates_clk_setup(struct device_node *node,
> >                                        struct gates_data *data)
> >  {
> > @@ -428,10 +440,13 @@ static const __initconst struct of_device_id =
clk_mux_match[] =3D {
> > =20
> >  /* Matches for gate clocks */
> >  static const __initconst struct of_device_id clk_gates_match[] =3D=
 {
> > -     {.compatible =3D "allwinner,sun4i-axi-gates-clk", .data =3D &=
axi_gates_data,},
> > -     {.compatible =3D "allwinner,sun4i-ahb-gates-clk", .data =3D &=
ahb_gates_data,},
> > -     {.compatible =3D "allwinner,sun4i-apb0-gates-clk", .data =3D =
&apb0_gates_data,},
> > -     {.compatible =3D "allwinner,sun4i-apb1-gates-clk", .data =3D =
&apb1_gates_data,},
> > +     {.compatible =3D "allwinner,sun4i-axi-gates-clk", .data =3D &=
sun4i_axi_gates_data,},
> > +     {.compatible =3D "allwinner,sun4i-ahb-gates-clk", .data =3D &=
sun4i_ahb_gates_data,},
> > +     {.compatible =3D "allwinner,sun5i-a13-ahb-gates-clk", .data =3D=
 &sun5i_a13_ahb_gates_data,},
> > +     {.compatible =3D "allwinner,sun4i-apb0-gates-clk", .data =3D =
&sun4i_apb0_gates_data,},
> > +     {.compatible =3D "allwinner,sun5i-a13-apb0-gates-clk", .data =
=3D &sun5i_a13_apb0_gates_data,},
> > +     {.compatible =3D "allwinner,sun4i-apb1-gates-clk", .data =3D =
&sun4i_apb1_gates_data,},
> > +     {.compatible =3D "allwinner,sun5i-a13-apb1-gates-clk", .data =
=3D &sun5i_a13_apb1_gates_data,},
> >       {}
> >  };
> > =20
> >=20
>=20
> Thanks!
>=20
> Emilio
