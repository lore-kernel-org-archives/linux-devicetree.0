From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 6/6] MAINTAINERS: Add myself as maintainer for Ingenic TCU drivers
Date: Fri, 29 Dec 2017 13:59:42 +0100
Message-ID: <20171229125942.27305-7-paul@crapouillou.net>
References: <20171229125942.27305-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171229125942.27305-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Lee Jones <lee.jones@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Add myself as maintainer for the ingenic-tcu-intc interrupt controller
driver, the ingenic-tcu-clocks clock driver, and the ingenic-tcu
clocksource driver.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a6e86e20761e..1f274bc2bbf7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6908,6 +6908,15 @@ L:	linux-mtd@lists.infradead.org
 S:	Maintained
 F:	drivers/mtd/nand/jz4780_*
 
+INGENIC JZ47xx TCU drivers
+M:	Paul Cercueil <paul@crapouillou.net>
+S:	Maintained
+F:	drivers/clk/ingenic/tcu.c
+F:	drivers/irqchip/irq-ingenic-tcu.c
+F:	drivers/clocksource/timer-ingenic.c
+F:	include/linux/mfd/syscon/ingenic-tcu.h
+F:	include/dt-bindings/clock/ingenic,tcu.h
+
 INOTIFY
 M:	Jan Kara <jack@suse.cz>
 R:	Amir Goldstein <amir73il@gmail.com>
-- 
2.11.0
