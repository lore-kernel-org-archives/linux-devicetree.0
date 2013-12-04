From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 6/7] clk: highbank: allow enabling by user
Date: Wed,  4 Dec 2013 17:35:26 -0600
Message-ID: <1386200127-23143-7-git-send-email-robherring2@gmail.com>
References: <1386200127-23143-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1386200127-23143-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mike Turquette <mturquette@linaro.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

Allow Calxeda clock driver to be enabled by the user independent of
ARCH_HIGHBANK.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
Cc: Mike Turquette <mturquette@linaro.org>
---
 arch/arm/mach-highbank/Kconfig | 1 +
 drivers/clk/Kconfig            | 5 +++++
 drivers/clk/Makefile           | 2 +-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-highbank/Kconfig b/arch/arm/mach-highbank/Kconfig
index 0aded64..64dba0e 100644
--- a/arch/arm/mach-highbank/Kconfig
+++ b/arch/arm/mach-highbank/Kconfig
@@ -15,6 +15,7 @@ config ARCH_HIGHBANK
 	select ARM_TIMER_SP804
 	select CACHE_L2X0
 	select COMMON_CLK
+	select COMMON_CLK_CALXEDA
 	select CPU_V7
 	select GENERIC_CLOCKEVENTS
 	select HAVE_ARM_SCU
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 5c51115..e395e4f 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -49,6 +49,11 @@ config COMMON_CLK_VERSATILE
 	  - RealView PB1176, EB, PB11MP and PBX
 	  - Versatile Express
 
+config COMMON_CLK_CALXEDA
+	bool "Clock driver for Calxeda platforms"
+	---help---
+          Clock driver for Calxeda ECX based platforms.
+
 config COMMON_CLK_MAX77686
 	tristate "Clock driver for Maxim 77686 MFD"
 	depends on MFD_MAX77686
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 7a10bc9..6010bdb 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -13,7 +13,7 @@ obj-$(CONFIG_COMMON_CLK)	+= clk-composite.o
 obj-$(CONFIG_ARCH_BCM2835)	+= clk-bcm2835.o
 obj-$(CONFIG_ARCH_EFM32)	+= clk-efm32gg.o
 obj-$(CONFIG_ARCH_NOMADIK)	+= clk-nomadik.o
-obj-$(CONFIG_ARCH_HIGHBANK)	+= clk-highbank.o
+obj-$(CONFIG_COMMON_CLK_CALXEDA) += clk-highbank.o
 obj-$(CONFIG_ARCH_NSPIRE)	+= clk-nspire.o
 obj-$(CONFIG_ARCH_MXS)		+= mxs/
 obj-$(CONFIG_ARCH_SOCFPGA)	+= socfpga/
-- 
1.8.3.2
