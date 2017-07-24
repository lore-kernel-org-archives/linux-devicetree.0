From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v2] clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0
 clock selector PHY
Date: Mon, 24 Jul 2017 10:13:04 +0000
Message-ID: <TY1PR06MB0992A6CD9B43399DF1A7B2B8D8BB0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1498631315-15730-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20170705141532.slvvbxh33sgwotje@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170705141532.slvvbxh33sgwotje@rob-hp-laptop>
Content-Language: ja-JP
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> -----Original Message-----
> From: Rob Herring
> Sent: Wednesday, July 5, 2017 11:16 PM
>=20
> On Wed, Jun 28, 2017 at 03:28:35PM +0900, Yoshihiro Shimoda wrote:
> > R-Car USB 2.0 controller can change the clock source from an oscillator
> > to an external clock via a register. So, this patch adds support
> > the clock source selector as a clock driver.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  This patch is based on the renesas-drivers.git /
> > renesas-drivers-2017-06-27-v4.12-rc7 tag.
> >
> >  Changes from v1:
> >   - Change this driver as a clock driver from a generic phy driver.
> >     https://patchwork.kernel.org/patch/9788697/
> >   - Remove "RFC" tag.
> >
> >  .../bindings/clock/renesas,rcar-usb2-clock-sel.txt |  54 ++++++
> >  drivers/clk/renesas/Kconfig                        |   5 +
> >  drivers/clk/renesas/Makefile                       |   1 +
> >  drivers/clk/renesas/rcar-usb2-clock-sel.c          | 205 +++++++++++++=
++++++++
> >  4 files changed, 265 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/renesas,rca=
r-usb2-clock-sel.txt
> >  create mode 100644 drivers/clk/renesas/rcar-usb2-clock-sel.c
> >
> > diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-=
clock-sel.txt
> b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
> > new file mode 100644
> > index 0000000..75ccafc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-s=
el.txt
> > @@ -0,0 +1,54 @@
> > +* Renesas R-Car USB 2.0 clock selector
> > +
> > +This file provides information on what the device node for the R-Car U=
SB 2.0
> > +clock selector.
> > +
> > +If you connect an external clock to the USB_EXTAL pin only, you should=
 set
> > +the clock rate to "usb_extal" node only.
> > +If you connect an oscillator to both the USB_XTAL and USB_EXTAL, this =
module
> > +is not needed because this is default setting. (Of course, you can set=
 the
> > +clock rates to both "usb_extal" and "usb_xtal" nodes.
> > +
> > +Case 1: An external clock connects to R-Car SoC
> > +        +----------+   +--- R-Car ---------------------+
> > +        |External  |---|USB_EXTAL ---> all usb channels|
> > +        |clock     |   |USB_XTAL                       |
> > +        +----------+   +-------------------------------+
> > +In this case, we need this driver with "usb_extal" clock.
> > +
> > +Case 2: An oscillator connects to R-Car SoC
> > +        +----------+   +--- R-Car ---------------------+
> > +        |Oscillator|---|USB_EXTAL -+-> all usb channels|
> > +        |          |---|USB_XTAL --+                   |
> > +        +----------+   +-------------------------------+
> > +In this case, we don't need this selector.
> > +
> > +Required properties:
> > +- compatible: "renesas,r8a7795-rcar-usb2-clock-sel" if the device is a=
 part of
> > +	      an R8A7795 SoC.
> > +              "renesas,r8a7796-rcar-usb2-clock-sel" if the device if a=
 part of
> > +	      an R8A7796 SoC.
> > +              "renesas,rcar-gen3-usb2-clock-sel" for a generic R-Car G=
en3
> > +              compatible device.
> > +
> > +              When compatible with the generic version, nodes must lis=
t the
> > +              SoC-specific version corresponding to the platform first
> > +              followed by the generic version.
> > +
> > +- reg: offset and length of the USB 2.0 clock selector register block.
> > +- clocks: A list of phandles and specifier pairs.
> > +- clock-names: Name of the clocks.
> > + - The functional clock must be "ehci_ohci"
> > + - The USB_EXTAL clock pin must be "usb_extal"
> > + - The USB_XTAL clock pin must be "usb_xtal"
> > +- #clock-cells: Must be 0
> > +
> > +Exxample (R-Car H3):
> > +
> > +        usb2_clksel: clock-controller@e6590630 {
> > +                compatible =3D "renesas,r8a77950-rcar-usb2-clock-sel",
> > +                             "renesas,rcar-gen3-usb2-clock-sel";
> > +                reg =3D <0 0xe6590630 0 0x02>;
> > +                clocks =3D <&cpg CPG_MOD 703>, <&usb_extal>, <&usb_xta=
l>;
> > +                clock-names =3D "ehci_ohci", "usb_extal", "usb_xtal";
>=20
> Missing #clock-cells

Oops, I will fix it.

> With that, for the binding:
>=20
> Acked-by: Rob Herring <robh@kernel.org>

Thank you for your Acked-by!

Best regards,
Yoshihiro Shimoda

> Rob
