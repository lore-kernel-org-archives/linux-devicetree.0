From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 0/3] Enable DMA on STM32 MCU based on cortex-M7
Date: Tue, 12 Dec 2017 19:02:23 +0100
Message-ID: <1513101746-18030-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series enable DMA on several STM32 MCU based on cortex-M7.
To make it possible, a dedicated dma pool memory area has to be
created. This patchset activate also ARM_MPU flag which will configure 
MPU (Memory Protection Unit) according to devicetree information (mem
and dma-pool). Note that on cortex-M7 DMA has to use a NO cache-able 
memory region.

Regards
Alex


Alexandre Torgue (3):
  ARM: dts: stm32: add DMA memory pool on MCU which embed a cortex-M7
  ARM: configs: stm32: Enable ARM_MPU
  ARM: dts: stm32: enable dma on MCU which embed a cortex-M7

 arch/arm/boot/dts/stm32746g-eval.dts   | 21 +++++++++++++++++++++
 arch/arm/boot/dts/stm32f769-disco.dts  | 21 +++++++++++++++++++++
 arch/arm/boot/dts/stm32h743i-disco.dts | 21 +++++++++++++++++++++
 arch/arm/boot/dts/stm32h743i-eval.dts  | 21 +++++++++++++++++++++
 arch/arm/configs/stm32_defconfig       |  1 +
 5 files changed, 85 insertions(+)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
