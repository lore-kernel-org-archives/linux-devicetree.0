From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v5 00/13] net: phy: adin: add support for Analog Devices PHYs
Date: Fri, 16 Aug 2019 16:09:58 +0300
Message-ID: <20190816131011.23264-1-alexandru.ardelean@analog.com>
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

The 2 chips are register compatible with one another. The main
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

Alexandru Ardelean (13):
  net: phy: adin: add support for Analog Devices PHYs
  net: phy: adin: hook genphy_{suspend,resume} into the driver
  net: phy: adin: add support for interrupts
  net: phy: adin: add {write,read}_mmd hooks
  net: phy: adin: configure RGMII/RMII/MII modes on config
  net: phy: adin: make RGMII internal delays configurable
  net: phy: adin: make RMII fifo depth configurable
  net: phy: adin: add support MDI/MDIX/Auto-MDI selection
  net: phy: adin: add EEE translation layer from Clause 45 to Clause 22
  net: phy: adin: implement PHY subsystem software reset
  net: phy: adin: implement downshift configuration via phy-tunable
  net: phy: adin: add ethtool get_stats support
  dt-bindings: net: add bindings for ADIN PHY driver

 .../devicetree/bindings/net/adi,adin.yaml     |  73 ++
 MAINTAINERS                                   |   8 +
 drivers/net/phy/Kconfig                       |   9 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/adin.c                        | 724 ++++++++++++++++++
 5 files changed, 815 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/adi,adin.yaml
 create mode 100644 drivers/net/phy/adin.c

--

Changelog v4 -> v5:

* added Andrew's and Florian's `Reviewed-by` tags where the case

* [PATCH 4 10/14] net: phy: adin: implement PHY subsystem software reset
  - simplified mechanism; doing a static `msleep(10)` after issuing a subsystem soft
    reset; the previous mechanism (with a busy-wait) was working because of fluke;
    the reset bit in GeSftRst is self-clearing; once read, it always reads back 0,
    so there is no way to determine if the PHY has actually reset, except
    to wait a fixed/pessimistic time; after that, if any PHY read/write op
    does not work, it can be assumed that the MDIO bus went into a bad state,
    so the PHY is unusable

* dropped [PATCH 4 11/14] net: phy: adin: implement Energy Detect Powerdown mode
  - will re-spin with a phy-tuna proposal at later point in time;

* [PATCH 4 12/14] net: phy: adin: implement downshift configuration via phy-tunable
  - found some bugs while re-testing
    i) bug1: changed:
+       if (cnt > 8)
+               return -E2BIG;
    to
+       if (cnt > 7)
+               return -E2BIG;
    my 3 bit-logic was not that great for max value
    ii) bug2: changed:
+       *data = enable & cnt ? cnt : DOWNSHIFT_DEV_DISABLE;
        to
+       *data = (enable && cnt) ? cnt : DOWNSHIFT_DEV_DISABLE;
    needed logical OR vs bit-wise


2.20.1
