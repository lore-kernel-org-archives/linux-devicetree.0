From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [RESEND PATCH 0/3] Add support for STM32 vrefbuf regulator
Date: Mon, 28 Aug 2017 14:58:50 +0200
Message-ID: <1503925133-30722-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org, alexandre.torgue@st.com
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, linux@armlinux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some STM32 devices embed a voltage reference buffer which can be used as
voltage reference for ADCs, DACs and also as voltage reference
for external components through the dedicated VREF+ pin.

This patchset adds vrefbuf regulator driver, device tree bindings and
vrefbuf device tree node for STM32H7 SoC.

Fabrice Gasnier (3):
  dt-bindings: regulator: Add STM32 Voltage Reference Buffer
  regulator: Add support for stm32-vrefbuf
  ARM: dts: stm32: add vrefbuf to stm32h743

 .../bindings/regulator/st,stm32-vrefbuf.txt        |  20 ++
 arch/arm/boot/dts/stm32h743.dtsi                   |   9 +
 drivers/regulator/Kconfig                          |  12 ++
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/stm32-vrefbuf.c                  | 215 +++++++++++++++++++++
 5 files changed, 257 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt
 create mode 100644 drivers/regulator/stm32-vrefbuf.c

-- 
1.9.1
