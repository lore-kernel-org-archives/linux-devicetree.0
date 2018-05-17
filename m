From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH 0/2] Add USB OTG HS support on stm32mp157c
Date: Thu, 17 May 2018 17:47:30 +0200
Message-ID: <1526572052-17155-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

This patchset adds support for USB OTG HS on stm32mp157c SoC.
It also enables USB OTG HS on stm32mp157c-ev1 board in Peripheral mode.

Amelie Delaunay (2):
  ARM: dts: stm32: add USB OTG HS support for stm32mp157c SoC
  ARM: dts: stm32: enable USB OTG HS on stm32mp157c-ev1

 arch/arm/boot/dts/stm32mp157c-ev1.dts |  7 +++++++
 arch/arm/boot/dts/stm32mp157c.dtsi    | 15 +++++++++++++++
 2 files changed, 22 insertions(+)

-- 
2.7.4
