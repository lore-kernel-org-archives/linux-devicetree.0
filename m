From: <gabriel.fernandez@st.com>
Subject: [PATCH v3 0/4] Add STM32 Reset Driver
Date: Fri, 22 Jul 2016 11:37:46 +0200
Message-ID: <1469180270-5446-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, patrice.chotard@st.com, alexandre.torgue@st.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Gabriel Fernandez <gabriel.fernandez@st.com>
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez@st.com>

v3:
 - Use the builtin for the register

v2:
 - switch to the non-relaxed variants
 - describe dt-binfings in one place

The STM32 MCUs family IPs can be reset by accessing some registers
from the RCC block.

Gabriel Fernandez (1):
  ARM: dts: stm32f429: add missing #reset-cells of rcc

Maxime Coquelin (3):
  dt-bindings: mfd: Add STM32F4 RCC numeric constants into DT include
    file
  dt-bindings: Document the STM32 reset bindings
  drivers: reset: Add STM32 reset driver

 .../devicetree/bindings/clock/st,stm32-rcc.txt     |  42 ++++++--
 .../devicetree/bindings/reset/st,stm32-rcc.txt     |   6 ++
 arch/arm/boot/dts/stm32f429.dtsi                   |   1 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-stm32.c                        | 108 +++++++++++++++++++++
 include/dt-bindings/mfd/stm32f4-rcc.h              |  98 +++++++++++++++++++
 6 files changed, 249 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
 create mode 100644 drivers/reset/reset-stm32.c
 create mode 100644 include/dt-bindings/mfd/stm32f4-rcc.h

-- 
1.9.1
