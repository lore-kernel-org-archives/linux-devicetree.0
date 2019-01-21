From: Yangbo Lu <yangbo.lu@nxp.com>
Subject: [v3, 0/6] External trigger stamp fifo support for ptp_qoriq
Date: Mon, 21 Jan 2019 18:41:37 +0800
Message-ID: <20190121104143.46782-1-yangbo.lu@nxp.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: "David S . Miller" <davem@davemloft.net>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Yangbo Lu <yangbo.lu@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch-set is to add external trigger stamp fifo support by a new
binding "fsl,extts-fifo", and to add fiper pulse loopback support which
is very useful for validating trigger without external hardware.
Also fixed issues in interrupt enabling/handling.

"fsl,extts-fifo" is required to be added into 1588 timer dts node whose
hardware supports it. The work will be done for some QorIQ platforms dts in
the near future.

Yangbo Lu (6):
  ptp_qoriq: fix interrupt enabling and handling
  ptp_qoriq: support external trigger stamp FIFO
  dt-binding: ptp_qoriq: document "fsl,extts-fifo" property
  ARM: dts: ls1021a: add 1588 external trigger stamp fifo support
  ptp: add debugfs support for ptp_qoriq
  MAINTAINERS: add drivers/ptp/ptp_qoriq_debugfs.c into QorIQ PTP list

 .../devicetree/bindings/ptp/ptp-qoriq.txt          |    2 +
 MAINTAINERS                                        |    1 +
 arch/arm/boot/dts/ls1021a.dtsi                     |    1 +
 drivers/ptp/Kconfig                                |    2 +-
 drivers/ptp/Makefile                               |    4 +-
 drivers/ptp/ptp_qoriq.c                            |  129 +++++++++++++-------
 drivers/ptp/ptp_qoriq_debugfs.c                    |  101 +++++++++++++++
 include/linux/fsl/ptp_qoriq.h                      |   15 +++
 8 files changed, 210 insertions(+), 45 deletions(-)
 create mode 100644 drivers/ptp/ptp_qoriq_debugfs.c
