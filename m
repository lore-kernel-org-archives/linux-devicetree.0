MIME-Version: 1.0
Date: Wed, 16 Jan 2019 08:49:28 -0600
References: <20190111133133.24803-1-miquel.raynal@bootlin.com>
	<20190111133133.24803-7-miquel.raynal@bootlin.com>
	<20190115214429.GA21758@bogus>
	<20190116142021.41faac8b@xps13>
In-Reply-To: <20190116142021.41faac8b@xps13>
Message-ID: <CAL_JsqKMucYu+vT7=1JHJY8tkD36navLTxgY8T_-X0iT9qKwSQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] dt-bindings: phy: mvebu-utmi: add UTMI PHY bindings
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Alan Stern <stern@rowland.harvard.edu>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Linux USB List <linux-usb@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jan 16, 2019 at 7:20 AM Miquel Raynal <miquel.raynal@bootlin.com> w=
rote:
>
> Hi Rob,
>
> Rob Herring <robh@kernel.org> wrote on Tue, 15 Jan 2019 15:44:29 -0600:
>
> > On Fri, Jan 11, 2019 at 02:31:29PM +0100, Miquel Raynal wrote:
> > > Add bindings for Marvell Armada 3700 USB2 UTMI+ PHY.
> > >
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  .../bindings/phy/phy-mvebu-utmi.txt           | 37 +++++++++++++++++=
++
> > >  1 file changed, 37 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/phy-mvebu-u=
tmi.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/phy/phy-mvebu-utmi.txt=
 b/Documentation/devicetree/bindings/phy/phy-mvebu-utmi.txt
> > > new file mode 100644
> > > index 000000000000..4ade05ce5d51
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/phy-mvebu-utmi.txt
> > > @@ -0,0 +1,37 @@
> > > +MVEBU A3700 UTMI PHY
> > > +--------------------
> > > +
> > > +USB2 UTMI+ PHY controllers can be found on the following Marvell MVE=
BU SoCs:
> > > +* Armada 3700
> > > +
> > > +On Armada 3700, there are two USB controllers, one is compatible wit=
h the USB2
> > > +and USB3 specifications and supports OTG. The other one is USB2 comp=
liant and
> > > +only supports host mode. Both of these controllers come with a UTMI =
PHY.
> >
> > This paragraph says the controllers are different, but are the PHYs
> > different?
>
> Yes they are. I will make it appear clearly in the v3.
>
> >
> > > +
> > > +Required Properties:
> > > +
> > > +- compatible: Should be one of:
> > > +         * "marvell,a3700-utmi-host-phy" for the PHY connected to
> > > +           the USB2 host-only controller.
> > > +         * "marvell,a3700-utmi-otg-phy" for the PHY connected to
> > > +           the USB3 and USB2 OTG capable controller.
> > > +- reg: PHY IP register range.
> > > +- marvell,usb-misc-reg: handle on the "USB miscellaneous registers" =
shared
> > > +                   region covering registers related to both the hos=
t
> > > +                   controller and the PHY.
> > > +- #phy-cells: Standard property (Documentation: phy-bindings.txt) Sh=
ould be 0.
> > > +
> > > +
> > > +Example:
> > > +
> > > +   usb2_utmi_host_phy: phy@5f000 {
> > > +           compatible =3D "marvell,armada-3700-utmi-host-phy";
> > > +           reg =3D <0x5f000 0x800>;
> > > +           marvell,usb-misc-reg =3D <&usb2_syscon>;
> > > +           #phy-cells =3D <0>;
> > > +   };
> > > +
> > > +   usb2_syscon: system-controller@5f800 {
> > > +           compatible =3D "syscon", "simple-mfd";
> >
> > This is not valid because there's not a specific compatible string and
> > 'simple-mfd' implies there are child nodes.
>
> What do you suggest? Is compatible =3D "syscon"; enough? This is just an
> area with a few registers that do not belong to any specific IP. There
> are registers that are related to the control of the USB controller,
> and registers that are related to the PHY. It's quite challenging to
> find a meaningful specific compatible string. Is it mandatory to add
> one? If yes, would "marvell,armada-3700-usb-utmi-{host,otg}-misc" fit?
>
>
> Thanks,
> Miqu=C3=A8l
