From: Yangbo Lu <yangbo.lu@nxp.com>
Subject: [v2, 0/5] External trigger stamp fifo support for ptp_qoriq
Date: Thu, 17 Jan 2019 09:49:31 +0800
Message-ID: <20190117014936.48117-1-yangbo.lu@nxp.com>
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
hardware uses it. The work will be done for some QorIQ platforms dts in
the near future.

Yangbo Lu (5):
  ptp_qoriq: fix interrupt enabling and handling
  ptp_qoriq: support external trigger stamp FIFO
  dt-binding: ptp_qoriq: document "fsl,extts-fifo" property
  ARM: dts: ls1021a: add 1588 external trigger stamp fifo support
  ptp_qoriq: add fiper pulse loopback support

 .../devicetree/bindings/ptp/ptp-qoriq.txt          |    1 +
 arch/arm/boot/dts/ls1021a.dtsi                     |    1 +
 drivers/ptp/Kconfig                                |   18 +++
 drivers/ptp/ptp_qoriq.c                            |  133 +++++++++++++-------
 include/linux/fsl/ptp_qoriq.h                      |    3 +
 5 files changed, 112 insertions(+), 44 deletions(-)
