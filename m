From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH v2 0/2] Add STM32MP157 discovery boards support
Date: Tue, 5 Feb 2019 10:07:03 +0100
Message-ID: <1549357625-7229-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series add support of two new discovery boards based on
STM32MP157 MPU: stm32mp157a-dk1 and stm32mp157c-dk2.

stm32mp157a-dk1 board embeds a STM32MP157a SOC with AC package (TFBGA361,
148 ios) and 512MB of DDR3. Several connections are available on this boards:
4*USB2.0, 1*USB2.0 typeC, SDcard, RJ45, HDMI, Arduino connector, ...

stm32mp157c-dk2 board complements stm32mp157a-dk1 board with a display panel
(otm8009a) and a Murata Wifi/BT combo. It embeds a STM32MP157c SOC with AC
package.

Those patches enable basic support for a kernel boot.

regards
Alex

Alexandre Torgue (2):
  ARM: dts: stm32: add initial support of stm32mp157a-dk1 board
  ARM: dts: stm32: add initial support of stm32mp157c-dk2 board

 arch/arm/boot/dts/Makefile            |  2 +
 arch/arm/boot/dts/stm32mp157a-dk1.dts | 77 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp157c-dk2.dts | 75 ++++++++++++++++++++++++++++++++++
 3 files changed, 154 insertions(+)
 create mode 100644 arch/arm/boot/dts/stm32mp157a-dk1.dts
 create mode 100644 arch/arm/boot/dts/stm32mp157c-dk2.dts

-- 
2.7.4
