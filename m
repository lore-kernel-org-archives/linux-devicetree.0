From: Yangbo Lu <yangbo.lu@nxp.com>
Subject: [PATCH 0/6] Reuse ptp_qoriq driver for dpaa2-ptp
Date: Mon, 10 Jun 2019 11:21:02 +0800
Message-ID: <20190610032108.5791-1-yangbo.lu@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Yangbo Lu <yangbo.lu@nxp.com>
List-Id: devicetree@vger.kernel.org

Although dpaa2-ptp.c driver is a fsl_mc_driver which
is using MC APIs for register accessing, it's same IP
block with eTSEC/DPAA/ENETC 1588 timer.
This patch-set is to convert to reuse ptp_qoriq driver by
using register ioremap and dropping related MC APIs.
However the interrupts could only be handled by MC which
fires MSIs to ARM cores. So the interrupt enabling and
handling still rely on MC APIs. MC APIs for interrupt
and PPS event support are also added by this patch-set.

Yangbo Lu (6):
  ptp: add QorIQ PTP support for DPAA2
  dpaa2-ptp: reuse ptp_qoriq driver
  dt-binding: ptp_qoriq: support DPAA2 PTP compatible
  arm64: dts: fsl: add ptp timer node for dpaa2 platforms
  dpaa2-ptp: add interrupt support
  MAINTAINERS: maintain DPAA2 PTP driver in QorIQ PTP entry

 .../devicetree/bindings/ptp/ptp-qoriq.txt          |   3 +-
 MAINTAINERS                                        |   9 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |   8 +
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     |   8 +
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |   8 +
 drivers/net/ethernet/freescale/dpaa2/Kconfig       |   3 +-
 drivers/net/ethernet/freescale/dpaa2/dpaa2-ptp.c   | 242 +++++++++++----------
 drivers/net/ethernet/freescale/dpaa2/dprtc-cmd.h   |  48 +++-
 drivers/net/ethernet/freescale/dpaa2/dprtc.c       | 191 ++++++++++++----
 drivers/net/ethernet/freescale/dpaa2/dprtc.h       |  62 ++++--
 drivers/ptp/Kconfig                                |   2 +-
 11 files changed, 386 insertions(+), 198 deletions(-)

-- 
2.7.4
