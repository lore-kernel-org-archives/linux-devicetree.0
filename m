From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH net-next v3 07/11] dt-bindings: phy: add DT binding for
 Microsemi Ocelot SerDes muxing
Date: Mon, 1 Oct 2018 12:10:52 -0500
Message-ID: <CAL_JsqLKNfFDPqev9uubrMn0cz04E5-BKA5dbcwfkzVePKy4LA@mail.gmail.com>
References: <cover.ff40d591b548a6da31716e6e600f11a303e0e643.1536912834.git-series.quentin.schulz@bootlin.com>
 <f392dafca9165800439fc09cd7d16e6a9506d457.1536912834.git-series.quentin.schulz@bootlin.com>
 <20180926213509.GA7454@bogus> <20181001124605.jxiechvp6ztvh77p@qschulz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181001124605.jxiechvp6ztvh77p@qschulz>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Miller <davem@davemloft.net>, Kishon Vijay Abraham I <kishon@ti.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, allan.nielsen@microchip.com, Linux-MIPS <linux-mips@linux-mips.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 1, 2018 at 7:46 AM Quentin Schulz
<quentin.schulz@bootlin.com> wrote:
>
> Hi Rob,
>
> I'm not sure I've understood the way you wanted me to so let me know if
> I'm not on the right path.
>
> On Wed, Sep 26, 2018 at 04:35:09PM -0500, Rob Herring wrote:
> > On Fri, Sep 14, 2018 at 10:16:05AM +0200, Quentin Schulz wrote:
> > > Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> > > ---
> > >  Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt | 40 +++++++-
> > >  1 file changed, 40 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt b/Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt
> > > new file mode 100644
> > > index 0000000..2a88cc3
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt
> > > @@ -0,0 +1,40 @@
> > > +Microsemi Ocelot SerDes muxing driver
> > > +-------------------------------------
> > > +
> > > +On Microsemi Ocelot, there is a handful of registers in HSIO address
> > > +space for setting up the SerDes to switch port muxing.
> > > +
> > > +A SerDes X can be "muxed" to work with switch port Y or Z for example.
> > > +One specific SerDes can also be used as a PCIe interface.
> > > +
> > > +Hence, a SerDes represents an interface, be it an Ethernet or a PCIe one.
> > > +
> > > +There are two kinds of SerDes: SERDES1G supports 10/100Mbps in
> > > +half/full-duplex and 1000Mbps in full-duplex mode while SERDES6G supports
> > > +10/100Mbps in half/full-duplex and 1000/2500Mbps in full-duplex mode.
> > > +
> > > +Also, SERDES6G number (aka "macro") 0 is the only interface supporting
> > > +QSGMII.
> > > +
> > > +Required properties:
> > > +
> > > +- compatible: should be "mscc,vsc7514-serdes"
> > > +- #phy-cells : from the generic phy bindings, must be 2.
> > > +          The first number defines the input port to use for a given
> > > +          SerDes macro. The second defines the macro to use. They are
> > > +          defined in dt-bindings/phy/phy-ocelot-serdes.h
> >
> > You need to define what this is a child of.
> >
>
> This is a child of the HSIO syscon on the Microsemi Ocelot. I don't
> expect all Microsemi SoCs that could use this driver to have the SerDes
> node in the HSIO syscon.
>
> Among the latest additions in Documentation/devicetree/bindings/phy I
> couldn't find anything close to my understanding of "define what this is
> a child of", could you elaborate on what you want exactly?

Essentially what you've said here, but specifically what is the
compatible property of the HSIO syscon (the specific one, not
"syscon").

> > > +
> > > +Example:
> > > +
> > > +   serdes: serdes {
> > > +           compatible = "mscc,vsc7514-serdes";
> > > +           #phy-cells = <2>;
> >
> > However, if there are no other resources associated with this, then you
> > don't even need this child node. The parent can be a phy provider and
> > provider of other functions too.
> >
>
> The parent is a syscon with multiple features (SerDes, PLL
> configuration, temp sensor, SyncE, ...) so I'm not sure it's possible to
> do what you're asking me to. For now, there is only a SerDes node but
> ultimately there'll be more than one I guess.

There's no reason you can't have:

syscon {
  compatible = "some-soc-syscon-block";
  #clock-cells = <1>;
  #phy-cells = <2>;
  ...
};

As it stands, you only have a child node because you want to
instantiate some driver. A single node can be multiple providers and
DT is not the only way to instantiate drivers.

This could change if your sub-nodes need child nodes as well (e.g.
pinctrl) or have their own resources such as clocks, interrupts, etc.
But with an incomplete binding, I can't really tell you what makes
sense.

Rob
