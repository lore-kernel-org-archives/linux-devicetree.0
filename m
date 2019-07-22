From: Evgeny Kolesnikov <evgenyz@gmail.com>
Subject: [PATCH 0/5] Add support for WD MyCloud EX2 Ultra (+ versatile UART-based restart/poweroff drivers)
Date: Mon, 22 Jul 2019 21:53:00 +0200
Message-ID: <cover.1563822216.git.evgenyz@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Evgeny Kolesnikov <evgenyz@gmail.com>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patchset consists of the DTS, which describes the WD MyCloud EX2 Ultra device,
'poweroff' and 'resert' drivers for power-managing MCUs connected to a board via UART
(these drivers are more versatile than qnap-poweroff and could be used as a substitude),
and DT bindings for these drivers.

The difference between uart-poweroff and qnap-poweroff is small, but important:
uart-poweroff is able to send to an MCU a command of arbitrary length, and the command
itself is defined in a DTS file for a specific device/board, thus making this driver
applicable to wider range of devices.

Evgeny Kolesnikov (5):
  power: reset: Add UART-based MCU poweroff DT bindings
  power: reset: Add UART-based MCU restart DT bindings
  power/reset: Add a power off driver for UART-based PM MCUs
  power/reset: Add a restart driver for UART-based PM MCUs
  ARM: dts: armada385-wd-mcex2u: Add DTS file for WD My Cloud EX2 Ultra

 .../bindings/power/reset/uart-poweroff.txt    |  38 +++
 .../bindings/power/reset/uart-restart.txt     |  39 +++
 arch/arm/boot/dts/armada-385-wd-mcex2u.dts    | 313 ++++++++++++++++++
 drivers/power/reset/Kconfig                   |  14 +
 drivers/power/reset/Makefile                  |   2 +
 drivers/power/reset/uart-poweroff.c           | 155 +++++++++
 drivers/power/reset/uart-restart.c            | 204 ++++++++++++
 7 files changed, 765 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/reset/uart-poweroff.txt
 create mode 100644 Documentation/devicetree/bindings/power/reset/uart-restart.txt
 create mode 100644 arch/arm/boot/dts/armada-385-wd-mcex2u.dts
 create mode 100644 drivers/power/reset/uart-poweroff.c
 create mode 100644 drivers/power/reset/uart-restart.c

-- 
2.21.0
