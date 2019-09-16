From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v5 2/2] net: phy: adin: implement Energy Detect Powerdown
 mode via phy-tunable
Date: Mon, 16 Sep 2019 13:57:26 +0200
Message-ID: <20190916115726.GA5552@lunn.ch>
References: <20190916073526.24711-1-alexandru.ardelean@analog.com>
 <20190916073526.24711-3-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190916073526.24711-3-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com, mkubecek@suse.cz
List-Id: devicetree@vger.kernel.org

On Mon, Sep 16, 2019 at 10:35:26AM +0300, Alexandru Ardelean wrote:
> This driver becomes the first user of the kernel's `ETHTOOL_PHY_EDPD`
> phy-tunable feature.
> EDPD is also enabled by default on PHY config_init, but can be disabled via
> the phy-tunable control.
> 
> When enabling EDPD, it's also a good idea (for the ADIN PHYs) to enable TX
> periodic pulses, so that in case the other PHY is also on EDPD mode, there
> is no lock-up situation where both sides are waiting for the other to
> transmit.
> 
> Via the phy-tunable control, TX pulses can be disabled if specifying 0
> `tx-interval` via ethtool.
> 
> The ADIN PHY supports only fixed 1 second intervals; they cannot be
> configured. That is why the acceptable values are 1,
> ETHTOOL_PHY_EDPD_DFLT_TX_MSECS and ETHTOOL_PHY_EDPD_NO_TX (which disables
> TX pulses).
> 
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
