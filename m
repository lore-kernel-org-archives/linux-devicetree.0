Return-Path: <SRS0=W32e=OW=gmail.com=dwesterg@kernel.org>
From: dwesterg@gmail.com
Subject: [PATCH v2 net-next 00/10] net: eth: altera: tse: Add PTP and mSGDMA prefetcher
Date: Thu, 13 Dec 2018 09:52:42 -0800
Message-Id: <20181213175252.21143-1-dalon.westergreen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: netdev@vger.kernel.org, dinguyen@kernel.org, thor.thayer@linux.intel.com, richardcochran@gmail.com, davem@davemloft.net, vbridger@opensource.altera.com, robh+dt@kernel.org, mark.rutland@arm.commark.rutland@arm.com, devicetree@vger.kernel.org, hean.loong.ong@intel.com
Cc: Dalon Westergreen <dalon.westergreen@linux.intel.com>
List-ID: <devicetree@vger.kernel.org>

From: Dalon Westergreen <dalon.westergreen@linux.intel.com>

This patch series cleans up the Altera TSE driver and adds support
for the newer msgdma prefetcher as well as ptp support when using
the msgdma prefetcher.

Additions from v1:
 -> Addition of cleanup to altera_dmaops declarations
 -> Move xmit functions to return type netdev_tx_t

Dalon Westergreen (10):
  net: eth: altera: tse_start_xmit ignores tx_buffer call response
  net: eth: altera: set rx and tx ring size before init_dma call
  net: eth: altera: fix altera_dmaops declaration
  net: eth: altera: add optional function to start tx dma
  net: eth: altera: Move common functions to altera_utils
  net: eth: altera: Add missing identifier names to function
    declarations
  net: eth: altera: change tx functions to type netdev_tx_t
  net: eth: altera: add support for ptp and timestamping
  net: eth: altera: add msgdma prefetcher
  net: eth: altera: update devicetree bindings documentation

 .../devicetree/bindings/net/altera_tse.txt    |  98 +++-
 drivers/net/ethernet/altera/Kconfig           |   1 +
 drivers/net/ethernet/altera/Makefile          |   3 +-
 drivers/net/ethernet/altera/altera_msgdma.c   |   5 +-
 drivers/net/ethernet/altera/altera_msgdma.h   |  30 +-
 .../altera/altera_msgdma_prefetcher.c         | 432 ++++++++++++++++++
 .../altera/altera_msgdma_prefetcher.h         |  30 ++
 .../altera/altera_msgdmahw_prefetcher.h       |  87 ++++
 drivers/net/ethernet/altera/altera_sgdma.c    |  17 +-
 drivers/net/ethernet/altera/altera_sgdma.h    |  32 +-
 drivers/net/ethernet/altera/altera_tse.h      |  98 ++--
 .../net/ethernet/altera/altera_tse_ethtool.c  |  29 ++
 drivers/net/ethernet/altera/altera_tse_main.c | 221 +++++++--
 drivers/net/ethernet/altera/altera_utils.c    |  30 ++
 drivers/net/ethernet/altera/altera_utils.h    |  46 ++
 drivers/net/ethernet/altera/intel_fpga_tod.c  | 358 +++++++++++++++
 drivers/net/ethernet/altera/intel_fpga_tod.h  |  56 +++
 17 files changed, 1420 insertions(+), 153 deletions(-)
 create mode 100644 drivers/net/ethernet/altera/altera_msgdma_prefetcher.c
 create mode 100644 drivers/net/ethernet/altera/altera_msgdma_prefetcher.h
 create mode 100644 drivers/net/ethernet/altera/altera_msgdmahw_prefetcher.h
 create mode 100644 drivers/net/ethernet/altera/intel_fpga_tod.c
 create mode 100644 drivers/net/ethernet/altera/intel_fpga_tod.h

-- 
2.19.2
