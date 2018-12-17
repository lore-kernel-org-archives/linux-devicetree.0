From: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH v3 0/3] Make STM32 interrupt controller use hwspinlock
Date: Mon, 17 Dec 2018 15:22:12 +0100
Message-ID: <20181217142215.17493-1-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, alexandre.torgue@st.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

This series allow to protect STM32 interrupt controller configuration registers
with a hwspinlock to avoid conflicting accesses between processors. 

version 3:
- with bindings patch

version 2:
- rework hwspinlock locking sequence in stm32 irqchip to take care of the
  cases where hwspinlock node is disabled or not yet probed

Benjamin Gaignard (3):
  dt-bindings: interrupt-controller: stm32: Document hwlock properties
  irqchip: stm32: protect configuration registers with hwspinlock
  ARM: dts: stm32: Add hwlock for irqchip on stm32mp157

 .../interrupt-controller/st,stm32-exti.txt         |   4 +
 arch/arm/boot/dts/stm32mp157c.dtsi                 |   1 +
 drivers/irqchip/irq-stm32-exti.c                   | 116 ++++++++++++++++++---
 3 files changed, 105 insertions(+), 16 deletions(-)

-- 
2.15.0
