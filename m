From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH v3 3/4] arm: pxa: add CLKSRC_OF dependency
Date: Mon, 14 Jul 2014 18:52:03 +0200
Message-ID: <1405356724-32207-3-git-send-email-robert.jarzmik@free.fr>
References: <1405356724-32207-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1405356724-32207-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: devicetree@vger.kernel.org

Select CLKSRC_OF for PXA architectures.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 arch/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 87b63fd..472dea1 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -644,6 +644,7 @@ config ARCH_PXA
 	select AUTO_ZRELADDR
 	select CLKDEV_LOOKUP
 	select CLKSRC_MMIO
+	select CLKSRC_OF
 	select GENERIC_CLOCKEVENTS
 	select GPIO_PXA
 	select HAVE_IDE
-- 
2.0.0.rc2
