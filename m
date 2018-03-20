From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [RFC PATCH] net: phy: Added device tree binding for dev-addr and
 dev-addr code check-up and usage
Date: Tue, 20 Mar 2018 15:30:56 +0100
Message-ID: <20180320143056.GA22128@lunn.ch>
References: <20180320134615.17817-1-vicentiu.galanopulo@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180320134615.17817-1-vicentiu.galanopulo@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vicentiu Galanopulo <vicentiu.galanopulo@nxp.com>
Cc: f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, marcel@holtmann.org, devicetree@vger.kernel.org, madalin.bucur@nxp.com, alexandru.marginean@nxp.com
List-Id: devicetree@vger.kernel.org

On Tue, Mar 20, 2018 at 08:46:15AM -0500, Vicentiu Galanopulo wrote:
> Reason for this patch is that the Inphi PHY
> has a vendor specific address space for accessing
> the C45 MDIO registers - starting from 0x1e.
> 
> A new function has been added, get_phy_c45_dev_addr,
> which loops through all the PHY device nodes under
> a MDIO bus node and looks for the <dev-addr> property. If
> it's not set/found, the get_phy_c45_devs_in_pkg,
> will be called with the value 0 as dev_addr parameter,
> else it will be called with the dev-addr property
> value from the device tree.

This seems like the wrong way to implement this. How about:

of_mdiobus_register(), when it loops over the children, looks for the
new property. If found, it passed dev-id to of_mdiobus_register_phy().
That passes it to get_phy_device(). I think get_phy_device() can then
set the ID in c45_ids, before passing it to
get_phy_id(). get_phy_c45_ids() will first look at devices in package
and can add further devices to c45_ids. It will then probe both those
found, and the static one you added.

       Andrew
