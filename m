From: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Subject: [PATCH v2 0/3] Add Vivante GPU support on STM32MP157c
Date: Wed, 10 Apr 2019 12:02:25 +0200
Message-ID: <1554890548-24448-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
List-Id: devicetree@vger.kernel.org

Add and enable Vivante GPU on stm32mp157c for ED1, DK1 and DK2 boards.
---
  Version history:
    v2:
       * move GPU reserved memeory out of bottom DDR to let free this area for
         U-Boot
    v1:
       * Initial
---
Pierre-Yves MORDRET (3):
  ARM: dts: stm32: Add Vivante GPU support on STM32MP157c
  ARM: dts: stm32: enable Vivante GPU support on stm32mp157c-ed1 board
  ARM: dts: stm32: enable Vivante GPU support on stm32mp157a-dk1 board

 arch/arm/boot/dts/stm32mp157a-dk1.dts | 16 ++++++++++++++++
 arch/arm/boot/dts/stm32mp157c-ed1.dts | 16 ++++++++++++++++
 arch/arm/boot/dts/stm32mp157c.dtsi    | 10 ++++++++++
 3 files changed, 42 insertions(+)

-- 
2.7.4
