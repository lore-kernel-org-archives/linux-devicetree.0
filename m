From: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH] ARM: dts: Introduce the NXP LS1021A-TSN board
Date: Fri, 17 May 2019 15:05:59 +0300
Message-ID: <CA+h21hos=kHRGq089=3Js2pPnW71BBv02rqiMqPcZFe_bzBUHA@mail.gmail.com>
References: <20190506010800.2433-1-olteanv@gmail.com> <20190517010450.GT15856@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190517010450.GT15856@dragon>
Sender: netdev-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: leoyang.li@nxp.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev <netdev@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 17 May 2019 at 04:05, Shawn Guo <shawnguo@kernel.org> wrote:
>
> On Mon, May 06, 2019 at 04:08:00AM +0300, Vladimir Oltean wrote:
> > The LS1021A-TSN is a development board built by VVDN/Argonboards in
> > partnership with NXP.
> >
> > It features the LS1021A SoC and the first-generation SJA1105T Ethernet
> > switch for prototyping implementations of a subset of IEEE 802.1 TSN
> > standards.
> >
> > It has two regular Ethernet ports and four switched, TSN-capable ports.
> >
> > It also features:
> > - One Arduino header
> > - One expansion header
> > - Two USB 3.0 ports
> > - One mini PCIe slot
> > - One SATA interface
> > - Accelerometer, gyroscope, temperature sensors
> >
> > Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> > ---
> >  arch/arm/boot/dts/Makefile        |   3 +-
> >  arch/arm/boot/dts/ls1021a-tsn.dts | 238 ++++++++++++++++++++++++++++++
> >  2 files changed, 240 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm/boot/dts/ls1021a-tsn.dts
> >
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index f4f5aeaf3298..529f0150f6b4 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -593,7 +593,8 @@ dtb-$(CONFIG_SOC_IMX7ULP) += \
> >  dtb-$(CONFIG_SOC_LS1021A) += \
> >       ls1021a-moxa-uc-8410a.dtb \
> >       ls1021a-qds.dtb \
> > -     ls1021a-twr.dtb
> > +     ls1021a-twr.dtb \
> > +     ls1021a-tsn.dtb
>
> Please keep the list alphabetically sorted.  That said, ls1021a-tsn.dtb
> should go prior to ls1021a-twr.dtb.
>
> >  dtb-$(CONFIG_SOC_VF610) += \
> >       vf500-colibri-eval-v3.dtb \
> >       vf610-bk4.dtb \
> > diff --git a/arch/arm/boot/dts/ls1021a-tsn.dts b/arch/arm/boot/dts/ls1021a-tsn.dts
> > new file mode 100644
> > index 000000000000..5269486699bd
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/ls1021a-tsn.dts
> > @@ -0,0 +1,238 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Copyright 2016-2018 NXP Semiconductors
> > + * Copyright 2019 Vladimir Oltean <olteanv@gmail.com>
> > + */
> > +
> > +/dts-v1/;
> > +#include "ls1021a.dtsi"
> > +
> > +/ {
> > +     model = "NXP LS1021A-TSN Board";
> > +
> > +     sys_mclk: clock-mclk {
> > +             compatible = "fixed-clock";
> > +             #clock-cells = <0>;
> > +             clock-frequency = <24576000>;
> > +     };
> > +
> > +     regulators {
> > +             compatible = "simple-bus";
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
>
> This is the old style of organizing fixed regulators, which has been
> complained by device tree maintainers.  Drop this container node and put
> the regulator nodes directly under root, using name schema below.
>
>         reg_xxx: regulator-xxx {
>                 ...
>         };
>
> And thus, 'reg' property in regulator node should be dropped.
>
> > +
> > +             reg_3p3v: regulator@0 {
> > +                     compatible = "regulator-fixed";
> > +                     reg = <0>;
> > +                     regulator-name = "3P3V";
> > +                     regulator-min-microvolt = <3300000>;
> > +                     regulator-max-microvolt = <3300000>;
> > +                     regulator-always-on;
> > +             };
> > +             reg_2p5v: regulator@1 {
> > +                     compatible = "regulator-fixed";
> > +                     reg = <1>;
> > +                     regulator-name = "2P5V";
> > +                     regulator-min-microvolt = <2500000>;
> > +                     regulator-max-microvolt = <2500000>;
> > +                     regulator-always-on;
> > +             };
> > +     };
> > +};
> > +
> > +&enet0 {
> > +     tbi-handle = <&tbi0>;
> > +     phy-handle = <&sgmii_phy2>;
> > +     phy-mode = "sgmii";
> > +     status = "ok";
>
> For sake of consistency, we prefer to use "okay".
>
> > +};
> > +
> > +&enet1 {
> > +     tbi-handle = <&tbi1>;
> > +     phy-handle = <&sgmii_phy1>;
> > +     phy-mode = "sgmii";
> > +     status = "ok";
> > +};
> > +
> > +/* RGMII delays added via PCB traces */
> > +&enet2 {
> > +     phy-mode = "rgmii";
> > +     status = "ok";
>
> Please have a newline between property list and child node.
>
> > +     fixed-link {
> > +             speed = <1000>;
> > +             full-duplex;
> > +     };
> > +};
> > +
> > +&dspi0 {
>
> Please sort these labeled nodes alphabetically.
>
> > +     bus-num = <0>;
> > +     status = "ok";
> > +
> > +     /* ADG704BRMZ 1:4 mux/demux */
> > +     tsn_switch: sja1105@1 {
>
> Use a generic node name, while label name can be specific.
>
> > +             reg = <0x1>;
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +             compatible = "nxp,sja1105t";
>
> Undocumented compatible?
>
> > +             /* 12 MHz */
> > +             spi-max-frequency = <12000000>;
> > +             /* Sample data on trailing clock edge */
> > +             spi-cpha;
> > +             fsl,spi-cs-sck-delay = <1000>;
> > +             fsl,spi-sck-cs-delay = <1000>;
>
> Have a newline.
>
> > +             ports {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
>
> Ditto
>
> > +                     port@0 {
> > +                             /* ETH5 written on chassis */
> > +                             label = "swp5";
> > +                             phy-handle = <&rgmii_phy6>;
> > +                             phy-mode = "rgmii-id";
> > +                             reg = <0>;
> > +                     };
>
> Please have a newline between nodes as well.
>
> > +                     port@1 {
> > +                             /* ETH2 written on chassis */
> > +                             label = "swp2";
> > +                             phy-handle = <&rgmii_phy3>;
> > +                             phy-mode = "rgmii-id";
> > +                             reg = <1>;
> > +                     };
> > +                     port@2 {
> > +                             /* ETH3 written on chassis */
> > +                             label = "swp3";
> > +                             phy-handle = <&rgmii_phy4>;
> > +                             phy-mode = "rgmii-id";
> > +                             reg = <2>;
> > +                     };
> > +                     port@3 {
> > +                             /* ETH4 written on chassis */
> > +                             phy-handle = <&rgmii_phy5>;
> > +                             label = "swp4";
> > +                             phy-mode = "rgmii-id";
> > +                             reg = <3>;
> > +                     };
> > +                     port@4 {
> > +                             /* Internal port connected to eth2 */
> > +                             ethernet = <&enet2>;
> > +                             phy-mode = "rgmii";
> > +                             reg = <4>;
> > +                             fixed-link {
> > +                                     speed = <1000>;
> > +                                     full-duplex;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&mdio0 {
> > +     /* AR8031 */
> > +     sgmii_phy1: ethernet-phy@1 {
> > +             reg = <0x1>;
> > +     };
> > +     /* AR8031 */
> > +     sgmii_phy2: ethernet-phy@2 {
> > +             reg = <0x2>;
> > +     };
> > +     /* BCM5464 */
> > +     rgmii_phy3: ethernet-phy@3 {
> > +             reg = <0x3>;
> > +     };
> > +     rgmii_phy4: ethernet-phy@4 {
> > +             reg = <0x4>;
> > +     };
> > +     rgmii_phy5: ethernet-phy@5 {
> > +             reg = <0x5>;
> > +     };
> > +     rgmii_phy6: ethernet-phy@6 {
> > +             reg = <0x6>;
> > +     };
> > +     /* SGMII PCS for enet0 */
> > +     tbi0: tbi-phy@1f {
> > +             reg = <0x1f>;
> > +             device_type = "tbi-phy";
> > +     };
> > +};
> > +
> > +&mdio1 {
> > +     /* SGMII PCS for enet1 */
> > +     tbi1: tbi-phy@1f {
> > +             reg = <0x1f>;
> > +             device_type = "tbi-phy";
> > +     };
> > +};
> > +
> > +&i2c0 {
> > +     status = "ok";
> > +
> > +     /* 3 axis accelerometer */
> > +     accelerometer@1e {
> > +             compatible = "fsl,fxls8471";
> > +             reg = <0x1e>;
> > +             position = <0>;
> > +     };
> > +     /* Gyroscope is at 0x20 but not supported */
> > +     /* Audio codec (SAI2) */
> > +     codec@2a {
>
> audio-codec
>
> > +             #sound-dai-cells = <0>;
>
> We usually start properties with 'compatible', so please move it behind.
>
> > +             compatible = "fsl,sgtl5000";
> > +             reg = <0x2a>;
> > +             VDDA-supply = <&reg_3p3v>;
> > +             VDDIO-supply = <&reg_2p5v>;
> > +             clocks = <&sys_mclk>;
> > +     };
> > +     /* Current sensing circuit for 1V VDDCORE PMIC rail */
> > +     current-sensor@44 {
> > +             compatible = "ti,ina220";
> > +             reg = <0x44>;
> > +             shunt-resistor = <1000>;
> > +     };
> > +     /* Current sensing circuit for 12V VCC rail */
> > +     current-sensor@45 {
> > +             compatible = "ti,ina220";
> > +             reg = <0x45>;
> > +             shunt-resistor = <1000>;
> > +     };
> > +     /* Thermal monitor - case */
> > +     temperature-sensor@48 {
> > +             compatible = "national,lm75";
> > +             reg = <0x48>;
> > +     };
> > +     /* Thermal monitor - chip */
> > +     temperature-sensor@4c {
> > +             compatible = "ti,tmp451";
> > +             reg = <0x4c>;
> > +     };
> > +     /* 4-channel ADC */
> > +     adc@49 {
> > +             compatible = "ad7924";
>
> Undocumented.
>
> Shawn
>
> > +             reg = <0x49>;
> > +     };
> > +};
> > +
> > +&ifc {
> > +     status = "disabled";
> > +};
> > +
> > +&esdhc {
> > +     status = "ok";
> > +};
> > +
> > +&uart0 {
> > +     status = "ok";
> > +};
> > +
> > +&lpuart0 {
> > +     status = "ok";
> > +};
> > +
> > +&lpuart3 {
> > +     status = "ok";
> > +};
> > +
> > +&sai2 {
> > +     status = "ok";
> > +};
> > +
> > +&sata {
> > +     status = "ok";
> > +};
> > --
> > 2.17.1
> >

Hi Shawn,

Thanks for the feedback!
Do you want a v2 now (will you merge it for 5.2) or should I send it
after the merge window closes?
The "nxp,sja1105t" compatible is not undocumented but belongs to
drivers/net/dsa/sja1105/ which was recently merged into mainline via
the netdev tree (hence it's not in your tree yet).
The situation with "ad7924" is more funny. The compatible is indeed
undocumented but belongs to drivers/iio/adc/ad7923.c. I don't know why
it lacks an entry in Documentation/devicetree/bindings/iio/adc/.
However I mistook the chip and it's not a Analog Devices AD7924 ADC
with a SPI interface, but a TI ADS7924 ADC with an I2C interface. I
can remove it from v2 since it does not have a Linux driver as far as
I can tell.

-Vladimir
