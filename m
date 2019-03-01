From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH  1/7] ARM: stm32: add AMBA support for stm32 family
Date: Fri, 1 Mar 2019 09:47:42 +0100
Message-ID: <1551430068-9456-2-git-send-email-ludovic.Barre@st.com>
References: <1551430068-9456-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551430068-9456-1-git-send-email-ludovic.Barre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch enables AMBA support for stm32 family.
stm32 family embeds different amba pl180 variants.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 arch/arm/mach-stm32/Kconfig | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index 713c068..651bdf4 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -4,6 +4,7 @@ menuconfig ARCH_STM32
 	select HAVE_ARM_ARCH_TIMER if ARCH_MULTI_V7
 	select ARM_GIC if ARCH_MULTI_V7
 	select ARM_PSCI if ARCH_MULTI_V7
+	select ARM_AMBA
 	select ARCH_HAS_RESET_CONTROLLER
 	select CLKSRC_STM32
 	select PINCTRL
@@ -18,22 +19,18 @@ if ARM_SINGLE_ARMV7M
 
 config MACH_STM32F429
 	bool "STMicroelectronics STM32F429"
-	select ARM_AMBA
 	default y
 
 config MACH_STM32F469
 	bool "STMicroelectronics STM32F469"
-	select ARM_AMBA
 	default y
 
 config MACH_STM32F746
 	bool "STMicroelectronics STM32F746"
-	select ARM_AMBA
 	default y
 
 config MACH_STM32F769
 	bool "STMicroelectronics STM32F769"
-	select ARM_AMBA
 	default y
 
 config MACH_STM32H743
-- 
2.7.4
