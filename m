From: Alexandre TORGUE <alexandre.torgue@st.com>
Subject: [PATCH 7/8] ARM: Kconfig: Introduce MACH_STM32F469 flag
Date: Fri, 27 Jan 2017 17:15:20 +0100
Message-ID: <1485533721-9019-8-git-send-email-alexandre.torgue@st.com>
References: <1485533721-9019-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1485533721-9019-1-git-send-email-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>, Patrice Chotard <patrice.chotard@st.com>, lee.jones@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch introduces the MACH_STM32F469 to make possible to only select
STM32F469 pinctrl driver

By default, all the MACH_STM32Fxxx flags will be set with STM32 defconfig.

Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 5fab553..f54402c 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -888,6 +888,11 @@ config MACH_STM32F429
 	depends on ARCH_STM32
 	default y
 
+config MACH_STM32F469
+	bool "STMicrolectronics STM32F469"
+	depends on ARCH_STM32
+	default y
+
 config MACH_STM32F746
 	bool "STMicrolectronics STM32F746"
 	depends on ARCH_STM32
-- 
1.9.1
