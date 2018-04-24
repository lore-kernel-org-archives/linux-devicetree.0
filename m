From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH v2 0/4] Add STM32 USBPHYC to stm32mp157c
Date: Tue, 24 Apr 2018 11:41:41 +0200
Message-ID: <1524562905-19361-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

This series adds support for STM32 USB PHY Controller (USBPHYC) to
stm32mp157c SoC and enables it on stm32mp157c-ev1 board.

---
Changes in v2:
* Add reset dt-bindings include
* Add fixed regulators
* Enable CONFIG_PHY_STM32_USBPHYC in multi_v7_defconfig

Amelie Delaunay (4):
  ARM: dts: stm32: add USBPHYC support to stm32mp157c
  ARM: dts: stm32: add supplies to usbphyc ports on stm32mp157c-ed1
  ARM: dts: stm32: enable USBPHYC on stm32mp157c-ev1
  ARM: multi_v7_defconfig: enable STM32 USB PHY Controller (USBPHYC)

 arch/arm/boot/dts/stm32mp157c-ed1.dts | 36 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp157c-ev1.dts |  5 +++++
 arch/arm/boot/dts/stm32mp157c.dtsi    | 21 ++++++++++++++++++++
 arch/arm/configs/multi_v7_defconfig   |  1 +
 4 files changed, 63 insertions(+)

-- 
2.7.4
