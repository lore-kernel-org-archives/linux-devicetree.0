From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 07/10] dt-bindings: phy: add DT binding for Microsemi
 Ocelot SerDes muxing
Date: Mon, 13 Aug 2018 16:37:48 -0600
Message-ID: <20180813223748.GA20086@rob-hp-laptop>
References: <cover.aa759035f6eefdd0bb2a5ae335dab5bd5399bd46.1532954208.git-series.quentin.schulz@bootlin.com>
 <cd75c96640cc7fe306ee355acb1db85adb5b796f.1532954208.git-series.quentin.schulz@bootlin.com>
 <bcea7c75-e5a6-4533-aee0-65c893e8a422@gmail.com>
 <20180801081539.gxkviv6rnpwzoyxb@qschulz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180801081539.gxkviv6rnpwzoyxb@qschulz>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, allan.nielsen@microsemi.com, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

On Wed, Aug 01, 2018 at 10:15:39AM +0200, Quentin Schulz wrote:
> Hi Florian,
> 
> On Mon, Jul 30, 2018 at 02:39:35PM -0700, Florian Fainelli wrote:
> > On 07/30/2018 05:43 AM, Quentin Schulz wrote:
> > > Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> > > ---
> > >  Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt | 42 +++++++-
> > >  1 file changed, 42 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt b/Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt
> > > new file mode 100644
> > > index 0000000..25b102d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt
> > > @@ -0,0 +1,42 @@
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
> > > +- #phy-cells : from the generic phy bindings, must be 3. The first number
> > > +               defines the kind of Serdes (1 for SERDES1G_X, 6 for
> > > +	       SERDES6G_X), the second defines the macros in the specified
> > > +	       kind of Serdes (X for SERDES1G_X or SERDES6G_X) and the
> > > +	       last one defines the input port to use for a given SerDes
> > > +	       macro,
> > 
> > It would probably be more natural to reverse some of this and have the
> > 1st cell be the input port, while the 2nd and 3rd cell are the serdes
> > kind and the serdes macro type. Same comment as Andrew, can you please
> > define the 2nd and 3rd cells possible values in a header file that you
> > can include from both the DTS and the driver making use of that?
> 
> OK for a define for the DeviceTree part.
> 
> You want one set of defines for the values in the 2nd cell and one other
> set of defines for the 3rd cell?
> 
> I'm fine with a define for the second value (which is basically the enum
> serdes_type I've defined at the beginning of the serdes driver) but I
> don't see the point of defining the index of the SerDes. What would it
> look like?
> 
> enum serdes_type {
> 	SERDES1G = 1,
> 	SERDES6G = 6,
> }
> 
> #define SERDES1G_0	0
> #define SERDES1G_1	1
> #define SERDES1G_2	2
> #define SERDES6G_0	0
> #define SERDES6G_1	1
> 
> Then, e.g.:
> 
> &port5 {
> 	phys = <&serdes 5 SERDES1G SERDES1G_0>
> };
> 
> If you want a define for the pair (serdes_type, serdes_index), I don't
> see how I could re-use it on the driver side but it makes more sense on the
> DeviceTree side:
> 
> #define SERDES1G_0	1 0
> #define SERDES1G_1	1 1
> #define SERDES1G_2	1 2
> #define SERDES6G_0	6 0
> #define SERDES6G_1	6 1

I prefer #defines which are a single number. Otherwise if you read a dts 
file when #phy-cells is 3, it will look like an error in that you have 
what looks like 2 cells.

Rob
