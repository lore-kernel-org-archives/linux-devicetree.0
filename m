From: Xingyu Chen <xingyu.chen@amlogic.com>
Subject: [PATCH 0/2] irqchip/meson-gpio: Add support for Meson-G12A SoC
Date: Mon, 3 Dec 2018 14:13:22 +0800
Message-ID: <20181203061324.36248-1-xingyu.chen@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>, Kevin Hilman <khilman@baylibre.com>
Cc: Xingyu Chen <xingyu.chen@amlogic.com>, Carlo Caione <carlo@caione.org>, Jerome Brunet <jbrunet@baylibre.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh@kernel.org>, Jianxin Pan <jianxin.pan@amlogic.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series try to add GPIO interrupt controller support for Meson-G12A SoCs.
Although the total number of pins is the same as the Meson-AXG SoC, the gpio
banks and irq numbers are different. To avoid confusion on use, i think the
new compatible string is needed.

Xingyu Chen (2):
  dt-bindings: interrupt-controller: New binding for Meson-G12A SoC
  irqchip/meson-gpio: Add support for Meson-G12A SoC

 .../interrupt-controller/amlogic,meson-gpio-intc.txt         | 1 +
 drivers/irqchip/irq-meson-gpio.c                             | 5 +++++
 2 files changed, 6 insertions(+)

-- 
2.19.2
