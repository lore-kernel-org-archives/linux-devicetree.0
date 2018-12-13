From: Jan Kotas <jank@cadence.com>
Subject: [PATCH v2 0/2] clk: Add driver and bindings for Fixed MMIO clock
Date: Thu, 13 Dec 2018 12:49:27 +0000
Message-ID: <20181213124929.32736-1-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kotas <jank@cadence.com>
List-Id: devicetree@vger.kernel.org

This patchset adds a driver support for Fixed Memory Mapped IO clock.

The driver reads a clock frequency value from a single 32-bit memory
mapped register and registers it as a fixed rate clock.

It can be useful for prototyping Linux on various hardware platforms.
It is not intended to be used on finished, complete SoCs.

Changes since V1:
	Added platform driver support.
	Removed unnecessary messages.

Jan Kotas (2):
  dt-bindings: clk: Add bindings for Fixed MMIO clock
  clk: Add Fixed MMIO clock driver

 .../devicetree/bindings/clock/fixed-mmio-clock.txt |  24 +++++
 drivers/clk/Kconfig                                |   6 ++
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-fixed-mmio.c                       | 109 +++++++++++++++++++++
 4 files changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/fixed-mmio-clock.txt
 create mode 100644 drivers/clk/clk-fixed-mmio.c

-- 
2.15.0
