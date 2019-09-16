From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v5 0/2] ethtool: implement Energy Detect Powerdown support via phy-tunable
Date: Mon, 16 Sep 2019 10:35:24 +0300
Message-ID: <20190916073526.24711-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com, andrew@lunn.ch, mkubecek@suse.cz, Alexandru Ardelean <alexandru.ardelean@analog.com>
List-Id: devicetree@vger.kernel.org

This changeset proposes a new control for PHY tunable to control Energy
Detect Power Down.

The `phy_tunable_id` has been named `ETHTOOL_PHY_EDPD` since it looks like
this feature is common across other PHYs (like EEE), and defining
`ETHTOOL_PHY_ENERGY_DETECT_POWER_DOWN` seems too long.
    
The way EDPD works, is that the RX block is put to a lower power mode,
except for link-pulse detection circuits. The TX block is also put to low
power mode, but the PHY wakes-up periodically to send link pulses, to avoid
lock-ups in case the other side is also in EDPD mode.
    
Currently, there are 2 PHY drivers that look like they could use this new
PHY tunable feature: the `adin` && `micrel` PHYs.

This series updates only the `adin` PHY driver to support this new feature,
as this chip has been tested. A change for `micrel` can be proposed after a
discussion of the PHY-tunable API is resolved.

Alexandru Ardelean (2):
  ethtool: implement Energy Detect Powerdown support via phy-tunable
  net: phy: adin: implement Energy Detect Powerdown mode via phy-tunable

 drivers/net/phy/adin.c       | 61 ++++++++++++++++++++++++++++++++++++
 include/uapi/linux/ethtool.h | 22 +++++++++++++
 net/core/ethtool.c           |  6 ++++
 3 files changed, 89 insertions(+)

-- 

Changelog v4 -> v5:
* add Andrew's & Florian's Reviewed-by tags for patch 1
* fixed patch 2 goof:
  `rc = adin_set_edpd(phydev, 1);`
    ->
  `rc = adin_set_edpd(phydev, ETHTOOL_PHY_EDPD_DFLT_TX_MSECS);` 
  this was omitted when re-spin to v4 was done
* for patch 2 added Florian's Reviewed-by tag as this was suggested by him
  and his accord was
  `with that fixed: Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>`

Changelog v3 -> v4:
* impose the TX interval unit for EDPD to be milliseconds; the point was
  raised by Michal; this should allow for intervals:
   - as small as 1 millisecond, which does not sound like a power-saver
   - as large as 65 seconds, which sounds like a lot to wait for a link to
     come up

Changelog v2 -> v3:
* implement Andrew's review comments:
  1. for patch `ethtool: implement Energy Detect Powerdown support via
     phy-tunable`
     - ETHTOOL_PHY_EDPD_DFLT_TX_INTERVAL == 0xffff
     - ETHTOOL_PHY_EDPD_NO_TX            == 0xfffe
     - added comment in include/uapi/linux/ethtool.h
  2. for patch `net: phy: adin: implement Energy Detect Powerdown mode via
     phy-tunable`
     - added comments about interval & units for the ADIN PHY
     - in `adin_set_edpd()`: add a switch statement of all the valid values
     - in `adin_get_edpd()`: return `ETHTOOL_PHY_EDPD_DFLT_TX_INTERVAL`
       since the PHY only supports a single TX-interval value (1 second)

Changelog v1 -> v2:
* initial series was made up of 2 sub-series: 1 for kernel & 1 for ethtool
  in userspace; v2 contains only the kernel series

2.20.1
