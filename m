From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 0/3] STM32 ADC analog switches supply control
Date: Wed, 12 Jun 2019 09:24:33 +0200
Message-ID: <1560324276-681-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org, alexandre.torgue@st.com
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, lars@metafoo.de, knaack.h@gmx.de, pmeerw@pmeerw.net, fabrice.gasnier@st.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series adds support for SYSCFG bits that control ADC analog switches
supply on STM32MP1 and STM32H7.

The ADC inputs are multiplexed with analog switches which have reduced
performances when their supply is below 2.7V. Analog switches supply
can be controlled using SYSCFG bits, to reach full ADC performance.

Fabrice Gasnier (3):
  dt-bindings: iio: adc: stm32: add analog switches supply control
  iio: adc: stm32-adc: add analog switches supply control
  ARM: dts: stm32: add ADC analog switches syscfg on stm32mp157c

 .../devicetree/bindings/iio/adc/st,stm32-adc.txt   |   6 +
 arch/arm/boot/dts/stm32mp157c.dtsi                 |   1 +
 drivers/iio/adc/stm32-adc-core.c                   | 232 ++++++++++++++++++++-
 3 files changed, 237 insertions(+), 2 deletions(-)

-- 
2.7.4
