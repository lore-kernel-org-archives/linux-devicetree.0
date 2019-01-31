From: Yangbo Lu <yangbo.lu@nxp.com>
Subject: [PATCH 0/9] Add ENETC PTP clock driver
Date: Thu, 31 Jan 2019 10:33:01 +0800
Message-ID: <20190131023310.9563-1-yangbo.lu@nxp.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, Yangbo Lu <yangbo.lu@nxp.com>
List-Id: devicetree@vger.kernel.org

There is same QorIQ 1588 timer IP block on the new ENETC Ethernet
controller with eTSEC/DPAA Ethernet controllers. However it's
different endianness (little-endian) and using PCI driver.

To support ENETC PTP driver, ptp_qoriq driver needed to be
reworked to make functions global for reusing, to add little-
endian support, to add ENETC memory map support, and to add
ENETC dependency for ptp_qoriq driver.

In addition, although ENETC PTP driver is a PCI driver, the dts
node still could be used. Currently the ls1028a dtsi which is
the only platform by now using ENETC is not complete, so there
is still dependency for ENETC PTP node upstreaming. This will
be done in the near future. The hardware timestamping support
for ENETC is done but needs to be reworked with new method in
internal git tree, and will be sent out soon.

Yangbo Lu (9):
  ptp_qoriq: make structure/function names more consistent
  ptp_qoriq: make ptp operations global
  ptp_qoriq: convert to use ptp_qoriq_init()
  ptp_qoriq: add little enadian support
  dt-binding: ptp_qoriq: add little-endian support
  ptp_qoriq: fix register memory map
  ptp: add QorIQ PTP support for ENETC
  enetc: add PTP clock driver
  MAINTAINERS: add enetc_ptp driver into QorIQ PTP list

 .../devicetree/bindings/ptp/ptp-qoriq.txt          |    3 +
 MAINTAINERS                                        |    1 +
 drivers/net/ethernet/freescale/enetc/Kconfig       |   12 +
 drivers/net/ethernet/freescale/enetc/Makefile      |    3 +
 drivers/net/ethernet/freescale/enetc/enetc_hw.h    |    5 +-
 drivers/net/ethernet/freescale/enetc/enetc_ptp.c   |  151 +++++++
 drivers/ptp/Kconfig                                |    2 +-
 drivers/ptp/ptp_qoriq.c                            |  427 ++++++++++----------
 drivers/ptp/ptp_qoriq_debugfs.c                    |   48 ++--
 include/linux/fsl/ptp_qoriq.h                      |   62 ++-
 10 files changed, 462 insertions(+), 252 deletions(-)
 create mode 100644 drivers/net/ethernet/freescale/enetc/enetc_ptp.c
