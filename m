From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH 0/5] stmmac: Fixed Phy & PTP fixes
Date: Fri,  4 Dec 2015 17:08:40 +0800
Message-ID: <1449220125-67417-1-git-send-email-preid@electromag.com.au>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, davem@davemloft.net
Cc: Phil Reid <preid@electromag.com.au>
List-Id: devicetree@vger.kernel.org

Provide ability to specify a fixed phy in the device tree and
retain the mdio bus if no phy is found. This is needed where 
a dsa is connected via a fixed phy and uses the mdio bus for config.
Fixed ptp ref clock calculatins for the stmmac when ptp ref clock
is running at <= 50Mhz. Also add device tree setting to config
ptp clk source on socfpga platforms.


Phil Reid (5):
  stmmac: create of compatible mdio bus for stmacc driver
  stmmac: Correct documentation on stmmac clocks.
  stmmac: Fix calculations for ptp counters when clock input = 50Mhz.
  stmmac: Add ptp debugfs entry.
  stmmac: socfpga: Provide dt node to config ptp clk source.

 .../devicetree/bindings/net/socfpga-dwmac.txt      |  2 +
 Documentation/devicetree/bindings/net/stmmac.txt   | 27 +++++---
 drivers/net/ethernet/stmicro/stmmac/common.h       |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    | 10 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c  |  8 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 79 +++++++++++++++++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c  | 32 ++++++---
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h   |  5 ++
 10 files changed, 134 insertions(+), 34 deletions(-)

-- 
1.8.3.1
