From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 6/6] MAINTAINERS: Add myself as maintainer for Ingenic TCU drivers
Date: Mon,  1 Jan 2018 15:33:44 +0100
Message-ID: <20180101143344.2099-6-paul@crapouillou.net>
References: <20171229125942.27305-2-paul@crapouillou.net>
 <20180101143344.2099-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180101143344.2099-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Add myself as maintainer for the ingenic-tcu-intc interrupt controller
driver, the ingenic-tcu-clocks clock driver, and the ingenic-tcu
clocksource driver.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b46c9cea5ae5..f3d03542d076 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6906,6 +6906,15 @@ L:	linux-mtd@lists.infradead.org
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
