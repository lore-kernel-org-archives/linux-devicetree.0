From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 0/5] arm: zynq: Adding new Xilinx boards
Date: Wed, 17 Jan 2018 15:41:08 +0100
Message-ID: <cover.1516200065.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: monstr@monstr.eu, Steffen Trumtrar <s.trumtrar@pengutronix.de>, linux-kernel@vger.kernel.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Josh Cartwright <josh.cartwright@ni.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

this patchset is adding 5 new dts files which target cc108 and zc770
boards.
Please let me know if you see any issue with them.

Thakns,
Michal


Michal Simek (5):
  arm: zynq: Add Xilinx cc108 board
  arm: zynq: Add support for Xilinx zc770 xm010 dc1 board
  arm: zynq: Add support for Xilinx zc770 xm011 dc2 board
  arm: zynq: Add support for Xilinx zc770 xm012 dc3 board
  arm: zynq: Add support for Xilinx zc770 xm013 dc4 board

 arch/arm/boot/dts/Makefile             |  5 ++
 arch/arm/boot/dts/zynq-cc108.dts       | 75 +++++++++++++++++++++++++++
 arch/arm/boot/dts/zynq-zc770-xm010.dts | 92 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/zynq-zc770-xm011.dts | 64 +++++++++++++++++++++++
 arch/arm/boot/dts/zynq-zc770-xm012.dts | 64 +++++++++++++++++++++++
 arch/arm/boot/dts/zynq-zc770-xm013.dts | 78 ++++++++++++++++++++++++++++
 6 files changed, 378 insertions(+)
 create mode 100644 arch/arm/boot/dts/zynq-cc108.dts
 create mode 100644 arch/arm/boot/dts/zynq-zc770-xm010.dts
 create mode 100644 arch/arm/boot/dts/zynq-zc770-xm011.dts
 create mode 100644 arch/arm/boot/dts/zynq-zc770-xm012.dts
 create mode 100644 arch/arm/boot/dts/zynq-zc770-xm013.dts

-- 
1.9.1
