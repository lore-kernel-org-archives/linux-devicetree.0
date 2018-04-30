From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH 0/2] ARM: dts: stm32: add qspi support for stm32mp157c
Date: Mon, 30 Apr 2018 09:11:19 +0200
Message-ID: <1525072281-17472-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch series adds qspi support for stm32mp157c SoC
and its eval board.

Ludovic Barre (2):
  ARM: dts: stm32: add qspi support for stm32mp157c
  ARM: dts: stm32: add flash nor support on stm32mp157c eval board

 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 45 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp157c-ev1.dts     | 25 +++++++++++++++++
 arch/arm/boot/dts/stm32mp157c.dtsi        | 11 ++++++++
 3 files changed, 81 insertions(+)

-- 
2.7.4
