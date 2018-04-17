From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 1/3] net: phy: Add binding for vendor specific
 C45 MDIO address space
Date: Tue, 17 Apr 2018 14:53:43 +0200
Message-ID: <20180417125343.GD2591@lunn.ch>
References: <20180417090233.21548-1-vicentiu.galanopulo@nxp.com>
 <20180417090233.21548-2-vicentiu.galanopulo@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180417090233.21548-2-vicentiu.galanopulo@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vicentiu Galanopulo <vicentiu.galanopulo@nxp.com>
Cc: robh@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, davem@davemloft.net, marcel@holtmann.org, devicetree@vger.kernel.org, alexandru.marginean@nxp.com, madalin.bucur@nxp.com
List-Id: devicetree@vger.kernel.org

On Tue, Apr 17, 2018 at 04:02:31AM -0500, Vicentiu Galanopulo wrote:
> The extra property enables the discovery on the MDIO bus
> of the PHYs which have a vendor specific address space
> for accessing the C45 MDIO registers.
> 
> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@nxp.com>

Hi Vicentiu

I think binding is O.K, but the implementation needs work. So 

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
