From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 0/3] mfd: syscon: Add optional clock support needed on stm32
Date: Tue, 27 Nov 2018 17:48:14 +0100
Message-ID: <1543337297-21873-1-git-send-email-fabrice.gasnier@st.com>
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

Fabrice Gasnier (3):
  dt-bindings: mfd: syscon: Add optional clock support
  mfd: syscon: Add optional clock support
  ARM: dts: stm32: Add clock on stm32mp157c syscfg

 Documentation/devicetree/bindings/mfd/syscon.txt |  1 +
 arch/arm/boot/dts/stm32mp157c.dtsi               |  1 +
 drivers/mfd/syscon.c                             | 19 +++++++++++++++++++
 3 files changed, 21 insertions(+)

-- 
1.9.1
