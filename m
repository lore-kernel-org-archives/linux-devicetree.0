From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 0/4] ARM: dts: stm32: Add fixes to be compliant with DT validation tool
Date: Mon, 7 Oct 2019 16:33:58 +0200
Message-ID: <20191007143402.13266-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series updates STM32 DT files in order to clean some issues seen during
STM32 device trees validation ("make dtbs_check"). 

Regards
Alex


Alexandre Torgue (4):
  ARM: dts: stm32: fix memory nodes to match with DT validation tool
  ARM: dts: stm32: fix joystick node on stm32f746 and stm32mp157c eval
    boards
  ARM: dts: stm32: remove usb phy-names entries on stm32mp157c-ev1
  ARM: dts: stm32: fix regulator-sd_switch node on stm32mp157c-ed1 board

 arch/arm/boot/dts/stm32429i-eval.dts   | 2 +-
 arch/arm/boot/dts/stm32746g-eval.dts   | 3 +--
 arch/arm/boot/dts/stm32f429-disco.dts  | 2 +-
 arch/arm/boot/dts/stm32f469-disco.dts  | 2 +-
 arch/arm/boot/dts/stm32f746-disco.dts  | 2 +-
 arch/arm/boot/dts/stm32f769-disco.dts  | 2 +-
 arch/arm/boot/dts/stm32h743i-disco.dts | 2 +-
 arch/arm/boot/dts/stm32h743i-eval.dts  | 2 +-
 arch/arm/boot/dts/stm32mp157a-dk1.dts  | 1 +
 arch/arm/boot/dts/stm32mp157c-ed1.dts  | 3 ++-
 arch/arm/boot/dts/stm32mp157c-ev1.dts  | 3 ---
 11 files changed, 11 insertions(+), 13 deletions(-)

-- 
2.17.1
