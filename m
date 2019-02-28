From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH v2 0/6] Add nvmem support on STM32
Date: Thu, 28 Feb 2019 11:19:50 +0100
Message-ID: <1551349196-8956-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, alexandre.torgue@st.com
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, lionel.debieve@st.com, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Non volatile memory area is available on STM32. It contains various
factory programmed information such as unique device ID, analog calibration...
This patchset adds:
- NVMEM support to access stm32 data cells
- helper to read 16 bits cells.

---
Changes in v2:
- update "st,stm32f4-otp" compatible as discussed with Rob
- add stm32f429 dts
- add core helper to read 16 bits cells

Fabrice Gasnier (6):
  dt-bindings: nvmem: Add STM32 factory-programmed romem
  nvmem: Add driver for STM32 factory-programmed read only mem
  nvmem: stm32: add support for STM32MP15 BSEC to control OTP data
  nvmem: core: add nvmem_cell_read_u16
  ARM: dts: stm32: Add romem and temperature calibration on stm32mp157c
  ARM: dts: stm32: Add romem and temperature calibration on stm32f429

 .../devicetree/bindings/nvmem/st,stm32-romem.txt   |  31 ++++
 arch/arm/boot/dts/stm32f429.dtsi                   |  13 ++
 arch/arm/boot/dts/stm32mp157c.dtsi                 |  13 ++
 drivers/nvmem/Kconfig                              |  10 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/core.c                               |  37 ++++
 drivers/nvmem/stm32-romem.c                        | 202 +++++++++++++++++++++
 include/linux/nvmem-consumer.h                     |   7 +
 8 files changed, 315 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt
 create mode 100644 drivers/nvmem/stm32-romem.c

-- 
2.7.4
