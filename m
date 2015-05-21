From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: [PATCH 0/3] Adding driver for Xilinx LogiCORE IP mailbox.
Date: Thu, 21 May 2015 16:37:27 -0700
Message-ID: <1432251450-26352-1-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jassisinghbrar@gmail.com
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, akpm@linux-foundation.org, gregkh@linuxfoundation.org, mchehab@osg.samsung.com, arnd@arndb.de, joe@perches.com, jingoohan1@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Moritz Fischer <moritz.fischer@ettus.com>
List-Id: devicetree@vger.kernel.org

This patchset adds mailbox framework integration for the Xilinx LogiCOR=
E IP
mailbox.  The Xilinx LogiCORE IP mailbox is a fpga softcore that allows
interprocessor communication between AXI4 stream / memory mapped
processors.

It has been tested with the version 2.1 of the core built with
Vivado 2014.4, running on a Zynq 7020.

If Michal or S=C3=B6ren could look it over that would be great.

Cheers,

Moritz



Moritz Fischer (3):
  mailbox: Adding driver for Xilinx LogiCORE IP mailbox.
  dts: Adding docs for Xilinx LogiCORE IP mailbox driver.
  MAINTAINERS: Add entry for xilinx mailbox driver.

 .../bindings/mailbox/xilinx-mailbox.txt         |  40 +++
 MAINTAINERS                                     |   7 +
 drivers/mailbox/Kconfig                         |   8 +
 drivers/mailbox/Makefile                        |   2 +
 drivers/mailbox/mailbox-xilinx.c                | 339 ++++++++++++++++=
+++
 5 files changed, 396 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/xilinx-ma=
ilbox.txt
 create mode 100644 drivers/mailbox/mailbox-xilinx.c

--=20
2.4.1
