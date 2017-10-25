From: Ludovic Barre <ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v2 0/9] irqchip: stm32: add stm32h7 support
Date: Wed, 25 Oct 2017 19:10:56 +0200
Message-ID: <1508951465-17152-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>

This series adds:
-Management of multi-bank of external interrupts
stm32h7 has up to 96 inputs (3 banks of  32 inputs).
-Fix initial value after cold/hot boot (wakeup issue).

Changes v2:
-Remove irq_mask and adds const on struct stm32_exti_bank
-Add wrapper functions pending and ack
-Replace BITS_PER_LONG by IRQS_PER_BANK
-Fill commit message on
"ARM: dts: stm32: add support of exti on stm32h743"
-Add system config bank for stm32h7

Ludovic Barre (9):
  irqchip: stm32: select GENERIC_IRQ_CHIP
  irqchip: stm32: add multi-bank management
  dt-bindings: interrupt-controllers: add compatible string for stm32h7
  irqchip: stm32: add stm32h7 support
  irqchip: stm32: fix initial values
  irqchip: stm32: move the wakeup on interrupt mask
  ARM: dts: stm32: add exti support for stm32h743
  ARM: dts: stm32: add system config bank node for stm32h743
  ARM: dts: stm32: add support of exti on stm32h743 pinctrl

 .../interrupt-controller/st,stm32-exti.txt         |   4 +-
 arch/arm/boot/dts/stm32h743-pinctrl.dtsi           |  24 +++
 arch/arm/boot/dts/stm32h743.dtsi                   |  13 ++
 drivers/irqchip/Kconfig                            |   1 +
 drivers/irqchip/irq-stm32-exti.c                   | 208 ++++++++++++++++-----
 5 files changed, 200 insertions(+), 50 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
