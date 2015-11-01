From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4 5/6] ARM: dts: sunxi: Add Allwinner H3 DTSI
Date: Sun, 1 Nov 2015 10:46:06 +0100
Message-ID: <20151101094606.GQ6114@lukather>
References: <1445964626-6484-1-git-send-email-jenskuske@gmail.com>
 <1445964626-6484-6-git-send-email-jenskuske@gmail.com>
 <CAGb2v64NZMw0vNvVtepthUMox5TDy07gTBAWZqf8GAq6TrMpOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MdEjg5WkSuUg8x46"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v64NZMw0vNvVtepthUMox5TDy07gTBAWZqf8GAq6TrMpOg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Jens Kuske <jenskuske@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Hans de Goede <hdegoede@redhat.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org


--MdEjg5WkSuUg8x46
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 30, 2015 at 03:33:05PM +0800, Chen-Yu Tsai wrote:
> > +               pll6: clk@01c20028 {
> > +                       #clock-cells =3D <1>;
> > +                       compatible =3D "allwinner,sun6i-a31-pll6-clk";
> > +                       reg =3D <0x01c20028 0x4>;
> > +                       clocks =3D <&osc24M>;
> > +                       clock-output-names =3D "pll6", "pll6x2", "pll6d=
2";
>=20
> What's the extra "pll6d2"? If you have an extra output, it's not compatib=
le with
> "allwinner,sun6i-a31-pll6-clk".

[...]

> > +
> > +               ahb2: ahb2_clk@01c2005c {
> > +                       #clock-cells =3D <0>;
> > +                       compatible =3D "allwinner,sun8i-h3-ahb2-clk";
> > +                       reg =3D <0x01c2005c 0x4>;
> > +                       clocks =3D <&ahb1>, <&pll6 2>;
>=20
> And this would be wrong if you don't update the pll6 compatible or driver.
> There's no output on n =3D 2.
>=20
> You could also chain a fixed divider directly in the driver.

Or in the DT directly.

I'd really like to move away from the various fixed dividers output
that prevents to reuse the clock drivers when it's the only
difference, like what's done here.

>=20
> > +                       clock-output-names =3D "ahb2";
> > +               };
> > +
> > +               apb1: apb1_clk@01c20054 {
> > +                       #clock-cells =3D <0>;
> > +                       compatible =3D "allwinner,sun4i-a10-apb0-clk";
> > +                       reg =3D <0x01c20054 0x4>;
> > +                       clocks =3D <&ahb1>;
> > +                       clock-output-names =3D "apb1";
> > +               };
> > +
> > +               apb2: apb2_clk@01c20058 {
> > +                       #clock-cells =3D <0>;
> > +                       compatible =3D "allwinner,sun4i-a10-apb1-clk";
> > +                       reg =3D <0x01c20058 0x4>;
> > +                       clocks =3D <&osc32k>, <&osc24M>, <&pll6 0>, <&p=
ll6 0>;
> > +                       clock-output-names =3D "apb2";
> > +               };
> > +
> > +               bus_gates: clk@01c20060 {
> > +                       #clock-cells =3D <1>;
> > +                       compatible =3D "allwinner,sun8i-h3-bus-gates-cl=
k";
> > +                       reg =3D <0x01c20060 0x14>;
> > +                       clocks =3D <&ahb1>, <&ahb2>, <&apb1>, <&apb2>;
> > +                       clock-names =3D "ahb1", "ahb2", "apb1", "apb2";
> > +                       clock-indices =3D <5>, <6>, <8>,
> > +                                       <9>, <10>, <13>,
> > +                                       <14>, <17>, <18>,
> > +                                       <19>, <20>,
> > +                                       <21>, <23>,
> > +                                       <24>, <25>,
> > +                                       <26>, <27>,
> > +                                       <28>, <29>,
> > +                                       <30>, <31>, <32>,
> > +                                       <35>, <36>, <37>,
> > +                                       <40>, <41>, <43>,
> > +                                       <44>, <52>, <53>,
> > +                                       <54>, <64>,
> > +                                       <65>, <69>, <72>,
> > +                                       <76>, <77>, <78>,
> > +                                       <96>, <97>, <98>,
> > +                                       <112>, <113>,
> > +                                       <114>, <115>, <116>,
> > +                                       <128>, <135>;
> > +                       clock-output-names =3D "ahb1_ce", "ahb1_dma", "=
ahb1_mmc0",
> > +                                       "ahb1_mmc1", "ahb1_mmc2", "ahb1=
_nand",
> > +                                       "ahb1_sdram", "ahb2_gmac", "ahb=
1_ts",
> > +                                       "ahb1_hstimer", "ahb1_spi0",
> > +                                       "ahb1_spi1", "ahb1_otg",
> > +                                       "ahb1_otg_ehci0", "ahb1_ehic1",
>=20
> ahb1_ehci1? Same for the following 3 lines.
>=20
> > +                                       "ahb1_ehic2", "ahb1_ehic3",
> > +                                       "ahb1_otg_ohci0", "ahb2_ohic1",
> > +                                       "ahb2_ohic2", "ahb2_ohic3", "ah=
b1_ve",
> > +                                       "ahb1_lcd0", "ahb1_lcd1", "ahb1=
_deint",
> > +                                       "ahb1_csi", "ahb1_tve", "ahb1_h=
dmi",
> > +                                       "ahb1_de", "ahb1_gpu", "ahb1_ms=
gbox",
> > +                                       "ahb1_spinlock", "apb1_codec",
> > +                                       "apb1_spdif", "apb1_pio", "apb1=
_ths",
> > +                                       "apb1_i2s0", "apb1_i2s1", "apb1=
_i2s2",
> > +                                       "apb2_i2c0", "apb2_i2c1", "apb2=
_i2c2",
> > +                                       "apb2_uart0", "apb2_uart1",
> > +                                       "apb2_uart2", "apb2_uart3", "ap=
b2_scr",
> > +                                       "ahb1_ephy", "ahb1_dbg";
>=20
> If it weren't for the last 2 clocks, we could cleanly split out apb1 and =
apb2
> gates. Having a separate AHB clock gate taking 2 addresses seems messy
> as well. :(
>=20
> > +               };
> > +
> > +               mmc0_clk: clk@01c20088 {
> > +                       #clock-cells =3D <1>;
> > +                       compatible =3D "allwinner,sun4i-a10-mmc-clk";
> > +                       reg =3D <0x01c20088 0x4>;
> > +                       clocks =3D <&osc24M>, <&pll6 0>, <&pll8 0>;
> > +                       clock-output-names =3D "mmc0",
> > +                                            "mmc0_output",
> > +                                            "mmc0_sample";
> > +               };
> > +
> > +               mmc1_clk: clk@01c2008c {
> > +                       #clock-cells =3D <1>;
> > +                       compatible =3D "allwinner,sun4i-a10-mmc-clk";
> > +                       reg =3D <0x01c2008c 0x4>;
> > +                       clocks =3D <&osc24M>, <&pll6 0>, <&pll8 0>;
> > +                       clock-output-names =3D "mmc1",
> > +                                            "mmc1_output",
> > +                                            "mmc1_sample";
> > +               };
> > +
> > +               mmc2_clk: clk@01c20090 {
> > +                       #clock-cells =3D <1>;
> > +                       compatible =3D "allwinner,sun4i-a10-mmc-clk";
> > +                       reg =3D <0x01c20090 0x4>;
> > +                       clocks =3D <&osc24M>, <&pll6 0>, <&pll8 0>;
> > +                       clock-output-names =3D "mmc2",
> > +                                            "mmc2_output",
> > +                                            "mmc2_sample";
> > +               };
> > +
> > +               mbus_clk: clk@01c2015c {
> > +                       #clock-cells =3D <0>;
> > +                       compatible =3D "allwinner,sun8i-a23-mbus-clk";
> > +                       reg =3D <0x01c2015c 0x4>;
> > +                       clocks =3D <&osc24M>, <&pll6 1>, <&pll5>;
> > +                       clock-output-names =3D "mbus";
> > +               };
> > +       };
> > +
> > +       soc {
> > +               compatible =3D "simple-bus";
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <1>;
> > +               ranges;
> > +
> > +               dma: dma-controller@01c02000 {
> > +                       compatible =3D "allwinner,sun8i-h3-dma";
> > +                       reg =3D <0x01c02000 0x1000>;
> > +                       interrupts =3D <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks =3D <&bus_gates 6>;
> > +                       resets =3D <&bus_rst 6>;
> > +                       #dma-cells =3D <1>;
> > +               };
> > +
> > +               mmc0: mmc@01c0f000 {
> > +                       compatible =3D "allwinner,sun5i-a13-mmc";
> > +                       reg =3D <0x01c0f000 0x1000>;
> > +                       clocks =3D <&bus_gates 8>,
> > +                                <&mmc0_clk 0>,
> > +                                <&mmc0_clk 1>,
> > +                                <&mmc0_clk 2>;
> > +                       clock-names =3D "ahb",
> > +                                     "mmc",
> > +                                     "output",
> > +                                     "sample";
> > +                       resets =3D <&bus_rst 8>;
> > +                       reset-names =3D "ahb";
> > +                       interrupts =3D <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
> > +                       status =3D "disabled";
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +               };
> > +
> > +               mmc1: mmc@01c10000 {
> > +                       compatible =3D "allwinner,sun5i-a13-mmc";
> > +                       reg =3D <0x01c10000 0x1000>;
> > +                       clocks =3D <&bus_gates 9>,
> > +                                <&mmc1_clk 0>,
> > +                                <&mmc1_clk 1>,
> > +                                <&mmc1_clk 2>;
> > +                       clock-names =3D "ahb",
> > +                                     "mmc",
> > +                                     "output",
> > +                                     "sample";
> > +                       resets =3D <&bus_rst 9>;
> > +                       reset-names =3D "ahb";
> > +                       interrupts =3D <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> > +                       status =3D "disabled";
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +               };
> > +
> > +               mmc2: mmc@01c11000 {
> > +                       compatible =3D "allwinner,sun5i-a13-mmc";
> > +                       reg =3D <0x01c11000 0x1000>;
> > +                       clocks =3D <&bus_gates 10>,
> > +                                <&mmc2_clk 0>,
> > +                                <&mmc2_clk 1>,
> > +                                <&mmc2_clk 2>;
> > +                       clock-names =3D "ahb",
> > +                                     "mmc",
> > +                                     "output",
> > +                                     "sample";
> > +                       resets =3D <&bus_rst 10>;
> > +                       reset-names =3D "ahb";
> > +                       interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> > +                       status =3D "disabled";
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +               };
> > +
> > +               pio: pinctrl@01c20800 {
> > +                       compatible =3D "allwinner,sun8i-h3-pinctrl";
> > +                       reg =3D <0x01c20800 0x400>;
> > +                       interrupts =3D <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks =3D <&bus_gates 69>;
> > +                       gpio-controller;
> > +                       #gpio-cells =3D <3>;
> > +                       interrupt-controller;
> > +                       #interrupt-cells =3D <2>;
> > +
> > +                       uart0_pins_a: uart0@0 {
> > +                               allwinner,pins =3D "PA4", "PA5";
> > +                               allwinner,function =3D "uart0";
> > +                               allwinner,drive =3D <SUN4I_PINCTRL_10_M=
A>;
> > +                               allwinner,pull =3D <SUN4I_PINCTRL_NO_PU=
LL>;
> > +                       };
> > +
> > +                       mmc0_pins_a: mmc0@0 {
> > +                               allwinner,pins =3D "PF0", "PF1", "PF2",=
 "PF3",
> > +                                                "PF4", "PF5";
> > +                               allwinner,function =3D "mmc0";
> > +                               allwinner,drive =3D <SUN4I_PINCTRL_30_M=
A>;
> > +                               allwinner,pull =3D <SUN4I_PINCTRL_NO_PU=
LL>;
> > +                       };
> > +
> > +                       mmc0_cd_pin: mmc0_cd_pin@0 {
> > +                               allwinner,pins =3D "PF6";
> > +                               allwinner,function =3D "gpio_in";
> > +                               allwinner,drive =3D <SUN4I_PINCTRL_10_M=
A>;
> > +                               allwinner,pull =3D <SUN4I_PINCTRL_PULL_=
UP>;
> > +                       };
>=20
> This should be in the board DTS, unless this is the reference design,
> in which case you should name the label like "mmc0_cd_pin_reference_desig=
n".
>=20
> > +
> > +                       mmc1_pins_a: mmc1@0 {
> > +                               allwinner,pins =3D "PG0", "PG1", "PG2",=
 "PG3",
> > +                                                "PG4", "PG5";
> > +                               allwinner,function =3D "mmc1";
> > +                               allwinner,drive =3D <SUN4I_PINCTRL_30_M=
A>;
> > +                               allwinner,pull =3D <SUN4I_PINCTRL_NO_PU=
LL>;
> > +                       };
> > +               };
> > +
> > +               bus_rst: reset@01c202c0 {
> > +                       #reset-cells =3D <1>;
> > +                       compatible =3D "allwinner,sun8i-h3-bus-reset";
> > +                       reg =3D <0x01c202c0 0x1c>;
> > +               };
> > +
> > +               timer@01c20c00 {
> > +                       compatible =3D "allwinner,sun4i-a10-timer";
> > +                       reg =3D <0x01c20c00 0xa0>;
> > +                       interrupts =3D <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks =3D <&osc24M>;
> > +               };
> > +
> > +               wdt0: watchdog@01c20ca0 {
> > +                       compatible =3D "allwinner,sun6i-a31-wdt";
> > +                       reg =3D <0x01c20ca0 0x20>;
> > +                       interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> > +               };
> > +
> > +               uart0: serial@01c28000 {
> > +                       compatible =3D "snps,dw-apb-uart";
> > +                       reg =3D <0x01c28000 0x400>;
> > +                       interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> > +                       reg-shift =3D <2>;
> > +                       reg-io-width =3D <4>;
> > +                       clocks =3D <&bus_gates 112>;
> > +                       resets =3D <&bus_rst 144>;
>=20
> Aren't you handling the holes in the bus_rst driver? If so,
> isn't it supposed to align both bus_gates and bus_rst indexes?
>=20
> Same for the other UARTs.

Not really, the last reset registers don't have the same organization
than the bus clocks :/

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--MdEjg5WkSuUg8x46
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWNd9eAAoJEBx+YmzsjxAgQi0QAIgtst25og+dtP+O3KIrpoGP
7mCqMZPozsa7/0LEG8Cjg7yjuwyLYwNF3DAfTDDNtK9RJNOFXf8FoXglZR8NnePH
kdzWvt5h2E1dLQuVIaEIi60hsVCN16iAZuKN9euVflHyWBttu/h3TO9PMjK+eYyR
M5B+OBTKI/xmu2Q/T06vZw/IayEYcPuzFPlKNEU1BJJ3TZQcWD+OTinJHXm/LNUW
HKCmuDc0ZK5MqzOPkBpYGvZdx2Jz0/68PyR9/C4txeQ1pOGq9vRZwQV7pVuPs+g7
jp9dvKgDsxkszBOvr883BWkZJajx/d+/93R3hFmbLntazeVbfEZTYKqVpZPpPCpL
x8J8fr+IqgYcE6/4RLQMGctTf7WV/d8CUvl/fVzTdNAwQiO4WOQ6colLbXIRlbJZ
KpLRMN+qwuihXDAWbGvesKHVbpgh711U0jk2Rg8tBh6n/aQQyL0Rs4HJFpFi4Myf
t+GjRZz1trmleOjcQ0nQmTOevWh0PSteceFk6BD2N6YV6wWXbsS9raFo6Ql5bvcH
C49VDLMNHWKCu0ivg67w42xNsKF/R4+7TBdaTCgFKmrfe7oaA9mffRPpiFEkqKlx
wG3PLliUPSozsFFuQB78H454Wy0ueHv8doF6R2a3v4kmDjg8lAZTVdCYw90hIfpJ
1qxSkpcjYz+Ifwxi0ZSo
=hs/O
-----END PGP SIGNATURE-----

--MdEjg5WkSuUg8x46--
