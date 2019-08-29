From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] irqchip/meson-gpio: add sm1 support
Date: Thu, 29 Aug 2019 18:16:33 +0200
Message-ID: <20190829161635.25067-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds support for the new sm1 SoC family in the Amlogic gpio
interrupt controller.

Jerome Brunet (2):
  dt-bindings: interrupt-controller: new binding for the meson sm1 SoCs
  irqchip/meson-gpio: Add support for meson sm1 SoCs

 .../amlogic,meson-gpio-intc.txt               |  1 +
 drivers/irqchip/irq-meson-gpio.c              | 52 ++++++++++++++-----
 2 files changed, 39 insertions(+), 14 deletions(-)

-- 
2.21.0
