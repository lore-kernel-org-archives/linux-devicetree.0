From: <patrice.chotard@st.com>
Subject: [PATCH 0/3] Add stm32h743i-disco board
Date: Tue, 6 Jun 2017 18:13:30 +0200
Message-ID: <1496765613-697-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, alexandre.torgue@st.com, mcoquelin.stm32@gmail.com
Cc: Patrice Chotard <patrice.chotard@st.com>
List-Id: devicetree@vger.kernel.org

From: Patrice Chotard <patrice.chotard@st.com>

This series adds basic support for the stm32h743i discovery board 
based on stm32h7 MCU.

Patrice Chotard (3):
  ARM: dts: stm32h743: Add usart2_pins
  ARM: dts: stm32h743: Add usart2 support
  ARM: dts: stm32h743: Add stm32h743i-disco board

 arch/arm/boot/dts/Makefile               |  3 +-
 arch/arm/boot/dts/stm32h743-pinctrl.dtsi | 13 ++++++
 arch/arm/boot/dts/stm32h743.dtsi         |  8 ++++
 arch/arm/boot/dts/stm32h743i-disco.dts   | 74 ++++++++++++++++++++++++++++++++
 4 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/stm32h743i-disco.dts

-- 
1.9.1
