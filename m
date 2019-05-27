From: Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH net-next 0/2] Add hw offload of TC flower on MSCC Ocelot
Date: Mon, 27 May 2019 10:16:34 +0200
Message-ID: <1558944996-23069-1-git-send-email-horatiu.vultur@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
Cc: Horatiu Vultur <horatiu.vultur@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series enables hardware offload for flower filter used in
traffic controller on MSCC Ocelot board.

The patch series is based on:
commit 6ab1f192dcb4 ("net: mscc: ocelot: Implement port policers via tc
command")

CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Ralf Baechle <ralf@linux-mips.org>
CC: Paul Burton <paul.burton@mips.com>
CC: James Hogan <jhogan@kernel.org>
CC: "David S. Miller" <davem@davemloft.net>
CC: linux-mips@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: netdev@vger.kernel.org

Horatiu Vultur (2):
  net: mscc: ocelot: Add support for tcam
  net: mscc: ocelot: Hardware ofload for tc flower filter

 arch/mips/boot/dts/mscc/ocelot.dtsi       |   5 +-
 drivers/net/ethernet/mscc/Makefile        |   2 +-
 drivers/net/ethernet/mscc/ocelot.c        |  13 +
 drivers/net/ethernet/mscc/ocelot.h        |   8 +
 drivers/net/ethernet/mscc/ocelot_ace.c    | 779 ++++++++++++++++++++++++++++++
 drivers/net/ethernet/mscc/ocelot_ace.h    | 232 +++++++++
 drivers/net/ethernet/mscc/ocelot_board.c  |   1 +
 drivers/net/ethernet/mscc/ocelot_flower.c | 345 +++++++++++++
 drivers/net/ethernet/mscc/ocelot_regs.c   |  11 +
 drivers/net/ethernet/mscc/ocelot_s2.h     |  64 +++
 drivers/net/ethernet/mscc/ocelot_tc.c     |  16 +-
 drivers/net/ethernet/mscc/ocelot_vcap.h   | 403 ++++++++++++++++
 12 files changed, 1870 insertions(+), 9 deletions(-)
 create mode 100644 drivers/net/ethernet/mscc/ocelot_ace.c
 create mode 100644 drivers/net/ethernet/mscc/ocelot_ace.h
 create mode 100644 drivers/net/ethernet/mscc/ocelot_flower.c
 create mode 100644 drivers/net/ethernet/mscc/ocelot_s2.h
 create mode 100644 drivers/net/ethernet/mscc/ocelot_vcap.h

-- 
2.7.4
