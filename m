From: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 4/8] ARM: stm32: create dedicated kconfig for STM32 machine
Date: Tue, 31 Jan 2017 14:14:21 +0100
Message-ID: <1485868465-30446-5-git-send-email-alexandre.torgue@st.com>
References: <1485868465-30446-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485868465-30446-1-git-send-email-alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Create a dedicated Kconfig file in mach-stm32/ and move existing stm32
configs inside.

Signed-off-by: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 5fab553..e84936c 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -813,6 +813,8 @@ source "arch/arm/mach-spear/Kconfig"
 
 source "arch/arm/mach-sti/Kconfig"
 
+source "arch/arm/mach-stm32/Kconfig"
+
 source "arch/arm/mach-s3c24xx/Kconfig"
 
 source "arch/arm/mach-s3c64xx/Kconfig"
@@ -871,28 +873,6 @@ config ARCH_LPC18XX
 	  Support for NXP's LPC18xx Cortex-M3 and LPC43xx Cortex-M4
 	  high performance microcontrollers.
 
-config ARCH_STM32
-	bool "STMicrolectronics STM32"
-	depends on ARM_SINGLE_ARMV7M
-	select ARCH_HAS_RESET_CONTROLLER
-	select ARMV7M_SYSTICK
-	select CLKSRC_STM32
-	select PINCTRL
-	select RESET_CONTROLLER
-	select STM32_EXTI
-	help
-	  Support for STMicroelectronics STM32 processors.
-
-config MACH_STM32F429
-	bool "STMicrolectronics STM32F429"
-	depends on ARCH_STM32
-	default y
-
-config MACH_STM32F746
-	bool "STMicrolectronics STM32F746"
-	depends on ARCH_STM32
-	default y
-
 config ARCH_MPS2
 	bool "ARM MPS2 platform"
 	depends on ARM_SINGLE_ARMV7M
diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
new file mode 100644
index 0000000..40115fa
--- /dev/null
+++ b/arch/arm/mach-stm32/Kconfig
@@ -0,0 +1,21 @@
+config ARCH_STM32
+	bool "STMicrolectronics STM32"
+	depends on ARM_SINGLE_ARMV7M
+	select ARCH_HAS_RESET_CONTROLLER
+	select ARMV7M_SYSTICK
+	select CLKSRC_STM32
+	select PINCTRL
+	select RESET_CONTROLLER
+	select STM32_EXTI
+	help
+	  Support for STMicroelectronics STM32 processors.
+
+config MACH_STM32F429
+	bool "STMicrolectronics STM32F429"
+	depends on ARCH_STM32
+	default y
+
+config MACH_STM32F746
+	bool "STMicrolectronics STM32F746"
+	depends on ARCH_STM32
+	default y
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
