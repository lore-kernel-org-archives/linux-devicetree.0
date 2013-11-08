From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH 4/7] clocksource/cadence_ttc: Adjust interval in clock notifier
Date: Fri,  8 Nov 2013 13:21:14 -0800
Message-ID: <1383945677-29674-5-git-send-email-soren.brinkmann@xilinx.com>
References: <1383945677-29674-1-git-send-email-soren.brinkmann@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1383945677-29674-1-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Michal Simek <michal.simek@xilinx.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Soren Brinkmann <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

The clockevent has to be reprogrammed if the timer's input
clock frequency changes and the timer is in periodic mode, in order to
maintain the correct timer interval.

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
 drivers/clocksource/cadence_ttc_timer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clocksource/cadence_ttc_timer.c b/drivers/clocksource/cadence_ttc_timer.c
index a92350b55d32..68a336038d8f 100644
--- a/drivers/clocksource/cadence_ttc_timer.c
+++ b/drivers/clocksource/cadence_ttc_timer.c
@@ -338,6 +338,10 @@ static int ttc_rate_change_clockevent_cb(struct notifier_block *nb,
 		/* update cached frequency */
 		ttc->freq = ndata->new_rate;
 
+		if (ttcce->ce.mode == CLOCK_EVT_MODE_PERIODIC)
+			ttc_set_interval(ttc, DIV_ROUND_CLOSEST(ttc->freq,
+						PRESCALE * HZ));
+
 		/* fall through */
 	}
 	case PRE_RATE_CHANGE:
-- 
1.8.4.2
