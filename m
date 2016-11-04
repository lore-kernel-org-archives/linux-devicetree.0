From: <gabriel.fernandez@st.com>
Subject: [PATCH 0/2] STM32F4 Enable RTC & QSPI clocks
Date: Fri, 4 Nov 2016 09:52:55 +0100
Message-ID: <1478249577-25999-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, gabriel.fernandez@st.com
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez@st.com>

This patch-set enables RTC & QSPI clocks.

Gabriel Fernandez (2):
  ARM: dts: stm32f429: add LSI and LSE clocks
  ARM: dts: stm32f429: Add QSPI clock

 arch/arm/boot/dts/stm32f429.dtsi      | 18 ++++++++++++++++++
 arch/arm/boot/dts/stm32f469-disco.dts |  4 ++++
 2 files changed, 22 insertions(+)

-- 
1.9.1
