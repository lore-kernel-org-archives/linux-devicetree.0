From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 12/14] net: phy: adin: implement downshift
 configuration via phy-tunable
Date: Mon, 12 Aug 2019 16:21:23 +0200
Message-ID: <20190812142123.GQ14290@lunn.ch>
References: <20190812112350.15242-1-alexandru.ardelean@analog.com>
 <20190812112350.15242-13-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190812112350.15242-13-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 02:23:48PM +0300, Alexandru Ardelean wrote:
> Down-speed auto-negotiation may not always be enabled, in which case the
> PHY won't down-shift to 100 or 10 during auto-negotiation.
> 
> This change enables downshift and configures the number of retries to
> default 4 (which is also in the datasheet
> 
> The downshift control mechanism can also be controlled via the phy-tunable
> interface (ETHTOOL_PHY_DOWNSHIFT control).
> 
> The change has been adapted from the Aquantia PHY driver.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
