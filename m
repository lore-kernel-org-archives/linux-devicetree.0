From: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v8 10/11] ARM: brcmstb: select GISB arbiter and interrupt drivers
Date: Mon, 21 Jul 2014 14:08:05 -0700
Message-ID: <1405976886-27807-11-git-send-email-computersforpeace@gmail.com>
References: <1405976886-27807-1-git-send-email-computersforpeace@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1405976886-27807-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Matt Porter <mporter@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Gregory Fong <gregory.0xf0@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm/mach-bcm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
index 9782e8d80647..58c01aed9752 100644
--- a/arch/arm/mach-bcm/Kconfig
+++ b/arch/arm/mach-bcm/Kconfig
@@ -95,6 +95,8 @@ config ARCH_BRCMSTB
 	select HAVE_SMP
 	select HAVE_ARM_ARCH_TIMER
 	select POWER_RESET_BRCMSTB
+	select BRCMSTB_GISB_ARB
+	select BRCMSTB_L2_IRQ
 	help
 	  Say Y if you intend to run the kernel on a Broadcom ARM-based STB
 	  chipset.
-- 
1.9.1
