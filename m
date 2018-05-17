From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH 0/3] Add STM32 SPI support on stm32mp157c
Date: Thu, 17 May 2018 16:21:41 +0200
Message-ID: <1526566904-24514-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

This patch adds STM32 SPI support on stm32mp157c SoC.
SPI1, available on GPIO expansion connector, is kept disabled, so these
pins can be used as GPIOs by default.

Amelie Delaunay (3):
  ARM: dts: stm32: add STM32 SPI support on stm32mp157c
  ARM: dts: stm32: add SPI1 support on stm32mp157c-ev1
  ARM: multi_v7_defconfig: enable STM32 SPI

 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 16 +++++-
 arch/arm/boot/dts/stm32mp157c-ev1.dts     |  6 +++
 arch/arm/boot/dts/stm32mp157c.dtsi        | 84 +++++++++++++++++++++++++++++++
 arch/arm/configs/multi_v7_defconfig       |  1 +
 4 files changed, 106 insertions(+), 1 deletion(-)

-- 
2.7.4
