From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v2 07/12] ARM: imx: depend MXC debug board on 3DS machines
Date: Tue, 30 Dec 2014 00:32:10 +0100
Message-ID: <1419895935-22966-8-git-send-email-stefan@agner.ch>
References: <1419895935-22966-1-git-send-email-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1419895935-22966-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: shawn.guo@linaro.org, kernel@pengutronix.de, linux@arm.linux.org.uk, u.kleine-koenig@pengutronix.de, jason@lakedaemon.net, olof@lixom.net, arnd@arndb.de, daniel.lezcano@linaro.org, tglx@linutronix.de, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, marc.zyngier@arm.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

Depend the MXC debug board on machines which actually support it.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
This configuration appeared lonely when I enabled ARCH_MULTI_V7M.
Afaik, the selection of it only makes sense with one of the supported
boards...

 arch/arm/mach-imx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index 3c5859e..96c8eb8 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -21,6 +21,7 @@ config MXC_AVIC
 
 config MXC_DEBUG_BOARD
 	bool "Enable MXC debug board(for 3-stack)"
+	depends on CONFIG_MACH_MX27_3DS || CONFIG_MACH_MX31_3DS || CONFIG_MACH_MX35_3DS
 	help
 	  The debug board is an integral part of the MXC 3-stack(PDK)
 	  platforms, it can be attached or removed from the peripheral
-- 
2.2.1
