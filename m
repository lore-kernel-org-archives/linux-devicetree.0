From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v5 0/2] ethtool: implement Energy Detect Powerdown
 support via phy-tunable
Date: Mon, 16 Sep 2019 22:03:06 +0200 (CEST)
Message-ID: <20190916.220306.1827006815405824208.davem@davemloft.net>
References: <20190916073526.24711-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190916073526.24711-1-alexandru.ardelean@analog.com>
Sender: netdev-owner@vger.kernel.org
To: alexandru.ardelean@analog.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com, andrew@lunn.ch, mkubecek@suse.cz
List-Id: devicetree@vger.kernel.org

From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Date: Mon, 16 Sep 2019 10:35:24 +0300

> This changeset proposes a new control for PHY tunable to control Energy
> Detect Power Down.
> 
> The `phy_tunable_id` has been named `ETHTOOL_PHY_EDPD` since it looks like
> this feature is common across other PHYs (like EEE), and defining
> `ETHTOOL_PHY_ENERGY_DETECT_POWER_DOWN` seems too long.
>     
> The way EDPD works, is that the RX block is put to a lower power mode,
> except for link-pulse detection circuits. The TX block is also put to low
> power mode, but the PHY wakes-up periodically to send link pulses, to avoid
> lock-ups in case the other side is also in EDPD mode.
>     
> Currently, there are 2 PHY drivers that look like they could use this new
> PHY tunable feature: the `adin` && `micrel` PHYs.
> 
> This series updates only the `adin` PHY driver to support this new feature,
> as this chip has been tested. A change for `micrel` can be proposed after a
> discussion of the PHY-tunable API is resolved.

Series applied.
