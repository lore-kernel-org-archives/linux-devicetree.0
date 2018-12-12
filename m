From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH v2 0/3] mfd: syscon: Add optional clock support needed on stm32
Date: Wed, 12 Dec 2018 09:48:12 +0100
Message-ID: <1544604495-4082-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, alexandre.torgue@st.com
Cc: mcoquelin.stm32@gmail.com, arnd@arndb.de, mark.rutland@arm.com, gabriel.fernandez@st.com, fabrice.gasnier@st.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

STM32 syscfg registers are accessed using syscon. It needs syscfg clock
to be enabled while accessing registers.
This adds support for optional clock on syscon, and the relevant clock
in stm32mp157 device tree.

Changes in v2:
- move clocks to specific bindings using syscon as per Rob's comment

Fabrice Gasnier (3):
  dt-bindings: stm32: syscon: add clock support
  mfd: syscon: Add optional clock support
  ARM: dts: stm32: Add clock on stm32mp157c syscfg

 .../devicetree/bindings/arm/stm32/stm32-syscon.txt    |  2 ++
 arch/arm/boot/dts/stm32mp157c.dtsi                    |  1 +
 drivers/mfd/syscon.c                                  | 19 +++++++++++++++++++
 3 files changed, 22 insertions(+)

-- 
1.9.1
