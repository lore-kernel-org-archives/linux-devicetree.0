From: <patrice.chotard@st.com>
Subject: [PATCH 0/3] ARM: dts: stm32: Fix DT dtc warnings for STM32 MCU's
Date: Tue, 7 Aug 2018 13:06:32 +0200
Message-ID: <1533639995-27047-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, alexandre.torgue@st.com, lee.jones@linaro.org
Cc: mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com, Patrice Chotard <patrice.chotard@st.com>
List-Id: devicetree@vger.kernel.org

From: Patrice Chotard <patrice.chotard@st.com>

This series fixes DT dtc warnings for following STM32 MCU's boards:
	- stm32f429i evaluation
	- stm32f429 discovery
	- stm32f469 discovery
	- stm32746g evaluation
	- stm32f746 discovery
	- stm32h743i discovery
	- stm32h743i evaluation

Patrice Chotard (3):
  ARM: dts: stm32: Fix DT dtc warnings for stm32h7
  ARM: dts: stm32: Fix DT dtc warnings for stm32f7
  ARM: dts: stm32: Fix DT dtc warnings for stm32f4

 arch/arm/boot/dts/stm32429i-eval.dts     | 11 +++--
 arch/arm/boot/dts/stm32746g-eval.dts     |  9 ++--
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi   | 30 ++++++-------
 arch/arm/boot/dts/stm32f429-disco.dts    |  7 ++-
 arch/arm/boot/dts/stm32f429-pinctrl.dtsi | 74 +++++++++++++++----------------
 arch/arm/boot/dts/stm32f429.dtsi         |  8 ++--
 arch/arm/boot/dts/stm32f469-disco.dts    | 11 +++--
 arch/arm/boot/dts/stm32f469-pinctrl.dtsi | 76 +++++++++++++++-----------------
 arch/arm/boot/dts/stm32f7-pinctrl.dtsi   | 24 +++++-----
 arch/arm/boot/dts/stm32f746-disco.dts    |  6 +--
 arch/arm/boot/dts/stm32f746.dtsi         |  8 ++--
 arch/arm/boot/dts/stm32f769-disco.dts    | 11 +++--
 arch/arm/boot/dts/stm32h743-pinctrl.dtsi | 10 ++---
 arch/arm/boot/dts/stm32h743.dtsi         |  8 ++--
 arch/arm/boot/dts/stm32h743i-disco.dts   |  2 +-
 arch/arm/boot/dts/stm32h743i-eval.dts    |  2 +-
 16 files changed, 140 insertions(+), 157 deletions(-)

-- 
1.9.1
