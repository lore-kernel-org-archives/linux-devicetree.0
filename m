From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 2/2] arm64: Add Juno SoC device tree.
Date: Mon, 10 Nov 2014 20:19:24 +0000
Message-ID: <20141110201924.GB10247@e106497-lin.cambridge.arm.com>
References: <1415618875-8469-1-git-send-email-Liviu.Dudau@arm.com>
 <1415618875-8469-3-git-send-email-Liviu.Dudau@arm.com>
 <CAOesGMhNcT4xoKaMgvihk3Lc6XWWiaKeRNt_C04dV4ZSAwjZQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMhNcT4xoKaMgvihk3Lc6XWWiaKeRNt_C04dV4ZSAwjZQQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, device tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 10, 2014 at 05:42:59PM +0000, Olof Johansson wrote:
> Hi,
>=20
> Nice to see this posted! Thanks for doing so.
>=20
> On Mon, Nov 10, 2014 at 3:27 AM, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org> wr=
ote:
> > Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
>=20
> Care to give a brief patch description?

Bah, I've managed to screw this! I will add a description, of course.

>=20
> > ---
> >  arch/arm64/boot/dts/Makefile |   2 +-
> >  arch/arm64/boot/dts/juno.dts | 374 +++++++++++++++++++++++++++++++=
++++++++++++
> >  2 files changed, 375 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm64/boot/dts/juno.dts
> >
> > diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Mak=
efile
> > index f8001a6..0100eca 100644
> > --- a/arch/arm64/boot/dts/Makefile
> > +++ b/arch/arm64/boot/dts/Makefile
> > @@ -1,5 +1,5 @@
> >  dtb-$(CONFIG_ARCH_THUNDER) +=3D thunder-88xx.dtb
> > -dtb-$(CONFIG_ARCH_VEXPRESS) +=3D rtsm_ve-aemv8a.dtb foundation-v8.=
dtb
> > +dtb-$(CONFIG_ARCH_VEXPRESS) +=3D rtsm_ve-aemv8a.dtb foundation-v8.=
dtb juno.dtb
>=20
> We've applied the series that creates subdirectories per vendor, so
> this won't apply. Care to respin on top of our next/cleanup branch?

Sure, will do.

>=20
> >  dtb-$(CONFIG_ARCH_XGENE) +=3D apm-mustang.dtb
> >
> >  targets +=3D dtbs
> > diff --git a/arch/arm64/boot/dts/juno.dts b/arch/arm64/boot/dts/jun=
o.dts
> > new file mode 100644
> > index 0000000..7f998de
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/juno.dts
> > @@ -0,0 +1,374 @@
> > +/*
> > + * ARM Ltd. Juno Plaform
> > + *
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +/ {
> > +       model =3D "Juno";
>=20
> This could probably be a bit more descriptive.

I will add something to the tune: "ARM Juno development board (r0)" ? N=
ot sure
that the format usually is.

>=20
> > +       compatible =3D "arm,juno", "arm,vexpress";
> > +       interrupt-parent =3D <&gic>;
> > +       #address-cells =3D <2>;
> > +       #size-cells =3D <2>;
> > +
> > +       aliases {
> > +               serial0 =3D &soc_uart0;
> > +       };
> > +
> > +       cpus {
> > +               #address-cells =3D <2>;
> > +               #size-cells =3D <0>;
> > +
> > +               A53_0:cpu@100 {
> > +                       compatible =3D "arm,cortex-a53","arm,armv8"=
;
> > +                       reg =3D <0x0 0x100>;
> > +                       device_type =3D "cpu";
> > +                       enable-method =3D "psci";
> > +               };
> > +
> > +               A53_1:cpu@101 {
> > +                       compatible =3D "arm,cortex-a53","arm,armv8"=
;
> > +                       reg =3D <0x0 0x101>;
> > +                       device_type =3D "cpu";
> > +                       enable-method =3D "psci";
> > +               };
> > +
> > +               A53_2:cpu@102 {
> > +                       compatible =3D "arm,cortex-a53","arm,armv8"=
;
> > +                       reg =3D <0x0 0x102>;
> > +                       device_type =3D "cpu";
> > +                       enable-method =3D "psci";
> > +               };
> > +
> > +               A53_3:cpu@103 {
> > +                       compatible =3D "arm,cortex-a53","arm,armv8"=
;
> > +                       reg =3D <0x0 0x103>;
> > +                       device_type =3D "cpu";
> > +                       enable-method =3D "psci";
> > +               };
> > +
> > +               A57_0:cpu@0 {
> > +                       compatible =3D "arm,cortex-a57","arm,armv8"=
;
> > +                       reg =3D <0x0 0x0>;
> > +                       device_type =3D "cpu";
> > +                       enable-method =3D "psci";
> > +               };
> > +
> > +               A57_1:cpu@1 {
> > +                       compatible =3D "arm,cortex-a57","arm,armv8"=
;
> > +                       reg =3D <0x0 0x1>;
> > +                       device_type =3D "cpu";
> > +                       enable-method =3D "psci";
> > +               };
>=20
> These cpus are not ordered by reg, they probably should be (i.e. 57s
> before 53s).

That's because the A53s are the boot cluster. And yes, HW guys though i=
t
was fun to confuse people by making the little cluster second in line.

Is that a hard requirement to order by reg or can I keep the current
order? AFAIK (but I need to check tomorrow with the board) the boot
code gets confused if the first node is not the boot node.


>=20
> > +       };
> > +
> > +       memory@80000000 {
> > +               device_type =3D "memory";
> > +               /* last 16MB of the first memory area is reserved f=
or secure world use by firmware */
> > +               reg =3D <0x00000000 0x80000000 0x0 0x7f000000>,
> > +                     <0x00000008 0x80000000 0x1 0x80000000>;
> > +       };
> > +
> > +       gic: interrupt-controller@2c001000 {
> > +               compatible =3D "arm,gic-400", "arm,cortex-a15-gic";
> > +               reg =3D <0x0 0x2c010000 0 0x1000>,
> > +                     <0x0 0x2c02f000 0 0x2000>,
> > +                     <0x0 0x2c04f000 0 0x2000>,
> > +                     <0x0 0x2c06f000 0 0x2000>;
> > +               #address-cells =3D <0>;
> > +               #interrupt-cells =3D <3>;
> > +               interrupt-controller;
> > +               interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(6) |=
 IRQ_TYPE_LEVEL_HIGH)>;
> > +       };
> > +
> > +       timer {
> > +               compatible =3D "arm,armv8-timer";
> > +               interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) =
| IRQ_TYPE_EDGE_RISING)>,
> > +                            <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | =
IRQ_TYPE_EDGE_RISING)>,
> > +                            <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | =
IRQ_TYPE_EDGE_RISING)>,
> > +                            <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | =
IRQ_TYPE_EDGE_RISING)>;
> > +       };
> > +
> > +       pmu {
> > +               compatible =3D "arm,armv8-pmuv3";
> > +               interrupts =3D <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <GIC_SPI 02 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <GIC_SPI 06 IRQ_TYPE_LEVEL_HIGH>;
> > +       };
> > +
> > +       psci {
> > +               compatible =3D "arm,psci-0.2";
> > +               method =3D "smc";
> > +       };
>=20
> This dt is just a pile of nodes in a flat directory today. You're not
> the first to add psci at toplevel, but it'd be nice to do some sort o=
f
> structure for this at some point.

I agree and apologise for the linear dump. I know that there are other
platform coming but I don't have enough details on what parts are going
to end up being common and what not.

As for psci, should I create a small include file that contains just th=
e
psci node and include that?=20

>=20
> Same for the timer and pmu nodes, they should probably go somewhere
> else than the top.

OK, I will try to break this DT in pieces.

>=20
> > +
> > +       /* SoC fixed clocks */
> > +       soc_uartclk: refclk72738khz {
> > +               compatible =3D "fixed-clock";
> > +               #clock-cells =3D <0>;
> > +               clock-frequency =3D <7273800>;
> > +               clock-output-names =3D "juno:uartclk";
> > +       };
> > +
> > +       soc_usb48mhz: clk48mhz {
> > +               compatible =3D "fixed-clock";
> > +               #clock-cells =3D <0>;
> > +               clock-frequency =3D <48000000>;
> > +               clock-output-names =3D "clk48mhz";
> > +       };
> > +
> > +       soc_smc50mhz: clk50mhz {
> > +               compatible =3D "fixed-clock";
> > +               #clock-cells =3D <0>;
> > +               clock-frequency =3D <50000000>;
> > +               clock-output-names =3D "smc_clk";
> > +       };
> > +
> > +       soc_refclk100mhz: refclk100mhz {
> > +               compatible =3D "fixed-clock";
> > +               #clock-cells =3D <0>;
> > +               clock-frequency =3D <100000000>;
> > +               clock-output-names =3D "apb_pclk";
> > +       };
> > +
> > +       soc_faxiclk: refclk533mhz {
> > +               compatible =3D "fixed-clock";
> > +               #clock-cells =3D <0>;
> > +               clock-frequency =3D <533000000>;
> > +               clock-output-names =3D "faxi_clk";
> > +       };
> > +
> > +       mb_eth25mhz: clk25mhz {
> > +               compatible =3D "fixed-clock";
> > +               #clock-cells =3D <0>;
> > +               clock-frequency =3D <25000000>;
> > +               clock-output-names =3D "ethclk25mhz";
> > +       };
> > +
> > +       memory-controller@7ffd0000 {
> > +               compatible =3D "arm,pl354", "arm,primecell";
> > +               reg =3D <0 0x7ffd0000 0 0x1000>;
> > +               interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
> > +               clocks =3D <&soc_smc50mhz>;
> > +               clock-names =3D "apb_pclk";
> > +       };
> > +
> > +       dma0: dma@7ff00000 {
>=20
> We're trying to encourate DT contents to be sorted per unit address /
> reg, to cause fewer conflicts when new stuff is added. Care to reorde=
r
> the devices based on that?

Absolutely, sorry for the mistake.

>=20
>=20
> > +               compatible =3D "arm,pl330", "arm,primecell";
> > +               reg =3D <0x0 0x7ff00000 0 0x1000>;
> > +               #dma-cells =3D <1>;
> > +               #dma-channels =3D <8>;
> > +               #dma-requests =3D <32>;
> > +               interrupts =3D <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
> > +               clocks =3D <&soc_faxiclk>;
> > +               clock-names =3D "apb_pclk";
> > +       };
> > +
> > +       soc_uart0: uart@7ff80000 {
> > +               compatible =3D "arm,pl011", "arm,primecell";
> > +               reg =3D <0x0 0x7ff80000 0x0 0x1000>;
> > +               interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> > +               clocks =3D <&soc_uartclk>, <&soc_refclk100mhz>;
> > +               clock-names =3D "uartclk", "apb_pclk";
> > +       };
> > +
> > +       ulpi_phy: phy@0 {
> > +               compatible =3D "phy-ulpi-generic";
> > +               reg =3D <0x0 0x94 0x0 0x4>;
> > +               phy-id =3D <0>;
> > +       };
>=20
> phy@0? Hmm. Doesn't seem to belong in the same address space as
> everything else here.

And the bindings are not defined either. I wonder if I need to define
this at all after my patch to add the SMSC USB334x PHY ID. Will check
tomorrow when I have access to the board.

Thanks for reviewing this!

Best regards,
Liviu


>=20
>=20
> > +
> > +       ehci@7ffc0000 {
> > +               compatible =3D "generic-ehci";
> > +               reg =3D <0x0 0x7ffc0000 0x0 0x10000>;
> > +               interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> > +               clocks =3D <&soc_usb48mhz>;
> > +               phys =3D <&ulpi_phy>;
> > +               phy-names =3D "usb_ulpi";
> > +       };
> > +
> > +       ohci@7ffb0000 {
> > +               compatible =3D "generic-ohci";
> > +               reg =3D <0x0 0x7ffb0000 0x0 0x10000>;
> > +               interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> > +               clocks =3D <&soc_usb48mhz>;
> > +               phys =3D <&ulpi_phy>;
> > +               phy-names =3D "usb_ulpi";
> > +       };
> > +
> > +       i2c@7ffa0000 {
> > +               compatible =3D "snps,designware-i2c";
> > +               reg =3D <0x0 0x7ffa0000 0x0 0x1000>;
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <0>;
> > +               interrupts =3D <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> > +               clock-frequency =3D <400000>;
> > +               i2c-sda-hold-time-ns =3D <500>;
> > +               clocks =3D <&soc_smc50mhz>;
> > +
> > +               dvi0: dvi-transmitter@70 {
> > +                       compatible =3D "nxp,tda998x";
> > +                       reg =3D <0x70>;
> > +               };
> > +
> > +               dvi1: dvi-transmitter@71 {
> > +                       compatible =3D "nxp,tda998x";
> > +                       reg =3D <0x71>;
> > +               };
> > +       };
> > +
> > +       smb {
> > +               compatible =3D "simple-bus";
> > +               #address-cells =3D <2>;
> > +               #size-cells =3D <1>;
> > +               ranges =3D <0 0 0 0x08000000 0x04000000>,
> > +                        <1 0 0 0x14000000 0x04000000>,
> > +                        <2 0 0 0x18000000 0x04000000>,
> > +                        <3 0 0 0x1c000000 0x04000000>,
> > +                        <4 0 0 0x0c000000 0x04000000>,
> > +                        <5 0 0 0x10000000 0x04000000>;
> > +
> > +               #interrupt-cells =3D <1>;
> > +               interrupt-map-mask =3D <0 0 15>;
> > +               interrupt-map =3D <0 0  0 &gic 0  68 IRQ_TYPE_LEVEL=
_HIGH>,
> > +                               <0 0  1 &gic 0  69 IRQ_TYPE_LEVEL_H=
IGH>,
> > +                               <0 0  2 &gic 0  70 IRQ_TYPE_LEVEL_H=
IGH>,
> > +                               <0 0  3 &gic 0 160 IRQ_TYPE_LEVEL_H=
IGH>,
> > +                               <0 0  4 &gic 0 161 IRQ_TYPE_LEVEL_H=
IGH>,
> > +                               <0 0  5 &gic 0 162 IRQ_TYPE_LEVEL_H=
IGH>,
> > +                               <0 0  6 &gic 0 163 IRQ_TYPE_LEVEL_H=
IGH>,
> > +                               <0 0  7 &gic 0 164 IRQ_TYPE_LEVEL_H=
IGH>,
> > +                               <0 0  8 &gic 0 165 IRQ_TYPE_LEVEL_H=
IGH>,
> > +                               <0 0  9 &gic 0 166 IRQ_TYPE_LEVEL_H=
IGH>,
> > +                               <0 0 10 &gic 0 167 IRQ_TYPE_LEVEL_H=
IGH>,
> > +                               <0 0 11 &gic 0 168 IRQ_TYPE_LEVEL_H=
IGH>,
> > +                               <0 0 12 &gic 0 169 IRQ_TYPE_LEVEL_H=
IGH>;
> > +
> > +               mb_clk24mhz: clk24mhz {
> > +                       compatible =3D "fixed-clock";
> > +                       #clock-cells =3D <0>;
> > +                       clock-frequency =3D <24000000>;
> > +                       clock-output-names =3D "juno_mb:clk24mhz";
> > +               };
> > +
> > +               motherboard {
> > +                       compatible =3D "arm,vexpress,v2p-p1", "simp=
le-bus";
> > +                       #address-cells =3D <2>;  /* SMB chipselect =
number and offset */
> > +                       #size-cells =3D <1>;
> > +                       #interrupt-cells =3D <1>;
> > +                       ranges;
> > +                       model =3D "V2M-Juno";
> > +                       arm,hbi =3D <0x252>;
> > +                       arm,vexpress,site =3D <0>;
> > +                       arm,v2m-memory-map =3D "rs1";
> > +
> > +                       mb_fixed_3v3: fixedregulator@0 {
> > +                               compatible =3D "regulator-fixed";
> > +                               regulator-name =3D "MCC_SB_3V3";
> > +                               regulator-min-microvolt =3D <330000=
0>;
> > +                               regulator-max-microvolt =3D <330000=
0>;
> > +                               regulator-always-on;
> > +                       };
> > +
> > +                       ethernet@2,00000000 {
> > +                               compatible =3D "smsc,lan9118", "sms=
c,lan9115";
> > +                               reg =3D <2 0x00000000 0x10000>;
> > +                               interrupts =3D <3>;
> > +                               phy-mode =3D "mii";
> > +                               reg-io-width =3D <4>;
> > +                               smsc,irq-active-high;
> > +                               smsc,irq-push-pull;
> > +                               clocks =3D <&mb_eth25mhz>;
> > +                               vdd33a-supply =3D <&mb_fixed_3v3>;
> > +                               vddvario-supply =3D <&mb_fixed_3v3>=
;
> > +                       };
> > +
> > +                       usb@5,00000000 {
> > +                               compatible =3D "nxp,usb-isp1763";
> > +                               reg =3D <5 0x00000000 0x20000>;
> > +                               bus-width =3D <16>;
> > +                               interrupts =3D <4>;
> > +                       };
> > +
> > +                       iofpga@3,00000000 {
> > +                               compatible =3D "arm,amba-bus", "sim=
ple-bus";
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <1>;
> > +                               ranges =3D <0 3 0 0x200000>;
> > +
> > +                               mmci@050000 {
> > +                                       compatible =3D "arm,pl180",=
 "arm,primecell";
> > +                                       reg =3D <0x050000 0x1000>;
> > +                                       interrupts =3D <5>;
> > +                                       /* cd-gpios =3D <&v2m_mmc_g=
pios 0 0>;
> > +                                       wp-gpios =3D <&v2m_mmc_gpio=
s 1 0>; */
> > +                                       max-frequency =3D <12000000=
>;
> > +                                       vmmc-supply =3D <&mb_fixed_=
3v3>;
> > +                                       clocks =3D <&mb_clk24mhz>, =
<&soc_smc50mhz>;
> > +                                       clock-names =3D "mclk", "ap=
b_pclk";
> > +                               };
> > +
> > +                               kmi@060000 {
> > +                                       compatible =3D "arm,pl050",=
 "arm,primecell";
> > +                                       reg =3D <0x060000 0x1000>;
> > +                                       interrupts =3D <8>;
> > +                                       clocks =3D <&mb_clk24mhz>, =
<&soc_smc50mhz>;
> > +                                       clock-names =3D "KMIREFCLK"=
, "apb_pclk";
> > +                               };
> > +
> > +                               kmi@070000 {
> > +                                       compatible =3D "arm,pl050",=
 "arm,primecell";
> > +                                       reg =3D <0x070000 0x1000>;
> > +                                       interrupts =3D <8>;
> > +                                       clocks =3D <&mb_clk24mhz>, =
<&soc_smc50mhz>;
> > +                                       clock-names =3D "KMIREFCLK"=
, "apb_pclk";
> > +                               };
> > +
> > +                               wdt@0f0000 {
> > +                                       compatible =3D "arm,sp805",=
 "arm,primecell";
> > +                                       reg =3D <0x0f0000 0x10000>;
> > +                                       interrupts =3D <7>;
> > +                                       clocks =3D <&mb_clk24mhz>, =
<&soc_smc50mhz>;
> > +                                       clock-names =3D "wdogclk", =
"apb_pclk";
> > +                               };
> > +
> > +                               v2m_timer01: timer@110000 {
> > +                                       compatible =3D "arm,sp804",=
 "arm,primecell";
> > +                                       reg =3D <0x110000 0x10000>;
> > +                                       interrupts =3D <9>;
> > +                                       clocks =3D <&mb_clk24mhz>, =
<&soc_smc50mhz>;
> > +                                       clock-names =3D "timclken1"=
, "apb_pclk";
> > +                               };
> > +
> > +                               v2m_timer23: timer@120000 {
> > +                                       compatible =3D "arm,sp804",=
 "arm,primecell";
> > +                                       reg =3D <0x120000 0x10000>;
> > +                                       interrupts =3D <9>;
> > +                                       clocks =3D <&mb_clk24mhz>, =
<&soc_smc50mhz>;
> > +                                       clock-names =3D "timclken1"=
, "apb_pclk";
> > +                               };
> > +
> > +                               rtc@170000 {
> > +                                       compatible =3D "arm,pl031",=
 "arm,primecell";
> > +                                       reg =3D <0x170000 0x10000>;
> > +                                       interrupts =3D <0>;
> > +                                       clocks =3D <&soc_smc50mhz>;
> > +                                       clock-names =3D "apb_pclk";
> > +                               };
> > +                       };
> > +               };
> > +       };
> > +};
> > --
> > 2.1.3
> >
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
