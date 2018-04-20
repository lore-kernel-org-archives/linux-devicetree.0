From: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Subject: [PATCH v1 0/2] Add MDMA Support on STM32MP157C
Date: Fri, 20 Apr 2018 11:15:05 +0200
Message-ID: <1524215707-14642-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
List-Id: devicetree@vger.kernel.org

This patch adds MDMA support on STM32MP157C with configs and device tree.
---
  Version history:
     v1:
        * Initial
---

Pierre-Yves MORDRET (2):
  ARM: configs: stm32: Add MDMA support on STM32MP157C
  ARM: dts: stm32: Add MDMA support on STM32MP157C

 arch/arm/boot/dts/stm32mp157c.dtsi | 10 ++++++++++
 arch/arm/mach-stm32/Kconfig        |  1 +
 2 files changed, 11 insertions(+)

-- 
2.7.4
