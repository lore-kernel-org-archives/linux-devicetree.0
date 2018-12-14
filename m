From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH v2 0/2] Make STM32 interrupt controller use hwspinlock
Date: Fri, 14 Dec 2018 16:11:26 +0100
Message-ID: <20181214151128.10005-1-benjamin.gaignard@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, alexandre.torgue@st.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

From: Benjamin Gaignard <benjamin.gaignard@st.com>

This series allow to protect STM32 interrupt controller configuration registers
with a hwspinlock to avoid conflicting accesses between processors. 

version 2:
- rework hwspinlock locking sequence in stm32 irqchip to take care of the
  cases where hwspinlock node is disabled or not yet probed

Benjamin Gaignard (2):
  irqchip: stm32: protect configuration registers with hwspinlock
  ARM: dts: stm32: Add hwlock for irqchip on stm32mp157

 arch/arm/boot/dts/stm32mp157c.dtsi |   1 +
 drivers/irqchip/irq-stm32-exti.c   | 116 ++++++++++++++++++++++++++++++++-----
 2 files changed, 101 insertions(+), 16 deletions(-)

-- 
2.15.0
