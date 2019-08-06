From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 06/16] net: phy: adin: support PHY mode converters
Date: Tue, 6 Aug 2019 17:39:10 +0200
Message-ID: <20190806153910.GB20422@lunn.ch>
References: <20190805165453.3989-1-alexandru.ardelean@analog.com>
 <20190805165453.3989-7-alexandru.ardelean@analog.com>
 <20190805145105.GN24275@lunn.ch>
 <15cf5732415c313a7bfe610e7039e7c97b987073.camel@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <15cf5732415c313a7bfe610e7039e7c97b987073.camel@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 06, 2019 at 06:47:08AM +0000, Ardelean, Alexandru wrote:
> On Mon, 2019-08-05 at 16:51 +0200, Andrew Lunn wrote:
> > [External]
> > 
> > On Mon, Aug 05, 2019 at 07:54:43PM +0300, Alexandru Ardelean wrote:
> > > Sometimes, the connection between a MAC and PHY is done via a
> > > mode/interface converter. An example is a GMII-to-RGMII converter, which
> > > would mean that the MAC operates in GMII mode while the PHY operates in
> > > RGMII. In this case there is a discrepancy between what the MAC expects &
> > > what the PHY expects and both need to be configured in their respective
> > > modes.
> > > 
> > > Sometimes, this converter is specified via a board/system configuration (in
> > > the device-tree for example). But, other times it can be left unspecified.
> > > The use of these converters is common in boards that have FPGA on them.
> > > 
> > > This patch also adds support for a `adi,phy-mode-internal` property that
> > > can be used in these (implicit convert) cases. The internal PHY mode will
> > > be used to specify the correct register settings for the PHY.
> > > 
> > > `fwnode_handle` is used, since this property may be specified via ACPI as
> > > well in other setups, but testing has been done in DT context.
> > 
> > Looking at the patch, you seems to assume phy-mode is what the MAC is
> > using? That seems rather odd, given the name. It seems like a better
> > solution would be to add a mac-mode, which the MAC uses to configure
> > its side of the link. The MAC driver would then implement this
> > property.
> > 
> 
> actually, that's a pretty good idea;
> i guess i was narrow-minded when writing the driver, and got stuck on phy specifics, and forgot about the MAC-side;
> [ i also catch these design elements when reviewing, but i also seem to miss them when writing stuff sometimes ]
> 

Hi Ardelean

We should also consider the media converter itself. It is passive, or
does it need a driver. You seems to be considering GMII-to-RGMII. But
what about RGMII to SGMII? or RGMII to 1000Base-KX etc? Ideally we
want a generic solution and we need to think about all the parts in
the system.

     Andrew
