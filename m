From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 06/10] dt-bindings: phy: mvebu-utmi: add UTMI PHY
 bindings
Date: Wed, 16 Jan 2019 15:05:41 -0600
Message-ID: <20190116210541.GA7924@bogus>
References: <20190111133133.24803-1-miquel.raynal@bootlin.com>
 <20190111133133.24803-7-miquel.raynal@bootlin.com>
 <20190115214429.GA21758@bogus> <20190116142021.41faac8b@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190116142021.41faac8b@xps13>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Mathias Nyman <mathias.nyman@intel.com>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-usb@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Nadav Haklai <nadavh@marvell.com>, Alan Stern <stern@rowland.harvard.edu>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 16, 2019 at 02:20:21PM +0100, Miquel Raynal wrote:
> Hi Rob,
> 
> Rob Herring <robh@kernel.org> wrote on Tue, 15 Jan 2019 15:44:29 -0600:
> 
> > On Fri, Jan 11, 2019 at 02:31:29PM +0100, Miquel Raynal wrote:
> > > Add bindings for Marvell Armada 3700 USB2 UTMI+ PHY.
> > > 
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  .../bindings/phy/phy-mvebu-utmi.txt           | 37 +++++++++++++++++++
> > >  1 file changed, 37 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/phy-mvebu-utmi.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/phy/phy-mvebu-utmi.txt b/Documentation/devicetree/bindings/phy/phy-mvebu-utmi.txt
> > > new file mode 100644
> > > index 000000000000..4ade05ce5d51
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/phy-mvebu-utmi.txt
> > > @@ -0,0 +1,37 @@
> > > +MVEBU A3700 UTMI PHY
> > > +--------------------
> > > +
> > > +USB2 UTMI+ PHY controllers can be found on the following Marvell MVEBU SoCs:
> > > +* Armada 3700
> > > +
> > > +On Armada 3700, there are two USB controllers, one is compatible with the USB2
> > > +and USB3 specifications and supports OTG. The other one is USB2 compliant and
> > > +only supports host mode. Both of these controllers come with a UTMI PHY.  
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
> > > +	      * "marvell,a3700-utmi-host-phy" for the PHY connected to
> > > +	        the USB2 host-only controller.
> > > +	      * "marvell,a3700-utmi-otg-phy" for the PHY connected to
> > > +	        the USB3 and USB2 OTG capable controller.
> > > +- reg: PHY IP register range.
> > > +- marvell,usb-misc-reg: handle on the "USB miscellaneous registers" shared
> > > +			region covering registers related to both the host
> > > +			controller and the PHY.
> > > +- #phy-cells: Standard property (Documentation: phy-bindings.txt) Should be 0.
> > > +
> > > +
> > > +Example:
> > > +
> > > +	usb2_utmi_host_phy: phy@5f000 {
> > > +		compatible = "marvell,armada-3700-utmi-host-phy";
> > > +		reg = <0x5f000 0x800>;
> > > +		marvell,usb-misc-reg = <&usb2_syscon>;
> > > +		#phy-cells = <0>;
> > > +	};
> > > +
> > > +	usb2_syscon: system-controller@5f800 {
> > > +		compatible = "syscon", "simple-mfd";  
> > 
> > This is not valid because there's not a specific compatible string and 
> > 'simple-mfd' implies there are child nodes.
> 
> What do you suggest? Is compatible = "syscon"; enough? 

No.

> This is just an
> area with a few registers that do not belong to any specific IP.

Must be some name for the registers in the datasheet?

> There
> are registers that are related to the control of the USB controller,
> and registers that are related to the PHY. It's quite challenging to
> find a meaningful specific compatible string. Is it mandatory to add
> one? If yes, would "marvell,armada-3700-usb-utmi-{host,otg}-misc" fit?

Yes, if there's not a name from the datasheet.

Rob
