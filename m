From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 0/2] Add support for DAC on stm32mp157c-ed1
Date: Wed, 9 Oct 2019 16:12:50 +0200
Message-ID: <1570630372-24579-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.torgue@st.com
Cc: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, fabrice.gasnier@st.com
List-Id: devicetree@vger.kernel.org

This series adds support for digital-to-analog converter on
stm32mp157c-ed1 board:
- define pins that can be used for DAC
- configure DAC channels to use these

Fabrice Gasnier (2):
  ARM: dts: stm32: Add DAC pins used on stm32mp157c-ed1
  ARM: dts: stm32: Add DAC support to stm32mp157c-ed1

 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 12 ++++++++++++
 arch/arm/boot/dts/stm32mp157c-ed1.dts     | 13 +++++++++++++
 2 files changed, 25 insertions(+)

-- 
2.7.4
