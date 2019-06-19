From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 0/5] Add missing vdda-supply to STM32 ADC
Date: Wed, 19 Jun 2019 14:29:53 +0200
Message-ID: <1560947398-11592-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org, alexandre.torgue@st.com
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, lars@metafoo.de, knaack.h@gmx.de, pmeerw@pmeerw.net, fabrice.gasnier@st.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add missing vdda-supply, analog power supply, to STM32 ADC. When vdda is
an independent supply, it needs to be properly turned on or off to supply
the ADC.
This series proposes fixes for the dt-bindings, IIO driver and relevant
device tree files.

Fabrice Gasnier (5):
  dt-bindings: iio: adc: stm32: add missing vdda supply
  iio: adc: stm32-adc: add missing vdda-supply
  ARM: dts: stm32: remove fixed regulator unit address on stm32429i-eval
  ARM: dts: stm32: add missing vdda-supply to adc on stm32429i-eval
  ARM: dts: stm32: add missing vdda-supply to adc on stm32h743i-eval

 .../devicetree/bindings/iio/adc/st,stm32-adc.txt   |  1 +
 arch/arm/boot/dts/stm32429i-eval.dts               | 25 +++++++++++-----------
 arch/arm/boot/dts/stm32h743i-eval.dts              |  1 +
 drivers/iio/adc/stm32-adc-core.c                   | 21 +++++++++++++++++-
 4 files changed, 35 insertions(+), 13 deletions(-)

-- 
2.7.4
