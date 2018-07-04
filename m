From: Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH v6 1/5] clocksource/drivers/timer-mediatek: Add system timer bindings
Date: Wed, 4 Jul 2018 22:50:16 +0800
Message-ID: <1530715820-3406-2-git-send-email-stanley.chu@mediatek.com>
References: <1530715820-3406-1-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530715820-3406-1-git-send-email-stanley.chu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, Stanley Chu <stanley.chu@mediatek.com>
List-Id: devicetree@vger.kernel.org

This patch fixes bindings of existed "General Purpose Timer",
and then add bindings of new "System Timer" on Mediatek SoCs.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 .../bindings/timer/mediatek,mtk-timer.txt          |   36 ++++++++++++--------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
index b1fe7e9..0f3b8a1 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
@@ -1,19 +1,25 @@
-Mediatek MT6577, MT6572 and MT6589 Timers
----------------------------------------
+Mediatek Timers
+---------------
+
+Mediatek SoCs have two different timers on different platforms,
+- GPT (General Purpose Timer)
+- SYST (System Timer)
+
+The proper timer will be selected automatically by driver.
 
 Required properties:
 - compatible should contain:
-	* "mediatek,mt2701-timer" for MT2701 compatible timers
-	* "mediatek,mt6580-timer" for MT6580 compatible timers
-	* "mediatek,mt6589-timer" for MT6589 compatible timers
-	* "mediatek,mt7623-timer" for MT7623 compatible timers
-	* "mediatek,mt8127-timer" for MT8127 compatible timers
-	* "mediatek,mt8135-timer" for MT8135 compatible timers
-	* "mediatek,mt8173-timer" for MT8173 compatible timers
-	* "mediatek,mt6577-timer" for MT6577 and all above compatible timers
-- reg: Should contain location and length for timers register.
-- clocks: Clocks driving the timer hardware. This list should include two
-	clocks. The order is system clock and as second clock the RTC clock.
+	* "mediatek,mt2701-timer" for MT2701 compatible timers (GPT)
+	* "mediatek,mt6580-timer" for MT6580 compatible timers (GPT)
+	* "mediatek,mt6589-timer" for MT6589 compatible timers (GPT)
+	* "mediatek,mt7623-timer" for MT7623 compatible timers (GPT)
+	* "mediatek,mt8127-timer" for MT8127 compatible timers (GPT)
+	* "mediatek,mt8135-timer" for MT8135 compatible timers (GPT)
+	* "mediatek,mt8173-timer" for MT8173 compatible timers (GPT)
+	* "mediatek,mt6577-timer" for MT6577 and all above compatible timers (GPT)
+	* "mediatek,mt6765-timer" for MT6765 compatible timers (SYST)
+- reg: Should contain location and length for timer register.
+- clocks: Both timers are driven by system clock.
 
 Examples:
 
@@ -21,5 +27,5 @@ Examples:
 		compatible = "mediatek,mt6577-timer";
 		reg = <0x10008000 0x80>;
 		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&system_clk>, <&rtc_clk>;
-	};
+		clocks = <&system_clk>;
+	};
\ No newline at end of file
-- 
1.7.9.5
