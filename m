Return-Path: <SRS0=byPw=N6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400112.outbound.protection.outlook.com ([40.107.140.112]:1056
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726784AbeKSSnc (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 19 Nov 2018 13:43:32 -0500
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 1/7] dt-bindings: phy: rcar-gen2: Add r8a77470 support
Date: Mon, 19 Nov 2018 08:20:30 +0000
Message-ID: <OSBPR01MB2103D13B5174524F4573E3E5B8D80@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1540475819-47950-1-git-send-email-biju.das@bp.renesas.com>
 <1540475819-47950-2-git-send-email-biju.das@bp.renesas.com>
 <20181105232653.GA8623@bogus>
In-Reply-To: <20181105232653.GA8623@bogus>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

Thanks for the feedback.

> Subject: Re: [PATCH 1/7] dt-bindings: phy: rcar-gen2: Add r8a77470 suppor=
t
>
> On Thu, Oct 25, 2018 at 02:56:53PM +0100, Biju Das wrote:
> > Add USB PHY support for r8a77470 SoC. Renesas RZ/G1C (R8A77470) USB
> > PHY is similar to the R-Car Gen2 family, but has the below features
> > compared to other RZ/G1 and R-Car Gen2/3 SoCs
> >
> > It has a shared pll reset for usbphy0/usbphy1 and this register reside
> > in usbphy0 block
> >
> > Each USB2.0 host needs to deassert the pll reset of usbphy0 block.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/phy/rcar-gen2-phy.txt      | 64
> +++++++++++++++++++---
> >  1 file changed, 55 insertions(+), 9 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> > b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> > index eeb9e18..0a59971 100644
> > --- a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> > +++ b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> > @@ -6,6 +6,7 @@ This file provides information on what the device node
> > for the R-Car generation  Required properties:
> >  - compatible: "renesas,usb-phy-r8a7743" if the device is a part of R8A=
7743
> SoC.
> >        "renesas,usb-phy-r8a7745" if the device is a part of R8A7745 SoC=
.
> > +      "renesas,usb-phy-r8a77470" if the device is a part of R8A77470
> SoC.
> >        "renesas,usb-phy-r8a7790" if the device is a part of R8A7790 SoC=
.
> >        "renesas,usb-phy-r8a7791" if the device is a part of R8A7791 SoC=
.
> >        "renesas,usb-phy-r8a7794" if the device is a part of R8A7794 SoC=
.
> > @@ -23,13 +24,23 @@ Required properties:
> >  - clocks: clock phandle and specifier pair.
> >  - clock-names: string, clock input name, must be "usbhs".
> >
> > +Optional properties (r8a77470 SoC Only):
> > +To use a USB channel as USB 2.0 Host, the device tree node should set
> > +below optional properties. This is because USB2.0 Host needs to
> > +deassert pll reset, apart from initializing interrupt enable, OVC
> > +detection timer and suspend/ resume timer register.
> > +
> > +- reg: offset and length of the partial USB2.0 Host register block.
>
> USB host registers in the phy node? And somewhere else too? Don't create
> overlapping regions in DT. That's not a reflection of the h/w and also is=
 an
> error in the kernel's resource handling code (which we work-around in the
> DT code).

OK, this means that looks like I need to create 2 drivers ehci-rcar.c and o=
hci-rcar.c  just
for initializing 3 registers(initializing interrupt enable, OVC detection t=
imer and suspend/ resume timer register)

> > +- clocks: clock phandle and specifier pair for usb2.0 host.
> > +- clk-names: string, clock input name, must be "usb20_host".
>
> Same with clocks.

OK.

> > +
> >  The USB PHY device tree node should have the subnodes corresponding
> > to the USB  channels. These subnodes must contain the following
> properties:
> >  - reg: the USB controller selector; see the table below for the values=
.
> >  - #phy-cells: see phy-bindings.txt in the same directory, must be <1>.
> >
> >  The phandle's argument in the PHY specifier is the USB controller
> > selector for -the USB channel; see the selector meanings below:
> > +the USB channel other than r8a77470 SoC; see the selector meanings
> below:
> >
> >  +-----------+---------------+---------------+
> >  |\ Selector |               |               |
> > @@ -40,22 +51,57 @@ the USB channel; see the selector meanings below:
> >  | 2         | PCI EHCI/OHCI | xHCI          |
> >  +-----------+---------------+---------------+
> >
> > +For r8a77470 SoC see the selector meaning below:
> > +
> > ++-----------+---------------+---------------+
> > +|\ Selector |               |               |
> > ++ --------- +       0       |       1       |
> > +| Channel  \|               |               |
> > ++-----------+---------------+---------------+
> > +| 0         | EHCI/OHCI     | HS-USB        |
> > ++-----------+---------------+---------------+
> > +
> >  Example (Lager board):
> >
> > -usb-phy@e6590100 {
> > -compatible =3D "renesas,usb-phy-r8a7790", "renesas,rcar-
> gen2-usb-phy";
> > +usbphy: usb-phy@e6590100 {
> > +compatible =3D "renesas,usb-phy-r8a7790",
> > +             "renesas,rcar-gen2-usb-phy";
>
> This change doesn't seem necessary.
OK. Will remove this.

> >  reg =3D <0 0xe6590100 0 0x100>;
> >  #address-cells =3D <1>;
> >  #size-cells =3D <0>;
> > -clocks =3D <&mstp7_clks R8A7790_CLK_HSUSB>;
> > +clocks =3D <&cpg CPG_MOD 704>;
> >  clock-names =3D "usbhs";
> > +power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 704>;
> > +status =3D "disabled";
>
> Don't show status in examples.
OK will take out the status.

> >
> > -usb-channel@0 {
> > -reg =3D <0>;
> > -#phy-cells =3D <1>;
> > +usb0: usb-channel@0 {
> > +        reg =3D <0>;
> > +        #phy-cells =3D <1>;
> > +};
> > +usb2: usb-channel@2 {
> > +        reg =3D <2>;
> > +        #phy-cells =3D <1>;
> >  };
> > -usb-channel@2 {
> > -reg =3D <2>;
> > +};
> > +
> > +Example (iWave RZ/G1C SBC):
> > +
> > +usbphy0: usb-phy0@e6590100 {
> > +compatible =3D "renesas,usb-phy-r8a77470",
> > +     "renesas,rcar-gen2-usb-phy";
> > +reg =3D <0 0xe6590100 0 0x100>,
> > +      <0 0xee080200 0 0x118>;
> > +#address-cells =3D <1>;
> > +#size-cells =3D <0>;
> > +clocks =3D <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>;
> > +clock-names =3D "usbhs", "usb20_host";
> > +power-domains =3D <&sysc R8A77470_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 704>, <&cpg 703>;
> > +status =3D "disabled";
>
> Don't show status.
OK will take out the status.

> > +
> > +usb0: usb-channel@0 {
> > +reg =3D <0>;
> >  #phy-cells =3D <1>;
> >  };
> >  };
> > --
> > 2.7.4
> >

Regards,
Biju



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
