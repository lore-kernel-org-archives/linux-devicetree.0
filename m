From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH net-next v3 0/4] net: phy: add Amlogic g12a support
Date: Thu,  4 Apr 2019 15:11:43 +0200
Message-ID: <20190404131147.31156-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds the necessary bits to support network on the Amlogic
g12a SoC family.

Only the internal PHY and related MDIO mux needed to be addressed.
The GMAC remains compatible with axg SoC family

This series has been tested on the u200 (S905D2) with both the internal
and external (Realtek) PHYs.

Change since v2 [1]:
* Change 'clk part' Reviewed-by as suggested
* Remove default callback from phy drivers
* Use exact match PHY macros
* Default MDIO g12a as module if ARCH_MESON is enabled
* Don't print error on probe defer in the g12a mdio mux

Change since v1 [0]:
* drop '_' from function name unrelated to locking
* fix peripheral clock disable on error
* fix variable declaration reverse Xmas trees
* fix Kconfig dependency on CCF
  (Actually needed for 'struct clk_hw', Thx Andrew !)
* Minor fix in the DT exemple as reported by Rob

[0] https://lkml.kernel.org/r/20190314140135.19184-1-jbrunet@baylibre.com
[1] https://lkml.kernel.org/r/20190329141512.29867-1-jbrunet@baylibre.com

Jerome Brunet (4):
  dt-bindings: net: phy: add g12a mdio mux documentation
  net: phy: add amlogic g12a mdio mux support
  net: phy: meson-gxl: add g12a support
  net: phy: meson-gxl: clean-up gxl variant driver

 .../bindings/net/mdio-mux-meson-g12a.txt      |  48 +++
 drivers/net/phy/Kconfig                       |  11 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/mdio-mux-meson-g12a.c         | 380 ++++++++++++++++++
 drivers/net/phy/meson-gxl.c                   |  17 +-
 5 files changed, 453 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/mdio-mux-meson-g12a.txt
 create mode 100644 drivers/net/phy/mdio-mux-meson-g12a.c

-- 
2.20.1
