From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 13/13] ARM: STi: Ensure requested STi's SysCfg Controlled IRQs are enabled at boot
Date: Tue, 12 May 2015 13:51:50 +0100
Message-ID: <1431435110-22595-14-git-send-email-lee.jones@linaro.org>
References: <1431435110-22595-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431435110-22595-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com, devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

This driver is used to enable System Configuration Register controlled
External, CTI (Core Sight), PMU (Performance Management), and PL310 L2
Cache IRQs prior to use.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/mach-sti/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-sti/Kconfig b/arch/arm/mach-sti/Kconfig
index 3b1ac46..125865d 100644
--- a/arch/arm/mach-sti/Kconfig
+++ b/arch/arm/mach-sti/Kconfig
@@ -1,6 +1,7 @@
 menuconfig ARCH_STI
 	bool "STMicroelectronics Consumer Electronics SOCs" if ARCH_MULTI_V7
 	select ARM_GIC
+	select ST_IRQCHIP
 	select ARM_GLOBAL_TIMER
 	select PINCTRL
 	select PINCTRL_ST
-- 
1.9.1
