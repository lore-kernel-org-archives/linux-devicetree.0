From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH  0/7] ARM: dts: stm32: add support of sdmmc1 on stm32
Date: Fri, 1 Mar 2019 09:47:41 +0100
Message-ID: <1551430068-9456-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch series adds support of sdmmc1 on:
-stm32h743i (boards: eval, disco)
-stm32mp1 (boards: ed1, dk1)

Ludovic Barre (7):
  ARM: stm32: add AMBA support for stm32 family
  ARM: dts: stm32: add sdmmc1 support on stm32h743
  ARM: dts: stm32: add sdmmc1 support on stm32h743i eval board
  ARM: dts: stm32: add sdmmc1 support on stm32h743i disco board
  ARM: dts: stm32: add sdmmc1 support on stm32mp157c
  ARM: dts: stm32: add sdmmc1 support on stm32mp157c ed1 board
  ARM: dts: stm32: add sdmmc1 support on stm32mp157a dk1 board

 arch/arm/boot/dts/stm32h743-pinctrl.dtsi  | 68 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32h743.dtsi          | 14 +++++++
 arch/arm/boot/dts/stm32h743i-disco.dts    | 20 +++++++++
 arch/arm/boot/dts/stm32h743i-eval.dts     | 23 ++++++++++-
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 68 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp157a-dk1.dts     | 20 +++++++++
 arch/arm/boot/dts/stm32mp157c-ed1.dts     | 37 +++++++++++++++++
 arch/arm/boot/dts/stm32mp157c.dtsi        | 14 +++++++
 arch/arm/mach-stm32/Kconfig               |  5 +--
 9 files changed, 264 insertions(+), 5 deletions(-)

-- 
2.7.4
