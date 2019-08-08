From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v2 00/15] net: phy: adin: add support for Analog Devices PHYs
Date: Thu, 8 Aug 2019 15:30:11 +0300
Message-ID: <20190808123026.17382-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com, andrew@lunn.ch, Alexandru Ardelean <alexandru.ardelean@analog.com>
List-Id: devicetree@vger.kernel.org

This changeset adds support for Analog Devices Industrial Ethernet PHYs.
Particularly the PHYs this driver adds support for:
 * ADIN1200 - Robust, Industrial, Low Power 10/100 Ethernet PHY
 * ADIN1300 - Robust, Industrial, Low Latency 10/100/1000 Gigabit
   Ethernet PHY

The 2 chips are pin & register compatible with one another. The main
difference being that ADIN1200 doesn't operate in gigabit mode.

The chips can be operated by the Generic PHY driver as well via the
standard IEEE PHY registers (0x0000 - 0x000F) which are supported by the
kernel as well. This assumes that configuration of the PHY has been done
completely in HW, according to spec, i.e. no extra SW configuration
required.

This changeset also implements the ability to configure the chips via SW
registers.

Datasheets:
  https://www.analog.com/media/en/technical-documentation/data-sheets/ADIN1300.pdf
  https://www.analog.com/media/en/technical-documentation/data-sheets/ADIN1200.pdf

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Alexandru Ardelean (15):
  net: phy: adin: add support for Analog Devices PHYs
  net: phy: adin: hook genphy_read_abilities() to get_features
  net: phy: adin: hook genphy_{suspend,resume} into the driver
  net: phy: adin: add support for interrupts
  net: phy: adin: add {write,read}_mmd hooks
  net: phy: adin: configure RGMII/RMII/MII modes on config
  net: phy: adin: make RGMII internal delays configurable
  net: phy: adin: make RMII fifo depth configurable
  net: phy: adin: add support MDI/MDIX/Auto-MDI selection
  net: phy: adin: add EEE translation layer from Clause 45 to Clause 22
  net: phy: adin: implement PHY subsystem software reset
  net: phy: adin: implement Energy Detect Powerdown mode
  net: phy: adin: configure downshift on config_init
  net: phy: adin: add ethtool get_stats support
  dt-bindings: net: add bindings for ADIN PHY driver

 .../devicetree/bindings/net/adi,adin.yaml     |  76 ++
 MAINTAINERS                                   |   8 +
 drivers/net/phy/Kconfig                       |   9 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/adin.c                        | 732 ++++++++++++++++++
 5 files changed, 826 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/adi,adin.yaml
 create mode 100644 drivers/net/phy/adin.c

-- 


Changelog v1 -> v2:
[ patch numbers are from v1 ]

* patch 01/16: net: phy: adin: add support for Analog Devices PHYs
   - return genphy_config_init() directly
   - remove `features` field; the ADIN1200/ADIN1300 support the standard IEEE regs
     for reading link caps
   - use PHY_ID_MATCH_MODEL() macro in `adin_tbl` and `adin_driver` tables
* added new patch: net: phy: adin: hook genphy_read_abilities() to get_features
   - this hooks the genphy_read_abilities() to `get_features` hook to make sure
     that features are initialized correctly
* patch 03/16: net: phy: adin: add support for interrupts
   - removed deprecated `.flags = PHY_HAS_INTERRUPT,`
   - compress return code in `adin_phy_ack_intr()`
* patch 04/16: net: phy: adin: add {write,read}_mmd hooks
   - changed reg-style to 4 digit format; it was the only place where this was
     inconsistent
* patch 05/16: net: phy: adin: configure RGMII/RMII/MII modes on config
   - removed `goto` statements; used `phy_clear_bits_mmd()` for clean
     disable-n-exit path
   - dev_info -> phydev_dbg
   - fixed `phy_interface_t` type conversion for rc; reverted back to `int` in 
     `genphy_config_init()`
   - added missing space in commit description
     `For RGMII with internal delays (modes RGMII_ID, RGMII_TXID, RGMII_RXID)`
   - overall: things have been simplified since this no longer needs to account
     for `phy-mode-internal` thingi/patch
* dropped: patch 06/16: net: phy: adin: support PHY mode converters
* patch 07/16: net: phy: adin: make RGMII internal delays configurable
   - changed mechanism, to specify delays in pico-seconds and convert them
     to register values; mechanism will be used for RMII fifo depth as well
   - fixed masking bug for internal delays when reworking this mechanism
   - changed DT props `adi,{rx,tx}-internal-delay` -> `adi,{rx,tx}-internal-delay-ps`
* patch 08/16: net: phy: adin: make RMII fifo depth configurable
   - using same mechanism to access access RMII fifo depth bits
   - changed DT prop `adi,fifo-depth` -> `adi,fifo-depth-bits`
* patch 10/16: net: phy: adin: add EEE translation layer for Clause 22
   - use `phydev_err` instead of `pr_err()` in `adin_cl22_to_adin_reg()` helper
   - renamed types from cl22 -> cl45 or clause22 -> clause45; the translation
     is from Clause 45 to Clause 22 indirect access
* patch 11/16: net: phy: adin: PHY reset mechanisms
   - dropped GPIO logic; using phylib's
   - doing SW subsystem reset if there is no reset GPIO defined via phylib
* dropped: patch 12/16: net: phy: adin: read EEE setting from device-tree
* patch 14/16: net: phy: adin: make sure down-speed auto-neg is enabled
   - use `phy_set_bits` to enable/disable down-speed
   - implemented downshift similar to marvell driver; also configuring
     num-speed retries
* patch 15/16:  net: phy: adin: add ethtool get_stats support
   - changed `do_not_inc` -> `do_not_accumulate`
   - in commit comment: `incremented` -> `accumulated`
   - use `strlcpy()` instead of `memcpy()` for get_stats
* patch 16/16: dt-bindings: net: add bindings for ADIN PHY driver
   - updated bindings with all stuff that was left in the driver; some things
     went away (like reset-gpio)
   - implemented Rob's suggestions

2.20.1
