From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 0/8] clocksource/drivers/timer-atmel-tcb: add sama5d2 support
Date: Thu, 10 Oct 2019 00:39:58 +0200
Message-ID: <20191009224006.5021-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

This series mainly adds sama5d2 support where we need to avoid using
clock index 0 because that clock is never enabled by the driver.

There is also a rework of the 32khz clock handling so it is not used for
clockevents on 32 bit counter because the increased rate improves the
resolution and doesn't have any drawback with that counter width. This
replaces a patch that has been carried in the linux-rt tree for a while.

Alexandre Belloni (8):
  dt-bindings: mfd: atmel-tcb: convert bindings to json-schema
  dt-bindings: mfd: atmel,at91rm9200-tcb: add sama5d2 compatible
  ARM: dts: at91: sama5d2: add TCB GCLK
  clocksource/drivers/timer-atmel-tcb: rework 32khz clock selection
  clocksource/drivers/timer-atmel-tcb: fill tcb_config
  clocksource/drivers/timer-atmel-tcb: stop using the 32kHz for
    clockevents
  clocksource/drivers/timer-atmel-tcb: allow selecting first divider
  clocksource/drivers/timer-atmel-tcb: add sama5d2 support

 .../bindings/mfd/atmel,at91rm9200-tcb.yaml    | 113 ++++++++++++++++++
 .../devicetree/bindings/mfd/atmel-tcb.txt     |  56 ---------
 arch/arm/boot/dts/sama5d2.dtsi                |  12 +-
 drivers/clocksource/timer-atmel-tcb.c         | 101 +++++++++-------
 include/soc/at91/atmel_tcb.h                  |   1 +
 5 files changed, 178 insertions(+), 105 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/atmel,at91rm9200-tcb.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/atmel-tcb.txt

-- 
2.21.0
