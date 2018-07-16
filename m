Return-Path: <SRS0=5CrG=KA=gmail.com=tmaimon77@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180716174803.GA1757@rob-hp-laptop>
References: <20180712214203.114844-1-tmaimon77@gmail.com> <20180712214203.114844-2-tmaimon77@gmail.com>
 <20180716174803.GA1757@rob-hp-laptop>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 16 Jul 2018 21:25:37 +0300
Message-ID: <CAP6Zq1h6df54+cnyBf-kfgwyuLiF2L5LQsRfpcGuk6okn7t+yQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-binding: pinctrl: Add NPCM7xx pinctrl and GPIO documentation
Content-Type: multipart/alternative; boundary="000000000000c130b4057121f416"
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linus.walleij@linaro.org, Avi Fishman <avifishman70@gmail.com>, Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>, Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
List-ID: <devicetree@vger.kernel.org>

--000000000000c130b4057121f416
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On 16 July 2018 at 20:48, Rob Herring <robh@kernel.org> wrote:

> On Fri, Jul 13, 2018 at 12:42:02AM +0300, Tomer Maimon wrote:
> > Added device tree binding documentation for Nuvoton BMC
> > NPCM750/730/715/705 pinmux and GPIO controller.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt   | 216
> +++++++++++++++++++++
> >  1 file changed, 216 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,
> npcm7xx-pinctrl.txt
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt
> b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt
> > new file mode 100644
> > index 000000000000..83f4bbac94bb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,
> npcm7xx-pinctrl.txt
> > @@ -0,0 +1,216 @@
> > +Nuvoton NPCM7XX Pin Controllers
> > +
> > +The Nuvoton BMC NPCM7XX Pin Controller multi-function routed through
> > +the multiplexing block, Each pin supports GPIO functionality (GPIOx)
> > +and multiple functions that directly connect the pin to different
> > +hardware blocks.
> > +
> > +Required properties:
> > +- #address-cells : should be 1.
> > +- #size-cells         : should be 1.
> > +- compatible  : "nuvoton,npcm750-pinctrl" for Poleg NPCM7XX.
> > +- ranges      : defines mapping ranges between pin controller node
> (parent)
> > +                     to GPIO bank node (children).
> > +
> > +=== GPIO Bank Subnode ===
> > +
> > +The NPCM7XX has 8 GPIO Banks each GPIO bank supports 32 GPIO.
> > +
> > +Required GPIO Bank subnode-properties:
> > +- reg                        : specifies physical base address and size
> of the GPIO
> > +                             bank registers.
> > +- gpio-controller    : Marks the device node as a GPIO controller.
> > +- #gpio-cells                : Must be <2>. The first cell is the gpio
> pin number
> > +                             and the second cell is used for optional
> parameters.
> > +- interrupts         : contain the GPIO bank interrupt with flags for
> falling edge.
> > +- gpio-ranges                : defines the range of pins managed by the
> GPIO bank controller.
> > +
> > +For example, GPIO bank subnodes like the following:
> > +     gpio0: gpio@f0010000 {
> > +             gpio-controller;
> > +             #gpio-cells = <2>;
> > +             reg = <0x0 0x80>;
> > +             interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> > +             gpio-ranges = <&pinctrl 0 0 32>;
> > +     };
> > +
> > +=== Pin Mux Subnode ===
> > +
> > +- pin: A string containing the name of the pin
> > +     An array of strings, each string containing the name of a pin.
> > +     These pin are used for selecting pin configuration.
> > +
> > +The following are the list of pins available:
> > +     "GPIO0/IOX1DI", "GPIO1/IOX1LD", "GPIO2/IOX1CK", "GPIO3/IOX1D0",
> > +     "GPIO4/IOX2DI/SMB1DSDA", "GPIO5/IOX2LD/SMB1DSCL",
> "GPIO6/IOX2CK/SMB2DSDA",
> > +     "GPIO7/IOX2D0/SMB2DSCL", "GPIO8/LKGPO1", "GPIO9/LKGPO2",
> "GPIO10/IOXHLD",
> > +     "GPIO11/IOXHCK", "GPIO12/GSPICK/SMB5BSCL",
> "GPIO13/GSPIDO/SMB5BSDA",
> > +     "GPIO14/GSPIDI/SMB5CSCL", "GPIO15/GSPICS/SMB5CSDA",
> "GPIO16/LKGPO0",
> > +     "GPIO17/PSPI2DI/SMB4DEN","GPIO18/PSPI2D0/SMB4BSDA",
> "GPIO19/PSPI2CK/SMB4BSCL",
> > +     "GPIO20/SMB4CSDA/SMB15SDA", "GPIO21/SMB4CSCL/SMB15SCL",
> "GPIO22/SMB4DSDA/SMB14SDA",
> > +     "GPIO23/SMB4DSCL/SMB14SCL", "GPIO24/IOXHDO", "GPIO25/IOXHDI",
> "GPIO26/SMB5SDA",
> > +     "GPIO27/SMB5SCL", "GPIO28/SMB4SDA", "GPIO29/SMB4SCL",
> "GPIO30/SMB3SDA",
> > +     "GPIO31/SMB3SCL", "GPIO32/nSPI0CS1","SPI0D2", "SPI0D3",
> "GPIO37/SMB3CSDA",
> > +     "GPIO38/SMB3CSCL", "GPIO39/SMB3BSDA", "GPIO40/SMB3BSCL",
> "GPIO41/BSPRXD",
> > +     "GPO42/BSPTXD/STRAP11", "GPIO43/RXD1/JTMS2/BU1RXD",
> "GPIO44/nCTS1/JTDI2/BU1CTS",
> > +     "GPIO45/nDCD1/JTDO2", "GPIO46/nDSR1/JTCK2", "GPIO47/nRI1/JCP_RDY2",
> > +     "GPIO48/TXD2/BSPTXD", "GPIO49/RXD2/BSPRXD", "GPIO50/nCTS2",
> "GPO51/nRTS2/STRAP2",
> > +     "GPIO52/nDCD2", "GPO53/nDTR2_BOUT2/STRAP1", "GPIO54/nDSR2",
> "GPIO55/nRI2",
> > +     "GPIO56/R1RXERR", "GPIO57/R1MDC", "GPIO58/R1MDIO",
> "GPIO59/SMB3DSDA",
> > +     "GPIO60/SMB3DSCL", "GPO61/nDTR1_BOUT1/STRAP6",
> "GPO62/nRTST1/STRAP5",
> > +     "GPO63/TXD1/STRAP4", "GPIO64/FANIN0", "GPIO65/FANIN1",
> "GPIO66/FANIN2",
> > +     "GPIO67/FANIN3", "GPIO68/FANIN4", "GPIO69/FANIN5",
> "GPIO70/FANIN6", "GPIO71/FANIN7",
> > +     "GPIO72/FANIN8", "GPIO73/FANIN9", "GPIO74/FANIN10",
> "GPIO75/FANIN11",
> > +     "GPIO76/FANIN12", "GPIO77/FANIN13","GPIO78/FANIN14",
> "GPIO79/FANIN15",
> > +     "GPIO80/PWM0", "GPIO81/PWM1", "GPIO82/PWM2", "GPIO83/PWM3",
> "GPIO84/R2TXD0",
> > +     "GPIO85/R2TXD1", "GPIO86/R2TXEN", "GPIO87/R2RXD0",
> "GPIO88/R2RXD1", "GPIO89/R2CRSDV",
> > +     "GPIO90/R2RXERR", "GPIO91/R2MDC", "GPIO92/R2MDIO",
> "GPIO93/GA20/SMB5DSCL",
> > +     "GPIO94/nKBRST/SMB5DSDA", "GPIO95/nLRESET/nESPIRST",
> "GPIO96/RG1TXD0",
> > +     "GPIO97/RG1TXD1", "GPIO98/RG1TXD2", "GPIO99/RG1TXD3","GPIO100/
> RG1TXC",
> > +     "GPIO101/RG1TXCTL", "GPIO102/RG1RXD0", "GPIO103/RG1RXD1",
> "GPIO104/RG1RXD2",
> > +     "GPIO105/RG1RXD3", "GPIO106/RG1RXC", "GPIO107/RG1RXCTL",
> "GPIO108/RG1MDC",
> > +     "GPIO109/RG1MDIO", "GPIO110/RG2TXD0/DDRV0",
> "GPIO111/RG2TXD1/DDRV1",
> > +     "GPIO112/RG2TXD2/DDRV2", "GPIO113/RG2TXD3/DDRV3",
> "GPIO114/SMB0SCL",
> > +     "GPIO115/SMB0SDA", "GPIO116/SMB1SCL", "GPIO117/SMB1SDA",
> "GPIO118/SMB2SCL",
> > +     "GPIO119/SMB2SDA", "GPIO120/SMB2CSDA", "GPIO121/SMB2CSCL",
> "GPIO122/SMB2BSDA",
> > +     "GPIO123/SMB2BSCL", "GPIO124/SMB1CSDA",
> "GPIO125/SMB1CSCL","GPIO126/SMB1BSDA",
> > +     "GPIO127/SMB1BSCL", "GPIO128/SMB8SCL", "GPIO129/SMB8SDA",
> "GPIO130/SMB9SCL",
> > +     "GPIO131/SMB9SDA", "GPIO132/SMB10SCL", "GPIO133/SMB10SDA","GPIO134/
> SMB11SCL",
> > +     "GPIO135/SMB11SDA", "GPIO136/SD1DT0", "GPIO137/SD1DT1",
> "GPIO138/SD1DT2",
> > +     "GPIO139/SD1DT3", "GPIO140/SD1CLK", "GPIO141/SD1WP",
> "GPIO142/SD1CMD",
> > +     "GPIO143/SD1CD/SD1PWR", "GPIO144/PWM4", "GPIO145/PWM5",
> "GPIO146/PWM6",
> > +     "GPIO147/PWM7", "GPIO148/MMCDT4", "GPIO149/MMCDT5",
> "GPIO150/MMCDT6",
> > +     "GPIO151/MMCDT7", "GPIO152/MMCCLK", "GPIO153/MMCWP",
> "GPIO154/MMCCMD",
> > +     "GPIO155/nMMCCD/nMMCRST", "GPIO156/MMCDT0", "GPIO157/MMCDT1",
> "GPIO158/MMCDT2",
> > +     "GPIO159/MMCDT3", "GPIO160/CLKOUT/RNGOSCOUT",
> "GPIO161/nLFRAME/nESPICS",
> > +     "GPIO162/SERIRQ", "GPIO163/LCLK/ESPICLK", "GPIO164/LAD0/ESPI_IO0",
> > +     "GPIO165/LAD1/ESPI_IO1", "GPIO166/LAD2/ESPI_IO2",
> "GPIO167/LAD3/ESPI_IO3",
> > +     "GPIO168/nCLKRUN/nESPIALERT", "GPIO169/nSCIPME", "GPIO170/nSMI",
> "GPIO171/SMB6SCL",
> > +     "GPIO172/SMB6SDA", "GPIO173/SMB7SCL", "GPIO174/SMB7SDA",
> "GPIO175/PSPI1CK/FANIN19",
> > +     "GPIO176/PSPI1DO/FANIN18", "GPIO177/PSPI1DI/FANIN17",
> "GPIO178/R1TXD0",
> > +     "GPIO179/R1TXD1", "GPIO180/R1TXEN", "GPIO181/R1RXD0",
> "GPIO182/R1RXD1",
> > +     "GPIO183/SPI3CK", "GPO184/SPI3D0/STRAP9", "GPO185/SPI3D1/STRAP10",
> > +     "GPIO186/nSPI3CS0", "GPIO187/nSPI3CS1", "GPIO188/SPI3D2/nSPI3CS2",
> > +     "GPIO189/SPI3D3/nSPI3CS3", "GPIO190/nPRD_SMI", "GPIO191",
> "GPIO192", "GPIO193/R1CRSDV",
> > +     "GPIO194/SMB0BSCL", "GPIO195/SMB0BSDA", "GPIO196/SMB0CSCL",
> "GPIO197/SMB0DEN",
> > +     "GPIO198/SMB0DSDA", "GPIO199/SMB0DSCL", "GPIO200/R2CK",
> "GPIO201/R1CK",
> > +     "GPIO202/SMB0CSDA", "GPIO203/FANIN16", "GPIO204/DDC2SCL",
> "GPIO205/DDC2SDA",
> > +     "GPIO206/HSYNC2", "GPIO207/VSYNC2", "GPIO208/RG2TXC/DVCK",
> "GPIO209/RG2TXCTL/DDRV4",
> > +     "GPIO210/RG2RXD0/DDRV5", "GPIO211/RG2RXD1/DDRV6",
> "GPIO212/RG2RXD2/DDRV7",
> > +     "GPIO213/RG2RXD3/DDRV8", "GPIO214/RG2RXC/DDRV9",
> "GPIO215/RG2RXCTL/DDRV10",
> > +     "GPIO216/RG2MDC/DDRV11", "GPIO217/RG2MDIO/DVHSYNC",
> "GPIO218/nWDO1",
> > +     "GPIO219/nWDO2", "GPIO220/SMB12SCL", "GPIO221/SMB12SDA",
> "GPIO222/SMB13SCL",
> > +     "GPIO223/SMB13SDA", "GPIO224/SPIXCK", "GPO225/SPIXD0/STRAP12",
> "GPO226/SPIXD1/STRAP13",
> > +     "GPIO227/nSPIXCS0", "GPIO228/nSPIXCS1", "GPO229/SPIXD2/STRAP3",
> "GPIO230/SPIXD3",
> > +     "GPIO231/nCLKREQ", "GPI255/DACOSEL"
> > +
> > +Optional Properties:
> > + bias-disable, bias-pull-down, bias-pull-up, input-enable,
> > + input-disable, output-high, output-low, drive-push-pull,
> > + drive-open-drain, input-debounce, slew-rate, drive-strength
> > +
> > + slew-rate valid arguments are:
> > +                             <0> - slow
> > +                             <1> - fast
> > + drive-strength valid arguments are:
> > +                             <2> - 2mA
> > +                             <4> - 4mA
> > +                             <8> - 8mA
> > +                             <12> - 12mA
> > +                             <16> - 16mA
> > +                             <24> - 24mA
> > +
> > +For example, pinctrl might have pinmux subnodes like the following:
> > +
> > +     gpio0_iox1d1_pin: gpio0-iox1d1-pin {
> > +             pins = "GPIO0/IOX1DI";
> > +             output-high;
> > +     };
> > +     gpio0_iox1ck_pin: gpio0-iox1ck-pin {
> > +             pins = "GPIO2/IOX1CK";
> > +             output_high;
> > +     };
> > +
> > +=== Pin Group Subnode ===
> > +
> > +Required pin group subnode-properties:
> > +- groups : A string containing the name of the group to mux.
> > +- function: A string containing the name of the function to mux to the
> > +  group.
> > +
> > +The following are the list of the available groups and functions :
> > +     smb0, smb0b, smb0c, smb0d, smb0den, smb1, smb1b, smb1c, smb1d,
> > +     smb2, smb2b, smb2c, smb2d, smb3, smb3b, smb3c, smb3d, smb4, smb4b,
> > +     smb4c, smb4d, smb4den, smb5, smb5b, smb5c, smb5d, ga20kbc, smb6,
> > +     smb7, smb8, smb9, smb10, smb11, smb12, smb13, smb14, smb15, fanin0,
> > +     fanin1, fanin2, fanin3, fanin4, fanin5, fanin6, fanin7, fanin8,
> > +     fanin9, fanin10, fanin11 fanin12 fanin13, fanin14, fanin15, faninx,
> > +     pwm0, pwm1, pwm2, pwm3, pwm4, pwm5, pwm6, pwm7, rg1, rg1mdio, rg2,
> > +     rg2mdio, ddr, uart1, uart2, bmcuart0a, bmcuart0b, bmcuart1, iox1,
> > +     iox2, ioxh, gspi, mmc, mmcwp, mmccd, mmcrst, mmc8, r1, r1err, r1md,
> > +     r2, r2err, r2md, sd1, sd1pwr, wdog1, wdog2, scipme, sci, serirq,
> > +     jtag2, spix, spixcs1, pspi1, pspi2, ddc, clkreq, clkout, spi3,
> spi3cs1,
> > +     spi3quad, spi3cs2, spi3cs3, spi0cs1, lpc, lpcclk, espi, lkgpo0,
> lkgpo1,
> > +     lkgpo2, nprd_smi
> > +
> > +For example, pinctrl might have group subnodes like the following:
> > +     r1err_pins: r1err-pins {
> > +             groups = "r1err";
> > +             function = "r1err";
> > +     };
> > +     r1md_pins: r1md-pins {
> > +             groups = "r1md";
> > +             function = "r1md";
> > +     };
> > +     r1_pins: r1-pins {
> > +             groups = "r1";
> > +             function = "r1";
> > +     };
> > +
> > +Examples
> > +========
> > +pinctrl: pinctrl@f0800000 {
>
> reg is missing or this doesn't match ranges.
>

the Control of the Pinmux is through the GCR (General control register),
and because the GCR controlling also on other things
in the BMC we have a separate node for the GCR and it handled by regmap.
GCR node in our device tree:

                gcr: gcr@800000 {

                        compatible = "nuvoton,npcm750-gcr", "syscon",
                                "simple-mfd";
                        reg = <0x800000 0x1000>;
                };

The address of the GCR is f0800000 this is why the pinctrl name pinctrl@f0800000
please let me know if it is better to modify it to the GPIO address.

the ranges is address GPIO ranges


> > +     #address-cells = <1>;
> > +     #size-cells = <1>;
> > +     compatible = "nuvoton,npcm750-pinctrl";
> > +     ranges = <0 0xf0010000 0x8000>;
> > +
> > +     gpio0: gpio@f0010000 {
> > +             gpio-controller;
> > +             #gpio-cells = <2>;
> > +             reg = <0x0 0x80>;
> > +             interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> > +             gpio-ranges = <&pinctrl 0 0 32>;
> > +     };
> > +
> > +     ....
> > +
> > +     gpio7: gpio@f0017000 {
> > +             gpio-controller;
> > +             #gpio-cells = <2>;
> > +             reg = <0x7000 0x80>;
> > +             interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> > +             gpio-ranges = <&pinctrl 0 224 32>;
> > +     };
> > +
> > +     gpio0_iox1d1_pin: gpio0-iox1d1-pin {
> > +             pins = "GPIO0/IOX1DI";
> > +             output-high;
> > +     };
> > +
> > +     iox1_pins: iox1-pins {
> > +             groups = "iox1";
> > +             function = "iox1";
> > +     };
> > +     iox2_pins: iox2-pins {
> > +             groups = "iox2";
> > +             function = "iox2";
> > +     };
> > +
> > +     ....
> > +
> > +     clkreq_pins: clkreq-pins {
> > +             groups = "clkreq";
> > +             function = "clkreq";
> > +     };
> > +};
> > \ No newline at end of file
>
> ^^^
>

Thanks,

Tomer

--000000000000c130b4057121f416
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Rob,<br><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On 16 July 2018 at 20:48, Rob Herring <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:robh@kernel.org" target=3D"_blank">robh@kernel.org</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div cl=
ass=3D"h5">On Fri, Jul 13, 2018 at 12:42:02AM +0300, Tomer Maimon wrote:<br=
>
&gt; Added device tree binding documentation for Nuvoton BMC<br>
&gt; NPCM750/730/715/705 pinmux and GPIO controller.<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
>tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../bindings/pinctrl/nuvoton,<wbr>npcm7xx-pinctrl.txt=C2=A0 =C2=
=A0| 216 +++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 216 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/<wbr>bindings/pinctr=
l/nuvoton,<wbr>npcm7xx-pinctrl.txt<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/<wbr>bindings/pinctrl/nuvoton,<w=
br>npcm7xx-pinctrl.txt b/Documentation/devicetree/<wbr>bindings/pinctrl/nuv=
oton,<wbr>npcm7xx-pinctrl.txt<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..83f4bbac94bb<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/<wbr>bindings/pinctrl/nuvoton,<wbr>npcm=
7xx-pinctrl.txt<br>
&gt; @@ -0,0 +1,216 @@<br>
&gt; +Nuvoton NPCM7XX Pin Controllers<br>
&gt; +<br>
&gt; +The Nuvoton BMC NPCM7XX Pin Controller multi-function routed through<=
br>
&gt; +the multiplexing block, Each pin supports GPIO functionality (GPIOx)<=
br>
&gt; +and multiple functions that directly connect the pin to different<br>
&gt; +hardware blocks.<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; +- #address-cells : should be 1.<br>
&gt; +- #size-cells=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: should be 1.<br>
&gt; +- compatible=C2=A0 : &quot;nuvoton,npcm750-pinctrl&quot; for Poleg NP=
CM7XX.<br>
&gt; +- ranges=C2=A0 =C2=A0 =C2=A0 : defines mapping ranges between pin con=
troller node (parent)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0to GPIO bank node (children).<br>
&gt; +<br>
&gt; +=3D=3D=3D GPIO Bank Subnode =3D=3D=3D<br>
&gt; +<br>
&gt; +The NPCM7XX has 8 GPIO Banks each GPIO bank supports 32 GPIO.<br>
&gt; +<br>
&gt; +Required GPIO Bank subnode-properties:<br>
&gt; +- reg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 : specifies physical base address and size of the GPIO=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bank registers.<br>
&gt; +- gpio-controller=C2=A0 =C2=A0 : Marks the device node as a GPIO cont=
roller.<br>
&gt; +- #gpio-cells=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
: Must be &lt;2&gt;. The first cell is the gpio pin number<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and the second cell is used for optional=
 parameters.<br>
&gt; +- interrupts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: contain the GPIO bank=
 interrupt with flags for falling edge.<br>
&gt; +- gpio-ranges=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
: defines the range of pins managed by the GPIO bank controller.<br>
&gt; +<br>
&gt; +For example, GPIO bank subnodes like the following:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpio0: gpio@f0010000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio-controller;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#gpio-cells =3D &lt;2=
&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0 0x80&=
gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =3D &lt;GI=
C_SPI 116 IRQ_TYPE_LEVEL_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio-ranges =3D &lt;&=
amp;pinctrl 0 0 32&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=3D=3D=3D Pin Mux Subnode =3D=3D=3D<br>
&gt; +<br>
&gt; +- pin: A string containing the name of the pin<br>
&gt; +=C2=A0 =C2=A0 =C2=A0An array of strings, each string containing the n=
ame of a pin.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0These pin are used for selecting pin configuratio=
n.<br>
&gt; +<br>
&gt; +The following are the list of pins available:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO0/IOX1DI&quot;, &quot;GPIO1/IOX1LD&quot=
;, &quot;GPIO2/IOX1CK&quot;, &quot;GPIO3/IOX1D0&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO4/IOX2DI/SMB1DSDA&quot;, &quot;GPIO5/IO=
X2LD/SMB1DSCL&quot;, &quot;GPIO6/IOX2CK/SMB2DSDA&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO7/IOX2D0/SMB2DSCL&quot;, &quot;GPIO8/LK=
GPO1&quot;, &quot;GPIO9/LKGPO2&quot;, &quot;GPIO10/IOXHLD&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO11/IOXHCK&quot;, &quot;GPIO12/GSPICK/SM=
B5BSCL&quot;, &quot;GPIO13/GSPIDO/SMB5BSDA&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO14/GSPIDI/SMB5CSCL&quot;, &quot;GPIO15/=
GSPICS/SMB5CSDA&quot;, &quot;GPIO16/LKGPO0&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO17/PSPI2DI/SMB4DEN&quot;,&quot;<wbr>GPI=
O18/PSPI2D0/SMB4BSDA&quot;, &quot;GPIO19/PSPI2CK/SMB4BSCL&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO20/SMB4CSDA/SMB15SDA&quot;, &quot;GPIO2=
1/SMB4CSCL/SMB15SCL&quot;, &quot;GPIO22/SMB4DSDA/SMB14SDA&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO23/SMB4DSCL/SMB14SCL&quot;, &quot;GPIO2=
4/IOXHDO&quot;, &quot;GPIO25/IOXHDI&quot;, &quot;GPIO26/SMB5SDA&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO27/SMB5SCL&quot;, &quot;GPIO28/SMB4SDA&=
quot;, &quot;GPIO29/SMB4SCL&quot;, &quot;GPIO30/SMB3SDA&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO31/SMB3SCL&quot;, &quot;GPIO32/nSPI0CS1=
&quot;,&quot;SPI0D2&quot;, &quot;SPI0D3&quot;, &quot;GPIO37/SMB3CSDA&quot;,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO38/SMB3CSCL&quot;, &quot;GPIO39/SMB3BSD=
A&quot;, &quot;GPIO40/SMB3BSCL&quot;, &quot;GPIO41/BSPRXD&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPO42/BSPTXD/STRAP11&quot;, &quot;GPIO43/RX=
D1/JTMS2/BU1RXD&quot;, &quot;GPIO44/nCTS1/JTDI2/BU1CTS&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO45/nDCD1/JTDO2&quot;, &quot;GPIO46/nDSR=
1/JTCK2&quot;, &quot;GPIO47/nRI1/JCP_RDY2&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO48/TXD2/BSPTXD&quot;, &quot;GPIO49/RXD2=
/BSPRXD&quot;, &quot;GPIO50/nCTS2&quot;, &quot;GPO51/nRTS2/STRAP2&quot;,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO52/nDCD2&quot;, &quot;GPO53/nDTR2_BOUT2=
/STRAP1&quot;, &quot;GPIO54/nDSR2&quot;, &quot;GPIO55/nRI2&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO56/R1RXERR&quot;, &quot;GPIO57/R1MDC&qu=
ot;, &quot;GPIO58/R1MDIO&quot;, &quot;GPIO59/SMB3DSDA&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO60/SMB3DSCL&quot;, &quot;GPO61/nDTR1_BO=
UT1/STRAP6&quot;, &quot;GPO62/nRTST1/STRAP5&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPO63/TXD1/STRAP4&quot;, &quot;GPIO64/FANIN=
0&quot;, &quot;GPIO65/FANIN1&quot;, &quot;GPIO66/FANIN2&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO67/FANIN3&quot;, &quot;GPIO68/FANIN4&qu=
ot;, &quot;GPIO69/FANIN5&quot;, &quot;GPIO70/FANIN6&quot;, &quot;GPIO71/FAN=
IN7&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO72/FANIN8&quot;, &quot;GPIO73/FANIN9&qu=
ot;, &quot;GPIO74/FANIN10&quot;, &quot;GPIO75/FANIN11&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO76/FANIN12&quot;, &quot;GPIO77/FANIN13&=
quot;,&quot;GPIO78/<wbr>FANIN14&quot;, &quot;GPIO79/FANIN15&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO80/PWM0&quot;, &quot;GPIO81/PWM1&quot;,=
 &quot;GPIO82/PWM2&quot;, &quot;GPIO83/PWM3&quot;, &quot;GPIO84/R2TXD0&quot=
;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO85/R2TXD1&quot;, &quot;GPIO86/R2TXEN&qu=
ot;, &quot;GPIO87/R2RXD0&quot;, &quot;GPIO88/R2RXD1&quot;, &quot;GPIO89/R2C=
RSDV&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO90/R2RXERR&quot;, &quot;GPIO91/R2MDC&qu=
ot;, &quot;GPIO92/R2MDIO&quot;, &quot;GPIO93/GA20/SMB5DSCL&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO94/nKBRST/SMB5DSDA&quot;, &quot;GPIO95/=
nLRESET/nESPIRST&quot;, &quot;GPIO96/RG1TXD0&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO97/RG1TXD1&quot;, &quot;GPIO98/RG1TXD2&=
quot;, &quot;GPIO99/RG1TXD3&quot;,&quot;GPIO100/<wbr>RG1TXC&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO101/RG1TXCTL&quot;, &quot;GPIO102/RG1RX=
D0&quot;, &quot;GPIO103/RG1RXD1&quot;, &quot;GPIO104/RG1RXD2&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO105/RG1RXD3&quot;, &quot;GPIO106/RG1RXC=
&quot;, &quot;GPIO107/RG1RXCTL&quot;, &quot;GPIO108/RG1MDC&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO109/RG1MDIO&quot;, &quot;GPIO110/RG2TXD=
0/DDRV0&quot;, &quot;GPIO111/RG2TXD1/DDRV1&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO112/RG2TXD2/DDRV2&quot;, &quot;GPIO113/=
RG2TXD3/DDRV3&quot;, &quot;GPIO114/SMB0SCL&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO115/SMB0SDA&quot;, &quot;GPIO116/SMB1SC=
L&quot;, &quot;GPIO117/SMB1SDA&quot;, &quot;GPIO118/SMB2SCL&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO119/SMB2SDA&quot;, &quot;GPIO120/SMB2CS=
DA&quot;, &quot;GPIO121/SMB2CSCL&quot;, &quot;GPIO122/SMB2BSDA&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO123/SMB2BSCL&quot;, &quot;GPIO124/SMB1C=
SDA&quot;, &quot;GPIO125/SMB1CSCL&quot;,&quot;GPIO126/<wbr>SMB1BSDA&quot;,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO127/SMB1BSCL&quot;, &quot;GPIO128/SMB8S=
CL&quot;, &quot;GPIO129/SMB8SDA&quot;, &quot;GPIO130/SMB9SCL&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO131/SMB9SDA&quot;, &quot;GPIO132/SMB10S=
CL&quot;, &quot;GPIO133/SMB10SDA&quot;,&quot;GPIO134/<wbr>SMB11SCL&quot;,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO135/SMB11SDA&quot;, &quot;GPIO136/SD1DT=
0&quot;, &quot;GPIO137/SD1DT1&quot;, &quot;GPIO138/SD1DT2&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO139/SD1DT3&quot;, &quot;GPIO140/SD1CLK&=
quot;, &quot;GPIO141/SD1WP&quot;, &quot;GPIO142/SD1CMD&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO143/SD1CD/SD1PWR&quot;, &quot;GPIO144/P=
WM4&quot;, &quot;GPIO145/PWM5&quot;, &quot;GPIO146/PWM6&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO147/PWM7&quot;, &quot;GPIO148/MMCDT4&qu=
ot;, &quot;GPIO149/MMCDT5&quot;, &quot;GPIO150/MMCDT6&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO151/MMCDT7&quot;, &quot;GPIO152/MMCCLK&=
quot;, &quot;GPIO153/MMCWP&quot;, &quot;GPIO154/MMCCMD&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO155/nMMCCD/nMMCRST&quot;, &quot;GPIO156=
/MMCDT0&quot;, &quot;GPIO157/MMCDT1&quot;, &quot;GPIO158/MMCDT2&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO159/MMCDT3&quot;, &quot;GPIO160/CLKOUT/=
RNGOSCOUT&quot;, &quot;GPIO161/nLFRAME/nESPICS&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO162/SERIRQ&quot;, &quot;GPIO163/LCLK/ES=
PICLK&quot;, &quot;GPIO164/LAD0/ESPI_IO0&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO165/LAD1/ESPI_IO1&quot;, &quot;GPIO166/=
LAD2/ESPI_IO2&quot;, &quot;GPIO167/LAD3/ESPI_IO3&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO168/nCLKRUN/nESPIALERT&quot;, &quot;GPI=
O169/nSCIPME&quot;, &quot;GPIO170/nSMI&quot;, &quot;GPIO171/SMB6SCL&quot;,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO172/SMB6SDA&quot;, &quot;GPIO173/SMB7SC=
L&quot;, &quot;GPIO174/SMB7SDA&quot;, &quot;GPIO175/PSPI1CK/FANIN19&quot;,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO176/PSPI1DO/FANIN18&quot;, &quot;GPIO17=
7/PSPI1DI/FANIN17&quot;, &quot;GPIO178/R1TXD0&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO179/R1TXD1&quot;, &quot;GPIO180/R1TXEN&=
quot;, &quot;GPIO181/R1RXD0&quot;, &quot;GPIO182/R1RXD1&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO183/SPI3CK&quot;, &quot;GPO184/SPI3D0/S=
TRAP9&quot;, &quot;GPO185/SPI3D1/STRAP10&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO186/nSPI3CS0&quot;, &quot;GPIO187/nSPI3=
CS1&quot;, &quot;GPIO188/SPI3D2/nSPI3CS2&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO189/SPI3D3/nSPI3CS3&quot;, &quot;GPIO19=
0/nPRD_SMI&quot;, &quot;GPIO191&quot;, &quot;GPIO192&quot;, &quot;GPIO193/R=
1CRSDV&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO194/SMB0BSCL&quot;, &quot;GPIO195/SMB0B=
SDA&quot;, &quot;GPIO196/SMB0CSCL&quot;, &quot;GPIO197/SMB0DEN&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO198/SMB0DSDA&quot;, &quot;GPIO199/SMB0D=
SCL&quot;, &quot;GPIO200/R2CK&quot;, &quot;GPIO201/R1CK&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO202/SMB0CSDA&quot;, &quot;GPIO203/FANIN=
16&quot;, &quot;GPIO204/DDC2SCL&quot;, &quot;GPIO205/DDC2SDA&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO206/HSYNC2&quot;, &quot;GPIO207/VSYNC2&=
quot;, &quot;GPIO208/RG2TXC/DVCK&quot;, &quot;GPIO209/RG2TXCTL/DDRV4&quot;,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO210/RG2RXD0/DDRV5&quot;, &quot;GPIO211/=
RG2RXD1/DDRV6&quot;, &quot;GPIO212/RG2RXD2/DDRV7&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO213/RG2RXD3/DDRV8&quot;, &quot;GPIO214/=
RG2RXC/DDRV9&quot;, &quot;GPIO215/RG2RXCTL/DDRV10&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO216/RG2MDC/DDRV11&quot;, &quot;GPIO217/=
RG2MDIO/DVHSYNC&quot;, &quot;GPIO218/nWDO1&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO219/nWDO2&quot;, &quot;GPIO220/SMB12SCL=
&quot;, &quot;GPIO221/SMB12SDA&quot;, &quot;GPIO222/SMB13SCL&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO223/SMB13SDA&quot;, &quot;GPIO224/SPIXC=
K&quot;, &quot;GPO225/SPIXD0/STRAP12&quot;, &quot;GPO226/SPIXD1/STRAP13&quo=
t;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO227/nSPIXCS0&quot;, &quot;GPIO228/nSPIX=
CS1&quot;, &quot;GPO229/SPIXD2/STRAP3&quot;, &quot;GPIO230/SPIXD3&quot;,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;GPIO231/nCLKREQ&quot;, &quot;GPI255/DACOSEL=
&quot;<br>
&gt; +<br>
&gt; +Optional Properties:<br>
&gt; + bias-disable, bias-pull-down, bias-pull-up, input-enable,<br>
&gt; + input-disable, output-high, output-low, drive-push-pull,<br>
&gt; + drive-open-drain, input-debounce, slew-rate, drive-strength<br>
&gt; +<br>
&gt; + slew-rate valid arguments are:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;0&gt; - slow<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;1&gt; - fast<br>
&gt; + drive-strength valid arguments are:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;2&gt; - 2mA<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;4&gt; - 4mA<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;8&gt; - 8mA<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;12&gt; - 12mA<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;16&gt; - 16mA<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;24&gt; - 24mA<br>
&gt; +<br>
&gt; +For example, pinctrl might have pinmux subnodes like the following:<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpio0_iox1d1_pin: gpio0-iox1d1-pin {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pins =3D &quot;GPIO0/=
IOX1DI&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output-high;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpio0_iox1ck_pin: gpio0-iox1ck-pin {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pins =3D &quot;GPIO2/=
IOX1CK&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output_high;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=3D=3D=3D Pin Group Subnode =3D=3D=3D<br>
&gt; +<br>
&gt; +Required pin group subnode-properties:<br>
&gt; +- groups : A string containing the name of the group to mux.<br>
&gt; +- function: A string containing the name of the function to mux to th=
e<br>
&gt; +=C2=A0 group.<br>
&gt; +<br>
&gt; +The following are the list of the available groups and functions :<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0smb0, smb0b, smb0c, smb0d, smb0den, smb1, smb1b, =
smb1c, smb1d,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0smb2, smb2b, smb2c, smb2d, smb3, smb3b, smb3c, sm=
b3d, smb4, smb4b,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0smb4c, smb4d, smb4den, smb5, smb5b, smb5c, smb5d,=
 ga20kbc, smb6,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0smb7, smb8, smb9, smb10, smb11, smb12, smb13, smb=
14, smb15, fanin0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fanin1, fanin2, fanin3, fanin4, fanin5, fanin6, f=
anin7, fanin8,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fanin9, fanin10, fanin11 fanin12 fanin13, fanin14=
, fanin15, faninx,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pwm0, pwm1, pwm2, pwm3, pwm4, pwm5, pwm6, pwm7, r=
g1, rg1mdio, rg2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rg2mdio, ddr, uart1, uart2, bmcuart0a, bmcuart0b,=
 bmcuart1, iox1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iox2, ioxh, gspi, mmc, mmcwp, mmccd, mmcrst, mmc8=
, r1, r1err, r1md,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0r2, r2err, r2md, sd1, sd1pwr, wdog1, wdog2, scipm=
e, sci, serirq,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0jtag2, spix, spixcs1, pspi1, pspi2, ddc, clkreq, =
clkout, spi3, spi3cs1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spi3quad, spi3cs2, spi3cs3, spi0cs1, lpc, lpcclk,=
 espi, lkgpo0, lkgpo1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0lkgpo2, nprd_smi<br>
&gt; +<br>
&gt; +For example, pinctrl might have group subnodes like the following:<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0r1err_pins: r1err-pins {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0groups =3D &quot;r1er=
r&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0function =3D &quot;r1=
err&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0r1md_pins: r1md-pins {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0groups =3D &quot;r1md=
&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0function =3D &quot;r1=
md&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0r1_pins: r1-pins {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0groups =3D &quot;r1&q=
uot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0function =3D &quot;r1=
&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +Examples<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +pinctrl: pinctrl@f0800000 {<br>
<br>
</div></div>reg is missing or this doesn&#39;t match ranges.<br></blockquot=
e><div><br></div><div>the Control of the Pinmux is through the GCR (General=
 control register), and because the GCR controlling also on other things</d=
iv><div>in the BMC we have a separate node for the GCR and it handled by re=
gmap.</div><div>GCR node in our device tree:<br></div><div><br></div><div><=
span style=3D"color:rgb(0,0,0);font-family:&quot;Courier New&quot;;font-siz=
e:11pt">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gcr: gcr@80=
0000 {</span><br></div><div><div style=3D"font-family:&quot;Courier New&quo=
t;;font-size:11pt;color:rgb(0,0,0);background-color:rgb(255,255,255);font-w=
eight:normal;text-decoration:none"><pre>                        compatible =
=3D &quot;nuvoton,npcm750-gcr&quot;, &quot;syscon&quot;,
                                &quot;simple-mfd&quot;;
                        reg =3D &lt;0x800000 0x1000&gt;;
                };</pre><pre><div style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:small;white-space:normal;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial">The=
 address of the GCR is f0800000 this is why the pinctrl name pinctrl@f08000=
00</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:small;white-space:normal;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial">please let me know if it=
 is better to modify it to the GPIO address.</div></pre></div></div><div st=
yle=3D"font-size:small;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial">the ranges is address GPIO range=
s=C2=A0</div><br class=3D"gmail-Apple-interchange-newline">

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div><div class=3D"h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0#address-cells =3D &lt;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;nuvoton,npcm750-pinctrl&quot=
;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ranges =3D &lt;0 0xf0010000 0x8000&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpio0: gpio@f0010000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio-controller;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#gpio-cells =3D &lt;2=
&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0 0x80&=
gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =3D &lt;GI=
C_SPI 116 IRQ_TYPE_LEVEL_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio-ranges =3D &lt;&=
amp;pinctrl 0 0 32&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0....<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpio7: gpio@f0017000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio-controller;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#gpio-cells =3D &lt;2=
&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x7000 0x=
80&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =3D &lt;GI=
C_SPI 123 IRQ_TYPE_LEVEL_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio-ranges =3D &lt;&=
amp;pinctrl 0 224 32&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpio0_iox1d1_pin: gpio0-iox1d1-pin {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pins =3D &quot;GPIO0/=
IOX1DI&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output-high;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iox1_pins: iox1-pins {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0groups =3D &quot;iox1=
&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0function =3D &quot;io=
x1&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iox2_pins: iox2-pins {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0groups =3D &quot;iox2=
&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0function =3D &quot;io=
x2&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0....<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clkreq_pins: clkreq-pins {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0groups =3D &quot;clkr=
eq&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0function =3D &quot;cl=
kreq&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
&gt; \ No newline at end of file<br>
<br>
</div></div>^^^<br></blockquote><div><br></div><div>Thanks,</div><div><br><=
/div><div>Tomer=C2=A0</div></div><br></div></div>

--000000000000c130b4057121f416--
