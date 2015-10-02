From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH v4 1/3] dt-bindings: add more MediaTek SoC to mtk-timer binding
Date: Fri, 2 Oct 2015 23:05:17 +0800
Message-ID: <1443798319-45744-2-git-send-email-yingjoe.chen@mediatek.com>
References: <1443798319-45744-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443798319-45744-1-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>, srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org, Daniel Kurtz <djkurtz@chromium.org>, linux-clk@vger.kernel.org, Yingjoe Chen <yingjoe.chen@mediatek.com>, erin.lo@mediatek.com
List-Id: devicetree@vger.kernel.org

Add compatible string for mt8127, mt8135 and mt8173 and sort
the list.

Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
---
 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
index 53a3029..64083bc 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
@@ -3,10 +3,12 @@ Mediatek MT6577, MT6572 and MT6589 Timers
 
 Required properties:
 - compatible should contain:
-	* "mediatek,mt6589-timer" for MT6589 compatible timers
 	* "mediatek,mt6580-timer" for MT6580 compatible timers
-	* "mediatek,mt6577-timer" for all compatible timers (MT6589, MT6580,
-		MT6577)
+	* "mediatek,mt6589-timer" for MT6589 compatible timers
+	* "mediatek,mt8127-timer" for MT8127 compatible timers
+	* "mediatek,mt8135-timer" for MT8135 compatible timers
+	* "mediatek,mt8173-timer" for MT8173 compatible timers
+	* "mediatek,mt6577-timer" for MT6577 and all above compatible timers
 - reg: Should contain location and length for timers register.
 - clocks: Clocks driving the timer hardware. This list should include two
 	clocks. The order is system clock and as second clock the RTC clock.
-- 
1.9.1
