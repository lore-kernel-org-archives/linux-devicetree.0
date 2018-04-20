From: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Subject: [PATCH v1 0/4] Add DMAv2 and DMAMUX Support on STM32MP157C
Date: Fri, 20 Apr 2018 11:14:37 +0200
Message-ID: <1524215681-14555-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
List-Id: devicetree@vger.kernel.org

This patch adds DMAv2 and DMAMUX support on STM32MP157C with configs and device tree.
---
  Version history:
     v1:
        * Initial
---

Pierre-Yves MORDRET (4):
  ARM: configs: stm32: Add DMAv2 support on STM32MP157C machine
  ARM: configs: stm32: Add DMAMUX support on STM32MP157C
  ARM: dts: stm32: Add DMAv2 support on STM32MP157C
  ARM: dts: stm32: Add DMAMUX support on STM32MP157C

 arch/arm/boot/dts/stm32mp157c.dtsi | 44 ++++++++++++++++++++++++++++++++++++++
 arch/arm/mach-stm32/Kconfig        |  2 ++
 2 files changed, 46 insertions(+)

-- 
2.7.4
