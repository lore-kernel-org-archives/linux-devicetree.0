From: Mesih Kilinc <mesihkilinc@gmail.com>
Subject: [RFC PATCH v2 08/14] clocksource/drivers/sun4i: register as sched_clock on suniv
Date: Sun, 18 Nov 2018 17:17:07 +0300
Message-ID: <6f4773bdef8979bff71e958c9ca2c832c68ada0d.1542546735.git.mesihkilinc@gmail.com>
References: <cover.1542546735.git.mesihkilinc@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1542546735.git.mesihkilinc@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
Cc: Mesih Kilinc <mesihkilinc@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Russell King <linux@armlinux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>, Julian Calaby <julian.calaby@gmail.com>
List-Id: devicetree@vger.kernel.org

The suniv chip (newer F-series Allwinner SoCs) is based on ARM926EJ-S
CPU, thus it has no architecture timer.

Register sun4i_timer as sched_clock on it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
---
 drivers/clocksource/sun4i_timer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/sun4i_timer.c b/drivers/clocksource/sun4i_timer.c
index 6b57187..65f38f6 100644
--- a/drivers/clocksource/sun4i_timer.c
+++ b/drivers/clocksource/sun4i_timer.c
@@ -186,7 +186,8 @@ static int __init sun4i_timer_init(struct device_node *node)
 	 */
 	if (of_machine_is_compatible("allwinner,sun4i-a10") ||
 	    of_machine_is_compatible("allwinner,sun5i-a13") ||
-	    of_machine_is_compatible("allwinner,sun5i-a10s"))
+	    of_machine_is_compatible("allwinner,sun5i-a10s") ||
+	    of_machine_is_compatible("allwinner,suniv-f1c100s"))
 		sched_clock_register(sun4i_timer_sched_read, 32,
 				     timer_of_rate(&to));
 
-- 
2.7.4
