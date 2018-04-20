From: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Subject: [PATCH v1 0/3] Append additional I2C instances and activate I2C1.
Date: Fri, 20 Apr 2018 11:05:07 +0200
Message-ID: <1524215110-13967-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
List-Id: devicetree@vger.kernel.org

This patch intends to appends 3 additional I2C instances (2, 3 and 4).
In the same time I2C1 is setup for both STM32F746 and STM32F769 Discovery
boards.
---
  Version history:
     v1:
        * Initial
---

Pierre-Yves MORDRET (3):
  ARM: dts: stm32: Append additional I2Cs for STM32F746 SoC
  ARM: dts: stm32: Add I2C1 support for STM32F769-DISCO Board
  ARM: dts: stm32: Add I2C1 support for STM32F746-DISCO Board

 arch/arm/boot/dts/stm32f746-disco.dts |  8 ++++++++
 arch/arm/boot/dts/stm32f746.dtsi      | 36 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32f769-disco.dts |  8 ++++++++
 3 files changed, 52 insertions(+)

-- 
2.7.4
