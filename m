From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 3/5] ARM: at91/dt: select DUMB_IRQ_DEMUX for all at91 SoCs
Date: Tue, 13 Jan 2015 19:46:19 +0100
Message-ID: <1421174781-4340-4-git-send-email-boris.brezillon@free-electrons.com>
References: <1421174781-4340-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421174781-4340-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>
List-Id: devicetree@vger.kernel.org

at91 SoCs need an dumb irq demuxer to gracefully support the fact that
irq1 is shared by several devices and a timer.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 arch/arm/mach-at91/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
index 2395c68..8ff2c2a 100644
--- a/arch/arm/mach-at91/Kconfig
+++ b/arch/arm/mach-at91/Kconfig
@@ -28,6 +28,7 @@ config HAVE_AT91_H32MX
 config SOC_AT91SAM9
 	bool
 	select ATMEL_AIC_IRQ
+	select DUMB_DEMUX_IRQ
 	select COMMON_CLK_AT91
 	select CPU_ARM926T
 	select GENERIC_CLOCKEVENTS
@@ -98,6 +99,7 @@ if SOC_SAM_V4_V5
 config SOC_AT91RM9200
 	bool "AT91RM9200"
 	select ATMEL_AIC_IRQ
+	select DUMB_DEMUX_IRQ
 	select COMMON_CLK_AT91
 	select CPU_ARM920T
 	select GENERIC_CLOCKEVENTS
-- 
1.9.1
