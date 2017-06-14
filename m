From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 09/23] clocksource/drivers/fttmr010: Add AST2500 compatible string
Date: Wed, 14 Jun 2017 14:39:30 +0200
Message-ID: <1497443984-12371-9-git-send-email-daniel.lezcano@linaro.org>
References: <20170614123800.GH2261@mai>
 <1497443984-12371-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497443984-12371-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Rob Herring <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Also clean up space-before-tab issues in the documentation.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Joel Stanley <joel@jms.id.au>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 Documentation/devicetree/bindings/timer/faraday,fttmr010.txt | 2 ++
 drivers/clocksource/timer-fttmr010.c                         | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/faraday,fttmr010.txt b/Documentation/devicetree/bindings/timer/faraday,fttmr010.txt
index 6e18bd6..1957922 100644
--- a/Documentation/devicetree/bindings/timer/faraday,fttmr010.txt
+++ b/Documentation/devicetree/bindings/timer/faraday,fttmr010.txt
@@ -10,6 +10,8 @@ Required properties:
   "cortina,gemini-timer", "faraday,fttmr010"
   "moxa,moxart-timer", "faraday,fttmr010"
   "aspeed,ast2400-timer"
+  "aspeed,ast2500-timer"
+
 - reg : Should contain registers location and length
 - interrupts : Should contain the three timer interrupts usually with
   flags for falling edge
diff --git a/drivers/clocksource/timer-fttmr010.c b/drivers/clocksource/timer-fttmr010.c
index f880150..68982ad 100644
--- a/drivers/clocksource/timer-fttmr010.c
+++ b/drivers/clocksource/timer-fttmr010.c
@@ -358,4 +358,5 @@ static int __init fttmr010_timer_init(struct device_node *np)
 CLOCKSOURCE_OF_DECLARE(fttmr010, "faraday,fttmr010", fttmr010_timer_init);
 CLOCKSOURCE_OF_DECLARE(gemini, "cortina,gemini-timer", fttmr010_timer_init);
 CLOCKSOURCE_OF_DECLARE(moxart, "moxa,moxart-timer", fttmr010_timer_init);
-CLOCKSOURCE_OF_DECLARE(aspeed, "aspeed,ast2400-timer", fttmr010_timer_init);
+CLOCKSOURCE_OF_DECLARE(ast2400, "aspeed,ast2400-timer", fttmr010_timer_init);
+CLOCKSOURCE_OF_DECLARE(ast2500, "aspeed,ast2500-timer", fttmr010_timer_init);
-- 
2.7.4
