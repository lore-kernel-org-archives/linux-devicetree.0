From: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
Subject: [PATCH 0/2] Add board support for TS-4900
Date: Wed, 27 Jul 2016 13:53:00 -0400
Message-ID: <1469641982-19558-1-git-send-email-lucile.quirion@savoirfairelinux.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, kernel@savoirfairelinux.com, Lucile Quirion <lucile.quirion@savoirfairelinux.com>
List-Id: devicetree@vger.kernel.org

This patch serie adds support for TS-4900 System on Module (SoM). This board,
manufactured by Technologic Systems, is based on an i.MX6.

The i.MX6 exists in 2 flavours: single/dualcore or quadcore. I've added TS-4900
device tree files for both flavour of the i.MX6.

The current device tree does NOT include the FPGA's GPIOs, the FPGA's UARTs
or the wireless chip.

I'd like your input about this problem:

The TS-4900 can be mounted on several carrier boards providing additional
peripheral connectors (e.g. TS-TPC-8390). A final device tree would include the
dtsi defining the carrier board's peripherals.

Should there be a dts file per SoM and carrier board combination ?

There is a already a total of 30 combinations on Technologic's website:
https://www.embeddedarm.com/products/category/modular-embedded-systems


Lucile Quirion (2):
  of: documentation: add bindings documentation for TS-4900
  ARM: dts: TS-4900: add basic device tree

 .../devicetree/bindings/arm/technologic.txt        |   6 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/imx6dl-ts4900.dts                |  21 +
 arch/arm/boot/dts/imx6q-ts4900.dts                 |  25 ++
 arch/arm/boot/dts/imx6qdl-ts4900.dtsi              | 462 +++++++++++++++++++++
 5 files changed, 516 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-ts4900.dts
 create mode 100644 arch/arm/boot/dts/imx6q-ts4900.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-ts4900.dtsi

-- 
2.5.5
