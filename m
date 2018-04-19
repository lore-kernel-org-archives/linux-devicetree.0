From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH 0/2] Add STM32 RTC to stm32mp157c
Date: Thu, 19 Apr 2018 16:35:23 +0200
Message-ID: <1524148525-25209-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

This series adds support for STM32 RTC to stm32mp157c SoC and enable it
on stm32mp157c-ed1 board.

Amelie Delaunay (2):
  ARM: dts: stm32: add RTC support to stm32mp157c
  ARM: dts: stm32: enable RTC on stm32mp157c-ed1

 arch/arm/boot/dts/stm32mp157c-ed1.dts | 4 ++++
 arch/arm/boot/dts/stm32mp157c.dtsi    | 9 +++++++++
 2 files changed, 13 insertions(+)

-- 
2.7.4
