From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 0/3] Add support for ADC on stm32mp157a-dk1
Date: Fri, 13 Sep 2019 16:34:37 +0200
Message-ID: <1568385280-2633-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.torgue@st.com
Cc: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, fabrice.gasnier@st.com
List-Id: devicetree@vger.kernel.org

This series adds support for ADC on stm32mp157a-dk1 board:
- enable vrefbuf regulator used as reference voltage
- define ADC pins for AIN connector and USB Type-C CC pins
- configure ADC1 and ADC2 to use these

Fabrice Gasnier (3):
  ARM: dts: stm32: Enable VREFBUF on stm32mp157a-dk1
  ARM: dts: stm32: add ADC pins used on stm32mp157a-dk1
  ARM: dts: stm32: enable ADC support on stm32mp157a-dk1

 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 16 +++++++++++++++
 arch/arm/boot/dts/stm32mp157a-dk1.dts     | 34 +++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

-- 
2.7.4
