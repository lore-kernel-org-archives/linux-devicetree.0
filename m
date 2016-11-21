From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v4 0/2] Add TI SCI Reset Driver
Date: Mon, 21 Nov 2016 15:30:50 -0600
Message-ID: <20161121213052.8684-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Suman Anna <s-anna@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

Hello all,

This series adds a reset controller driver that uses the TI SCI
protocol to manage resets.

The TI SCI protocol is used to communicate with power management
controllers used by some SoCs. These controllers manage the various
power domains, clocks, and resets available on a SoC.

This series is based on drivers for TI SCI and the first two controlled
elements above, these series can be found here:

TI-SCI: http://www.spinics.net/lists/arm-kernel/msg536851.html
PM Domains: http://www.spinics.net/lists/devicetree/msg146621.html
Clocks: https://www.spinics.net/lists/linux-clk/msg12785.html

Thanks,
Andrew

Changes from v3:
 - Addressed Rob Herring's comments
 - Added Santosh Shilimkar's Ack

Changes from v2:
 - Merged DT binding patch and reset header patch
 - Added locking for reset bit mask

Changes from v1:
 - Revised dt binding
 - CC Linux ARM list

Andrew F. Davis (2):
  Documentation: dt: reset: Add TI SCI reset binding
  reset: Add the TI SCI reset driver

 .../devicetree/bindings/reset/ti,sci-reset.txt     |  66 +++++
 MAINTAINERS                                        |   3 +
 drivers/reset/Kconfig                              |   9 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-ti-sci.c                       | 272 +++++++++++++++++++++
 include/dt-bindings/reset/k2g.h                    |  22 ++
 6 files changed, 373 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/ti,sci-reset.txt
 create mode 100644 drivers/reset/reset-ti-sci.c
 create mode 100644 include/dt-bindings/reset/k2g.h

-- 
2.10.2
