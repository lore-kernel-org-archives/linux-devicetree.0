From: Jan Kotas <jank@cadence.com>
Subject: [PATCH v3 0/2] gpio: Add a driver for Cadence GPIO controller
Date: Tue, 18 Dec 2018 16:10:40 +0000
Message-ID: <20181218161042.16366-1-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kotas <jank@cadence.com>
List-Id: devicetree@vger.kernel.org

This patchset adds a driver support for Cadence GPIO controller.

Number of supported lines is configurable.
The driver initializes all pins as inputs in probe().
Currently it only supports level-sensitive interrupts.

The interrupts controller was tested with I2C and SPI IPs
acting as interrupt sources.

Changes since V2:
	Added spinlocks in request, free and irq_set_type functions.

Changes since V1:
	Switched to generic GPIO infrastructure.
	Redesigned interrupts, now uses chained irqchip.
	Drop support for edge-sensitive interrupts.
	Restore bypass settings at unexport/remove.

Jan Kotas (2):
  dt-bindings: gpio: Add bindings for Cadence GPIO
  gpio: Add Cadence GPIO driver

 .../devicetree/bindings/gpio/cdns,gpio.txt         |  44 ++++
 drivers/gpio/Kconfig                               |   8 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-cadence.c                        | 291 +++++++++++++++++++++
 4 files changed, 344 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/cdns,gpio.txt
 create mode 100644 drivers/gpio/gpio-cadence.c

-- 
2.15.0
