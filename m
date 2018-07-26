From: <patrice.chotard@st.com>
Subject: [PATCH 0/4] Remove cd-inverted property for STM32Fx boards
Date: Thu, 26 Jul 2018 09:19:52 +0200
Message-ID: <1532589596-22181-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, alexandre.torgue@st.com, lee.jones@linaro.org
Cc: mcoquelin.stm32@gmail.com, Patrice Chotard <patrice.chotard@st.com>
List-Id: devicetree@vger.kernel.org

From: Patrice Chotard <patrice.chotard@st.com>

This series remove cd-inverted property from STM32Fx boards DT files.
As GPIOS are used for card detect, the polarity can be indicated using 
GPIO_ACTIVE_(HIGH|LOW), so cd-inverted becomes useless.

Patrice Chotard (4):
  ARM: dts: stm32: Remove cd-inverted property for stm32429i-eval
  ARM: dts: stm32: Remove cd-inverted property for stm32f469-disco
  ARM: dts: stm32: Remove cd-inverted property for stm32f769-disco
  ARM: dts: stm32: Remove cd-inverted property for stm32f746-disco

 arch/arm/boot/dts/stm32429i-eval.dts  | 3 +--
 arch/arm/boot/dts/stm32f469-disco.dts | 3 +--
 arch/arm/boot/dts/stm32f746-disco.dts | 3 +--
 arch/arm/boot/dts/stm32f769-disco.dts | 3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

-- 
1.9.1
