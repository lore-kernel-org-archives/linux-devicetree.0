From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 0/3] Enable ADC on STM32
Date: Fri, 2 Dec 2016 14:56:59 +0100
Message-ID: <1480687022-12851-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.torgue@st.com, mcoquelin.stm32@gmail.com, linux@armlinux.org.uk, mark.rutland@arm.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enable minimal configuration and device tree to support ADC on STM32,
using ADC driver: https://lwn.net/Articles/706445/

Simple test on stm32f429i-eval board, using on-board potentiometer:
- cd /sys/bus/iio/devices/iio\:device0/
- cat in_voltage8_raw

Fabrice Gasnier (3):
  ARM: configs: stm32: enable ADC driver
  ARM: dts: stm32: Add ADC support to stm32f429
  ARM: dts: stm32: enable ADC on stm32f429i-eval board

 arch/arm/boot/dts/stm32429i-eval.dts | 25 ++++++++++++++++++
 arch/arm/boot/dts/stm32f429.dtsi     | 49 ++++++++++++++++++++++++++++++++++++
 arch/arm/configs/stm32_defconfig     |  5 ++++
 3 files changed, 79 insertions(+)

-- 
1.9.1
