From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 4/5] ARM: at91/dt: select VIRT_IRQ_DEMUX for all at91 SoCs
Date: Thu, 29 Jan 2015 11:33:39 +0100
Message-ID: <1422527620-8308-5-git-send-email-boris.brezillon@free-electrons.com>
References: <1422527620-8308-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422527620-8308-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Older at91 SoCs need a virtual irq demuxer to gracefully support the
fact that irq1 is shared by several devices and a timer.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
---
 arch/arm/mach-at91/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
index 2395c68..ee4350d 100644
--- a/arch/arm/mach-at91/Kconfig
+++ b/arch/arm/mach-at91/Kconfig
@@ -28,6 +28,7 @@ config HAVE_AT91_H32MX
 config SOC_AT91SAM9
 	bool
 	select ATMEL_AIC_IRQ
+	select VIRT_DEMUX_IRQ
 	select COMMON_CLK_AT91
 	select CPU_ARM926T
 	select GENERIC_CLOCKEVENTS
@@ -98,6 +99,7 @@ if SOC_SAM_V4_V5
 config SOC_AT91RM9200
 	bool "AT91RM9200"
 	select ATMEL_AIC_IRQ
+	select VIRT_DEMUX_IRQ
 	select COMMON_CLK_AT91
 	select CPU_ARM920T
 	select GENERIC_CLOCKEVENTS
-- 
1.9.1
