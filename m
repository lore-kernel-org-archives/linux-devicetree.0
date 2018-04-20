From: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Subject: [PATCH v1 0/2] Add I2C support for STM32H743
Date: Fri, 20 Apr 2018 11:05:20 +0200
Message-ID: <1524215122-14046-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
List-Id: devicetree@vger.kernel.org

Add I2C support on STM32H743 SoC.
Activate I2C1 on STM32H743I Evaluation Board.
---
  Version history:
     v1:
        * Initial
---

Pierre-Yves MORDRET (2):
  ARM: dts: stm32: Add I2C support for STM32H743 SoC
  ARM: dts: stm32: Add I2C1 support for STM32H743I-EVAL Board

 arch/arm/boot/dts/stm32h743-pinctrl.dtsi | 10 +++++++
 arch/arm/boot/dts/stm32h743.dtsi         | 48 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32h743i-eval.dts    |  8 ++++++
 3 files changed, 66 insertions(+)

-- 
2.7.4
