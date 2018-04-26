From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH 00/11] irqchip: stm32: add exti support for stm32mp157c
Date: Thu, 26 Apr 2018 18:18:23 +0200
Message-ID: <1524759514-12392-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Gerald BAEZA <gerald.baeza@st.com>, Loic PALLARDY <loic.pallardy@st.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

Exti controller has been differently integrated on stm32mp1 SoC.
A parent irq has only one external interrupt Vs stm32f4: one parent irq
can have some external interrupts. On stm32mp1 hierachy domain could be used.
Handlers are call by parent, each parent interrupt could be masked and
unmasked according to the needs.

Introduces chips/host/driver data structure to support different
stm32 exti controllers variant and regroup common functions which could
be reused by variants.

Ludovic Barre (10):
  irqchip: stm32: checkpatch fix
  irqchip: stm32: add falling pending register support
  irqchip: stm32: add suspend support
  irqchip: stm32: add host and driver data structures
  irqchip: stm32: prepare common functions
  irqchip: stm32: add stm32mp1 support with hierarchy domain
  irqchip: stm32: add suspend/resume support for hierarchy domain
  pinctrl: stm32: add irq_eoi for stm32gpio irqchip
  ARM: dts: stm32: add exti support for stm32mp157c
  ARM: dts: stm32: add exti support to stm32mp157 pinctrl

radek (1):
  irqchip: stm32: Optimizes and cleans up stm32-exti irq_domain

 .../interrupt-controller/st,stm32-exti.txt         |   3 +
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi          |   4 +
 arch/arm/boot/dts/stm32mp157c.dtsi                 |   7 +
 drivers/irqchip/irq-stm32-exti.c                   | 683 ++++++++++++++++++---
 drivers/pinctrl/stm32/pinctrl-stm32.c              |  13 +-
 5 files changed, 612 insertions(+), 98 deletions(-)

-- 
2.7.4
