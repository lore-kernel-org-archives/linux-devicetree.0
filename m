From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v4 06/11] ARM: unify MMU/!MMU addruart calls
Date: Fri,  3 Apr 2015 21:44:47 +0200
Message-ID: <1428090292-21693-7-git-send-email-stefan@agner.ch>
References: <1428090292-21693-1-git-send-email-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428090292-21693-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: shawn.guo@linaro.org, kernel@pengutronix.de, linux@arm.linux.org.uk, u.kleine-koenig@pengutronix.de, jason@lakedaemon.net, olof@lixom.net, arnd@arndb.de, daniel.lezcano@linaro.org, tglx@linutronix.de, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, marc.zyngier@arm.com, mcoquelin.stm32@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

Remove the needless differences between MMU/!MMU addruart calls.
This allows to use the same addruart macro on SoC level. Useful
for SoC consisting of multiple CPUs with and without MMU such as
Freescale Vybrid.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/include/debug/efm32.S | 2 +-
 arch/arm/kernel/debug.S        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/debug/efm32.S b/arch/arm/include/debug/efm32.S
index 2265a19..660fa1e 100644
--- a/arch/arm/include/debug/efm32.S
+++ b/arch/arm/include/debug/efm32.S
@@ -16,7 +16,7 @@
 
 #define	UARTn_TXDATA		0x0034
 
-		.macro	addruart, rx, tmp
+		.macro	addruart, rx, tmp, tmp2
 		ldr	\rx, =(CONFIG_DEBUG_UART_PHYS)
 
 		/*
diff --git a/arch/arm/kernel/debug.S b/arch/arm/kernel/debug.S
index 78c91b5..ea9646c 100644
--- a/arch/arm/kernel/debug.S
+++ b/arch/arm/kernel/debug.S
@@ -35,7 +35,7 @@
 
 #else /* !CONFIG_MMU */
 		.macro	addruart_current, rx, tmp1, tmp2
-		addruart	\rx, \tmp1
+		addruart	\rx, \tmp1, \tmp2
 		.endm
 
 #endif /* CONFIG_MMU */
-- 
2.3.5
