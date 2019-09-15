From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v4 1/2] ethtool: implement Energy Detect Powerdown support
 via phy-tunable
Date: Sun, 15 Sep 2019 08:08:48 -0700
Message-ID: <3d8855e9-4ca5-d17e-0a66-6c2e0f20fedb@gmail.com>
References: <20190912162812.402-1-alexandru.ardelean@analog.com>
 <20190912162812.402-2-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190912162812.402-2-alexandru.ardelean@analog.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, hkallweit1@gmail.com, andrew@lunn.ch, mkubecek@suse.cz
List-Id: devicetree@vger.kernel.org



On 9/12/2019 9:28 AM, Alexandru Ardelean wrote:
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
> The ADIN's datasheet mentions that TX pulses are at intervals of 1 second
> default each, and they can be disabled. For the Micrel KSZ9031 PHY, the
> datasheet does not mention whether they can be disabled, but mentions that
> they can modified.
> 
> The way this change is structured, is similar to the PHY tunable downshift
> control:
> * a `ETHTOOL_PHY_EDPD_DFLT_TX_MSECS` value is exposed to cover a default
>   TX interval; some PHYs could specify a certain value that makes sense
> * `ETHTOOL_PHY_EDPD_NO_TX` would disable TX when EDPD is enabled
> * `ETHTOOL_PHY_EDPD_DISABLE` will disable EDPD
> 
> As noted by the `ETHTOOL_PHY_EDPD_DFLT_TX_MSECS` the interval unit is 1
> millisecond, which should cover a reasonable range of intervals:
>  - from 1 millisecond, which does not sound like much of a power-saver
>  - to ~65 seconds which is quite a lot to wait for a link to come up when
>    plugging a cable
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
