From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 7/8] clocksource/drivers/timer-atmel-tcb: allow selecting first divider
Date: Thu, 10 Oct 2019 00:40:05 +0200
Message-ID: <20191009224006.5021-8-alexandre.belloni@bootlin.com>
References: <20191009224006.5021-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191009224006.5021-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

The divider selection algorithm never allowed to get index 0. It was also
continuing to look for dividers, trying to find the slow clock selection.
This is not necessary anymore.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/clocksource/timer-atmel-tcb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-atmel-tcb.c b/drivers/clocksource/timer-atmel-tcb.c
index 8fcd4d74c54b..ccb77b9cb489 100644
--- a/drivers/clocksource/timer-atmel-tcb.c
+++ b/drivers/clocksource/timer-atmel-tcb.c
@@ -432,10 +432,8 @@ static int __init tcb_clksrc_init(struct device_node *node)
 
 		tmp = rate / divisor;
 		pr_debug("TC: %u / %-3u [%d] --> %u\n", rate, divisor, i, tmp);
-		if (best_divisor_idx > 0) {
-			if (tmp < 5 * 1000 * 1000)
-				continue;
-		}
+		if ((best_divisor_idx >= 0) && (tmp < 5 * 1000 * 1000))
+			break;
 		divided_rate = tmp;
 		best_divisor_idx = i;
 	}
-- 
2.21.0
