From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 0/4] Add STM32 timers to stm32mp157c
Date: Tue, 17 Apr 2018 15:45:26 +0200
Message-ID: <1523972730-29240-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.torgue@st.com, robh+dt@kernel.org
Cc: mcoquelin.stm32@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, fabrice.gasnier@st.com
List-Id: devicetree@vger.kernel.org

This series adds support for STM32 timers to stm32mp157c. These
timers can act PWM, trigger and/or encoder.
Populate stm32mp157c SOC and ed1/ev1 boards.

Fabrice Gasnier (4):
  ARM: dts: stm32: add timers support to stm32mp157c
  ARM: dts: stm32: add PWM pins used on stm32mp157c-ev1 board
  ARM: dts: stm32: add PWM and triggers on stm32mp157c-ev1 board
  ARM: dts: stm32: enable timer trigger 6 on stm32mp157c-ed1

 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi |  27 +++
 arch/arm/boot/dts/stm32mp157c-ed1.dts     |   7 +
 arch/arm/boot/dts/stm32mp157c-ev1.dts     |  36 ++++
 arch/arm/boot/dts/stm32mp157c.dtsi        | 283 ++++++++++++++++++++++++++++++
 4 files changed, 353 insertions(+)

-- 
1.9.1
