From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] clocksource: oxnas: add OX820 compatible
Date: Fri,  9 Sep 2016 15:26:08 +0200
Message-ID: <20160909132608.12605-1-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In order to support the Oxford Semiconductor OX820 SoC, add new
compatible string to rps timer driver.
Also add new string in the dt-bindings.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt | 2 +-
 drivers/clocksource/timer-oxnas-rps.c                        | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt b/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt
index 3ca89cd..d191612 100644
--- a/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt
+++ b/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt
@@ -2,7 +2,7 @@ Oxford Semiconductor OXNAS SoCs Family RPS Timer
 ================================================
 
 Required properties:
-- compatible: Should be "oxsemi,ox810se-rps-timer"
+- compatible: Should be "oxsemi,ox810se-rps-timer" or "oxsemi,ox820-rps-timer"
 - reg : Specifies base physical address and size of the registers.
 - interrupts : The interrupts of the two timers
 - clocks : The phandle of the timer clock source
diff --git a/drivers/clocksource/timer-oxnas-rps.c b/drivers/clocksource/timer-oxnas-rps.c
index bd887e2..d630bf4 100644
--- a/drivers/clocksource/timer-oxnas-rps.c
+++ b/drivers/clocksource/timer-oxnas-rps.c
@@ -295,3 +295,5 @@ err_alloc:
 
 CLOCKSOURCE_OF_DECLARE(ox810se_rps,
 		       "oxsemi,ox810se-rps-timer", oxnas_rps_timer_init);
+CLOCKSOURCE_OF_DECLARE(ox820_rps,
+		       "oxsemi,ox820se-rps-timer", oxnas_rps_timer_init);
-- 
2.7.0
