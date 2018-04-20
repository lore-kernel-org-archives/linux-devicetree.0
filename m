From: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Subject: [PATCH v1 0/5] Add I2C Support on STM32MP157C
Date: Fri, 20 Apr 2018 11:17:49 +0200
Message-ID: <1524215874-15093-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, Marek Szyprowski <m.szyprowski@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Marc Zyngier <marc.zyngier@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Yangbo Lu <yangbo.lu@nxp.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
List-Id: devicetree@vger.kernel.org

This patch adds I2C support on STM32MP157C with configs and device tree.
In the same way I2C4 is enabled for STM32MP157C ED1 Daughter bord.
I2C2/5 is enabled on STM32MP157C EV1 Daughter board on Evaluation board.
---
  Version history:
     v1:
        * Initial
---

Pierre-Yves MORDRET (5):
  ARM: configs: multi_v7: Add I2C support
  ARM: dts: stm32: Add I2C support for STM32MP157C SoC
  ARM: dts: stm32: Add I2Cs pin control on STM32MP157C
  ARM: dts: stm32: Add I2C4 support for STM32MP157C-ED1
  ARM: dts: stm32: Add I2C2/5 support for STM32MP157C-EV1

 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 40 ++++++++++++++++
 arch/arm/boot/dts/stm32mp157c-ed1.dts     |  8 ++++
 arch/arm/boot/dts/stm32mp157c-ev1.dts     | 17 +++++++
 arch/arm/boot/dts/stm32mp157c.dtsi        | 77 +++++++++++++++++++++++++++++++
 arch/arm/configs/multi_v7_defconfig       |  1 +
 5 files changed, 143 insertions(+)

-- 
2.7.4
