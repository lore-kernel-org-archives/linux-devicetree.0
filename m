From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 06/16] net: phy: adin: support PHY mode converters
Date: Mon, 5 Aug 2019 16:51:05 +0200
Message-ID: <20190805145105.GN24275@lunn.ch>
References: <20190805165453.3989-1-alexandru.ardelean@analog.com>
 <20190805165453.3989-7-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190805165453.3989-7-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Aug 05, 2019 at 07:54:43PM +0300, Alexandru Ardelean wrote:
> Sometimes, the connection between a MAC and PHY is done via a
> mode/interface converter. An example is a GMII-to-RGMII converter, which
> would mean that the MAC operates in GMII mode while the PHY operates in
> RGMII. In this case there is a discrepancy between what the MAC expects &
> what the PHY expects and both need to be configured in their respective
> modes.
> 
> Sometimes, this converter is specified via a board/system configuration (in
> the device-tree for example). But, other times it can be left unspecified.
> The use of these converters is common in boards that have FPGA on them.
> 
> This patch also adds support for a `adi,phy-mode-internal` property that
> can be used in these (implicit convert) cases. The internal PHY mode will
> be used to specify the correct register settings for the PHY.
> 
> `fwnode_handle` is used, since this property may be specified via ACPI as
> well in other setups, but testing has been done in DT context.

Looking at the patch, you seems to assume phy-mode is what the MAC is
using? That seems rather odd, given the name. It seems like a better
solution would be to add a mac-mode, which the MAC uses to configure
its side of the link. The MAC driver would then implement this
property.

I don't see a need for this. phy-mode indicates what the PHY should
use. End of story.

     Andrew
